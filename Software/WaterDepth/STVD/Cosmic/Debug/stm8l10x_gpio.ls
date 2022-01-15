   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.5 - 16 Jun 2021
   3                     ; Generator (Limited) V4.5.3 - 16 Jun 2021
   4                     ; Optimizer V4.5.3 - 16 Jun 2021
 114                     ; 57 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 114                     ; 58 {
 116                     .text:	section	.text,new
 117  0000               _GPIO_DeInit:
 121                     ; 59   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 123  0000 7f            	clr	(x)
 124                     ; 60   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 126  0001 6f02          	clr	(2,x)
 127                     ; 61   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 129  0003 6f03          	clr	(3,x)
 130                     ; 62   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 132  0005 6f04          	clr	(4,x)
 133                     ; 63 }
 136  0007 81            	ret	
 292                     ; 98 void GPIO_Init(GPIO_TypeDef* GPIOx,
 292                     ; 99                uint8_t GPIO_Pin,
 292                     ; 100                GPIO_Mode_TypeDef GPIO_Mode)
 292                     ; 101 {
 293                     .text:	section	.text,new
 294  0000               _GPIO_Init:
 296  0000 89            	pushw	x
 297       00000000      OFST:	set	0
 300                     ; 106   assert_param(IS_GPIO_MODE(GPIO_Mode));
 302                     ; 107   assert_param(IS_GPIO_PIN(GPIO_Pin));
 304                     ; 113   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 306  0001 7b06          	ld	a,(OFST+6,sp)
 307  0003 2a16          	jrpl	L541
 308                     ; 115     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 310  0005 a510          	bcp	a,#16
 311  0007 2705          	jreq	L741
 312                     ; 117       GPIOx->ODR |= GPIO_Pin;
 314  0009 f6            	ld	a,(x)
 315  000a 1a05          	or	a,(OFST+5,sp)
 317  000c 2004          	jra	L151
 318  000e               L741:
 319                     ; 120       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 321  000e 7b05          	ld	a,(OFST+5,sp)
 322  0010 43            	cpl	a
 323  0011 f4            	and	a,(x)
 324  0012               L151:
 325  0012 f7            	ld	(x),a
 326                     ; 123     GPIOx->DDR |= GPIO_Pin;
 328  0013 1e01          	ldw	x,(OFST+1,sp)
 329  0015 e602          	ld	a,(2,x)
 330  0017 1a05          	or	a,(OFST+5,sp)
 332  0019 2005          	jra	L351
 333  001b               L541:
 334                     ; 127     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 336  001b 7b05          	ld	a,(OFST+5,sp)
 337  001d 43            	cpl	a
 338  001e e402          	and	a,(2,x)
 339  0020               L351:
 340  0020 e702          	ld	(2,x),a
 341                     ; 134   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 343  0022 7b06          	ld	a,(OFST+6,sp)
 344  0024 a540          	bcp	a,#64
 345  0026 2706          	jreq	L551
 346                     ; 136     GPIOx->CR1 |= GPIO_Pin;
 348  0028 e603          	ld	a,(3,x)
 349  002a 1a05          	or	a,(OFST+5,sp)
 351  002c 2005          	jra	L751
 352  002e               L551:
 353                     ; 139     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 355  002e 7b05          	ld	a,(OFST+5,sp)
 356  0030 43            	cpl	a
 357  0031 e403          	and	a,(3,x)
 358  0033               L751:
 359  0033 e703          	ld	(3,x),a
 360                     ; 146   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 362  0035 7b06          	ld	a,(OFST+6,sp)
 363  0037 a520          	bcp	a,#32
 364  0039 2706          	jreq	L161
 365                     ; 148     GPIOx->CR2 |= GPIO_Pin;
 367  003b e604          	ld	a,(4,x)
 368  003d 1a05          	or	a,(OFST+5,sp)
 370  003f 2005          	jra	L361
 371  0041               L161:
 372                     ; 151     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 374  0041 7b05          	ld	a,(OFST+5,sp)
 375  0043 43            	cpl	a
 376  0044 e404          	and	a,(4,x)
 377  0046               L361:
 378  0046 e704          	ld	(4,x),a
 379                     ; 154 }
 382  0048 85            	popw	x
 383  0049 81            	ret	
 429                     ; 163 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t GPIO_PortVal)
 429                     ; 164 {
 430                     .text:	section	.text,new
 431  0000               _GPIO_Write:
 433       fffffffe      OFST: set -2
 436                     ; 165   GPIOx->ODR = GPIO_PortVal;
 438  0000 7b03          	ld	a,(OFST+5,sp)
 439  0002 f7            	ld	(x),a
 440                     ; 166 }
 443  0003 81            	ret	
 603                     ; 185 void GPIO_WriteBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, BitAction GPIO_BitVal)
 603                     ; 186 {
 604                     .text:	section	.text,new
 605  0000               _GPIO_WriteBit:
 607       fffffffe      OFST: set -2
 610                     ; 188   assert_param(IS_GPIO_PIN(GPIO_Pin));
 612                     ; 189   assert_param(IS_STATE_VALUE(GPIO_BitVal));
 614                     ; 191   if (GPIO_BitVal != RESET)
 616  0000 7b04          	ld	a,(OFST+6,sp)
 617  0002 2705          	jreq	L303
 618                     ; 194     GPIOx->ODR |= GPIO_Pin;
 620  0004 f6            	ld	a,(x)
 621  0005 1a03          	or	a,(OFST+5,sp)
 623  0007 2004          	jra	L503
 624  0009               L303:
 625                     ; 199     GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 627  0009 7b03          	ld	a,(OFST+5,sp)
 628  000b 43            	cpl	a
 629  000c f4            	and	a,(x)
 630  000d               L503:
 631  000d f7            	ld	(x),a
 632                     ; 201 }
 635  000e 81            	ret	
 681                     ; 219 void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 681                     ; 220 {
 682                     .text:	section	.text,new
 683  0000               _GPIO_SetBits:
 685       fffffffe      OFST: set -2
 688                     ; 221   GPIOx->ODR |= GPIO_Pin;
 690  0000 f6            	ld	a,(x)
 691  0001 1a03          	or	a,(OFST+5,sp)
 692  0003 f7            	ld	(x),a
 693                     ; 222 }
 696  0004 81            	ret	
 742                     ; 240 void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 742                     ; 241 {
 743                     .text:	section	.text,new
 744  0000               _GPIO_ResetBits:
 746       fffffffe      OFST: set -2
 749                     ; 242   GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 751  0000 7b03          	ld	a,(OFST+5,sp)
 752  0002 43            	cpl	a
 753  0003 f4            	and	a,(x)
 754  0004 f7            	ld	(x),a
 755                     ; 243 }
 758  0005 81            	ret	
 804                     ; 252 void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 804                     ; 253 {
 805                     .text:	section	.text,new
 806  0000               _GPIO_ToggleBits:
 808       fffffffe      OFST: set -2
 811                     ; 254   GPIOx->ODR ^= GPIO_Pin;
 813  0000 f6            	ld	a,(x)
 814  0001 1803          	xor	a,(OFST+5,sp)
 815  0003 f7            	ld	(x),a
 816                     ; 255 }
 819  0004 81            	ret	
 856                     ; 263 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 856                     ; 264 {
 857                     .text:	section	.text,new
 858  0000               _GPIO_ReadInputData:
 862                     ; 265   return ((uint8_t)GPIOx->IDR);
 864  0000 e601          	ld	a,(1,x)
 867  0002 81            	ret	
 905                     ; 274 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 905                     ; 275 {
 906                     .text:	section	.text,new
 907  0000               _GPIO_ReadOutputData:
 911                     ; 276   return ((uint8_t)GPIOx->ODR);
 913  0000 f6            	ld	a,(x)
 916  0001 81            	ret	
 965                     ; 295 BitStatus GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 965                     ; 296 {
 966                     .text:	section	.text,new
 967  0000               _GPIO_ReadInputDataBit:
 969       fffffffe      OFST: set -2
 972                     ; 297   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 974  0000 e601          	ld	a,(1,x)
 975  0002 1403          	and	a,(OFST+5,sp)
 978  0004 81            	ret	
1027                     ; 316 BitStatus GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1027                     ; 317 {
1028                     .text:	section	.text,new
1029  0000               _GPIO_ReadOutputDataBit:
1031       fffffffe      OFST: set -2
1034                     ; 318   return ((BitStatus)(GPIOx->ODR & (uint8_t)GPIO_Pin));
1036  0000 f6            	ld	a,(x)
1037  0001 1403          	and	a,(OFST+5,sp)
1040  0003 81            	ret	
1117                     ; 338 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, FunctionalState NewState)
1117                     ; 339 {
1118                     .text:	section	.text,new
1119  0000               _GPIO_ExternalPullUpConfig:
1121       fffffffe      OFST: set -2
1124                     ; 341   assert_param(IS_GPIO_PIN(GPIO_Pin));
1126                     ; 342   assert_param(IS_FUNCTIONAL_STATE(NewState));
1128                     ; 344   if (NewState != DISABLE) /* External Pull-Up Set*/
1130  0000 7b04          	ld	a,(OFST+6,sp)
1131  0002 2706          	jreq	L355
1132                     ; 346     GPIOx->CR1 |= GPIO_Pin;
1134  0004 e603          	ld	a,(3,x)
1135  0006 1a03          	or	a,(OFST+5,sp)
1137  0008 2005          	jra	L555
1138  000a               L355:
1139                     ; 349     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1141  000a 7b03          	ld	a,(OFST+5,sp)
1142  000c 43            	cpl	a
1143  000d e403          	and	a,(3,x)
1144  000f               L555:
1145  000f e703          	ld	(3,x),a
1146                     ; 351 }
1149  0011 81            	ret	
1162                     	xdef	_GPIO_ExternalPullUpConfig
1163                     	xdef	_GPIO_ReadOutputDataBit
1164                     	xdef	_GPIO_ReadInputDataBit
1165                     	xdef	_GPIO_ReadOutputData
1166                     	xdef	_GPIO_ReadInputData
1167                     	xdef	_GPIO_ToggleBits
1168                     	xdef	_GPIO_ResetBits
1169                     	xdef	_GPIO_SetBits
1170                     	xdef	_GPIO_WriteBit
1171                     	xdef	_GPIO_Write
1172                     	xdef	_GPIO_Init
1173                     	xdef	_GPIO_DeInit
1192                     	end
