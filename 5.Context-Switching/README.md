# Context Switching
- On FreeRTOS you can also trigger context switch manually using **taskYIELD()** macro
- Kernel mode comes when we execute the SysTick Timer (and its Interrupt Handler), PendSV Code (i.e when Scheduler run ) etc.
![Screenshot from 2024-05-11 13-11-44](https://github.com/PranabNandy/FreeRTOS/assets/34576104/655e2304-eede-4cdf-887f-a7316a20329d)
![Screenshot from 2024-05-11 13-09-05](https://github.com/PranabNandy/FreeRTOS/assets/34576104/1cb26f5d-d790-428e-aa33-1c022fce779e)
![Screenshot from 2024-05-11 13-09-19](https://github.com/PranabNandy/FreeRTOS/assets/34576104/f50ea482-c43f-47e0-a506-3d7402fbb366)

## Task switching out procedure
Before task is switched out , following things have to be taken care.
1. Processor core registers R0,R1,R2,R3,R12,LR,PC,xPSR(stack frame) are saved on to the task’s private stack automatically by the processor SysTick interrupt entry sequence.
2. If Context Switch is required then **SysTick timer** will pend the **PendSV Exception** and **PendSV handler** runs
3. Processor core registers (R4-R11, R14) have to be saved manually on the task’s private stack memory (Saving the context )
4. Save the new top of stack value (PSP) into first member of the TCB
5. Select the next potential Task to execute on the CPU. Taken care by **vTaskSwitchContext()** implemented in tasks.c

![Screenshot from 2024-05-11 15-22-30](https://github.com/PranabNandy/FreeRTOS/assets/34576104/5bcf4e61-de1c-4579-97c0-3de7c18cfa06)

## Unstacking Part 
So, at this time, we already know which task(TCB) should be switched in.That means new switchable task’s TCB can be accessed by pxCurrentTCB
1. First get the address of top of the stack. Copy the value of pxTopOfStack in to PSP register
2. Pop all the registers (R4-R11, R14) (Restoring the context )
3. Exception exit: Now PSP is pointing to the start address of the stack frame which will be popped out automatically due to exception exit.

![Screenshot from 2024-05-11 16-48-02](https://github.com/PranabNandy/FreeRTOS/assets/34576104/95d036f0-05a8-4399-8462-81a0d84f4772)

