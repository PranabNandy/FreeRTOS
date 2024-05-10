## 1. What is SEGGER SystemView ?
- SystemView is a software toolkit which is used to analyze the embedded software behaviour running on your target.
- The SystemView can be used to analyze how your embedded code is behaving on the target:
	+ You can analyze **how many tasks** are running and how much duration they consume on the CPU
	+ **ISR entry and exit** timings and duration of run on the CPU
	+ You can analyze other behaviours of tasks: like blocking, unblocking, notifying, yielding, etc
	+ You can analyze **CPU idle time** so that you can think of sending CPU to sleed mode
	+ Total runtime behavior of the application 
	+ It sheds light on what exactly happened in which order, which interrupt has triggered which task switch, **which interrupt and task has called** which API function of the underlying RTOS
	+ SystemView should be used to verify that the embedded system behaves as expected and can be used to find problems and inefficiencies, such as superfluous and spurious interrupts, and unexpected task changes

![Screenshot from 2021-02-04 22-09-36](https://user-images.githubusercontent.com/32474027/106897033-ba369900-6735-11eb-972f-d5ee2adcb005.png)

## 2. SystemView visualization modes
### 1. Real time recording (Continuous recording)
- With a SEGGER `J-Link` and its `Real Time Transfer (RTT) technology` SystemView can continuously record data, and analyze and visualize it in real time
- Real time mode can be achieved `via ST-link` instead of J-link . For that J-link firmware has to be flashed on ST-link circuitry of STM32 boards

![Screenshot from 2021-02-04 22-13-44](https://user-images.githubusercontent.com/32474027/106897460-4f399200-6736-11eb-9b80-a66ed2e52ed3.png)

### 2. Single-shot recording  { Mostly we will be using this one }
- You `need not to have JLINK or STLINK debugger` for this
- In single-shot mode the recording is started manually in the application, which allows recording only specific parts, which are of interest

![Screenshot from 2021-02-04 22-14-39](https://user-images.githubusercontent.com/32474027/106897538-65dfe900-6736-11eb-9abe-c7780b6463cb.png)

