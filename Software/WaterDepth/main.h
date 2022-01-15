#ifndef __MAIN_H
#define __MAIN_H

#define USART_Slave
#define I2C_slave_7Bits_Address

#ifdef I2C_slave_7Bits_Address
#define SLAVE_ADDRESS 0x30
#else
#define SLAVE_ADDRESS 0x330
#endif

inline void Delay(uint32_t nCount);

#endif
