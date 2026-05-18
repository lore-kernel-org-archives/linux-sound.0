Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8DE3F54A2;
	Mon, 18 May 2026 11:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779104152; cv=none; b=fZbSVv1vc1FDd8yOBMyX5osqZ95gi0TnDeW6q+mIg12DaLHndar62X4gETNomsVURu0R87JatkpK9NH92r35JG5iv4nTcpr0Tw2xr7cNWnwLNugZP9Skm+Y5/TmxLnds4yyRQ1A3mvUq+kbE1pzi9GhSZMzZrKhhw0JY+eWIUWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779104152; c=relaxed/simple;
	bh=DUt3eBS5gIFT83qNHuIFS6ges/Dm2qldEZJiOcVs2FY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V5vxPqs3/iD9ASlK5XWAyNAxhfg+BVkcpRYCU0zE86uIMDIMPK3q0D7bJ9+scGpifhkiQMejNDLWFc/csMMgukqaoPH2GPgs1dQ+9zGvBEIYUmtDoy/WkWo0wVFaVFvW7awRHoI3uXSL6BSEyKGNUOWviqGalKbTvH6iDtKx2WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G/5OXYgS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G/5OXYgS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5D82C2BCB7;
	Mon, 18 May 2026 11:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779104152;
	bh=DUt3eBS5gIFT83qNHuIFS6ges/Dm2qldEZJiOcVs2FY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G/5OXYgSVqrykg9/WYzqoeohCDtUEwtzN356dCwuQsg+Ym++6YF12kbDUvMTWJCIm
	 mcMwV/6yO9VgyfjM6Ci489DFJHmNx963pxbmPiQNL6auLHOcurV6VFmhI69pK+Klrg
	 jtfhOWWs5PkgeeZpPPqmkQf7SfwIc5RycEurj6BK8Su1InPXdLrkq9vZmXiQdPO1hp
	 AOrc+66uvbROu3ACPPljyKJfJkd81sjMRce7p8gunMdC6Z4+MGPUkBaQRlbSHsadEW
	 M0h2/Ez9gct2fTCXdMHoa4xrOxj5q1ASTK+53Dyq8x8qHg50p4SaNzV9q+Pis5rSt1
	 2WNJ1mhS0RCAw==
Date: Mon, 18 May 2026 12:35:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Neo Chang <YLCHANG2@nuvoton.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, robh@kernel.org,
	krzk+dt@kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
	neo.chang70@gmail.com, kchsu0@nuvoton.com, sjlin0@nuvoton.com
