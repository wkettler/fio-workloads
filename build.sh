#
# build.sh
#

pssh -h /root/all.txt mkdir -p /mnt/fio32k
pssh -h /root/all.txt mkdir -p /mnt/fio32k
pssh -h /root/all.txt mkdir -p /mnt/fio32k
pssh -h /root/all.txt mount poola-vip:/volumes/poola/fio32k /mnt/fio32k
pssh -h /root/all.txt mount poola-vip:/volumes/poola/fio64k /mnt/fio64k
pssh -h /root/all.txt mount poola-vip:/volumes/poola/fio128k /mnt/fio128k

for f in `find *.fio -type f`; do
    echo ${f}
    dirs=$(grep directory ${f})
    for d in ${dirs}; do
        mkdir -p $(echo ${d} | cut -f2 -d"=")
    done
done
