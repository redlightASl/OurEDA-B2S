/* USER CODE BEGIN Header */
/**
 ******************************************************************************
 * File Name          : freertos.c
 * Description        : Code for freertos applications
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
#include "FreeRTOS.h"
#include "task.h"
#include "main.h"
#include "cmsis_os.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "BasicCtrl.h"
#include "Sensor.h"
#include "Algorithm.h"

#include "usart.h"
#include "gpio.h"
#include "dma.h"
#include "tim.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
PwmVal_t ControlDataAnalysis(ControlData_t controller);

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
/* USER CODE BEGIN Variables */

/* USER CODE END Variables */
osThreadId Thread_IdleHandle;
uint32_t Thread_IdleBuffer[512];
osStaticThreadDef_t Thread_IdleControlBlock;
osThreadId Thread_GY39Handle;
uint32_t Thread_GY39Buffer[512];
osStaticThreadDef_t Thread_GY39ControlBlock;
osThreadId Thread_WT931Handle;
uint32_t Thread_WT931Buffer[512];
osStaticThreadDef_t Thread_WT931ControlBlock;
osThreadId Thread_ControlHandle;
uint32_t Thread_ControlBuffer[512];
osStaticThreadDef_t Thread_ControlControlBlock;
osThreadId Thread_SensorHandle;
uint32_t Thread_SensorBuffer[512];
osStaticThreadDef_t Thread_SensorControlBlock;
osMessageQId WT931_QueueHandle;
uint8_t WT931_QueueBuffer[12 * sizeof(uint16_t)];
osStaticMessageQDef_t WT931_QueueControlBlock;
osMessageQId GY39_QueueHandle;
//uint8_t GY39_QueueBuffer[3 * sizeof(uint16_t)];
uint8_t GY39_QueueBuffer[4 * sizeof(uint16_t)];
osStaticMessageQDef_t GY39_QueueControlBlock;
osSemaphoreId WT931_DONE_semHandle;
osStaticSemaphoreDef_t WT931_DONE_semControlBlock;
osSemaphoreId GY39_Done_semHandle;
osStaticSemaphoreDef_t GY39_Done_semControlBlock;
osSemaphoreId CMD_DONE_semHandle;
osStaticSemaphoreDef_t CMD_DONE_semControlBlock;

/* Private function prototypes -----------------------------------------------*/
/* USER CODE BEGIN FunctionPrototypes */

/* USER CODE END FunctionPrototypes */

void Thread_IdleEntry(void const *argument);
void Thread_GY39Entry(void const *argument);
void Thread_WT931Entry(void const *argument);
void Thread_ControlEntry(void const *argument);
void Thread_SensorEntry(void const *argument);

void MX_FREERTOS_Init(void); /* (MISRA C 2004 rule 8.1) */

/* GetIdleTaskMemory prototype (linked to static allocation support) */
void vApplicationGetIdleTaskMemory(StaticTask_t **ppxIdleTaskTCBBuffer,
		StackType_t **ppxIdleTaskStackBuffer, uint32_t *pulIdleTaskStackSize);

/* USER CODE BEGIN GET_IDLE_TASK_MEMORY */
static StaticTask_t xIdleTaskTCBBuffer;
static StackType_t xIdleStack[configMINIMAL_STACK_SIZE];

void vApplicationGetIdleTaskMemory(StaticTask_t **ppxIdleTaskTCBBuffer,
		StackType_t **ppxIdleTaskStackBuffer, uint32_t *pulIdleTaskStackSize)
{
	*ppxIdleTaskTCBBuffer = &xIdleTaskTCBBuffer;
	*ppxIdleTaskStackBuffer = &xIdleStack[0];
	*pulIdleTaskStackSize = configMINIMAL_STACK_SIZE;
	/* place for user code */
}
/* USER CODE END GET_IDLE_TASK_MEMORY */

/**
 * @brief  FreeRTOS initialization
 * @param  None
 * @retval None
 */
