#!/bin/bash
if [ ! -f /.root_pw_set ]; then
	scripts/set_root_pw.sh
fi

exec /usr/sbin/sshd -D