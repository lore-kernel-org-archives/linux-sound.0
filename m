Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3238C39526F;
	Tue, 24 Mar 2026 19:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774379362; cv=none; b=WBWbjuLXyhZ7gBOJKOHKOL7RVoY032e4YgGqo54qrad0EdLA5vZ/MlIhpaJ9kOpwoP055MrE+JBhvjnynF2tRRl5EAFU3WR9M74JzXoG1zGsxhCtSP8SlFdpiKdfEt7dXtKw0AC2tF3avoghH9Vxleu5SVJhY6VvrX0bifDHfPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774379362; c=relaxed/simple;
	bh=ZCDhYx5R6V88uDInHJ7z9Wb/NONMpwVazpJIW63916c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mV7ezlqJkGQQUR+uSBG/i+94PilGwlIqmNQ9XDisjJT3ZMwmTuvysx+ULY4gfGzm6h+8hUv8isXWVlK1DeA6acDiiXJV7EfxdL4TmnUv5jVKDCYS2QAsMT/6BAhh4bn1oU4KOlCz1hZ26Wb8/nkFYMMrQG7ESUHFJBDKxEQx/KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UjVqBpRL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UjVqBpRL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77742C19424;
	Tue, 24 Mar 2026 19:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774379361;
	bh=ZCDhYx5R6V88uDInHJ7z9Wb/NONMpwVazpJIW63916c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UjVqBpRLRKyhJXkkzI85SA+hfyav9lxwy1RATkDwPRaaDXhScCubizISfIgxyVREQ
	 Tqsr99adlSSIlqX/OFhhuo8wHp24PetiJDnfiC01B26fsKlWFXZ2eUPM3QZ/frt5iN
	 K0Vq9vtwwBXqgs4kI9usiNuMXlXxkk37DN1I/akPnmKujSRDdkxr3gvY9FEukzc9gl
	 udgFdu+fcqEUvYGrYyw77xrLtjQUYeCCJI/Vvu9/Pkj6OQtXJOYfGG8Rl33Thi/u45
	 5t3yS4Kpv3dirEOCDcQ0n+CKFMC1VI8xCqC7qGWmtLPSTk3+/CKEviD6hNcu963w0f
	 QmBaenIgsK2YA==
Date: Tue, 24 Mar 2026 19:09:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	johan@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	srini@kernel.org, val@packett.cool, mailingradian@gmail.com
Subject: Re: [PATCH v7 13/13] ASoC: qcom: q6apm: Add support for early buffer
 mapping on DSP
Message-ID: <9a9ea82d-e299-4a9c-bb68-f430761387f7@sirena.org.uk>
References: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260323223845.2126142-14-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="E9ofXc3HHLzq/+og"
Content-Disposition: inline
In-Reply-To: <20260323223845.2126142-14-srinivas.kandagatla@oss.qualcomm.com>
X-Cookie: Forest fires cause Smokey Bears.


--E9ofXc3HHLzq/+og
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 10:38:45PM +0000, Srinivas Kandagatla wrote:
> Buffers are allocated on pcm_new and mapped in the dsp on every
> prepare call, which is inefficient and unnecessary.
>=20
> Add new functions q6apm_[un]map_memory_fixed_region to map it on
> to dsp only once after allocation.

>  static int q6apm_dai_pcm_new(struct snd_soc_component *component, struct=
 snd_soc_pcm_runtime *rtd)

> +       if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream) {
> +               substream =3D pcm->streams[SNDRV_PCM_STREAM_CAPTURE].subs=
tream;
> +               ret =3D q6apm_dai_memory_map(component, substream, graph_=
id);
> +               if (ret) {
> +                       if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].subst=
ream)
> +                               q6apm_unmap_memory_fixed_region(component=
->dev, graph_id);

This looks like it's handling bidirectional DAIs but...

> +int q6apm_map_memory_fixed_region(struct device *dev, unsigned int graph=
_id, phys_addr_t phys,
> +				  size_t sz)
> +{

> +	info =3D idr_find(&apm->graph_info_idr, graph_id);
> +	if (!info)
> +		return -ENODEV;
> +
> +	if (info->mem_map_handle)
> +		return 0;

=2E..we have one memory map handle per graph ID, silently ignoring
attempts to add a second one?

--E9ofXc3HHLzq/+og
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnC4VoACgkQJNaLcl1U
h9DKegf8C6a4lxkNh2amiCHIFHpH+Bc6c85Sk+i1t7ja1qzwdfw+POHUU4TbiPuP
JQY7qEZbOicYan8/hXfDxkVGVfz23bIZEETTvxDQUpq8tn2UQoumrGi2oBJMrl5L
urR+TlXFR9qQ+rCCKSleQ3b3HMHgffY2zNrNDuZf2oyoOVSW1W2fHuWuGUprYRlX
/RyqFkwN6TTY1fqhiXkeODBm2qFfX2IyBdMoxc8gaN4rjCG+7TbO6RYGcxIDpaZh
A5bTbvKnhmfkhHoBMyndpe3jL3M4dcuQ/4X8ZON8VS/iw871GykQLsg4LEp81vGy
JYzERTFkAUILw8lGvDBx7yUp9XPaEQ==
=8n1N
-----END PGP SIGNATURE-----

--E9ofXc3HHLzq/+og--
