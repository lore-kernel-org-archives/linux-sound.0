From: Andy Jefferson <andy@ajsoft.demon.co.uk>
Date: Sat, 14 Nov 1998 15:03:30 +0000
Subject: 2.1.128 : AWE64 problems
Message-Id: <marc-linux-sound-91107867019319@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,

have been using a patched 2.0.35 with all features of an AWE64 with no problems.
I've just installed 2.1.128 and attempted to get it all going there also.

----------------------------------------------------------------
Basically with 2.0.35 (sound as a module), 'cat /dev/sndstat' gives

Sound Driver:3.5.4-960630 (Fri Oct 30 21:33:28 GMT 1998 root,
Linux beast 2.0.33 #8 Sun Jun 21 10:16:30 BST 1998 i686 unknown)
Kernel: Linux beast 2.0.35 #6 Sun Nov 1 12:53:55 GMT 1998 i686
Config options: 0

Installed drivers: 
Type 1: OPL-2/OPL-3 FM
Type 2: Sound Blaster
Type 7: SB MPU-401

Card config: 
Sound Blaster at 0x220 irq 5 drq 1,5
SB MPU-401 at 0x330 irq 5 drq 0
OPL-2/OPL-3 FM at 0x388 drq 0

Audio devices:
0: Sound Blaster 16 (4.16)

Synth devices:
0: Yamaha OPL-3
1: AWE32-0.4.2d (RAM512k)

Midi devices:
0: Sound Blaster 16

Timers:
0: System clock

Mixers:
0: Sound Blaster
1: AWE32 Equalizer
-----------------------------------------------------------
whereas with 2.1.128 (sound as a module), I get

OSS/Free:3.8s2++-971130
Load type: Driver loaded as a module
Kernel: Linux beast 2.1.128 #3 SMP Sat Nov 14 11:29:17 GMT 1998 i686
Config options: 0

Installed drivers: 

Card config: 

Audio devices:
0: Sound Blaster 16 (4.16) (DUPLEX)

Synth devices:
0: Yamaha OPL3
1: AWE32-0.4.2c (RAM512k)

Midi devices:
0: Sound Blaster 16

Timers:
0: System clock

Mixers:
0: Sound Blaster
1: AWE32 Equalizer
--------------------------------------------------------------

and I only get this after specifying the 
sb io=0x220 irq=5 dma=1 dma16=5 mpu_io=0x330
opl3 io=0x388
and insmodding the awe_wave.o (whereas on 2.0.35, I didn't need to do this).

i.e there are no Installed drivers !

isapnp.conf is identical between the two cases.

I'm using
isapnptools-1.15a-3
modutils-2.1.85-9
binutils-2.9.1.0.15-1

on a system which is basically RH5.2

Does anyone know what I have not set up correctly ?

Kernel config options for sound in 2.1.128 are as follows ...

CONFIG_SOUND=m
# CONFIG_SOUND_ES1370 is not set
# CONFIG_SOUND_ES1371 is not set
# CONFIG_SOUND_SONICVIBES is not set
# CONFIG_SOUND_MSNDCLAS is not set
# CONFIG_SOUND_MSNDPIN is not set
CONFIG_SOUND_OSS=m
# CONFIG_SOUND_PAS is not set
CONFIG_SOUND_SB=m
CONFIG_SOUND_ADLIB=m
# CONFIG_SOUND_GUS is not set
# CONFIG_SOUND_MPU401 is not set
# CONFIG_SOUND_PSS is not set
# CONFIG_SOUND_MSS is not set
# CONFIG_SOUND_SSCAPE is not set
# CONFIG_SOUND_TRIX is not set
# CONFIG_SOUND_MAD16 is not set
# CONFIG_SOUND_WAVEFRONT is not set
# CONFIG_SOUND_CS4232 is not set
CONFIG_SOUND_OPL3SA2=m
# CONFIG_SOUND_MAUI is not set
# CONFIG_SOUND_SGALAXY is not set
# CONFIG_SOUND_OPL3SA1 is not set
# CONFIG_SOUND_SOFTOSS is not set
CONFIG_SOUND_YM3812=m
# CONFIG_SOUND_VMIDI is not set
# CONFIG_SOUND_UART6850 is not set

#
# Additional low level sound drivers
#
CONFIG_LOWLEVEL_SOUND=y
# CONFIG_ACI_MIXER is not set
CONFIG_AWE32_SYNTH=m




TIA
--
Andy Jefferson
