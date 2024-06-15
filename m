Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835D8208D1;
	Sat, 15 Jun 2024 09:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718445455; cv=none; b=Ppca5W4cpns29j0p6+M0RckPNwiZ3xKVKcUpLx4YUxUCZdR7u3S4/DplByHQv5m7o6YSGh5sboVLk7oGIs2yFD+bILHmO4iE+l8bS/8sHY25HfZ3K3uVVV4BtKTlMbVLF4c5sPTtdBiUtYcUSTmGvkJPUquIgO8fLBRsIyPyI3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718445455; c=relaxed/simple;
	bh=Gg/Pg0vjTC/47Ny5PHTFP3WRjdLZwNReerVnJ7B+/sg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PoU76+hrhDmEpuXTY76G9YjaFh6Yt8FW9agSWnrmLEbNCfpSplOUg0mDzD5X2gFrB1M7/9xJq4EZPYnoU+Tcr6MbpX0qXKZEBSGvFwyWp+N9WD2CVKeBnoKyNXQ0DaMvDKxYrWvCo11EFIKMX59fkDB4Y3yrgzbcV39hrZJzz+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r/iM8RuT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r/iM8RuT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F797C116B1;
	Sat, 15 Jun 2024 09:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718445455;
	bh=Gg/Pg0vjTC/47Ny5PHTFP3WRjdLZwNReerVnJ7B+/sg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=r/iM8RuTD+LL0eI9N+qEPH4QjqqEToUlNaBV2sxldCEFR4CPYhbtWMJO4XotB1CmL
	 Ooq8BSBSCZO0gjbfV6iiqY3OHi5zDCoF6V8axTIKyuzjHWlsUekQqO6Y0FWPFzM8Fi
	 eOZ0K4ya2ld3hGwK1WEmQFrOIb/l0vLi+in4q5MsfsJE2F8MT3H59w9LgtqV4zwrxf
	 CubR885YMlfZNkaLbNMspVcnObQ8DBpurNJXErVm1vy+TnNE0Xa8FMIe9eQHQYsm3e
	 GODbGlsks3nZZ9j2Z+PM7qOCEiZOWEYooSx3LRbBYVKhqJB3fdBKUMUD+pXyJ4XUHm
	 BQhrmJMhCMnYA==
Message-ID: <34e37ddb-c39a-447b-b92b-32d4de96624f@kernel.org>
Date: Sat, 15 Jun 2024 11:57:30 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ASoC: cs530x: Support for cs530x ADCs
To: Paul Handrigan <paulha@opensource.cirrus.com>, broonie@kernel.org,
 lgirdwood@gmail.com, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20240614183632.861575-1-paulha@opensource.cirrus.com>
 <20240614183632.861575-2-paulha@opensource.cirrus.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240614183632.861575-2-paulha@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/06/2024 20:36, Paul Handrigan wrote:
> Add support for the cs530x family of high performance
> ADCs.
> 
> Signed-off-by: Paul Handrigan <paulha@opensource.cirrus.com>

...

