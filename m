Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230143;
	b=fMJrK0AIL9faobLGJUTaNAi1Yasoqkfun/Mf4j0ay8k/BEPNjeeCnrIGjzwIdJKPiplc
	 9QD9ckzt/PzPfoG2l0Ya2M8efr8JGT3QfBSAQX6AEfQjYYOfPN+DLBn2mSjDZrKc4vs/d
	 EDI8IYwQNVE4935z7DrFiqWNC7GgsRfrx0pQ9cfuRi3tPP0kIs+mIvK8Jrp4ij7tuNaYL
	 O0hXZCp3ArT8RE96s+lAfBRxHz5O4gU7MWk2tIzYloUSPed/gKEtZPw/+YLoxOTkKOs+d
	 weM+Y9ePjeCV3kgGSuK9XufnXFnjmjBQ0QyEP3+w9H5flsABttBzdVI8bW1mJFpbcjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230143;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=qWYxEANPerw9+vwjfiGLR3BT2n5+ClkG5uu0vCxSqc0=;
	b=zXP+O+cW93/OYo9vObojA/bM/1Q9VPJlZpYrmoJlIn77qulti2gmY3abTZ9T3ZVN8bGR
	 HoqBAlOKmLAl14YxDX964cLCFv6rgyqNRaGwv9+fGYiquL2RiHjCJ4fUSo9M8FOVw5CKu
	 ZXy5LZLEn7Ywjm+hFLYOCo6sFf9IGEwnsqD7nPo3oBxdvxe3BNiMuKo0Qz3TnKNPKyle+
	 x65cJjifK9yQbys/u9lr57JJ0oTZ09qEPnR5k41iRqxMQ1n0kWlnNXTUiEzDMzywCWDEa
	 r1gMdyb2gDHaDp+jVekAveO/XoWshqTQ2dOJ4BmdCI7jsrGHvc7aSSjj/y0cbmKbKMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jJ1wGKph;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5516606A31C;
	Mon,  9 Nov 2026 13:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jJ1wGKph
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B01571F008A1;
	Mon,  9 Nov 2026 13:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794230142;
	bh=qWYxEANPerw9+vwjfiGLR3BT2n5+ClkG5uu0vCxSqc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jJ1wGKphnG5o4B0V+76FtBaRwxwqHU/kdK+Xvn7MrRu3kfzPNlXEuyeEZEQcmRNy8
	 nMsY2nzNS3OqnnRaxm7NVD+L9BezdNrsaEzazA13AC/ZG56c8oLgRgy2DTuIfQkuLJ
	 h1Ueh9s4ei3oN7Mz8AbrN+OF+9urPjn4ATIszvVHBsF7K9PeocYWvX+C6VUV6TbWPy
	 ZDWSAlBqD2LdyX5zDijaYamFQU19wd86LN0wm9uSgbPLr9UUNi0BcetcnS/OpIz1LY
	 Q6SB72kvmr8eFkOu3GR5Qg+Df7ahzO0ohC5z9BqvjaEQmuMw2R98yH2i1g9Kll3k+H
	 xTD5AWEG6snKw==
Date: Mon, 9 Nov 2026 14:15:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Neo Chang <YLCHANG2@nuvoton.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, 
	robh@kernel.org, krzk+dt@kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, alsa-devel@alsa-project.org, neo.chang70@gmail.com, 
	kchsu0@nuvoton.com, sjlin0@nuvoton.com, lkp@intel.com
Subject: Re: [PATCH v2 2/2] ASoC: codecs: nau8310: Add support for NAU83G10
 amplifier
Message-ID: <20261109-myna-of-noble-downpour-e09d3e@quoll>
References: <20261109051251.471879-1-YLCHANG2@nuvoton.com>
 <20261109051251.471879-3-YLCHANG2@nuvoton.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261109051251.471879-3-YLCHANG2@nuvoton.com>

