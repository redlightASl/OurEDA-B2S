/* USER CODE BEGIN Header */
/**
 ******************************************************************************
 * @file    stm32h7xx_it.c
 * @brief   Interrupt Service Routines.
 ******************************************************************************
 * @attention
 *
 * Copyright (c) 2022 STMicroelectronics.
 * All rights reserved.
 *
 * This software is licensed under terms that can be found in the LICENSE file
 * in the root directory of this software component.
 * If no LICENSE file comes with this software, it is provided AS-IS.
 *
 ******************************************************************************
 */
/* USER CODE END Header */

/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "stm32h7xx_it.h"
/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

#include "Defines.h"
#include "usart.h"

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN TD */

/* USER CODE END TD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
/* USER CODE BEGIN PV */

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/* External variables --------------------------------------------------------*/
extern DMA_HandleTypeDef hdma_uart4_rx;
extern DMA_HandleTypeDef hdma_uart5_rx;
extern DMA_HandleTypeDef hdma_uart5_tx;
extern DMA_HandleTypeDef hdma_uart8_rx;
extern DMA_HandleTypeDef hdma_uart8_tx;
extern DMA_HandleTypeDef hdma_usart1_rx;
extern DMA_HandleTypeDef hdma_usart1_tx;
extern DMA_HandleTypeDef hdma_usart2_rx;
extern DMA_HandleTypeDef hdma_usart2_tx;
extern DMA_HandleTypeDef hdma_usart3_rx;
extern UART_HandleTypeDef huart4;
extern UART_HandleTypeDef huart5;
extern UART_HandleTypeDef huart8;
extern UART_HandleTypeDef huart1;
extern UART_HandleTypeDef huart2;
extern UART_HandleTypeDef huart3;
extern TIM_HandleTypeDef htim6;

/* USER CODE BEGIN EV */

/* USER CODE END EV */

/******************************************************************************/
/*           Cortex Processor Interruption and Exception Handlers          */
/******************************************************************************/
/**
 * @brief This function handles Non maskable interrupt.
 */
void NMI_Handler(void)
{
	/* USER CODE BEGIN NonMaskableInt_IRQn 0 */

	/* USER CODE END NonMaskableInt_IRQn 0 */
	/* USER CODE BEGIN NonMaskableInt_IRQn 1 */
	while (1)
	{
	}
	/* USER CODE END NonMaskableInt_IRQn 1 */
}

/**
 * @brief This function handles Hard fault interrupt.
 */
void HardFault_Handler(void)
{
	/* USER CODE BEGIN HardFault_IRQn 0 */

	/* USER CODE END HardFault_IRQn 0 */
	while (1)
	{
		/* USER CODE BEGIN W1_HardFault_IRQn 0 */
		HAL_GPIO_WritePin(LED_GPIO_Port, LED_Pin, GPIO_PIN_SET);
		/* USER CODE END W1_HardFault_IRQn 0 */
	}
}

/**
 * @brief This function handles Memory management fault.
 */
void MemManage_Handler(void)
{
	/* USER CODE BEGIN MemoryManagement_IRQn 0 */

	/* USER CODE END MemoryManagement_IRQn 0 */
	while (1)
	{
		/* USER CODE BEGIN W1_MemoryManagement_IRQn 0 */
		/* USER CODE END W1_MemoryManagement_IRQn 0 */
	}
}

/**
 * @brief This function handles Pre-fetch fault, memory access fault.
 */
void BusFault_Handler(void)
{
	/* USER CODE BEGIN BusFault_IRQn 0 */

	/* USER CODE END BusFault_IRQn 0 */
	while (1)
	{
		/* USER CODE BEGIN W1_BusFault_IRQn 0 */
		/* USER CODE END W1_BusFault_IRQn 0 */
	}
}

/**
 * @brief This function handles Undefined instruction or illegal state.
 */
void UsageFault_Handler(void)
{
	/* USER CODE BEGIN UsageFault_IRQn 0 */

	/* USER CODE END UsageFault_IRQn 0 */
	while (1)
	{
		/* USER CODE BEGIN W1_UsageFault_IRQn 0 */
		/* USER CODE END W1_UsageFault_IRQn 0 */
	}
}

/**
 * @brief This function handles Debug monitor.
 */
