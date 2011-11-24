From: Nicolas Ferre <nicolas.ferre@atmel.com>
Date: Thu, 24 Nov 2011 10:44:01 +0000
Subject: Re: [PATCH] atmel ac97c: using software reset instead hardware reset
Message-Id: <4ECE1FF1.2050707@atmel.com>
List-Id: <linux-sound.vger.kernel.org>
References: <1322042701-32100-1-git-send-email-voice.shen@atmel.com>
In-Reply-To: <1322042701-32100-1-git-send-email-voice.shen@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: voice <voice.shen@atmel.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, JM.Lin@atmel.com, Hong.Xu@atmel.com

On 11/23/2011 11:05 AM, voice :
> Using software reset instead hardware reset if not available
> 
> Signed-off-by: Bo Shen <voice.shen@atmel.com>

Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

You may need to sent it to the sound subsystem mailing-list and maintainers.

Anyway, I let you follow this patch... As it is a fixup and will benefit
to existing platforms, I think that it can make its way to mainline
during 3.2 phase.

Best regards,

> ---
>  sound/atmel/ac97c.c |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
> index 6e5adde..73516f6 100644
> --- a/sound/atmel/ac97c.c
> +++ b/sound/atmel/ac97c.c
> @@ -899,6 +899,10 @@ static void atmel_ac97c_reset(struct atmel_ac97c *chip)
>  		/* AC97 v2.2 specifications says minimum 1 us. */
>  		udelay(2);
>  		gpio_set_value(chip->reset_pin, 1);
> +	} else {
> +		ac97c_writel(chip, MR, AC97C_MR_WRST | AC97C_MR_ENA);
> +		udelay(2);
> +		ac97c_writel(chip, MR, AC97C_MR_ENA);
>  	}
>  }
>  
-- 
Nicolas Ferre
