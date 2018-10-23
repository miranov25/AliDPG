# optional variables to set in test mode to enable/disable features


# 0.) Infrastructure options:
# remove stresstest (7 minutes)
export CONFIG_DISABLEStresstest=1;
#
# 1.) simulation
export CONFIG_MCKEEPRootFiles=1    # needed in case we want to repeat only reconstruction and following actions and for option debugging
export CONFIG_MCDeltaOCDB="$NOTES/JIRA/ATO-452/MCDeltaOCDB.C"   # delta MC OCDB configuration - applied as in CSS as last on top of "standard" OCDB
# 2. Reconstruction
# disable  reconstruction QA (by default  QA is enabled)
# export RECODETECTORLIST
export CONFIG_DISABLERECOQA=1
#export DETECTORList=
export CONFIG_RecoKEEPRootFiles=1    # needed in case we want to repeat QA, filterring .. and for option debugging
export CONFIG_RecoDeltaOCDB="$NOTES/JIRA/ATO-452/RecoDeltaOCDB.C"   # delta reconstuction  OCDB configuration - applied as in CSS as last on top of "standard" OCDB
# 3. Filtering
#      filtering task -  usage not default downsampling parameters e.g for the custom production (performance generator, jet production ..)
#      default downsampling optimized for Minimum bias data
export AliAnalysisTaskFilteredTree_SetLowPtTrackDownscalingF=10
export AliAnalysisTaskFilteredTree_SetLowPtV0DownscalingF=10

# 4.) STREAMER configuration in simulation and reconstruction
# Enable this line to check iontail and crosstalk correction
export CONFIG_STREAMER_TPCReconstruction="AliTPCtracker::kStreamCrosstalkMatrix | AliTPCtracker::kStreamXtalk  | AliTPCtracker::kStreamIonTail"
# Enable this line to check cluster residuals and error parametrization
# export CONFIG_STREAMER_TPCReconstruction="AliTPCtracker::kStreamTransform |  AliTPCtracker::kStreamErrParam"
# Enable this line to check stream partial TPC signals
export CONFIG_STREAMER_TPCSimulation="AliTPCDigitizer::kStreamCrosstalk|AliTPCDigitizer::kStreamSignal|AliTPCDigitizer::kStreamSignalAll"