On Mon, Nov 09, 2026 at 01:12:51PM +0800, Neo Chang wrote:
> +static void nau8310_init_regs(struct nau8310 *nau8310)
> +{
> +	struct regmap *regmap = nau8310->regmap;
> +	unsigned int clk_det = 0, ana_ctrl = 0;
> +
> +	/* Latch IIC LSB value */
> +	regmap_write(regmap, NAU8310_R02_I2C_ADDR, 0x0001);
> +	/* Block MCLK */
> +	regmap_update_bits(regmap, NAU8310_R04_ENA_CTRL,
> +		NAU8310_MCLK_SEL_MASK, 0x7 << NAU8310_MCLK_SEL_SFT);
> +	/* stall DSP */
> +	regmap_update_bits(regmap, NAU8310_R1A_DSP_CORE_CTRL2,
> +		NAU8310_DSP_RUNSTALL, NAU8310_DSP_RUNSTALL);
> +	/* Default ADCI from slot1, ADCV from slot 0. */
> +	regmap_update_bits(regmap, NAU8310_R0C_TDM_CTRL,
> +		NAU8310_ADC_I_SEL_MASK | NAU8310_ADC_V_SEL_MASK,
> +		(0x4 << NAU8310_ADC_I_SEL_SFT) | 0x4);
> +	/* Set I-sense digital gain to +10.25dB */
> +	regmap_update_bits(regmap, NAU8310_R14_ADC_VOL_CTRL,
> +		NAU8310_ADC_GAIN_L_MASK | NAU8310_ADC_GAIN_R_MASK,
> +		(0x1 << NAU8310_ADC_GAIN_L_SFT) | 0x62);
> +	/* PGA in Class A Mode */
> +	regmap_update_bits(regmap, NAU8310_R76_BOOST,
> +		NAU8310_STG2_SEL_CLASSA, NAU8310_STG2_SEL_CLASSA);
> +	/* Set I-sense PGA Bias Current to minimum,
> +	 * Disable PGA Common Mode Lock.
> +	 */

Even netdev does not use that format of comments anymore. And this is
not netdev in the first place.

...

> +	nau8310 = devm_kzalloc(dev, sizeof(*nau8310), GFP_KERNEL);
> +	if (!nau8310)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(i2c, nau8310);
> +	mutex_init(&nau8310->lock);
> +	INIT_WORK(&nau8310->load_fw_work, nau8310_load_fw_work);
> +
> +	nau8310->regmap = devm_regmap_init(dev, NULL, i2c, &nau8310_regmap_config);
> +	if (IS_ERR(nau8310->regmap))
> +		return PTR_ERR(nau8310->regmap);
> +
> +	nau8310->dev = dev;
> +
> +	nau8310_reset_chip(nau8310->regmap);
> +	ret = regmap_read(nau8310->regmap, NAU8310_R46_I2C_DEVICE_ID, &value);
> +	if (ret) {
> +		dev_err(dev, "Failed to read NAU8310/20 device id: %d", ret);
> +		return ret;
> +	}
> +
> +	nau8310->silicon_id = value & NAU8310_REG_SI_REV_MASK;
> +	ret = nau8310_read_device_properties(nau8310);
> +	if (ret)
> +		return ret;
> +
> +	nau8310_print_device_properties(nau8310);
> +	nau8310_init_regs(nau8310);
> +
> +	return devm_snd_soc_register_component(dev, &soc_comp_dev_nau8310,
> +		&nau8310_dai, 1);
> +}
> +
> +static void nau8310_i2c_remove(struct i2c_client *client)
> +{
> +	struct nau8310 *nau8310 = i2c_get_clientdata(client);
> +
> +	cancel_work_sync(&nau8310->load_fw_work);

This looks safe, but still error-prone and discouraged. Use same order
of cleanup as order of init/allocation in probe.

See also include/linux/devm-helpers.h

> +}
> +
> +static const struct i2c_device_id nau8310_i2c_ids[] = {
> +	{ .name = "nau8310" },
> +	{ .name = "nau8320" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, nau8310_i2c_ids);
> +
> +static const struct of_device_id nau8310_of_ids[] = {
> +	{ .compatible = "nuvoton,nau8310" },
> +	{ .compatible = "nuvoton,nau8320" },

This suggests devices are compatible, but was not expressed in the
binding (and then second entry is redundant).

Best regards,
Krzysztof

