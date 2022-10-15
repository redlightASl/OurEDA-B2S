#include "BasicCtrl.h"
#include <math.h>

/**
 * @brief 基本的运动控制函数
 * @param  StraightNum      前进控制参数
 * @param  RotateNum        旋转控制参数
 * @param  VerticalNum      垂直控制参数
 * @param  ModeNum          模式 0旋转模式 1侧推模式 2自转模式
 * @return PwmVal_t 推进器控制数据
 * @note 可直接输出给推进器驱动，随时根据硬件调整
 */
PwmVal_t MoveControl(uint16_t StraightNum, uint16_t RotateNum,
		uint16_t VerticalNum, uint8_t ModeNum)
{
	PwmVal_t ThrusterTemp;
	uint8_t AFlag = 0;
	uint8_t BFlag = 0;
	uint8_t CFlag = 0;
	uint8_t DFlag = 0;
	uint8_t SFlag = 0;

#if (NUMBER_OF_VERTICAL_THRUSTER == 2) && (NUMBER_OF_HORIZENTAL_THRUSTER == 4) /* 六轴 */
	switch (ModeNum)
	{
	case NORMAL_MODE:
		//Horizental Control
		AFlag = (RotateNum > StraightNum);
		BFlag = ((RotateNum + StraightNum) > (2 * PWM_MIDDLE_POSITION));
		CFlag = (RotateNum > PWM_MIDDLE_POSITION);
		DFlag = (StraightNum > PWM_MIDDLE_POSITION);
		SFlag = AFlag * 8 + BFlag * 4 + CFlag * 2 + DFlag;
		switch (SFlag)
		{
		case 0:
		case 15:
			ThrusterTemp.HorizontalThruster[0] = (uint32_t) (RotateNum);
			ThrusterTemp.HorizontalThruster[1] = (uint32_t) (RotateNum);
			ThrusterTemp.HorizontalThruster[2] =
					(uint32_t) ((PWM_MIDDLE_POSITION - RotateNum + StraightNum));
			ThrusterTemp.HorizontalThruster[3] =
					(uint32_t) ((PWM_MIDDLE_POSITION - RotateNum + StraightNum));
			break;
		case 7:
		case 8:
			ThrusterTemp.HorizontalThruster[0] = (uint32_t) (StraightNum);
			ThrusterTemp.HorizontalThruster[1] = (uint32_t) (StraightNum);
			ThrusterTemp.HorizontalThruster[2] =
					(uint32_t) ((PWM_MIDDLE_POSITION - RotateNum + StraightNum));
			ThrusterTemp.HorizontalThruster[3] =
					(uint32_t) ((PWM_MIDDLE_POSITION - RotateNum + StraightNum));
			break;
		case 5:
		case 10:
			ThrusterTemp.HorizontalThruster[0] = (uint32_t) ((RotateNum
					+ StraightNum - PWM_MIDDLE_POSITION));
			ThrusterTemp.HorizontalThruster[1] = (uint32_t) ((RotateNum
					+ StraightNum - PWM_MIDDLE_POSITION));
			ThrusterTemp.HorizontalThruster[2] = (uint32_t) (StraightNum);
			ThrusterTemp.HorizontalThruster[3] = (uint32_t) (StraightNum);
			break;
		case 1:
		case 14:
			ThrusterTemp.HorizontalThruster[0] = (uint32_t) ((RotateNum
					+ StraightNum - PWM_MIDDLE_POSITION));
			ThrusterTemp.HorizontalThruster[1] = (uint32_t) ((RotateNum
					+ StraightNum - PWM_MIDDLE_POSITION));
			ThrusterTemp.HorizontalThruster[2] = (uint32_t) (((2
					* PWM_MIDDLE_POSITION) - RotateNum));
			ThrusterTemp.HorizontalThruster[3] = (uint32_t) (((2
					* PWM_MIDDLE_POSITION) - RotateNum));
			break;
		}
		//Veritical Control
		ThrusterTemp.VerticalThruster[0] = (uint32_t) (VerticalNum);
		ThrusterTemp.VerticalThruster[1] = (uint32_t) (VerticalNum);
		break;
	case SIDEPUSH_MODE:
		//Horizental Control
		ThrusterTemp.HorizontalThruster[0] = (uint32_t) ((2
				* PWM_MIDDLE_POSITION) - RotateNum);
		ThrusterTemp.HorizontalThruster[1] = (uint32_t) (RotateNum);
		ThrusterTemp.HorizontalThruster[2] = (uint32_t) ((2
				* PWM_MIDDLE_POSITION) - RotateNum);
		ThrusterTemp.HorizontalThruster[3] = (uint32_t) (RotateNum);
		//Veritical Control
		ThrusterTemp.VerticalThruster[0] = (uint32_t) (VerticalNum);
		ThrusterTemp.VerticalThruster[1] = (uint32_t) (VerticalNum);
		break;
	case PITCH_MODE: //Unavailable in 6axis ROV
		break;
	case ROLL_MODE: //Unavailable in 6axis ROV
		break;
	case MIX_MODE: //Unavailable in 6axis ROV
		break;
	default:
		break;
	}
#else if (NUMBER_OF_VERTICAL_THRUSTER == 4) && (NUMBER_OF_HORIZENTAL_THRUSTER == 4) /* 八轴 */
    switch (ModeNum)
    {
    case NORMAL_MODE:
        //Horizental Control
        AFlag = (RotateNum > StraightNum);
        BFlag = ((RotateNum + StraightNum) > 2 * PWM_MIDDLE_POSITION);
        CFlag = (RotateNum > PWM_MIDDLE_POSITION);
        DFlag = (StraightNum > PWM_MIDDLE_POSITION);
        SFlag = AFlag * 8 + BFlag * 4 + CFlag * 2 + DFlag;
        switch (SFlag)
        {
        case 0:
        case 15:
            ThrusterTemp.HorizontalThruster[0] = (uint32_t)(RotateNum);
            ThrusterTemp.HorizontalThruster[1] = (uint32_t)(RotateNum);
            ThrusterTemp.HorizontalThruster[2] = (uint32_t)((PWM_MIDDLE_POSITION - RotateNum + StraightNum));
            ThrusterTemp.HorizontalThruster[3] = (uint32_t)((PWM_MIDDLE_POSITION - RotateNum + StraightNum));
            break;
        case 7:
        case 8:
            ThrusterTemp.HorizontalThruster[0] = (uint32_t)(StraightNum);
            ThrusterTemp.HorizontalThruster[1] = (uint32_t)(StraightNum);
            ThrusterTemp.HorizontalThruster[2] = (uint32_t)((PWM_MIDDLE_POSITION - RotateNum + StraightNum));
            ThrusterTemp.HorizontalThruster[3] = (uint32_t)((PWM_MIDDLE_POSITION - RotateNum + StraightNum));
            break;
        case 5:
        case 10:
            ThrusterTemp.HorizontalThruster[0] = (uint32_t)((RotateNum + StraightNum - PWM_MIDDLE_POSITION));
            ThrusterTemp.HorizontalThruster[1] = (uint32_t)((RotateNum + StraightNum - PWM_MIDDLE_POSITION));
            ThrusterTemp.HorizontalThruster[2] = (uint32_t)(StraightNum);
            ThrusterTemp.HorizontalThruster[3] = (uint32_t)(StraightNum);
            break;
        case 1:
        case 14:
            ThrusterTemp.HorizontalThruster[0] = (uint32_t)((RotateNum + StraightNum - PWM_MIDDLE_POSITION));
            ThrusterTemp.HorizontalThruster[1] = (uint32_t)((RotateNum + StraightNum - PWM_MIDDLE_POSITION));
            ThrusterTemp.HorizontalThruster[2] = (uint32_t)(((2 * PWM_MIDDLE_POSITION) - RotateNum));
            ThrusterTemp.HorizontalThruster[3] = (uint32_t)(((2 * PWM_MIDDLE_POSITION) - RotateNum));
            break;
        }
        //Veritical Control
        ThrusterTemp.VerticalThruster[0] = (uint32_t)(VerticalNum);
        ThrusterTemp.VerticalThruster[1] = (uint32_t)(VerticalNum);
        ThrusterTemp.VerticalThruster[2] = (uint32_t)(VerticalNum);
        ThrusterTemp.VerticalThruster[3] = (uint32_t)(VerticalNum);
        break;
    case SIDEPUSH_MODE:
        //Horizental Control
        ThrusterTemp.HorizontalThruster[0] = (uint32_t)((2 * PWM_MIDDLE_POSITION) - RotateNum);
        ThrusterTemp.HorizontalThruster[1] = (uint32_t)(RotateNum);
        ThrusterTemp.HorizontalThruster[2] = (uint32_t)((2 * PWM_MIDDLE_POSITION) - RotateNum);
        ThrusterTemp.HorizontalThruster[3] = (uint32_t)(RotateNum);
        //Veritical Control
        ThrusterTemp.VerticalThruster[0] = (uint32_t)(VerticalNum);
        ThrusterTemp.VerticalThruster[1] = (uint32_t)(VerticalNum);
        ThrusterTemp.VerticalThruster[2] = (uint32_t)(VerticalNum);
        ThrusterTemp.VerticalThruster[3] = (uint32_t)(VerticalNum);
        break;
    case PITCH_MODE:
        //Horizental Control
        AFlag = (RotateNum > StraightNum);
        BFlag = ((RotateNum + StraightNum) > 2 * PWM_MIDDLE_POSITION);
        CFlag = (RotateNum > PWM_MIDDLE_POSITION);
        DFlag = (StraightNum > PWM_MIDDLE_POSITION);
        SFlag = AFlag * 8 + BFlag * 4 + CFlag * 2 + DFlag;
        switch (SFlag)
        {
        case 0:
        case 15:
            ThrusterTemp.HorizontalThruster[0] = (uint32_t)(RotateNum);
            ThrusterTemp.HorizontalThruster[1] = (uint32_t)(RotateNum);
            ThrusterTemp.HorizontalThruster[2] = (uint32_t)((PWM_MIDDLE_POSITION - RotateNum + StraightNum));
            ThrusterTemp.HorizontalThruster[3] = (uint32_t)((PWM_MIDDLE_POSITION - RotateNum + StraightNum));
            break;
        case 7:
        case 8:
            ThrusterTemp.HorizontalThruster[0] = (uint32_t)(StraightNum);
            ThrusterTemp.HorizontalThruster[1] = (uint32_t)(StraightNum);
            ThrusterTemp.HorizontalThruster[2] = (uint32_t)((PWM_MIDDLE_POSITION - RotateNum + StraightNum));
            ThrusterTemp.HorizontalThruster[3] = (uint32_t)((PWM_MIDDLE_POSITION - RotateNum + StraightNum));
            break;
        case 5:
        case 10:
            ThrusterTemp.HorizontalThruster[0] = (uint32_t)((RotateNum + StraightNum - PWM_MIDDLE_POSITION));
            ThrusterTemp.HorizontalThruster[1] = (uint32_t)((RotateNum + StraightNum - PWM_MIDDLE_POSITION));
            ThrusterTemp.HorizontalThruster[2] = (uint32_t)(StraightNum);
            ThrusterTemp.HorizontalThruster[3] = (uint32_t)(StraightNum);
            break;
        case 1:
        case 14:
            ThrusterTemp.HorizontalThruster[0] = (uint32_t)((RotateNum + StraightNum - PWM_MIDDLE_POSITION));
            ThrusterTemp.HorizontalThruster[1] = (uint32_t)((RotateNum + StraightNum - PWM_MIDDLE_POSITION));
            ThrusterTemp.HorizontalThruster[2] = (uint32_t)(((2 * PWM_MIDDLE_POSITION) - RotateNum));
            ThrusterTemp.HorizontalThruster[3] = (uint32_t)(((2 * PWM_MIDDLE_POSITION) - RotateNum));
            break;
        }
        //Veritical Control
        ThrusterTemp.VerticalThruster[0] = (uint32_t)(VerticalNum);
        ThrusterTemp.VerticalThruster[1] = (uint32_t)((2 * PWM_MIDDLE_POSITION) - VerticalNum);
        ThrusterTemp.VerticalThruster[2] = (uint32_t)(VerticalNum);
        ThrusterTemp.VerticalThruster[3] = (uint32_t)((2 * PWM_MIDDLE_POSITION) - VerticalNum);
        break;
    case ROLL_MODE:
        //Horizental Control
        AFlag = (RotateNum > StraightNum);
        BFlag = ((RotateNum + StraightNum) > 2 * PWM_MIDDLE_POSITION);
        CFlag = (RotateNum > PWM_MIDDLE_POSITION);
        DFlag = (StraightNum > PWM_MIDDLE_POSITION);
        SFlag = AFlag * 8 + BFlag * 4 + CFlag * 2 + DFlag;
        switch (SFlag)
        {
        case 0:
        case 15:
            ThrusterTemp.HorizontalThruster[0] = (uint32_t)(RotateNum);
            ThrusterTemp.HorizontalThruster[1] = (uint32_t)(RotateNum);
            ThrusterTemp.HorizontalThruster[2] = (uint32_t)((PWM_MIDDLE_POSITION - RotateNum + StraightNum));
            ThrusterTemp.HorizontalThruster[3] = (uint32_t)((PWM_MIDDLE_POSITION - RotateNum + StraightNum));
            break;
        case 7:
        case 8:
            ThrusterTemp.HorizontalThruster[0] = (uint32_t)(StraightNum);
            ThrusterTemp.HorizontalThruster[1] = (uint32_t)(StraightNum);
            ThrusterTemp.HorizontalThruster[2] = (uint32_t)((PWM_MIDDLE_POSITION - RotateNum + StraightNum));
            ThrusterTemp.HorizontalThruster[3] = (uint32_t)((PWM_MIDDLE_POSITION - RotateNum + StraightNum));
            break;
        case 5:
        case 10:
            ThrusterTemp.HorizontalThruster[0] = (uint32_t)((RotateNum + StraightNum - PWM_MIDDLE_POSITION));
            ThrusterTemp.HorizontalThruster[1] = (uint32_t)((RotateNum + StraightNum - PWM_MIDDLE_POSITION));
            ThrusterTemp.HorizontalThruster[2] = (uint32_t)(StraightNum);
            ThrusterTemp.HorizontalThruster[3] = (uint32_t)(StraightNum);
            break;
        case 1:
        case 14:
            ThrusterTemp.HorizontalThruster[0] = (uint32_t)((RotateNum + StraightNum - PWM_MIDDLE_POSITION));
            ThrusterTemp.HorizontalThruster[1] = (uint32_t)((RotateNum + StraightNum - PWM_MIDDLE_POSITION));
            ThrusterTemp.HorizontalThruster[2] = (uint32_t)(((2 * PWM_MIDDLE_POSITION) - RotateNum));
            ThrusterTemp.HorizontalThruster[3] = (uint32_t)(((2 * PWM_MIDDLE_POSITION) - RotateNum));
            break;
        }
        //Veritical Control
        ThrusterTemp.VerticalThruster[0] = (uint32_t)(VerticalNum);
        ThrusterTemp.VerticalThruster[1] = (uint32_t)(VerticalNum);
        ThrusterTemp.VerticalThruster[2] = (uint32_t)((2 * PWM_MIDDLE_POSITION) - VerticalNum);
        ThrusterTemp.VerticalThruster[3] = (uint32_t)((2 * PWM_MIDDLE_POSITION) - VerticalNum);
        break;
    case MIX_MODE:
        //Horizental Control
        ThrusterTemp.HorizontalThruster[0] = PWM_MIDDLE_POSITION;
        ThrusterTemp.HorizontalThruster[1] = PWM_MIDDLE_POSITION;
        ThrusterTemp.HorizontalThruster[2] = PWM_MIDDLE_POSITION;
        ThrusterTemp.HorizontalThruster[3] = PWM_MIDDLE_POSITION;
        //Veritical Control
        AFlag = (RotateNum > StraightNum);
        BFlag = ((RotateNum + StraightNum) > (2 * PWM_MIDDLE_POSITION));
        CFlag = (RotateNum > PWM_MIDDLE_POSITION);
        DFlag = (StraightNum > PWM_MIDDLE_POSITION);
        SFlag = AFlag * 8 + BFlag * 4 + CFlag * 2 + DFlag;
        switch (SFlag)
        {
        case 0:
        case 15:
            ThrusterTemp.VerticalThruster[0] = (uint32_t)(RotateNum);
            ThrusterTemp.VerticalThruster[1] = (uint32_t)(RotateNum);
            ThrusterTemp.VerticalThruster[2] = (uint32_t)(PWM_MIDDLE_POSITION - RotateNum + StraightNum);
            ThrusterTemp.VerticalThruster[3] = (uint32_t)(PWM_MIDDLE_POSITION - RotateNum + StraightNum);
            break;
        case 7:
        case 8:
            ThrusterTemp.VerticalThruster[0] = (uint32_t)(StraightNum);
            ThrusterTemp.VerticalThruster[1] = (uint32_t)(StraightNum);
            ThrusterTemp.VerticalThruster[2] = (uint32_t)(PWM_MIDDLE_POSITION - RotateNum + StraightNum);
            ThrusterTemp.VerticalThruster[3] = (uint32_t)(PWM_MIDDLE_POSITION - RotateNum + StraightNum);
            break;
        case 5:
        case 10:
            ThrusterTemp.VerticalThruster[0] = (uint32_t)(RotateNum + StraightNum - PWM_MIDDLE_POSITION);
            ThrusterTemp.VerticalThruster[1] = (uint32_t)(RotateNum + StraightNum - PWM_MIDDLE_POSITION);
            ThrusterTemp.VerticalThruster[2] = (uint32_t)(StraightNum);
            ThrusterTemp.VerticalThruster[3] = (uint32_t)(StraightNum);
            break;
        case 1:
        case 14:
            ThrusterTemp.VerticalThruster[0] = (uint32_t)(RotateNum + StraightNum - PWM_MIDDLE_POSITION);
            ThrusterTemp.VerticalThruster[1] = (uint32_t)(RotateNum + StraightNum - PWM_MIDDLE_POSITION);
            ThrusterTemp.VerticalThruster[2] = (uint32_t)((2 * PWM_MIDDLE_POSITION) - RotateNum);
            ThrusterTemp.VerticalThruster[3] = (uint32_t)((2 * PWM_MIDDLE_POSITION) - RotateNum);
            break;
        }
        break;
    default:
        break;
    }
#endif
	return ThrusterTemp;
}

