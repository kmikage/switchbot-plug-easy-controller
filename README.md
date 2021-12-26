# SwitchBot Plug Easy Contoller
SwitchBotプラグの制御ツール

## Install
```
git clone https://github.com/kmikage/switchbot-plug-easy-controller.git
```

## Configure
1. SwitchBOTのAPI Tokenを設定
```
$ ./switchbot-plug.sh --set-token <Your SwitchBot API Token>
```

2. SwitchBot プラグの一覧を表示(DeviceID, Name)
```
$ ./switchbot-plug.sh --get-device-list
40F5****1496,Light(Living)
483F****D835,Light(Bedroom)
```

3. 制御するSwitchBot PlusのDeviceIDを指定
```
$ ./switchbot-plug.sh --set-device <Your SwitchBot Plus DeviceID>
```

## How-to-Use

Turn On / Off
```
$ ./switchbot-plug.sh on
$ ./switchbot-plug.sh off
```

Show Current Status
```
$ ./switchbot-plug.sh status
off
```
