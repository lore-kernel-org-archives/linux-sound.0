From: Maarten Wisse <pmwisse@hetnet.nl>
Date: Fri, 20 Aug 1999 19:44:04 +0000
Subject: Bug in modules es1370.o or soundcore.o
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------6F86ACD48DBCFA0496F38BBE"
Message-Id: <marc-linux-sound-93518000414007@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
To: linux-sound@vger.kernel.org

This is a multi-part message in MIME format.
--------------6F86ACD48DBCFA0496F38BBE
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

[1.] One line summary of the problem:  cd's do not play on the es1370.o
in 2.2.11
[2.] Full description of the problem/report: Yesterday, I updated my
kernel from 2.2.1 to 2.2.11. After compiling with exactly the same
settings as in my 2.2.1 settings, playing cd's using my Soundblaster
PCI128 did not work. Wav files do play properly. As you will see from
the other files everything necessary is present on the system, so it
must be a bug. I've configured my 2.2.1 kernel as vmlinuz.old and that
one still works properly. So the problem is: no sound appears. No
warnings appear in my kmix 1.0.  The card is recognised, as evident from
/proc/pci. The modules are loaded,as evident from /proc/modules. I hope
you will be able to solve the problem.
[3.] Keywords (i.e., modules, networking, kernel): soundmodules for
es1370.
[4.] Kernel version (from /proc/version): Linux version 2.2.11
(root@wst) (gcc version egcs-2.91.60 19981201 (egcs-1.1.1 release)) #1
Thu Aug 19 20:26:12 CEST 1999
[7.] Environment
[7.1.] Software (add the output of the ver_linux script here) --
Versions installed: (if some fields are empty or looks
-- unusual then possibly you have very old versions)
Linux wst 2.2.11 #1 Thu Aug 19 20:26:12 CEST 1999 i686 unknown
Kernel modules         2.1.85
Gnu C                  egcs-2.91.60
Binutils               2.9.1.0.15
Linux C Library        x   1 root     root      2478585 Jan 14  1999
/lib/libc.so.6
Dynamic linker         ldd (GNU libc) 2.0.7
Procps                 1.2.7
Mount                  2.9
Net-tools              1.46
Kbd                    0.96
Sh-utils               1.12
Modules Loaded         es1370 soundcore serial
[7.2.] Processor information (from /proc/cpuinfo):processor : 0
vendor_id : GenuineIntel
cpu family : 6
model  : 5
model name : Pentium II (Deschutes)
stepping : 1
cpu MHz  : 350.802645
cache size : 512 KB
fdiv_bug : no
hlt_bug  : no
sep_bug  : no
f00f_bug : no
coma_bug : no
fpu  : yes
fpu_exception : yes
cpuid level : 2
wp  : yes
flags  : fpu vme de pse tsc msr pae mce cx8 sep mtrr pge mca cmov pat
pse36 mmx osfxsr
bogomips : 349.80

[7.3.] Module information (from /proc/modules):es1370
21340   0 (autoclean) (unused)
soundcore               2148   4 (autoclean) [es1370]
serial                 18356   0 (autoclean)
[7.4.] SCSI information (from /proc/scsi/scsi) no scsi devices present
on the system
[7.5.] Other information that might be relevant to the problem
       (please look in /proc and include all information that you
       think to be relevant):PCI devices found:
  Bus  0, device   0, function  0:
    Host bridge: Intel 440BX - 82443BX Host (rev 2).
      Medium devsel.  Master Capable.  Latency=64.
      Prefetchable 32 bit memory at 0xe0000000 [0xe0000008].
  Bus  0, device   1, function  0:
    PCI bridge: Intel 440BX - 82443BX AGP (rev 2).
      Medium devsel.  Master Capable.  Latency=64.  Min Gnt=136.
  Bus  0, device   7, function  0:
    ISA bridge: Intel 82371AB PIIX4 ISA (rev 2).
      Medium devsel.  Fast back-to-back capable.  Master Capable.  No
bursts.
  Bus  0, device   7, function  1:
    IDE interface: Intel 82371AB PIIX4 IDE (rev 1).
      Medium devsel.  Fast back-to-back capable.  Master Capable.
Latency=64.
      I/O at 0xf000 [0xf001].
  Bus  0, device   7, function  2:
    USB Controller: Intel 82371AB PIIX4 USB (rev 1).
      Medium devsel.  Fast back-to-back capable.  IRQ 10.  Master
