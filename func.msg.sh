#!/bin/bash

msg_err(){
 case $1 in

  no_token)
   echo "Err.. no configure Switchbot Token"
   echo "use --set-token <Token>"
   ;;

  no_set_token)
   echo "Err.."
   echo "Append <Token>"
   ;;

  no_deviceid)
   echo "Err.. no configure Switchbot Plug ID"
   echo "use --set-device <DeviceID>"
   ;;

  no_set_deviceid)
   echo "Err.."
   echo "append <Plug Device ID>"
   ;;

  cannot_api_get)
   echo "Err.. Can not use API."
  ;;

  *)
   echo "switchbot-rebooter dev ver." ;;
 esac

 exit 1
}
