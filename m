From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 13 Aug 2003 13:01:30 +0000
Subject: Re: OPL3SA2: spin_is_locked on uninitialized spinlock
Message-Id: <marc-linux-sound-106077994322726@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-106077529618070@msgid-missing>
In-Reply-To: <marc-linux-sound-106077529618070@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

At Wed, 13 Aug 2003 05:04:48 -0700,
Andrew Morton wrote:
> 
> Felipe Alfaro Solana <felipe_alfaro@linuxmail.org> wrote:
> >
> > I've found a lot of errors like this when loading the OPL3SA2 sound
> >  driver on my old Intel AL440LX computer, running 2.6.0-test3-mm1:
> > 
> >  sound/isa/opl3sa2.c:204: spin_is_locked on uninitialized spinlock
> >  d6200034.
> 
> Does this help?
> 
> diff -puN sound/isa/opl3sa2.c~opl3sa2-lock-init-fix sound/isa/opl3sa2.c
> --- 25/sound/isa/opl3sa2.c~opl3sa2-lock-init-fix	2003-08-13 05:03:32.000000000 -0700
> +++ 25-akpm/sound/isa/opl3sa2.c	2003-08-13 05:04:06.000000000 -0700
> @@ -752,6 +752,7 @@ static int __devinit snd_opl3sa2_probe(i
>  		err = -ENOMEM;
>  		goto __error;
>  	}
> +	spin_lock_init(&chip->reg_lock);
>  	chip->irq = -1;
>  	if ((err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops)) < 0)
>  		goto __error;

oh yeah this one should fix.  thanks.

-- 
Takashi Iwai <tiwai@suse.de>		SuSE Linux AG - www.suse.de
ALSA Developer				ALSA Project - www.alsa-project.org
