Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD2021FF33;
	Sun, 18 Jan 2026 10:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768731623; cv=none; b=f7eYapFRUrbYS3CLf1Zomx7HLFnuBRpPYwMlQOyEhqMqj45SnUUExXqbMV764SFLVS7hFoxyrDMWmlGIp3yVtoAFmIIKmRfDZI5ArKU6YEfZpp/YlV48Ez7ksW17tUhEWLJIaCEEXZSGIrD71QA7DGw2IUs/hCe6ubShtMGH9EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768731623; c=relaxed/simple;
	bh=MCyGa/BUqs4R4ryirQHJ++YmqeUQEZA1xHvjnETicMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BmeEOX11uOZk0LbnLH1zDetakB0sS8Uc3uuRBsBMNXDHJmqaH4ZDlzuFuYziQJqiqgD/6eDpAw6jJn/1kMoDj3N8F2w3pUNEoxy5ucc0BMB0ydeMcoxZs8Tv0t66dxGoWCNLd0IIpit+cpnAj42tDbzkt+81TVdy64JQlf7Rmm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ae3ei5zd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ae3ei5zd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D5E9C116D0;
	Sun, 18 Jan 2026 10:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768731623;
	bh=MCyGa/BUqs4R4ryirQHJ++YmqeUQEZA1xHvjnETicMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ae3ei5zdIw39P6bNqNxdvsMiP+MCPZPCguCBXVA8wzYYHAR4MwnRI0uemLElnFagJ
	 SGaR/TFJpMYXnqcD6rBYJGtCiPXiZFpAJbUOdfLgQaZ7kgw4rOlDVVtv+sOGTOY9K/
	 4/f74zA25kEY0h1mqB3TUKKJR5MhmGLTHvlp1VYoeHR2svDIlyzLLonbK71L7mtapC
	 l8gKdpLI55GtUc9agpaUx/+CdKTgH6npkT+BW+TWZpKvIWZb7sCHE+f4+uTPoyAsqb
	 a8ycyhVGf3A4EiPMM80AgMcE2rO3BaT7WpT92EBm26ZcqeTTKL6nNkMWggrxpxiVYS
	 DS4gp9KwWnfJw==
Date: Sun, 18 Jan 2026 11:20:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/7] ASoC: sophgo: add CV1800B I2S/TDM controller
 driver
Message-ID: <20260118-pastoral-resourceful-mandrill-47bda6@quoll>
References: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
 <20260118-cv1800b-i2s-driver-v2-2-d10055f68368@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260118-cv1800b-i2s-driver-v2-2-d10055f68368@gmail.com>

On Sun, Jan 18, 2026 at 12:18:54AM +0400, Anton D. Stavinskii wrote:
> The actual CPU DAI controller. The driver can be used with
> simple-audio-card. It respects fixed clock configuration
> from simple-audio-card. The card driver can request direction out,
> this will be interpreted as mclk out, the clock which can be used
> in other CPU or codecs. For example I2S3 generates clock for ADC.
> I2S was tested in S24_32 and S16 dual channel formats.
> 
> Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
> ---
>  sound/soc/Kconfig              |   1 +
>  sound/soc/Makefile             |   1 +
>  sound/soc/sophgo/Kconfig       |  20 ++
>  sound/soc/sophgo/Makefile      |   3 +
>  sound/soc/sophgo/cv1800b-tdm.c | 714 +++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 739 insertions(+)
> 
> diff --git a/sound/soc/Kconfig b/sound/soc/Kconfig
> index 36e0d443ba0e..edfdcbf734fe 100644
> --- a/sound/soc/Kconfig
> +++ b/sound/soc/Kconfig
> @@ -127,6 +127,7 @@ source "sound/soc/renesas/Kconfig"
>  source "sound/soc/rockchip/Kconfig"
>  source "sound/soc/samsung/Kconfig"
>  source "sound/soc/sdca/Kconfig"
> +source "sound/soc/sophgo/Kconfig"
>  source "sound/soc/spacemit/Kconfig"
>  source "sound/soc/spear/Kconfig"
>  source "sound/soc/sprd/Kconfig"
> diff --git a/sound/soc/Makefile b/sound/soc/Makefile
> index 8c0480e6484e..21d8406767fc 100644
> --- a/sound/soc/Makefile
> +++ b/sound/soc/Makefile
> @@ -70,6 +70,7 @@ obj-$(CONFIG_SND_SOC)	+= rockchip/
>  obj-$(CONFIG_SND_SOC)	+= samsung/
>  obj-$(CONFIG_SND_SOC)	+= sdca/
>  obj-$(CONFIG_SND_SOC)	+= sof/
> +obj-$(CONFIG_SND_SOC)   += sophgo/
>  obj-$(CONFIG_SND_SOC)	+= spacemit/
>  obj-$(CONFIG_SND_SOC)	+= spear/
>  obj-$(CONFIG_SND_SOC)	+= sprd/
> diff --git a/sound/soc/sophgo/Kconfig b/sound/soc/sophgo/Kconfig
> new file mode 100644
> index 000000000000..70f07d46c810
> --- /dev/null
> +++ b/sound/soc/sophgo/Kconfig
> @@ -0,0 +1,20 @@
> +menu "Sophgo"

