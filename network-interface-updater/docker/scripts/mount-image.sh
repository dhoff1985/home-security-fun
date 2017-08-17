echo "mounting $IMAGE_NAME"
echo "losetup $IMAGE_NAME"
losetup -P /dev/loop1 /images/$IMAGE_NAME
echo "mount /dev/loop1p2"
mount /dev/loop0p2 /mnt
echo "mounted $IMAGE_NAME"