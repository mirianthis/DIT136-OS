#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
int main()
{
    int pid;
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
        printf("Parent Process: PID=%d,PPID=%d,CPID=%d\n",
                getpid(),getppid(),pid);
		sleep(100);
    }
    else /*The child process*/
    {
        printf("Child Process: PID=%d, PPID=%d \n",
                getpid(),getppid());
    }
    printf("In process with PID=%d fork returned %d \n",getpid(), pid);
    /*Executed by both processes*/
}
