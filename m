From: Buffy <buffy@easynet.fr>
Date: Wed, 19 May 1999 19:25:15 +0000
Subject: "device busy"
Message-Id: <marc-linux-sound-92730500809621@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi all :

	I'm still working about my AWE64 Gold configuration... Someone
(xavyer@ix.netcom.com) helped me a lot but can't anymore for this time.

I've compiled my kernel with modules required, built a isapnp.conf file
with two others cards (that I don't need), made all configured. I made the
devices, (dspW and dspW1), the others were already existing. But at boot
time :

Soundblaster audio driver Copyright (C) by Hannu Savolainen 1993-1996
sb: dsp reset failed.
/lib/modules/2.2.9/misc/sb.o: init_module: Device or resource busy
sound: Device or resource busy
AWE32: not detected
modprobe: can't locate module synth0
open /dev/sequencer: Device not configured
post-install /lib/modules/2.2.9/misc/awe_wave.o failed

I have a conf.modules too : created automatically it seams,

alias sound sb
options opl3 io=0x388
alias midi awe_wave
post-install awe_wave /usr/bin/sfxload /etc/midi/GU11-ROM.SF2
options sb io=0x220 irq=5 dma=1 dma16=5 mpu_io=0x330

I don't understand what to do ! :)

\-=-=-=-=-=-=-=-=-=-/
| * * B-U-F-F-Y * * |
| +33 6.15.11.88.94 |
/-=-=-=-=-=-=-=-=-=-\
