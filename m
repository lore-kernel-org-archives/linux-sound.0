From: Takashi Iwai <tiwai@suse.de>
Date: Fri, 12 Jan 2007 17:42:52 +0000
Subject: Re: [patch]cleanup and error reporting for sound/core/init.c
Message-Id: <s5h64bcgmzn.wl%tiwai@suse.de>
List-Id: <linux-sound.vger.kernel.org>
References: <200701121449.58186.oneukum@suse.de>
In-Reply-To: <200701121449.58186.oneukum@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oliver Neukum <oneukum@suse.de>
Cc: Jaroslav Kysela <perex@suse.cz>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org

At Fri, 12 Jan 2007 14:49:57 +0100,
Oliver Neukum wrote:
> 
> +	} else {
> +		 if (idx < snd_ecards_limit) {
> +			if (snd_cards_lock & (1 << idx))
> +				err = -EBUSY;	/* invalid */
> +		} else if (idx < SNDRV_CARDS)
> +				snd_ecards_limit = idx + 1; /* increase the limit */
> +			else
> +				err = -ENODEV;

The indent looks strange in the above three lines.
Also, for me it's not much better than before... :)
(all if's are comparisons of idx with other values.)


Takashi