void MX_FREERTOS_Init(void)
{
	/* USER CODE BEGIN Init */

	/* USER CODE END Init */

	/* USER CODE BEGIN RTOS_MUTEX */
	/* add mutexes, ... */
	/* USER CODE END RTOS_MUTEX */

	/* Create the semaphores(s) */
	/* definition and creation of WT931_DONE_sem */
	osSemaphoreStaticDef(WT931_DONE_sem, &WT931_DONE_semControlBlock);
	WT931_DONE_semHandle = osSemaphoreCreate(osSemaphore(WT931_DONE_sem), 1);

	/* definition and creation of GY39_Done_sem */
	osSemaphoreStaticDef(GY39_Done_sem, &GY39_Done_semControlBlock);
	GY39_Done_semHandle = osSemaphoreCreate(osSemaphore(GY39_Done_sem), 1);

	/* definition and creation of CMD_DONE_sem */
	osSemaphoreStaticDef(CMD_DONE_sem, &CMD_DONE_semControlBlock);
	CMD_DONE_semHandle = osSemaphoreCreate(osSemaphore(CMD_DONE_sem), 1);

	/* USER CODE BEGIN RTOS_SEMAPHORES */
	/* add semaphores, ... */
	/* USER CODE END RTOS_SEMAPHORES */

	/* USER CODE BEGIN RTOS_TIMERS */
	/* start timers, add new ones, ... */
	/* USER CODE END RTOS_TIMERS */

	/* Create the queue(s) */
	/* definition and creation of WT931_Queue */
	osMessageQStaticDef(WT931_Queue, 12, uint16_t, WT931_QueueBuffer,
			&WT931_QueueControlBlock);
	WT931_QueueHandle = osMessageCreate(osMessageQ(WT931_Queue), NULL);

	/* definition and creation of GY39_Queue */
	osMessageQStaticDef(GY39_Queue, 3, uint16_t, GY39_QueueBuffer,
			&GY39_QueueControlBlock);
	GY39_QueueHandle = osMessageCreate(osMessageQ(GY39_Queue), NULL);

	/* USER CODE BEGIN RTOS_QUEUES */
	/* add queues, ... */
	/* USER CODE END RTOS_QUEUES */

	/* Create the thread(s) */
	/* definition and creation of Thread_Idle */
	osThreadStaticDef(Thread_Idle, Thread_IdleEntry, osPriorityLow, 0, 512,
			Thread_IdleBuffer, &Thread_IdleControlBlock);
	Thread_IdleHandle = osThreadCreate(osThread(Thread_Idle), NULL);

	/* definition and creation of Thread_GY39 */
	osThreadStaticDef(Thread_GY39, Thread_GY39Entry, osPriorityNormal, 0, 512,
			Thread_GY39Buffer, &Thread_GY39ControlBlock);
	Thread_GY39Handle = osThreadCreate(osThread(Thread_GY39), NULL);

	/* definition and creation of Thread_WT931 */
	osThreadStaticDef(Thread_WT931, Thread_WT931Entry, osPriorityNormal, 0, 512,
			Thread_WT931Buffer, &Thread_WT931ControlBlock);
	Thread_WT931Handle = osThreadCreate(osThread(Thread_WT931), NULL);

	/* definition and creation of Thread_Control */
	osThreadStaticDef(Thread_Control, Thread_ControlEntry, osPriorityNormal, 0,
			512, Thread_ControlBuffer, &Thread_ControlControlBlock);
	Thread_ControlHandle = osThreadCreate(osThread(Thread_Control), NULL);

	/* definition and creation of Thread_Sensor */
	osThreadStaticDef(Thread_Sensor, Thread_SensorEntry, osPriorityNormal, 0,
			512, Thread_SensorBuffer, &Thread_SensorControlBlock);
	Thread_SensorHandle = osThreadCreate(osThread(Thread_Sensor), NULL);

	/* USER CODE BEGIN RTOS_THREADS */
	/* add threads, ... */
	/* USER CODE END RTOS_THREADS */

}

/* USER CODE BEGIN Header_Thread_IdleEntry */
/**
 * @brief  Function implementing the Thread_Idle thread.
 * @param  argument: Not used
 * @retval None
 */
/* USER CODE END Header_Thread_IdleEntry */
void Thread_IdleEntry(void const *argument)
{
	/* USER CODE BEGIN Thread_IdleEntry */
	/* Infinite loop */
	for (;;)
	{
		HAL_GPIO_TogglePin(LED_GPIO_Port, LED_Pin);
		HAL_GPIO_TogglePin(Relay_GPIO_Port, Relay_Pin);
		osDelay(100);
	}
	/* USER CODE END Thread_IdleEntry */
}

/* USER CODE BEGIN Header_Thread_GY39Entry */
/**
 * @brief Function implementing the Thread_GY39 thread.
 * @param argument: Not used
 * @retval None
 */
