From: Dan Hollis <goemon@sasami.anime.net>
Date: Thu, 28 Oct 1999 18:33:08 +0000
Subject: Re: 4D-NXs (was Re: Sync Issues)
Message-Id: <marc-linux-sound-94114192416246@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94102459902838@msgid-missing>
In-Reply-To: <marc-linux-sound-94102459902838@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Thu, 28 Oct 1999, Paul Barton-Davis wrote:
> >Well one would have to weigh the effort of reverse engineering it against
> >the gains. Is there any point reverse engineering such ancient hardware?
> >Compared to eg reverse engineering the emu10k or aureal chips.
> what do you think the expected lifetime of any of the current
> generation of chips is, given how long every previous equivalent has
> lasted ? if we're reverse engineering a chip more than 18mths after
> its first use in a PC soundcard, i'd say we might well be wasting our
> time, in the long haul.

The Cirrus Logic chips have been around a long time. The ESS chips
have been around a long time too. The Creative Labs stuff has been around
for more than 10 years. If these chipsets would have had to be reverse
engineered, it would definitely not have been a waste of time since the
data would still be useful today.

Many chipsets go through incremental improvements (eg CS42xx, ESS1xxx) so
reverse engineering one may prove to be useful later since future chips
may be (mostly) backwards-compatible, with a few changes. I suspect this
is the case with the YMF7xx chips and maybe even the AU8xxx ones.

Definitely the YMF7xx chips and the DS-1x architecture look like theyre
going to be around for some time.

-Dan
