#!/usr/bin/env bash

#
# (source $ALIDPG_ROOT/Utilis/utilities.sh; parseConfig --generator Custom --simulation SimulationDefaultIonTail --10; echo  )
#

parseConfig()
{
  # parse command line arguments, they have to be in the form
  #  option=value
  #    --or--
  #  -option value
  #    --or--
  #  --option value
  # they are then set in the environment
  # additionally another variable named: parseConfig__ORIGINAL__${option}
  # is set to have a fallback.
  # The prefix can be changed by specifying the
  # option originalOptionPrefix="some_prefix". Set to "" to switch off.
  #
  # optionally a config file can be specified in the arguments:
  #  configFile=<someFile>
  # config file sets variables: option=value
  # command line options override config file
  #
  # recommended way of using (at the beginning of your function/script):
  #  if ! parseConfig "${@}"; then return; fi

  local args=("$@")
  local opt=""
  local originalOptionPrefix="parseConfig_ORIGINALOCONFIG_"

  #first check if we will need to decode spaces
  local encodedSpaces=""
  for opt in "${args[@]}"; do
    [[ "${opt}" =~ encodedSpaces=.* ]] \
      && encodedSpaces=1
    [[ "${opt}" =~ originalOptionPrefix=.* ]] \
      && originalOptionPrefix="${opt#*=}"
  done

  #then look for a configFile (if any)
  for opt in "${args[@]}"; do
    if [[ ${opt} =~ -configFile=.* ]]; then
      #echo `eval "${opt}"`
      configFile="${opt#*=}"
      [[ ! -f ${configFile} ]] \
        && echo "configFile ${configFile} not found, exiting..." \
        && return 1
      echo "using config file: ${configFile}"
      source "${configFile}"
      break
    fi
  done

  #then, parse the options as they override the options from configFile
  local var=""
  local value=""
  for opt in "${args[@]}"; do
    [[ -n ${encodedSpaces} ]] && opt="$(decSpaces ${opt})"
    if [[ ! "${opt}" =~ .*=.* ]]; then
      if [[ "${opt}" =~ ^-.? && -z "$expectPosixOptionValue" ]]; then
        var="${opt#--}"
        var="${var#-}"
        expectPosixOptionValue=1
        continue
      elif [[ -n "$expectPosixOptionValue" ]]; then
        value="${opt}"
        unset expectPosixOptionValue
      else
        continue;  # non option string should be allowed - e.g parsing parameters for alihadd
        #echo "badly formatted option ${var}, should be: option=value (or -var value) stopping..."
        #return 1
      fi
    else
      var="${opt%%=*}"
      value="${opt#*=}"
    fi
    #echo "setting ${var}=${value}"
    export CONFIG_${var}="${value}"
    [[ -n ${originalOptionPrefix} ]] && export ${originalOptionPrefix}${var}="${value}"
    if [[ "$var" == "configFile" ]]; then
        echo "using config file: ${value}"
        source "${value}"
    fi;
  done
  return 0
}
