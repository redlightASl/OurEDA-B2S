#include "BasicCtrl.h"
#include <math.h>


void MoveControl(PwmVal_t* ThrusterTemp, uint16_t StraightNum, uint16_t RotateNum,
		uint16_t VerticalNum, uint8_t ModeNum)
{
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
			ThrusterTemp->HorizontalThruster[0] = (uint32_t) (RotateNum);
			ThrusterTemp->HorizontalThruster[1] = (uint32_t) (RotateNum);
			ThrusterTemp->HorizontalThruster[2] =
					(uint32_t) ((PWM_MIDDLE_POSITION - RotateNum + StraightNum));
			ThrusterTemp->HorizontalThruster[3] =
					(uint32_t) ((PWM_MIDDLE_POSITION - RotateNum + StraightNum));
			break;
		case 7:
		case 8:
			ThrusterTemp->HorizontalThruster[0] = (uint32_t) (StraightNum);
			ThrusterTemp->HorizontalThruster[1] = (uint32_t) (StraightNum);
			ThrusterTemp->HorizontalThruster[2] =
					(uint32_t) ((PWM_MIDDLE_POSITION - RotateNum + StraightNum));
			ThrusterTemp->HorizontalThruster[3] =
					(uint32_t) ((PWM_MIDDLE_POSITION - RotateNum + StraightNum));
			break;
		case 5:
		case 10:
			ThrusterTemp->HorizontalThruster[0] = (uint32_t) ((RotateNum
					+ StraightNum - PWM_MIDDLE_POSITION));
			ThrusterTemp->HorizontalThruster[1] = (uint32_t) ((RotateNum
					+ StraightNum - PWM_MIDDLE_POSITION));
			ThrusterTemp->HorizontalThruster[2] = (uint32_t) (StraightNum);
			ThrusterTemp->HorizontalThruster[3] = (uint32_t) (StraightNum);
			break;
		case 1:
		case 14:
			ThrusterTemp->HorizontalThruster[0] = (uint32_t) ((RotateNum
					+ StraightNum - PWM_MIDDLE_POSITION));
			ThrusterTemp->HorizontalThruster[1] = (uint32_t) ((RotateNum
					+ StraightNum - PWM_MIDDLE_POSITION));
			ThrusterTemp->HorizontalThruster[2] = (uint32_t) (((2
					* PWM_MIDDLE_POSITION) - RotateNum));
			ThrusterTemp->HorizontalThruster[3] = (uint32_t) (((2
					* PWM_MIDDLE_POSITION) - RotateNum));
			break;
		}
		//Veritical Control
		ThrusterTemp->VerticalThruster[0] = (uint32_t) (VerticalNum);
		ThrusterTemp->VerticalThruster[1] = (uint32_t) (VerticalNum);
		break;
	case SIDEPUSH_MODE:
		//Horizental Control
		ThrusterTemp->HorizontalThruster[0] = (uint32_t) ((2
				* PWM_MIDDLE_POSITION) - RotateNum);
		ThrusterTemp->HorizontalThruster[1] = (uint32_t) (RotateNum);
		ThrusterTemp->HorizontalThruster[2] = (uint32_t) ((2
				* PWM_MIDDLE_POSITION) - RotateNum);
		ThrusterTemp->HorizontalThruster[3] = (uint32_t) (RotateNum);
		//Veritical Control
		ThrusterTemp->VerticalThruster[0] = (uint32_t) (VerticalNum);
		ThrusterTemp->VerticalThruster[1] = (uint32_t) (VerticalNum);
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
}

void ControlDataAnalysis(ControlData_t controller, PwmVal_t* temp_pwm, uint8_t ModeNum)
{
	MoveControl(temp_pwm, controller.StraightNum, controller.RotateNum,
			controller.VerticalNum, ModeNum);

	temp_pwm->LightServo = controller.LightNum; //light
	temp_pwm->PanServo = controller.PanNum; //pan
	temp_pwm->ConveyServo = controller.ConveyNum; //convey
	temp_pwm->ArmServo[0] = controller.ArmNum[0]; //Horizental
	temp_pwm->ArmServo[1] = controller.ArmNum[1]; //Main
	temp_pwm->ArmServo[2] = controller.ArmNum[2]; //Middle
	temp_pwm->ArmServo[3] = controller.ArmNum[3]; //Front
	temp_pwm->ArmServo[4] = controller.ArmNum[4]; //Grab
	temp_pwm->ArmServo[5] = controller.ArmNum[5]; //rest machine arm
	temp_pwm->RestServo = controller.RestNum; //rest pwm
}

