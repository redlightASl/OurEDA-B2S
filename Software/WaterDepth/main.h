#ifndef __MAIN_H
#define __MAIN_H

#define LED_GPIO_PORT  GPIOB
#define LED_GPIO_PINS  GPIO_Pin_2

/* definition of fast or default standard mode (bus speed up to 400 or 100 kHz) */
/* #define FAST_I2C_MODE */
#ifdef FAST_I2C_MODE
#define I2C_SPEED 300000
#else
#define I2C_SPEED 100000
#endif

/* definition of 10-bit or default 7-bit slave address */
/* #define TEN_BITS_ADDRESS */
#ifdef TEN_BITS_ADDRESS
#define SLAVE_ADDRESS  0x330
#else
#define SLAVE_ADDRESS  0x30
#endif

/* This define is used in master receiver */
/* Uncomment the line below if you want to use the safe procedure */
/* #define SAFE_PROCEDURE */

#define MASTER_ADDR								0xD0
#define MS5837_ADDR               0x76  
#define MS5837_RESET              0x1E
#define MS5837_ADC_READ           0x00
#define MS5837_PROM_READ          0xA0
#define MS5837_CONVERT_D1_8192    0x4A
#define MS5837_CONVERT_D2_8192    0x5A

#define Pa = (100.0f)
#define bar = (0.001f)
#define mbar = (1.0f)

#define MS5837_30BA = 0
#define MS5837_02BA = 1

#define BUFFERSIZE 8


typedef enum {FAILED = 0, PASSED = !FAILED} TestStatus;

struct MS5837_Data{
	uint32_t pressure;
	uint32_t temperature;
	uint32_t depth;
	uint32_t altitude;
};



#endif
