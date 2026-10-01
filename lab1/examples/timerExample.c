/*
 * Example of interval timer usage
 */

#include <sys/time.h>   /* for calling setitimer */
#include <signal.h>     /* for calling signal */
#include <stdio.h>      /* for calling  printf */

#define INTERVAL 500        /* number of milliseconds to go off */

/* function prototype */
void doStuff(void);
int cycle = 0;

int main(int argc, char *argv[]) {


  struct itimerval timer;

  // Install the timer handler.
  // Upon SIGALRM, call doStuff().
  signal(SIGALRM, (void (*)(int)) doStuff);

  // Configure the timer to expire after 500 ms
  // the time until the timer next expires 
  timer.it_value.tv_sec = 0; //0 seconds
  timer.it_value.tv_usec = 500000; // 500ms
      
  // the value that timer will be reset to after it expires
  timer.it_interval.tv_sec = 0; // 0 seconds
  timer.it_interval.tv_usec = 500000; //500 ms
     
  // Start a virtual timer. It counts down whenever this process is executing. 
  // When the timer code is ITIMER_VIRTUAL, the process is sent a SIGVTALRM signal after the process has executed for the specified time
  setitimer (ITIMER_REAL, &timer, NULL);

  while (1) {
    // wait for the start of a quantum  
    if (cycle) {
        cycle = 0;
        printf("Alarm tick recieved, do the job...\n");
        // calls ...
    }
  }

}

/*
 * doStuff
 */
void doStuff(void) {
  cycle = 1;
  // printf("Timer went off.\n");

}