void CaptureReportData(ReportData_t SendData, uint8_t *ReportTransmit)
{
	ReportTransmit[0] = (uint8_t) (SendData.FrameHead);
	ReportTransmit[1] = (uint8_t) ((SendData.CabinFunction)
			| (SendData.WaterDetect << 1));
	ReportTransmit[2] = (uint8_t) ((SendData.CabinTemperature & 0xFF00) >> 8);
	ReportTransmit[3] = (uint8_t) (SendData.CabinTemperature & 0x00FF);
	ReportTransmit[4] =
			(uint8_t) ((SendData.CabinBarometric & 0xFF000000) >> 24);
	ReportTransmit[5] =
			(uint8_t) ((SendData.CabinBarometric & 0x00FF0000) >> 16);
	ReportTransmit[6] =
			(uint8_t) ((SendData.CabinBarometric & 0x0000FF00) >> 8);
	ReportTransmit[7] = (uint8_t) (SendData.CabinBarometric & 0x000000FF);
	ReportTransmit[8] = (uint8_t) ((SendData.CabinHumidity & 0xFF00) >> 8);
	ReportTransmit[9] = (uint8_t) (SendData.CabinHumidity & 0x00FF);
	ReportTransmit[10] = (uint8_t) ((SendData.AccNum[0] & 0xFF00) >> 8);
	ReportTransmit[11] = (uint8_t) (SendData.AccNum[0] & 0x00FF);
	ReportTransmit[12] = (uint8_t) ((SendData.AccNum[1] & 0xFF00) >> 8);
	ReportTransmit[13] = (uint8_t) (SendData.AccNum[1] & 0x00FF);
	ReportTransmit[14] = (uint8_t) ((SendData.AccNum[2] & 0xFF00) >> 8);
	ReportTransmit[15] = (uint8_t) (SendData.AccNum[2] & 0x00FF);
	ReportTransmit[16] = (uint8_t) ((SendData.RotNum[0] & 0xFF00) >> 8);
	ReportTransmit[17] = (uint8_t) (SendData.RotNum[0] & 0x00FF);
	ReportTransmit[18] = (uint8_t) ((SendData.RotNum[1] & 0xFF00) >> 8);
	ReportTransmit[19] = (uint8_t) (SendData.RotNum[1] & 0x00FF);
	ReportTransmit[20] = (uint8_t) ((SendData.RotNum[2] & 0xFF00) >> 8);
	ReportTransmit[21] = (uint8_t) (SendData.RotNum[2] & 0x00FF);
	ReportTransmit[22] = (uint8_t) ((SendData.EulNum[0] & 0xFF00) >> 8);
	ReportTransmit[23] = (uint8_t) (SendData.EulNum[0] & 0x00FF);
	ReportTransmit[24] = (uint8_t) ((SendData.EulNum[1] & 0xFF00) >> 8);
	ReportTransmit[25] = (uint8_t) (SendData.EulNum[1] & 0x00FF);
	ReportTransmit[26] = (uint8_t) ((SendData.EulNum[2] & 0xFF00) >> 8);
	ReportTransmit[27] = (uint8_t) (SendData.EulNum[2] & 0x00FF);
	ReportTransmit[28] = (uint8_t) ((SendData.MagNum[0] & 0xFF00) >> 8);
	ReportTransmit[29] = (uint8_t) (SendData.MagNum[0] & 0x00FF);
	ReportTransmit[30] = (uint8_t) ((SendData.MagNum[0] & 0xFF00) >> 8);
	ReportTransmit[31] = (uint8_t) (SendData.MagNum[0] & 0x00FF);
	ReportTransmit[32] = (uint8_t) ((SendData.MagNum[0] & 0xFF00) >> 8);
	ReportTransmit[33] = (uint8_t) (SendData.MagNum[0] & 0x00FF);
//	ReportTransmit[34] = (uint8_t) (SendData.SonarDepth & 0x000000FF);
//	ReportTransmit[35] = (uint8_t) ((SendData.SonarDepth & 0x0000FF00) >> 8);
//	ReportTransmit[36] = (uint8_t) ((SendData.SonarDepth & 0x00FF0000) >> 16);
//	ReportTransmit[37] = (uint8_t) ((SendData.SonarDepth & 0xFF000000) >> 24);
//	ReportTransmit[38] = (uint8_t) (SendData.SonarConfidence & 0x00FF);
//	ReportTransmit[39] = (uint8_t) ((SendData.SonarConfidence & 0xFF00) >> 8);
//	ReportTransmit[40] = (uint8_t) (SendData.WaterTemperature & 0x00FF);
//	ReportTransmit[41] = (uint8_t) ((SendData.WaterTemperature & 0xFF00) >> 8);
//	ReportTransmit[42] = (uint8_t) (SendData.WaterDepth & 0x00FF);
//	ReportTransmit[43] = (uint8_t) ((SendData.WaterDepth & 0xFF00) >> 8);
	ReportTransmit[34] = 0x00;
	ReportTransmit[35] = 0x00;
	ReportTransmit[36] = 0x00;
	ReportTransmit[37] = 0x00;
	ReportTransmit[38] = 0x00;
	ReportTransmit[39] = 0x00;
	ReportTransmit[40] = 0x00;
	ReportTransmit[41] = 0x00;
	ReportTransmit[42] = 0x00;
	ReportTransmit[43] = 0x00;
	ReportTransmit[44] = (uint8_t) 0x00;
	ReportTransmit[45] = (uint8_t) ((SendData.FrameEnd & 0xFF00) >> 8);
	ReportTransmit[46] = (uint8_t) (SendData.FrameEnd & 0x00FF);
}

