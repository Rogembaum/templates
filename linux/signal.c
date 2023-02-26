#include <stdio.h>
#include <signal.h>
#include <unistd.h>

void signal_handler (int signum)
{
    printf("\n%d\n",signum); //output signal's number
}

int main ()
{
    signal(SIGSEGV, signal_handler);    //set signal's handler 11 Memory Segmentaion Fault
    signal(SIGINT, signal_handler);     //set signal's handler 2 or (Ctrl+C)
    signal(SIGTERM, signal_handler);    //set signal's handler 15
    signal(SIGKILL, signal_handler);    //set signal's handler 9
    signal(SIGSTOP, signal_handler);    //set signal's handler 19 pause (Ctrl+Z)
    signal(SIGCONT, signal_handler);   //set signal's handler 18 unpause

    while (1) sleep(10);
    return 0;
}
