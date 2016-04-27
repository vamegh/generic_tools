class cust_tools::vsyscall64_fix {
    exec    { "vsyscall64 fix":
        command => "/bin/echo kernel.vsyscall64 = 1 >> /etc/sysctl.conf; sysctl -p",
        onlyif => "/bin/grep 0 /proc/sys/kernel/vsyscall64"
     }
}

