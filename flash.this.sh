wait_device()
{
adb wait-for-device
}

wait_device && \
adb reboot bootloader && \
bash flash_all.sh
