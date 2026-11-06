Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978836;
	b=5I6qQp0sACEYVJRGrKrFj91XuSQNpPO0CjCFWgUdqstvUTBPt6F3mRrTQ9g1JfdWc2h0
	 uUGox+jvgwTudlj7Yia6L44oeV21jT2gNmpK5OJwFJbdJMkhAa7GpRTh7Wr8zpGOxbiSz
	 XQOM3ihBIM3aS0oODxWL9Ob07W/a+Z6bbPXmN7CQi0IPuF8sK5me1ZKc9MUEmrdBuMbiU
	 EbqwxYLz2irXj3NJgxhmsKSG4hQ7lQmOSafmTRnukNYujMqWSnYgH5oq0aO8dIcRCguG0
	 60TQiiORO1s4I/KOSGb/aLZoZk/koLiGgkFoU2S8iKbaPElTdIQ/Yhx6BO9s9ORJDeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978836;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gPwBVYz89e923nD6SI1LhdrvlgpQMPCZG5Bq9mDVy2A=;
	b=Y7Ix6h6PiJHYCxB/P6fxR0+NmCKrWKH9nk6my8nRU6WbaIYwTveCy9m164wfi8YtI/Bd
	 MHVijj52JoNRokNORCKwuTomSe6ZUbDyoXSDU2sZjCm13o1rllGz0FHANDa9HK63ZmRSW
	 qIlwgYzvgNZmTC3dFOpdNtvn/lrbOrEpczSzCIOBPUTana8uvJSVDuhi7fa2FdlA+2BFW
	 /xBjTh9pGcHH2QQkgpYbIFwwLXKQdOykXV/r08BwtXF2cdeqzSQjIO4RSYW35bIVwGEpZ
	 jgIfdrKy9lujM6ifuwAJelVkKDvNzb+Gbjzou+tcalKCpZlkTFDViojeYxOdL4kBwMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xan8XAmz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D016D606A335
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 15:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xan8XAmz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FE441F0089F;
	Fri,  6 Nov 2026 15:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793978835;
	bh=gPwBVYz89e923nD6SI1LhdrvlgpQMPCZG5Bq9mDVy2A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xan8XAmzFvQ95Im1B66T2dih+2xkZDtOqKVm5wyFo9bght7uHCnhkP/pJeCpIZ9xB
	 AoUzzIR0Aw0JRrTqXInk8atFs2ClFEVb8bwTgeWTnXVb5+nsHNqWDG3dhmRLPJH9hJ
	 LMnSaUvWF6xGD2gXz88m/3PwqGvmMP1Q2UXaM5pBcJBimnFaiNQcPOuMye5Zwfjp1q
	 8gqqDEgjd7jALSN6PPX25//LBFHenOkZDkwslYrZXT8EsImKMbnGlxn4swe2STJi2f
	 yAIVmCCkJwxyTdTx9k2Y39hHZo3y3ee+Rvf9tEHd48JxgzswFOK7HLtnu1I7q6+2P5
	 Z7qxDhyfc/wOg==
Message-ID: <sashiko-outbox-201692@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] ASoC: SDCA: Add port constraints into
 sdca_asoc_set_constraints()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charles Keepax" <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261106150926.2587108-4-ckeepax@opensource.cirrus.com>
References: <20261106150926.2587108-1-ckeepax@opensource.cirrus.com>
 <20261106150926.2587108-4-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 15:27:14 +0000
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
- [High] ASoC: SDCA: broken S20_LE/S24_LE constraints in
  sdca_asoc_set_constraints()
- [Medium] ASoC: SDCA: zero constraint mask in
  sdca_asoc_set_constraints() allows 1..32
--

commit e8a6811f3760215afcfb8349d2e9a9440e3e0064
Author: Charles Keepax <ckeepax@opensource.cirrus.com>

ASoC: SDCA: Add port constraints into sdca_asoc_set_constraints()

This commit adds SoundWire port channel and word-length constraints to
sdca_asoc_set_constraints() for both Input and Output Terminals.

> diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
> index be1b4c0075796..d1b40c6ccae2b 100644
> --- a/sound/soc/sdca/sdca_asoc.c
> +++ b/sound/soc/sdca/sdca_asoc.c
[ ... ]
> @@ -1507,9 +1510,57 @@ static int get_cluster_mask(struct device *dev, st=
ruct sdca_function_data *funct
>  	return 0;
>  }
> =20
> +static int get_port_masks(struct sdw_slave *sdw, unsigned int port,
> +			  struct snd_pcm_substream *substream,
> +			  unsigned int *word_mask, unsigned int *ch_mask)
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
> +				*word_mask |=3D BIT(prop[i].words[j] - 1);
> +		} else {
> +			*word_mask =3D GENMASK(MIN(31, prop[i].max_word - 1),
> +					     MAX(1, prop[i].min_word) - 1);
> +		}
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
> +
> +		return 0;
> +	}
> +
> +	return -ENODEV;
> +}
> +
>  /**
>   * sdca_asoc_set_constraints - constrain channels available on a DAI
>   * @dev: Pointer to the device, used for error messages.
> + * @sdw: Pointer to the SoundWire peripheral device.
>   * @regmap: Pointer to the Function register map.
>   * @function: Pointer to the Function information.
>   * @substream: Pointer to the PCM substream.
> @@ -1519,42 +1570,73 @@ static int get_cluster_mask(struct device *dev, s=
truct sdca_function_data *funct
>   *
>   * Return: Returns zero on success, and a negative error code on failure.
>   */
> -int sdca_asoc_set_constraints(struct device *dev, struct regmap *regmap,
> +int sdca_asoc_set_constraints(struct device *dev, struct sdw_slave *sdw,
> +			      struct regmap *regmap,
>  			      struct sdca_function_data *function,
>  			      struct snd_pcm_substream *substream,
>  			      struct snd_soc_dai *dai)
>  {
> -	static const unsigned int channel_list[] =3D {
> +	static const unsigned int constraint_list[] =3D {
>  		 1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15, 16,
>  		17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32,
>  	};
>  	struct sdca_asoc_constraints *constraints =3D snd_soc_dai_to_priv(dai);
>  	struct sdca_entity *entity =3D &function->entities[dai->id];
> +	unsigned int port_ch_mask, port_width_mask;
>  	unsigned int cluster_ch_mask;
> +	int port;
>  	int ret;
> =20
> -	static_assert(ARRAY_SIZE(channel_list) =3D=3D SDCA_MAX_CHANNEL_COUNT);
> +	static_assert(ARRAY_SIZE(constraint_list) <=3D sizeof(port_width_mask) =
* BITS_PER_BYTE);
> +	static_assert(ARRAY_SIZE(constraint_list) =3D=3D SDCA_MAX_CHANNEL_COUNT=
);
>  	static_assert(sizeof(cluster_ch_mask) * BITS_PER_BYTE >=3D SDCA_MAX_CHA=
NNEL_COUNT);
> =20
> -	if (entity->type !=3D SDCA_ENTITY_TYPE_IT)
> -		return 0;
> +	/* FIXME: Currently only a single unshared port is supported */
> +	port =3D sdca_asoc_get_port(dev, regmap, function, dai);
> +	if (port < 0)
> +		return port;
> =20
> -	ret =3D get_cluster_mask(dev, function, entity, &cluster_ch_mask);
> -	if (ret)
> +	ret =3D get_port_masks(sdw, port, substream, &port_width_mask, &port_ch=
_mask);
> +	if (ret < 0) {
> +		dev_err(dev, "%s: no properties for port %d\n", entity->label, port);
>  		return ret;
> +	}
> +
> +	/* FIXME: OTs should inherit cluster information */
> +	if (entity->type =3D=3D SDCA_ENTITY_TYPE_IT) {
> +		ret =3D get_cluster_mask(dev, function, entity, &cluster_ch_mask);
> +		if (ret)
> +			return ret;
> +	} else {
> +		cluster_ch_mask =3D UINT_MAX;
> +	}
> +
> +	constraints->channels.count =3D ARRAY_SIZE(constraint_list);
> +	constraints->channels.list =3D constraint_list;
> +	constraints->channels.mask =3D cluster_ch_mask & port_ch_mask;
> =20
> -	dev_dbg(dev, "%s: set channel constraint mask: %#x\n",
> -		entity->label, cluster_ch_mask);
> +	constraints->width.count =3D ARRAY_SIZE(constraint_list);
> +	constraints->width.list =3D constraint_list;
> +	constraints->width.mask =3D port_width_mask;

[Severity: Medium]
What happens if cluster_ch_mask & port_ch_mask (or port_width_mask) is 0?

In snd_interval_list(), a mask of 0 means no bitmask filter is applied, so
passing a zero mask to snd_pcm_hw_constraint_list() allows all values
1..32 in constraint_list instead of rejecting the empty set.  For example,
in sound/soc/codecs/wcd9378-sdca.c, entity IT 131 uses Cluster 3
(num_channels =3D 3, cluster_ch_mask =3D 0x4) while its port DP7 (sink[1] in
wcd9378_sdca_read_prop()) has min_ch =3D 1 and max_ch =3D 1 (port_ch_mask =
=3D
0x1), resulting in constraints->channels.mask =3D=3D 0 and leaving channels
1..32 unconstrained during PCM refinement.

> =20
> -	constraints->channels.count =3D ARRAY_SIZE(channel_list);
> -	constraints->channels.list =3D channel_list;
> -	constraints->channels.mask =3D cluster_ch_mask;
> +	dev_dbg(dev, "%s: set constraint masks, channel: %#x, width: %#x\n",
> +		entity->label, constraints->channels.mask, constraints->width.mask);
> =20
>  	ret =3D snd_pcm_hw_constraint_list(substream->runtime, 0,
>  					 SNDRV_PCM_HW_PARAM_CHANNELS,
>  					 &constraints->channels);
>  	if (ret) {
> -		dev_err(dev, "%s: failed to add constraint: %d\n", entity->label, ret);
> +		dev_err(dev, "%s: failed to add channel constraint: %d\n",
> +			entity->label, ret);
> +		return ret;
> +	}
> +
> +	ret =3D snd_pcm_hw_constraint_list(substream->runtime, 0,
> +					 SNDRV_PCM_HW_PARAM_SAMPLE_BITS,
> +					 &constraints->width);

[Severity: High]
Does constraining SNDRV_PCM_HW_PARAM_SAMPLE_BITS with port_width_mask
break SNDRV_PCM_FORMAT_S20_LE and SNDRV_PCM_FORMAT_S24_LE?

In sound/core/pcm_native.c, snd_pcm_hw_rule_format() and
snd_pcm_hw_rule_sample_bits() relate SNDRV_PCM_HW_PARAM_FORMAT and
SNDRV_PCM_HW_PARAM_SAMPLE_BITS using snd_pcm_format_physical_width(),
which is 32 bits for both S20_LE and S24_LE (the formats populated by
width_find_mask()).  However, get_port_masks() builds port_width_mask from
SoundWire port word lengths, which represent the sample width (e.g. 16,
20, 24).

When a SoundWire port supports up to 24-bit words (for example max_word =3D
24 or words =3D { 16, 24 }), bit 31 (32 bits) is not set in port_width_mask,
so constraining SNDRV_PCM_HW_PARAM_SAMPLE_BITS eliminates S20_LE and
S24_LE.  Conversely, if a port supports 16-bit and 32-bit words but not
20-bit or 24-bit words, allowing 32 in SNDRV_PCM_HW_PARAM_SAMPLE_BITS
still permits S20_LE and S24_LE.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106150926.2587=
108-1-ckeepax@opensource.cirrus.com?part=3D3
