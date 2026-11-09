Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794241013;
	b=MwyDJlRjcSKDA9u70yxNGNje1KpzGZAdznxfmQD4hJPKdzToqjpu+z/ejcfpTGlllzZg
	 /BD/xyp0OtNO9+R1GUexnjTRZfmHT9TGOC8WRx9tvQ4jMacoaOonXxoAOFiyfGrWMXFBR
	 VBgPxVc9jH3akkEtUeyeknue81f2uswTg6Tb88VaT28GiZ6DoztNt52xQbfnBjD7gDl7h
	 YXDU8y8ixZHgJpThVlXbcXiHkPL1UxufP76XLQ86ME2P2583KG/WzL73qRKYBbNzkSCLp
	 4wi+Lnu9Jrnia60UqZLGSguof7bcRbQoHKzRIt5v0CGz6CrfV3Q4Rw4yft1zX+JLVCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794241013;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=uHo0+zBBHxLM3uT17WRrVtSqLnC4prXrZEdymzD/UsE=;
	b=suiey7Os2xynQ8/xyksj2kAP+f9BADFuaKPJBcUm/whTogPzajlGfKIbPpmEXkmR5AJM
	 eaO+8/GXcsRKRE0HKbTkQCmx5egsUKXBQLEqWaerFpOnXuRamijAV7gWx8Tdn5vJuYz6R
	 Ghd+j12LpvawEtd/1mWWDEYSPhQRScJND46bM1/XKTbvQt54p/wIHKP16JDc5a7bVyTJn
	 tBIWzfWlmrhzso1L7RphLZ/IPgx5GMLAKlpWPlxd8nCWYLocJ4Sa1hoUN3Q3Jbdpibyjl
	 64GjqiNQjb/XKEzbqlB9PQml9f6q3BvRMIKKSP+nSMwQHp7SVVqzrz7NWQeGFfjRjOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TlSWoKtB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20ECA606A325
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 16:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TlSWoKtB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D302C1F008A1;
	Mon,  9 Nov 2026 16:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794241013;
	bh=uHo0+zBBHxLM3uT17WRrVtSqLnC4prXrZEdymzD/UsE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TlSWoKtBeWbdVCgMOvV0L00eZLicxWnk81qKEpYOAGX/5FAnNSmlBeNvUXRDohEuP
	 /1a+HXdIPxEPswA8uE/nzzIgY9uXCYcbTnLli1tqmBYS0KWHd6y7fu/9O43qVyUf48
	 I6ekfceOZJMAJDLNhwc0mrXwUoU6b2/O8lyk2HVe+qVIcq1ZuAlz9aycc57KoDN017
	 Lvxvz7Yoj7WXFqDT+KUZ9n8EiJFYr4nYkAzipjECBCeMQr71Bs8ghWSsJqNsGFgMFI
	 5ytFO7a7yHcdTrHBi5yOtRvmVlEkilBFw1Ec6O0D/nBnzqOr9Z6Po+LK7fg5H5oh5i
	 SWyLLqQi5xdyQ==
Message-ID: <sashiko-outbox-205218@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] ASoC: SDCA: Add port constraints into
 sdca_asoc_set_constraints()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charles Keepax" <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261109155106.3727597-4-ckeepax@opensource.cirrus.com>
References: <20261109155106.3727597-1-ckeepax@opensource.cirrus.com>
 <20261109155106.3727597-4-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 16:16:52 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] ASoC: SDCA: zero word_mask in get_port_masks() when wordlengths
  are unset
- [Medium] ASoC: SDCA: 1-channel port_ch_mask in get_port_masks() when
  min_ch/max_ch are 0
--

commit 8d09b518756cef71f9c60a48b6568b96a8c9556b
Author: Charles Keepax <ckeepax@opensource.cirrus.com>

ASoC: SDCA: Add port constraints into sdca_asoc_set_constraints()

This commit updates sdca_asoc_set_constraints() to apply channel count and
sample format constraints derived from the SoundWire data port properties.

> diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
> index be1b4c0075796..ccbb2c4b10267 100644
> --- a/sound/soc/sdca/sdca_asoc.c
> +++ b/sound/soc/sdca/sdca_asoc.c

[ ... ]

