From: David Mansfield <david@cobite.com>
Date: Tue, 09 Feb 1999 04:54:46 +0000
Subject: MSS (ad1848) very low volume in 2.2.1
Message-Id: <marc-linux-sound-91853632512618@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


[ I am not subscribed to the list, please cc replies to me ]

I have a Genuine Microsoft Windows Sound System card AD1848 that is
causing me headaches.  Or, it's *not* causing me headaches because the
volume is so low.  This card used to work in linux 2.0 (and 1.2).  It has
been on the shelf for awhile so I haven't been tracking the changes to the
sound driver.  I am loading it with these options:

io=0x530 irq=7 dma=3 dma2=0

with no complaints.  But the sound is extremely soft.  I swear (but can't
remember for sure) that there used to be another 'slider' on the mixer to
adjust the on-board amplifier (speaker volume), instead of just the line
level volume, but I compared the ad1848_mixer.h in the 2.0.35 and the
2.2.1 versions and can't really see anything there except some extensions
for other card models.

I have used aumix and xmixer to the same effect, and have copied both .au
and .wav formats to /dev/audio and /dev/dsp respectively.

I have tried other IRQ's, DMA's etc. with no different results: with my
speakers cranked I can barely hear how Linus Torvalds pronounces linux.

Kernel is 2.2.2-pre2, gcc2.7.2.3, redhat 5.1.

Any clues?

-- 
/===============\
| David Mansfield              |
| david@cobite.com             |
\===============/
