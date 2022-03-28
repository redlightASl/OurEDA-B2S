/**
  ******************************************************************************
  * @file    main.c
  * @author  MCD Application Team
  * @version V1.2.1
  * @date    30-September-2014
  * @brief   Main program body
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
#include "stdio.h"
#include "main.h"
/**
  * @addtogroup USART_Printf
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

/* Private macro -------------------------------------------------------------*/
extern uint8_t HEADER_ADDRESS_Read = (((SLAVE_ADDRESS & 0xFF00) >> 7) | 0xF1);
extern uint8_t HEADER_ADDRESS_Write;

/* Private variables ---------------------------------------------------------*/
__IO uint8_t Rx_Idx = 0;
__IO uint8_t Tx_Idx = 0;

__IO uint8_t NumByteToRead = BUFFERSIZE;
__IO uint8_t NumOfBytes = BUFFERSIZE;

TestStatus TransferStatus1 = FAILED;

__IO uint8_t TxBuffer[BUFFERSIZE];
__IO uint8_t RxBuffer[BUFFERSIZE];

/* Private function prototypes -----------------------------------------------*/
TestStatus Buffercmp(uint8_t* pBuffer1, uint8_t* pBuffer2, uint16_t BufferLength);
uint8_t crc4(uint16_t n_prom[]);
void Delay (uint16_t nCount);

static void USART_Config(void);

static void I2C_Config(void);
void I2C_WriteByte(uint8_t addr, uint8_t data);
uint8_t I2C_ReadByte(uint8_t addr);


static void MS5837_Init(void);
static void MS5837_GetData(uint32_t *pressure, uint32_t *temperature, uint32_t *depth, uint32_t *altitude);
static uint8_t MS5837_Check(void);
static void MS5837_SetFluidDensity(uint16_t density);

/* Private functions ---------------------------------------------------------*/

/**
  * @brief  Main program.
  * @param  None
  * @retval None
  */
void main(void)
{
		uint32_t pressure=0;
		uint32_t temperature=0;
		uint32_t depth=0;
		uint32_t altitude=0;
		
    /* USART Configuration ---------------------------------------------------*/
		disableInterrupts();
		GPIO_Init(LED_GPIO_PORT, LED_GPIO_PINS, GPIO_Mode_Out_PP_Low_Fast);
    USART_Config();
		I2C_Config();
		enableInterrupts();

		MS5837_Init();
    printf("Board Init!\r\n");

    while (1)
    {
			GPIO_ToggleBits(LED_GPIO_PORT, LED_GPIO_PINS);
			MS5837_GetData(&pressure, &temperature, &depth, &altitude);
			printf("Data:%d\t%d\t%d\t%d\r\n", pressure, temperature, depth, altitude);
			printf("hello\r\n");
			Delay(0xFFFF);
		}
}

/**
  * @brief  Configure USART peripheral to print characters on Hyperteminal
  * @param  None
  * @retval None
  */
static void USART_Config(void)
{
    /* High speed internal clock prescaler: 1*/
    CLK_MasterPrescalerConfig(CLK_MasterPrescaler_HSIDiv1);
 
     /*Set the USART RX and USART TX at high level*/
    GPIO_ExternalPullUpConfig(GPIOC,GPIO_Pin_3|GPIO_Pin_4, ENABLE);
    
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
}

static void I2C_Config(void)
{
	uint8_t i = 0;
	
	/* I2C  clock Enable*/
  CLK_PeripheralClockConfig(CLK_Peripheral_I2C, ENABLE);

#ifdef FAST_I2C_MODE
  /* system_clock / 1 */
    CLK_MasterPrescalerConfig(CLK_MasterPrescaler_HSIDiv1);
#else
  /* system_clock / 2 */
    CLK_MasterPrescalerConfig(CLK_MasterPrescaler_HSIDiv2);
#endif
	
	/* Initialize I2C peripheral */
  I2C_Init(I2C_SPEED, 0xA0,
           I2C_DutyCycle_2, I2C_Ack_Enable, I2C_AcknowledgedAddress_7bit);

	/* Enable Buffer and Event Interrupt*/
  I2C_ITConfig((I2C_IT_TypeDef)(I2C_IT_EVT | I2C_IT_BUF) , ENABLE);
	
	for (i = 0; i < BUFFERSIZE; i++)
	{
		TxBuffer[i] = 0;
		RxBuffer[i] = 0;
	}
	
	I2C_Cmd(ENABLE);
}

static void MS5837_Init(void)
{
	while(!MS5837_Check())
	{
		printf("Init Failed\r\n");
		printf("Retry!\r\n");
		printf("\r\n");
		Delay(0x7FFF);
	}
	
	MS5837_SetFluidDensity(1029); /* 997 for freshwater, 1029 for seawater */
}

