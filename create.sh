#!/bin/sh

# Создание сервера
vagrant up

# Создание тестового компьютера
vboxmanage createvm --name "pxetest" --ostype Ubuntu2404 --register
vboxmanage modifyvm pxetest --nic1 intnet --intnet1 pxenet
vboxmanage modifyvm pxetest --memory 4096 --cpus 2 --boot1 disk --boot2 net --boot3 none --boot4 none
vboxmanage createmedium disk --filename pxeboot-disk.vdi --size 8192
vboxmanage storagectl pxetest --name "SATA" --add sata --bootable on
vboxmanage storageattach pxetest --storagectl "SATA" --port 1 --type hdd --medium pxeboot-disk.vdi
vboxmanage startvm pxetest
