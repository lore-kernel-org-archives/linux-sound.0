From: Michael Black <dx@mdk.c7.utcluj.ro>
Date: Thu, 24 Feb 2000 22:47:03 +0000
Subject: Yamaha YMF724 (fwd)
Message-Id: <marc-linux-sound-95144195916110@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org



---------- Forwarded message ----------
Date: Fri, 18 Feb 2000 02:02:41 +0200 (EET)
From: Michael Black <dx@mdk.c7.utcluj.ro>
To: scottm@interlog.com
Subject: Yamaha YMF724


  hi there. This PCI board is givin' me headaches. It's sold under the
name Yamaha DS-XG, but on their site extacly name is Yamaha DS-1
(YMF724F-V chipset). I'm kinda lost with your driver explanation...
  First of all I can use only one IRQ (the DOS configuration program only
one allows) and one DMA channel(?). I updated to the newest 'doze driver
with directX7 compatibility and suprise..it's shows in "DS-XG Legacy
System" a setting for another IRQ. Couldn't see the point. Anyway only 1
DMA channel. I tried with DMA 0,3 both free..but can u explain

IO 4  0x0100 - 0x0FFE   card's own base address for its control I/O ports

  I haven't seen this...and I digged enough. In the DOS program I have
D-DMA(?) setting. I left it on 8000h.
  Please explain how do I get & set that base address.
  Here's a dump from my /dev/sndstat.

[root@apollo]~# cat /dev/sndstat
OSS/Free:3.8s2++-971130
Load type: Driver compiled into kernel
Kernel: Linux apollo.c7.utcluj.ro 2.2.13 #3 Thu Feb 17 21:04:39 EET 2000
i586
Config options: 0

Installed drivers:
Type 10: MS Sound System
Type 27: Compaq Deskpro XL
Type 42: OPL3SA2
Type 45: OPL3SA2 MSS
Type 43: OPL3SA2 MIDI
Type 5: Roland MPU-401
Type 26: MPU-401 (UART)

Card config:
OPL3SA2 at 0x388 irq 11 drq 0,3
(OPL3SA2 MSS at 0x530 irq 11 drq 0,3)
OPL3SA2 MIDI at 0x330 irq 5 drq 0
(Compaq Deskpro XL at 0x530 irq 11 drq 0,3)

Audio devices:

Synth devices:

Midi devices:
0: MPU-401 0.0  Midi interface #1

Timers:
0: System clock

Mixers:


  Please make some light here. :) Wat I'm doing wrong?

/dx
