From: "Shen, Voice" <Voice.Shen@atmel.com>
Date: Fri, 16 Dec 2011 01:52:50 +0000
Subject: RE: [PATCH] atmel ac97c: using software reset instead hardware reset if not available
Message-Id: <4C79549CB6F772498162A641D92D532803B527CA@penmb01.corp.atmel.com>
List-Id: <linux-sound.vger.kernel.org>
References: <1322042701-32100-1-git-send-email-voice.shen@atmel.com> <4EE9F04C.6080906@atmel.com>
In-Reply-To: <4EE9F04C.6080906@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Ferre, Nicolas" <Nicolas.FERRE@atmel.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, "Lin, JM" <JM.Lin@atmel.com>, "Xu, Hong" <Hong.Xu@atmel.com>

Hi Nicolas,
  No one response for this.
  Would you please merge it?
  Thanks

Best Regards,
Voice Shen

-----Original Message-----
From: Nicolas Ferre [mailto:nicolas.ferre@atmel.com] 
Sent: Thursday, December 15, 2011 21:04 voice
To: Shen, Voice
Cc: linux-kernel@vger.kernel.org; linux-sound@vger.kernel.org; Lin, JM;
Xu, Hong
Subject: Re: [PATCH] atmel ac97c: using software reset instead hardware
reset if not available

On 11/23/2011 11:05 AM, voice :
> Using software reset instead hardware reset if not available

Ping?
Can you please tell me what is the status of this fix? Will it go
upstream for 3.3?

> Signed-off-by: Bo Shen <voice.shen@atmel.com>
> ---
>  sound/atmel/ac97c.c |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
> index 6e5adde..73516f6 100644
> --- a/sound/atmel/ac97c.c
> +++ b/sound/atmel/ac97c.c
> @@ -899,6 +899,10 @@ static void atmel_ac97c_reset(struct atmel_ac97c
*chip)
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
