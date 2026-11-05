Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887910;
	b=hzDaaS+zaQYK3asZJ8DWw61jF5fVUsE2134aycAw3XOgqZ9pr95c2edbdD5TFWjAoHkw
	 k2wGcB/pBA4P3/nqowP1xqHj53A1h4Mv9jXvn2lZng5zda/UXKD8OI3Axw5RNuimf+QMB
	 xva30CZ/qCNrTD8vxT5mCfjJM0C8QzpRhmzc80OJAOAFE+bFkG/zbHo8o4sn4nWnvFanY
	 Vq5+wBM6W27pz+yj/E8smaVhov7aZoSZ6/2I5yFYX6i40hHVM4lnX+t1+93WEB++PDLdo
	 BarECtk5jlKD/zTYZAIN70G2FukeDS+HTJQz7/QZU3tithRhh/tlA9QPtO1LO8TSJEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887910;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hpvgi3NoD2/IKk4HHQn8H1hmgkHE2A204Cu2jD9yF+M=;
	b=2HVmYK2d4XUSh9qBgNoV8aQ/73yGNC57u843+hAnZZ9tA9fZ5wOzdmnIMp9TvOIGa5al
	 r7PQeIPpx9L5wcGifKaN4C9EwKjnEyEGogO9QWNSxWhRa8TKo8s8ex3u3OpE3s8VKeAjp
	 viidv5ffebaaiNZ3/vkoYB66tmKMKVkN5AR1esSFS+FbPut3/9tTd6noIpuOW+g/b8aF4
	 fiD8rFxP4eyldUoLHtMjNAD9wV6zL6S+J6Du6S866hk83kK+C92SsDNIZpH812/raGS9S
	 ygefEdpGMuEv44dbVf1FIbf2H3daiz5d7C5mBE8tI0BzbCHslMtIedkDX8zEB/UIehA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aF5Tzznn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F55606A31B
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 14:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aF5Tzznn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 641A61F00919;
	Thu,  5 Nov 2026 14:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793887909;
	bh=hpvgi3NoD2/IKk4HHQn8H1hmgkHE2A204Cu2jD9yF+M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aF5Tzznnl1wZJz8R9X59anR+hQ/gjNcvzH8GpcoHL/Y0ELXw3qjmOWSoF0pMytTPU
	 ObUGvDxSOHai45tbjcLKtYNsNW68oiEWN7b2kjemwf4UMpv+ZNqe8mPcYEoOqEWGqw
	 HczsmYBJ16fBI8FvFCyAuKVTmYivQWyqpy+e4QQkTvBm9EuOKcR0NiyUNsSNQzyIwV
	 P1Qft4EMPh7TjeQwzqO8zHvEI1uYz8zla4MaU1tNi+XlrdM4zoZzRH924eKoclSoE7
	 Lh0ZYKoqhaVeJSOVB4RCkk44ncoSPUImc9Sar2x4w6vK6j+gWg+KVcY064O+IeXc9Z
	 +WRuJ+lUZXjzw==
Message-ID: <sashiko-outbox-199207@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ASoC: SDCA: Add port constraints into
 sdca_asoc_set_constraints()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charles Keepax" <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261105134952.1728147-3-ckeepax@opensource.cirrus.com>
References: <20261105134952.1728147-1-ckeepax@opensource.cirrus.com>
 <20261105134952.1728147-3-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 14:11:49 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] ASoC: SDCA: wrong array index in get_port_masks()
- [High] ASoC: SDCA: reversed GENMASK() arguments in get_port_masks()
- [High] ASoC: SDCA: u32 underflow and zeroed masks in get_port_masks()
- [High] ASoC: SDCA: use-after-free of hw_constraint_list in sdca_asoc_set_=
constraints()
- [Medium] ASoC: SDCA: zero channel mask in sdca_asoc_set_constraints() rem=
oves constraints
--

commit de604ca1528e256ed698775b3d19458c5cd6b4ab
Author: Charles Keepax <ckeepax@opensource.cirrus.com>

