From: Nicolas Ferre <nicolas.ferre@atmel.com>
Date: Tue, 02 Sep 2014 09:15:05 +0000
Subject: Re: [PATCH v2 3/4] dts: atmel: at91sam9rl: switch ssc compatible string
Message-Id: <54058A99.9010407@atmel.com>
List-Id: <linux-sound.vger.kernel.org>
References: <1402481682-9811-1-git-send-email-voice.shen@atmel.com> <1402481682-9811-4-git-send-email-voice.shen@atmel.com>
In-Reply-To: <1402481682-9811-4-git-send-email-voice.shen@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bo Shen <voice.shen@atmel.com>, broonie@kernel.org
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org

On 11/06/2014 12:14, Bo Shen :
> As the SSC integrate in at91sam9rl support frame sync length
> extension, so switch compatible string to support this feature.
> 
> Signed-off-by: Bo Shen <voice.shen@atmel.com>

I take the DT part of this series for at91-3.18-dt3: thanks!

Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>


> ---
> Changes in v2:
>   - New
> 
>  arch/arm/boot/dts/at91sam9rl.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/at91sam9rl.dtsi b/arch/arm/boot/dts/at91sam9rl.dtsi
> index 1da1831..fa32de9 100644
> --- a/arch/arm/boot/dts/at91sam9rl.dtsi
> +++ b/arch/arm/boot/dts/at91sam9rl.dtsi
> @@ -203,7 +203,7 @@
>  			};
>  
>  			ssc0: ssc@fffc0000 {
> -				compatible = "atmel,at91rm9200-ssc";
> +				compatible = "atmel,at91sam9rl-ssc";
>  				reg = <0xfffc0000 0x4000>;
>  				interrupts = <14 IRQ_TYPE_LEVEL_HIGH 5>;
>  				pinctrl-names = "default";
> @@ -212,7 +212,7 @@
>  			};
>  
>  			ssc1: ssc@fffc4000 {
> -				compatible = "atmel,at91rm9200-ssc";
> +				compatible = "atmel,at91sam9rl-ssc";
>  				reg = <0xfffc4000 0x4000>;
>  				interrupts = <15 IRQ_TYPE_LEVEL_HIGH 5>;
>  				pinctrl-names = "default";
> 


-- 
Nicolas Ferre
