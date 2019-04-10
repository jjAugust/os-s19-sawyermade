#include <proc.h>
#include <stdio.h>
#include <syscall.h>
#include <x86.h>

int main (int argc, char **argv)
{
    pid_t pid;
    printf ("forker\n");

    pid_t fork_pid = spawn(4, 400);
    if (fork_pid != NUM_IDS)
        printf ("fork in process %d.\n", fork_pid);
    else
        printf ("Failed to launch fork.\n");

    return 0;
}

