#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <time.h>
#include <stdio.h>
#include <stdlib.h>
int main(void)
{
    int i, status;
    pid_t childID, endID;
    time_t when;
    if ((childID = fork()) == -1)       /* Start a child process.*/
    {
        perror("fork error");
        exit(EXIT_FAILURE);
    }
    else if (childID == 0)              /* This is the child.*/
    {
        time(&when);
        printf("Child process started at %s",
                ctime(&when));
        printf("Child process id = %d\n", getpid());
        sleep(10);                       /* Sleep for 10 seconds.*/
        exit(EXIT_SUCCESS);
    }
    else                                /* This is the parent.*/
    {
        time(&when);
        printf("Parent process started at %s",
                ctime(&when));
        /* Wait 15 seconds for child process to terminate.*/
        for(i = 0; i < 15; i++)
        {
            endID = waitpid(childID, &status, WNOHANG|WUNTRACED);
            if (endID == -1)              /* error calling waitpid */
            {
                perror("waitpid error");
                exit(EXIT_FAILURE);
            }
            else if (endID == 0)          /* child still running */
            {
                time(&when);
                printf("Parent waiting for child at %s",
                        ctime(&when));
                sleep(1);
            }
            else if (endID == childID)    /* child ended */
            {
                if (WIFEXITED(status))
                    printf("Child ended normally. Exit code is %d\n",WEXITSTATUS(status));
                else if (WIFSIGNALED(status))
                    printf("Child ended because of an uncaught signal, signal = %d\n",WTERMSIG(status));
                else if (WIFSTOPPED(status))
                    printf("Child process has stopped, signal code = %d\n",WSTOPSIG(status));
                exit(EXIT_SUCCESS);
            }
        }
    }
}
