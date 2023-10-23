#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
int main()
{
    int pid;
    printf("Process started: PID=%d, PPID=%d \n", getpid(),getppid());
    pid=fork();
    printf("In process with PID=%d fork returned %d \n", getpid(), pid);
}
