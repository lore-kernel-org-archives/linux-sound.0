From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 03 Nov 2011 09:59:25 +0000
Subject: Re: HDA Intel microphone regression in 3.1.0
Message-Id: <s5hehxpbk76.wl%tiwai@suse.de>
List-Id: <linux-sound.vger.kernel.org>
References: <20111102102554.1f443b9c@laptop.homenet>
	<20111102105442.GA30355@gere.osrc.amd.com>
	<s5hd3da6asw.wl%tiwai@suse.de>
	<20111102170742.059f04ed@laptop.homenet>
	<s5hy5vyl5ia.wl%tiwai@suse.de>
	<s5hsjm6l1b0.wl%tiwai@suse.de>
	<20111103093901.54f2d1fc@laptop.homenet>
In-Reply-To: <20111103093901.54f2d1fc@laptop.homenet>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Vine <chris@cvine.freeserve.co.uk>
Cc: Borislav Petkov <bp@alien8.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org

At Thu, 3 Nov 2011 09:39:01 +0000,
Chris Vine wrote:
> 
> On Wed, 02 Nov 2011 21:25:07 +0100
> Takashi Iwai <tiwai@suse.de> wrote:
> [snip]
> > > Thanks.  Could you try to pass model=auto option to snd-hda-intel
> > > module?
> > 
> > Also, try the patch below without model option.  This should fix the
> > problem.
> 
> Yes that fixes it, thanks.
> 
> I'm impressed - a working patch 12 hours after reporting it on lkml.

Thanks for a quick check.  May I take you to a testd-by tag in the
stable patch?


Takashi
