#!/usr/bin/env bash
#   $ALIDPG_ROOT/Utilis/test/utilities.test.sh;

testParseConfig(){
    # test parse config
    env > envOld.txt
    alilog_info "testParseConfig -configFile $AliDPG_ROOT/Utilis/test/genPerformance.config.sh --generator Custom -simulation SimulationDefaultIonTail --FilteringHighPt 10  --keepFiles 1 --configFile genPerformance.config.sh"
    parseConfig --configFile $AliDPG_SRC/Utilis/test/genPerformance.config.sh --CONFIG_generator Custom -CONFIG_simulation SimulationDefaultIonTail --CONFIG_FilteringHighPt 10 --CONFIG_FilteringHighV0 100 --keepFiles 1
    [[ "${CONFIG_generator}"   != "Custom"   ]] && alilog_error    "Option generator!=custom"
    [[ "${CONFIG_generator}"   == "Custom"   ]] && alilog_success  "Option generator==custom"
    [[ "${CONFIG_simulation}"   != "SimulationDefaultIonTail"   ]] && alilog_error    "Option simulation!=SimulationDefaultIonTail"
    [[ "${CONFIG_simulation}"   == "SimulationDefaultIonTail"   ]] && alilog_success  "Option SimulationDefaultIonTail==SimulationDefaultIonTail"
    [[ "${CONFIG_FilteringHighPt}"   != "10"   ]] && alilog_error    "Option FilteringHighPt!=10 ($FilteringHighPt)"
    [[ "${CONFIG_FilteringHighPt}"   == "10"   ]] && alilog_success  "Option FilteringHighPt==10"
    [[ "${CONFIG_FilteringHighV0}"   != "100"   ]] && alilog_error    "Option FilteringHighV0!=100 ($FilteringHighV0)"
    [[ "${CONFIG_FilteringHighV0}"   == "100"   ]] && alilog_success  "Option FilteringHighV0==100"
    env > envNew.txt
    alilog_info "testParseConfig - Variable diff"
    diff -y --suppress-common-lines -W 200 envOld.txt envNew.txt | tee envDiff.txt
}

source $ALICE_ROOT/libexec/alilog4bash.sh
source $ALICE_ROOT/libexec/utilities.sh
testParseConfig;
