#!/usr/bin/env bash

# Valgrind command - enable it in case valgrind check needed
Config_Valgrind="valgrind --leak-check=full --error-limit=no --show-reachable=yes  --log-file=xxx.txt -v aliroot"
Config_Calgrind="valgrind --tool=callgrind --log-file=cpu.txt   --num-callers=40 -v  --trace-children=yes aliroot"
Config_DebugCommand="gdb aliroot"
# Set filtering parameters different than default
Config_FilteringHighPt=10
Config_FilteringHighV0=10