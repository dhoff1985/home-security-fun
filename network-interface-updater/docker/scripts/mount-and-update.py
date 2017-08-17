#!/usr/bin/env python
import subprocess
import os
from string import Template

subprocess.call(["/bin/bash", "/scripts/mount-image.sh"])

d = {'PASSPHRASE': os.environ['PASSPHRASE'],
     'SSID': os.environ['SSID'],
     'SUBNET_MASK': os.environ['SUBNET_MASK'],
     'IP_ADDRESS': os.environ['IP_ADDRESS']}

# open the file
filein = open('/templates/etc/network/interfaces.Template')
# read it
src = Template(filein.read())

f = open('/mnt/etc/network/interfaces', 'w')
f.write(src.substitute(d))  # python will convert \n to os.linesep
f.close()

subprocess.call(["/bin/bash", "/scripts/umount-image.sh"])
