From: u81ib6r2@umail.furryterror.org (Zygo Blaxell)
Date: Mon, 08 Feb 1999 03:37:17 +0000
Subject: Re: Two Mixers
Message-Id: <marc-linux-sound-91844531820455@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91825947820937@msgid-missing>
In-Reply-To: <marc-linux-sound-91825947820937@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

In article <36BB8755.F8AEF65C@net-gate.com>,
Raymond J Huber  <rhuber@net-gate.com> wrote:
>I installed two SoundBlaster compatible sound cards in my RedHat 2.0.34
>machine.  

Uhhh...Red Hat never released a version 2.0.34.  There is a kernel version
2.0.34 in Red Hat 5.1, though.

>Sound plays correctly to either card using cat soundfile >>
>/dev/audio or cat soundfile >> /dev/audio1.  The problem is is that when
>trying to access the mixer device file for the second card, /dev/mixer1,
>I get a device not configured error.  I have tried reversing the order
>of the cards, and I get the same problem, so I don't think there is any
>hardware problem.  What needs to be done to get the second mixer
>configured.  Are two mixers even supported?

Most of my Linux boxes have two sound cards.  I don't have any machines
with two SB-compatible cards at the same time (actually I'm rather ashamed
to own more than one SoundBlaster), so I can't say I've reproduced your
hardware configuration exactly.

Try this on your system:
	zblaxell@washu:~$ ls -lL /dev/{mixer,audio,dsp}{,1}
	   0 crw-rw-rw-   1 root     sys       14,   4 May  5  1998 /dev/audio
	   0 crw-rw-rw-   1 root     sys       14,  20 May  5  1998 /dev/audio1
	   0 crw-rw-rw-   1 root     root      14,   3 May  5  1998 /dev/dsp
	   0 crw-rw-rw-   1 root     sys       14,  19 May  5  1998 /dev/dsp1
	   0 crw-rw-rw-   1 root     sys       14,   0 May  5  1998 /dev/mixer
	   0 crw-rw-rw-   1 root     sys       14,  16 May  5  1998 /dev/mixer1

If the device numbers ("14, 4" and so on) do not agree with the devices
as listed above, then you'll probably get "device not configured" errors.

Another thing to try is a kernel from Red Hat 5.2 or compile your
own kernel from straight 2.0.36 source code.  Red Hat "enhanced"
their Linux 2.0.xx kernels to support modular sound in Red Hat 5.1.
Vendor involvement of any kind in the Linux kernel has been completely
disastrous since Yggdrasil in 1993 and Red Hat was no exception back
in the days of Red Hat 5.1.  It is only with Red Hat 5.2 that I have
dropped my recommendation that all users who want sound must build their
own Linux kernel.

I was going to suggest running 'cat /dev/sndstat' to see if you get two
sound cards listed; however, I'm not sure that /dev/sndstat is very
trustworthy any more.  The things I've seen from there lately come
straight from the Twilight Zone.  Consider, if you will:

This machine has two sound cards, a Sound Blaster 16 and an Ensoniq AudioPCI:

	zblaxell@mokona:~# cat /dev/sndstat 
	OSS/Free:3.8s2++-971130
	Load type: Driver loaded as a module
	Kernel: Linux mokona.furryterror.org 2.2.0-pre6 #2 SMP Thu Jan 14 08:11:02 EST 1999 i586
	Config options: 0

	Installed drivers: 

	Card config: 

	Audio devices:
	0: Sound Blaster 16 (4.11)

	Synth devices:

	Midi devices:

	Timers:
	0: System clock

	Mixers:
	0: Sound Blaster

Notice that the Ensoniq card is not listed.  I can play and record 
independently on both cards; in fact, one of the cards is recording from an
FM tuner nearly 24 hours/day while I listen to MP3's on the other.

Now this machine has one sound card, a Gravis Ultrasound Max:

	zblaxell@washu:~$ cat /dev/sndstat 
	OSS/Free:3.8s2++-971130
	Load type: Driver loaded as a module
	Kernel: Linux washu.furryterror.org 2.2.0-pre6 #2 SMP Thu Jan 14 08:11:02 EST 1999 i686
	Config options: 0

	Installed drivers: 

	Card config: 

	Audio devices:
	0: GUS MAX (CS4231A)
	1: Ultrasound

	Synth devices:
	0: Gravis UltraSound MAX (512k)

	Midi devices:
	0: Gravis UltraSound Midi

	Timers:
	0: System clock

	Mixers:
	0: GUS MAX (CS4231A)
	1: Gravis Ultrasound

Notice that both the CS4231 chip and the GF1 chip on the same audio
card are listed as separate audio devices, and they even function
independently.  There is one independent mixers for each chip, although
the output of the GF1's software mixer is connected to one of the inputs
of the CS4231A's analog mixer.

-- 
Zygo Blaxell, Linux Engineer, Corel Corporation, zygob@corel.ca (work),
zblaxell@furryterror.org (play).  It's my opinion, I tell you! Mine! All MINE!
Size of 'diff -Nurw [...] winehq corel' as of Sun Feb  7 21:14:00 EST 1999
Lines/files:  In 0 / 0, Out 7301 / 93, Both 7301 / 93
