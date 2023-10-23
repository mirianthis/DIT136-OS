#include <stdio.h>
#include <stdlib.h>
main()
{
    printf("Process started: PID=%d, PPID=%d \n",
            getpid(),getppid());
}
