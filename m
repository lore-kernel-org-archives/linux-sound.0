Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101725;
	b=w+RO/TFt3U4/XqU0N75w+XRZofhmeRdgfkQSCbFFYsF1ZBCUMWiWFs586WejvXf22aE0
	 +J7nvcqEFwV/HeeN0v0zY+ZED7V/HJEjgdRGH/Vmrdof7IDHwbf3U/Ad7om5TvnFi2suI
	 8NF0F2gFDa0qeF3vLADDjEGD/oqlW4Cp+oRL41ZyPlAKen+29EpzVhK3GHJbcHXm1wO67
	 0Ccdng6Wb26zGgBrDqV7HbRtkiJQVydO4U6fpHdwx56sLK/uWZgzRqPrXQSTN9D8dBLB4
	 BCBDRd547tjiQ3LyYlr5E3fLJEGqwCd3x1ZaCpa2uDLNxGIGUF+mnv+U1ArwhyVQWaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101725;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XaamGF/GGz4XDjuYrUNOhO8jQRgUu6oLfrS4HDnhreY=;
	b=m3dsWFbjAoMzwJ9l+NTzKrZrHJ2gfuHPS7lcg2Avui4CPtjiC81ieNmrDxe8VtsIg4HP
	 zXxoucZ2eRLZNYm4aPDSRYB2aU98HRVEFbLxV5ekOFccmCYlN+NntpwqkIbVXb2rD2U4j
	 dyMskCBUwu05rWy1HLhmShYzxI+cb+lF7CHR8RdpjE4QfcJnXPY5u9yNIq/l5SmjXbgkQ
	 xLtMTbiNtKJcIZcByP4RW1T4t3V1Q+g/FjHiJ0tICsebelJemvNVUz87rBNPa7crPubkc
	 +ACEpouKRpBTWKGXf9/AOKP9rZSKpJTuz3htLShZEcTK0N0ss2MnbWblMErebppFxkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YqziiYPR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F2E606A333;
	Tue, 27 Oct 2026 11:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YqziiYPR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0FBD1F031E2;
	Tue, 27 Oct 2026 11:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793101724;
	bh=XaamGF/GGz4XDjuYrUNOhO8jQRgUu6oLfrS4HDnhreY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YqziiYPR+1XB7xs0I/bOe5KQ+TJuuoTuqREVEQY9pzjEnrFLUBOa6Mju8GBQGasg5
	 wbybQaFOxQGA0qi3ppU15cAb+Gm0XURqd/16Oh0SBEnTgN4F+XcU+0RwKG6fEH1F8C
	 jxwKqwOwmKdgENaISRBxuSL2zNK7qeBUHIIo1h98SDj2vQXM67bM6el2+Teh5oioZi
	 by+kWo3rD/9UP3E72UnRxoeiDewk093eqTmJZI1pl7PRYhTkmaSxrX66oEFPz0Z95m
	 ltP0P0jM4dPmMI03+y80OtgY8GAF+XhSJOmXffx7eBBCiMpyP12Pzf2B69oCIdMLgw
	 S+x/9X7q7KX8A==
Message-ID: <sashiko-outbox-186477@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] ASoC: codecs: Add support for Fortemedia FM34NE
 DSP
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261027113929.65102-3-clamor95@gmail.com>
References: <20261027113929.65102-1-clamor95@gmail.com>
 <20261027113929.65102-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 11:48:44 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] ASoC: fm34ne-dsp: mixing guard() and goto cleanup in fm34ne_dsp_set=
_config()
--

commit 49a97b167b8daf22a65a613318793960938a84f4
Author: Svyatoslav Ryhel <clamor95@gmail.com>

ASoC: codecs: Add support for Fortemedia FM34NE DSP

This commit adds an ASoC codec driver for the Fortemedia FM34NE digital sou=
nd
processing chip used for active noise suppression on ASUS Transformer
devices.

