From: Miles Lane <root@amazon.com>
Date: Sun, 31 Jan 1999 08:52:20 +0000
Subject: Re: Problem with cs4232.o
Message-Id: <marc-linux-sound-91778861012869@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91722163016425@msgid-missing>
In-Reply-To: <marc-linux-sound-91722163016425@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


Alan, thanks for your feedback thus far.   Please see if you can
figure what's wrong by examining this addition system info.

	THANKS!
		Miles

A reminder:  this is the problem where I get the
	Sound: DMA (output) timed out -IRQ/DRQ config error?
when accessing my sound card after booting and logging in.

Unloading the cs4232.o module and then running "modprobe cs4232" 
fixes the problem.  I'd like to fix this so the driver loads 
correctly on boot.

On Tue, 26 Jan 1999, Alan Cox wrote:

> Ok something there is a real bug. Can you mail me more info - especially
> the machine info
> 
> 

Here is my system information:

SOUND:

	OSS/Free:3.8s2++-971130
	Load type: Driver loaded as a module
	Kernel: Linux sparky 2.2.1 #4 Thu Jan 28 18:48:11 PST 1999 i686
	Config options: 0

	Installed drivers: 

	Card config: 

	Audio devices:
	0: Crystal audio controller (CS4236) (DUPLEX)

	Synth devices:
	0: Yamaha OPL3

	Midi devices:

	Timers:
	0: System clock
	1: Crystal audio controller (CS4236)

	Mixers:
	0: Crystal audio controller (CS4236)

MODULES:

	ppp                    17712   2 (autoclean)
	slhc                    4136   1 (autoclean) [ppp]
	cs4232                  2264   1
	serial_cs               3504   0 (unused)
	3c575_cb               16440   1
	cb_enabler              1860   1 [3c575_cb]
	ds                      5460   2 [serial_cs cb_enabler]
	i82365                 20764   2
	pcmcia_core            35384   0 [serial_cs cb_enabler ds i82365]
	opl3                   10244   1
	uart401                 5588   1 [cs4232]
	ad1848                 14276   1 [cs4232]
	sound                  54456   0 [cs4232 opl3 uart401 ad1848]
	soundcore               2084   5 [sound]

IOPORTS:

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
	0280-02ff : cb_enabler
	0376-0376 : ide1
	0388-038b : Yamaha OPL3
	03c0-03df : vga+
	03e8-03ef : serial_cs
	03f6-03f6 : ide0
	03f8-03ff : serial(auto)
	0530-0533 : Crystal audio controller
	fcf0-fcf7 : ide0
	fcf8-fcff : ide1

INTERRUPTS:

	           CPU0       
	  0:    4703167          XT-PIC  timer
	  1:      28049          XT-PIC  keyboard
	  2:          0          XT-PIC  cascade
	  5:   28560935          XT-PIC  Crystal audio controller
	  8:          1          XT-PIC  rtc
	 10:     455925          XT-PIC  serial
	 11:          4          XT-PIC  i82365
	 12:     216084          XT-PIC  PS/2 Mouse
	 13:          1          XT-PIC  fpu
	 14:     148369          XT-PIC  ide0
	 15:     254102          XT-PIC  ide1
	NMI:          0

DMA:

	 0: Crystal audio controller
	 1: Crystal audio controller
	 4: cascade

DEVICES:

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
	254 pcmcia
	
	Block devices:
	  2 fd
	  3 ide0
	 22 ide1

CPUINFO:

	processor	: 0
	vendor_id	: GenuineIntel
	cpu family	: 6
	model		: 5
	model name	: Pentium II (Deschutes)
	stepping	: unknown
	cpu MHz		: 232.109606
	cache size	: 512 KB
	fdiv_bug	: no
	hlt_bug		: no
	sep_bug		: no
	f00f_bug	: no
	fpu		: yes
	fpu_exception	: yes
	cpuid level	: 2
	wp		: yes
	flags		: fpu vme de pse tsc msr pae mce cx8 sep mtrr pge mca cmov pat pse36 mmx osfxsr
	bogomips	: 231.01

MEMINFO:

	        total:    used:    free:  shared: buffers:  cached:
	Mem:  81629184 71348224 10280960 46329856  1880064 30765056
	Swap: 82538496  2924544 79613952
	MemTotal:     79716 kB
	MemFree:      10040 kB
	MemShared:    45244 kB
	Buffers:       1836 kB
	Cached:       30044 kB
	SwapTotal:    80604 kB
	SwapFree:     77748 kB

KERNEL VERSION:

	Linux version 2.2.1 (root@sparky) (gcc version 2.7.2.3) #4 Thu Jan 28 18:48:11 PST 1999

PCI DEVICES:

  Bus 35, device   0, function  0:
    Ethernet controller: 3Com Unknown device (rev 1).
      Vendor idb7. Device idQ57.
      Medium devsel.  IRQ 3.  
      Non-prefetchable 32 bit memory at 0x280 [0x280].
      Non-prefetchable 32 bit memory at 0xa0021000 [0xa0021000].
      Non-prefetchable 32 bit memory at 0xa0020000 [0xa0020000].
  Bus  0, device   0, function  0:
    Host bridge: Intel 440BX - 82443BX Host (no AGP) (rev 2).
      Medium devsel.  Master Capable.  Latencyd.  
      Prefetchable 32 bit memory at 0x0 [0x8].
  Bus  0, device   2, function  0:
    VGA compatible controller: Neomagic MagicGraph NM2160 (rev 1).
      Medium devsel.  Fast back-to-back capable.  Master Capable.  Latency8.  Min Gnt.Max Lat%5.
      Prefetchable 32 bit memory at 0xfd000000 [0xfd000008].
      Non-prefetchable 32 bit memory at 0xfea00000 [0xfea00000].
      Non-prefetchable 32 bit memory at 0xfed00000 [0xfed00000].
  Bus  0, device   4, function  0:
    CardBus bridge: Texas Instruments PCI1131 (rev 1).
      Medium devsel.  Master Capable.  Latency8.  Min Gnt2.Max Lat=7.
  Bus  0, device   4, function  1:
    CardBus bridge: Texas Instruments PCI1131 (rev 1).
      Medium devsel.  Master Capable.  Latency8.  Min Gnt8.Max Lat=7.
  Bus  0, device   7, function  0:
    Bridge: Intel 82371AB PIIX4 ISA (rev 2).
      Medium devsel.  Fast back-to-back capable.  Master Capable.  No bursts.  
  Bus  0, device   7, function  1:
    IDE interface: Intel 82371AB PIIX4 IDE (rev 1).
      Medium devsel.  Fast back-to-back capable.  Master Capable.  Latencyd.  
      I/O at 0xfcf0 [0xfcf1].
  Bus  0, device   7, function  2:
    USB Controller: Intel 82371AB PIIX4 USB (rev 1).
      Medium devsel.  Fast back-to-back capable.  Master Capable.  Latencyd.  
      I/O at 0xfcc0 [0xfcc1].
  Bus  0, device   7, function  3:
    Bridge: Intel 82371AB PIIX4 ACPI (rev 2).
      Medium devsel.  Fast back-to-back capable.  