void DebugMon_Handler(void)
{
	/* USER CODE BEGIN DebugMonitor_IRQn 0 */

	/* USER CODE END DebugMonitor_IRQn 0 */
	/* USER CODE BEGIN DebugMonitor_IRQn 1 */

	/* USER CODE END DebugMonitor_IRQn 1 */
}

/******************************************************************************/
/* STM32H7xx Peripheral Interrupt Handlers                                    */
/* Add here the Interrupt Handlers for the used peripherals.                  */
/* For the available peripheral interrupt handler names,                      */
/* please refer to the startup file (startup_stm32h7xx.s).                    */
/******************************************************************************/

/**
 * @brief This function handles DMA1 stream0 global interrupt.
 */
void DMA1_Stream0_IRQHandler(void)
{
	/* USER CODE BEGIN DMA1_Stream0_IRQn 0 */

	/* USER CODE END DMA1_Stream0_IRQn 0 */
	HAL_DMA_IRQHandler(&hdma_usart1_rx);
	/* USER CODE BEGIN DMA1_Stream0_IRQn 1 */

	/* USER CODE END DMA1_Stream0_IRQn 1 */
}

/**
 * @brief This function handles DMA1 stream1 global interrupt.
 */
void DMA1_Stream1_IRQHandler(void)
{
	/* USER CODE BEGIN DMA1_Stream1_IRQn 0 */

	/* USER CODE END DMA1_Stream1_IRQn 0 */
	HAL_DMA_IRQHandler(&hdma_usart1_tx);
	/* USER CODE BEGIN DMA1_Stream1_IRQn 1 */

	/* USER CODE END DMA1_Stream1_IRQn 1 */
}

/**
 * @brief This function handles DMA1 stream2 global interrupt.
 */
void DMA1_Stream2_IRQHandler(void)
{
	/* USER CODE BEGIN DMA1_Stream2_IRQn 0 */

	/* USER CODE END DMA1_Stream2_IRQn 0 */
	HAL_DMA_IRQHandler(&hdma_usart2_rx);
	/* USER CODE BEGIN DMA1_Stream2_IRQn 1 */

	/* USER CODE END DMA1_Stream2_IRQn 1 */
}

/**
 * @brief This function handles DMA1 stream3 global interrupt.
 */
void DMA1_Stream3_IRQHandler(void)
{
	/* USER CODE BEGIN DMA1_Stream3_IRQn 0 */

	/* USER CODE END DMA1_Stream3_IRQn 0 */
	HAL_DMA_IRQHandler(&hdma_usart3_rx);
	/* USER CODE BEGIN DMA1_Stream3_IRQn 1 */

	/* USER CODE END DMA1_Stream3_IRQn 1 */
}

/**
 * @brief This function handles DMA1 stream4 global interrupt.
 */
void DMA1_Stream4_IRQHandler(void)
{
	/* USER CODE BEGIN DMA1_Stream4_IRQn 0 */

	/* USER CODE END DMA1_Stream4_IRQn 0 */
	HAL_DMA_IRQHandler(&hdma_uart5_rx);
	/* USER CODE BEGIN DMA1_Stream4_IRQn 1 */

	/* USER CODE END DMA1_Stream4_IRQn 1 */
}

/**
 * @brief This function handles DMA1 stream5 global interrupt.
 */
void DMA1_Stream5_IRQHandler(void)
{
	/* USER CODE BEGIN DMA1_Stream5_IRQn 0 */

	/* USER CODE END DMA1_Stream5_IRQn 0 */
	HAL_DMA_IRQHandler(&hdma_uart4_rx);
	/* USER CODE BEGIN DMA1_Stream5_IRQn 1 */

	/* USER CODE END DMA1_Stream5_IRQn 1 */
}

/**
 * @brief This function handles USART1 global interrupt.
 */