> diff --git a/sound/soc/codecs/fm34ne-dsp.c b/sound/soc/codecs/fm34ne-dsp.c
> new file mode 100644
> index 0000000000000..07f22507a53df
> --- /dev/null
> +++ b/sound/soc/codecs/fm34ne-dsp.c
> @@ -0,0 +1,386 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/property.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <sound/core.h>
> +#include <sound/soc.h>
> +
> +#include "fm34ne-dsp.h"
> +
> +struct fm34ne_dsp {
> +	struct i2c_client *client;
> +
> +	struct gpio_desc *bypass_gpio;
> +	struct gpio_desc *reset_gpio;
> +
> +	struct clk *dap_mclk;
> +	struct regulator *vdd_supply;
> +	struct mutex lock; /* prevent simultaneous parameter writing */
> +
> +	const struct fm34ne_dsp_info *info;
> +};
> +
> +static int fm34ne_dsp_set_config(struct fm34ne_dsp *dsp, enum dsp_state =
state)
> +{
> +	struct device *dev =3D &dsp->client->dev;
> +	int ret;
> +
> +	guard(mutex)(&dsp->lock);
> +
> +	gpiod_set_value_cansleep(dsp->bypass_gpio, 1);
> +	msleep(20);
> +
> +	switch (state) {
> +	case FM34NE_NS_ENABLE:
> +		ret =3D i2c_master_send(dsp->client, dsp->info->enable_parameter,
> +				      dsp->info->enable_parameter_length);
> +		if (ret < 0) {
> +			dev_err(dev, "Failed to set DSP enable %d\n", ret);
> +			goto exit;
> +		}
> +
> +		ret =3D i2c_master_send(dsp->client, dsp->info->enable_noise_suppressi=
on,
> +				      dsp->info->enable_ns_length);
> +		if (ret < 0) {
> +			dev_err(dev, "Failed to enable DSP noise suppression %d\n", ret);
> +			goto exit;
> +		}
> +
> +		break;
> +
> +	case FM34NE_NS_DISABLE:
> +		ret =3D i2c_master_send(dsp->client, dsp->info->enable_parameter,
> +				      dsp->info->enable_parameter_length);
> +		if (ret < 0) {
> +			dev_err(dev, "Failed to set DSP enable with %d\n", ret);
> +			goto exit;
> +		}
> +
> +		ret =3D i2c_master_send(dsp->client, dsp->info->disable_noise_suppress=
ion,
> +				      dsp->info->disable_ns_length);
> +		if (ret < 0) {
> +			dev_err(dev, "Failed to disable DSP noise suppression with %d\n", ret=
);
> +			goto exit;
> +		}
> +
> +		break;
> +
> +	case FM34NE_BYPASS:
> +	default:
> +		ret =3D i2c_master_send(dsp->client, bypass_parameter, sizeof(bypass_p=
arameter));
> +		if (ret < 0) {
> +			dev_err(dev, "Failed to set DSP bypass with %d\n", ret);
> +			goto exit;
> +		}
> +
> +		break;
> +	}
> +
> +exit:
> +	gpiod_set_value_cansleep(dsp->bypass_gpio, 0);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}

[Severity: Low]
In fm34ne_dsp_set_config(), dsp->lock is acquired via guard(mutex)(&dsp->lo=
ck)
while i2c_master_send() failure paths jump to the exit label using goto exit
to deassert dsp->bypass_gpio.

The cleanup rules in include/linux/cleanup.h state that goto-based cleanup
and scope-based cleanup helpers like guard() should not be mixed in the same
function:

 * Lastly, given that the benefit of cleanup helpers is removal of
 * "goto", and that the "goto" statement can jump between scopes, the
 * expectation is that usage of "goto" and cleanup helpers is never
 * mixed in the same function. I.e. for a given routine, convert all
 * resources that need a "goto" cleanup to scope-based cleanup, or
 * convert none of them.

Also, sound/soc/codecs/fm34ne-dsp.c uses guard(mutex) and struct mutex
without explicitly including linux/cleanup.h and linux/mutex.h.

Could fm34ne_dsp_set_config() avoid mixing guard(mutex) with goto exit
(for example by using break from the switch statement or a helper function
for the I2C transfers), and include linux/cleanup.h and linux/mutex.h
explicitly?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027113929.6510=
2-1-clamor95@gmail.com?part=3D2
