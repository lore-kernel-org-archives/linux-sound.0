From: marceln@pion.xs4all.nl
Date: Thu, 24 May 2001 14:37:14 +0000
Subject: Kernel hang on a smp system with a es1371 sound card
Message-Id: <marc-linux-sound-99071516030392@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

Hi,

I had a lot of kernel hangs with an smb system. The sound card
makes a gives a high peep sound and the system doesn't respond
any more. The only thing i can do is press the reset button.

I have bound the interupt of the sound card to one cpu. After
that i didn't see the problem any more. But i guess there is
a race condition in the es1371 driver which causes an smp system
to hang.

Some system information:
	Kernel: 2.4.4
	Patch: patch-int-2.4.3.1 (Encrypted disc patch)

	Motherbord: bp6=20
	cpu: 2*466 Celeron (Steping 5)

Marceln

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D# cat /proc/interrupts=20
-----------------------------------------------------------------
           CPU0       CPU1      =20
  0:   11619471   11887185    IO-APIC-edge  timer
  1:      24472      23769    IO-APIC-edge  keyboard
  2:          0          0          XT-PIC  cascade
  8:          0          1    IO-APIC-edge  rtc
 12:    1993195    2015750    IO-APIC-edge  PS/2 Mouse
 14:        355        475    IO-APIC-edge  ide0
 15:          4          2    IO-APIC-edge  ide1
 17:     352644      11290   IO-APIC-level  es1371
 18:     200934     207812   IO-APIC-level  ide2
 19:     456306     457508   IO-APIC-level  usb-uhci, eth0
NMI:          0          0=20
LOC:   23509381   23509380=20
ERR:          2

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D# cat /proc/irq/17/smp_affinity=20
-----------------------------------------------------------------
00000001

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D# cat /proc/pci=20
-----------------------------------------------------------------

PCI devices found:
  Bus  0, device   0, function  0:
    Host bridge: Intel Corporation 440BX/ZX - 82443BX/ZX Host bridge (rev 3=
).
      Master Capable.  Latency2. =20
      Prefetchable 32 bit memory at 0xe0000000 [0xe3ffffff].
  Bus  0, device   1, function  0:
    PCI bridge: Intel Corporation 440BX/ZX - 82443BX/ZX AGP bridge (rev 3).
      Master Capable.  Latencyd.  Min Gnt=136.
  Bus  0, device   7, function  0:
    ISA bridge: Intel Corporation 82371AB PIIX4 ISA (rev 2).
  Bus  0, device   7, function  1:
    IDE interface: Intel Corporation 82371AB PIIX4 IDE (rev 1).
      Master Capable.  Latency2. =20
      I/O at 0xf000 [0xf00f].
  Bus  0, device   7, function  2:
    USB Controller: Intel Corporation 82371AB PIIX4 USB (rev 1).
      IRQ 19.
      Master Capable.  Latency2. =20
      I/O at 0xc000 [0xc01f].
  Bus  0, device   7, function  3:
    Bridge: Intel Corporation 82371AB PIIX4 ACPI (rev 2).
      IRQ 9.
  Bus  0, device   9, function  0:
    SCSI storage controller: Initio Corporation INI-940 (rev 1).
      IRQ 19.
      Master Capable.  Latency2. =20
      I/O at 0xc400 [0xc4ff].
      Non-prefetchable 32 bit memory at 0xed000000 [0xed000fff].
  Bus  0, device  13, function  0:
    Multimedia audio controller: Ensoniq ES1371 [AudioPCI-97] (rev 6).
      IRQ 17.
      Master Capable.  Latency2.  Min Gnt=12.Max Lat=128.
      I/O at 0xc800 [0xc83f].
  Bus  0, device  15, function  0:
    Multimedia video controller: Brooktree Corporation Bt848 TV with DMA pu=