//ControlData_t CaptureControlData(uint8_t *CommandReceive)
//{
//	ControlData_t CaptureData;
//
//	for (uint8_t i = 0; i < Master_UART_RXLen; i++)
//	{
//		if ((CommandReceive[i] == 0x25) && (CommandReceive[i + 29] == 0x21)
//				&& (CommandReceive[i + 28] == 0x00))
//		{
//			CaptureData.FrameHead = (CommandReceive[i]);
//			CaptureData.StraightNum = ((CommandReceive[i + 1] << 8)
//					| CommandReceive[i + 2]);
//			CaptureData.RotateNum = ((CommandReceive[i + 3] << 8)
//					| CommandReceive[i + 4]);
//			CaptureData.VerticalNum = ((CommandReceive[i + 5] << 8)
//					| CommandReceive[i + 6]);
//			CaptureData.LightNum = ((CommandReceive[i + 7] << 8)
//					| CommandReceive[i + 8]);
//			CaptureData.PanNum = ((CommandReceive[i + 9] << 8)
//					| CommandReceive[i + 10]);
//			CaptureData.ConveyNum = ((CommandReceive[i + 11] << 8)
//					| CommandReceive[i + 12]);
//
//			CaptureData.ArmNum[0] = ((CommandReceive[i + 13] << 8)
//					| CommandReceive[i + 14]);
//			CaptureData.ArmNum[1] = ((CommandReceive[i + 15] << 8)
//					| CommandReceive[i + 16]);
//			CaptureData.ArmNum[2] = ((CommandReceive[i + 17] << 8)
//					| CommandReceive[i + 18]);
//			CaptureData.ArmNum[3] = ((CommandReceive[i + 19] << 8)
//					| CommandReceive[i + 20]);
//			CaptureData.ArmNum[4] = ((CommandReceive[i + 21] << 8)
//					| CommandReceive[i + 22]);
//			CaptureData.ArmNum[5] = ((CommandReceive[i + 23] << 8)
//					| CommandReceive[i + 24]);
//			CaptureData.RestNum = ((CommandReceive[i + 25] << 8)
//					| CommandReceive[i + 26]);
//			CaptureData.Mode = CommandReceive[i + 27];
//			CaptureData.IdTest = CommandReceive[i + 28];
//			CaptureData.FrameEnd = (CommandReceive[i + 29]);
//		}
//		else
//		{
//			continue;
//		}
//	}
//
//	return CaptureData;
//}

void CaptureControlData(ControlData_t* CaptureData, uint8_t *CommandReceive)
{
	for (uint8_t i = 0; i < Master_UART_RXLen; i++)
	{
		if ((CommandReceive[i] == 0x25) && (CommandReceive[i + 29] == 0x21)
				&& (CommandReceive[i + 28] == 0x00))
		{
			CaptureData->FrameHead = (CommandReceive[i]);
			CaptureData->StraightNum = ((CommandReceive[i + 1] << 8)
					| CommandReceive[i + 2]);
			CaptureData->RotateNum = ((CommandReceive[i + 3] << 8)
					| CommandReceive[i + 4]);
			CaptureData->VerticalNum = ((CommandReceive[i + 5] << 8)
					| CommandReceive[i + 6]);
			CaptureData->LightNum = ((CommandReceive[i + 7] << 8)
					| CommandReceive[i + 8]);
			CaptureData->PanNum = ((CommandReceive[i + 9] << 8)
					| CommandReceive[i + 10]);
			CaptureData->ConveyNum = ((CommandReceive[i + 11] << 8)
					| CommandReceive[i + 12]);

			CaptureData->ArmNum[0] = ((CommandReceive[i + 13] << 8)
					| CommandReceive[i + 14]);
			CaptureData->ArmNum[1] = ((CommandReceive[i + 15] << 8)
					| CommandReceive[i + 16]);
			CaptureData->ArmNum[2] = ((CommandReceive[i + 17] << 8)
					| CommandReceive[i + 18]);
			CaptureData->ArmNum[3] = ((CommandReceive[i + 19] << 8)
					| CommandReceive[i + 20]);
			CaptureData->ArmNum[4] = ((CommandReceive[i + 21] << 8)
					| CommandReceive[i + 22]);
			CaptureData->ArmNum[5] = ((CommandReceive[i + 23] << 8)
					| CommandReceive[i + 24]);
			CaptureData->RestNum = ((CommandReceive[i + 25] << 8)
					| CommandReceive[i + 26]);
			CaptureData->Mode = CommandReceive[i + 27];
			CaptureData->IdTest = CommandReceive[i + 28];
			CaptureData->FrameEnd = (CommandReceive[i + 29]);
		}
		else
		{
			continue;
		}
	}
}


