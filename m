From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 03 Nov 2011 08:26:09 +0000
Subject: Re: HDA Intel microphone regression in 3.1.0
Message-Id: <s5hvcr1boim.wl%tiwai@suse.de>
List-Id: <linux-sound.vger.kernel.org>
References: <20111102102554.1f443b9c@laptop.homenet>
	<20111102105442.GA30355@gere.osrc.amd.com>
	<s5hd3da6asw.wl%tiwai@suse.de>
	<20111102170742.059f04ed@laptop.homenet>
	<s5hy5vyl5ia.wl%tiwai@suse.de>
	<20111102233233.2abb4038@laptop.homenet>
In-Reply-To: <20111102233233.2abb4038@laptop.homenet>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Vine <chris@cvine.freeserve.co.uk>
Cc: Borislav Petkov <bp@alien8.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org

At Wed, 2 Nov 2011 23:32:33 +0000,
Chris Vine wrote:
> 
> On Wed, 02 Nov 2011 19:54:21 +0100
> Takashi Iwai <tiwai@suse.de> wrote:
> [snip]
> > > > Please give alsa-info.sh outputs taken from both 3.0 and 3.1
> > > > kernels.
> > > 
> > > Attached as below (warning, this is long).
> > 
> > Thanks.  Could you try to pass model=auto option to snd-hda-intel
> > module?
> 
> With that option applied to snd-hda-intel, the microphone now works
> correctly again. I imagine that is not the permanent fix but it will do
> for my netbook.

Actually this is equivalent with the change in the upcoming 3.2
kernel.  The whole static configurations for ALC269 have been already
dropped, so it uses model=auto as default now for ALC269.

But, since 3.1 kernel is broken for some ALC269, I'd need some fix for
stable kernel.  Did you try my patch with 3.1 kernel?  It's not in the
upstream, but should be applied exceptionally as a regression fix (if
it really works).


thanks,

Takashi
