From: Dave Caswell <davec@asylum.apocalypse.org>
Date: Sat, 25 Mar 2000 17:34:32 +0000
Subject: Still have Sound Problems 2.3.99-pre3
Message-Id: <marc-linux-sound-95444250508693@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


By adding 
append = "ppa=0x378 parport=0x378,7,3 opl3sa2=0x370,5,1,0,0x530,0x330 "
into my lilo.conf sound will now work just after a reboot.   But after
a suspend/resume cycle I can't get any sound out of the computer.
Gom seems to think that there are still mixer controls available, but
they don't make any difference.


The computer is a Toshiba Satellite Pro 445CDX.

The only sound related lines I find in my log files are:

Mar 24 11:44:38 krypton kernel: ad1848/cs4248 codec driver Copyright (C) by Hannu Savolainen 1993-1996 
Mar 24 11:44:38 krypton kernel: Found OPL3-SA3 (YMF715) 
Mar 24 11:44:38 krypton kernel: <MS Sound System (CS4231)> at 0x534 irq 5 dma 1,0 
Mar 24 11:44:38 krypton kernel: <MPU-401 0.0  Midi interface #1> at 0x330 irq 5 dma 1,0 

The sound section of my .config is:
#
# Sound
#
CONFIG_SOUND=y
# CONFIG_SOUND_CMPCI is not set
# CONFIG_SOUND_ES1370 is not set
# CONFIG_SOUND_ES1371 is not set
# CONFIG_SOUND_ESSSOLO1 is not set
# CONFIG_SOUND_MAESTRO is not set
# CONFIG_SOUND_SONICVIBES is not set
# CONFIG_SOUND_TRIDENT is not set
# CONFIG_SOUND_MSNDCLAS is not set
# CONFIG_SOUND_MSNDPIN is not set
CONFIG_SOUND_OSS=y
CONFIG_SOUND_TRACEINIT=y
CONFIG_SOUND_DMAP=y
# CONFIG_SOUND_AD1816 is not set
# CONFIG_SOUND_SGALAXY is not set
# CONFIG_SOUND_ADLIB is not set
# CONFIG_SOUND_ACI_MIXER is not set
# CONFIG_SOUND_CS4232 is not set
# CONFIG_SOUND_SSCAPE is not set
# CONFIG_SOUND_GUS is not set
# CONFIG_SOUND_VMIDI is not set
# CONFIG_SOUND_TRIX is not set
# CONFIG_SOUND_MSS is not set
# CONFIG_SOUND_MPU401 is not set
# CONFIG_SOUND_NM256 is not set
# CONFIG_SOUND_MAD16 is not set
# CONFIG_SOUND_PAS is not set
# CONFIG_PAS_JOYSTICK is not set
# CONFIG_SOUND_PSS is not set
# CONFIG_SOUND_SOFTOSS is not set
# CONFIG_SOUND_SB is not set
# CONFIG_SOUND_AWE32_SYNTH is not set
# CONFIG_SOUND_WAVEFRONT is not set
# CONFIG_SOUND_MAUI is not set
# CONFIG_SOUND_VIA82CXXX is not set
# CONFIG_SOUND_YM3812 is not set
# CONFIG_SOUND_OPL3SA1 is not set
CONFIG_SOUND_OPL3SA2=y
# CONFIG_SOUND_UART6850 is not set
# CONFIG_SOUND_AEDSP16 is not set

Thanks,
	davec
