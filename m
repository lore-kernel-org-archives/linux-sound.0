Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795189870;
	b=TwFmVsRjVYCLwwRWY2eXbPqtxgGmTnikzeZ9iolnTicULMgIhH7e0IQORW0FZKKiKf08
	 p6+alas3uL2fZaJfyjMQoo0fmCBZNWrCOGEGNnOOT2cZbytYSfergZUtDrRRdo1V0yZj1
	 LIDXgRDNigzNESnmjXRBVv+Dadqkc5R0Sv8U2om5ErENTXPbWirEbfcRvGTKs9lQoqDbh
	 Ypo2lRpZe39xak3FDnuRNtjP1D8BoKmAJaBWtJl00K2EOrrKI1uMCPjLe7/1mImFG5PdJ
	 RCnhJ2O+qJcmuQhC+11cbyAzwqB49VpNDRpIWPQcGbwUXF5Zjw1wk314aZwJZ7HU1eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795189870;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=IfG+lJs6Vtr2atuutvXLgr93FHZRLpK6+MO0TbfEonM=;
	b=ONntiSEpbobgm/+GnuH8ArRc8UwQk5yYlhwvbAsmBCeMLbZ6M0xgOX3/VR4OsJrscTkC
	 vH3gwfl2kEmSFrfb9ai5BRTG+DxJh9nfyeEg+sG3i9///6weTzeQj5sSHLUps4HebqhZk
	 s+KG8iT+VMQmIUa2lyuBk90TE1JL76V2wvoIHe1BQ2Hsm/opt41ceIsBPgzgFrRvIFetJ
	 DOxO97BjlLVzhpYYr8uS2wc926YLVXVJ60vzjbAyKP7VtfakgY30mdmCjgwkzqeepRCpj
	 JR57HDwe1k0x3S6Frram3ZM+oAdKVGRrCWor7KGI+aFImWoYq28BU8Xyd+2KTMaT+IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VH+yKrnf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348FC606A325;
	Fri, 20 Nov 2026 15:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VH+yKrnf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F5B91F000E0;
	Fri, 20 Nov 2026 15:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795189869;
	bh=IfG+lJs6Vtr2atuutvXLgr93FHZRLpK6+MO0TbfEonM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=VH+yKrnfquyhi59IlWSrIOByImLfKFrap5H32pA3H6HQXQj4qh4Fn3ikP8DqIY1nW
	 0K104HIA9Ib8xIT9l4QmZFQrLN8lsqGdz77SazITb+Vo5LNdf3BFFjXrHuiPtjReab
	 fT3VAx51+YfzlU/bjoVyiVGZZ+Erwu1WFPCt28aSTQwifgn+Ie90TGIcQOFbNP9uqp
	 QOK2TlQQwu8r+SlPxDDMmv4AgpP4dHkp/MZ9yf2yHHTd4n8iYP8yARS28xXXTf4Sf1
	 UZYhy86zKLlXXv3DjgZDdV2N9N/SH+a9TgMo58ZeAykXB87fRHZToAkn0PoDi5mMe0
	 x9AgIba/btnKg==
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
Subject: Re: [PATCH v3 2/2] ASoC: codecs: nau8310: Add support for NAU83G10
 amplifier
From: Mark Brown <broonie@kernel.org>
To: Neo Chang <YLCHANG2@nuvoton.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, 
 robh@kernel.org, krzk+dt@kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org, 
 neo.chang70@gmail.com, kchsu0@nuvoton.com, sjlin0@nuvoton.com
In-Reply-To: <20261118084214.527804-3-YLCHANG2@nuvoton.com>
References: <20261118084214.527804-1-YLCHANG2@nuvoton.com>
 <20261118084214.527804-3-YLCHANG2@nuvoton.com>
Date: Fri, 20 Nov 2026 15:51:01 +0000
Message-Id: <179518986191.6016.16828944387493140658.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1785; i=broonie@kernel.org;
 h=from:subject:message-id; bh=KOu4dfAoXSFCnNhotrAGtOBjjTCy5ruXmmCqmsoVDyg=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIZctKWK1+wWRzfdURxwlvNa8ZNux55Lp7buOr6isVRh
 /t3t64t6yhlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBE2noY/ml8/Vz/tOGY0aL6
 lt8MWwoNg5eJtmu1fFjClKt1IGv6q8WMDK8Y3Ka03bWdHmAq4S+j/2+td/Z82XNH7y53LrsfGbx
 rNj8A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> Add support for the Nuvoton NAU83G10/20 audio amplifier.
> The NAU83G10 is a mono boost Class-D audio amplifier with
> integrated DSP and I/V-sense support.

> +static int nau8310_hw_params(struct snd_pcm_substream *substream,
> +	struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *cp = dai->component;
> +	struct nau8310 *nau8310 = snd_soc_component_get_drvdata(cp);
> +	unsigned int val_len = 0;
> +	int fs, ret;
> +
> +	fs = params_rate(params);
> +	if (nau8310_dsp_active(cp) && fs != NAU8310_DEFAULT_FS) {
> +		dev_err(nau8310->dev,
> +			"For ROM Code revision 00, DSP only run at 48kHz.");
> +		return -EINVAL;
> +	}
> +	ret = nau8310_clock_config(nau8310, fs, nau8310->mclk);
> +	if (ret)
> +		return -EINVAL;

As previously noted this hosld return ret, not overwrite the value.

> +static int __maybe_unused nau8310_resume(struct snd_soc_component *cp)
> +{
> +	struct nau8310 *nau8310 = snd_soc_component_get_drvdata(cp);
> +	struct regmap *regmap = nau8310->regmap;
> +	int ret = 0;
> +
> +	regcache_cache_only(regmap, false);
> +	ret = regcache_sync(regmap);
> +	if (ret)
> +		return ret;
> +
> +	ret = nau8310_dsp_fw_load(nau8310);

This will set the clock back to the internal clock and if we had an
active stream nothing restores it so the audio will be broken.

> +static const struct regmap_config nau8310_regmap_config = {
> +	.reg_bits = NAU8310_REG_ADDR_LEN,
> +	.val_bits = NAU8310_REG_DATA_LEN,
> +
> +	.max_register = NAU8310_REG_MAX,
> +	.readable_reg = nau8310_readable_reg,
> +	.writeable_reg = nau8310_writeable_reg,
> +	.volatile_reg = nau8310_volatile_reg,

Does NAU8310_RF000_DSP_COMM not need to be marked as previous?

-- 
Mark Brown <broonie@kernel.org>
