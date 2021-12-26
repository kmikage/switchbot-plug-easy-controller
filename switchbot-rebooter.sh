#!/bin/bash


# Configration
CFG_VERSION="Dev"
CFG_API="https://api.switch-bot.com/v1.0"
FN_CFG_TOKEN="config.token.sh"
FN_CFG_DEVICE_ID="config.deviceid.sh"
FN_TMP_JSON=$(mktemp)

# Include Functions
. func.msg.sh
. func.switchbot.sh

case ${1} in

 --set-device-status)
  SET_DEVICE_STATUS ${1};;

 --get-device-status)
  GET_DEVICE_STATUS;;

 --get-device-list)
  GET_DEVICE_LIST;;

 --set-device)
  if [ "${2}" = "" ]; then
   msg_err no_set_deviceid
  fi
  SET_DEVICE ${2};;

 --set-token)
  if [ "${2}" = "" ]; then
   msg_err no_set_token
  fi
  SET_TOKEN ${2};;
 
--check-config)
  CHECK_CONFIG;;


 *)
  cat << _EOL_ 
SwitchBot Rebooter. ${CFG_VERSION}

[ Usage ]
--get-device-status
  Show Plug Status.

--set-device-status [on|off]
  Set Plug Status.

[ Config ]
--set-token <Token>
  Set SwitchBot Token.

--get-device-list
  Get your Plug Devices.

--set-device <DeviceID>
  Set your Plug DeviceID.

--check-config
  Show current configurations.

[ GitHub ]
https://github.com/kmikage/switchbot-rebooter
_EOL_
  ;;
esac


rm ${FN_TMP_JSON} 
exit


