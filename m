Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253714;
	b=KAfC7dkD3mp3zLHsOkUti5yfSusPPA+P2cnGPCgnO6+cq3uppHNHdobucWF6l7BTXiyM
	 oLj1ZwQt3RBcVrh01RYGQiaFRfYU5mBVSmIyW1FS/zoPHhExxua3Na217ohvi8/lScGpp
	 aWmZ+a5u9aXRHty0vBVdqVdj7wkJfvvoeOF3QMVVp9AjXvOicJSVXEFYfEpEhFg8wHEK8
	 fE//X/iTd6H+3Jazv0HGFl007ixK5tEJZI1r+Julzk5hKVppXUIRnqUyO9waWLJG45Stt
	 z1WvUZS+obaSnH86uaAmpnaXf2Cc8X8P+VCW2jRTaMh9P03qwHt4quO1IxoQrvP42xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253714;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=A8LWwHch8iz5/b23akV80ol5/MMcIgwIVUMrnGv0GxY=;
	b=zdK4mUhmD7SkWl95WEWRM0umAuOd2pf2BeHzUusKLwbL+4T4+vr+NDOY++/LfEQUnBkI
	 +bJjOZ49dVratAWwmi9Mo/4f628N4EO923CZA3hnisTMcYLr/InopB7FxA19Tb5dm371q
	 IlCFKblLNYB1VDU4DlLtJVOpeTuRVFOb9CzrMXKZprINBQv40abBzuRPVotN6qGcmHp06
	 0M28NhdAsEqhVc31nUknf48YxIWrRDD4q0mLjmRhUGp82hHhm6IH4dkFQKYU1T1EH8uw5
	 0CBbYxFepqiFPJyNGzFv0nV4dzmz9JPXYWqJAHDSfpb9EdZVfGNW9Ae7XHjo+Od8+DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fR1wh0z6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14264606A321;
	Mon,  9 Nov 2026 19:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fR1wh0z6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D91B1F008A1;
	Mon,  9 Nov 2026 19:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794253713;
	bh=A8LWwHch8iz5/b23akV80ol5/MMcIgwIVUMrnGv0GxY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=fR1wh0z6oiy/Ntnm9M7hG50ecB143XgeGf/Na/f8N0PyYpFB0al9UwvfSezSP2TEk
	 KPE9fmMvumfvBTdjDsAkLpH6EbYJXFDg8pcbBNEPyITno6RN2YRLxgSu74ZqZpw+7u
	 GNRooOuWuZggkLDubkwXOldRt4kWJrxD4aDhMCYwDkzZkzNrPRLqKIeKe/G6k+ygnG
	 DqMs5DkJQ13wnqLPhOCmk/mRxSkIwQxH/priITQRL1dSAvZXz9GHe23bAyh5gf5Eun
	 yvhe81A4XQjbYismOTwKaR38kiiZAUi1KiknkdTrrChDwRfG7aqs4hWM+udD5A0CCz
	 5gcbjoxKXIhsA==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 626432FC6C89;
	Mon, 09 Nov 2026 19:48:20 +0000 (GMT)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 2/2] ASoC: codecs: nau8310: Add support for NAU83G10
 amplifier
From: Mark Brown <broonie@kernel.org>
To: Neo Chang <YLCHANG2@nuvoton.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, 
 robh@kernel.org, krzk+dt@kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org, 
 neo.chang70@gmail.com, kchsu0@nuvoton.com, sjlin0@nuvoton.com, 
 lkp@intel.com
In-Reply-To: <20261109051251.471879-3-YLCHANG2@nuvoton.com>
References: <20261109051251.471879-1-YLCHANG2@nuvoton.com>
 <20261109051251.471879-3-YLCHANG2@nuvoton.com>
Date: Mon, 09 Nov 2026 19:48:19 +0000
Message-Id: <179425369963.3711751.8538085283431158098.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2580; i=broonie@kernel.org;
 h=from:subject:message-id; bh=uz0EEhKFqb2Rh6VAYejYUKzktncm0H9HpNXhrqxvcSA=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+Kbfs7VjTVXgy6tOdgrJNTtdrphdO8NIPnn60+PH8X
 4auij+sO0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRVZ8Y/kfEO3N4Oz5pX2yt
 EHrXcsH7V0HSxSq3Jmyf//pZdywH50mGf0aPBX93brz0f66CW9whhtPGfzg2L/JZsupI0PYVtQ8
 SyvgA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> Add support for the Nuvoton NAU83G10 audio amplifier.
> The NAU83G10 is a mono boost Class-D audio amplifier with
> integrated DSP and I/V-sense support.

> +config SND_SOC_NAU8310
> +	tristate "Nuvoton Technology Corporation NAU83G10 Mono Boosted Amplifier"

This handles NAU83G20 as well.

> +static int nau8310_dsp_idle(struct snd_soc_component *cp)
> +{
> +	struct nau8310 *nau8310 = snd_soc_component_get_drvdata(cp);
> +	struct regmap *regmap = nau8310->regmap;
> +	unsigned int idle_pattern, timeout = NAU8310_DSP_IDLE_RETRY * USEC_PER_MSEC;
> +	int ret = 0;
> +
> +	ret = regmap_read_poll_timeout(regmap,
> +		NAU8310_RF000_DSP_COMM, idle_pattern,
> +		idle_pattern == NAU8310_DSP_COMM_IDLE_WORD, USEC_PER_MSEC, timeout);
> +	if (ret) {
> +		dev_err(nau8310->dev, "Timeout waiting for DSP idle state: %d", ret);
> +		nau8310_sw_reset_chip(regmap);

If you need to reset the chip you should probably also resync the cache,
and there's some redundancy here with nau8310_software_reset().

> +int nau8310_dsp_init(struct snd_soc_component *cp)
> +{
> +	struct regmap *regmap = cp->regmap;
> +
> +	nau8310_sw_reset_chip(regmap);
> +
> +	/* wait for the power ready */
> +	msleep(120);
> +
> +	regmap_update_bits(regmap, NAU8310_R1A_DSP_CORE_CTRL2,
> +		NAU8310_DSP_RUNSTALL | NAU8310_DAC_SEL_DSP_OUT, NAU8310_DAC_SEL_DSP_OUT);

NAU8310_DAC_SEL_DSP_OUT is used by DAPM, you might want to solve this
the way nau8360 does.

> +static int nau8310_biq_coeff_put(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
> +	struct snd_soc_component *cp = snd_soc_dapm_to_component(dapm);

This is the same issue as was fixed in nau8310_clkdet_put() in this
version.

> +	/* Boost Control Target Value Limit. 0.16 V per step. */
> +	SOC_SINGLE("Boost Target Limit", NAU8310_R17_BOOST_CTRL1,
> +		NAU8310_BSTLIMIT_SFT, NAU8310_BSTLIMIT_MAX, 0),

The binding describes nuvoton,boost-target-limit/-margin as having
0.19V steps - either that or the comment here is wrong.

> +	ret = nau8310_clock_config(nau8310, fs, nau8310->mclk);
> +	if (ret)
> +		return -EINVAL;

Just return ret in case it's more descriptive.

> +static struct i2c_driver nau8310_i2c_driver = {
> +	.driver = {
> +		.name = "nau8310",
> +		.of_match_table = of_match_ptr(nau8310_of_ids),
> +		.acpi_match_table = ACPI_PTR(nau8310_acpi_match),

We don't need the wrappers for these pointers these days.

-- 
Mark Brown <broonie@kernel.org>