//void SendData2Upside(ReportData_t SendData)
//{
//    ReportSend[0] = 0x25;
//    ReportSend[1] = ((SendData.CabinFunction) | (SendData.WaterDetect));
//    ReportSend[2] = SendData.CabinTemperature & 0x00FF;
//    ReportSend[3] = (SendData.CabinTemperature & 0xFF00) >> 8;
//    ReportSend[4] = SendData.CabinBarometric & 0x000000FF;
//    ReportSend[5] = (SendData.CabinBarometric & 0x0000FF00) >> 8;
//    ReportSend[6] = (SendData.CabinBarometric & 0x00FF0000) >> 16;
//    ReportSend[7] = (SendData.CabinBarometric & 0xFF000000) >> 24;
//    ReportSend[8] = SendData.CabinHumidity;
//    ReportSend[9] = SendData.CabinHumidity >> 8;
//    ReportSend[10] = SendData.AccNum[0] & 0x00FF;
//    ReportSend[11] = (SendData.AccNum[0] & 0xFF00) >> 8;
//    ReportSend[12] = SendData.AccNum[1] & 0x00FF;
//    ReportSend[13] = (SendData.AccNum[1] & 0xFF00) >> 8;
//    ReportSend[14] = SendData.AccNum[2] & 0x00FF;
//    ReportSend[15] = (SendData.AccNum[2] & 0xFF00) >> 8;
//    ReportSend[16] = SendData.RotNum[0] & 0x00FF;
//    ReportSend[17] = (SendData.RotNum[0] & 0xFF00) >> 8;
//    ReportSend[18] = SendData.RotNum[1] & 0x00FF;
//    ReportSend[19] = (SendData.RotNum[1] & 0xFF00) >> 8;
//    ReportSend[20] = SendData.RotNum[2] & 0x00FF;
//    ReportSend[21] = (SendData.RotNum[2] & 0xFF00) >> 8;
//    ReportSend[22] = SendData.EulNum[0] & 0x00FF;
//    ReportSend[23] = (SendData.EulNum[0] & 0xFF00) >> 8;
//    ReportSend[24] = SendData.EulNum[1] & 0x00FF;
//    ReportSend[25] = (SendData.EulNum[1] & 0xFF00) >> 8;
//    ReportSend[26] = SendData.EulNum[2] & 0x00FF;
//    ReportSend[27] = (SendData.EulNum[2] & 0xFF00) >> 8;
//    ReportSend[28] = SendData.MagNum[0] & 0x00FF;
//    ReportSend[29] = (SendData.MagNum[0] & 0xFF00) >> 8;
//    ReportSend[30] = SendData.MagNum[0] & 0x00FF;
//    ReportSend[31] = (SendData.MagNum[0] & 0xFF00) >> 8;
//    ReportSend[32] = SendData.MagNum[0] & 0x00FF;
//    ReportSend[33] = (SendData.MagNum[0] & 0xFF00) >> 8;
//    ReportSend[34] = SendData.SonarDepth & 0x000000FF;
//    ReportSend[35] = (SendData.SonarDepth & 0x0000FF00) >> 8;
//    ReportSend[36] = (SendData.SonarDepth & 0x00FF0000) >> 16;
//    ReportSend[37] = (SendData.SonarDepth & 0xFF000000) >> 24;
//    ReportSend[38] = SendData.SonarConfidence & 0x00FF;
//    ReportSend[39] = (SendData.SonarConfidence & 0xFF00) >> 8;
//    ReportSend[40] = SendData.WaterTemperature & 0x00FF;
//    ReportSend[41] = (SendData.WaterTemperature & 0xFF00) >> 8;
//    ReportSend[42] = SendData.WaterDepth & 0x00FF;
//    ReportSend[43] = (SendData.WaterDepth & 0xFF00) >> 8;
//    ReportSend[44] = 0x00;
//    ReportSend[45] = 0xFF;
//    ReportSend[46] = 0xFF;
//
//    HAL_UART_Transmit_DMA(&Master_UART, ReportSend, Master_UART_TXLen);
//}

