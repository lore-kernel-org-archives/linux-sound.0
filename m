From: Catalin Bucur <cata@cce.sidex.ro>
Date: Mon, 13 Mar 2000 07:17:18 +0000
Subject: VIA Sound
Message-Id: <marc-linux-sound-95293442407098@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello,

I have an Epox motherboard (3VBM) with sound on board (chipset VIA
82C686). I saw that in kernel 2.2.14 there is a driver for this chipset,
so I tried it. I compiled my kernel with the following options:
#
# Sound
#
CONFIG_SOUND=m
CONFIG_SOUND_OSS=m
CONFIG_SOUND_VIA82CXXX=m
CONFIG_SOUND_YM3812=m
CONFIG_SOUND_VMIDI=m
#The rest is _not_ set

In /etc/conf.modules I have:
alias sound via82cxxx
options sb io=0x220 irq=5 dma=1 mpu_io=0x330 support=1
pre-install sound insmod sound
alias midi opl3
options opl3 io=0x388

At boot time everything works fine, the modules are loaded, but when I
play a sound (wav, au, mp3) I hear nothing (but the sounds are playing
and I have no error messages). If I unload the modules from memory and
put an OSS sound driver (evaluation) I can hear the sounds. 
Anyone has had similar problems?

Thanks in advance.

P.S. I have RedHat 6.1.

-- 
Catalin Bucur            mailto:cata@cce.sidex.ro
Hardware Engineer - Electronic  Computing  Centre
		    Sidex S.A. - Galati - Romania
