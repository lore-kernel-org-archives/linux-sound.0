From: Marshall Lake <mlake@melake.erols.com>
Date: Fri, 19 Mar 1999 18:37:33 +0000
Subject: Upgrading Linux, Sound is Gone
Message-Id: <marc-linux-sound-92186963803929@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


I have an AOpen FX-3D sound board which I run in Sound Blaster emulation
mode and it was working fine under Linux 2.0.34.  I upgraded Linux to
2.0.36 and I can't get the sound to work.

Trying to initializing the sound board gives me:
sb: Interrupt test on IRQ7 failed - device disabled

I've tried fooling around with isapnptools but I don't get anywhere.

cat'ting /snd/sndstat gives:
Sound Driver:3.5.4-960630 (Thu Mar 18 21:23:59 EST 1999 root,
Linux melake 2.0.36 #2 Tue Mar 16 17:51:55 EST 1999 i686 unknown)
Kernel: Linux melake 2.0.36 #6 Thu Mar 18 21:35:19 EST 1999 i686
Config options: 880002

Installed drivers: 
Type 1: OPL-2/OPL-3 FM
Type 2: Sound Blaster

Card config: 
Sound Blaster at 0x220 irq 7 drq 1,5
(OPL-2/OPL-3 FM at 0x388 drq 0)

Audio devices:

Synth devices:

Midi devices: NOT ENABLED IN CONFIG

Timers:
0: System clock

Mixers:


I had compiled 2.0.34 as i386.  I compiled 2.0.36 as i686.  Could that be
making the difference?

Does anyone have any suggestions short of going back to 2.0.34?


Marshall Lake - mlake@melake.erols.com - http://melake.erols.com
http://melake.erols.com/~the-beach       http://melake.erols.com/~genealogy
