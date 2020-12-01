#!/bin/bash

root=$1; shift

echo "Creating ansible user"

useradd -R $(pwd)/$root -m ansible
mkdir -p $root/home/ansible/.ssh
cat <<EOF >$root/home/ansible/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDS/xdgmacIpg2bpsdqFETevQKPqyi3Pmn9lDaHQ/QYsz7eqsZAX/Tn+0NBL6sVb4C5g2Qk9EzKPs1v1F3p5bwaDq08aC+cRgKndWwjpZxj/MV0HQhzC5NpfBcE0TS5nzLJFjEs2qxQorZ07PglsYLCTxhe0vI36ddvfM1VIhc0Wa+h97CPjfIWNWUSAKKhjznpyJKONwWcHeM15MCzow6riDrHo14DsnoW9T68h3Qcd1RUUPx5xG6vd9cZ/7bAqru44RdDq4FUpkmPK+W6VN7bRqOxXC1TbKbptpeITcQdiBWblNgao9bvOtpxjXd1uEU0h9oqCsMn0tjIIsFYT2Wz gall@asama
EOF
chroot $root /bin/chown -R --reference /home/ansible home/ansible/.ssh
echo "ansible ALL=(ALL:ALL) NOPASSWD: ALL" >$root/etc/sudoers.d/ansible
exit 0
