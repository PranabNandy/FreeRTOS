## Mutex vs Binary Semaphore
- Yes both are exactly same, but mutex can minimize the effect of priority inversion by using priority inheritance technique.


- binary semaphore can be used for synchronization between interrupt and task

- Neither mutex or semaphore disables the interrupt


Let's say in a RTOS application, person 'A' implements Task A and person 'B' implements Task B, and there is a shared resource, now what is the best strategy to protect the access to the shared resource ?
- Disable the interrupt before accessing the shared resources and enable it after that



If Task-1 takes the semaphore, then any random Task of that application can 'give' it ?
- As long as the semaphore handle is accessible(global), any one can 'give' or 'take' using that handle.


Lets say Task-1 locks the critical section by taking the semaphore , do you think a random Task-2 can able to access that critical section without taking the semaphore ?
- Yes of course, no one can stop Task-2 to access that critical section, if Task-1 is worried about this it has to disable the interrupt before accessing the critical section.

  
