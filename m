From: Bo Shen <voice.shen@atmel.com>
Date: Wed, 03 Jul 2013 01:20:25 +0000
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: atmel_ssc_dai: move set dma data to startup callback
Message-Id: <51D37C59.3090306@atmel.com>
List-Id: <linux-sound.vger.kernel.org>
References: <1372755849-19546-1-git-send-email-voice.shen@atmel.com> <1372755849-19546-2-git-send-email-voice.shen@atmel.com> <51D2F0FA.6040409@metafoo.de>
In-Reply-To: <51D2F0FA.6040409@metafoo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org, richard.genoud@gmail.com, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Lars-Peter,

On 7/2/2013 23:25, Lars-Peter Clausen wrote:
> On 07/02/2013 11:04 AM, Bo Shen wrote:
> [...]
>> +	dma_params->substream = substream;
>
> Unrelated to this patch, but having a substream field in the dma_params seems
> to be redundant, since you need to know the substream to get the dma_params in
> the first place. Looking at the code it also seems to be unused other than this
> assignment. Maybe you can send a follow up patch to remove it.
>
> [...]
>

Yes, this is redundant. I will remove it in next version patches.

Best Regards,
Bo Shen
