From: gumble <gumble@gmx.li>
Date: Wed, 10 Apr 2002 13:47:35 +0000
Subject: [linux-sound] typo in alsa sound system upto kernel 2.5.8pre2
Message-Id: <marc-linux-sound-101844707210313@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

hi 
i found a bug, or better a typo in the alsa drivers in the 2.5.x kernels

compiling a 2.5.8pre2 with alsa support for my sb16 isa :) i got this message


sound/sound.o: In function `snd_opl3_hwdep_new':
sound/sound.o(.text+0x2b74c): undefined reference to `snd_hwdep_new'
make: *** [vmlinux] Error 1


so i googled around and didnt find anything ....
later i got the idea to grep the srces
and i found a typo in 

linux/sound/drivers/opl3/opl3_lib.c
line 492

if ((err = snd_hwdep_new(card, "OPL2/OPL3", device, &hw)) < 0) {

-->

if ((err = snd_opl3_hwdep_new(card, "OPL2/OPL3", device, &hw)) < 0) {

and the kernel can be compiled

i hope it's correct or does not produce new bugs at least 



mfg
gumble
