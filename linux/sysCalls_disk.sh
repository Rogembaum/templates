# 1
# "y\n" (user space)
# write() (kernel space - high CPU sy load)
yes > /dev/null 2>&1 &

# 2
# "y\n" (user space)
# wa (kernel space - high IO wait)
yes | dd bs=1M of=/dev/null


# 3
# count syscalls
strace -c yes > /dev/null

# --------------------------------------------------
# /dev/null vs real file
# --------------------------------------------------
yes > /dev/null
# no IO wait, syscalls only
# millions of syscalls write() per second 

yes > bigfile
iostat -x 1     
# IO wait, syscalls too, appers wa 
# page cache effects then save to disk


# --------------------------------------------------
# Testing on:
# --------------------------------------------------

# small block size
dd if=/dev/zero of=/root/bigfile bs=1 count=1G
# write speeed ~ KB/s

# large block size
dd if=/dev/zero of=/root/bigfile bs=1M count=1G
# write speed ~ hundreds of MB/s