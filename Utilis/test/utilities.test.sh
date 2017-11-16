#!/usr/bin/env bash
#   $ALIDPG_ROOT/Utilis/utilities.test.sh;


testParseConfig(){
    # test parse config
    parseConfig --generator Custom -simulation SimulationDefaultIonTail --FilteringHighPt 10 --FilteringV0 20 --keepFiles 1
    alilog_info "test parseConfig --generator Custom -simulation SimulationDefaultIonTail --FilteringHighPt 10 --FilteringV0 20 --keepFiles 1"
    [[ "${generator}"   != "Custom"   ]] && alilog_error    "Option generator!=custom"
    [[ "${generator}"   == "Custom"   ]] && alilog_success  "Option generator==custom"
    #
    [[ "${simulation}"   != "SimulationDefaultIonTail"   ]] && alilog_error    "Option simulation!=SimulationDefaultIonTail"
    [[ "${simulation}"   == "SimulationDefaultIonTail"   ]] && alilog_success  "Option SimulationDefaultIonTail==SimulationDefaultIonTail"
    #
    [[ "${FilteringHighPt}"   != "10"   ]] && alilog_error    "Option FilteringHighPt!=10 ($FilteringHighPt)"
    [[ "${FilteringHighPt}"   == "10"   ]] && alilog_success  "Option FilteringHighPt==10"
}


source $ALIDPG_ROOT/Utilis/utilities.sh;
source $ALICE_ROOT/libexec/alilog4bash.sh
testParseConfig;