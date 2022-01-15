# 电源仓的FPGA硬件设计

电源仓采用双主控方案

* A方案（保守方案）：老版本STM32H750方案
* B方案（折衷方案）：FPGA直接接收上位机发送的串口数据并控制PWM，STM32只负责传感器数据上传
* C方案（激进方案）：全部功能使用FPGA实现

~~为了不被硬件限制，使用了基于安路EG4S20的Sipeed TANG Primer核心板，内置20k LUT、130KB SRAM、64MB SDRAM、8MB 外置FLASH，完全能够驱动21路PWM+3路串口~~

使用基于高云GW-1NSR的Sipeed TANG nano 4k开发板，内置4k LUT和一个Cortex-M3硬核，只需要单5V供电，可驱动18路PWM+4路串口

如果以后有时间会考虑直接在设备中内置GW-1NSR核心

PWM使用FPGA直接控制，控制指令通过FPGA与M3硬核接口传输，传感器由M3硬核通过外挂UART读取上传，可以做到控制无延时

~~通过插入/不插入stm32即可调整模式~~

