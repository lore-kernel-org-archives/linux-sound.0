From: Leah <qleah@earthlink.net>
Date: Mon, 07 Feb 2005 17:28:30 +0000
Subject: ES-1869 suddenly stops working
Message-Id: <E1CyCgf-0006hG-00@pop-a065c28.pas.sa.earthlink.net>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

For some reason the ES-1869 sound card in my laptop has stopped working
in Linux.  The circumstances:

* The computer had run 2.4.22-rmap15k without incident since
    January 21, 2004
* It had been running continuously for 123 days
* It had been playing sound at the time the sound card stopped working
* The sound card doubles as the PC speaker, which still works
* Sound can still be played in DOS

At the time of the incident, the computer locked up completely during a
network transfer, appearing to be one of the mysterious X crashes in
which X fails to return the display to text mode.  However, it no longer
responded to the keyboard, not even to alt-sysrq, and could not be
reached through the network.  After a cold boot, sound could not
be played.

From dmesg:

isapnp: Scanning for PnP cards...
isapnp: Card 'ESS ES1869 Plug and Play AudioDrive'
isapnp: 1 Plug & Play card detected total
...
Soundblaster audio driver Copyright (C) by Hannu Savolainen 1993-1996
sb: ESS ES1869 Plug and Play AudioDrive detected
sb: ISAPnP reports 'ESS ES1869 Plug and Play AudioDrive' at i/o 0x220,
irq 5, dma 1, 3 ESS chip ES1869 detected
<ESS ES1869 AudioDrive (rev 11) (3.01)> at 0x220 irq 5 dma 1,3

   [these are the only settings isapnp will accept]

sb: 1 Soundblaster PnP card(s) found.
...
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
Sound: DMA (output) timed out - IRQ/DRQ config error?
Sound: DMA (output) timed out - IRQ/DRQ config error?
Sound: DMA (output) timed out - IRQ/DRQ config error?
Sound: DMA (output) timed out - IRQ/DRQ config error?
Sound: DMA (output) timed out - IRQ/DRQ config error?
spurious 8259A interrupt: IRQ7.

Attempting to play sound results in numerous errors as so:

kernel: Sound Blaster:  DSP command(a1) timeout.
kernel: Sound Blaster:  DSP command(a2) timeout.
kernel: Sound Blaster:  DSP command(b8) timeout.
kernel: Sound Blaster:  DSP command(c0) timeout.
kernel: Sound Blaster:  DSP command(a8) timeout.
kernel: Sound Blaster:  DSP command(b9) timeout.
kernel: Sound Blaster:  DSP command(b6) timeout.
kernel: Sound Blaster:  DSP command(b7) timeout.
kernel: Sound Blaster:  DSP command(b7) timeout.
kernel: Sound Blaster:  DSP command(c0) timeout.
kernel: Sound Blaster:  DSP command(b1) timeout.
kernel: Sound Blaster:  DSP command(c0) timeout.
kernel: Sound Blaster:  DSP command(b2) timeout.
kernel: Sound Blaster:  DSP command(d1) timeout.
kernel: Sound Blaster:  DSP command(a4) timeout.
kernel: Sound Blaster:  DSP command(a5) timeout.
kernel: Sound Blaster:  DSP command(c0) timeout.
kernel: Sound Blaster:  DSP command(b8) timeout.
kernel: Sound: DMA (output) timed out - IRQ/DRQ config error?

/proc stuff (cpuinfo devices dma interrupts iomem ioports isapnp modules pci):

processor	: 0
vendor_id	: GenuineIntel
cpu family	: 5
model		: 4
model name	: Pentium MMX
stepping	: 3
cpu MHz		: 232.110
fdiv_bug	: no
hlt_bug		: no
f00f_bug	: yes
coma_bug	: no
fpu		: yes
fpu_exception	: yes
cpuid level	: 1
wp		: yes
flags		: fpu vme de pse tsc msr mce cx8 mmx
bogomips	: 463.66

Character devices:
  1 mem
  2 pty
  3 ttyp
  4 ttyS
  5 cua
  7 vcs
 10 misc
 14 sound
128 ptm
136 pts
162 raw
254 pcmcia

