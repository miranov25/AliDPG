#!/usr/bin/env bash
# Valgrind command - enable it in case valgrind check needed
export CONFIG_ValgrindCommand="valgrind --leak-check=full --error-limit=no --show-reachable=yes  --log-file=xxx.txt -v aliroot"
export CONFIG_CalgrindCommand="valgrind --tool=callgrind --log-file=cpu.txt   --num-callers=40 -v  --trace-children=yes aliroot"
export CONFIG_DebugCommand="gdb aliroot"
# Set filtering parameters different than default
export CONFIG_FilteringHighPt=100
export CONFIG_FilteringHighV0=100
# STREAMER configuration
# Enable this line to check iontail and crosstalk correction
export CONFIG_STREAMER_TPCReconstruction="AliTPCtracker::kStreamCrosstalkMatrix | AliTPCtracker::kStreamXtalk  | AliTPCtracker::kStreamIonTail"
# Enable this line to check cluster residuals and error parametrization
# export CONFIG_STREAMER_TPCReconstruction="AliTPCtracker::kStreamTransform |  AliTPCtracker::kStreamErrParam"
# Enable this line to check stream partial TPC signals
export CONFIG_STREAMER_TPCSimulation="AliTPCDigitizer::kStreamCrosstalk|AliTPCDigitizer::kStreamSignal|AliTPCDigitizer::kStreamSignalAll"