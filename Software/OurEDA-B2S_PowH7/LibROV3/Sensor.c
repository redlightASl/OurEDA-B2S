#include "Sensor.h"

//__attribute__(section(".RAM_D1")) uint8_t WT931Receive[AXIS_UART_RXLen] = { 0 };
//__attribute__(section(".RAM_D1")) uint8_t GY39Send[TEMPER_UART_TXLen] = { 0 };
//__attribute__(section(".RAM_D1")) uint8_t GY39Receive[TEMPER_UART_RXLen] = { 0 };

#if defined (USING_GP30_SENSOR)

void InitP30(void)
{
	//42 52 02 00 78 05 00 00 BB 04 D2 01
	P30Send[0] = 0x42;
	P30Send[1] = 0x52;
	P30Send[2] = 0x02;
	P30Send[3] = 0x00;
	P30Send[4] = 0x05;
	P30Send[5] = 0x00;
	P30Send[6] = 0x00;
	P30Send[7] = 0x00;
	P30Send[8] = 0xBB;
	P30Send[9] = 0x04;
	P30Send[10] = 0xD2;
	P30Send[11] = 0x01;

	HAL_UART_Transmit_DMA(&GP30_UART, P30Send, P30_UART_TXLen);
}

/**
 * @brief 接收声呐传感器数据
 * @return P30Data 声呐传感器数据结构体
 */
P30Data ReceiveP30(void)
{
	P30Data RevP30;

	uint8_t FrameState = 0;
	uint8_t Bytenum = 0;
	uint8_t CheckSum = 0;
	uint8_t datahex[11];

	for (uint8_t i = 0; i < 33; i++)
	{
		if (FrameState == 0)
		{
			if ((P30Receive[i] == 0x42) && (Bytenum == 0))
			{
				CheckSum = P30Receive[i];
				Bytenum = 1;
				continue;
			}
			else if ((P30Receive[i] == 0x52) && (Bytenum == 1))
			{
				CheckSum += P30Receive[i];
				Bytenum = 2;
				FrameState = 1;
				continue;
			}
		}
		else if (FrameState == 1)
		{
			if (Bytenum < 13)
			{
				datahex[Bytenum - 2] = P30Receive[i];
				CheckSum += P30Receive[i];
				Bytenum++;
			}
			else
			{
				if (P30Receive[i] == (CheckSum & 0xFF))
				{
					RevP30.Confidence = (datahex[10] << 8) | (datahex[11]);
					RevP30.DepthToBottom = (((datahex[6] << 24)
						| (datahex[7] << 16) | (datahex[8] << 8)
						| (datahex[9])) / 1000);
				}
				CheckSum = 0;
				Bytenum = 0;
				FrameState = 0;
			}
		}
	}

	__HAL_UART_ENABLE_IT(&GP30_UART, UART_IT_IDLE);
	HAL_UART_Receive_DMA(&GP30_UART, P30Receive, P30_UART_RXLen);

	return RevP30;
}

#endif

#ifdef USING_GY39_SENSOR
void InitGY39(uint8_t *GY39Send)
{
	*(GY39Send + 0) = 0xA5;
	*(GY39Send + 1) = 0x82;
	*(GY39Send + 2) = 0x27;
}

CarbinData_t ReceiveGY39(uint8_t *GY39Receive)
{
	CarbinData_t RecvGY39;
	if ((GY39Receive[0] == 0x5A) && (GY39Receive[1] == 0x5A)
			&& (GY39Receive[2] == 0x45))
	{
		RecvGY39.CarbinTemperature = ((GY39Receive[4] << 8) | GY39Receive[5]);
		RecvGY39.CarbinBarometric = ((GY39Receive[6] << 24)
				| (GY39Receive[7] << 16) | (GY39Receive[8] << 8)
				| GY39Receive[9]);
		RecvGY39.CarbinHumidity = ((GY39Receive[10] << 8) | GY39Receive[11]);
		RecvGY39.CarbinIllumination = 0x0000;
	}

	return RecvGY39;
}
#endif

#ifdef USING_WT931_SENSOR
IMUData_t ReceiveWT931(uint8_t *WT931Receive)
{
	IMUData_t RecvWT931;

	for (uint8_t i = 0; i < AXIS_UART_RXLen; i++)
	{
		if(i > AXIS_UART_RXLen - 11)
		{
			break;
		}

		if (WT931Receive[i] == 0x55)
		{
			switch (WT931Receive[i + 1])
			{
			case 0x51:
				RecvWT931.Acceleration[0] = (WT931Receive[i + 2]
						| (WT931Receive[i + 3] << 8));
				RecvWT931.Acceleration[1] = (WT931Receive[i + 4]
						| (WT931Receive[i + 5] << 8));
				RecvWT931.Acceleration[2] = (WT931Receive[i + 6]
						| (WT931Receive[i + 7] << 8));
				break;
			case 0x52:
				RecvWT931.AngularSpeed[0] = (WT931Receive[i + 2]
						| (WT931Receive[i + 3] << 8));
				RecvWT931.AngularSpeed[1] = (WT931Receive[i + 4]
						| (WT931Receive[i + 5] << 8));
				RecvWT931.AngularSpeed[2] = (WT931Receive[i + 6]
						| (WT931Receive[i + 7] << 8));
				break;
			case 0x53:
				RecvWT931.EulerAngle[0] = (WT931Receive[i + 2]
						| (WT931Receive[i + 3] << 8));
				RecvWT931.EulerAngle[1] = (WT931Receive[i + 4]
						| (WT931Receive[i + 5] << 8));
				RecvWT931.EulerAngle[2] = (WT931Receive[i + 6]
						| (WT931Receive[i + 7] << 8));
				break;
			case 0x54:
				RecvWT931.MagneticValue[0] = (WT931Receive[i + 2]
						| (WT931Receive[i + 3] << 8));
				RecvWT931.MagneticValue[1] = (WT931Receive[i + 4]
						| (WT931Receive[i + 5] << 8));
				RecvWT931.MagneticValue[2] = (WT931Receive[i + 6]
						| (WT931Receive[i + 7] << 8));
				break;
			default:
				continue;
				break;
			}
		}
		else
		{
			continue;
		}
	}

	return RecvWT931;
}
#endif
