Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1D65227;
	Mon, 10 Jun 2024 08:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718009193; cv=none; b=W8ylBmjDTfhbtempjysl+Q2cFnPwI2qmmUwDattVIG1cYlMAHqmTToG8GEODtnc8CDts+XnAW6UQ5W06IA6p50R7VmlN89cXDEHavPcwhTOk+74BREYN8H6IxHi7GUKb94A6zWoSt4lbdRfXfSHe5xmct9PXwW+pkhz6zeCv9L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718009193; c=relaxed/simple;
	bh=jUaITZYRtuB46b0sTgXKXcorjJOgwmE2CT9QITSdexs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=m8QTTasJVoR1onq5lOZSkopaWybEJdnoqkgqqMtUZ6iIV7tuwpkyeNjIXU/dZmEAvIy6i7kXlAhYeu35a2SmEPvOhgakW344rZ/g4AUwPOrfx5gdedOOfpCMN2+XWenthwUbqz+10Jfh3SPsj9W4oypCCIr/OJoUKhWMlbCkbT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y9f+VX3E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y9f+VX3E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9091C2BBFC;
	Mon, 10 Jun 2024 08:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718009193;
	bh=jUaITZYRtuB46b0sTgXKXcorjJOgwmE2CT9QITSdexs=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Y9f+VX3EZgRvwhxOWqNol9TWyLKhGFPGuwSWbkB7uCJ0EJ74+I+wk+Kkzxt6soWdB
	 DyyPAvRUKy8zmbPoKE+Rp8UbiF7RUCTzNDieakpYm8W+2FoyNfWzapdkQ8F10f7a36
	 jKRvb4IqllwmPf4yxqL0p3aJrDuBIMUtY1jnu+PB88C6zjgwO01hWl1CentzuUjg5v
	 PQx3BjiRjOSgSO8Jb45SBlMv+Lvj2hFuxLdJGh4r39stPtvshKeANmannk0rsk6YmD
	 cAebqKtOcUr61uj/bM0nuEEQh8OFzDqlKgyBZdHEVGfknPknMe/bli+QZ4rwP3g7b+
	 duuKs8isE9Thg==
Message-ID: <9876e617-68d1-4e1c-ba9e-2c235a57b0a9@kernel.org>
Date: Mon, 10 Jun 2024 10:46:26 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: cs530x: Support for cs530x ADCs
To: Paul Handrigan <paulha@opensource.cirrus.com>, broonie@kernel.org,
 lgirdwood@gmail.com, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20240607202708.335752-1-paulha@opensource.cirrus.com>
 <20240607202708.335752-3-paulha@opensource.cirrus.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240607202708.335752-3-paulha@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/06/2024 22:27, Paul Handrigan wrote:
> Add support for the cs530x family of high performance
> ADCs.
> 
> Signed-off-by: Paul Handrigan <paulha@opensource.cirrus.com>
> ---

