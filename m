From: <root@styx.bibnat.ro>
Date: Fri, 27 Nov 1998 09:21:56 +0000
Subject: MSS/WSS
Message-Id: <marc-linux-sound-91215797828146@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91181534303435@msgid-missing>
In-Reply-To: <marc-linux-sound-91181534303435@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Pleease someone help me!

I have a Compaq Deskpro XL and i simply cannot persuade it to work
correctly under linux - more precisely, the sound card doesn't work... all
the other hardware is working properly (i guess).
Yes, i installed OSS free...

Ok, here's what i'm talking about:

==Current config:
 - Slackware 3.6
 - kernel 2.0.36

==What windoze95 says: I/O 530, IRQ 9, DMA 3
==What the BIOS says: I/O 530, IRQ 9, DMA 3
==What the /dev/sndstat says after insmod sound:

Kernel: Linux corson 2.0.36 #4 Mon Nov 23 13:22:58 EET 1998 i586
Config options: 0

Installed drivers:
Type 10: MS Sound System
Type 24: MS Sound System (AXP)
Type 27: Compaq Deskpro XL
Type 1: OPL-2/OPL-3 FM

Card config:
MS Sound System at 0x530 irq 9 drq 3
OPL-2/OPL-3 FM at 0x388 drq 0

Audio devices:
0: MSS audio codec (82C930)

Synth devices:
0: Yamaha OPL-3

Midi devices:

Timers:
0: System clock
1: MSS audio codec (82C930)

Mixers:
0: MSS audio codec (82C930)

==What happens after cat endoftheworld > /dev/dsp: after playing for
about 5 seconds - Sound: DMA (output) timed out - IRQ/DRQ config error?

...rmmod sound
...soundconf (from OSS), 
  which has a card named Compaq Deskpro XL integrated Business Audio 

==What the OSS configuration says: 
Card: Compaq Deskpro XL integrated Business Audio
Device: Windows Sound System (enabled)
I/O port = 530
IRQ      = 9
DMA (A)  = 0
DMA (B)  = 1   ## i couldn't persuade OSS to set DMA 3
Device: Yamaha OPL2/OPL3 FM synthesizer chip (enabled)
I/O port = 388

==What /dev/sndstat says after soundconf and soundon:

License serial number: E00000008
Open Sound System is licensed for evaluation purposes only.
License will expire after: 05/1999
Options: ALL

Kernel: Linux corson 2.0.36 #4 Mon Nov 23 13:22:58 EET 1998 i586
Build: 2.0.36

Card config:
Compaq Deskpro XL at 0x530 irq 9 drq 0,1
OPL-2/OPL-3 FM at 0x388

Audio devices:
0: MSS audio codec (82C930) (DUPLEX)
1: Shadow of audio device #0 (DUPLEX)

Synth devices:
0: Yamaha OPL-3

Midi devices:

Timers:
0: System clock

Mixers:
0: MSS audio codec (82C930)

==What happens when doing cat endoftheworld > /dev/dsp: doesn't play at
all and just exits with : "Sound: DMA (output) timed out - IRQ/DRQ config
error?"


Please look over this stuff and tell me whether you need more information
(in case you think the problem can be solved and you know how).

I'm _very_ upset cause the damn 95 works just fine with the
(integrated) soundcard in my (pain-in-the-ass) Deskpro, and Linux doesn't.

Thank you in advance.


Paul <root@bibnat.ro>, rather hopeless and definetely annoyed.
