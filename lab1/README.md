# RTOS - Lab 1: Clock-Driven Scheduling

## Objective
The objective of this lab is to implement a **multi-rate flight controller** for a helicopter, following the specifications outlined in Jane W. S. Liu’s *Real-Time Systems* textbook. Students will gain hands-on experience with **clock-driven real-time scheduling techniques** and develop a deeper understanding of **cyclic schedulers**.

![Software Control Structure of a Flight Controller](img/SwCtrlStruct.png)

## Learning Outcomes

By the end of this lab, students will be able to:

 - Develop and test a functional, multi-rate flight controller using real-time scheduling methods.  
 - Demonstrate understanding of cyclic and structured cyclic scheduling by providing a **well-documented source code implementation**, including timing mechanisms and task management.  
 - Apply **modularity, reusability, and ISR-based timing** in embedded software development.

## Lab Description

You will choose between a **cyclic** or **structured cyclic** scheduler to manage the execution of helicopter controller tasks. To achieve this:

 - Integrate timing mechanisms using **alarm signals** or **timer interrupts**. Example implementations are available in:
    - `examples/alarmExample.c`  
    - `examples/timerExample.c`  
 - Use the function prototypes for controller tasks as defined in:  
    - `include/helicopterTasks.h`  
    - `helicopterTasks.c` (mock implementations provided)  
 - You will edit `main.c` and *may add additional files* as needed to complete the lab.
 - For your convenience, this repository includes:
   - `Makefile`: to compile the program.
   - `run.sh`: to execute your program easily.

> **Imprortant:** Run the hyperperiod for exactly 5 iterations. Make sure to adjust any scaling so that the whole program finishes in under 80 seconds.

The scripts used by the GitHub Classroom autograder are included in the `scripts/` folder and will be triggered automatically whenever you push to your repository. The autograder checks both compilation and output correctness. Please note that all files under `.github/` are protected and should not be modified, as they are essential for the autograder. Make sure your code runs correctly using the provided `Makefile` and `run.sh`.

## Submission Guidelines

- The lab can be completed **individually, in pairs or in groups of three**.  
- Include your **source code**, along with answers to the lab questions in `lab1_answers.md`.  

## Grading Criteria
 - **Compilation:** 3 points (automatically checked by the autograder)
 - **Output correctness:** 7 points (automatically checked by the autograder)
 - **Documentation quality:** 3 points (assessed via your pull request)
 - **Effective use of ISRs for timing, code modularity, and reusability:** 7 points (assessed via your pull request)

> **Important:** All submissions will undergo a **similarity check**. Any attempt to copy a colleague’s work will result in a **complete reset of the grade for both parties**.

## Automatic Verification

To support **self-assessment and correctness checks**, GitHub Classroom has been configured with **GitHub Actions** for this lab. Upon each submission:

- The system automatically **builds your code** and **executes predefined tests**.  
- It verifies that the **output of your flight controller tasks** matches the expected results.  
- Any failed tests will be reported in the GitHub Actions interface, helping you **debug and improve** your implementation before final submission.  
