From: Holckamaniac <holck@pngs01.hep.upenn.edu>
Date: Thu, 03 Jun 1999 14:12:41 +0000
Subject: Ensoniq Sounscape PnP
Message-Id: <marc-linux-sound-92841951512960@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I am currently upgrading from RedHat 5.1 to 6.0 manually.
I have upgraded the kernel to 2.2.5.  I have, of course,
broken many things.  One of the things I have broken is
sound support.  I have an Ensoniq Soundscape PnP card.
Previously, I used OSS/Free to enable sound support.  I am
trying to load sound support as a kernel module but can't.
Here is my understanding of what I have to do:

1. Enable kernel module support and configure the sound 
support as a module.  I have done both of these things.

2. I need to load the microcode to the sound card after
the kernel boots.  I compile ssinit.c from snd-util-3.5.tar.gz
with the following macros set:

#define DSPDEV "/dev/dsp"
#define CODEFILE "/usr/local/lib/sndkit/sndscape.co3"

3. When I run ssinit.exe from /etc/rc.d/rc.local, it 
should load the correct modules automatically if the
module dependencies are correctly set.  This is done in 
/etc/rc.d/rc.sysinit by "depmod -a".  I also have to set the
module options correctly in /etc/conf.modules.  The
settings are:

#SOUND modules
alias char-major-14 sscape
options sscape io=0x534 irq dma=1 mpu_irq=9 mpu_io=0x330

4. This doesn't work and I get the following message in
/var/log/messages:

May 29 08:50:06 holckster kernel: ad1848/cs4248 codec driver Copyright (C) by Ha
nnu Savolainen 1993-1996
May 29 08:50:06 holckster kernel: Soundscape driver Copyright (C) by Hannu Savol
ainen 1993-1996
May 29 08:50:06 holckster insmod: /lib/modules/2.2.5-15/misc/sscape.o: init_modu
le: Device or resource busy
May 29 08:50:06 holckster modprobe: can't locate module sound-slot-0
May 29 08:50:06 holckster modprobe: can't locate module sound-service-0-3

What am I doing wrong?  What are the correct settings for 
the sscape module?  How do I determine them? If it helps,
here are the settings from the previous OSS setup (devices.cfg):

/SECUREAUDIO OFF
/IRQEXCLUDE 3 4
/DMAEXCLUDE 2
-ENS3081 #Ensoniq Soundscape PnP model 2 (see README.soundscape)
SSCAPE $LOADBIN /doswin/windows/system/sndscape.co3
/PNPDEV ENS0000 P330 P# P# I9 I7 I# D1 D3 D#
SSCAPE OPNP P330 I9 D1 d3
AD1848 OPNP I7
PNP


-- 
Christopher Holck
University of Pennsylvania
Dept. of Physics
209 South 33rd
Philadelphia, Pa. 19104

Phone: (Work) 215-898-4588
       (Home) 610-640-4073

Fax: 215-898-8512
------------------------------
"... but I'm disturbed, I'm depressed, I'm inadequate ... I've
got it all!" - G. Costanza

"Only two things are infinite, the universe and human stupidity,
and I'm not sure about the former." -Albert Einstein

"Chicks dig the long ball!" - Greg Maddux
