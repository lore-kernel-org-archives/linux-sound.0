From: Takashi Iwai <tiwai@suse.de>
Date: Sun, 07 Jun 2009 07:09:47 +0000
Subject: Re: [PATCH]sgio2audio.c: clean up checking
Message-Id: <s5hbpp0zfic.wl%tiwai@suse.de>
List-Id: <linux-sound.vger.kernel.org>
References: <1244353048.3355.22.camel@myhost>
In-Reply-To: <1244353048.3355.22.camel@myhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

At Sun, 07 Jun 2009 13:37:27 +0800,
Figo.zhang wrote:
> 
> vfree() does it's own 'NULL' check,so no need for check before
> calling it.
> 
> Signed-off-by: Figo.zhang <figo1802@gmail.com>

Thanks, applied now.


Takashi

> ---  
>  sound/mips/sgio2audio.c |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/mips/sgio2audio.c b/sound/mips/sgio2audio.c
> index 66f3b48..e497525 100644
> --- a/sound/mips/sgio2audio.c
> +++ b/sound/mips/sgio2audio.c
> @@ -619,8 +619,7 @@ static int snd_sgio2audio_pcm_hw_params(struct snd_pcm_substream *substream,
>  /* hw_free callback */
>  static int snd_sgio2audio_pcm_hw_free(struct snd_pcm_substream *substream)
>  {
> -	if (substream->runtime->dma_area)
> -		vfree(substream->runtime->dma_area);
> +	vfree(substream->runtime->dma_area);
>  	substream->runtime->dma_area = NULL;
>  	return 0;
>  }
> 
> 
