From: hines_j@iolinc.net (Hines, Jim)
Date: Thu, 24 Jun 1999 04:06:11 +0000
Subject: Popping noise on OPL3 mp3s/wavs
Message-Id: <marc-linux-sound-93019710717889@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

I recently registered the OSS stuff. Very nice. However it did not clear up=
 a
problem I was having before getting OSS. Whenever I play any mp3 or wav fil=
es,
I always experience a popping or crackling sound at the very moment I click=
 the
play button.  This is becoming annoying as you might imagine. Here is my
sndstat output:

Build: 2.0.36

Card config:
Software mixing (audio)
Generic PnP support
OPL-2/OPL-3 FM at 0x388
SoundPort at 0x534 irq 5 drq 0,3
MPU-401 (UART) at 0x330 irq 7

Audio devices:
0: BTC1815 V1.2 (AD1845) (DUPLEX)
1: Shadow of audio device #0 (DUPLEX)
2: SoftOSS v1.2 CH #0
3: SoftOSS v1.2 CH #1
4: SoftOSS v1.2 CH #2
5: SoftOSS v1.2 CH #3
6: SoftOSS v1.2 CH #4
7: SoftOSS v1.2 CH #5
8: SoftOSS v1.2 CH #6
9: SoftOSS v1.2 CH #7

Synth devices:
0: SoftOSS v1.2
                                                                           =
                                                                  =D8=20
Midi devices:
0: BTC1815 V1.2
=20
Timers:
0: System clock
1: SoftOSS
=20
Mixers:
0: BTC1815 V1.2 (AD1845)
1: SoftOSS


Does anyone have any ideas about this? Please help!

Thanks,
--
Jim Hines
400mhz AMDk6-2 98mb
RedHat 5.2 (2.0.36)