void USART1_IRQHandler(void)
{
	/* USER CODE BEGIN USART1_IRQn 0 */
	uint32_t tmp_flag = 0;
	tmp_flag = __HAL_UART_GET_FLAG(&Master_UART, UART_FLAG_IDLE);
	if ((tmp_flag != RESET))
	{
		__HAL_UART_CLEAR_IDLEFLAG(&Master_UART);
		__HAL_DMA_GET_COUNTER(&hdma_usart1_rx);
		HAL_UART_DMAStop(&Master_UART);
		__HAL_UART_DISABLE_IT(&Master_UART, UART_IT_IDLE);
		xSemaphoreGiveFromISR(CMD_DONE_semHandle, pdFALSE);
	}

	/* USER CODE END USART1_IRQn 0 */
	HAL_UART_IRQHandler(&huart1);
	/* USER CODE BEGIN USART1_IRQn 1 */

	/* USER CODE END USART1_IRQn 1 */
}

/**
 * @brief This function handles USART2 global interrupt.
 */
void USART2_IRQHandler(void)
{
	/* USER CODE BEGIN USART2_IRQn 0 */
	uint32_t tmp_flag = 0;
	tmp_flag = __HAL_UART_GET_FLAG(&TEMPER_UART, UART_FLAG_IDLE);
	if ((tmp_flag != RESET))
	{
		__HAL_UART_CLEAR_IDLEFLAG(&TEMPER_UART);
		__HAL_DMA_GET_COUNTER(&hdma_usart2_rx);
		HAL_UART_DMAStop(&TEMPER_UART);
		__HAL_UART_DISABLE_IT(&TEMPER_UART, UART_IT_IDLE);
		xSemaphoreGiveFromISR(GY39_DONE_semHandle, pdFALSE);
	}

	/* USER CODE END USART2_IRQn 0 */
	HAL_UART_IRQHandler(&huart2);
	/* USER CODE BEGIN USART2_IRQn 1 */

	/* USER CODE END USART2_IRQn 1 */
}

/**
 * @brief This function handles USART3 global interrupt.
 */
void USART3_IRQHandler(void)
{
	/* USER CODE BEGIN USART3_IRQn 0 */
	uint32_t tmp_flag = 0;
	tmp_flag = __HAL_UART_GET_FLAG(&AXIS_UART, UART_FLAG_IDLE);
	if ((tmp_flag != RESET))
	{
		__HAL_UART_CLEAR_IDLEFLAG(&AXIS_UART);
		__HAL_DMA_GET_COUNTER(&hdma_usart3_rx);
		HAL_UART_DMAStop(&AXIS_UART);
		__HAL_UART_DISABLE_IT(&AXIS_UART, UART_IT_IDLE);
		xSemaphoreGiveFromISR(WT931_DONE_semHandle, pdFALSE);
	}

	/* USER CODE END USART3_IRQn 0 */
	HAL_UART_IRQHandler(&huart3);
	/* USER CODE BEGIN USART3_IRQn 1 */

	/* USER CODE END USART3_IRQn 1 */
}

/**
 * @brief This function handles DMA1 stream7 global interrupt.
 */
void DMA1_Stream7_IRQHandler(void)
{
	/* USER CODE BEGIN DMA1_Stream7_IRQn 0 */

	/* USER CODE END DMA1_Stream7_IRQn 0 */
	HAL_DMA_IRQHandler(&hdma_uart8_rx);
	/* USER CODE BEGIN DMA1_Stream7_IRQn 1 */

	/* USER CODE END DMA1_Stream7_IRQn 1 */
}

/**
 * @brief This function handles UART4 global interrupt.
 */
void UART4_IRQHandler(void)
{
	/* USER CODE BEGIN UART4_IRQn 0 */
	uint32_t tmp_flag = 0;
	tmp_flag = __HAL_UART_GET_FLAG(&Deep_UART, UART_FLAG_IDLE);
	if ((tmp_flag != RESET))
	{
		__HAL_UART_CLEAR_IDLEFLAG(&Deep_UART);
		__HAL_DMA_GET_COUNTER(&hdma_uart4_rx);
		HAL_UART_DMAStop(&Deep_UART);
		__HAL_UART_DISABLE_IT(&Deep_UART, UART_IT_IDLE);
		xSemaphoreGiveFromISR(WD_DONE_semHandle, pdFALSE);
	}

	/* USER CODE END UART4_IRQn 0 */
	HAL_UART_IRQHandler(&huart4);
	/* USER CODE BEGIN UART4_IRQn 1 */

	/* USER CODE END UART4_IRQn 1 */
}

/**
 * @brief This function handles UART5 global interrupt.
 */
