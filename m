From: Bo Shen <voice.shen@atmel.com>
Date: Wed, 27 Nov 2013 01:16:16 +0000
Subject: Re: [PATCH 1/2] ASoC: atmel: sam9x5_wm8731: fix oops when unload module
Message-Id: <529547E0.3060504@atmel.com>
List-Id: <linux-sound.vger.kernel.org>
References: <1385439472-23352-1-git-send-email-voice.shen@atmel.com> <20131126132244.GP14725@sirena.org.uk>
In-Reply-To: <20131126132244.GP14725@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>
Cc: nicolas.ferre@atmel.com, plagnioj@jcrosoft.com, richard.genoud@gmail.com, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org

Hi Mark,

On 11/26/2013 09:22 PM, Mark Brown wrote:
> On Tue, Nov 26, 2013 at 12:17:51PM +0800, Bo Shen wrote:
>
>> +	card->drvdata = priv;
>
> You should use snd_soc_card_set_drvdata() for this.

OK, I will change to use snd_soc_card_set_drvdata() for this.
Thanks.

Best Regards,
Bo Shen
