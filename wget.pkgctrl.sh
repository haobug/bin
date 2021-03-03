#!/bin/bash
set PATH=$HOME/bin:${PATH}
pushd $HOME/mirror
domain=packagecontrol.io
updating()
{
watch -n1 'echo "Updating....." > packagecontrol.io/index.html'
}
updating &
wget --user-agent="packagecontrol personal mirror" --domains=$domain -N  -m --no-parent --reject-regex="ind
cat>packagecontrol.io/index.html<<EOF
Last updated $(date)
<br/>This is <big><b>NOT</b></big> official site and has no support
<pre>
//\$package/User/Package Control.sublime-settings
{
    "bootstrapped": true,
    "channels":
    [
        "<script type="text/javascript">document.write(window.location.protocol+"://"+window.location.hostn
    ],
    ...
</pre>
EOF
killall watch
popd
