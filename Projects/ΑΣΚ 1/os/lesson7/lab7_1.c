#include <stdio.h>
#include <errno.h>
#include <string.h>
main ()
{
    FILE *fp;
    fp = fopen ( "/etc/passwd", "w" );
    if ( fp == NULL )
    {
        printf( "errno = %d \n ", errno );
        perror( "fopen" );
        printf("Error: %s \n", strerror(errno));
    }
}
