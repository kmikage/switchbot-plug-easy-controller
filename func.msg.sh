#!/bin/bash

msg_err(){
 case $1 in

  no_token)
   echo "Err.. no configure Switchbot Token"
   echo "use --set-token <Token>"
   ;;

  no_device_id)
   echo "Err.. no configure Switchbot Plug ID"
   echo "use --set-device <DeviceID>"
   ;;

  no_set_token)
   echo "Err.."
   echo "Append <Token>"
   ;;

  no_set_deviceid)
   echo "Err.."
   echo "append <Plug Device ID>"
   ;;

  cannot_api_get)
   echo "Err.. Can not use API."
  ;;

  cannot_api_exec)
   echo "Err.. Can not exec API."
  ;;

  no_param_status)
   echo "Err.. Unexpected parameter."
   echo "Show help."
  ;;

  internal_err)
   echo "Intenal Err..(No Param)"
   echo "Please report issue on GitHub."
   echo "https://github.com/kmikage/switchbot-rebooter/issues"
   ;;

  *)
   echo "Intenal Err..(Exception)"
   echo "Please report issue on GitHub."
   echo "https://github.com/kmikage/switchbot-rebooter/issues"
   ;;
 esac

 exit 1
}
