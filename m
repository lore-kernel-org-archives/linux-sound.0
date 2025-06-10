Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8AF280005
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 08:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749545258; cv=none; b=hGoT+Q8hwGzCWJ4TpqISxdeB50pbxTUrjJA+6eFQwj0Q7M8Spu7Mvu1c69OCRDjIlvegTbPP+dkmU8nbD0AmHYObOpwgW4W1Cs3znv4jOS6nrGDyljAoyBpltRHP1lT10DUnQwHsMYSCbG0ydvWPjbF6hpf8kE0h4JzB9sXXfOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749545258; c=relaxed/simple;
	bh=h+EjzyGpGZIDAP1YmGNCl74MszXcbI1MNdNelMjxDH4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=EY2GzuhWYS3i+eKo8hE0MmuYeIg1gB0Ri7yr0giepDEOOUZi52oJRHnokwWnc6Frd3QH9sqIKo9QMfDsJxp4WdlSe6MQrsji1tVhJFLjGwJBDHHIyCQvfJiMmFacC4Op7Hq2dE4ukfiajaYZrgUTlMssI5b+bz/1lQ54jkhZH90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VUHzK06y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VUHzK06y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 730AFC4CEF0;
	Tue, 10 Jun 2025 08:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749545258;
	bh=h+EjzyGpGZIDAP1YmGNCl74MszXcbI1MNdNelMjxDH4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VUHzK06yP3488FPi3CSfVpOGMJdDzAYFHrXN/j5Wdm2FxDJE3C4OlCbHz31Z0CbB1
	 CYSn5M1OK9+XXpvfLcN9JhlU4+169oMnDFxcRs/QuPpeLk6Xkgyt5w6pTWIuXLhWoq
	 q0/rUkTATicUWJRN0++cyq3gtfjWca1hp3BTzCJ09p3R+Tg0dYT9HqmjGwwQkge2DW
	 B7WBSx7B+z44uXCZNQs4Wd6LGrYr84Wcr+lPA+XgpkU+vpEIuKfDQsXfy3LNkKCJ+l
	 5sxmcxi3eof53s85Y8pXKbzMX3I9ibtde+mFA0koP37cRF5QCMQBaBOK1IZchbon1e
	 p8a/6GKUCqgsw==
Date: Tue, 10 Jun 2025 17:47:29 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 =?UTF-8?B?Ik1hcnRpbiBQb3ZpxaFlciI=?= <povik+lin@cutebit.org>, Claudiu
 Beznea <claudiu.beznea@tuxon.dev>, Andrei Simion
 <andrei.simion@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Cezary Rojewski
 <cezary.rojewski@intel.com>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>, Paul Cercueil <paul@crapouillou.net>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Heiko
 Stuebner <heiko@sntech.de>, Daniel Baluta <daniel.baluta@nxp.com>, Orson
 Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan
 Hunter <jonathanh@nvidia.com>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, Michal Simek <michal.simek@amd.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Yu-Chun Lin <eleanor15x@gmail.com>, Vijendar
 Mukunda <Vijendar.Mukunda@amd.com>, Nikita Shubin
 <nikita.shubin@maquefel.me>, Arnd Bergmann <arnd@arndb.de>, Alexander
 Sverdlin <alexander.sverdlin@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Piotr Wojtaszczyk
 <piotr.wojtaszczyk@timesys.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>, Binbin Zhou
 <zhoubinbin@loongson.cn>, Keguang Zhang <keguang.zhang@gmail.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, =?UTF-8?B?Ik7DrWNvbGFzIEYuIFIu?=
 =?UTF-8?B?IEEuIFByYWRvIg==?= <nfraprado@collabora.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Sameer Pujar
 <spujar@nvidia.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 35/37] ASoC: uniphier: Standardize ASoC menu
Message-Id: <20250610174729.629bea01de950f6b8289c2e9@kernel.org>
In-Reply-To: <87wm9k5inw.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
	<87wm9k5inw.wl-kuninori.morimoto.gx@renesas.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Jun 2025 04:23:32 +0000
Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Current Kconfig menu at [ALSA for SoC audio support] has no rules.
> So, some venders are using menu style, some venders are listed each drivers
> on top page, etc. It is difficult to find target vender and/or drivers
> because it is very random.
> 
> Let's standardize ASoC menu
> 

Looks good to me.

Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Thanks,

> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/uniphier/Kconfig | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/sound/soc/uniphier/Kconfig b/sound/soc/uniphier/Kconfig
> index ddfa6424c656b..45140d49c6adf 100644
> --- a/sound/soc/uniphier/Kconfig
> +++ b/sound/soc/uniphier/Kconfig
> @@ -1,18 +1,11 @@
>  # SPDX-License-Identifier: GPL-2.0
> -config SND_SOC_UNIPHIER
> -	tristate "ASoC support for UniPhier"
> +menu "ASoC support for UniPhier"
>  	depends on (ARCH_UNIPHIER || COMPILE_TEST)
> -	help
> -	  Say Y or M if you want to add support for the Socionext
> -	  UniPhier SoC audio interfaces. You will also need to select the
> -	  audio interfaces to support below.
> -	  If unsure select "N".
>  
>  config SND_SOC_UNIPHIER_AIO
>  	tristate "UniPhier AIO DAI Driver"
>  	select REGMAP_MMIO
>  	select SND_SOC_COMPRESS
> -	depends on SND_SOC_UNIPHIER
>  	help
>  	  This adds ASoC driver support for Socionext UniPhier
>  	  'AIO' Audio Input/Output subsystem.
> @@ -21,7 +14,6 @@ config SND_SOC_UNIPHIER_AIO
>  
>  config SND_SOC_UNIPHIER_LD11
>  	tristate "UniPhier LD11/LD20 Device Driver"
> -	depends on SND_SOC_UNIPHIER
>  	select SND_SOC_UNIPHIER_AIO
>  	help
>  	  This adds ASoC driver for Socionext UniPhier LD11/LD20
> @@ -31,7 +23,6 @@ config SND_SOC_UNIPHIER_LD11
>  
>  config SND_SOC_UNIPHIER_PXS2
>  	tristate "UniPhier PXs2 Device Driver"
> -	depends on SND_SOC_UNIPHIER
>  	select SND_SOC_UNIPHIER_AIO
>  	help
>  	  This adds ASoC driver for Socionext UniPhier PXs2
> @@ -41,10 +32,11 @@ config SND_SOC_UNIPHIER_PXS2
>  
>  config SND_SOC_UNIPHIER_EVEA_CODEC
>  	tristate "UniPhier SoC internal audio codec"
> -	depends on SND_SOC_UNIPHIER
>  	select REGMAP_MMIO
>  	help
>  	  This adds Codec driver for Socionext UniPhier LD11/20 SoC
>  	  internal DAC. This driver supports Line In / Out and HeadPhone.
>  	  Select Y if you use such device.
>  	  If unsure select "N".
> +
> +endmenu
> -- 
> 2.43.0
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
