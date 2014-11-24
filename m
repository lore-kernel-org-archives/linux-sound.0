From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Mon, 24 Nov 2014 11:50:20 +0000
Subject: Re: [PATCH v2] Fix PXA2xx sound DMA autoincrementation flags
Message-Id: <54731B7C.4030306@cogentembedded.com>
List-Id: <linux-sound.vger.kernel.org>
References: <54718713.1050902@tul.cz> <54720ACA.2070506@cogentembedded.com>
 <5472605F.4030702@tul.cz>
In-Reply-To: <5472605F.4030702@tul.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Hello.

On 11/24/2014 1:31 AM, Petr Cvek wrote:

> Add support for SCCB devices into PXA27x I2C controller.

> Fix generated START but no STOP for message without I2C_M_NOSTART flag. Add support for I2C_M_IGNORE_NAK flag.
>
> Signed-off-by: Petr Cvek <petr.cvek@tul.cz>
> ---
>   sound/arm/pxa2xx-pcm-lib.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)

> diff --git a/sound/arm/pxa2xx-pcm-lib.c b/sound/arm/pxa2xx-pcm-lib.c
> index a61d7a9..5d3a415 100644
> --- a/sound/arm/pxa2xx-pcm-lib.c
> +++ b/sound/arm/pxa2xx-pcm-lib.c
> @@ -45,7 +45,13 @@ int __pxa2xx_pcm_hw_params(struct snd_pcm_substream *substream,
>   	size_t period = params_period_bytes(params);
>   	pxa_dma_desc *dma_desc;
>   	dma_addr_t dma_buff_phys, next_desc_phys;
> -	u32 dcmd = DCMD_INCSRCADDR | DCMD_FLOWTRG;
> +	u32 dcmd = 0;
> +
> +	if (substream->stream = SNDRV_PCM_STREAM_PLAYBACK) {
> +		dcmd = DCMD_INCSRCADDR | DCMD_FLOWTRG;
> +	} else {
> +		dcmd = DCMD_INCTRGADDR | DCMD_FLOWSRC;
> +	}

    {} not needed at all here. Sorry for not complaining at once...

WBR, Sergei

