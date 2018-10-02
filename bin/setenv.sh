# optional variables to set in test mode to enable/disable features


# 0.) Infrastructure options:
# remove stresstest (7 minutes)
export DISABLEStresstest=1;
#
# 1.) simulation
export MCKEEPRootFiles=1    # needed in case we want to repeat only reconstruction and following actions and for option debugging

# 2. Reconstruction
# disable  reconstruction QA (by default  QA is enabled)
# export RECODETECTORLIST
export DISABLERECOQA=1
#export DETECTORList=
export RecoKEEPRootFiles=1    # needed in case we want to repeat QA, filterring .. and for option debugging

# 3. Filtering
#      filtering task -  usage not default downsampling parameters e.g for the custom production (performance generator, jet production ..)
#      default downsampling optimized for Minimum bias data
export AliAnalysisTaskFilteredTree_SetLowPtTrackDownscalingF=10
export AliAnalysisTaskFilteredTree_SetLowPtV0DownscalingF=10

