From: samad <samad@wanadoo.fr>
Date: Fri, 25 Dec 1998 18:13:20 +0000
Subject: problems with config CMI8330 and alsa driver
Message-Id: <marc-linux-sound-91460605408017@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91460744508322@msgid-missing>
In-Reply-To: <marc-linux-sound-91460744508322@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

Excuse my for my poor english.
I have a soundcard AudioExcel AV310 (CMI8330) and I want to try alsa
driver because I have problems with another drivers(OSS).
My kernel is 2.1.132.
When I want to use, the kernel says me peripherical not configured.
I do "modprobe snd-sb16.o".

lsmod shows me:

Module                  Size  Used by
snd-sb16                3568   0  (unused)
snd-sb-dsp             15420   0  [snd-sb16]
snd-pcm1               17836   0  [snd-sb-dsp]
snd-mixer              14932   0  [snd-sb16 snd-sb-dsp]
snd-pcm                 9548   0  [snd-sb16 snd-sb-dsp snd-pcm1]
snd-mpu401-uart         1784   0  [snd-sb16]
snd-midi               15500   0  [snd-sb16 snd-sb-dsp snd-mpu401-uart]
snd-opl3                2120   0  [snd-sb16]
snd-timer               3436   0  [snd-opl3]
snd-synth               1228   0  [snd-sb16 snd-opl3]
snd                    40544   0  [snd-sb16 snd-sb-dsp snd-pcm1
snd-mixer snd-pcm snd-mpu401-uart snd-midi snd-opl3 snd-timer snd-synth]



In my /dev/sndstat, I have:

Sound Driver:3.8.1a-980706 (ALSA v0.2.0-pre10p2 emulation code)
Kernel: Linux samad.wanadoo.fr 2.1.131 #36 SMP dim d=E9c 20 13:42:09 GMT
1998 i586
Config options: 0

Installed drivers:
Type 10: ALSA emulation

Card config:
Sound Blaster 16 at 0x220, irq 5, dma 1&5

Audio devices: NOT ENABLED IN CONFIG    <<<=3D=3D=3D What can I do?

Synth devices:
0: OPL3 FM

Midi devices:
0: MPU-401 (UART)

Timers:
7: system timer

Mixers:
0: CTL1745


  WARNING!!! The /dev/sndstat device is obsolete. Support for this
device may
  be REMOVED in the future!!! Better information about ALSA driver is
available
  in the /proc/asound directory.

Any body can help me?
                                                THANKS.

samad
samad@wanadoo.fr
