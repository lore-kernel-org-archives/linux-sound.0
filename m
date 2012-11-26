From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 26 Nov 2012 21:23:42 +0000
Subject: Re: [Patch v6 4/4] ASoC: at91sam9g20ek-wm8731: convert to dt support
Message-Id: <201211262123.42812.arnd@arndb.de>
List-Id: <linux-sound.vger.kernel.org>
References: <1352887751-21848-1-git-send-email-voice.shen@atmel.com>
 <1352887751-21848-5-git-send-email-voice.shen@atmel.com>
In-Reply-To: <1352887751-21848-5-git-send-email-voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, linux-sound-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

On Wednesday 14 November 2012, Bo Shen wrote:
> +
> +                       ssc0: ssc@fffbc000 {
> +                               status = "okay";
> +                               pinctrl-0 = <&pinctrl_ssc0_tx>;
> +                       };
>                 };
>  

This gives me a build error in linux-next with at91sam9g20_defconfig:

ERROR (phandle_references): Reference to non-existent node or label "pinctrl_ssc0_tx"

	Arnd
