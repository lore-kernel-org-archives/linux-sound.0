From: Ricardo Peres <rjperes@student.dei.uc.pt>
Date: Sat, 16 Oct 1999 16:20:47 +0000
Subject: Kernel 2.2.12 & SB AWE32 MIDI Problem
Message-Id: <marc-linux-sound-94009090606683@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

Hello,

I recently upgraded my kernel from 2.2.5 to 2.2.12 and I can no longer
output MIDI through the correct synthesizer, AWE internal, instead of
OPL3. Obviously the OPL3 MIDI quality is much worse.

I have all sound support correctly compiled as modules and everything gets
correctly loaded at boot time.

I include the output for /dev/sndstat, /etc/conf.modules and lsmod.
Sorry for the confusion!

My conf.modules looks like this:

alias sound sb
options sb io=3D0x220 irq=3D5 dma=3D1 dma16=3D5 mpu_io=3D0x330
pre-install sound /sbin/insmod sound dmabuf=3D1
options -k awe_wave io=3D0x620
options -k opl3 io=3D0x388
alias sbawe awe_wave
alias midi awe_wave
post-install awe_wave /bin/sfxload /etc/midi/GU11-ROM.SF2


My /dev/sndstat:

OSS/Free:3.8s2++-971130
Load type: Driver loaded as a module
Kernel: Linux replicant 2.2.12-20 #1 Fri Oct 15 12:49:39 /etc/localtime
1999 i586
Config options: 0

Installed drivers:=20

Card config:=20

Audio devices:
0: Sound Blaster 16 (4.13) (DUPLEX)

Synth devices:
0: AWE32-0.4.3 (RAM0k)
1: Yamaha OPL3

Midi devices:
0: Sound Blaster 16
1: AWE Midi Emu
2: Loopback MIDI Port 1
3: Loopback MIDI Port 2

Timers:
0: System clock

Mixers:
0: Sound Blaster


Finaly, lsmod:

Module                  Size  Used by
nls_iso8859-1           2020   2  (autoclean)
nls_cp860               3292   2  (autoclean)
vfat                    9180   2  (autoclean)
fat                    30464   2  (autoclean) [vfat]
binfmt_misc             3032   0=20
v_midi                  4916   0  (unused)
opl3                   11208   0  (unused)
awe_wave              157804   0=20
sb                     33620   0=20
uart401                 5968   0  [sb]
sound                  57240   0  [v_midi opl3 awe_wave sb uart401]
soundlow                 300   0  [sound]
soundcore               2372   9  [sb sound]


I thought that by aliasing midi to sbawe would do the trick. In my
previous kernel, it did, now it doesnt....

Any help wold be greatly appreciated!

Thanks!


---------------------------------------------------------------------------=
--
Ricardo Peres
E-Mail: rjperes@student.dei.uc.pt
Phone: +351 39 790091
Cellular: +351 931 9459192
ICQ: 32940804
Dependable Systems Group
Departamento de Engenharia Inform=E1tica
Universidade de Coimbra
PORTUGAL
---------------------------------------------------------------------------=
--
