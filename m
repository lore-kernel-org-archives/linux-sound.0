From: Matthew Haas <mthbbs@lightlink.com>
Date: Mon, 28 Sep 1998 12:36:15 +0000
Subject: Re: Was: Re: SB32 Problem (fwd) now AWE32 micro-howto
Message-Id: <marc-linux-sound-90698596716055@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90696059008619@msgid-missing>
In-Reply-To: <marc-linux-sound-90696059008619@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Mon, 28 Sep 1998, Raymond Hall wrote:
>
> 2- You have to insmod the modules in proper order, preferably insmoding
> sound.o at boot time (DMA buffer space allocation gets scarce), and the
> rest whenever you like. I have sound.o insmoded in rc.local, and a script
> called sound, as follows:
> 
> (remember: sound.o gets modprobed at boottime)
> 
>                 #!/bin/sh
> for ext MIDI:   /sbin/insmod uart401 
> the main mod:   /sbin/insmod sb io=0x220 irq=5 dma=0 dma16=5 type=5
> for old FM:     /sbin/insmod opl3 io=0x388
> for wavetable:  /sbin/insmod sbawe
> 
> (remember, though, that for kernels 2.1.x it's a different story)
> (actually sound.o is now 3 distinct parts, but kerneld takes care, just
> make sure you *modprobe* the module @ boot, not just insmod it)
> (sbawe.o is called awe_wave.o after 2.1.x)
> (btw, recent kernels [later than 2.0.33 i think] include the awe module,
> don't attempt to patch'em)
> (... unless of course, u know what u're doing)
> 
> 3- Finally, to hear anything from the wavetable, you've got to upload some
> samples to it (i.e. sfbanks, either *.sbk or *.sf2), for which theres a
> beautifull utility called sfxload available at your nearest bahamut
> mirror.(guess there's a rpm @ redhat too)
> Precision: Both the SB32 and the AWE32 use sfbanks to configure the
> EMU8000 patches, the difference being that AWE32 also accepts external
> samples which the SB32 can't (it lacks onboard RAM), aside that *little*
> fact, both cards ard identical. (both of them have onboard ROM samples)
> 
> Conclussion: I know (for I went through it) how frustrating it can be to
> get your SB going, especially later on when you'll want full duplex, opl3,
> external midi AND wave, but the key ingredient here is patience, and IT
> DOES HELP to take a look at the sources.
> (hint: /usr/src/linux/drivers/sound/<whatever, especially docs>)
> 

Quick question... I finally got my SB32 working under Linux from a cold
boot (instead of booting into DR-DOS then warm booting into Linux) by
using the isapnptools trick you told us about (thank you very much!!)
However, I've noticed (even before isapnptools worked for me), that
whenever I attempt to play a midi or a s3m or mod file, the program will
segfault. If I understand correctly, it is because I do not have wavetable
setup correctly-- or-- these other modules...I have the 3.8s version of
OSS/Free on a 2.0.35 Slackware system... I compile sound as a module, but
I only get the one module-- sound.o ...where does one go about getting the
opl, etc. modules from??

Also- a question of a different color- If I wanted to hook up a MIDI
keyboard or other MIDI instrument to my machine, I would of course need
that external midi module, but would the "Game Port" need to be enabled or
disabled? I have a game card in my machine which provides me with 2 game
ports, and I do not need the additional ones of my sound and i/o card so
they are disabled.

Thanks for your time.
