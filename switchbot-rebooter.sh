#!/bin/bash


# Configration
CFG_VERSION="Dev"
CFG_API="https://api.switch-bot.com/v1.0"
CFG_GITHUB="https://github.com/kmikage/switchbot-rebooter"
FN_CFG_TOKEN="config.token.sh"
FN_CFG_DEVICE_ID="config.deviceid.sh"
FN_TMP_JSON=$(mktemp)

# Include Functions
. func.msg.sh
. func.switchbot.sh

case ${1} in

 on)
  SET_DEVICE_STATUS on;;

 off)
  SET_DEVICE_STATUS off;;

 status)
  GET_DEVICE_STATUS;;

 --set-device-status)
  if [ "${2}" != "on" -a "${2}" != "off" ]; then
   msg_err no_param_status
  fi
  SET_DEVICE_STATUS ${2};;

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
 - SwitchBot Plus Controller

[ Usage ]
switchbot-rebooter [ on | off | status ]

[ Options ]
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
${CFG_GITHUB}
_EOL_
  ;;
esac


rm ${FN_TMP_JSON} 
exit


