# operating-system

# XV6 MLFQ Scheduler Project

## Overview

This project modifies the xv6 operating system to implement a Multi-Level Feedback Queue (MLFQ) scheduler. The scheduler improves CPU utilization and fairness by dynamically adjusting process priorities based on runtime behavior.

## Features

* 3 priority levels (0 = highest, 2 = lowest)
* Time slicing per priority level
* Priority demotion based on CPU usage
* Periodic priority boosting to prevent starvation
* Process statistics tracking

## How to Compile

```bash
make clean
make
```

## How to Run

```bash
make qemu
```

## Usage

* The system boots into xv6
* Processes are scheduled using MLFQ
* Debug output (if enabled) shows priority changes and boosting

## Files Modified

* proc.c → scheduler logic
* trap.c → timer interrupt handling
* proc.h → process structure updates

## Author

Grace Couch