>  sound/soc/codecs/Kconfig      |  14 +
>  sound/soc/codecs/Makefile     |   4 +
>  sound/soc/codecs/cs530x-i2c.c |  89 +++
>  sound/soc/codecs/cs530x.c     | 991 ++++++++++++++++++++++++++++++++++
>  sound/soc/codecs/cs530x.h     | 223 ++++++++
>  5 files changed, 1321 insertions(+)
>  create mode 100644 sound/soc/codecs/cs530x-i2c.c
>  create mode 100644 sound/soc/codecs/cs530x.c
>  create mode 100644 sound/soc/codecs/cs530x.h
> 
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index 3621781d63c4..8745ba193595 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -99,6 +99,7 @@ config SND_SOC_ALL_CODECS
>  	imply SND_SOC_CS47L90
>  	imply SND_SOC_CS47L92
>  	imply SND_SOC_CS53L30
> +	imply SND_SOC_CS530X_I2C
>  	imply SND_SOC_CX20442
>  	imply SND_SOC_CX2072X
>  	imply SND_SOC_DA7210
> @@ -998,6 +999,19 @@ config SND_SOC_CS53L30
>  	tristate "Cirrus Logic CS53L30 CODEC"
>  	depends on I2C
>  
> +config SND_SOC_CS530X
> +	tristate
> +
> +config SND_SOC_CS530X_I2C
> +	tristate "Cirrus Logic CS530x ADCs (I2C)"
> +	depends on I2C
> +	select REGMAP
> +	select REGMAP_I2C
> +	select SND_SOC_CS530X
> +	help
> +	  Enable support for Cirrus Logic CS530X ADCs
> +	  with I2C control.
> +
>  config SND_SOC_CX20442
>  	tristate
>  	depends on TTY
> diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
> index d343d23c8f0f..3e08862d10e9 100644
> --- a/sound/soc/codecs/Makefile
> +++ b/sound/soc/codecs/Makefile
> @@ -107,6 +107,8 @@ snd-soc-cs47l85-y := cs47l85.o
>  snd-soc-cs47l90-y := cs47l90.o
>  snd-soc-cs47l92-y := cs47l92.o
>  snd-soc-cs53l30-y := cs53l30.o
> +snd-soc-cs530x-y := cs530x.o
> +snd-soc-cs530x-i2c-y := cs530x-i2c.o
>  snd-soc-cx20442-y := cx20442.o
>  snd-soc-cx2072x-y := cx2072x.o
>  snd-soc-da7210-y := da7210.o
> @@ -506,6 +508,8 @@ obj-$(CONFIG_SND_SOC_CS47L85)	+= snd-soc-cs47l85.o
>  obj-$(CONFIG_SND_SOC_CS47L90)	+= snd-soc-cs47l90.o
>  obj-$(CONFIG_SND_SOC_CS47L92)	+= snd-soc-cs47l92.o
>  obj-$(CONFIG_SND_SOC_CS53L30)	+= snd-soc-cs53l30.o
> +obj-$(CONFIG_SND_SOC_CS530X)	+= snd-soc-cs530x.o
> +obj-$(CONFIG_SND_SOC_CS530X_I2C)	+= snd-soc-cs530x-i2c.o
>  obj-$(CONFIG_SND_SOC_CX20442)	+= snd-soc-cx20442.o
>  obj-$(CONFIG_SND_SOC_CX2072X)	+= snd-soc-cx2072x.o
>  obj-$(CONFIG_SND_SOC_DA7210)	+= snd-soc-da7210.o
> diff --git a/sound/soc/codecs/cs530x-i2c.c b/sound/soc/codecs/cs530x-i2c.c
> new file mode 100644
> index 000000000000..b2f808ee6f37
> --- /dev/null
> +++ b/sound/soc/codecs/cs530x-i2c.c
> @@ -0,0 +1,89 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// CS530x CODEC driver
> +//
> +// Copyright (C) 2024 Cirrus Logic, Inc. and
> +//                    Cirrus Logic International Semiconductor Ltd.
> +
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/i2c.h>
> +#include <linux/regmap.h>
> +
> +#include "cs530x.h"
> +
> +static const struct of_device_id cs530x_of_match[] = {
> +	{
> +		.compatible = "cirrus,cs5302",
> +		.data = (void *)CS5302,
> +	}, {
> +		.compatible = "cirrus,cs5304",
> +		.data = (void *)CS5304,
> +	}, {
> +		.compatible = "cirrus,cs5308",
> +		.data = (void *)CS5308,
> +	},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, cs530x_of_match);
> +
> +static const struct i2c_device_id cs530x_i2c_id[] = {
> +	{ "cs5302", CS5302 },
> +	{ "cs5304", CS5304 },
> +	{ "cs5308", CS5308 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, cs530x_i2c_id);
> +
> +static int cs530x_i2c_probe(struct i2c_client *client)
> +{
> +	struct cs530x_priv *cs530x;
> +	int ret;
> +
> +	cs530x = devm_kzalloc(&client->dev, sizeof(struct cs530x_priv),

sizeof(*)

I think you try to upstream some older code... please always use some
new kernel drivers, which are cleaned up from trivialities, for new work.

> +			       GFP_KERNEL);
> +	if (!cs530x)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(client, cs530x);
> +
> +	cs530x->regmap = devm_regmap_init_i2c(client, &cs530x_regmap);
> +	if (IS_ERR(cs530x->regmap)) {
> +		ret = PTR_ERR(cs530x->regmap);
> +		dev_err(&client->dev, "Failed to allocate register map: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	if (client->dev.of_node) {
> +		const struct of_device_id *match;
> +
> +		match = of_match_node(cs530x_of_match, client->dev.of_node);
> +		if (match == NULL)
> +			return -EINVAL;
> +		cs530x->devtype = (enum cs530x_type)match->data;

I think you open-coded device_get_match_data


> +	} else {
> +		const struct i2c_device_id *id =
> +			i2c_match_id(cs530x_i2c_id, client);
> +
> +		cs530x->devtype = id->driver_data;
> +	}

and for all of this there is a helper i2c_get_device_match_data.

> +
> +	cs530x->dev = &client->dev;
> +
> +	return cs530x_probe(cs530x);
> +}
> +
> +static struct i2c_driver cs530x_i2c_driver = {
> +	.driver = {
> +		.name = "cs530x",
> +		.of_match_table = cs530x_of_match,
> +	},
> +	.probe = cs530x_i2c_probe,
> +	.id_table = cs530x_i2c_id,
> +};
> +module_i2c_driver(cs530x_i2c_driver);
> +


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
> +	if (ret != 0) {
> +		dev_err(dev, "Failed to request supplies: %d\n", ret);

return dev_err_probe()

> +		return ret;
> +	}
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(cs530x->supplies),
> +				    cs530x->supplies);
> +	if (ret != 0) {
> +		dev_err(dev, "Failed to enable supplies: %d\n", ret);

return dev_err_probe()

> +		return ret;
> +	}
> +
> +	cs530x->reset_gpio = devm_gpiod_get_optional(dev, "reset-gpios",
> +						      GPIOD_OUT_LOW);
> +	if (IS_ERR(cs530x->reset_gpio)) {
> +		dev_err(dev, "Reset gpio not available\n");

return dev_err_probe()

> +		ret = PTR_ERR(cs530x->reset_gpio);
> +		goto err_regulator;
> +	}
> +
> +	if (cs530x->reset_gpio) {
> +		usleep_range(2000, 2100);
> +		gpiod_set_value_cansleep(cs530x->reset_gpio, 1);

1 is to keep device in reset? This looks like you are using logical
values inverted.

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
> +			dev_err(dev, "Soft Reset write failed %d\n", ret);
> +			goto err_reset;
> +		}
> +	}
> +
> +	ret = cs530x_parse_device_properties(cs530x);
> +	if (ret)
> +		goto err_reset;
> +
> +	cs530x->dev_dai = devm_kmemdup(dev, &cs530x_dai,
> +					sizeof(struct snd_soc_dai_driver),

sizeof(*)

> +					GFP_KERNEL);
> +	if (!cs530x->dev_dai) {
> +		ret = -ENOMEM;
> +		goto err_reset;
> +	}
> +



Best regards,
Krzysztof

