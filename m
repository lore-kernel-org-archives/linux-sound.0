From: Paco <paco@OhKeePa.Net>
Date: Mon, 12 Jul 1999 20:09:26 +0000
Subject: Re: Sound card with S/PDIF input (and output) wanted
Message-Id: <marc-linux-sound-93181039910596@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93102609320130@msgid-missing>
In-Reply-To: <marc-linux-sound-93102609320130@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

> 
> It's funny how slow the soundcard development has been when 
> compared to other computer components. 

Part of this is slow develpoment is due to human hearing limitations.  I
may be slightly off on the numbers, but I believe the human ear will 'max
out' at 50KHz sample rate.  Anything above and beyond this rate creates
absolutely *no* improvement in sound quality to the human ear.  We can't
tell a difference.  This is why many of the cards have frequency ceilings
of 44.1KHz or 48KHz.

The other part of this slow development is a 'supply/demand' issue.  Most
people don't really even *need* a full-dpulex card at all.  They use
their sound cards for games/MP3s/etc (ie, only *playing* sound files).  A
_small_ percentage of them ever do any recording, and an even _smaller_
percentage of *these* people do recording that requires full-duplex
operation.

We here on this mailing list are a small small small sub-culture
(especially since we use linux in the first place), and while *we* may all
like to have a nice 50KHz 20-bit full-duplex soundcard with 8 digital i/o 
ports, the other 99% of computer users couldn't care less.  This creates a
small demand for such a card.  So small, in fact, that the price of such a
product *must* be astronomically large, just to cover the research and
development costs that went into the design of the card.

> I'm now using
> a GUS MAX and a AWE64Gold for my recording work. Although 
> GUS is at least two or three years older than the AWE, 
> it can handle 16bit full-duplex while AWE64Gold can't (!).

This was done to make the AWE64's more affordable.  The second audio
device in the AWE64 is an 8-bit device.  (The AWE64Gold cost more than the
AWE64 only because they have gold-plated the bus contacts.  It's the exact
same components other than that.  I use the regular AWE64 because I'm a
cheap-skate.)

Granted, the output of this second audio device leaves much to be desired,
but the only person who ever hears the sound out of this second device (in
my case, at least) is me.  I do multi-track recording, so I have to listen
to a scratchy bass guitar through the 8-bit device as I lay down the
rhythm guitar through the 16-bit device, but I see this as only a minor
annoyance since the final mix-down of all the tracks that I record sounds
just fine when it's all said and done.

The AWE64 packs alot of bang for the buck, IMHO.  I can do all of my
recording with this one sound card.  I have my complaints about the card,
too, so don't get me wrong, but you can't expect professional quality
recording from a card that only costs $35 brand new.  You get what you pay
for.

Chad Walker
Digital Systems Design Engineer
HAL Computer Systems
