# SwitchBot Rebooter
SwitchBotプラグの制御ツール

## Install
```
git clone https://github.com/kmikage/switchbot-rebooter.git
```

## Configure
1. SwitchBOTのAPI Tokenを設定
```
$ ./switchbot-rebooter.sh --set-token <Your SwitchBot API Token>
```

2. SwitchBot プラグの一覧を表示(DeviceID, Name)
```
$ ./switchbot-rebooter.sh --get-device-list
40F5****1496,Light(Living)
483F****D835,Light(Bedroom)
```

3. 制御するSwitchBot PlusのDeviceIDを指定
```
$ ./switchbot-rebooter.sh --set-device <Your SwitchBot Plus DeviceID>
```

## How-to-Use

Turn On / Off
```
$ ./switchbot-rebooter.sh on
$ ./switchbot-rebooter.sh off
```

Show Current Status
```
$ ./switchbot-rebooter.sh status
off
```
