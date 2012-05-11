From: Takashi Iwai <tiwai@suse.de>
Date: Fri, 11 May 2012 10:10:41 +0000
Subject: Re: [PATCH] atmel/ac97c: correct the unexpected behavior when using uninitial value for reset pin
Message-Id: <s5hfwb7t4da.wl%tiwai@suse.de>
List-Id: <linux-sound.vger.kernel.org>
References: <1336729168-20562-1-git-send-email-voice.shen@atmel.com>
In-Reply-To: <1336729168-20562-1-git-send-email-voice.shen@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bo Shen <voice.shen@atmel.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, nicolas.ferre@atmel.com, plagnioj@jcrosoft.com, josh.wu@atmel.com, jm.lin@atmel.com

At Fri, 11 May 2012 17:39:28 +0800,
Bo Shen wrote:
> 
> When pdata->reset_pin is passed with a negative value (means gpio
> is invalid), then chip->reset_pin will not be assigned to a vaule,
> it will use default value 0. This will cause unexpected behavior.
> 
> So, add this patch to correct.
> 
> Signed-off-by: Bo Shen <voice.shen@atmel.com>
> Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

Applied now.  Thanks.


Takashi

> ---
>  sound/atmel/ac97c.c |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
> index 115313e..f5ded64 100644
> --- a/sound/atmel/ac97c.c
> +++ b/sound/atmel/ac97c.c
> @@ -991,6 +991,8 @@ static int __devinit atmel_ac97c_probe(struct platform_device *pdev)
>  			gpio_direction_output(pdata->reset_pin, 1);
>  			chip->reset_pin = pdata->reset_pin;
>  		}
> +	} else {
> +		chip->reset_pin = -EINVAL;
>  	}
>  
>  	snd_card_set_dev(card, &pdev->dev);
> -- 
> 1.7.10
> 