Subject: Re: [PATCH v2 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
Message-ID: <ce8d5ba7-22aa-47ac-90ab-026ed1ee3928@sirena.org.uk>
References: <20260518024704.118613-1-YLCHANG2@nuvoton.com>
 <20260518024704.118613-3-YLCHANG2@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pawrGPWhU6zsJTzn"
Content-Disposition: inline
In-Reply-To: <20260518024704.118613-3-YLCHANG2@nuvoton.com>
X-Cookie: She sells cshs by the cshore.


--pawrGPWhU6zsJTzn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 18, 2026 at 10:47:04AM +0800, Neo Chang wrote:

> Add support for the Nuvoton NAU83G60 audio codec. The NAU83G60 is a
> stereo 30W+30W smart amplifier with an integrated low-latency
> Advanced Audio DSP.

> ---
>  sound/soc/codecs/nau8360-dsp.c |  704 ++++++++++
>  sound/soc/codecs/nau8360-dsp.h |  117 ++
>  sound/soc/codecs/nau8360.c     | 2334 ++++++++++++++++++++++++++++++++
>  sound/soc/codecs/nau8360.h     |  904 +++++++++++++
>  4 files changed, 4059 insertions(+)

There's no update to the build system, this can't have been tested.

> --- /dev/null
> +++ b/sound/soc/codecs/nau8360-dsp.c
> @@ -0,0 +1,704 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * The NAU83G60 Stereo Class-D Amplifier with DSP and I/V-sense driver.

Please make the entire comment a C++ one so things look more
intentional.

> +static int nau8360_reply_from_dsp(struct snd_soc_component *component,
> +	const struct nau8360_cmd_info *cmd_info, int data_size,
> +	void *data, unsigned short dsp_addr)
> +{
> +	struct nau8360 *nau8360 = snd_soc_component_get_drvdata(component);
> +	struct device *dev = component->dev;
> +	unsigned int payload, *data_buf;
> +	int i, j, ret, frag_len, frag_payload_len, data_count, len_pos, pad_len,
> +		pad_len_exp;

> +	frag_payload_len = frag_len - 1;
> +	if (cmd_info->msg_param)
> +		data_count = data_size;

This is the only place where we initialise data_count.

> +	/* check the reply length same as request */
> +	if (data_count && (cmd_info->cmd_id == NAU8360_DSP_CMD_GET_KCS_RSLTS ||
> +			cmd_info->cmd_id == NAU8360_DSP_CMD_GET_KCS_SETUP)) {
> +		dev_warn(dev, "payload_len %d, expected %d",
> +			data_size - data_count, data_size);
> +	}

but we use it unconditionally here.

> +static bool nau8360_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case NAU8360_R00_SOFTWARE_RST ... NAU8360_R02_I2C_ADDR:
> +	case NAU8360_R06_INT_CLR_STATUS:
> +	case NAU8360_R21_VBAT_READOUT ... NAU8360_R22_TEMP_READOUT:
> +	case NAU8360_R41_CLK_CTL2:
> +	case NAU8360_R46_I2C_DEVICE_ID:

Are the I2C addresss and device ID volatile or do they just not have
defaults?

> +static int nau8360_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
> +	unsigned int rx_mask, int slots, int slot_width)
> +{
> +	struct snd_soc_component *cp = dai->component;
> +	struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
> +	unsigned int tx_slot_used = 0, rx_slot_used = 0;
> +	int i, func_slot;
> +
> +	if (!rx_mask)
> +		return -EINVAL;

Specifying no slots should really be accepted as disabling TDM.

> +	if (source == NAU8360_CLK_SRC_MCLK)
> +		value = NAU8360_MCLK_SEL_MCLK;
> +	else if (source == NAU8360_CLK_SRC_PLL)
> +		value = NAU8360_MCLK_SEL_PLL;
> +	else
> +		goto err;

This should be a switch statement rather than a cascade of if
statements.  Thre's a number of other examples of this.

> +	/* defalut disable Sense signal after booting */

Typo of default.

> +	/* Set HW2 default volume */
> +	regmap_write(regmap, NAU8360_R97_HW2_CTL7, 0xbf66);
> +	regmap_write(regmap, NAU8360_R98_HW2_CTL8, 0xbf66);

Most user visible controls like volumes should be left at the hardware
defaults, that avoids encoding some specific use case into the driver.

> +	/* set GPIO3 MUX as Clock output */
> +	regmap_write(regmap, NAU8360_R09_GP_CTRL1, 0x1e9e);

This feels very platform specific and should be configured via DT or
quirks.

--pawrGPWhU6zsJTzn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoK+ZIACgkQJNaLcl1U
h9DWlQf7BkoZVBAdZ7BLO/zhVK6vMFDAM0NMdLv6MmieTpo89Qng4dGDTNSSdyUd
td98ug4vWi4lkk7fSdokTxF8aFjBlnL+W9lKNNGZshlR8i6+7vOg1vdOdNZa09M4
LEj6Uw6OulIsuBnGAxqlBFmiyZ8MvRPO9g4CMNWzDZYgqtGHxD9Rlxmbx2ZTu+IB
41V5fCn6c1i5ANdVNXDyjC9wII583mqlfiP23lb9eZiszv36wWuZb12s1LBbBGqn
sVn+Q+YKUHMO6z+K3QMxpV2vIl+9qEMt3vpTZzexCm89QF9MIIvNCNcQ1/Nka/5A
bVI7UQC5IInFBrJiTBIN9GP2l7282g==
=PkKK
-----END PGP SIGNATURE-----

--pawrGPWhU6zsJTzn--