> +
> +	dev_dbg(dev, "Device ID 0x%x\n", dev_id);
> +
> +	ret = regmap_read(cs530x->regmap, CS530X_REVID, &rev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Can't read REV ID\n");
> +
> +	switch (dev_id) {
> +	case CS530X_2CH_ADC_DEV_ID:
> +		cs530x->num_adcs = 2;
> +		break;
> +	case CS530X_4CH_ADC_DEV_ID:
> +		cs530x->num_adcs = 4;
> +		break;
> +	case CS530X_8CH_ADC_DEV_ID:
> +		cs530x->num_adcs = 8;
> +		break;
> +	default:
> +		return dev_err_probe(dev, -EINVAL, "Invalid device ID 0x%x\n",
> +				     dev_id);
> +	}
> +
> +	dev_info(dev, "CS5308 %d Channel Audio ADC Rev 0x%x\n",
> +		 cs530x->num_adcs, rev & 0xff);

dev_dbg or just drop. You already have dev_dbg with rev before.

> +
> +	return 0;
> +}
> +
> +static int cs530x_parse_device_properties(struct cs530x_priv *cs530x)
> +{
> +	struct regmap *regmap = cs530x->regmap;
> +	struct device *dev = cs530x->dev;
> +	unsigned int val = 0;
> +
> +	switch (cs530x->num_adcs) {
> +	case 8:
> +		if (device_property_read_bool(dev, "cirrus,in-hiz-pin78"))
> +			val = CS530X_IN78_HIZ;
> +
> +		if (device_property_read_bool(dev, "cirrus,in-hiz-pin56"))
> +			val |= CS530X_IN56_HIZ;
> +
> +		fallthrough;
> +	case 4:
> +		if (device_property_read_bool(dev, "cirrus,in-hiz-pin34"))
> +			val |= CS530X_IN34_HIZ;
> +
> +		fallthrough;
> +	case 2:
> +		if (device_property_read_bool(dev, "cirrus,in-hiz-pin12"))
> +			val |= CS530X_IN12_HIZ;
> +
> +		return regmap_set_bits(regmap, CS530X_IN_HIZ, val);
> +	default:
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Invalid number of adcs %d\n",
> +				     cs530x->num_adcs);
> +	}
> +}
> +
> +int cs530x_probe(struct cs530x_priv *cs530x)
> +{
> +	struct device *dev = cs530x->dev;
> +	int ret, i;
> +
> +	for (i = 0; i < ARRAY_SIZE(cs530x->supplies); i++)
> +		cs530x->supplies[i].supply = cs530x_supply_names[i];
> +
> +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(cs530x->supplies),
> +				      cs530x->supplies);
> +	if (ret != 0)
> +		return dev_err_probe(dev, ret, "Failed to request supplies");
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(cs530x->supplies),
> +				    cs530x->supplies);
> +	if (ret != 0)
> +		return dev_err_probe(dev, ret, "Failed to enable supplies");
> +
> +	cs530x->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> +						      GPIOD_OUT_HIGH);
> +	if (IS_ERR(cs530x->reset_gpio)) {
> +		ret = PTR_ERR(cs530x->reset_gpio);
> +		dev_err_probe(dev, ret, "Reset gpio not available\n");

My previous comments about syntax being return dev_err_probe() should
lead you to understand how dev_err_probe works.

ret = dev_err_probe()


> +		goto err_regulator;
> +	}
> +
> +	if (cs530x->reset_gpio) {
> +		usleep_range(2000, 2100);
> +		gpiod_set_value_cansleep(cs530x->reset_gpio, 0);
> +	}
> +
> +	usleep_range(5000, 5100);
> +	ret = cs530x_check_device_id(cs530x);
> +	if (ret)
> +		goto err_reset;
> +
> +	if (!cs530x->reset_gpio) {
> +		ret = regmap_write(cs530x->regmap, CS530X_SW_RESET,
> +				   CS530X_SW_RST_VAL);
> +		if (ret) {
> +			dev_err_probe(dev, ret, "Soft Reset Failed\n");
> +			goto err_reset;
> +		}
> +	}
> +
> +	ret = cs530x_parse_device_properties(cs530x);
> +	if (ret)
> +		goto err_reset;
> +
> +	cs530x->dev_dai = devm_kmemdup(dev, &cs530x_dai,
> +					sizeof(*(cs530x->dev_dai)),
> +					GFP_KERNEL);
> +	if (!cs530x->dev_dai) {
> +		ret = -ENOMEM;
> +		goto err_reset;
> +	}

Allocations are usually placed at beginning of probe(). This simplifies
error paths.

> +
> +	cs530x->dev_dai->capture.channels_max = cs530x->num_adcs;
> +
> +	ret = devm_snd_soc_register_component(dev,
> +			&soc_component_dev_cs530x, cs530x->dev_dai, 1);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Can't register cs530x component\n");
> +		goto err_reset;
> +	}
> +
> +	return 0;
> +
> +err_reset:
> +	gpiod_set_value_cansleep(cs530x->reset_gpio, 1);
> +
> +err_regulator:
> +	regulator_bulk_disable(ARRAY_SIZE(cs530x->supplies),
> +			       cs530x->supplies);
> +
> +	return ret;
> +}

Best regards,
Krzysztof

