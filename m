From: Raymond Hall <kovalski@iris.razteca.org.mx>
Date: Mon, 28 Sep 1998 05:13:06 +0000
Subject: Was: Re: SB32 Problem (fwd) now AWE32 micro-howto
Message-Id: <marc-linux-sound-90696059008619@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello,
I posted this answer 3 days ago... but similar questions keep showing up,
guess It can pass as an AWE/SB 32 mini-mini howto... 
There's a HOWTO, anyway, and you should also check the Sound-HOWTO and
the docs under /usr/src/linux/drivers/sound
Regards,
Raymond ... I have a proposal at the end. :)

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
	(IO 1 (BASE 0x0A20))   <---\___ add these lines.
	(IO 2 (BASE 0x0E20))   <---/
	(ACT Y)
	))

2- You have to insmod the modules in proper order, preferably insmoding
sound.o at boot time (DMA buffer space allocation gets scarce), and the
rest whenever you like. I have sound.o insmoded in rc.local, and a script
called sound, as follows:

(remember: sound.o gets modprobed at boottime)

                #!/bin/sh
for ext MIDI:   /sbin/insmod uart401 
the main mod:   /sbin/insmod sb io=0x220 irq=5 dma=0 dma16=5 type=5
for old FM:     /sbin/insmod opl3 io=0x388
for wavetable:  /sbin/insmod sbawe

(remember, though, that for kernels 2.1.x it's a different story)
(actually sound.o is now 3 distinct parts, but kerneld takes care, just
make sure you *modprobe* the module @ boot, not just insmod it)
(sbawe.o is called awe_wave.o after 2.1.x)
(btw, recent kernels [later than 2.0.33 i think] include the awe module,
don't attempt to patch'em)
(... unless of course, u know what u're doing)

3- Finally, to hear anything from the wavetable, you've got to upload some
samples to it (i.e. sfbanks, either *.sbk or *.sf2), for which theres a
beautifull utility called sfxload available at your nearest bahamut
mirror.(guess there's a rpm @ redhat too)
Precision: Both the SB32 and the AWE32 use sfbanks to configure the
EMU8000 patches, the difference being that AWE32 also accepts external
samples which the SB32 can't (it lacks onboard RAM), aside that *little*
fact, both cards ard identical. (both of them have onboard ROM samples)

Conclussion: I know (for I went through it) how frustrating it can be to
get your SB going, especially later on when you'll want full duplex, opl3,
external midi AND wave, but the key ingredient here is patience, and IT
DOES HELP to take a look at the sources.
(hint: /usr/src/linux/drivers/sound/<whatever, especially docs>)

Now here's my wish :)...
"Graphical Soundfont patch editor/librarian"
I've played a little with sfxload and the related programs that come with
it (sf2text, text2sf), and also with the CLS supplied "vienna soundfont
editor". It is clear to me that the linux tools have come to be far
superior and versatile, though we (awe'rs) are still lacking a fundamental
thing: a nice and simple (...er, easy, intuitively fast) GUI for all of
this, 'cause I still regret knowing what a good & powerfull sampler the
EMU8000 is and how sad it to have it locked in a (non)software cage.
I'm preety busy in my job now, but I'd like to embark in such project as
soon as I'm done (nov/dec)... anyone interested in joining the effort?
(i.e. I *love* the virual keyboard in Vienna that allows you to monitor
your patch as you edit it, I wonder how this "dynamic" uploading is done.
Guess it's buried in the AWE tech docs...)

Regards,
Raymond
