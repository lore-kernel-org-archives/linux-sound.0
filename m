From: Dan Hollis <goemon@sasami.anime.net>
Date: Thu, 28 Oct 1999 00:50:08 +0000
Subject: Re: 4D-NXs (was Re: Sync Issues)
Message-Id: <marc-linux-sound-94107190101901@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94102459902838@msgid-missing>
In-Reply-To: <marc-linux-sound-94102459902838@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Wed, 27 Oct 1999, Paul Barton-Davis wrote:
> >Still irrelevant to the *statement being made*, which is "*we* dont have
> >enough programmers to do that". Why has the number of programmers *they*
> >have, have anything to do with us volunteers writing a driver for them for
> >free? *boggle*.
> they don't *want* volunteers writing drivers for them. period. end of story.

If thats what they wanted, why didnt they just say it. Stating it that way
is purposely deceitful.

> >No, Yamaha *does* have documentation on the native PCI stuff. They just
> >wont release it.
> i have been told by one senior level management guy at yamaha and one
> senior programming guy from their main japanese plant that there is
> *NO* documentation for the DSP Factory.

I received a statement from one of their japanese engineers that they *do*
have documentation for their native PCI audio block for the YMF724 and
YMF744, but that it was only released to OEMs and hardware integrators.

So we have conflicting statements from the same company. Not too suprising
really.

> >Im more concerned about chip vendors than card manufacturers. If we
> >convince the chip vendor to release docs then theres really nothing a card
> >manufacturer can do to stop us.
> i have the "full specs" to the (ancient) YSS225 FX processor from
> yamaha. its installed on the Tropez+. the specs are useless because it
> has downloaded microcode to set it up, and they only document 5
> microcode programs. Yamaha wrote a special one for Turtle Beach, and
> neither they nor Yamaha appear have any record of what it used the dsp
> memory locations for.
> i've used dosemu to decode part of it, and reverse engineered the
> windows FX driver too, but the end result is a GUI with 512 buttons
> that inc/dec values in a DSP location to let me try to understand what
> it does. since many memory locations' function is tightly coupled with
> several others, its a pretty hopeless case. i did manage to find where
> the global stereo echo delay time was set, but that was all.
> you could argue that this means that we don't have the specs, but
> Yamaha certainly doesn't see it that way.

Well one would have to weigh the effort of reverse engineering it against
the gains. Is there any point reverse engineering such ancient hardware?
Compared to eg reverse engineering the emu10k or aureal chips.

FWIW the SAM9407 documentation was pretty inadequate but gerd rausch
managed to come up with a pretty decent driver anyway.

-Dan
