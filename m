From: Dan Hollis <goemon@sasami.anime.net>
Date: Thu, 28 Oct 1999 00:23:13 +0000
Subject: Re: 4D-NXs (was Re: Sync Issues)
Message-Id: <marc-linux-sound-94107049300762@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94102459902838@msgid-missing>
In-Reply-To: <marc-linux-sound-94102459902838@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Wed, 27 Oct 1999, Paul Barton-Davis wrote:
> >>       * "we don't have enough programmers to do that"
> >If the drivers are being written for them by volunteers, I dont see how
> >this is relevant.
> if they had a driver written for them by 4Front, and it had problems,
> their desire to have volunteers do another one is low. i won't name
> the company that had this problem, but they are a real soundcard company.

Still irrelevant to the *statement being made*, which is "*we* dont have
enough programmers to do that". Why has the number of programmers *they*
have, have anything to do with us volunteers writing a driver for them for
free? *boggle*.

> >>       * "we don't have any written documentation to give you guys -
> >>          we wrote the driver by having the software group sit in with
> >> 	 the hardware group"
> >This should be a warning sign to anyone thinking of purchasing their
> >hardware. If a company cant be bothered to internally document the
> >hardware, what happens if key engineers leave the company? Oh dear, their
> >project is *permanently screwed*, which means zero support for end users.
> >This is no way to run a company.
> Yamaha (the company that this quote comes from) seems to be doing
> quite well :)

No, Yamaha *does* have documentation on the native PCI stuff. They just
wont release it.

> >Uh, isnt this what patents are for? If someone reverse engineers their
> >card, they are *completely screwed* unless they have patent protection.
> and the cost of a patent is ? look, there's very little truly clever
> stuff in these cards, and what is patented is often stupid (est told
> me last week about someone who has patented putting an LFO in hardware
> on a soundcard with a wavetable synth). most soundcard technologies
> don't last more than a few years, and investing the X-thousand dollars
> in seeking patent protection for a nifty hack that will be irrelevant
> in that time is pretty unjustifiable for most things. security for
> obscurity really does work when you only want it for a little while ;)

I guess what we need are some PCI snooper hardware so we can start putting
the shits up (various unnamed companies). Start posting reverse engineered
specs and stuff will surely get their attention ;)

Didnt RMS say that the FSF was going to start doing some reverse
engineering with PCI snoopers?

> i think david's point is an important one that i didn't mention, and
> he's right that the only thing, in the end, that most of the companies
> are going to respond to is more than a couple of studios saying "we
> run linux - we want to buy your cards/devices and there are no drivers".

Im more concerned about chip vendors than card manufacturers. If we
convince the chip vendor to release docs then theres really nothing a card
manufacturer can do to stop us.

We really only have three problematic chip vendors here - Yamaha, Aureal,
and Creative Labs. Although Creative Labs may be coming around finally
with the emu10k stuff.

The trend toward FPGA makes things interesting, of course.

-Dan
