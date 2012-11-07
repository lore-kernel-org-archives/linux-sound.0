From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Wed, 07 Nov 2012 08:49:32 +0000
Subject: Re: [Resend PATCH v3 2/4] ARM: at91: atmel-ssc: add device tree support
Message-Id: <20121107084932.GE20063@game.jcrosoft.org>
List-Id: <linux-sound.vger.kernel.org>
References: <1352259701-19847-1-git-send-email-voice.shen@atmel.com>
In-Reply-To: <1352259701-19847-1-git-send-email-voice.shen@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bo Shen <voice.shen@atmel.com>
Cc: alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, broonie@opensource.wolfsonmicro.com, nicolas.ferre@atmel.com, linux-sound@vger.kernel.org, fengguang.wu@intel.com, linux-arm-kernel@lists.infradead.org

On 11:41 Wed 07 Nov     , Bo Shen wrote:
> Add atmel-ssc for device tree support
> 
> Match "atmel,at91rm9200-ssc" for using pdc for data transfer
> Match "atmel,at91sam9g45-ssc" for using dma for data transfer
> 
> Signed-off-by: Bo Shen <voice.shen@atmel.com>
> Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>
> ---
> Resend
>   Fix a error find by Fengguang Yu
> 
>   Although there is a NACK from Jean-Christophe PLAGNIOL-VILLARD,
>   however the pinctrl for at91 is not in mainline. So, plan to add
>   pinctrl support after the pinctrl driver for at91 is merged.
yes the pinctrl is mainline in -next via pinctrl tree

s code does not work on the DT kernel untill it's done

NACK stand I refuse this touch the at91 dtsi untiol it's done correctly

Best Regards,
J.
