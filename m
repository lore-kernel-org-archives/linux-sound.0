From: Roy-Anders Larsen <royal@bellsouth.net>
Date: Mon, 15 Mar 1999 06:29:32 +0000
Subject: SoundBlaster 16 and FM synth (or midi)
Message-Id: <marc-linux-sound-92147934029976@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I am running Debian 2.1 (slink) with kernel 2.2.3 on an old 486DX33 with
only 10 MB RAM and I am trying to make my SoundBlaster16 (model
SB4171) play midi files.
The soundcard seems to work fine as far as WAV files go.
Also if I try playing midi files in Win3.x, the midi files will play fine.
I have been trying to get the midi/synth part to work for months.

The sound support is configured as modules:
CONFIG_SOUND=m
CONFIG_SOUND_OSS=m
CONFIG_SOUND_SB=m
CONFIG_SOUND_ADLIB=m
CONFIG_SOUND_YM3812=m

This is what I have in /etc/isapnp.conf:
(READPORT 0x0203)
(ISOLATE PRESERVE)
(IDENTIFY *)
(VERBOSITY 2)
(CONFLICT (IO FATAL)(IRQ FATAL)(DMA FATAL)(MEM FATAL)) # or WARNING
(CONFIGURE CTL00f0/-1 (LD 0
 (INT 0 (IRQ 5 (MODE +E)))
 (DMA 0 (CHANNEL 1))
 (DMA 1 (CHANNEL 5))
 (IO 0 (SIZE 16) (BASE 0x0220))
 (IO 1 (SIZE 2) (BASE 0x0330))
 (IO 2 (SIZE 4) (BASE 0x0388))
 (NAME "CTL00f0/-1[0]{Audio               }")
 (ACT Y)
))
(CONFIGURE CTL00f0/-1 (LD 1
 (IO 0 (SIZE 1) (BASE 0x0200))
 (NAME "CTL00f0/-1[1]{Game                }")
 (ACT Y)
))
(WAITFORKEY)

The output on boot:
Board 1 has Identity 6d ff ff ff ff f0 00 8c 0e:  CTL00f0 Serial No -1 [checksum 6d]
CTL00f0/-1[0]{Audio               }: Ports 0x220 0x330 0x388; IRQ5 DMA1 DMA5 --- Enabled OK
CTL00f0/-1[1]{Game                }: Port 0x200; --- Enabled OK

In my /etc/conf.modules:

alias char-major-14 sb
post-install sb /sbin/modprobe "-k" "adlib_card"
options sb io=0x220 irq=5 dma=1 dma16=5 mpu_io=0x330
options adlib_card io=0x388

And is detected thus:
kernel: Soundblaster audio driver Copyright (C) by Hannu Savolainen 1993-1996 
kernel: SB 4.16 detected OK (220) 
kernel: YM3812 and OPL-3 driver Copyright (C) by Hannu Savolainen, Rob Hooft 1993-1996 

/dev/sndstat:
OSS/Free:3.8s2++-971130
Load type: Driver loaded as a module
Kernel: Linux bakh 2.2.3 #1 Wed Mar 10 00:49:12 CST 1999 i486
Config options: 0

Installed drivers: 

Card config: 

Audio devices:
0: Sound Blaster 16 (4.16) (DUPLEX)

Synth devices:
0: Yamaha OPL3

Midi devices:
0: Sound Blaster 16

Timers:
0: System clock

Mixers:
0: Sound Blaster

Now, if I try playmidi:
bakh:~/sound% playmidi ~/audio/sound/moonligh.mid 
Playmidi 2.3 Copyright (C) 1994-1996 Nathan I. Laredo
This is free software with ABSOLUTELY NO WARRANTY.
For details please see the file COPYING.
bakh:~/sound%

Absolutely no sound.  No delay, just a new prompt..

bakh:~/sound% playmidi -f ~/audio/sound/moonligh.mid
Playmidi 2.3 Copyright (C) 1994-1996 Nathan I. Laredo
This is free software with ABSOLUTELY NO WARRANTY.
For details please see the file COPYING.
bakh:~/sound%

Same thing...

Does anyone have any ideas on how this is supposed to work ?  Did I
misconfigure my sound ?  Would it work with other kernel versions ?

Thanks for any help.
Roy