ControlData_t CaptureControlData(uint8_t *CommandReceive)
{
	ControlData_t CaptureData;

	for (uint8_t i = 0; i < Master_UART_RXLen * 2; i++)
	{
		if ((CommandReceive[i] == 0x25) && (CommandReceive[i + 29] == 0x21)
				&& (CommandReceive[i + 28] == 0x00))
		{
			CaptureData.FrameHead = (CommandReceive[i]);
			CaptureData.StraightNum = ((CommandReceive[i + 1] << 8)
					| CommandReceive[i + 2]);
			CaptureData.RotateNum = ((CommandReceive[i + 3] << 8)
					| CommandReceive[i + 4]);
			CaptureData.VerticalNum = ((CommandReceive[i + 5] << 8)
					| CommandReceive[i + 6]);
			CaptureData.LightNum = ((CommandReceive[i + 7] << 8)
					| CommandReceive[i + 8]);
			CaptureData.PanNum = ((CommandReceive[i + 9] << 8)
					| CommandReceive[i + 10]);
			CaptureData.ConveyNum = ((CommandReceive[i + 11] << 8)
					| CommandReceive[i + 12]);

			CaptureData.ArmNum[0] = ((CommandReceive[i + 13] << 8)
					| CommandReceive[i + 14]);
			CaptureData.ArmNum[1] = ((CommandReceive[i + 15] << 8)
					| CommandReceive[i + 16]);
			CaptureData.ArmNum[2] = ((CommandReceive[i + 17] << 8)
					| CommandReceive[i + 18]);
			CaptureData.ArmNum[3] = ((CommandReceive[i + 19] << 8)
					| CommandReceive[i + 20]);
			CaptureData.ArmNum[4] = ((CommandReceive[i + 21] << 8)
					| CommandReceive[i + 22]);
			CaptureData.ArmNum[5] = ((CommandReceive[i + 23] << 8)
					| CommandReceive[i + 24]);
			CaptureData.RestNum = ((CommandReceive[i + 25] << 8)
					| CommandReceive[i + 26]);
			CaptureData.Mode = CommandReceive[i + 27];
			CaptureData.IdTest = CommandReceive[i + 28];
			CaptureData.FrameEnd = (CommandReceive[i + 29]);
		}
	}

	return CaptureData;
}
