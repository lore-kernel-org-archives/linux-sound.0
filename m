From: Raymond Hall <kovalski@iris.razteca.org.mx>
Date: Sat, 26 Sep 1998 00:07:14 +0000
Subject: Re: SB32 Problem
Message-Id: <marc-linux-sound-90677600130651@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90671325305938@msgid-missing>
In-Reply-To: <marc-linux-sound-90671325305938@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

> On Fri, 25 Sep 1998, Ricardo Peres wrote:
> 
> > I have two problems: first, I cannot play midi files in Linux.
> > I have RedHat 5.1 and a SoundBlaster 32 soundcard, have sound compiled in 
> 
> > Second, although I compiled the kernel with the SB32 low-level driver 
> > from http://bahamut.mm.t.u-tokyo.ac.jp/~iwai/awedrv/ as a module, 
> > whenever I try to `insmod sbawe` I get a message saying: "AWE32: not 
> > detected". It is true that my soundcard is NOT a SB AWE32, just a SB32, 

1- I assume you're initializing the card via isapnptools at boot...
There's one caveat though: pnpdump fails to detect all the 3 ioports to
the wavetable (...er, I'm talking AWE here, but maybe it's the same)
So check your pnpconfig, in the wavetable section it SHOULD init 3
ioports, in my case they're: (ymmv)

	(CONFIGURE CTL0039/23833 (LD 2
	(IO 0 (BASE 0x0620))
	(IO 1 (BASE 0x0A20))
	(IO 2 (BASE 0x0E20))
	(ACT Y)
	))

2- You have to insmod the modules in proper order, preferably insmoding
sound.o at boot time (DMA buffer space allocation gets scarce), and the
rest whenever you like. I have sound.o insmoded in rc.local, and a script
called sound, as follows:

	#!/bin/sh
	/sbin/insmod uart401
	/sbin/insmod sb io=0x220 irq=5 dma=0 dma16=5 type=5
	/sbin/insmod opl3 io=0x388
	/sbin/insmod sbawe

(remember, though, that for kernels 2.1.x it's a different story)
(btw, recent kernels include the awe module, don't attemp to patch'em)
(... unless of course, u know what u're doing)

3- Finally, to hear anything from the wavetable, you've got to upload some
samples to it (i.e. sfbanks, either *.sbk or *.sf2), for which theres a
beautifull utility called sfxload available at your nearest bahamut
mirror.(guess there's a rpm too)

Conclussion: I know (for I went through it) how frustrating it can be to
get your SB going, especially later on when you'll want full duplex, opl3,
external midi AND wave, but the key ingredient here is patience, and IT
DOES HELP to take a look at the sources.
(hint: /usr/src/linux/drivers/sound/<whatever, especially docs>)

Regards,
Raymond
