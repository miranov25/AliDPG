# optional variables to set in test mode to enable/disable features


# remove stresstest (7 minutes)
#
# simulation

# rec.C
# disable  reconstruction QA (by default  QA is enabled)
# export RECODETECTORLIST
export DISABLERECOQA=1


# filtering task 0 use not default downsampling parameters e.g for the custom production (performance generator, jet production ..)
export AliAnalysisTaskFilteredTree_SetLowPtTrackDownscalingF=10
export AliAnalysisTaskFilteredTree_SetLowPtV0DownscalingF=10