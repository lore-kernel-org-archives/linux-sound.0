From: Dave Caswell <davec@asylum.apocalypse.org>
Date: Fri, 10 Mar 2000 22:02:38 +0000
Subject: Sound problems in 2.3.50
Message-Id: <marc-linux-sound-95272621612831@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


I've got no sound in 2.3.50.

My Toshiba notebook has a OPL3-SA3 chip which was working with
kernel 2.3.49 sound drivers built into the kernel.  

With 2.3.50, none of the sound devices including /dev/sndstat worked.

After checking the log files, I saw the warning that the opl3sa2
parameters needed to be set, I added an append line to my lilo.conf.
Mar 10 11:39:02 krypton kernel: ad1848/cs4248 codec driver Copyright (C) by Hannu Savolainen 1993-1996 
Mar 10 11:39:02 krypton kernel: MSS: I/O port conflict 
Mar 10 11:39:02 krypton kernel: mpu401: I/O port ffffffff already in use 
Mar 10 11:39:02 krypton kernel:  
Mar 10 11:39:02 krypton kernel: opl3sa2: io, mss_io, irq, dma, and dma2 must be set. 

Added to lilo.conf:
append = "opl3sa2=0x370,5,1,0,0x530,0x330"

Still no sound functions. So I checked the log again:

Mar 10 13:39:56 krypton kernel: ad1848/cs4248 codec driver Copyright (C) by Hannu Savolainen 1993-1996 
Mar 10 13:39:56 krypton kernel: MSS: I/O port conflict 
Mar 10 13:39:56 krypton kernel: mpu401: I/O port ffffffff already in use 
Mar 10 13:39:56 krypton kernel:  
Mar 10 13:39:56 krypton kernel: Found OPL3-SA3 (YMF715) 
Mar 10 13:39:56 krypton kernel: ad1848: must give I/O , IRQ and DMA. 

and added this to my lilo.conf
append = "ad1848=0x388,5,1,0,0"

Still no sound, although I did have some mixer settings now.

Here's what /dev/sndstat claims, with my 2.3.49 kernel.

OSS/Free:3.8s2++-971130
Load type: Driver compiled into kernel
Kernel: Linux krypton 2.3.49 #15 Fri Mar 3 10:49:22 MST 2000 i586
Config options: 0

Installed drivers: 
Type 42: OPL3SA2
Type 45: OPL3SA2 MSS
Type 43: OPL3SA2 MIDI
Type 5: Roland MPU-401
Type 26: MPU-401 (UART)

Card config: 
OPL3SA2 at 0x370 irq 5 drq 1,0
OPL3SA2 MSS at 0x530 irq 5 drq 1,0
OPL3SA2 MIDI at 0x330 irq 5 drq 1

Audio devices:
0: MS Sound System (CS4231) (DUPLEX)

Synth devices:

Midi devices:
0: MPU-401 0.0  Midi interface #1

Timers:
0: System clock
1: MS Sound System (CS4231)

Mixers:
0: OPL3-SA3 and AD1848 (through MSS)
1: MS Sound System (CS4231)

So, is there a new configuration file that I need to tweak? Or is
something broken?

Thanks for your help,
	dave caswell
	davec@apocalypse.org