/* USER CODE END Header_Thread_GY39Entry */
void Thread_GY39Entry(void const *argument)
{
	/* USER CODE BEGIN Thread_GY39Entry */
	uint8_t GY39_TxBuffer[TEMPER_UART_TXLen] =
	{ 0 };
	uint8_t GY39_RxBuffer[TEMPER_UART_RXLen] =
	{ 0 };
	CarbinData_t gy39_data;

	InitGY39(GY39_TxBuffer);
	HAL_UART_Transmit_DMA(&TEMPER_UART, GY39_TxBuffer, sizeof(GY39_TxBuffer));
	HAL_UART_Receive_DMA(&TEMPER_UART, GY39_RxBuffer, sizeof(GY39_RxBuffer));

	/* Infinite loop */
	for (;;)
	{
		if (xSemaphoreTake(GY39_Done_semHandle, 0) == pdTRUE)
		{
			gy39_data = ReceiveGY39(GY39_RxBuffer);

//			printf("t:%d, %d, %d\r\n", gy39_data.CarbinBarometric,
//					gy39_data.CarbinHumidity, gy39_data.CarbinTemperature);
//			xQueueSend(GY39_QueueHandle, &gy39_data, 0);

			memset(&GY39_RxBuffer, 0, sizeof(GY39_RxBuffer));
			__HAL_UART_ENABLE_IT(&TEMPER_UART, UART_IT_IDLE);
			HAL_UART_Receive_DMA(&TEMPER_UART, GY39_RxBuffer,
					sizeof(GY39_RxBuffer));
		}

		osDelay(100);
	}
	/* USER CODE END Thread_GY39Entry */
}

/* USER CODE BEGIN Header_Thread_WT931Entry */
/**
 * @brief Function implementing the Thread_WT931 thread.
 * @param argument: Not used
 * @retval None
 */
/* USER CODE END Header_Thread_WT931Entry */
void Thread_WT931Entry(void const *argument)
{
	/* USER CODE BEGIN Thread_WT931Entry */
	uint8_t WT931_RxBuffer[AXIS_UART_RXLen] =
	{ 0 };
	IMUData_t wt931_data;

	HAL_UART_Receive_DMA(&AXIS_UART, WT931_RxBuffer, sizeof(WT931_RxBuffer));

	/* Infinite loop */
	for (;;)
	{
		if (xSemaphoreTake(WT931_DONE_semHandle, 0) == pdTRUE)
		{
			wt931_data = ReceiveWT931(WT931_RxBuffer);

//			printf("a:%d, %d, %d\r\n", wt931_data.EulerAngle[0],
//					wt931_data.EulerAngle[1], wt931_data.EulerAngle[2]);
//			xQueueSend(WT931_QueueHandle, &wt931_data, 0);

			memset(&WT931_RxBuffer, 0, sizeof(WT931_RxBuffer));
			__HAL_UART_ENABLE_IT(&AXIS_UART, UART_IT_IDLE);
			HAL_UART_Receive_DMA(&AXIS_UART, WT931_RxBuffer,
					sizeof(WT931_RxBuffer));
		}
		osDelay(1);
	}
	/* USER CODE END Thread_WT931Entry */
}

/* USER CODE BEGIN Header_Thread_ControlEntry */
/**
 * @brief Function implementing the Thread_Control thread.
 * @param argument: Not used
 * @retval None
 */
