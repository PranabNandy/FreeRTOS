
## 3. Setup SEGGER SystemView
### Step 1: Download
- Download SW here:
```
https://www.segger.com/downloads/systemview/
````
- Download target source Files:
```
https://www.segger.com/downloads/systemview/SystemView_Src_V320.zip.sig
```
- Download the User Manual also : For the references
```C++
 if("Not_Downloaded"){
         char UserManual;
         cout<<"Download it"<<endl;
 }
```

## Some ScreenShot of System View Software
### Timeline
![Screenshot from 2024-05-10 11-43-13](https://github.com/PranabNandy/FreeRTOS/assets/34576104/86069f92-e059-4e4b-9490-9b3ae56781f5)

### CPU load
![Screenshot from 2024-05-10 14-48-49](https://github.com/PranabNandy/FreeRTOS/assets/34576104/8d65e01a-0cc0-4458-a36e-241434e8eb01)

### Contexts
![Screenshot from 2024-05-10 14-53-21](https://github.com/PranabNandy/FreeRTOS/assets/34576104/a30be37c-72fa-4b88-9a90-109c0ab62f65)

### Terminal
![Screenshot from 2024-05-10 14-53-42](https://github.com/PranabNandy/FreeRTOS/assets/34576104/5c8a3cd4-37e2-4da2-85b6-07fe6f911ac4)



### Step 2: Including SEGGER SystemView in the application
- Copy below to `/Config`
```sh
echo 'Just Follow this process' | echo 'Trust me'

cp /SystemView_Src_V320/Sample/FreeRTOSV10/Config/Cortex-M/SEGGER_SYSVIEW_Config_FreeRTOS.c /SystemView_Src_V320/Config/*
```
- Copy below to `/OS`
```cpp
/SystemView_Src_V320/Sample/FreeRTOSV10/SEGGER_SYSVIEW_FreeRTOS.c
/SystemView_Src_V320/Sample/FreeRTOSV10/SEGGER_SYSVIEW_FreeRTOS.h
```
- Copy below to `/Patch/FreeRTOSv10`
```cpp
/SystemView_Src_V320/Sample/FreeRTOSV10/Patch/FreeRTOSV10_Core.patch
```
- Copy below to `/SEGGER`
```cpp
/SystemView_Src_V320/SEGGER/SEGGER.h
/SystemView_Src_V320/SEGGER/SEGGER_RTT.c
/SystemView_Src_V320/SEGGER/SEGGER_RTT.h
/SystemView_Src_V320/SEGGER/SEGGER_SYSVIEW.c
/SystemView_Src_V320/SEGGER/SEGGER_SYSVIEW.h
/SystemView_Src_V320/SEGGER/SEGGER_RTT_ASM_ARMv7M.S   ---> set this path for assembler
/SystemView_Src_V320/SEGGER/SEGGER_SYSVIEW_ConfDefaults.h
/SystemView_Src_V320/SEGGER/SEGGER_SYSVIEW_Int.h		
```
- Include header file (Don't forget)
#### Compiler include path
![Screenshot from 2024-05-10 17-31-43](https://github.com/PranabNandy/FreeRTOS/assets/34576104/679ecd68-8fb6-4578-9198-8ba4d7fbfe97)

#### Assembler include path
![Screenshot from 2024-05-10 17-32-56](https://github.com/PranabNandy/FreeRTOS/assets/34576104/cd5fee03-ccef-4e12-b5de-e3ce12ad999a)

```cpp
Third_Party
└── SEGGER
	├── Config
	│   ├── Global.h
	│   ├── SEGGER_RTT_Conf.h
	│   ├── SEGGER_SYSVIEW_Conf.h
	│   └── SEGGER_SYSVIEW_Config_FreeRTOS.c
	├── OS
	│   ├── SEGGER_SYSVIEW_FreeRTOS.c
	│   └── SEGGER_SYSVIEW_FreeRTOS.h
	├── Patch
	│   └── FreeRTOSv10_1
	│       └── FreeRTOSV10_Core.patch
	└── SEGGER
             ├── Syscalls
                  └──  SEGGER_RTT_Syscalls_GCC.c
	     ├── SEGGER.h
	     └── SEGGER_RTT_ASM_ARMv7M.S
             └── SEGGER_RTT.c
	     └── SEGGER_RTT.h
	     └── SEGGER_SYSVIEW.c
	     └── SEGGER_SYSVIEW_ConfDefaults.h
	     └── SEGGER_SYSVIEW.h
	     └── SEGGER_SYSVIEW_Int.h
```

### Step 3: Patching FreeRTOS files
- You need to patch some of the FreeRTOS files with patch file given by SEGGER systemView
- FreeRTOS folder > right click > Team > Apply patch > include patch file > finish
**Note:** Apply to OpenSTM32 System Workbench

### Step 4: Reconfigure FreeRTOSConfig.h
- `SEGGER_SYSVIEW_FreeRTOS.h` has to be included at the end of `FreeRTOSConfig.h` or obove every include of `FreeRTOS.h`
- Include the below macros
```
#define INCLUDE_xTaskGetIdleTaskHandle 1 
#define INCLUDE_pxTaskGetStackTask 1
```

### Step 5: MCU and Project specific settings
- `SEGGER_SYSVIEW_ConfDefaults.h`: Mention which processor core your MCU
```
#Line 123: SEGGER_SYSVIEW_CORE_OTHER → SEGGER_SYSVIEW_CORE_CM3
```
- Buffer size configuration in (`SEGGER_SYSVIEW_RTT_BUFFER_SIZE	 1024 * 8`)
- Configure the some of the app info in `SEGGER_SYSVIEW_Config_FreeRTOS.c`
```
#define SYSVIEW_APP_NAME        "FreeRTOS Hello-World"
#define SYSVIEW_DEVICE_NAME     "STM32F44CRE"
#define SYSVIEW_RAM_BASE        (0x20000000)
```

### Step 6: Enable the ARM Cortex Mx Cycle Counter (default disable)
- This is required to maintain the time stamp information of application events. SystemView will use the Cycle counter register value to maintain the time stamp information of events.
- `DWT_CYCCNT` register of ARM Cortex Mx processor stores number of clock cycles that have happened after the reset of the processor
![Screenshot from 2024-05-10 17-24-44](https://github.com/PranabNandy/FreeRTOS/assets/34576104/159cbd01-73d8-435a-9461-48f4a21bbbad)

```cpp
/* Enable cycles counter in DWT_CYCCNT regiter */
DWT->CTRL |= (1 << 0);
```

### Step 7: Start the recording of events
- To start the recordings of your FreeTOS application, call the below SEGGER APIs:
```
SEGGER_SYSVIEW_Conf();
SEGGER_SYSVIEW_Start();
```

### Step 8: Compile , Flash and Debug
