From: David Mansfield <david@cobite.com>
Date: Sun, 16 May 1999 17:27:02 +0000
Subject: MSS audio (AD1848) not working in 2.2
Message-Id: <marc-linux-sound-92690403119485@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


This is a bug which I have tried to track down but can't.  It is quite
annoying!  Summary: volume level is INCREDIBLY LOW in 2.2, works fine in
2.0.

My Microsoft Windows Sound System card (made by MS, the real thing)
doesn't work in linux 2.2 using the Oss/Free that comes with the Linus
kernel, nor with the OSS trial version downloaded from the 4front site.
The card works fine in 2.0.

Here are the symptoms:  
1) the driver loads correctly, no problem: IO=0x530, IRQ=7, dma=3, dma2=0
   It was built a module this time, but the same problem exists if it is
  compiled in.

2) it shows up in /proc/sound and /dev/sndstat

OSS/Free:3.8s2++-971130
Load type: Driver loaded as a module
Kernel: Linux hamlet.cobite.com 2.2.8 #1 Tue May 11 22:34:05 EDT 1999 i686
Config options: 0

Installed drivers: 

Card config: 

Audio devices:
0: MSS audio codec (AD1848)

Synth devices:

Midi devices:

Timers:
0: System clock

Mixers:
0: MSS audio codec (AD1848)

3) the problem: the volume is very, very, very low.  If I use the mixer to
crank all settings to max, then crank my amplified speakers (external
volume control on speakers) to max, and put my ear right next to the
speaker, I can barely hear it.

Can anyone help me out?  I've spent a few hours looking at the diffs
between 2.1.1 (earliest version I have in CVS) and 2.2.8 but haven't
turned anything up yet.

David

-- 
/===============\
| David Mansfield              |
| david@cobite.com             |
\===============/
