From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 16 Jan 2007 16:50:57 +0000
Subject: Re: [patch]cleanup and error reporting for sound/core/init.c
Message-Id: <s5hejpu29vy.wl%tiwai@suse.de>
List-Id: <linux-sound.vger.kernel.org>
References: <200701121449.58186.oneukum@suse.de>
	<s5h64bcgmzn.wl%tiwai@suse.de>
	<200701130737.59435.oneukum@suse.de>
In-Reply-To: <200701130737.59435.oneukum@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oliver Neukum <oneukum@suse.de>
Cc: Jaroslav Kysela <perex@suse.cz>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org

At Sat, 13 Jan 2007 07:37:59 +0100,
Oliver Neukum wrote:
> 
> Am Freitag, 12. Januar 2007 18:42 schrieb Takashi Iwai:
> > At Fri, 12 Jan 2007 14:49:57 +0100,
> > Oliver Neukum wrote:
> > > 
> > > +	} else {
> > > +		 if (idx < snd_ecards_limit) {
> > > +			if (snd_cards_lock & (1 << idx))
> > > +				err = -EBUSY;	/* invalid */
> > > +		} else if (idx < SNDRV_CARDS)
> > > +				snd_ecards_limit = idx + 1; /* increase the limit */
> > > +			else
> > > +				err = -ENODEV;
> > 
> > The indent looks strange in the above three lines.
> > Also, for me it's not much better than before... :)
> > (all if's are comparisons of idx with other values.)
> 
> Hi,
> 
> OK, how about this one? The original indentation makes the control
> flow very hard to follow.
> 
> 	Regards
> 		Oliver
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.de>

Thanks, now applied to ALSA tree.


Takashi
