{ config, lib, pkgs, modulesPath, ... }: {



networking.extraHosts = ''
 127.0.0.1 shop.gepork.local
 127.0.0.1 shop.centauro.local
 127.0.0.1 shop.grupgepork.local
 192.168.100.63 shop.gepork.qas
 192.168.100.63 shop.centauro.qas
 192.168.100.63 shop.grupgepork.qas
 192.168.100.53 shop.gepork.pro
 192.168.100.53 shop.centauro.pro
 192.168.100.53 shop.grupgepork.pro
 193.100.1.57 PEKINES.gepork.local
 193.100.1.51 DOBERMAN.gepork.local
 192.168.55.33 vhggkgpdci.sap.grupgepork.es
'';

}
