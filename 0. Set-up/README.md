<h1>  FreeRTOS SetUp </h1>

- Here We will be directly using the FreeRTOS kernel
- If we use device config tools in STM32Cube then CMSIS-API comes into the picture
- Our Focus is to learn the RTOS kernel only
  
![Screenshot from 2024-04-28 11-01-53](https://github.com/PranabNandy/FreeRTOS/assets/34576104/17493623-1b48-4b7e-be31-922a3098e0f5)

- Some examples of CMSIS-API to create some task
- This is our overall project layer

![Screenshot from 2024-04-28 11-14-07](https://github.com/PranabNandy/FreeRTOS/assets/34576104/7cf0da76-1fae-4757-b893-361d29d73a02)
![Screenshot from 2024-04-28 11-12-31](https://github.com/PranabNandy/FreeRTOS/assets/34576104/06f6409d-17fd-42c0-a0e0-6cc143cef749)
![Screenshot from 2024-04-29 00-22-05](https://github.com/PranabNandy/FreeRTOS/assets/34576104/1992186a-0b44-464c-8413-bb0f025ac48e)


## Snapshot of STM32Cube
![Screenshot from 2024-04-28 23-03-56](https://github.com/PranabNandy/FreeRTOS/assets/34576104/0464c188-a3fa-41f0-915f-e242a3ad5ccd)
- **How to include a file/ Library**
- 
![Screenshot from 2024-04-28 22-37-10](https://github.com/PranabNandy/FreeRTOS/assets/34576104/a11a3fb0-3d55-4dcf-aad6-a471136373a5)
- **Now we have to add RTOS header files path**
-
![Screenshot from 2024-04-28 23-18-40](https://github.com/PranabNandy/FreeRTOS/assets/34576104/d09e5fed-583d-4948-b8a5-6f57e5bb11ee)

- **Now add the FreeRTOSConfig.h header file and add it also in the include path**
- We can take this file **FreeRTOSv202212.01/FreeRTOS/Demo/CORTEX_M4F_STM32F407ZG-SK** from here
- These are the error we will face and we have to resolve it in this way
![Screenshot from 2024-04-28 23-59-45](https://github.com/PranabNandy/FreeRTOS/assets/34576104/89792bd5-5513-48ba-8dc3-49c89b80918b)
![Screenshot from 2024-04-29 00-05-14](https://github.com/PranabNandy/FreeRTOS/assets/34576104/dbcdb000-5611-41d3-9331-b76731bcef6f)

- **Time based source conflicts between RTOS and HAL code base**
- These are the changes we have to do
- because of that a new file will be created

 ![Screenshot from 2024-04-29 23-52-55](https://github.com/PranabNandy/FreeRTOS/assets/34576104/6949c8bc-dc67-468f-a4f8-815f232de747)
![Screenshot from 2024-04-29 23-59-51](https://github.com/PranabNandy/FreeRTOS/assets/34576104/b60147d9-0137-4050-a98d-feb51ce4b65b)
![Screenshot from 2024-04-30 00-00-06](https://github.com/PranabNandy/FreeRTOS/assets/34576104/259be2e6-89f9-4e08-bbcc-4b99d7597b03)

 ![Screenshot from 2024-04-30 00-00-28](https://github.com/PranabNandy/FreeRTOS/assets/34576104/34c6ac5c-ea12-4cb8-ac33-79e0e7f78724)

