#!/bin/bash


# Configration
CFG_API_DEVICES="https://api.switch-bot.com/v1.0/devices"
FN_CFG_TOKEN="config.token.sh"
FN_CFG_DEVICE_ID="config.deviceid.sh"
FN_TMP_JSON=$(mktemp)


# Include Functions
. func.msg.sh
. func.switchbot.sh

case ${1} in

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
SwitchBot Rebooter.

[ HELP ]
--get-device-status
  Get Plug Status.

[ CONFIG ]
--set-token <Token>
  Set SwitchBot Token.

--get-device-list
  Get Plug Devices.

--set-device <DeviceID>
  Set Plug DeviceID.

--check-config
  Show configurations.
_EOL_
  ;;
esac


rm ${FN_TMP_JSON} 
exit