Capable.  Latency=64.
      I/O at 0xe000 [0xe001].
  Bus  0, device   7, function  3:
    Bridge: Intel 82371AB PIIX4 ACPI (rev 2).
      Medium devsel.  Fast back-to-back capable.
  Bus  0, device   9, function  0:
    Multimedia audio controller: Ensoniq AudioPCI (rev 1).
      Slow devsel.  IRQ 10.  Master Capable.  Latency=64.  Min
Gnt=12.Max Lat=128.
      I/O at 0xe400 [0xe401].
  Bus  1, device   0, function  0:
    VGA compatible controller: Intel Unknown device (rev 33).
      Vendor id=8086. Device id=7800.
      Medium devsel.  Fast back-to-back capable.  IRQ 11.  Master
Capable.  No bursts.
      Prefetchable 32 bit memory at 0xe6000000 [0xe6000008].
     Non-prefetchable 32 bit memory at 0xe5000000 [0xe5000000].


I attach the kernel configuration file to this message, so that you can
see whether something isn't ok in the configuration of the kernel.
I really hope this information will be helpfull to you. I thank you for
all work you do on Linux. It's a fine system.
Yours sincerely,


Maarten Wisse




--------------6F86ACD48DBCFA0496F38BBE
Content-Type: text/plain; charset=us-ascii;
 name="kernelconf"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="kernelconf"

#
# Automatically generated make config: don't edit
#

#
# Code maturity level options
#
# CONFIG_EXPERIMENTAL is not set

#
# Processor type and features
#
# CONFIG_M386 is not set
# CONFIG_M486 is not set
# CONFIG_M586 is not set
# CONFIG_M586TSC is not set
CONFIG_M686=y
CONFIG_X86_WP_WORKS_OK=y
CONFIG_X86_INVLPG=y
CONFIG_X86_BSWAP=y
CONFIG_X86_POPAD_OK=y
CONFIG_X86_TSC=y
CONFIG_X86_GOOD_APIC=y
CONFIG_1GB=y
# CONFIG_2GB is not set
# CONFIG_MATH_EMULATION is not set
CONFIG_MTRR=y
# CONFIG_SMP is not set

#
# Loadable module support
#
CONFIG_MODULES=y
# CONFIG_MODVERSIONS is not set
CONFIG_KMOD=y

#
# General setup
#
CONFIG_NET=y
CONFIG_PCI=y
CONFIG_PCI_GOBIOS=y
# CONFIG_PCI_GODIRECT is not set
# CONFIG_PCI_GOANY is not set
CONFIG_PCI_BIOS=y
CONFIG_PCI_QUIRKS=y
CONFIG_PCI_OLD_PROC=y
# CONFIG_MCA is not set
# CONFIG_VISWS is not set
CONFIG_SYSVIPC=y
CONFIG_BSD_PROCESS_ACCT=y
CONFIG_SYSCTL=y
CONFIG_BINFMT_AOUT=y
CONFIG_BINFMT_ELF=y
CONFIG_BINFMT_MISC=y
CONFIG_PARPORT=m
CONFIG_PARPORT_PC=m
# CONFIG_PARPORT_OTHER is not set
# CONFIG_APM is not set

#
# Plug and Play support
#
# CONFIG_PNP is not set

#
# Block devices
#
CONFIG_BLK_DEV_FD=y
CONFIG_BLK_DEV_IDE=y

#
# Please see Documentation/ide.txt for help/info on IDE drives
#
# CONFIG_BLK_DEV_HD_IDE is not set
CONFIG_BLK_DEV_IDEDISK=y
CONFIG_BLK_DEV_IDECD=y
# CONFIG_BLK_DEV_IDETAPE is not set
# CONFIG_BLK_DEV_IDEFLOPPY is not set
# CONFIG_BLK_DEV_IDESCSI is not set
CONFIG_BLK_DEV_CMD640=y
# CONFIG_BLK_DEV_CMD640_ENHANCED is not set
CONFIG_BLK_DEV_RZ1000=y
CONFIG_BLK_DEV_IDEPCI=y
CONFIG_BLK_DEV_IDEDMA=y
# CONFIG_BLK_DEV_OFFBOARD is not set
CONFIG_IDEDMA_AUTO=y
# CONFIG_IDE_CHIPSETS is not set

