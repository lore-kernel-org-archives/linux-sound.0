From: Tony Nugent <tony@growzone.com.au>
Date: Thu, 20 Jan 2000 14:35:27 +0000
Subject: Re: sound blaster 16 config
Message-Id: <marc-linux-sound-94840213305720@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94826594212109@msgid-missing>
In-Reply-To: <marc-linux-sound-94826594212109@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Tue Jan 18 2000 at 20:13, Yao Wang wrote:

> I am running 2.2.5-22 from RH 6.0 with a sound blaster 16 card with

That's all anyone needs to know.

Run the sndconfig utility that comes with the system and you can't
miss.  It'll auto-detect it within a few microseconds, and after
hitting return a couple of times to confirm that you can hear the
sound samples, it's done.  Simple.

(It's all documented in the redhat installation/user guides).

> base_addr=0x220, IRQ=5, 8-bit DMA=1 and 16-bit DMA=5 (uncommenting
> a few lines in the pnpdump output. After running isapnp on this config

It's not the way to do this at all.  You might get it working once,
then next time you boot it'll be broken again.

Besides, "pnpdump -c" will give you output with the relevant lines
uncommented.  If I *have* to do it at all , this is how I create the
pnp config file:

	pnpdump -c | egrep '^$|^#" | tee /etc/isapnp.conf

(You get a line clean file with that command, but without all the
masses of comments).

The sndconfig utility usually gets things right first time, but
recently I did have to redo everything manually after shoving in an
old isa 3com card as a 2nd ethernet card and the addition of an
internal pnp modem.  (All the ISQs needed to be changed around as a
result).

My recommendation is to make sure you have "pnp operating system yes" in the BIOS, boot into single user mode ("linux single" at the
lilo bootprompt), move /etc/isapnp.conf and /etc/conf.modules
sideways (isapnp.conf at least), then run sndconfig with the system in
that condition (before any other devices or interrupts get allocated
that might "interfere" with the kernel's irq allocations.

> file, the sound-modules appeared loaded after rebooting.

(Why reboot just to get the sound up and going?  Geez, this ain't
microslop :)  The only reason to shut down a linux box is when you wan
to change the hardware...)

> # lsmod
> Module                  Size  Used by
> sound                  58392   0  (autoclean) (unused)
> soundlow                 300   0  (autoclean) [sound]
> soundcore               2404   3  (autoclean) [sound]
> autofs                  9188   1  (autoclean)
[...]

You're missing the sb.o, midi/opl3 and uart401.o modules for a start.

The magic for all this needs to go into /etc/conf.modules and would
look something like:

	alias sound sb
	options -k sb io=0x220 irq=5 dma=1,5
	alias midi opl3
	options -k opl3 io=0x388

As I say, sndconfig will do this for you.

> I could not play music to it and was wondering about some info on
> sound config with 2.2.x (sound + soundcore + soundlow)? Am i running
> something new on an rather old hardware?

Your sound card will sing under linux, no problem.

> could someone give me any hint?

On a redhat box, sndconfig.

> Thanks a lot.

Not a problem.  Happy listening! :)

Cheers
Tony
