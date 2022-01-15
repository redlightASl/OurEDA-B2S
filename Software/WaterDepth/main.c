/**
  ******************************************************************************
  * @file     Project/STM8L10x_StdPeriph_Templates/main.c
  * @author   MCD Application Team
  * @version V1.2.1
  * @date    30-September-2014
  * @brief    This file contains the firmware main function.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT 2014 STMicroelectronics</center></h2>
  *
  * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
  * You may not use this file except in compliance with the License.
  * You may obtain a copy of the License at:
  *
  *        http://www.st.com/software_license_agreement_liberty_v2
  *
  * Unless required by applicable law or agreed to in writing, software
  * distributed under the License is distributed on an "AS IS" BASIS,
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
  *
  ******************************************************************************
  */

  /* Includes ------------------------------------------------------------------*/
#include "stm8l10x.h"
#include "stm8l10x_gpio.h"
#include "stm8l10x_exti.h"
#include "stm8l10x_tim2.h"
#include "stm8l10x_iwdg.h"
#include "stm8l10x_i2c.h"
#include "stm8l10x_usart.h"
#include "main.h"
#include "stdio.h"

/** @addtogroup STM8L10x_StdPeriph_Templates
  * @{
  */

  /* Private typedef -----------------------------------------------------------*/
  /* Private define ------------------------------------------------------------*/
#ifdef _RAISONANCE_
#define PUTCHAR_PROTOTYPE int putchar (char c)
#define GETCHAR_PROTOTYPE int getchar (void)
#elif defined (_COSMIC_)
#define PUTCHAR_PROTOTYPE char putchar (char c)
#define GETCHAR_PROTOTYPE char getchar (void)
#else /* _IAR_ */
#define PUTCHAR_PROTOTYPE int putchar (int c)
#define GETCHAR_PROTOTYPE int getchar (void)
#endif

#define RELOAD_VALUE 254
#define LSI_PERIOD_NUMBERS 10

#define LED_GPIO_PORT GPIOB
#define LED_GPIO_PINS GPIO_Pin_2

#define KEY_GPIO_PORT GPIOB
#define KEY_GPIO_PINS GPIO_Pin_0
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
__IO uint32_t LsiFreq = 0;
extern __IO uint32_t Capture;
extern __IO uint16_t CaptureState;
/* Private function prototypes -----------------------------------------------*/
inline void Delay(uint16_t nCount);
static inline void SysClock_Init(void);
static inline void IWDG_Config(void);
uint32_t LSIMeasurment(void);
static inline void USART_Config(void);
static inline void I2C_Config(void);
static inline void Hardware_Init(void);

/* Private functions ---------------------------------------------------------*/
PUTCHAR_PROTOTYPE
{
	/* Write a character to the USART */
	USART_SendData8(c);
	/* Loop until the end of transmission */
	while (USART_GetFlagStatus(USART_FLAG_TXE) == RESET)
	{
		_nop_();
	}
	return (c);
}

void main(void)
{
	/* check IWDG flag */
	if (RST_GetFlagStatus(RST_FLAG_IWDGF) != RESET)
	{
		/* IWDGF flag set */
		/* Turn on LED */
		GPIO_SetBits(LED_GPIO_PORT, LED_GPIO_PINS);
		/* Clear IWDGF Flag */
		RST_ClearFlag(RST_FLAG_IWDGF);
	}
	else
	{
		/* IWDGF flag is not set */
		/* Turn off LED */
		GPIO_ResetBits(LED_GPIO_PORT, LED_GPIO_PINS);
	}

	Hardware_Init();

	printf("System Running!\r\n");

	/* Infinite loop */
	while (1)
	{
		GPIO_ToggleBits(LED_GPIO_PORT, LED_GPIO_PINS);

		IWDG_ReloadCounter();
	}
}

inline void Delay(__IO uint16_t nCount)
{
	/* Decrement nCount value */
	while (nCount != 0)
	{
		nCount--;
	}
}

static inline void SysClock_Init(void)
{
	/* High speed internal clock prescaler: 1*/
	CLK_MasterPrescalerConfig(CLK_MasterPrescaler_HSIDiv1);

	/* Enable TIM2 clock */
	CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, ENABLE);

	/* Enable AWU clock to get write access for AWU registers */
	CLK_PeripheralClockConfig(CLK_Peripheral_AWU, ENABLE);
}

static void IWDG_Config(void)
{
	/* Enable IWDG (the LSI oscillator will be enabled by hardware) */
	IWDG_Enable();

	/* IWDG timeout equal to 214 ms (the timeout may varies due to LSI frequency
	   dispersion) */
	   /* Enable write access to IWDG_PR and IWDG_RLR registers */
	IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);

	/* IWDG configuration: IWDG is clocked by LSI = 38KHz */
	IWDG_SetPrescaler(IWDG_Prescaler_32);

	/* IWDG timeout equal to 214.7 ms (the timeout may varies due to LSI frequency dispersion) */
	/* IWDG timeout = (RELOAD_VALUE + 1) * Prescaler / LSI
					= (254 + 1) * 32 / 38 000
					= 214.7 ms */
	IWDG_SetReload((uint8_t)RELOAD_VALUE);

	/* Reload IWDG counter */
	IWDG_ReloadCounter();
}