#
# Additional Block Devices
#
# CONFIG_BLK_DEV_LOOP is not set
# CONFIG_BLK_DEV_NBD is not set
# CONFIG_BLK_DEV_MD is not set
# CONFIG_BLK_DEV_RAM is not set
# CONFIG_BLK_DEV_XD is not set
# CONFIG_BLK_DEV_DAC960 is not set
CONFIG_PARIDE_PARPORT=m
# CONFIG_PARIDE is not set
# CONFIG_BLK_CPQ_DA is not set
# CONFIG_BLK_DEV_HD is not set

#
# Networking options
#
CONFIG_PACKET=y
# CONFIG_NETLINK is not set
# CONFIG_FIREWALL is not set
# CONFIG_FILTER is not set
CONFIG_UNIX=y
CONFIG_INET=y
# CONFIG_IP_MULTICAST is not set
# CONFIG_IP_ADVANCED_ROUTER is not set
# CONFIG_IP_PNP is not set
# CONFIG_IP_ROUTER is not set
# CONFIG_NET_IPIP is not set
# CONFIG_NET_IPGRE is not set
# CONFIG_IP_ALIAS is not set
# CONFIG_SYN_COOKIES is not set

#
# (it is safe to leave these untouched)
#
# CONFIG_INET_RARP is not set
# CONFIG_SKB_LARGE is not set

#
#  
#
# CONFIG_IPX is not set
# CONFIG_ATALK is not set

#
# SCSI support
#
# CONFIG_SCSI is not set
# CONFIG_SCSI_G_NCR5380_PORT is not set
# CONFIG_SCSI_G_NCR5380_MEM is not set

#
# Network device support
#
CONFIG_NETDEVICES=y

#
# ARCnet devices
#
# CONFIG_ARCNET is not set
CONFIG_DUMMY=y
# CONFIG_EQUALIZER is not set
# CONFIG_NET_SB1000 is not set

#
# Ethernet (10 or 100Mbit)
#
# CONFIG_NET_ETHERNET is not set
# CONFIG_FDDI is not set
# CONFIG_PLIP is not set
CONFIG_PPP=m

#
# CCP compressors for PPP are only built as modules.
#
# CONFIG_SLIP is not set
# CONFIG_NET_RADIO is not set

#
# Token ring devices
#
# CONFIG_TR is not set

#
# Wan interfaces
#
# CONFIG_HOSTESS_SV11 is not set
# CONFIG_COSA is not set
# CONFIG_SEALEVEL_4021 is not set
# CONFIG_DLCI is not set
# CONFIG_WAN_DRIVERS is not set

#
# Amateur Radio support
#
# CONFIG_HAMRADIO is not set

#
# IrDA subsystem support
#
# CONFIG_IRDA is not set

#
# ISDN subsystem
#
# CONFIG_ISDN is not set

#
# Old CD-ROM drivers (not SCSI, not IDE)
#
# CONFIG_CD_NO_IDESCSI is not set

#
# Character devices
#
CONFIG_VT=y
CONFIG_VT_CONSOLE=y
CONFIG_SERIAL=m
# CONFIG_SERIAL_EXTENDED is not set
# CONFIG_SERIAL_NONSTANDARD is not set
# CONFIG_UNIX98_PTYS is not set
CONFIG_PRINTER=m
CONFIG_PRINTER_READBACK=y
CONFIG_MOUSE=y

#
# Mice
#
# CONFIG_ATIXL_BUSMOUSE is not set
# CONFIG_BUSMOUSE is not set
# CONFIG_MS_BUSMOUSE is not set
CONFIG_PSMOUSE=y
# CONFIG_82C710_MOUSE is not set
# CONFIG_PC110_PAD is not set
# CONFIG_QIC02_TAPE is not set
# CONFIG_WATCHDOG is not set
# CONFIG_NVRAM is not set
# CONFIG_RTC is not set

#
# Video For Linux
#
# CONFIG_VIDEO_DEV is not set

#
# Joystick support
#
# CONFIG_JOYSTICK is not set
# CONFIG_DTLK is not set

#
# Ftape, the floppy tape device driver
#
# CONFIG_FTAPE is not set
# CONFIG_FT_NORMAL_DEBUG is not set
# CONFIG_FT_FULL_DEBUG is not set
# CONFIG_FT_NO_TRACE is not set
# CONFIG_FT_NO_TRACE_AT_ALL is not set
# CONFIG_FT_STD_FDC is not set
# CONFIG_FT_MACH2 is not set
# CONFIG_FT_PROBE_FC10 is not set
# CONFIG_FT_ALT_FDC is not set

