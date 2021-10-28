# 电源仓的FPGA硬件设计

电源仓采用双主控方案

* A方案（保守方案）：老版本STM32H750方案
* B方案（折衷方案）：FPGA直接接收上位机发送的串口数据并控制PWM，STM32只负责传感器数据上传
* C方案（激进方案）：全部功能使用FPGA实现

为了不被硬件限制，使用了基于安路EG4S20的Sipeed TANG Primer核心板，内置20k LUT、130KB SRAM、64MB SDRAM、8MB 外置FLASH，完全能够驱动21路PWM+3路串口

通过插入/不插入stm32即可调整模式

