#!/bin/bash

SET_TOKEN() {
 # ${1} - Token
 echo "CFG_TOKEN=\"${1}\"" \
  | tee "${FN_CFG_TOKEN}"
}

GET_DEVICE_LIST() {
 LOAD_TOKEN
 curl -s -H "${CFG_AUTH}" ${CFG_API_DEVICES} > ${FN_TMP_JSON}
 MSG=`cat ${FN_TMP_JSON} \
  | jq -r '. | [ .message ] | @csv' \
  | sed -e 's/"//g' \
 `
 if [ "${MSG}" != "success" ]; then
  echo "Result : ${MSG}"
  msg_err cannot_api_get
 fi
 jq -r '.body.deviceList[] | select (.deviceType == "Plug") | [ .deviceId, .deviceName ] | @csv' ${FN_TMP_JSON} \
 | sed -e 's/"//g'
}

SET_DEVICE() {
 # ${1} - DeviceID
 echo "CFG_DEVICE_ID=\"${1}\"" \
  | tee "${FN_CFG_DEVICE_ID}"
}

LOAD_TOKEN() {
 if [ ! -f "${FN_CFG_TOKEN}" ]; then
  msg_err no_token
 else
  . ${FN_CFG_TOKEN}
 fi

 if [ "${CFG_TOKEN}" = "" ]; then
  msg_err no_token
 fi

 CFG_AUTH="Authorization:${CFG_TOKEN}"
}

LOAD_DEVICE_ID() {
 if [ ! -f "${FN_CFG_DEVICE_ID}" ]; then
  msg_err no_device_id
 else
  . ${FN_CFG_DEVICE_ID}
 fi

 if [ "${CFG_DEVICE_ID}" = "" ]; then
  msg_err no_device_id
 fi
}