Missing SPDX. Did you run checkpatch?

> +	depends on COMPILE_TEST || ARCH_SOPHGO
> +
> +config SND_SOC_CV1800B_TDM
> +	tristate "Sophgo CV1800B I2S/TDM support"
> +	depends on SND_SOC && OF
> +	select SND_SOC_GENERIC_DMAENGINE_PCM
> +	help
> +	  This option enables the I2S/TDM audio controller found in Sophgo
> +	  CV1800B / SG2002 SoCs. The controller supports standard I2S
> +	  audio modes for playback and capture.
> +
> +	  The driver integrates with the ASoC framework and uses the DMA
> +	  engine for audio data transfer. It is intended to be configured
> +	  via Device Tree along with simple-audio-card module.
> +
> +	  To compile the driver as a module, choose M here: the module will
> +	  be called cv1800b_tdm.
> +

...

> +static const struct snd_soc_dai_ops cv1800b_i2s_dai_ops = {
> +	.probe = cv1800b_i2s_dai_probe,
> +	.startup = cv1800b_i2s_startup,
> +	.hw_params = cv1800b_i2s_hw_params,
> +	.trigger = cv1800b_i2s_trigger,
> +	.set_fmt = cv1800b_i2s_dai_set_fmt,
> +	.set_bclk_ratio = cv1800b_i2s_dai_set_bclk_ratio,
> +	.set_sysclk = cv1800b_i2s_dai_set_sysclk,
> +};
> +
> +static struct snd_soc_dai_driver cv1800b_i2s_dai_template = {

Missing const

> +	.name = "cv1800b-i2s",
> +	.playback = {
> +		.stream_name = "Playback",
> +		.channels_min = 1,
> +		.channels_max = 2,
> +		.rates = SNDRV_PCM_RATE_8000_192000,
> +		.formats = SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S16_LE,
> +	},
> +	.capture = {
> +		.stream_name = "Capture",
> +		.channels_min = 1,
> +		.channels_max = 2,
> +		.rates = SNDRV_PCM_RATE_8000_192000,
> +		.formats = SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S16_LE,
> +	},
> +	.ops = &cv1800b_i2s_dai_ops,
> +};

....

> +static int cv1800b_i2s_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct cv1800b_i2s *i2s;
> +	struct resource *res;
> +	void __iomem *regs;
> +	struct snd_soc_dai_driver *dai;
> +	int ret;
> +
> +	i2s = devm_kzalloc(dev, sizeof(*i2s), GFP_KERNEL);
> +	if (!i2s)
> +		return -ENOMEM;
> +
> +	regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(regs))
> +		return PTR_ERR(regs);
> +	i2s->dev = &pdev->dev;
> +	i2s->base = regs;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return -ENODEV;
> +	cv1800b_setup_dma_struct(i2s, res->start);
> +
> +	i2s->clk = devm_clk_get_enabled(dev, "i2s");
> +	if (IS_ERR(i2s->clk))
> +		return dev_err_probe(dev, PTR_ERR(i2s->clk),
> +				     "failed to get+enable i2s\n");
> +	i2s->sysclk = devm_clk_get_enabled(dev, "mclk");
> +	if (IS_ERR(i2s->sysclk))
> +		return dev_err_probe(dev, PTR_ERR(i2s->sysclk),
> +				     "failed to get+enable mclk\n");
> +
> +	platform_set_drvdata(pdev, i2s);
> +	cv1800b_i2s_setup_tdm(i2s);
> +
> +	dai = devm_kmemdup(dev, &cv1800b_i2s_dai_template, sizeof(*dai),
> +			   GFP_KERNEL);
> +	if (!dai)
> +		return -ENOMEM;
> +
> +	ret = devm_snd_soc_register_component(dev, &cv1800b_i2s_component, dai,
> +					      1);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_snd_dmaengine_pcm_register(dev, &cv1800b_i2s_pcm_config, 0);
> +	if (ret) {
> +		dev_err(dev, "dmaengine_pcm_register failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	dev_dbg(dev, "cv1800b I2S probed:\n");

Drop, drivers should be silent and probe success message does not
warrant even debug. What are you debugging - that you wrote correct DTS?
You can check in sysfs that device probed.

Best regards,
Krzysztof

