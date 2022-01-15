   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.5 - 16 Jun 2021
   3                     ; Generator (Limited) V4.5.3 - 16 Jun 2021
   4                     ; Optimizer V4.5.3 - 16 Jun 2021
  83                     ; 58 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  83                     ; 59 {
  85                     .text:	section	.text,new
  86  0000               _IWDG_WriteAccessCmd:
  90                     ; 61   assert_param(IS_IWDG_WRITEACCESS_MODE(IWDG_WriteAccess));
  92                     ; 62   IWDG->KR = (uint8_t)IWDG_WriteAccess; /* Write Access */
  94  0000 c750e0        	ld	20704,a
  95                     ; 63 }
  98  0003 81            	ret	
 188                     ; 79 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
 188                     ; 80 {
 189                     .text:	section	.text,new
 190  0000               _IWDG_SetPrescaler:
 194                     ; 82   assert_param(IS_IWDG_PRESCALER_VALUE(IWDG_Prescaler));
 196                     ; 83   IWDG->PR = (uint8_t)IWDG_Prescaler;
 198  0000 c750e1        	ld	20705,a
 199                     ; 84 }
 202  0003 81            	ret	
 236                     ; 93 void IWDG_SetReload(uint8_t IWDG_Reload)
 236                     ; 94 {
 237                     .text:	section	.text,new
 238  0000               _IWDG_SetReload:
 242                     ; 95   IWDG->RLR = IWDG_Reload;
 244  0000 c750e2        	ld	20706,a
 245                     ; 96 }
 248  0003 81            	ret	
 271                     ; 104 void IWDG_ReloadCounter(void)
 271                     ; 105 {
 272                     .text:	section	.text,new
 273  0000               _IWDG_ReloadCounter:
 277                     ; 106   IWDG->KR = IWDG_KEY_REFRESH;
 279  0000 35aa50e0      	mov	20704,#170
 280                     ; 107 }
 283  0004 81            	ret	
 306                     ; 114 void IWDG_Enable(void)
 306                     ; 115 {
 307                     .text:	section	.text,new
 308  0000               _IWDG_Enable:
 312                     ; 116   IWDG->KR = IWDG_KEY_ENABLE;
 314  0000 35cc50e0      	mov	20704,#204
 315                     ; 117 }
 318  0004 81            	ret	
 331                     	xdef	_IWDG_Enable
 332                     	xdef	_IWDG_ReloadCounter
 333                     	xdef	_IWDG_SetReload
 334                     	xdef	_IWDG_SetPrescaler
 335                     	xdef	_IWDG_WriteAccessCmd
 354                     	end
