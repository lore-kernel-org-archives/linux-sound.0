From: Keith Duthie <psycho@stonebow.otago.ac.nz>
Date: Thu, 26 Nov 1998 04:20:45 +0000
Subject: 2.1.129, cs4232, /dev/sequencer: No such device
Message-Id: <marc-linux-sound-91208518032495@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi, I've just upgraded to 2.1.129 from 2.0.36, and I'm finding a few
things a little strange. I can't seem to play midi files because the
sequencer device isn't set up properly. Any help is welcome (including
messages telling me I'm too thick to live, IF they also tell me what I'm
doing wrong).

My sound device is a WaveX 32 Pro. ie a cs4237b pnp isa card.

crw-rw-rw-   1 root     root      14,   1 Nov 24 22:22 /dev/sequencer

.config:
CONFIG_SOUND=y
CONFIG_SOUND_OSS=m
CONFIG_SOUND_ADLIB=m
CONFIG_SOUND_CS4232=m
CONFIG_SOUND_SOFTOSS=m
CONFIG_SOUND_YM3812=m
CONFIG_SOUND_VMIDI=m

/etc/modules.conf:
options cs4232 io=0x534 irq=5 dma=1 dma2=0 mpuirq=9 mpuio=0x330
options opl3 io=0x388

isapnp.conf:
(READPORT 0x0203)
(ISOLATE)
(IDENTIFY *)
(CONFIGURE CSC4237/-1 (LD 0
 (DMA 0 (CHANNEL 1))
 (DMA 1 (CHANNEL 0))
 (INT 0 (IRQ 5 (MODE +E)))
 (IO 0 (BASE 0x0534))
 (IO 1 (BASE 0x0388))
 (IO 2 (BASE 0x0220))
 (ACT Y)
))
(CONFIGURE CSC4237/-1 (LD 1
 (IO 0 (BASE 0x0200))
 (ACT Y)
))
(CONFIGURE CSC4237/-1 (LD 2
 (IO 0 (BASE 0x0120))
 (ACT Y)
))
(CONFIGURE CSC4237/-1 (LD 3
 (INT 0 (IRQ 9 (MODE +E)))
 (IO 0 (BASE 0x0330))
 (ACT Y)
))
(WAITFORKEY)


 -- 
     |                   Keith Duthie      O-               | 
     +         Don't call me, I'll call you.  Maybe.        +
     |           keith.duthie@stonebow.otago.ac.nz          |
   __   _
  / /  (_)__  __ ____  __
 / /__/ / _ \/ // /\ \/ /  . . .  t h e   c h o i c e   o f   a
/____/_/_//_/\_,_/ /_/\_\              G N U   g e n e r a t i o n . . .
