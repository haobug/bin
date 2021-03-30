#!/bin/bash


cat>/tmp/scpit.py<<EOF
from __future__ import print_function
def get_ip():
    import socket
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    try:
        # doesn't even have to be reachable
        s.connect(('10.255.255.255', 1))
        IP = s.getsockname()[0]
    except Exception:
        IP = '127.0.0.1'
    finally:
        s.close()
    return IP

if __name__=="__main__":
    import sys
    argv=sys.argv
    argc=len(argv)
    if argc < 2:
        print("scpit.sh <path_to_local_path>")
        sys.exit(1)

    path1=argv[1]
    cmd_text="scp"
    import os
    if os.path.isdir(path1):
        cmd_text+=" "
        cmd_text+=" -r"
    path1=os.path.realpath(path1)
    if " " in path1:
        path1 = path1.replace(" ", "\\ ")
        path1 = "\"" + path1
        path1 = path1 + "\""
        
    user=os.getenv("USER","")
    if user:
        cmd_text+=" "
        cmd_text+=user
    else:
        print("no user")
        sys.exit(2)
        
    ip=get_ip() 
    if ip:
        cmd_text+="@"
        cmd_text+=ip

    if True:
        cmd_text+=":"
        cmd_text+=path1
        
    print(cmd_text)
EOF

python2 /tmp/scpit.py $@
