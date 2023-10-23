#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
int main()
{
    int pid,status;
    printf("Original Process: PID=%d, PPID=%d \n",
            getpid(),getppid());
    pid=fork();
    if (pid==-1) /*check for error*/
    {
        perror("fork");
        exit(1);
    }
    if (pid!=0) /*The parent process*/
    {
        printf("Parent Process: PID=%d \n", getpid());
        wait(&status);
        /*wait for child to exit*/
        printf("Child terminated : PID=%d, exit code=%d\n",
                pid,status>>8);
    }
    else /*The child process*/
    {
        printf("Child Process: PID=%d, PPID=%d \n",
                getpid(),getppid());
        sleep(3);
        exit(72); /*Exit with a silly number*/
    }
    printf("Process with PID=%d executed \n",getpid());
    /*Executed by parent only*/
}
