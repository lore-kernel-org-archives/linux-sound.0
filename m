Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793417554;
	b=uSYF5S7hpIX3y21y9giLv9JMjDWGudSl5BGRo6SKHQq1+dNXpP04PmVmwVpqSXlrK/FG
	 ryhUJYQf8F9B6KVfQVi/49H0cPNGnO0W55vdDFH/IG36r1uUBYD+SwMXcRow3V5XirfoD
	 7fx9b4keJrqkpR9UQVB5xnWJkYJzeb9GFDkrD/57zFduMqPx2wx4OTjRGBdlJOUEM8McR
	 Q32rBurqmbxa/4iIyjgQerdxnliC6WRtReFc4/f07Alqu8eTfK7zPXidQtqT9HIDbr/vK
	 XYuqS+W73mPW+jz9f6gES09zznD0iiJH8XCT09xUKJZDauqUqS0XmAMRgVUj3A+ptIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793417554;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=grSlhxo5vb7hmI2dPwy2Wg8ZgLv4BED9lRzxRHhDW7o=;
	b=R0h2uV3fLErhnZ9Q1INl5KDI0wxw2YAgqKEBoLmrFrOXSM78gCYrFo9+CXIriR5HYitS
	 JCNbSN9SKXMhshsZPNfpHijpUQiBullfojr4Cf5N4D0M+HgTxmJ5yBoA4aMIgAqVAnLxL
	 zKNICgpQvf5GxsFcc727E0eCXk40v8N++PgKA3x4lWGMv1MC481YmLYDo/y8ixLkbB64v
	 pjzhmklFyi26k/Vt9tUG0l0Ghz3hMAkNDd5Hfk9Np4PbbSCtB413XPb7W5XOAergLsC9v
	 MuZD7EM0NHeVw8gnVWt9lU2Od8oB9sIrqr+ZYmMi+mP1KkWUA7f6Dzu3sexTf8IG8jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L1mNZwag;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A277C606A31A
	for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 03:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L1mNZwag
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1331B1F000C1;
	Sat, 31 Oct 2026 03:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793417553;
	bh=grSlhxo5vb7hmI2dPwy2Wg8ZgLv4BED9lRzxRHhDW7o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L1mNZwagS/cAQyG4S1K/jRZCICc0IidWS3vgsuJAcrYd/c474GGfuQhmpKTzCgBXV
	 k/hHxw03rhFWdbLwxSZyNGy3DeXnZWvUNJqtgETY24XP26A+Vu2Jy7UPRrMiasRvbe
	 tUGB2h2Cp6l38Vj96P4lWG07mXr0RZZ0wfQSi26tVbkuk1RKqOYmGI/4vv5s2tsaAu
	 0C6kg+vUTNgrHQEs7UrYsDEWaj1EaBhyWySn87W74Izk0azoR/+qC2cstzVvagafyn
	 YvTEKs8C1SNZ0mjxySCvF0uaAj6mmStqGoiIN+rlluQLUTMg8P/uZEdQCGUrOAw3ul
	 4T21KFP3KSiXg==
Message-ID: <sashiko-outbox-191721@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: tas2770: Fix VISENSE at sample rates greater than
 48 kHz
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261031-tas2770-sdout-clkedge-v1-1-5266daf35f4c@gmail.com>
References: <20261031-tas2770-sdout-clkedge-v1-1-5266daf35f4c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 03:32:32 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] ASoC: tas2770: unconditional rising TX edge breaks normal BCLK pol=
arity
- [Medium] ASoC: tas2770: unchecked return value in tas2770_set_ivsense_tra=
nsmit()
--

commit 6b703c44a093b9fd723fa53ac56f8e6abdbe52c2
Author: James Calligeros <jcalligeros99@gmail.com>

ASoC: tas2770: Fix VISENSE at sample rates greater than 48 kHz

This commit configures TAS2770_TDM_CFG_REG4 in tas2770_set_ivsense_transmit=
()
to transmit VISENSE data on the rising edge of the I2S clock to avoid data
corruption at sample rates above 48 kHz.

> diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
> index 882e198576978..41e4fcf09c25f 100644
> --- a/sound/soc/codecs/tas2770.c
> +++ b/sound/soc/codecs/tas2770.c
> @@ -222,6 +222,15 @@ static int tas2770_set_ivsense_transmit(struct tas27=
70_priv *tas2770,
>  	struct snd_soc_component *component =3D tas2770->component;
>  	int ret;
> =20
> +	/*
> +	 * At sample rates >48 kHz, transmitting VISENSE on the same clock
> +	 * edge as receiving seems to cause artefacts in the VISENSE data.
> +	 * Send on the rising edge of the clock instead.
> +	 */
> +	ret =3D snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
> +					    TAS2770_TDM_CFG_REG4_TX_EDGE_FALLING,
> +					    TAS2770_TDM_CFG_REG4_TX_EDGE_RISING);

[Severity: High]
Won't unconditionally forcing the SDOUT transmit edge to rising in
tas2770_set_ivsense_transmit() cause a regression on systems using normal B=
CLK
polarity (SND_SOC_DAIFMT_NB_NF or SND_SOC_DAIFMT_NB_IF), where both RX and =
TX
will now operate on the rising clock edge?

On reset, TAS2770_TDM_CFG_REG1 defaults to 0x02 (bit 0 =3D 0,
TAS2770_TDM_CFG_REG1_RX_RSING) and TAS2770_TDM_CFG_REG4 defaults to
transmitting on the falling edge (TAS2770_TDM_CFG_REG4_TX_EDGE_FALLING).

In sound/soc/codecs/tas2770.c, tas2770_set_fmt() updates the RX capture edge
in TAS2770_TDM_CFG_REG1 based on SND_SOC_DAIFMT_INV_MASK, but leaves
TAS2770_TDM_CFG_REG4 untouched:

	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
	case SND_SOC_DAIFMT_NB_IF:
		invert_fpol =3D 1;
		fallthrough;
	case SND_SOC_DAIFMT_NB_NF:
		asi_cfg_1 |=3D TAS2770_TDM_CFG_REG1_RX_RSING;
		break;
	case SND_SOC_DAIFMT_IB_IF:
		invert_fpol =3D 1;
		fallthrough;
	case SND_SOC_DAIFMT_IB_NF:
		asi_cfg_1 |=3D TAS2770_TDM_CFG_REG1_RX_FALING;
		break;

When inverted BCLK (IB_NF or IB_IF) is configured, tas2770_set_fmt() switch=
es
RX to the falling edge while TX remains at its reset default of falling edg=
e.
When normal BCLK (NB_NF or NB_IF) is configured, RX is set to the rising ed=
ge,
so hardcoding TAS2770_TDM_CFG_REG4_TX_EDGE_RISING in
tas2770_set_ivsense_transmit() puts both RX and TX on the rising edge.

Should TAS2770_TDM_CFG_REG4 instead be configured in tas2770_set_fmt()
opposite to the RX edge (falling for NB_NF/NB_IF and rising for IB_NF/IB_IF=
),
matching how tas2764_set_fmt() in sound/soc/codecs/tas2764.c handles
TAS2764_TDM_CFG1 and TAS2764_TDM_CFG4?

> +
>  	ret =3D snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG5,
>  					    TAS2770_TDM_CFG_REG5_VSNS_MASK |
>  					    TAS2770_TDM_CFG_REG5_50_MASK,

[Severity: Medium]
In tas2770_set_ivsense_transmit(), ret is assigned from the
snd_soc_component_update_bits() call for TAS2770_TDM_CFG_REG4 and then
immediately overwritten by the TAS2770_TDM_CFG_REG5 update without checking
for an error.

Should this check if (ret < 0) return ret; before updating
TAS2770_TDM_CFG_REG5 so that I2C/regmap failures during
tas2770_codec_probe() -> tas2770_set_ivsense_transmit() are not ignored?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261031-tas2770-sd=
out-clkedge-v1-1-5266daf35f4c@gmail.com?part=3D1
