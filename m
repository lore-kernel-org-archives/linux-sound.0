From: "Dimitry Naldaev" <dimitryn@mail.ru>
Date: Thu, 19 Aug 1999 11:34:40 +0000
Subject: PROBLEM: I do not hear what the saytime tell me with kernel 2.2.11
Message-Id: <marc-linux-sound-93506166423057@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

PROBLEM: I do not hear what the saytime tell me with kernel 2.2.11
the programs bplay, play, saytime and so on do not work under kernel 2.2.11=
 becase I hear nothin. But in kernel 2.1.125 all work fine. Unfortunatly I =
kill 2.1.* source tree as changed on 2.2 kernel and detect the problem much=
 later, so now I have only binary form of kernel 2.1.25 and I don`t remembe=
r .config what I used. New development version 2.3.11 does not solve the pr=
oblem...
 I compare /proc/sound for 2.1.125 and 2.2.11 versions of kernel and diff s=
ay me:

    3c3
    < Kernel: Linux home 2.1.125 #8 =D2=E6=EF =C2=F2=F4 23 22:19:37 YEKST 1=
999 i586
    ---
    > Kernel: Linux home 2.2.11 #1 =D2=EF=E4 =C2=FE=FA 16 22:42:58 YEKST 19=
99 i586
    21c21
    < 0: ESS ES1688 AudioDrive (rev 11) (3.1)
    ---
    > 0: ESS ES1888 AudioDrive (rev 11) (3.01)

And I can't undertand why in older version of kernel (2.1.125) the
sound driver have fresher version (3.1) ????????????....

Is it nessecary to me use 2.2 kernel and what it can give me in return of
right sound driver???

To help you fix the problem I send /proc/suond from 2.1.125 kernel:

=3D=3D=3D=3D=3D=3D=3D=3D=3D cut here =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3DOSS/F=
ree:3.8s2++-971130
Load type: Driver compiled into kernel
Kernel: Linux home 2.1.125 #8 =D2=E6=EF =C2=F2=F4 23 22:19:37 YEKST 1999 i5=
86
Config options: 0

Installed drivers:=20
Type 1: OPL-2/OPL-3 FM
Type 26: MPU-401 (UART)
Type 2: Sound Blaster
Type 29: Sound Blaster PnP
Type 7: SB MPU-401
Type 36: SoftOSS Virtual Wave Table

Card config:=20
SoftOSS Virtual Wave Table
Sound Blaster at 0x220 irq 5 drq 1,5
SB MPU-401 at 0x330 irq 10 drq 0
OPL-2/OPL-3 FM at 0x388 drq 0

Audio devices:
0: ESS ES1688 AudioDrive (rev 11) (3.1)

Synth devices:
0: SoftOSS
1: Yamaha OPL3

Midi devices:
0: ESS ES1688

Timers:
0: System clock
1: SoftOSS

Mixers:
0: Sound Blaster
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D cut here =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
The ver_linux say to me:

    -- Versions installed: (if some fields are empty or looks
    -- unusual then possibly you have very old versions)
    Linux home 2.1.125 #8 =D2=E6=EF =C2=F2=F4 23 22:19:37 YEKST 1999 i586 u=
nknown
    Kernel modules         2.1.121
    Gnu C                  2.7.2.3
    Binutils               2.9.1.0.19
    Linux C Library        2.0.7
    Dynamic linker         ldd: version 1.9.10
    Procps                 1.2.9
    Mount                  2.9g
    Net-tools              2.01
    Console-tools          1998.08.11
    Sh-utils               1.16
    Modules Loaded         nls_koi8-r nls_cp866 vfat fat

and (in next time):

    -- Versions installed: (if some fields are empty or looks
    -- unusual then possibly you have very old versions)
    Linux home 2.2.11 #1 =D2=EF=E4 =C2=FE=FA 16 22:42:58 YEKST 1999 i586 un=
known
    Kernel modules         2.1.121
    Gnu C                  2.7.2.3
    Binutils               2.9.1.0.19
    Linux C Library        2.0.7
    Dynamic linker         ldd: version 1.9.10
    Procps                 1.2.9
    Mount                  2.9g
    Net-tools              2.01
    Kbd                   =20
    Sh-utils               1.16
    Modules Loaded         unix nls_koi8-r nls_cp866 vfat fat
   =20

and .config from 2.2.11 version of kernel:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D cut here =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D#
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
CONFIG_M586TSC=3Dy
# CONFIG_M686 is not set
CONFIG_X86_WP_WORKS_OK=3Dy
CONFIG_X86_INVLPG=3Dy
CONFIG_X86_BSWAP=3Dy
CONFIG_X86_POPAD_OK=3Dy
CONFIG_X86_TSC=3Dy
CONFIG_1GB=3Dy
# CONFIG_2GB is not set
# CONFIG_MATH_EMULATION is not set
# CONFIG_MTRR is not set
# CONFIG_SMP is not set

#
# Loadable module support
#
CONFIG_MODULES=3Dy
# CONFIG_MODVERSIONS is not set
CONFIG_KMOD=3Dy

#
# General setup
#
CONFIG_NET=3Dy
CONFIG_PCI=3Dy
# CONFIG_PCI_GOBIOS is not set
# CONFIG_PCI_GODIRECT is not set
CONFIG_PCI_GOANY=3Dy
CONFIG_PCI_BIOS=3Dy
CONFIG_PCI_DIRECT=3Dy
CONFIG_PCI_QUIRKS=3Dy
CONFIG_PCI_OLD_PROC=3Dy
# CONFIG_MCA is not set
# CONFIG_VISWS is not set
CONFIG_SYSVIPC=3Dy
# CONFIG_BSD_PROCESS_ACCT is not set
CONFIG_SYSCTL=3Dy
CONFIG_BINFMT_AOUT=3Dm
CONFIG_BINFMT_ELF=3Dy
CONFIG_BINFMT_MISC=3Dy
CONFIG_PARPORT=3Dy
CONFIG_PARPORT_PC=3Dy
CONFIG_PARPORT_OTHER=3Dy
CONFIG_APM=3Dy
# CONFIG_APM_IGNORE_USER_SUSPEND is not set
# CONFIG_APM_DO_ENABLE is not set
# CONFIG_APM_CPU_IDLE is not set
# CONFIG_APM_DISPLAY_BLANK is not set
# CONFIG_APM_POWER_OFF is not set
# CONFIG_APM_IGNORE_MULTIPLE_SUSPEND is not set
# CONFIG_APM_IGNORE_SUSPEND_BOUNCE is not set
CONFIG_APM_RTC_IS_GMT=3Dy
# CONFIG_APM_ALLOW_INTS is not set

#
# Plug and Play support
#
CONFIG_PNP=3Dy
CONFIG_PNP_PARPORT=3Dy

#
# Block devices
#
CONFIG_BLK_DEV_FD=3Dy
CONFIG_BLK_DEV_IDE=3Dy

#
# Please see Documentation/ide.txt for help/info on IDE drives
#
# CONFIG_BLK_DEV_HD_IDE is not set
CONFIG_BLK_DEV_IDEDISK=3Dy
CONFIG_BLK_DEV_IDECD=3Dy
# CONFIG_BLK_DEV_IDETAPE is not set
# CONFIG_BLK_DEV_IDEFLOPPY is not set
# CONFIG_BLK_DEV_IDESCSI is not set
# CONFIG_BLK_DEV_CMD640 is not set
# CONFIG_BLK_DEV_RZ1000 is not set
CONFIG_BLK_DEV_IDEPCI=3Dy
CONFIG_BLK_DEV_IDEDMA=3Dy
# CONFIG_BLK_DEV_OFFBOARD is not set
CONFIG_IDEDMA_AUTO=3Dy
# CONFIG_IDE_CHIPSETS is not set

#
# Additional Block Devices
#
CONFIG_BLK_DEV_LOOP=3Dm
CONFIG_BLK_DEV_NBD=3Dm
# CONFIG_BLK_DEV_MD is not set
CONFIG_BLK_DEV_RAM=3Dm
# CONFIG_BLK_DEV_XD is not set
# CONFIG_BLK_DEV_DAC960 is not set
CONFIG_PARIDE_PARPORT=3Dy
# CONFIG_PARIDE is not set
# CONFIG_BLK_CPQ_DA is not set
# CONFIG_BLK_DEV_HD is not set

#
# Networking options
#
CONFIG_PACKET=3Dm
# CONFIG_NETLINK is not set
# CONFIG_FIREWALL is not set
# CONFIG_FILTER is not set
CONFIG_UNIX=3Dm
CONFIG_INET=3Dy
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
# =20
#
# CONFIG_IPX is not set
# CONFIG_ATALK is not set

#
# SCSI support
#
CONFIG_SCSI=3Dm

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=3Dm
# CONFIG_CHR_DEV_ST is not set
# CONFIG_BLK_DEV_SR is not set
CONFIG_CHR_DEV_SG=3Dm

#
# Some SCSI devices (e.g. CD jukebox) support multiple LUNs
#
# CONFIG_SCSI_MULTI_LUN is not set
# CONFIG_SCSI_CONSTANTS is not set
# CONFIG_SCSI_LOGGING is not set

#
# SCSI low-level drivers
#
# CONFIG_SCSI_7000FASST is not set
# CONFIG_SCSI_ACARD is not set
# CONFIG_SCSI_AHA152X is not set
# CONFIG_SCSI_AHA1542 is not set
# CONFIG_SCSI_AHA1740 is not set
# CONFIG_SCSI_AIC7XXX is not set
# CONFIG_SCSI_ADVANSYS is not set
# CONFIG_SCSI_IN2000 is not set
# CONFIG_SCSI_AM53C974 is not set
# CONFIG_SCSI_MEGARAID is not set
# CONFIG_SCSI_BUSLOGIC is not set
# CONFIG_SCSI_DTC3280 is not set
# CONFIG_SCSI_EATA is not set
# CONFIG_SCSI_EATA_DMA is not set
# CONFIG_SCSI_EATA_PIO is not set
# CONFIG_SCSI_FUTURE_DOMAIN is not set
# CONFIG_SCSI_GDTH is not set
# CONFIG_SCSI_GENERIC_NCR5380 is not set
# CONFIG_SCSI_G_NCR5380_PORT is not set
# CONFIG_SCSI_G_NCR5380_MEM is not set
# CONFIG_SCSI_INITIO is not set
# CONFIG_SCSI_INIA100 is not set
CONFIG_SCSI_PPA=3Dm
CONFIG_SCSI_IMM=3Dm
# CONFIG_SCSI_IZIP_EPP16 is not set
# CONFIG_SCSI_IZIP_SLOW_CTR is not set
# CONFIG_SCSI_NCR53C406A is not set
# CONFIG_SCSI_SYM53C416 is not set
# CONFIG_SCSI_NCR53C7xx is not set
# CONFIG_SCSI_NCR53C8XX is not set
# CONFIG_SCSI_SYM53C8XX is not set
# CONFIG_SCSI_PAS16 is not set
# CONFIG_SCSI_PCI2000 is not set
# CONFIG_SCSI_PCI2220I is not set
# CONFIG_SCSI_PSI240I is not set
# CONFIG_SCSI_QLOGIC_FAS is not set
# CONFIG_SCSI_QLOGIC_ISP is not set
# CONFIG_SCSI_QLOGIC_FC is not set
# CONFIG_SCSI_SEAGATE is not set
# CONFIG_SCSI_DC390T is not set
# CONFIG_SCSI_T128 is not set
# CONFIG_SCSI_U14_34F is not set
# CONFIG_SCSI_ULTRASTOR is not set

#
# Network device support
#
CONFIG_NETDEVICES=3Dy

#
# ARCnet devices
#
# CONFIG_ARCNET is not set
CONFIG_DUMMY=3Dm
# CONFIG_EQUALIZER is not set
# CONFIG_NET_SB1000 is not set

#
# Ethernet (10 or 100Mbit)
#
CONFIG_NET_ETHERNET=3Dy
# CONFIG_NET_VENDOR_3COM is not set
# CONFIG_LANCE is not set
# CONFIG_NET_VENDOR_SMC is not set
# CONFIG_NET_VENDOR_RACAL is not set
CONFIG_NET_ISA=3Dy
# CONFIG_AT1700 is not set
# CONFIG_E2100 is not set
# CONFIG_DEPCA is not set
# CONFIG_EWRK3 is not set
# CONFIG_EEXPRESS is not set
# CONFIG_EEXPRESS_PRO is not set
# CONFIG_FMV18X is not set
# CONFIG_HPLAN_PLUS is not set
# CONFIG_HPLAN is not set
# CONFIG_HP100 is not set
CONFIG_NE2000=3Dm
# CONFIG_SK_G16 is not set
CONFIG_NET_EISA=3Dy
# CONFIG_PCNET32 is not set
# CONFIG_APRICOT is not set
# CONFIG_CS89x0 is not set
# CONFIG_DE4X5 is not set
# CONFIG_DEC_ELCP is not set
# CONFIG_DGRS is not set
CONFIG_EEXPRESS_PRO100=3Dm
CONFIG_NE2K_PCI=3Dm
# CONFIG_TLAN is not set
# CONFIG_VIA_RHINE is not set
# CONFIG_NET_POCKET is not set
# CONFIG_FDDI is not set
CONFIG_PLIP=3Dm
CONFIG_PPP=3Dm

#
# CCP compressors for PPP are only built as modules.
#
CONFIG_SLIP=3Dm
# CONFIG_SLIP_COMPRESSED is not set
# CONFIG_SLIP_SMART is not set
# CONFIG_SLIP_MODE_SLIP6 is not set
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
CONFIG_VT=3Dy
CONFIG_VT_CONSOLE=3Dy
CONFIG_SERIAL=3Dy
# CONFIG_SERIAL_CONSOLE is not set
# CONFIG_SERIAL_EXTENDED is not set
# CONFIG_SERIAL_NONSTANDARD is not set
CONFIG_UNIX98_PTYS=3Dy
CONFIG_UNIX98_PTY_COUNT%6
CONFIG_PRINTER=3Dy
CONFIG_PRINTER_READBACK=3Dy
# CONFIG_MOUSE is not set
# CONFIG_QIC02_TAPE is not set
# CONFIG_WATCHDOG is not set
CONFIG_NVRAM=3Dm
CONFIG_RTC=3Dy

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
CONFIG_AUTOFS_FS=3Dm
# CONFIG_AFFS_FS is not set
# CONFIG_HFS_FS is not set
CONFIG_FAT_FS=3Dm
# CONFIG_MSDOS_FS is not set
CONFIG_VFAT_FS=3Dm
CONFIG_ISO9660_FS=3Dy
CONFIG_JOLIET=3Dy
CONFIG_MINIX_FS=3Dm
# CONFIG_NTFS_FS is not set
# CONFIG_HPFS_FS is not set
CONFIG_PROC_FS=3Dy
CONFIG_DEVPTS_FS=3Dy
# CONFIG_ROMFS_FS is not set
CONFIG_EXT2_FS=3Dy
# CONFIG_SYSV_FS is not set
CONFIG_UFS_FS=3Dm
CONFIG_UFS_FS_WRITE=3Dy

#
# Network File Systems
#
CONFIG_CODA_FS=3Dm
CONFIG_NFS_FS=3Dm
CONFIG_SUNRPC=3Dm
CONFIG_LOCKD=3Dm
CONFIG_SMB_FS=3Dm
# CONFIG_NCP_FS is not set

#
# Partition Types
#
CONFIG_BSD_DISKLABEL=3Dy
# CONFIG_MAC_PARTITION is not set
# CONFIG_SMD_DISKLABEL is not set
# CONFIG_SOLARIS_X86_PARTITION is not set
CONFIG_NLS=3Dy

#
# Native Language Support
#
# CONFIG_NLS_CODEPAGE_437 is not set
# CONFIG_NLS_CODEPAGE_737 is not set
# CONFIG_NLS_CODEPAGE_775 is not set
# CONFIG_NLS_CODEPAGE_850 is not set
# CONFIG_NLS_CODEPAGE_852 is not set
# CONFIG_NLS_CODEPAGE_855 is not set
# CONFIG_NLS_CODEPAGE_857 is not set
# CONFIG_NLS_CODEPAGE_860 is not set
# CONFIG_NLS_CODEPAGE_861 is not set
# CONFIG_NLS_CODEPAGE_862 is not set
# CONFIG_NLS_CODEPAGE_863 is not set
# CONFIG_NLS_CODEPAGE_864 is not set
# CONFIG_NLS_CODEPAGE_865 is not set
CONFIG_NLS_CODEPAGE_866=3Dm
# CONFIG_NLS_CODEPAGE_869 is not set
# CONFIG_NLS_CODEPAGE_874 is not set
# CONFIG_NLS_ISO8859_1 is not set
# CONFIG_NLS_ISO8859_2 is not set
# CONFIG_NLS_ISO8859_3 is not set
# CONFIG_NLS_ISO8859_4 is not set
# CONFIG_NLS_ISO8859_5 is not set
# CONFIG_NLS_ISO8859_6 is not set
# CONFIG_NLS_ISO8859_7 is not set
# CONFIG_NLS_ISO8859_8 is not set
# CONFIG_NLS_ISO8859_9 is not set
# CONFIG_NLS_ISO8859_15 is not set
CONFIG_NLS_KOI8_R=3Dm

#
# Console drivers
#
CONFIG_VGA_CONSOLE=3Dy
# CONFIG_VIDEO_SELECT is not set

#
# Sound
#
CONFIG_SOUND=3Dy
# CONFIG_SOUND_ES1370 is not set
# CONFIG_SOUND_ES1371 is not set
# CONFIG_SOUND_SONICVIBES is not set
# CONFIG_SOUND_MSNDCLAS is not set
# CONFIG_SOUND_MSNDPIN is not set
CONFIG_SOUND_OSS=3Dy
CONFIG_SOUND_DMAP=3Dy
# CONFIG_SOUND_PAS is not set
CONFIG_SOUND_SB=3Dy
CONFIG_SB_BASE"0
CONFIG_SB_IRQ=3D5
CONFIG_SB_DMA=3D1
CONFIG_SB_DMA2=3D5
CONFIG_SB_MPU_BASE30

#
# MPU401 IRQ is only required with Jazz16, SM Wave and ESS1688.
#

#
# Enter -1 to the following question if you have something else such as SB1=
6/32.
#
CONFIG_SB_MPU_IRQ=10
# CONFIG_SOUND_ADLIB is not set
# CONFIG_SOUND_GUS is not set
# CONFIG_SOUND_MPU401 is not set
# CONFIG_SOUND_PSS is not set
# CONFIG_SOUND_MSS is not set
# CONFIG_SOUND_SSCAPE is not set
# CONFIG_SOUND_TRIX is not set
# CONFIG_SOUND_MAD16 is not set
# CONFIG_SOUND_WAVEFRONT is not set
# CONFIG_SOUND_CS4232 is not set
# CONFIG_SOUND_OPL3SA2 is not set
# CONFIG_SOUND_MAUI is not set
# CONFIG_SOUND_SGALAXY is not set
# CONFIG_SOUND_OPL3SA1 is not set
CONFIG_SOUND_SOFTOSS=3Dy
CONFIG_SOFTOSS_RATE"050
CONFIG_SOFTOSS_VOICES2
CONFIG_SOUND_YM3812=3Dy
CONFIG_SOUND_VMIDI=3Dm
# CONFIG_SOUND_UART6850 is not set

#
# Additional low level sound drivers
#
# CONFIG_LOWLEVEL_SOUND is not set

#
# Kernel hacking
#
CONFIG_MAGIC_SYSRQ=3Dy
