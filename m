From: Paco <paco@OhKeePa.Net>
Date: Wed, 05 Apr 2000 20:13:09 +0000
Subject: can't compile emu10k1 drivers
Message-Id: <marc-linux-sound-95496558906791@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello...

I'm still battling to get by SBPCI512 working.  I've tried OSS/Commercial,
but they have a bug that prevents recording.

So, now I'm trying to use the emu10k1 drivers available from
http://opensource.creative.com .  I can't even get these to compile.

They make no mention of what is the most recent stable version of the
driver, so I have downloaded the latest CVS snapshot.  When I tryo to
"make" the drivers, I get the following response:

forbin:/root/EMU/emu10k1 # make
Driver for KERNELVERSION = 2.3.99-pre3
gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -O2
-fomit-frame-pointer -pipe   -DCPUh6 -march=pentiumpro -mpentiumpro
-malign-functions=4 -fschedule-insns2 -mwide-multiply
-fexpensive-optimizations -march=i686 -fno-strict-aliasing -DMODULE -I./
-M audio.c cardmi.c cardmo.c cardwi.c cardwo.c efxmgr.c emuadxmg.c
hwaccess.c irqmgr.c main.c midi.c mixer.c osutils.c recmgr.c timer.c
voicemgr.c  > .depend
audio.c:0: malformed option `-D __pentiumpro__-D__pentiumpro'
cardmi.c:0: malformed option `-D __pentiumpro__-D__pentiumpro'
cardmo.c:0: malformed option `-D __pentiumpro__-D__pentiumpro'
cardwi.c:0: malformed option `-D __pentiumpro__-D__pentiumpro'
cardwo.c:0: malformed option `-D __pentiumpro__-D__pentiumpro'
efxmgr.c:0: malformed option `-D __pentiumpro__-D__pentiumpro'
emuadxmg.c:0: malformed option `-D __pentiumpro__-D__pentiumpro'
hwaccess.c:0: malformed option `-D __pentiumpro__-D__pentiumpro'
irqmgr.c:0: malformed option `-D __pentiumpro__-D__pentiumpro'
main.c:0: malformed option `-D __pentiumpro__-D__pentiumpro'
midi.c:0: malformed option `-D __pentiumpro__-D__pentiumpro'
mixer.c:0: malformed option `-D __pentiumpro__-D__pentiumpro'
osutils.c:0: malformed option `-D __pentiumpro__-D__pentiumpro'
recmgr.c:0: malformed option `-D __pentiumpro__-D__pentiumpro'
timer.c:0: malformed option `-D __pentiumpro__-D__pentiumpro'
voicemgr.c:0: malformed option `-D __pentiumpro__-D__pentiumpro'
make: *** [.depend] Error 1

If someone out there has goten this card (or the SB Live!) working with
this driver, I would *really* appreciate knowing which version of the
driver you are using, and what you had to do to get everything going.

SYSTEM: athlon-550, 2.3.99-pre3 kernel, SB-PCI512

peace,
-Paco