ASoC: SDCA: Add port constraints into sdca_asoc_set_constraints()

This commit adds SoundWire data port channel count and sample bit width
constraints into sdca_asoc_set_constraints() for both Input and Output
Terminals.

> diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
> index b801cb92cc3db..4a96ec5d11743 100644
> --- a/sound/soc/sdca/sdca_asoc.c
> +++ b/sound/soc/sdca/sdca_asoc.c

[ ... ]

> @@ -1465,9 +1467,56 @@ static int get_cluster_mask(struct device *dev, st=
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
> +		if (prop->min_word && prop->max_word) {
> +			*word_mask =3D GENMASK(prop->min_word - 1, prop->max_word - 1);
> +		} else {
> +			for (j =3D 0; j < prop->num_words; j++)
> +				*word_mask |=3D (1 << (prop->words[j] - 1));
> +		}
> +
> +		/* Only handle the number of channels for constraints. */
> +		if (prop->num_ch_combinations) {
> +			for (j =3D 0; j < prop->num_ch_combinations; j++)
> +				*ch_mask |=3D (1 << (hweight32(prop->ch_combinations[j]) - 1));
> +		} else if (prop->min_ch && prop->max_ch) {
> +			*ch_mask =3D GENMASK(prop->min_ch - 1, prop->max_ch - 1);
> +		} else {
> +			*ch_mask =3D GENMASK(0, prop->num_channels - 1);
> +		}

[Severity: High]
In get_port_masks(), after matching prop[i].num =3D=3D port, all of the
subsequent field accesses dereference prop (i.e. prop[0]) instead of
prop[i].

When a peripheral has multiple SoundWire data ports and the matched port
is at index i > 0 of sink_dpn_prop or src_dpn_prop, won't this compute
word_mask and ch_mask from the first port's properties rather than the
matched port?

[Severity: High]
Are the arguments to GENMASK() reversed in get_port_masks()?

GENMASK(h, l) takes the high bit position first and the low bit position
second:

  GENMASK(prop[i].max_word - 1, prop[i].min_word - 1)
  GENMASK(prop[i].max_ch - 1, prop[i].min_ch - 1)
  GENMASK(prop[i].num_channels - 1, 0)

With the low bit passed as h and the high bit passed as l, whenever
min_word < max_word, min_ch < max_ch, or num_channels > 1, the shift masks
have no overlapping bits and evaluate to 0.

[Severity: High]
What happens in get_port_masks() when optional data port channel or
wordlength properties are omitted?

In MIPI DisCo for SoundWire (sdw_slave_read_dpn()) and in SDCA peripheral
drivers such as wcd9378_sdca_read_prop(), data port channel properties
(num_ch_combinations, min_ch/max_ch, num_channels) and wordlength
properties (min_word/max_word, num_words) are optional.

When num_ch_combinations, min_ch/max_ch, and num_channels are all 0,
prop->num_channels - 1 underflows u32 to 0xffffffff inside GENMASK(),
causing a shift-out-of-bounds and leaving *ch_mask as 0. That zero
port_ch_mask then zeroes out cluster_ch_mask & port_ch_mask in
sdca_asoc_set_constraints().

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
> @@ -1477,51 +1526,82 @@ static int get_cluster_mask(struct device *dev, s=
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
>  	struct sdca_entity *entity =3D &function->entities[dai->id];
> -	struct snd_pcm_hw_constraint_list *constraint;
> +	struct snd_pcm_hw_constraint_list *constraints;
> +	unsigned int port_ch_mask, port_width_mask;
>  	unsigned int cluster_ch_mask;
> +	int port;
>  	int ret;
> =20
> -	static_assert(ARRAY_SIZE(channel_list) =3D=3D SDCA_MAX_CHANNEL_COUNT);
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
> =20
> -	dev_dbg(dev, "%s: set channel constraint mask: %#x\n",
> -		entity->label, cluster_ch_mask);
> +	/* FIXME: OTs should inherit cluster information */
> +	if (entity->type =3D=3D SDCA_ENTITY_TYPE_IT) {
> +		ret =3D get_cluster_mask(dev, function, entity, &cluster_ch_mask);
> +		if (ret)
> +			return ret;
> +	} else {
> +		cluster_ch_mask =3D UINT_MAX;
> +	}
> =20
> -	constraint =3D kzalloc_obj(*constraint);
> -	if (!constraint)
> +	constraints =3D kzalloc_objs(*constraints, 2);
> +	if (!constraints)
>  		return -ENOMEM;
> =20
> -	constraint->count =3D ARRAY_SIZE(channel_list);
> -	constraint->list =3D channel_list;
> -	constraint->mask =3D cluster_ch_mask;
> +	constraints[0].count =3D ARRAY_SIZE(constraint_list);
> +	constraints[0].list =3D constraint_list;
> +	constraints[0].mask =3D cluster_ch_mask & port_ch_mask;

[Severity: Medium]
If cluster_ch_mask & port_ch_mask evaluates to 0 in
sdca_asoc_set_constraints() (for example, if the cluster and port channel
masks have no common channel counts), constraints[0].mask is set to 0 and
passed to snd_pcm_hw_constraint_list().

In sound/core/pcm_lib.c, snd_interval_list() treats mask =3D=3D 0 as meanin=
g no
mask filter should be applied:

	for (k =3D 0; k < count; k++) {
		if (mask && !(mask & (1 << k)))
			continue;

Won't a zero mask cause snd_interval_list() to permit all 1..32 channels in
constraint_list rather than rejecting the empty intersection?

> +
> +	constraints[1].count =3D ARRAY_SIZE(constraint_list);
> +	constraints[1].list =3D constraint_list;
> +	constraints[1].mask =3D port_width_mask;
> +
> +	dev_dbg(dev, "%s: set constraint masks, channel: %#x, width: %#x\n",
> +		entity->label, constraints[0].mask, constraints[1].mask);
> =20
>  	ret =3D snd_pcm_hw_constraint_list(substream->runtime, 0,
>  					 SNDRV_PCM_HW_PARAM_CHANNELS,
> -					 constraint);
> +					 &constraints[0]);
>  	if (ret) {
> -		dev_err(dev, "%s: failed to add constraint: %d\n", entity->label, ret);
> -		kfree(constraint);
> +		dev_err(dev, "%s: failed to add channel constraint: %d\n",
> +			entity->label, ret);
> +		kfree(constraints);
> +		return ret;
> +	}
> +
> +	ret =3D snd_pcm_hw_constraint_list(substream->runtime, 0,
> +					 SNDRV_PCM_HW_PARAM_SAMPLE_BITS,
> +					 &constraints[1]);
> +	if (ret) {
> +		dev_err(dev, "%s: failed to add word constraint: %d\n",
> +			entity->label, ret);
> +		kfree(constraints);
>  		return ret;
>  	}

[Severity: High]
Can freeing constraints here (or in sdca_asoc_free_constraints()) leave a
dangling pointer in substream->runtime->hw_constraints.rules?

When the first snd_pcm_hw_constraint_list() call succeeds,
snd_pcm_hw_rule_add() stores &constraints[0] in rule->private inside
substream->runtime->hw_constraints.rules.

If the second snd_pcm_hw_constraint_list() call fails, kfree(constraints)
frees the array while &constraints[0] remains registered in
runtime->hw_constraints.rules. Similarly, on DPCM SoundWire setups where
dpcm_be_dai_startup() aliases be_substream->runtime =3D fe_substream->runti=
me,
if a backend startup rolls back or the backend shuts down via
dpcm_be_dai_shutdown() -> sdca_asoc_free_constraints() while the frontend
substream remains open, subsequent hw_refine or hw_params calls on the
frontend will invoke snd_pcm_hw_rule_list() and dereference the freed
constraints memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105134952.1728=
147-1-ckeepax@opensource.cirrus.com?part=3D2