/* USER CODE END Header_Thread_ControlEntry */
void Thread_ControlEntry(void const *argument)
{
	/* USER CODE BEGIN Thread_ControlEntry */
	ControlData_t control_data;
	uint8_t Command_RxBuffer[Master_UART_RXLen * 2];
	static vu8 relay_controller;
	static PwmVal_t pwm_controller;

	pwm_controller.ArmServo[0] = 1500;
	pwm_controller.ArmServo[1] = 1500;
	pwm_controller.ArmServo[2] = 1500;
	pwm_controller.ArmServo[3] = 1500;
	pwm_controller.ArmServo[4] = 1500;
	pwm_controller.ArmServo[5] = 1500;
	pwm_controller.ConveyServo = 1500;
	pwm_controller.HorizontalThruster[0] = 1500;
	pwm_controller.HorizontalThruster[1] = 1500;
	pwm_controller.HorizontalThruster[2] = 1500;
	pwm_controller.HorizontalThruster[3] = 1500;
	pwm_controller.VerticalThruster[0] = 1500;
	pwm_controller.VerticalThruster[1] = 1500;
	pwm_controller.LightServo = 1500;
	pwm_controller.PanServo = 1500;
	pwm_controller.RestServo = 1500;

	__HAL_UART_ENABLE_IT(&Master_UART, UART_IT_IDLE);
	HAL_UART_Receive_DMA(&Master_UART, Command_RxBuffer, sizeof(Command_RxBuffer));

	/* Infinite loop */
	for (;;)
	{
		if (xSemaphoreTake(CMD_DONE_semHandle, 0) == pdTRUE)
		{
			control_data = CaptureControlData(Command_RxBuffer);
			pwm_controller = ControlDataAnalysis(control_data);
			relay_controller = (vu8) ((control_data.Mode & 0x08) >> 4);

			RestrictPwmValue((pwm_controller.HorizontalThruster[0]), 700, 2300);
			RestrictPwmValue((pwm_controller.HorizontalThruster[1]), 700, 2300);
			RestrictPwmValue((pwm_controller.HorizontalThruster[2]), 700, 2300);
			RestrictPwmValue((pwm_controller.HorizontalThruster[3]), 700, 2300);
			RestrictPwmValue((pwm_controller.VerticalThruster[0]), 700, 2300);
			RestrictPwmValue((pwm_controller.VerticalThruster[1]), 700, 2300);

			HAL_GPIO_WritePin(Relay_GPIO_Port, Relay_Pin, relay_controller);

			TIM1->CCR1 = pwm_controller.HorizontalThruster[2]; //B1 '9'
			TIM1->CCR2 = pwm_controller.HorizontalThruster[1]; //A2 '8'
			TIM1->CCR3 = pwm_controller.HorizontalThruster[0]; //A1 '6'

			TIM2->CCR1 = pwm_controller.RestServo; //Pan(not used)
			TIM2->CCR2 = pwm_controller.VerticalThruster[0]; //C1 '3'
			TIM2->CCR3 = pwm_controller.HorizontalThruster[3]; //B2 '2'

			TIM3->CCR1 = pwm_controller.ArmServo[2]; //Middle Arm
			TIM3->CCR2 = pwm_controller.ArmServo[1]; //Main Arm
			TIM3->CCR3 = pwm_controller.ArmServo[0]; //Horizental Arm

			TIM4->CCR2 = pwm_controller.ConveyServo; //Convey
			TIM4->CCR3 = pwm_controller.LightServo; //Light
			TIM4->CCR4 = 1500; //hardware float(not used)

			TIM5->CCR1 = pwm_controller.ArmServo[5]; //Rest Machine Arm
			TIM5->CCR2 = pwm_controller.ArmServo[3]; //Front Arm

			TIM8->CCR3 = pwm_controller.VerticalThruster[1]; //C2 '5'

			TIM12->CCR1 = 1500; //hardware float(not used)

			TIM15->CCR1 = pwm_controller.ArmServo[4]; //Grab Arm
			TIM15->CCR2 = pwm_controller.PanServo; //Pan

			memset(&Command_RxBuffer, 0, sizeof(Command_RxBuffer));
			__HAL_UART_ENABLE_IT(&Master_UART, UART_IT_IDLE);
			HAL_UART_Receive_DMA(&Master_UART, Command_RxBuffer,
					sizeof(Command_RxBuffer));
		}

		osDelay(1);
	}
	/* USER CODE END Thread_ControlEntry */
}

/* USER CODE BEGIN Header_Thread_SensorEntry */
/**
 * @brief Function implementing the Thread_Sensor thread.
 * @param argument: Not used
 * @retval None
 */
/* USER CODE END Header_Thread_SensorEntry */
void Thread_SensorEntry(void const *argument)
{
	/* USER CODE BEGIN Thread_SensorEntry */
//	IMUData_t wt931_data;
//	CarbinData_t gy39_data;
	/* Infinite loop */
	for (;;)
	{
//		xQueueReceive(GY39_QueueHandle, &gy39_data, 0);
//		xQueueReceive(WT931_QueueHandle, &wt931_data, 0);

		osDelay(1);
	}
	/* USER CODE END Thread_SensorEntry */
}

/* Private application code --------------------------------------------------*/
/* USER CODE BEGIN Application */

PwmVal_t ControlDataAnalysis(ControlData_t controller)
{
	PwmVal_t temp_pwm;
	static uint8_t IS_SIDEPUSH = 0;
	static uint8_t special_mode = 0;

	if (controller.Mode & 0x01 == 1)
	{
		IS_SIDEPUSH = SIDEPUSH_MODE;
	}
	else
	{
		IS_SIDEPUSH = NORMAL_MODE;
	}

	temp_pwm = MoveControl(controller.StraightNum, controller.RotateNum,
			controller.VerticalNum, special_mode);
	temp_pwm.LightServo = controller.LightNum;
	temp_pwm.PanServo = controller.PanNum;
	temp_pwm.ConveyServo = controller.ConveyNum;
	temp_pwm.ArmServo[0] = controller.ArmNum[0]; //Horizental
	temp_pwm.ArmServo[1] = controller.ArmNum[1]; //Main
	temp_pwm.ArmServo[2] = controller.ArmNum[2]; //Middle
	temp_pwm.ArmServo[3] = controller.ArmNum[3]; //Front
	temp_pwm.ArmServo[4] = controller.ArmNum[4]; //Grab
	temp_pwm.ArmServo[5] = controller.ArmNum[5]; //rest

	return temp_pwm;
}

/* USER CODE END Application */