#
# Filesystems
#
# CONFIG_QUOTA is not set
# CONFIG_AUTOFS_FS is not set
# CONFIG_AFFS_FS is not set
# CONFIG_HFS_FS is not set
CONFIG_FAT_FS=m
CONFIG_MSDOS_FS=m
CONFIG_UMSDOS_FS=m
CONFIG_VFAT_FS=m
CONFIG_ISO9660_FS=y
CONFIG_JOLIET=y
# CONFIG_MINIX_FS is not set
# CONFIG_NTFS_FS is not set
# CONFIG_HPFS_FS is not set
CONFIG_PROC_FS=y
# CONFIG_ROMFS_FS is not set
CONFIG_EXT2_FS=y
# CONFIG_SYSV_FS is not set
# CONFIG_UFS_FS is not set

#
# Network File Systems
#
# CONFIG_CODA_FS is not set
# CONFIG_NFS_FS is not set
# CONFIG_SUNRPC is not set
# CONFIG_LOCKD is not set
# CONFIG_SMB_FS is not set
# CONFIG_NCP_FS is not set

#
# Partition Types
#
# CONFIG_BSD_DISKLABEL is not set
# CONFIG_MAC_PARTITION is not set
# CONFIG_SMD_DISKLABEL is not set
# CONFIG_SOLARIS_X86_PARTITION is not set
CONFIG_NLS=y

#
# Native Language Support
#
CONFIG_NLS_CODEPAGE_437=y
# CONFIG_NLS_CODEPAGE_737 is not set
# CONFIG_NLS_CODEPAGE_775 is not set
CONFIG_NLS_CODEPAGE_850=y
# CONFIG_NLS_CODEPAGE_852 is not set
# CONFIG_NLS_CODEPAGE_855 is not set
# CONFIG_NLS_CODEPAGE_857 is not set
# CONFIG_NLS_CODEPAGE_860 is not set
# CONFIG_NLS_CODEPAGE_861 is not set
# CONFIG_NLS_CODEPAGE_862 is not set
# CONFIG_NLS_CODEPAGE_863 is not set
# CONFIG_NLS_CODEPAGE_864 is not set
# CONFIG_NLS_CODEPAGE_865 is not set
# CONFIG_NLS_CODEPAGE_866 is not set
# CONFIG_NLS_CODEPAGE_869 is not set
# CONFIG_NLS_CODEPAGE_874 is not set
CONFIG_NLS_ISO8859_1=m
# CONFIG_NLS_ISO8859_2 is not set
# CONFIG_NLS_ISO8859_3 is not set
# CONFIG_NLS_ISO8859_4 is not set
# CONFIG_NLS_ISO8859_5 is not set
# CONFIG_NLS_ISO8859_6 is not set
# CONFIG_NLS_ISO8859_7 is not set
# CONFIG_NLS_ISO8859_8 is not set
# CONFIG_NLS_ISO8859_9 is not set
CONFIG_NLS_ISO8859_15=m
# CONFIG_NLS_KOI8_R is not set

#
# Console drivers
#
CONFIG_VGA_CONSOLE=y
# CONFIG_VIDEO_SELECT is not set

#
# Sound
#
CONFIG_SOUND=m
CONFIG_SOUND_ES1370=m
# CONFIG_SOUND_ES1371 is not set
# CONFIG_SOUND_SONICVIBES is not set
# CONFIG_SOUND_MSNDCLAS is not set
# CONFIG_SOUND_MSNDPIN is not set
# CONFIG_SOUND_OSS is not set

#
# Kernel hacking
#
# CONFIG_MAGIC_SYSRQ is not set

--------------6F86ACD48DBCFA0496F38BBE
Content-Type: text/x-vcard; charset=us-ascii;
 name="pmwisse.vcf"
Content-Transfer-Encoding: 7bit
Content-Description: Card for Maarten Wisse
Content-Disposition: attachment;
 filename="pmwisse.vcf"

begin:vcard 
n:Wisse;Maarten
tel;home:+31 183 631348
tel;work:+31 30 253 9409
x-mozilla-html:TRUE
url:www.homepages.hetnet.nl/~mwisse
org:Utrecht University;Philosophy of Religion
adr:;;Kasteleinstraat 11B;Gorinchem;;4204 AN;The Netherlands
version:2.1
email;internet:pmwisse@hetnet.nl
title:Drs.
x-mozilla-cpt:;0
fn:Maarten Wisse
end:vcard

--------------6F86ACD48DBCFA0496F38BBE--