void UART5_IRQHandler(void)
{
	/* USER CODE BEGIN UART5_IRQn 0 */
	uint32_t tmp_flag = 0;
	tmp_flag = __HAL_UART_GET_FLAG(&SONAR_HEIGHT_UART, UART_FLAG_IDLE);
	if ((tmp_flag != RESET))
	{
		__HAL_UART_CLEAR_IDLEFLAG(&SONAR_HEIGHT_UART);
		__HAL_DMA_GET_COUNTER(&hdma_uart5_rx);
		HAL_UART_DMAStop(&SONAR_HEIGHT_UART);
		__HAL_UART_DISABLE_IT(&SONAR_HEIGHT_UART, UART_IT_IDLE);
		xSemaphoreGiveFromISR(P30_DONE_semHandle, pdFALSE);
	}

	/* USER CODE END UART5_IRQn 0 */
	HAL_UART_IRQHandler(&huart5);
	/* USER CODE BEGIN UART5_IRQn 1 */

	/* USER CODE END UART5_IRQn 1 */
}

/**
 * @brief This function handles TIM6 global interrupt, DAC1_CH1 and DAC1_CH2 underrun error interrupts.
 */
void TIM6_DAC_IRQHandler(void)
{
	/* USER CODE BEGIN TIM6_DAC_IRQn 0 */

	/* USER CODE END TIM6_DAC_IRQn 0 */
	HAL_TIM_IRQHandler(&htim6);
	/* USER CODE BEGIN TIM6_DAC_IRQn 1 */

	/* USER CODE END TIM6_DAC_IRQn 1 */
}

/**
 * @brief This function handles DMA2 stream0 global interrupt.
 */
void DMA2_Stream0_IRQHandler(void)
{
	/* USER CODE BEGIN DMA2_Stream0_IRQn 0 */

	/* USER CODE END DMA2_Stream0_IRQn 0 */
	HAL_DMA_IRQHandler(&hdma_uart8_tx);
	/* USER CODE BEGIN DMA2_Stream0_IRQn 1 */

	/* USER CODE END DMA2_Stream0_IRQn 1 */
}

/**
 * @brief This function handles DMA2 stream1 global interrupt.
 */
void DMA2_Stream1_IRQHandler(void)
{
	/* USER CODE BEGIN DMA2_Stream1_IRQn 0 */

	/* USER CODE END DMA2_Stream1_IRQn 0 */
	HAL_DMA_IRQHandler(&hdma_usart2_tx);
	/* USER CODE BEGIN DMA2_Stream1_IRQn 1 */

	/* USER CODE END DMA2_Stream1_IRQn 1 */
}

/**
 * @brief This function handles DMA2 stream2 global interrupt.
 */
void DMA2_Stream2_IRQHandler(void)
{
	/* USER CODE BEGIN DMA2_Stream2_IRQn 0 */

	/* USER CODE END DMA2_Stream2_IRQn 0 */
	HAL_DMA_IRQHandler(&hdma_uart5_tx);
	/* USER CODE BEGIN DMA2_Stream2_IRQn 1 */

	/* USER CODE END DMA2_Stream2_IRQn 1 */
}

/**
 * @brief This function handles UART8 global interrupt.
 */
void UART8_IRQHandler(void)
{
	/* USER CODE BEGIN UART8_IRQn 0 */
	uint32_t tmp_flag = 0;
	tmp_flag = __HAL_UART_GET_FLAG(&Slave_UART, UART_FLAG_IDLE);
	if ((tmp_flag != RESET))
	{
		__HAL_UART_CLEAR_IDLEFLAG(&Slave_UART);
		__HAL_DMA_GET_COUNTER(&hdma_uart8_rx);
		HAL_UART_DMAStop(&Slave_UART);
		__HAL_UART_DISABLE_IT(&Slave_UART, UART_IT_IDLE);
		xSemaphoreGiveFromISR(RPT_DONE_semHandle, pdFALSE);
	}

	/* USER CODE END UART8_IRQn 0 */
	HAL_UART_IRQHandler(&huart8);
	/* USER CODE BEGIN UART8_IRQn 1 */

	/* USER CODE END UART8_IRQn 1 */
}

/* USER CODE BEGIN 1 */

/* USER CODE END 1 */

