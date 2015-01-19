From: Peter Rosin <peda@lysator.liu.se>
Date: Mon, 19 Jan 2015 13:54:45 +0000
Subject: Re: [PATCH 2/2] ASoC: atmel_ssc_dai: remove clock pin comments
Message-Id: <54BD0CA5.4070207@lysator.liu.se>
List-Id: <linux-sound.vger.kernel.org>
In-Reply-To: <1421392784-32298-2-git-send-email-voice.shen@atmel.com>
References: <1421392784-32298-2-git-send-email-voice.shen@atmel.com>
In-Reply-To: <1421392784-32298-2-git-send-email-voice.shen@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bo Shen <voice.shen@atmel.com>
Cc: Mark Brown <broonie@kernel.org>, nicolas.ferre@atmel.com, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

> As the clock can be get from TK/RK pin, so remove the comments.
> 
> Signed-off-by: Bo Shen <voice.shen@atmel.com>
> ---
>  sound/soc/atmel/atmel_ssc_dai.c | 4 ----
>  1 file changed, 4 deletions(-)
> diff --git a/sound/soc/atmel/atmel_ssc_dai.c b/sound/soc/atmel/atmel_ssc_dai.c
> index e691aab..198661b 100644
> --- a/sound/soc/atmel/atmel_ssc_dai.c
> +++ b/sound/soc/atmel/atmel_ssc_dai.c
> @@ -452,10 +452,6 @@ static int atmel_ssc_hw_params(struct snd_pcm_substream *substream,
>  	case SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBM_CFM:
>  		/*
>  		 * I2S format, CODEC supplies BCLK and LRC clocks.
> -		 *
> -		 * The SSC transmit clock is obtained from the BCLK signal on
> -		 * on the TK line, and the SSC receive clock is
> -		 * generated from the transmit clock.
>  		 */
>  		rcmr =	  SSC_BF(RCMR_PERIOD, 0)
>  			| SSC_BF(RCMR_STTDLY, START_DELAY)
> -- 
> 2.3.0.rc0

Hi!

You should probably remove that comment from the case with
SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_CBM_CFM as well...

Cheers,
Peter

