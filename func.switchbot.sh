#!/bin/bash

# show Plug device status.
GET_DEVICE_STATUS() {
 LOAD_TOKEN
 LOAD_DEVICE_ID
 CFG_API_DEVICE_STATUS="${CFG_API}/devices/${CFG_DEVICE_ID}/status"

 curl -s \
  -H "${CFG_AUTH}" \
  -H "Content-Type: application/json" \
  ${CFG_API_DEVICES} \
  > ${FN_TMP_JSON}

 cat ${FN_TMP_JSON} \
  | jq 
}

# show Plug devices list.
GET_DEVICE_LIST() {
 LOAD_TOKEN
 CFG_API_DEVICES="${CFG_API}/devices"
 curl -s \
  -H "${CFG_AUTH}" \
  -H "Content-Type: application/json" \
  ${CFG_API_DEVICES} \
  > ${FN_TMP_JSON}
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

### Set Configration
SET_TOKEN() {
 # ${1} - Token
 echo "CFG_TOKEN=\"${1}\"" \
  | tee "${FN_CFG_TOKEN}"
}

SET_DEVICE() {
 # ${1} - DeviceID
 echo "CFG_DEVICE_ID=\"${1}\"" \
  | tee "${FN_CFG_DEVICE_ID}"
}

### Load Configuration
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

### Check Configuration
CHECK_CONFIG() {
 LOAD_TOKEN
 LOAD_DEVICE_ID
 echo "TOKEN: ${CFG_TOKEN}"
 echo "DEVICE_ID: ${CFG_DEVICE_ID}"
}

