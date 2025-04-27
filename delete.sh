#!/bin/sh

# Удаляем сервер
vagrant destroy -f

# Уадяем тестовый компьютер
vboxmanage controlvm pxetest poweroff
vboxmanage unregistervm --delete pxetest