From: Ron Forrester <rjf@zero-ping.com>
Date: Sat, 27 Mar 1999 22:47:07 +0000
Subject: missing /dev/{sound things}
Message-Id: <marc-linux-sound-92257513207677@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


I just installed Debian 2.1 (slink), followed by upgrading the kernel
to 2.2.4. I have a SoundBlaster AWE64 ISA (non-pnp), which I have built-in
kernel support for. On boot, I get these messages:

=-=-=-=-

Sound initialization started
<Sound Blaster 16 (4.16)> at 0x220 irq 5 dma 1,5
<Sound Blaster 16> at 0x330 irq 5 dma 0
Sound initialization complete

=-=-=-=-

Which looks pretty good. However, when finished booting, I have none of
the /dev/ files I would expect, like /dev/mixer, /dev/dsp, /dev/audio,
/dev/sndstat.

If I 'cat /proc/sound', I get:

=-=-=-=-=-

OSS/Free:3.8s2++-971130
Load type: Driver compiled into kernel
Kernel: Linux aurora 2.2.4 #3 Sat Mar 27 13:49:12 PST 1999 i586
Config options: 0

Installed drivers: 
Type 26: MPU-401 (UART)
Type 2: Sound Blaster
Type 29: Sound Blaster PnP
Type 7: SB MPU-401

Card config: 
Sound Blaster at 0x220 irq 5 drq 1,5
SB MPU-401 at 0x330 irq 5 drq 0

Audio devices:
0: Sound Blaster 16 (4.16) (DUPLEX)

Synth devices:

Midi devices:
0: Sound Blaster 16

Timers:
0: System clock

Mixers:
0: Sound Blaster

=-=-=-=-=-

Which again looks good.

Any ideas why I would have the /dev/* stuff? Obviously I need them before
I can do anything with the card. 

This driver/setup worked fine under Slackware 3.5 with a 2.2.1 kernel.

tia!
rjf&