Block devices:
  1 ramdisk
  2 fd
  3 ide0
  7 loop
 22 ide1

 1: SoundBlaster8
 4: cascade

           CPU0       
  0:    5714098          XT-PIC  timer
  1:      25896          XT-PIC  keyboard
  2:          0          XT-PIC  cascade
  3:    5727265          XT-PIC  pcnet_cs
  5:       3161          XT-PIC  soundblaster
  8:          1          XT-PIC  rtc
  9:          4          XT-PIC  i82365
 12:      90612          XT-PIC  PS/2 Mouse
 14:     895519          XT-PIC  ide0
 15:         18          XT-PIC  ide1
NMI:          0 
ERR:         52

00000000-0009efff : System RAM
000a0000-000bffff : Video RAM area
000c0000-000c7fff : Video ROM
000f0000-000fffff : System ROM
00100000-01ffffff : System RAM
  00100000-0022b857 : Kernel code
  0022b858-002a92e3 : Kernel data
10000000-10000fff : Texas Instruments PCI1131
  10000000-10000fff : i82365
10001000-10001fff : Texas Instruments PCI1131 (#2)
  10001000-10001fff : i82365
a0000000-a0000fff : card services
c1000000-c1ffffff : Neomagic Corporation NM2160 [MagicGraph 128XD]
c2200000-c23fffff : Neomagic Corporation NM2160 [MagicGraph 128XD]
c2500000-c25fffff : Neomagic Corporation NM2160 [MagicGraph 128XD]

0000-001f : dma1
0020-003f : pic1
0040-005f : timer
0060-006f : keyboard
0070-007f : rtc
0080-008f : dma page reg
00a0-00bf : pic2
00c0-00df : dma2
00f0-00ff : fpu
0170-0177 : ide1
01f0-01f7 : ide0
0213-0213 : isapnp read
0220-022f : soundblaster
02f8-02ff : serial(auto)
0300-031f : pcnet_cs
0376-0376 : ide1
03c0-03df : vga+
03f6-03f6 : ide0
03f8-03ff : serial(auto)
0a79-0a79 : isapnp write
0cf8-0cff : PCI conf1
1000-103f : Intel Corp. 82371AB/EB/MB PIIX4 ACPI
1040-105f : Intel Corp. 82371AB/EB/MB PIIX4 USB
1100-110f : Intel Corp. 82371AB/EB/MB PIIX4 IDE
1400-141f : Intel Corp. 82371AB/EB/MB PIIX4 ACPI

Card 1 'ESS0003:ESS ES1869 Plug and Play AudioDrive' PnP version 1.0
Product version 1.0  Logical device 0 'ESS0006:Unknown'
    Device is active
    Active port 0x800
    Resources 0
      Priority preferred
      Port 0x800-0xff8, align 0x7, size 0x8, 16-bit address decoding
  Logical device 1 'ESS1869:Unknown'
    Device is active
    Active port 0x240,0x388,0x330
    Active IRQ 7 [0x2]
    Active DMA 0,3
    Resources 0
      Priority preferred
      Port 0x220-0x220, align 0x0, size 0x10, 16-bit address decoding
      Port 0x388-0x388, align 0x0, size 0x4, 16-bit address decoding
      Port 0x330-0x330, align 0x0, size 0x2, 16-bit address decoding
      IRQ 5 High-Edge
      DMA 1 8-bit byte-count compatible
      DMA 0,3 8-bit byte-count compatible
      Alternate resources 0:1
        Priority acceptable
        Port 0x220-0x240, align 0x1f, size 0x10, 16-bit address decoding
        Port 0x388-0x388, align 0x0, size 0x4, 16-bit address decoding
        Port 0x300-0x330, align 0x2f, size 0x2, 16-bit address decoding
        IRQ 5,7,2/9,10 High-Edge
        DMA 1 8-bit byte-count compatible
        DMA 0,3 8-bit byte-count compatible
      Alternate resources 0:2
        Priority acceptable
        Port 0x220-0x280, align 0x1f, size 0x10, 16-bit address decoding
        Port 0x388-0x388, align 0x0, size 0x4, 16-bit address decoding
        Port 0x300-0x330, align 0x2f, size 0x2, 16-bit address decoding
        IRQ 5,7,2/9,10,11,12 High-Edge
        DMA 0,1,3 8-bit byte-count compatible
        DMA 0,1,3 8-bit byte-count compatible
      Alternate resources 0:3
        Priority acceptable
        Port 0x220-0x280, align 0x1f, size 0x10, 16-bit address decoding
        Port 0x388-0x388, align 0x0, size 0x4, 16-bit address decoding
        Port 0x800-0xffe, align 0x1, size 0x2, 16-bit address decoding
        IRQ 5,7,2/9,10,11,12 High-Edge
        DMA 0,1,3 8-bit byte-count compatible
        DMA 0,1,3 8-bit byte-count compatible
      Alternate resources 0:4
        Priority functional
        Port 0x220-0x280, align 0x1f, size 0x10, 16-bit address decoding
        Port 0x800-0xffc, align 0x3, size 0x4, 16-bit address decoding
        Port 0x800-0xffe, align 0x1, size 0x2, 16-bit address decoding
        IRQ 5,7,2/9,10,11,12 High-Edge
        DMA 0,1,3 8-bit byte-count compatible
        DMA 0,1,3 8-bit byte-count compatible
  Logical device 2 'ESS0001:Unknown'
    Compatible device PNPb02f
    Device is active
    Active port 0x201
    Resources 0
      Priority preferred
      Port 0x201-0x201, align 0x0, size 0x1, 16-bit address decoding
      Alternate resources 0:1
        Priority acceptable
        Port 0x200-0x20f, align 0x0, size 0x1, 16-bit address decoding

loop                    8888   0 (unused)
nfs                    68124   9 (autoclean)
nfsd                   65232   8 (autoclean)
lockd                  46128   1 (autoclean) [nfs nfsd]
sunrpc                 63232   1 (autoclean) [nfs nfsd lockd]
pcnet_cs               12580   1
8390                    6128   0 [pcnet_cs]
crc32                   2880   0 [8390]
ds                      6996   2 [pcnet_cs]
i82365                 40816   2
pcmcia_core            41472   0 [pcnet_cs ds i82365]

PCI devices found:
  Bus  0, device   0, function  0:
    Host bridge: Intel Corp. 430TX - 82439TX MTXC (rev 1).
      Master Capable.  Latency2.  
  Bus  0, device   1, function  0:
    ISA bridge: Intel Corp. 82371AB/EB/MB PIIX4 ISA (rev 1).
  Bus  0, device   1, function  1:
    IDE interface: Intel Corp. 82371AB/EB/MB PIIX4 IDE (rev 1).
      Master Capable.  Latency2.  
      I/O at 0x1100 [0x110f].
  Bus  0, device   1, function  2:
    USB Controller: Intel Corp. 82371AB/EB/MB PIIX4 USB (rev 1).
      I/O at 0x1040 [0x105f].
  Bus  0, device   1, function  3:
    Bridge: Intel Corp. 82371AB/EB/MB PIIX4 ACPI (rev 1).
      IRQ 9.
  Bus  0, device   8, function  0:
    VGA compatible controller: Neomagic Corporation NM2160 [MagicGraph 128XD] (rev 1).
      Master Capable.  No bursts.  Min Gnt.Max Lat%5.
      Prefetchable 32 bit memory at 0xc1000000 [0xc1ffffff].
      Non-prefetchable 32 bit memory at 0xc2200000 [0xc23fffff].
      Non-prefetchable 32 bit memory at 0xc2500000 [0xc25fffff].
  Bus  0, device  10, function  0:
    CardBus bridge: Texas Instruments PCI1131 (rev 1).
      IRQ 9.
      Master Capable.  Latency8.  Min Gnt2.Max Lat=7.
      Non-prefetchable 32 bit memory at 0x10000000 [0x10000fff].
  Bus  0, device  10, function  1:
    CardBus bridge: Texas Instruments PCI1131 (#2) (rev 1).
      IRQ 9.
      Master Capable.  Latency8.  Min Gnt2.Max Lat=7.
      Non-prefetchable 32 bit memory at 0x10001000 [0x10001fff].
