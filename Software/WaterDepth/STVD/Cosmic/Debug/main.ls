   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.5 - 16 Jun 2021
   3                     ; Generator (Limited) V4.5.3 - 16 Jun 2021
   4                     ; Optimizer V4.5.3 - 16 Jun 2021
  50                     ; 58 void main(void)
  50                     ; 59 {
  52                     .text:	section	.text,new
  53  0000               _main:
  57                     ; 61 		Hardware_Init();
  59  0000 cd0000        	call	_Hardware_Init
  61  0003               L12:
  62                     ; 65 			GPIO_ToggleBits(LED_GPIO_PORT, LED_GPIO_PINS);
  64  0003 4b04          	push	#4
  65  0005 ae5005        	ldw	x,#20485
  66  0008 cd0000        	call	_GPIO_ToggleBits
  68  000b 84            	pop	a
  70  000c 20f5          	jra	L12
 104                     ; 71 void Delay(__IO uint16_t nCount)
 104                     ; 72 {
 105                     .text:	section	.text,new
 106  0000               _Delay:
 108  0000 89            	pushw	x
 109       00000000      OFST:	set	0
 112  0001 2005          	jra	L54
 113  0003               L34:
 114                     ; 76     nCount--;
 116  0003 1e01          	ldw	x,(OFST+1,sp)
 117  0005 5a            	decw	x
 118  0006 1f01          	ldw	(OFST+1,sp),x
 119  0008               L54:
 120                     ; 74   while (nCount != 0)
 122  0008 1e01          	ldw	x,(OFST+1,sp)
 123  000a 26f7          	jrne	L34
 124                     ; 78 }
 127  000c 85            	popw	x
 128  000d 81            	ret	
 159                     ; 80 void Hardware_Init(void)
 159                     ; 81 {
 160                     .text:	section	.text,new
 161  0000               _Hardware_Init:
 165                     ; 86 	CLK_PeripheralClockConfig(CLK_Peripheral_I2C, ENABLE);
 167  0000 ae0801        	ldw	x,#2049
 168  0003 cd0000        	call	_CLK_PeripheralClockConfig
 170                     ; 87 	CLK_MasterPrescalerConfig(CLK_MasterPrescaler_HSIDiv1);
 172  0006 4f            	clr	a
 173  0007 cd0000        	call	_CLK_MasterPrescalerConfig
 175                     ; 88 	I2C_DeInit();
 177  000a cd0000        	call	_I2C_DeInit
 179                     ; 91   I2C_Init(
 179                     ; 92 			100000,
 179                     ; 93 			SLAVE_ADDRESS,
 179                     ; 94 			I2C_DutyCycle_2,
 179                     ; 95 			I2C_Ack_Enable, 
 179                     ; 96 			I2C_AcknowledgedAddress_7bit
 179                     ; 97 	);
 181  000d 4b00          	push	#0
 182  000f 4b04          	push	#4
 183  0011 4b00          	push	#0
 184  0013 ae0030        	ldw	x,#48
 185  0016 89            	pushw	x
 186  0017 ae86a0        	ldw	x,#34464
 187  001a 89            	pushw	x
 188  001b ae0001        	ldw	x,#1
 189  001e 89            	pushw	x
 190  001f cd0000        	call	_I2C_Init
 192  0022 5b09          	addw	sp,#9
 193                     ; 108 	I2C_ITConfig((I2C_IT_TypeDef)(I2C_IT_ERR | I2C_IT_EVT | I2C_IT_BUF), ENABLE);
 195  0024 4b01          	push	#1
 196  0026 ae0007        	ldw	x,#7
 197  0029 cd0000        	call	_I2C_ITConfig
 199  002c 84            	pop	a
 200                     ; 111 	GPIO_Init(LED_GPIO_PORT, LED_GPIO_PINS, GPIO_Mode_Out_PP_Low_Fast);
 202  002d 4be0          	push	#224
 203  002f 4b04          	push	#4
 204  0031 ae5005        	ldw	x,#20485
 205  0034 cd0000        	call	_GPIO_Init
 207  0037 85            	popw	x
 208                     ; 114 	GPIO_Init(KEY_GPIO_PORT, KEY_GPIO_PINS, GPIO_Mode_In_PU_IT);
 210  0038 4b60          	push	#96
 211  003a 4b01          	push	#1
 212  003c ae5005        	ldw	x,#20485
 213  003f cd0000        	call	_GPIO_Init
 215  0042 85            	popw	x
 216                     ; 115 	EXTI_SetPinSensitivity(EXTI_Pin_0, EXTI_Trigger_Falling_Low);
 218  0043 5f            	clrw	x
 219  0044 cd0000        	call	_EXTI_SetPinSensitivity
 221                     ; 118 	enableInterrupts();
 224  0047 9a            	rim	
 226                     ; 119 }
 230  0048 81            	ret	
 243                     	xdef	_main
 244                     	xdef	_Hardware_Init
 245                     	xdef	_Delay
 246                     	xref	_I2C_ITConfig
 247                     	xref	_I2C_Init
 248                     	xref	_I2C_DeInit
 249                     	xref	_GPIO_ToggleBits
 250                     	xref	_GPIO_Init
 251                     	xref	_EXTI_SetPinSensitivity
 252                     	xref	_CLK_MasterPrescalerConfig
 253                     	xref	_CLK_PeripheralClockConfig
 272                     	end
