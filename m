From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 27 Aug 2014 06:17:46 +0000
Subject: Re: [PATCH 1/1] ice1712: Replacing hex with #defines
Message-Id: <s5hoav6foc5.wl-tiwai@suse.de>
List-Id: <linux-sound.vger.kernel.org>
References: <1409113308-4671-1-git-send-email-kostaslinuxxx@gmail.com>
In-Reply-To: <1409113308-4671-1-git-send-email-kostaslinuxxx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Konstantinos Tsimpoukas <kostaslinuxxx@gmail.com>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org

At Tue, 26 Aug 2014 23:21:48 -0500,
Konstantinos Tsimpoukas wrote:
> 
> Adds to te readability of the ice1712 driver.
> 
> Signed-off-by: Konstantinos Tsimpoukas <kostaslinuxxx@gmail.com>

Thanks, applied.


Takashi

> ---
>  sound/pci/ice1712/ice1712.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/pci/ice1712/ice1712.c b/sound/pci/ice1712/ice1712.c
> index 87f7fc4..206ed2c 100644
> --- a/sound/pci/ice1712/ice1712.c
> +++ b/sound/pci/ice1712/ice1712.c
> @@ -2528,7 +2528,7 @@ static int snd_ice1712_free(struct snd_ice1712 *ice)
>  	if (!ice->port)
>  		goto __hw_end;
>  	/* mask all interrupts */
> -	outb(0xc0, ICEMT(ice, IRQ));
> +	outb(ICE1712_MULTI_CAPTURE | ICE1712_MULTI_PLAYBACK, ICEMT(ice, IRQ));
>  	outb(0xff, ICEREG(ice, IRQMASK));
>  	/* --- */
>  __hw_end:
> -- 
> 1.9.1
> 
