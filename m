From: mduncan@hal.psislidell.com
Date: Thu, 21 Jan 1999 18:18:47 +0000
Subject: Basic (?) Sound Help
Message-Id: <marc-linux-sound-91696141205761@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


Gasp!!,

I'm having a little trouble w/ sound on my Linux (RedHat 5.1) machine.  I've
gone through the HOWTO and commands like:

    cat crash.au >/dev/audio

and 

   cat endoftheworld >/dev/dsp

don't produce any error messages, but  I CAN'T HEAR ANYTHING through the
speakers (which are on w/ the volume turned up incidentally).  Also the results
of:

    dd bs=8k count=4 </dev/audio >sample.au

produce a non-empty file.  There is no microphone, however, so I can't tell if 
the output makes any sense. 

I've booted in DOS and used the vibra16 diagnose utility to confirm the
interrupt and DMA settings.  I can play CD's w/ XCDplay.  I just can't figure
out why this isn't working.  I've copied the results of   dmesg   and  results
of  "cat /dev/sndstat" below in case that tells anyone somthing I'm not picking
up on. Also, for what it's worth, I first noticed this problem after having
installed XCDroast which informed me that it couldn't talk to /dev/dsp.  

Does anyone understand this????  Are there any other diagnostic tests I can
do????  Do I HAVE to re-build the kernel to fix it???

Any help is greatly appreciated.


Pertinant parts of  dmesg:

Sound initialization started
<Sound Blaster 16 (4.13)> at 0x220 irq 5 dma 1,5
<Yamaha OPL3 FM> at 0x388
Sound initialization complete


Results of  "cat /dev/sndstat"

Sound Driver:3.5.4-960630 (Sun Sep 13 09:37:20 CDT 1998 root,
Linux thoe.psislidell.com 2.0.35 #1 Sat Sep 12 16:31:39 CDT 1998 i686 unknown)
Kernel: Linux thoe.psislidell.com 2.0.35 #1 Sun Sep 13 09:38:23 CDT 1998 i686
Config options: a80002

Installed drivers: 
Type 1: OPL-2/OPL-3 FM
Type 2: Sound Blaster
Type 7: SB MPU-401

Card config: 
Sound Blaster at 0x220 irq 5 drq 1,5
OPL-2/OPL-3 FM at 0x388 drq 0

Audio devices:
0: Sound Blaster 16 (4.13)

Synth devices:
0: Yamaha OPL-3

Midi devices:

Timers:
0: System clock

Mixers:
0: Sound Blaster





----------------------------------
Mike Duncan
Planning Systems Inc.
Ph: 504-639-3537
Fx: 504-649-0480
E-Mail: mduncan@mail.psislidell.com
Date: 21-Jan-99
Time: 12:00:52
----------------------------------
