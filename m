From: Tony Nugent <Tony.Nugent@usq.edu.au>
Date: Thu, 28 Jan 1999 05:04:00 +0000
Subject: Re: sb16 woes
Message-Id: <marc-linux-sound-91749992703480@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91742302922933@msgid-missing>
In-Reply-To: <marc-linux-sound-91742302922933@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Wed Jan 27 1999 at 02:07, Brian Craft wrote:

> Hey -- I just picked up a isa pnp card that was sold  as a sb16. It
> reports itself as a vibra 16.
> 
> It also reports that it has 2 8 bit DMA, instead of one 8 and one 16.
> 
> The sb module will load, but it always reports a IRQ/DRQ problem during
> playback.
> 
> 
> What's up with these boards? Do they do 16 bit audio? Do they work
> on linux?

They work just great.

> I'm using rh5.2.

Run the "sndconf" utitity as root... the configuration process is
almost automatic from there.

Cheers
Tony