sh (rev 18).
      IRQ 16.
      Master Capable.  Latency2.  Min Gnt=16.Max Lat@.
      Prefetchable 32 bit memory at 0xed001000 [0xed001fff].
  Bus  0, device  17, function  0:
    Ethernet controller: Winbond Electronics Corp W89C940 (rev 0).
      IRQ 19.
      I/O at 0xcc00 [0xcc1f].
  Bus  0, device  19, function  0:
    Unknown mass storage controller: Triones Technologies, Inc. HPT366 (rev=
 1).
      IRQ 18.
      Master Capable.  Latency=120.  Min Gnt=3D8.Max Lat=3D8.
      I/O at 0xd000 [0xd007].
      I/O at 0xd400 [0xd403].
      I/O at 0xd800 [0xd8ff].
  Bus  0, device  19, function  1:
    Unknown mass storage controller: Triones Technologies, Inc. HPT366 (#2)=
 (rev 1).
      IRQ 18.
      Master Capable.  Latency=120.  Min Gnt=3D8.Max Lat=3D8.
      I/O at 0xdc00 [0xdc07].
      I/O at 0xe000 [0xe003].
      I/O at 0xe400 [0xe4ff].
  Bus  1, device   0, function  0:
    VGA compatible controller: Matrox Graphics, Inc. MGA G400 AGP (rev 3).
      IRQ 16.
      Master Capable.  Latency2.  Min Gnt=16.Max Lat2.
      Prefetchable 32 bit memory at 0xe8000000 [0xe9ffffff].
      Non-prefetchable 32 bit memory at 0xe4000000 [0xe4003fff].
      Non-prefetchable 32 bit memory at 0xe5000000 [0xe57fffff].

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D# Boot log from /var/adm/messages
-----------------------------------------------------------------
klogd 1.4-0, log source =3D /proc/kmsg started.
Inspecting /boot/System.map-2.4.4-02smp
Loaded 12700 symbols from /boot/System.map-2.4.4-02smp.
Symbols match kernel version 2.4.4.
Loaded 185 symbols from 7 modules.
Linux version 2.4.4-02smp (root@paard.huis.local) (gcc version egcs-2.91.66=
 19990314/Linux (egcs-1.1.2 release)) #7 SMP Sat May 5 16:48:04 CEST 2001
BIOS-provided physical RAM map:
 BIOS-e820: 0000000000000000 - 000000000009fc00 (usable)
 BIOS-e820: 000000000009fc00 - 00000000000a0000 (reserved)
 BIOS-e820: 00000000000f0000 - 0000000000100000 (reserved)
 BIOS-e820: 0000000000100000 - 0000000010000000 (usable)
 BIOS-e820: 00000000fec00000 - 00000000fec01000 (reserved)
 BIOS-e820: 00000000fee00000 - 00000000fee01000 (reserved)
 BIOS-e820: 00000000ffff0000 - 0000000100000000 (reserved)
Scan SMP from c0000000 for 1024 bytes.
Scan SMP from c009fc00 for 1024 bytes.
Scan SMP from c00f0000 for 65536 bytes.
found SMP MP-table at 000f5b90
hm, page 000f5000 reserved twice.
hm, page 000f6000 reserved twice.
hm, page 000f1000 reserved twice.
hm, page 000f2000 reserved twice.
On node 0 totalpages: 65536
zone(0): 4096 pages.
zone(1): 61440 pages.
zone(2): 0 pages.
Intel MultiProcessor Specification v1.1
    Virtual Wire compatibility mode.
OEM ID: OEM00000 Product ID: PROD00000000 APIC at: 0xFEE00000
Processor #0 Pentium(tm) Pro APIC version 17
    Floating point unit present.
    Machine Exception supported.
    64 bit compare & exchange supported.
    Internal APIC present.
    SEP present.
    MTRR  present.
    PGE  present.
    MCA  present.
    CMOV  present.
    Bootup CPU
Processor #1 Pentium(tm) Pro APIC version 17
    Floating point unit present.
    Machine Exception supported.
    64 bit compare & exchange supported.
    Internal APIC present.
    SEP present.
    MTRR  present.
    PGE  present.
    MCA  present.
    CMOV  present.
Bus #0 is PCI  =20
Bus #1 is PCI  =20
Bus #2 is ISA  =20
I/O APIC #2 Version 17 at 0xFEC00000.
Int: type 3, pol 0, trig 0, bus 2, IRQ 00, APIC ID 2, APIC INT 00
Int: type 0, pol 0, trig 0, bus 2, IRQ 01, APIC ID 2, APIC INT 01
Int: type 0, pol 0, trig 0, bus 2, IRQ 00, APIC ID 2, APIC INT 02
Int: type 0, pol 0, trig 0, bus 2, IRQ 03, APIC ID 2, APIC INT 03
Int: type 0, pol 0, trig 0, bus 2, IRQ 04, APIC ID 2, APIC INT 04
Int: type 0, pol 0, trig 0, bus 2, IRQ 06, APIC ID 2, APIC INT 06
Int: type 0, pol 0, trig 0, bus 2, IRQ 07, APIC ID 2, APIC INT 07
Int: type 0, pol 1, trig 1, bus 2, IRQ 08, APIC ID 2, APIC INT 08
Int: type 0, pol 0, trig 0, bus 2, IRQ 0c, APIC ID 2, APIC INT 0c
Int: type 0, pol 0, trig 0, bus 2, IRQ 0d, APIC ID 2, APIC INT 0d
Int: type 0, pol 0, trig 0, bus 2, IRQ 0e, APIC ID 2, APIC INT 0e
Int: type 0, pol 0, trig 0, bus 2, IRQ 0f, APIC ID 2, APIC INT 0f
Int: type 0, pol 3, trig 3, bus 0, IRQ 1c, APIC ID 2, APIC INT 13
Int: type 0, pol 3, trig 3, bus 0, IRQ 24, APIC ID 2, APIC INT 13
Int: type 0, pol 3, trig 3, bus 0, IRQ 34, APIC ID 2, APIC INT 11
Int: type 0, pol 3, trig 3, bus 0, IRQ 3c, APIC ID 2, APIC INT 10
Int: type 0, pol 3, trig 3, bus 0, IRQ 44, APIC ID 2, APIC INT 13
Int: type 0, pol 3, trig 3, bus 0, IRQ 4c, APIC ID 2, APIC INT 12
Int: type 0, pol 3, trig 3, bus 0, IRQ 4d, APIC ID 2, APIC INT 12
Int: type 0, pol 3, trig 3, bus 1, IRQ 00, APIC ID 2, APIC INT 10
Int: type 2, pol 0, trig 0, bus 2, IRQ 00, APIC ID 2, APIC INT 17
Lint: type 3, pol 0, trig 0, bus 0, IRQ 00, APIC ID ff, APIC LINT 00
Lint: type 1, pol 0, trig 0, bus 0, IRQ 00, APIC ID ff, APIC LINT 01
Processors: 2
mapped APIC to ffffe000 (fee00000)
mapped IOAPIC to ffffd000 (fec00000)
Kernel command line: auto BOOT_IMAGE=3Dlinux ro root!01 BOOT_FILE=3D/boot/v=
mlinuz-2.4.4-02smp
Initializing CPU#0
Detected 467.732 MHz processor.
Console: colour VGA+ 80x25
Calibrating delay loop... 933.88 BogoMIPS
Memory: 255780k/262144k available (810k kernel code, 5976k reserved, 271k d=
ata, 200k init, 0k highmem)
Dentry-cache hash table entries: 32768 (order: 6, 262144 bytes)
Buffer-cache hash table entries: 16384 (order: 4, 65536 bytes)
Page-cache hash table entries: 65536 (order: 6, 262144 bytes)
Inode-cache hash table entries: 16384 (order: 5, 131072 bytes)
CPU: L1 I cache: 16K, L1 D cache: 16K
CPU: L2 cache: 128K
Intel machine check architecture supported.
Intel machine check reporting enabled on CPU#0.
Enabling fast FPU save and restore... done.
Checking 'hlt' instruction... OK.
POSIX conformance testing by UNIFIX
mtrr: v1.40 (20010327) Richard Gooch (rgooch@atnf.csiro.au)
mtrr: detected mtrr type: Intel
CPU: L1 I cache: 16K, L1 D cache: 16K
CPU: L2 cache: 128K
Intel machine check reporting enabled on CPU#0.
CPU0: Intel Celeron (Mendocino) stepping 05
per-CPU timeslice cutoff: 365.67 usecs.
Getting VERSION: 40011
Getting VERSION: 40011
Getting ID: 0
Getting ID: f000000
Getting LVT0: 700
Getting LVT1: 400
enabled ExtINT on CPU#0
ESR value before enabling vector: 00000000
ESR value after enabling vector: 00000000
CPU present map: 3
Booting processor 1/1 eip 2000
Setting warm reset code and vector.
1.
2.
3.
Asserting INIT.
Waiting for send to finish...
+Deasserting INIT.
Waiting for send to finish...
+#startup loops: 2.
Sending STARTUP #1.
After apic_write.
Initializing CPU#1
CPU#1 (phys ID: 1) waiting for CALLOUT
Startup point 1.
Waiting for send to finish...
+Sending STARTUP #2.
After apic_write.
Startup point 1.
Waiting for send to finish...
+After Startup.
Before Callout 1.
After Callout 1.
CALLIN, before setup_local_APIC().
masked ExtINT on CPU#1
ESR value before enabling vector: 00000000
ESR value after enabling vector: 00000000
Calibrating delay loop... 933.88 BogoMIPS
Stack at about c15fffbc
CPU: L1 I cache: 16K, L1 D cache: 16K
CPU: L2 cache: 128K
Intel machine check reporting enabled on CPU#1.
OK.
CPU1: Intel Celeron (Mendocino) stepping 05
CPU has booted.
Before bogomips.
Total of 2 processors activated (1867.77 BogoMIPS).
Before bogocount - setting activated=3D1.
Boot done.
ENABLING IO-APIC IRQs
...changing IO-APIC physical APIC ID to 2 ... ok.
Synchronizing Arb IDs.
..TIMER: vectorI pin1=3D2 pin2=3D0
testing the IO APIC.......................

.................................... done.
calibrating APIC timer ...
..... CPU clock speed is 467.6797 MHz.
..... host bus clock speed is 66.8113 MHz.
cpu: 0, clocks: 668113, slice: 222704
CPU0<T0:668112,T1:445408,D:0,S:222704,C:668113>
cpu: 1, clocks: 668113, slice: 222704
CPU1<T0:668112,T1:222704,D:0,S:222704,C:668113>
checking TSC synchronization across CPUs: passed.
Setting commenced=3D1, go go go
mtrr: your CPUs had inconsistent fixed MTRR settings
mtrr: probably your BIOS does not setup all CPUs
PCI: PCI BIOS revision 2.10 entry at 0xfb440, last bus=3D1
PCI: Using configuration type 1
PCI: Probing PCI hardware
Unknown bridge resource 0: assuming transparent
PCI: Using IRQ router PIIX [8086/7110] at 00:07.0
PCI->APIC IRQ transform: (B0,I7,P3) -> 19
PCI->APIC IRQ transform: (B0,I9,P0) -> 19
PCI->APIC IRQ transform: (B0,I13,P0) -> 17
PCI->APIC IRQ transform: (B0,I15,P0) -> 16
PCI->APIC IRQ transform: (B0,I17,P0) -> 19
PCI->APIC IRQ transform: (B0,I19,P0) -> 18
PCI->APIC IRQ transform: (B0,I19,P1) -> 18
PCI->APIC IRQ transform: (B1,I0,P0) -> 16
Limiting direct PCI/PCI transfers.
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
pty: 256 Unix98 ptys configured
block: queued sectors max/low 169893kB/56631kB, 512 slots per queue
Uniform Multi-Platform E-IDE driver Revision: 6.31
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=3D=
xx
PIIX4: IDE controller on PCI bus 00 dev 39
PIIX4: chipset revision 1
PIIX4: not 100%% native mode: will probe irqs later
    ide0: BM-DMA at 0xf000-0xf007, BIOS settings: hda:pio, hdb:pio
    ide1: BM-DMA at 0xf008-0xf00f, BIOS settings: hdc:pio, hdd:pio
HPT366: onboard version of chipset, pin1=3D1 pin2=3D2
HPT366: IDE controller on PCI bus 00 dev 98
PCI: Enabling device 00:13.0 (0005 -> 0007)
HPT366: chipset revision 1
HPT366: not 100%% native mode: will probe irqs later
    ide2: BM-DMA at 0xd800-0xd807, BIOS settings: hde:DMA, hdf:pio
HPT366: IDE controller on PCI bus 00 dev 99
HPT366: chipset revision 1
HPT366: not 100%% native mode: will probe irqs later
    ide3: BM-DMA at 0xe400-0xe407, BIOS settings: hdg:pio, hdh:pio
hda: WDC AC2120M, ATA DISK drive
hdc: ST3144AT, ATA DISK drive
hdd: CD-ROM 40X/AKU, ATAPI CD/DVD-ROM drive
hde: WDC AC418000D, ATA DISK drive
ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
ide1 at 0x170-0x177,0x376 on irq 15
ide2 at 0xd000-0xd007,0xd402 on irq 18
hda: 244160 sectors (125 MB) w/32KiB Cache, CHS=872/8/35
hdc: 255255 sectors (131 MB) w/32KiB Cache, CHS=1001/15/17
hde: 35239680 sectors (18043 MB) w/1966KiB Cache, CHS4960/16/63, UDMA(33)
Partition check:
 hda: hda1 hda2 hda4
 hdc: hdc1
 hde: hde1 hde2 hde3 hde4 < hde5 hde6 hde7 hde8 hde9 >
Real Time Clock Driver v1.10d
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 2048 buckets, 16Kbytes
TCP: Hash tables configured (established 16384 bind 16384)
Linux IP multicast router 0.06 plus PIM-SM
VFS: Mounted root (ext2 filesystem) readonly.
Freeing unused kernel memory: 200k freed
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
Adding Swap: 516088k swap-space (priority -1)
usb.c: registered new driver usbdevfs
usb.c: registered new driver hub
usb-uhci.c: $Revision: 1.259 $ time 16:54:22 May  5 2001
usb-uhci.c: High bandwidth mode enabled
usb-uhci.c: USB UHCI at I/O 0xc000, IRQ 19
usb-uhci.c: Detected 2 ports
usb.c: new USB bus registered, assigned bus number 1
Product: USB UHCI Root Hub
SerialNumber: c000
hub.c: USB hub found
hub.c: 2 ports detected
md driver 0.90.0 MAX_MD_DEVS%6, MD_SB_DISKS'
md.c: sizeof(mdp_super_t) =3D 4096
reiserfs: checking transaction log (device 21:03) ...
reiserfs: replayed 14 transactions in 3 seconds
Using r5 hash to sort names
ReiserFS version 3.6.25
reiserfs: checking transaction log (device 21:06) ...
reiserfs: replayed 8 transactions in 3 seconds
Using r5 hash to sort names
ReiserFS version 3.6.25
ne2k-pci.c:v1.02 10/19/2000 D. Becker/P. Gortmaker
  http://www.scyld.com/network/ne2k-pci.html
eth0: Winbond 89C940 found at 0xcc00, IRQ 19, 48:54:E8:8B:FB:5E.
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
es1371: version v0.30 time 16:53:11 May  5 2001
es1371: found chip, vendor id 0x1274 device id 0x1371 revision 0x06
es1371: found es1371 rev 6 at io 0xc800 irq 17
es1371: features: joystick 0x0
ac97_codec: AC97 Audio codec, id: 0x8384:0x7609 (SigmaTel STAC9721/23)
inserting floppy driver for 2.4.4-02smp
Floppy drive(s): fd0 is 1.44M
FDC 0 is a post-1991 82077
reiserfs: checking transaction log (device 21:08) ...
reiserfs: replayed 3 transactions in 3 seconds
Using r5 hash to sort names
ReiserFS version 3.6.25
loop: loaded (max 8 devices)
cipher-idea-cbccipher-idea<6>cryptoapi: Registered idea-ecb (0)
cryptoapi: Registered idea-cbc (65536)
Linux video capture interface: v1.00
i2c-core.o: i2c core module
i2c-algo-bit.o: i2c bit algorithm module
bttv: driver version 0.7.57 loaded
bttv: using 2 buffers with 2080k (4160k total) for capture
bttv: Host bridge needs ETBF enabled.
bttv: Bt8xx card found (0).
bttv0: Bt848 (rev 18) at 00:0f.0, irq: 16, latency: 32, memory: 0xed001000
bttv0: model: BT848A(Pinnacle PCTV Studio/Ra) [insmod option]
bttv0: enabling 430FX/VP3 compatibilty
i2c-algo-bit.o: Adapter: bt848 #0 scl: 1  sda: 1 -- testing...
i2c-algo-bit.o:1 scl: 1  sda: 0=20
i2c-algo-bit.o:2 scl: 1  sda: 1=20
i2c-algo-bit.o:3 scl: 0  sda: 1=20
i2c-algo-bit.o:4 scl: 1  sda: 1=20
i2c-algo-bit.o: bt848 #0 passed test.
i2c-core.o: adapter bt848 #0 registered as adapter 0.
bttv0: i2c: checking for MSP34xx @ 0x80... not found
bttv0: miro: id=3D1 tuner=3D0 radio=3Dno stereo=3Dno
bttv0: i2c: checking for MSP34xx @ 0x80... not found
bttv0: i2c: checking for TDA9875 @ 0xb0... not found
bttv0: i2c: checking for TDA7432 @ 0x8a... not found
tvaudio: TV audio decoder + audio/video mux driver
tvaudio: known chips: tda9840,tda9873h,tda9850,tda9855,tea6300,tea6420,tda8=
425,pic16c54 (PV951)
i2c-core.o: driver generic i2c audio driver registered.
i2c-core.o: driver i2c TV tuner driver registered.
tuner: chip found @ 0x60
tuner: type set to 0 (Temic PAL (4002 FH5))
bttv0: i2c attach [Temic PAL (4002 FH5)]
i2c-core.o: client [Temic PAL (4002 FH5)] registered to adapter [bt848 #0](=
pos. 0).
-
To unsubscribe from this list: send the line "unsubscribe linux-sound" in
the body of a message to majordomo@vger.kernel.org
