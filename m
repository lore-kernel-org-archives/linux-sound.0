From: Ricardo Peres <rjperes@student.dei.uc.pt>
Date: Sun, 16 May 1999 21:21:39 +0000
Subject: SB AWE32 & RH 6.0, MIDI not working!
Message-Id: <marc-linux-sound-92692079727967@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

Hello,=20

Sorry, it's a long mail! I include much info... :-(
I have this problem: my sound card works great, except for MIDI.
When I try to run "modprobe awe_wave io=3D0x620", it waits for ever!
I am now using RH 6.0 (kernel 2.2.5, correctly configured, I suppose), I
have a SB AWE32 PnP and my configuration is as follows:

# lsmod

Module                  Size  Used by
v_midi                  4916   0
nls_iso8859-1           2020   1  (autoclean)
nls_cp860               3292   1  (autoclean)
vfat                   11516   1  (autoclean)
fat                    25664   1  (autoclean) [vfat]
opl3                   11208   0
sb                     33204   0
uart401                 5968   0  [sb]
sound                  57208   0  [v_midi opl3 sb uart401]
soundlow                 300   0  [sound]
soundcore               2372   8  [sb sound]


# cat /dev/sndstat

OSS/Free:3.8s2++-971130
Load type: Driver loaded as a module
Kernel: Linux replicant 2.2.5-15 #2 Sat May 15 22:50:52 WEST 1999 i586
Config options: 0

Installed drivers:

Card config:

Audio devices:
0: Sound Blaster 16 (4.13)

Synth devices:
0: Yamaha OPL3

Midi devices:
0: Loopback MIDI Port 1
1: Loopback MIDI Port 2

Timers:
0: System clock

Mixers:
0: Sound Blaster


# cat /etc/conf.modules

alias sound sb
options -k sb io=3D0x220 irq=3D5 dma=3D1 dma16=3D5
alias midi opl3
options -k opl3 io=3D0x388
alias sbawe awe_wave
options -k awe_wave io=3D0x620


# cat /etc/rc.d/rc.modules

#!/bin/sh
modprobe sbawe
modprobe v_midi
sfxload /etc/midi/GU11-ROM.SF2


# cat /etc/isapnp.conf

(READPORT 0x020b)
(ISOLATE PRESERVE)
(IDENTIFY *)
(VERBOSITY 2)

(CONFIGURE CTL0048/268514832 (LD 0
 (INT 0 (IRQ 5 (MODE +E)))
 (DMA 0 (CHANNEL 1))
 (DMA 1 (CHANNEL 5))
 (IO 0 (SIZE 16) (BASE 0x0220))
 (IO 1 (SIZE 2) (BASE 0x0330))
 (IO 2 (SIZE 4) (BASE 0x0388))
 (NAME "CTL0048/268514832[0]{Audio               }")
 (ACT Y)
))

(CONFIGURE CTL0048/268514832 (LD 1
 (NAME "CTL0048/268514832[1]{IDE                 }")
))

(CONFIGURE CTL0048/268514832 (LD 2
 (IO 0 (SIZE 4) (BASE 0x0620))
 (NAME "CTL0048/268514832[2]{WaveTable           }")
 (ACT Y)
))

(CONFIGURE CTL0048/268514832 (LD 3
 (IO 0 (SIZE 8) (BASE 0x0200))
 (NAME "CTL0048/268514832[3]{Game                }")
 (ACT Y)
))

(WAITFORKEY)

All values are OK: isapnp runs fine at boot time, and all other modules,
except for awe_wave are loaded correctly...
If you have any suggestions, I would greatly appreciate hearing
them!

Thanks in advance!

---------------------------------------------------------------------------=
--
Ricardo Peres
E-mail: rjperes@student.dei.uc.pt
ICQ UIN: 708926
TM: 0931 9459192
Departamento de Engenharia Inform=E1tica
Universidade de Coimbra
PORTUGAL
---------------------------------------------------------------------------=
--
