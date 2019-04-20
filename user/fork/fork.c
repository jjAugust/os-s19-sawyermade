#include <proc.h>
#include <stdio.h>
#include <syscall.h>
#include <x86.h>

#include <lib/debug.h>

uint32_t global_test = 0x12345678;

int main (int argc, char **argv)
{
    printf("\nIn fork.c\n");

    pid_t pid;

    pid = sys_fork();

    if (pid == 0){
        global_test = 0x1234;
        pid = sys_fork();

        if(pid == 0){
            printf("This is grandchild, global = %p\n", global_test);
        }else{
            printf("Child forks %d, global = %p\n", pid, global_test);
        }
    }else{
        printf("parent forks %d, global = %p\n", pid, global_test);
        global_test = 0x5678;
        printf("parent global_test1 = %p\n", global_test);
    }

    return 0;
}
