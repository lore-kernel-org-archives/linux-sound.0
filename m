From: root <root@sciencenet.net>
Date: Tue, 26 Jan 1999 06:01:07 +0000
Subject: Kernel Compiling Error
Message-Id: <marc-linux-sound-91733068905804@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

make[1]: Leaving directory `/usr/src/linux-2.2.0/arch/i386/lib'
ld -m elf_i386 -T /usr/src/linux-2.2.0/arch/i386/vmlinux.lds -e stext
arch/i386/kernel/head.o arch/i386/kernel/init_task.o init/main.o
init/version.o \
        --start-group \
        arch/i386/kernel/kernel.o arch/i386/mm/mm.o kernel/kernel.o
mm/mm.o fs/fs.o ipc/ipc.o \
        fs/filesystems.a \
        net/network.a \
        drivers/block/block.a drivers/char/char.a drivers/misc/misc.a
drivers/net/net.a drivers/scsi/scsi.a drivers/cdrom/cdrom.a
drivers/sound/sound.a drivers/pci/pci.a drivers/pnp/pnp.a
drivers/video/video.a \
        /usr/src/linux-2.2.0/arch/i386/lib/lib.a
/usr/src/linux-2.2.0/lib/lib.a /usr/src/linux-2.2.0/arch/i386/lib/lib.a \
        --end-group \
        -o vmlinux
drivers/sound/sound.a(sb_ess.o): In function `ess_init':
sb_ess.o(.text+0xde2): undefined reference to `esstype'
sb_ess.o(.text+0xe77): undefined reference to `esstype'
make: *** [vmlinux] Error 1

I get this when running make bzImage in 2.2.0

[root@nuclear /usr/src/linux]# cat /proc/cpuinfo 
processor       : 0
cpu             : 586
model           : Pentium 75+
vendor_id       : GenuineIntel
stepping        : 12
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : yes
fpu             : yes
fpu_exception   : yes
cpuid           : yes
wp              : yes
flags           : fpu vme de pse tsc msr mce cx8
bogomips        : 66.56

CPU info if it matters

[root@nuclear /usr/src/linux/scripts]# ./ver_linux 
-- Versions installed: (if some fields are empty or looks
-- unusual then possibly you have very old versions)
Linux nuclear 2.0.36 #2 Thu Jan 21 17:40:27 EST 1999 i586 unknown
Kernel modules         2.1.121
Gnu C                  2.7.2.3
Binutils               2.9.1.0.19
Linux C Library        2.0.7
Dynamic linker         ldd: version 1.9.10
Procps                 1.2.9
Mount                  2.9g
Net-tools              (1998-03-02)
Kbd                    0.96
Sh-utils               1.16
