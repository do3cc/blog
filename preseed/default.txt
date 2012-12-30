d-i debconf/priority                   select critical
d-i auto-install/enabled               boolean true
d-i netcfg/choose_interface            select auto
d-i netcfg/get_hostname                string obelix
d-i network-console/password           password SECRET123
d-i network-console/password-again     password SECRET123
d-i preseed/early_command string anna-install network-console
