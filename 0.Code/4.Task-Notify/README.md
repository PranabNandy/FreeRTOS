## Hardware Priority vs Thread Execution
Lets say the Task-1 is executing on the CPU whose Priority is 3 . Now processor hits with an 
interrupt of the USART Tx  whose priority is 2 , will Task1 be  preempted?
Lets assume : lower numerical number of priority resembles lesser priority and ARM cortex M processor

- Yes ! Thread mode executions can always be preempted irrespective of their priorities by the hardware interrupts which execute in the handler mode.

In other words, do you think interrupt nesting will happen ? 
- Yes it happens in RTOS

In FreeRTOS whoever unblocks the blocked task should also check whether the unblocked task has got the higher priority than the currently running task. If true, then the task **yield function** has to be called to make sure that, the newly unblocked higher-priority task immediately takes over the CPU.


![Screenshot from 2024-06-12 22-54-52](https://github.com/PranabNandy/FreeRTOS/assets/34576104/98c6b552-30d1-41d7-b12e-2ac2fbdf0286)

## when to use ISR API call ?
![Screenshot from 2024-06-12 22-56-08](https://github.com/PranabNandy/FreeRTOS/assets/34576104/8e379c92-3a8f-4c88-b911-bdd64f48d5ae)

## User Button is connected to EXTI Line 0
![Screenshot from 2024-06-12 23-03-44](https://github.com/PranabNandy/FreeRTOS/assets/34576104/b42cab80-61f0-46aa-aa21-89970eb8a5dc)

## These are the system configuration setting that needs to be done
![Screenshot from 2024-06-15 12-11-18](https://github.com/PranabNandy/FreeRTOS/assets/34576104/a1e3e1f3-057b-42b3-be21-49e8639df81b)

![Screenshot from 2024-06-15 12-16-46](https://github.com/PranabNandy/FreeRTOS/assets/34576104/f54bea45-00ee-4dbd-a345-1ec093685f53)