> @@ -1507,9 +1510,86 @@ static int get_cluster_mask(struct device *dev, st=
ruct sdca_function_data *funct
>  	return 0;
>  }
> =20
> +static u64 get_word_mask(unsigned int width)
> +{
> +	switch (width) {
> +	case 8:
> +		return SNDRV_PCM_FMTBIT_S8 | SNDRV_PCM_FMTBIT_U8;
> +	case 16:
> +		return SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S16_BE |
> +		       SNDRV_PCM_FMTBIT_U16_LE | SNDRV_PCM_FMTBIT_U16_BE;
> +	case 18:
> +		return SNDRV_PCM_FMTBIT_S18_3LE | SNDRV_PCM_FMTBIT_U18_3LE |
> +		       SNDRV_PCM_FMTBIT_S18_3BE | SNDRV_PCM_FMTBIT_U18_3BE;
> +	case 20:
> +		return SNDRV_PCM_FMTBIT_S20_LE | SNDRV_PCM_FMTBIT_U20_LE |
> +		       SNDRV_PCM_FMTBIT_S20_BE | SNDRV_PCM_FMTBIT_U20_BE |
> +		       SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_U20_3LE |
> +		       SNDRV_PCM_FMTBIT_S20_3BE | SNDRV_PCM_FMTBIT_U20_3BE;
> +	case 24:
> +		return SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_BE |
> +		       SNDRV_PCM_FMTBIT_U24_LE | SNDRV_PCM_FMTBIT_U24_BE |
> +		       SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_U24_3LE |
> +		       SNDRV_PCM_FMTBIT_S24_3BE | SNDRV_PCM_FMTBIT_U24_3BE;
> +	case 32:
> +		return SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_S32_BE |
> +		       SNDRV_PCM_FMTBIT_U32_LE | SNDRV_PCM_FMTBIT_U32_BE;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int get_port_masks(struct sdw_slave *sdw, unsigned int port,
> +			  struct snd_pcm_substream *substream,
> +			  u64 *word_mask, unsigned int *ch_mask)
> +{
> +	struct sdw_dpn_prop *prop;
> +	unsigned int nprop;
> +	int i, j;
> +
> +	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
> +		prop =3D sdw->prop.sink_dpn_prop;
> +		nprop =3D hweight32(sdw->prop.sink_ports);
> +	} else {
> +		prop =3D sdw->prop.src_dpn_prop;
> +		nprop =3D hweight32(sdw->prop.source_ports);
> +	}
> +
> +	*word_mask =3D 0;
> +	*ch_mask =3D 0;
> +
> +	for (i =3D 0; i < nprop; i++) {
> +		if (prop[i].num !=3D port)
> +			continue;
> +
> +		if (prop[i].num_words) {
> +			for (j =3D 0; j < prop[i].num_words; j++)
> +				*word_mask |=3D get_word_mask(prop[i].words[j]);
> +		} else {
> +			for (j =3D prop[i].min_word; j <=3D prop[i].max_word; j++)
> +				*word_mask |=3D get_word_mask(j);
> +		}

[Severity: High]
Does get_port_masks() leave *word_mask as 0 when a port does not specify
wordlength properties?

The MIPI DisCo wordlength properties are optional, and drivers such as
wcd9378_sdca_read_prop() leave num_words, min_word, and max_word as 0.
When all three are 0, the else loop runs once with j =3D 0, get_word_mask(0)
returns 0, and sdca_asoc_set_constraints() fails PCM startup with -EINVAL
because constraints->width is 0.

> +
> +		/* Only handle the number of channels for constraints. */
> +		if (prop[i].num_ch_combinations) {
> +			for (j =3D 0; j < prop[i].num_ch_combinations; j++)
> +				*ch_mask |=3D BIT(hweight32(prop[i].ch_combinations[j]) - 1);
> +		} else if (prop[i].num_channels) {
> +			*ch_mask =3D GENMASK(prop[i].num_channels - 1, 0);
> +		} else {
> +			*ch_mask =3D GENMASK(prop[i].max_ch - prop[i].min_ch, 0);
> +		}

[Severity: Medium]
As reported by Mark Brown on v2 [1], does this restrict *ch_mask to a
single channel (GENMASK(0, 0) =3D=3D 0x1) when the optional channel propert=
ies
(num_ch_combinations, num_channels, max_ch, and min_ch) are all 0?  That
constrains the DAI to 1 channel instead of leaving the port channel count
unconstrained, and causes sdca_asoc_set_constraints() to fail with -EINVAL
if the terminal cluster only supports multi-channel configurations.

[1] https://lore.kernel.org/r/179413707633.3630016.13654136728294242171.b4-=
review@b4

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109155106.3727=
597-1-ckeepax@opensource.cirrus.com?part=3D3