static void MS5837_GetData(uint32_t *pressure, uint32_t *temperature, uint32_t *depth, uint32_t *altitude)
{

}

static void MS5837_SetFluidDensity(uint16_t density)
{

}

static uint8_t MS5837_Check(void)
{
	uint8_t i = 0;
	uint16_t temp[8];
	uint8_t crcRead = 0;
	uint8_t crcCalculated = 0;
	
	I2C_WriteByte(MS5837_ADDR, MS5837_RESET);
	Delay(0x1000);
	
	for (i = 0; i < 7; i++)
	{
		I2C_WriteByte(MS5837_ADDR, MS5837_PROM_READ + i * 2);
		temp[i] = (I2C_ReadByte(MS5837_ADDR) << 8) | (I2C_ReadByte(MS5837_ADDR));
	}
	
	crcRead = temp[0] >> 12;
	crcCalculated = crc4(temp);
	
	if(crcCalculated == crcRead)
	{
		return 1; /* success */
	}
	else 
	{
		return 0; /* fail */
	}
}

void I2C_WriteByte(uint8_t addr, uint8_t data)
{
	while(I2C_GetFlagStatus(I2C_FLAG_BUSY));

	I2C_GenerateSTART(ENABLE);
	while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT)); /* EV5, master mode */

	I2C_Send7bitAddress(MASTER_ADDR, I2C_Direction_Transmitter);
	while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)); /* EV6 */

	I2C_SendData(addr);
	while (!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));

	I2C_SendData(data);
	while (!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));
	I2C_AcknowledgeConfig(ENABLE);
	
	I2C_GenerateSTOP(ENABLE);
}

uint8_t I2C_ReadByte(uint8_t addr)
{
	uint8_t ret;
	while(I2C_GetFlagStatus(I2C_FLAG_BUSY));
	
	I2C_GenerateSTART( ENABLE);
	while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT)); /* EV5, master mode */
	
	I2C_Send7bitAddress(MASTER_ADDR, I2C_Direction_Transmitter);
	while(!I2C_CheckEvent(I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED));
		
	I2C_SendData(addr); /* Reg Address */
	while (!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_TRANSMITTED));

	I2C_GenerateSTART(ENABLE);
	while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT)); /* EV5, master mode */
		
	I2C_Send7bitAddress(MASTER_ADDR, I2C_Direction_Receiver);
	while(!I2C_CheckEvent(I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED));

	while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_RECEIVED));  

	ret = I2C_ReceiveData(); /* Read I2C data */
	I2C_AcknowledgeConfig(DISABLE);
	I2C_GenerateSTOP(ENABLE); 
	return ret;
} 

/**
  * @brief  Inserts a delay time.
  * @param  nCount: specifies the delay time length.
  * @retval None
  */
void Delay(__IO uint16_t nCount)
{
  /* Decrement nCount value */
  while (nCount != 0)
  {
    nCount--;
  }
}

uint8_t crc4(uint16_t n_prom[])
{
	uint16_t n_rem = 0;
	uint8_t i = 0;
	uint8_t n_bit = 8;
	
	n_prom[0] = ((n_prom[0]) & 0x0FFF);
	n_prom[7] = 0;

	for (i = 0 ;i < 16; i++)
	{
		if (i%2 == 1)
		{
			n_rem ^= (uint16_t)((n_prom[i>>1]) & 0x00FF);
		}
		else
		{
			n_rem ^= (uint16_t)(n_prom[i>>1] >> 8);
		}
		
		for (n_bit = 8;n_bit > 0 ;n_bit--)
		{
			if (n_rem & 0x8000)
			{
				n_rem = (n_rem << 1) ^ 0x3000;
			} 
			else 
			{
				n_rem = (n_rem << 1);
			}
		}
	}
	n_rem = ((n_rem >> 12) & 0x000F);

	return n_rem ^ 0x00;
}

/**
  * @brief  Compares two buffers.
  * @param  pBuffer1, pBuffer2: buffers to be compared.
  * @param  BufferLength: buffer's length
  * @retval PASSED: pBuffer1 identical to pBuffer2
  *   FAILED: pBuffer1 differs from pBuffer2
  */
TestStatus Buffercmp(uint8_t* pBuffer1, uint8_t* pBuffer2, uint16_t BufferLength)
{
  while (BufferLength--)
  {
    if (*pBuffer1 != *pBuffer2)
    {
      return FAILED;
    }
    pBuffer1++;
    pBuffer2++;
  }
  return PASSED;
}

/**
  * @brief  Retargets the C library printf function to the USART.
  * @param  c Character to send
  * @retval char Character sent
  */
PUTCHAR_PROTOTYPE
{
  /* Write a character to the USART */
  USART_SendData8(c);
  
  /* Loop until the end of transmission */
  while (USART_GetFlagStatus(USART_FLAG_TXE) == RESET);

  return (c);
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
