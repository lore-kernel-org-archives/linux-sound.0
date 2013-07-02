From: Lars-Peter Clausen <lars@metafoo.de>
Date: Tue, 02 Jul 2013 15:25:46 +0000
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: atmel_ssc_dai: move set dma data to startup callback
Message-Id: <51D2F0FA.6040409@metafoo.de>
List-Id: <linux-sound.vger.kernel.org>
References: <1372755849-19546-1-git-send-email-voice.shen@atmel.com> <1372755849-19546-2-git-send-email-voice.shen@atmel.com>
In-Reply-To: <1372755849-19546-2-git-send-email-voice.shen@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bo Shen <voice.shen@atmel.com>
Cc: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org, richard.genoud@gmail.com, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 07/02/2013 11:04 AM, Bo Shen wrote:
[...]
> +	dma_params->substream = substream;

Unrelated to this patch, but having a substream field in the dma_params seems
to be redundant, since you need to know the substream to get the dma_params in
the first place. Looking at the code it also seems to be unused other than this
assignment. Maybe you can send a follow up patch to remove it.

[...]

