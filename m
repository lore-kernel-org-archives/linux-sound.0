From: Tony Nugent <tony@growzone.com.au>
Date: Fri, 22 Oct 1999 01:39:19 +0000
Subject: Re: interrupt conflict with sound and video?
Message-Id: <marc-linux-sound-94056342530220@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94055376721818@msgid-missing>
In-Reply-To: <marc-linux-sound-94055376721818@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Thu Oct 21 1999 at 22:34, "Peter John Cameron" wrote:

> I've got a voodoo 3000 video card and an integrated Creative SoundBlaster

Hmm... sounds familiar :)

> AudioPCI 64V. These work without problems in win98. However, no sound is
> forthcoming in Linux RH 6.1 (& 6.0) (apart from an odd click here and
> there).
> 
> I've just noticed that win98 reports the voodoo card as having an IRQ of 11.
> The SoundBlaster also has an IRQ of 11. On the other hand, the legacy sound
> device has IRQ 7.
>
> In Linux, the voodoo has IRQ 11 and the soundcard (automatically detected as
> an ensoniq 1371) is also given IRQ 11.

I assume that you've done:
	cat /proc/interrupts
	cat /proc/pci
	cat /proc/dma
	cat /proc/ioports
and other such things.

PCI cards can happily share the same interrupt, no problem.  That's
one of the big advantages in going from isa -> pci and what you are
seeing is certainly not your problem.

> Is this why I get no sound? IRQ 7 is free on my Linux system, so how should

No idea.

> I go about changing the sound card's IRQ from 11 to 7? Would such a change

Don't bother.  No.

> affect how sound works in win98? More to the point, would it solve my lack
> of Linux sound?

No, not at all.  In fact, it may make things worse if you start trying to
manually assign interrupts.

Besides, if I recall correctly, irq7 is (sometimes) used by the
parport.

> Someone suggested moving the PCI cards around in the slots. The sound card
> is integrated onto the motherboard, so this means I have to physically move
> the voodoo card? Is this the only solution?

Could be worth trying.  Make sure that your bios is not doing anything
to the IRQs.

I have banshee/v3 systems with esoniq pci sound cards (1370 and 1371
chipsets... for various reasons I actually prefer the 1370).  It all
works nicely here.  (Redhat 5.2, 6.0 and now 6.1).

Cheers
Tony
