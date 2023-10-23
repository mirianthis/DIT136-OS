#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
int main()
{
    int pid;
    pid=fork();
    if (pid==-1) /*check for error*/
    {
        perror("fork");
        exit(1);
    }
    if (pid!=0) /*The parent process*/
    {
        while(1) sleep(1000);  /*Never terminate*/
    }
    else /*The child process*/
    {
        printf("Child Process: PID=%d, PPID=%d Executed\n",
                getpid(),getppid());
        exit(37);
    } /*Exit with a silly number*/
}
