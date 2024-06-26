# Scheduler 

#### Why do we need Scheduler ?
1. It just a piece of code which implements task switching in and Task switching out according to the scheduling policy selected.
2. The basic job of the scheduler is to determine which is the next potential taskto run on the CPU

#### Scheduling Policies ( Scheduler types )
1. simple Pre-emptive Scheduling (Round robin )
2. Priority based Pre-Emptive Scheduling
3. Co-operative Scheduling

   
- `It creates 2 task`
  + Idle Task
  + Timer Service Task ( Timer Svc)
 

## Idle Task
- It is the lowest priority task which is automatically created when the scheduler is started
- The idle task is responsible for freeing memory allocated by the RTOS to tasks that have been deleted
- When there are no tasks running, the Idle task will always run on the CPU.
- You can give an application hook function in the idle task to send the CPU to low power mode when there are no useful tasks are executing.
  
![Screenshot from 2024-05-11 09-46-00](https://github.com/PranabNandy/FreeRTOS/assets/34576104/9cb761d6-d0e8-4909-ad85-fe593c8c1586)

- Idle task hook function implements a callback from idle task to your application
- You have to enable the idle task hook function feature by setting this config item configUSE_TICK_HOOK to 1 within FreeRTOSConfig.h
- Then implement the below function in your application
  + **void vApplicationIdleHook( void );**
- That’s it , whenever idle task is allowed to run, your hook function will get called, where you can do some useful stuffs like sending the MCU to lower mode to save power
- When the hook function is called, care must be taken that the idle hook function does not call any API functions that could cause it to block
![Screenshot from 2024-05-11 10-18-34](https://github.com/PranabNandy/FreeRTOS/assets/34576104/58acc8c1-0a7b-4b8f-bb3b-df791467b320)

  
## Timer Services Task (Timer_svc)
- This is also called as timer daemon task
- The timer daemon task deals with **Software timers**
- This task is created automatically when the scheduler is started and if **configUSE_TIMERS =1** in `FreeRTOSConfig.h`
- The RTOS uses this daemon to manage FreeRTOS software timers and nothing else.
- If you don't use software timers in your FreeRTOS application then you need to use this Timer daemon task. For that just make **configUSE_TIMERS = 0** in `FreeRTOSConfig.h`
- All software timer callback functions execute in the context of the timer daemon task

  
### vPortSVCHandler()
- It only used once in the entire program execution
- **PendSV Handler** working as an Scheduler
- **Sys Tick Handler** working as SysTick Timer 
![Screenshot from 2024-05-11 10-44-13](https://github.com/PranabNandy/FreeRTOS/assets/34576104/63dbd2d7-150a-4d5a-ada6-6ece3b2ff8ad)
![Screenshot from 2024-05-11 10-44-25](https://github.com/PranabNandy/FreeRTOS/assets/34576104/1760234c-4b48-4a3e-8def-9202967d9b17)
![Screenshot from 2024-05-11 10-42-21](https://github.com/PranabNandy/FreeRTOS/assets/34576104/907eeeaa-0b12-4f33-883c-53fc853c380e)

### vTaskStartScheduler()
- This is implemented in `tasks.c` of FreeRTOS kernel and used to start the RTOS scheduler.
- Remember that after calling this function only the scheduler code is initialized and all the Arch. Specific interrupts will be activated.
- This function also creates the idle and Timer daemon task
- This function calls `xPortStartScheduler()` to do the Arch. Specific Initializations
![Screenshot from 2024-05-11 11-31-12](https://github.com/PranabNandy/FreeRTOS/assets/34576104/121233c6-8ca9-4deb-ba58-73630d65f3e6)

![Screenshot from 2024-05-11 11-36-32](https://github.com/PranabNandy/FreeRTOS/assets/34576104/5a2e6960-25af-49b1-a674-269a314d055f)

### FreeRTOS Kernel interrupts
When FreeRTOS runs on ARM Cortex Mx Processor based MCU, below interrupts are used to implement the Scheduling of Tasks.
1. SVC Interrupt ( SVC handler will be used to launch the very first Task )
2. PendSV Interrupt (PendSV handler is used to carry out context switching between tasks )
3. SysTick Interrupt ( SysTick Handler implements the RTOS Tick Management)
   
If SysTick interrupt is used for some other purpose in your application, then you may use any other available timer peripheral
All interrupts are configured at the lowest interrupt priority possible.

### The RTOS Tick- Why it is needed ?
- The simple answer is to keep track of time elapsed
- There is a global variable called **xTickCount**, and it is incremented by one whenever tick interrupt occurs
- RTOS Ticking is implemented using `SysTick timer` of the `ARM Cortex Mx` processor.
- Tick interrupt happens at the rate of **configTICK_RATE_HZ** configured in the `FreeRTOSConfig.h`
  
![Screenshot from 2024-05-11 12-02-01](https://github.com/PranabNandy/FreeRTOS/assets/34576104/f1766813-b0d9-40ea-bcd8-50fc56f628be)

![Screenshot from 2024-05-11 12-48-26](https://github.com/PranabNandy/FreeRTOS/assets/34576104/c6ae3057-d965-4666-9529-9a8fc879db34)

![Screenshot from 2024-05-11 12-51-39](https://github.com/PranabNandy/FreeRTOS/assets/34576104/9f54f1a8-2b20-4361-ae9b-645cf5e78839)

## Context Switching
  
