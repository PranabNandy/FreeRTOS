## Interrupt Priority



![Screenshot from 2024-06-08 11-28-24](https://github.com/PranabNandy/FreeRTOS/assets/34576104/7ee9c94a-e259-4342-9b61-edb3f3a795d4)

### How a hardware priority is different than Task priority

![Screenshot from 2024-06-08 11-28-24](https://github.com/PranabNandy/FreeRTOS/assets/34576104/2e66bdae-4fe3-45a3-8efc-512271abbbf1)


![Screenshot from 2024-06-08 11-31-07](https://github.com/PranabNandy/FreeRTOS/assets/34576104/e6e165e9-18f2-4266-824f-5d656d3263d4)

### Priority Registers:
- It defines the number of priorities in the system
  
![Screenshot from 2024-06-12 00-13-46](https://github.com/PranabNandy/FreeRTOS/assets/34576104/8ec5ed8f-111e-42f5-961a-acab6e50f5ad)


## Kernel Interrupt Priority vs Sys Call Interrupt Priority
![Screenshot from 2024-06-12 17-13-52](https://github.com/PranabNandy/FreeRTOS/assets/34576104/a28cb731-46cc-4e27-b840-c652df4c7c15)
![Screenshot from 2024-06-12 17-15-36](https://github.com/PranabNandy/FreeRTOS/assets/34576104/3e055e5f-b5c7-4778-a03c-5cfc9bdaa1e5)
![Screenshot from 2024-06-12 17-18-27](https://github.com/PranabNandy/FreeRTOS/assets/34576104/70d21ff1-f3da-4665-aa19-38e869a8d8d5)

# Conclude 
- 0x00 means Higher Priority
- 0xF0 means lower Priority
- MAX_SYSCALL_INTERRUPT_PRIORITY = 0x50
- The interrupt between (0x0 to 0x40) has `higher priorty interrupt` i.e **can not use** FreeRTOS APIs
- The interrupt between (0x60 to 0xF0) has `lower priorty interrupt` i.e **can use** FreeRTOS APIs