uint32_t LSIMeasurment(void)
{
	uint8_t icfilter = 0;
	uint32_t LSICurrentPeriod = 0;
	uint32_t LSIMeasuredFrequencyCumul = 0;
	uint16_t LSIMeasuredFrequency = 0;
	uint8_t LSIPeriodCounter = 0;

	/* Enable the LSI measurement: LSI clock connected to timer Input Capture 1 */
	AWU->CSR |= AWU_CSR_MSR;

	/* TIM2 configuration: Input Capture mode */
	/* Configure TIM2 channel 1 in input capture mode */
	/* The signal in input is divided and not filtered */
	/* The capture occurs when a rising edge is detected on TIM2 channel 1 */
	TIM2_ICInit(
		TIM2_Channel_1, 
		TIM2_ICPolarity_Rising, 
		TIM2_ICSelection_DirectTI,
		TIM2_ICPSC_Div8, 
		icfilter
	);

	LSIPeriodCounter = 0;
	/**************************** START of LSI Measurement **********************/
	while (LSIPeriodCounter <= LSI_PERIOD_NUMBERS)
	{
		CaptureState = 1;
		/* Clear all TM2 flags */
		TIM2_GenerateEvent(TIM2_EventSource_Update);
		TIM2->SR1 = 0;
		TIM2->SR2 = 0;
		/* Enable capture 1 interrupt */
		TIM2_ITConfig(TIM2_IT_CC1, ENABLE);
		/* Enable TIM2 */
		TIM2_Cmd(ENABLE);

		while (CaptureState != 255);

		if (LSIPeriodCounter != 0)
		{
			/* Compute the frequency value */
			LSICurrentPeriod = (uint32_t)8 * (HSI_VALUE / Capture);
			/* Add the current frequency to previous cumulation */
			LSIMeasuredFrequencyCumul = LSIMeasuredFrequencyCumul + LSICurrentPeriod;
		}
		LSIPeriodCounter++;
	}
	/**************************** END of LSI Measurement ************************/

	/* Compute the average of LSI frequency value */
	LSIMeasuredFrequency = (uint16_t)(LSIMeasuredFrequencyCumul / LSI_PERIOD_NUMBERS);

	/* Disable the LSI measurement: LSI clock disconnected from timer Input Capture 1 */
	AWU->CSR &= (uint8_t)(~AWU_CSR_MSR);

	/* Return the LSI frequency */
	return (uint16_t)(LSIMeasuredFrequency);
}

static inline void USART_Config(void)
{
	/*Set the USART RX and USART TX at high level*/
	GPIO_ExternalPullUpConfig(GPIOC, GPIO_Pin_3 | GPIO_Pin_4, ENABLE);

	/* Enable USART clock */
	CLK_PeripheralClockConfig(CLK_Peripheral_USART, ENABLE);
	USART_DeInit();

	/* USART configuration ------------------------------------------------------*/
	/* USART configured as follow:
		  - BaudRate = 115200 baud
		  - Word Length = 8 Bits
		  - One Stop Bit
		  - No parity
		  - Receive and transmit enabled
	*/
	USART_Init(
		(uint32_t)115200,
		USART_WordLength_8D,
		USART_StopBits_1,
		USART_Parity_No,
		(USART_Mode_TypeDef)(USART_Mode_Rx | USART_Mode_Tx)
	);

	/* Enable the USART Transmit interrupt: this interrupt is generated when the
	   USART transmit data register is empty */
	// USART_ITConfig(USART_IT_TXE, ENABLE);
	/* Enable the USART Receive interrupt: this interrupt is generated when the
	   USART receive data register is not empty */
	USART_ITConfig(USART_IT_RXNE, ENABLE);

	/* Set the USART Address */
	// USART_SetAddress(0x2);

	/* Enable the USART */
	USART_Cmd(ENABLE);
}

static inline void I2C_Config(void)
{
	CLK_PeripheralClockConfig(CLK_Peripheral_I2C, ENABLE);
	I2C_DeInit();

#ifdef I2C_slave_7Bits_Address
	I2C_Init(
		100000,
		SLAVE_ADDRESS,
		I2C_DutyCycle_2,
		I2C_Ack_Enable,
		I2C_AcknowledgedAddress_7bit
	);
#else
	I2C_Init(
		100000,
		SLAVE_ADDRESS,
		I2C_DutyCycle_2,
		I2C_Ack_Enable,
		I2C_AcknowledgedAddress_10bit
	);
#endif

	I2C_ITConfig((I2C_IT_TypeDef)(I2C_IT_ERR | I2C_IT_EVT | I2C_IT_BUF), ENABLE);

	/* Enable the I2C */
	I2C_Cmd(ENABLE);
}

static inline void Hardware_Init(void)
{
	/* init sysclk */
	SysClock_Init();

	/* get measured LSI frequency */
	LsiFreq = LSIMeasurment();

	/* init usart */
	USART_Config();

	/* init i2c */
	I2C_Config();

	/* init LED */
	GPIO_Init(LED_GPIO_PORT, LED_GPIO_PINS, GPIO_Mode_Out_PP_Low_Fast);

	/* init KEY */
	GPIO_Init(KEY_GPIO_PORT, KEY_GPIO_PINS, GPIO_Mode_In_PU_IT);
	EXTI_SetPinSensitivity(EXTI_Pin_0, EXTI_Trigger_Falling_Low);

	/* init IWDG */
	IWDG_Config();

	/* enable interrupt */
	enableInterrupts();
}

#ifdef  USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval : None
  */
void assert_failed(uint8_t* file, uint32_t line)
{
	/* User can add his own implementation to report the file name and line number,
	   ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

	   /* Infinite loop */
	while (1)
	{
	}
}
#endif

/**
  * @}
  */

  /************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/