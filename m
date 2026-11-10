Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794289110;
	b=15RpWDAp/5+Ql9g55qSeY5YotCaToVit/T6CJlAjNyJbU2TekoqvdAvvInkbzeh/X5Bx
	 adISAWQTDuefCobjWeLbvKHsrXj55DyRhQFdpfMIARZlghUHj497MIZOWLmt6sPOloDV1
	 IZQwSN4ssFp1cEsObaCnY7yVfgvIlM1u18XlF5tFWBbL5a7/2pFE3Avr5BUDJOED4UKA2
	 BgtJdjkvep3TpfeeMQJF/rvG81QrwVE8gofukjpbM3LyVaVWPDYrSnVffSCIJt7p43/cj
	 gmCmCN+Nypw1qlsrKJBkBJNSoipkqigh0GAq2jWcRIloCTkH7zSmzTx2Ns1cDgo/V+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289110;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VyIOpYmCk2UcDdt1lSMjKrDmsFbvxbkKcS4kfokM5Zo=;
	b=ZT5mGQJYVP6CiWAG9mP/2Qk/PBXztFrzYf2CbqvAy39j9FCHYQCKwirQtRZrdHxtCa6s
	 Rkw1UubTZWydChO68ENKpOIbSfDgSMveYrkFhm1gM7T/4BOCDIuULhf1DoE/wxbZrq0kD
	 RUVtbdWrFnpJuTk4WWzBy4KfYmc+rPrCGol60Eo2SlC+nTto9gmvrl2wj+MOgoqPMLbHH
	 sQ0U4x1MrgscmXC5ObAOTEqwgQwRUDDiQJ/ZqNoJVag+vHjw7jLibYp5YjdQ/oNP7ulfy
	 0BKEJUxAM429NmTMNKwm+FeJJtN1nGrR7X8eVENF0eQZ9LuVy7qYJv4i2JMT3EB+K3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CJ3MqYoq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8DB606A31C
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 05:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CJ3MqYoq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8DF31F008A3;
	Tue, 10 Nov 2026 05:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794289110;
	bh=VyIOpYmCk2UcDdt1lSMjKrDmsFbvxbkKcS4kfokM5Zo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CJ3MqYoqGmIqxTe/RdAoZWZRqzq/FzZhCR7x7IMmzcaVtjGAs8gN6vdj5dSEsL1Hy
	 QmmGd5S9d6WwuahTBTUm+rOdNDxlaWTK1etmrQBeDrfHVyd9pp0Rd2KAXOtB31g+xE
	 mI3UX1MTbRMxt6FRWJ55OXjOEWCziOPVF+QtVC2AdParYGKvTtZw6Vjzi4hTUmt5ta
	 cT6KgrWnfHl4Hwnk76KAY4UjoBJ0pU0/RE74Ok7AJNKrSsGisCwjYluoT36bPqtOuR
	 +xIMaAzwg0U4scVn5AYabhtQlSblHnU/rJ/6TMZav8xDef3GDvurgvtDlmY99Kbs4h
	 tM4I1vas1NxHw==
Message-ID: <sashiko-outbox-206317@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/20] ASoC: soc-component: makes regmap function to
 inline macro
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kuninori Morimoto" <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87zevhmf80.wl-kuninori.morimoto.gx@renesas.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
 <87zevhmf80.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 05:38:29 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] ASoC: soc-component: undeclared snd_soc_component_to_regmap()
  breaks build
--

commit f289bf9367f01f6ee0716c3f431535b8a1efc6e9
Author: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

ASoC: soc-component: makes regmap function to inline macro

This commit moves snd_soc_component_regmap_val_bytes(),
snd_soc_component_regmap_cache_sync(), and
snd_soc_component_regmap_async_complete() from sound/soc/soc-component.c to
static inline helpers in include/sound/soc-component.h.

> diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
> index 6d5740d5a5e21..4e538942df643 100644
> --- a/include/sound/soc-component.h
> +++ b/include/sound/soc-component.h
[ ... ]
> @@ -455,10 +448,53 @@ int snd_soc_pcm_component_ack(struct snd_pcm_substr=
eam *substream);
>  void snd_soc_pcm_component_delay(struct snd_pcm_substream *substream,
>  				 snd_pcm_sframes_t *cpu_delay, snd_pcm_sframes_t *codec_delay);
> =20
> +/*
> + * regmap
> + */
> +void snd_soc_component_regmap_init(struct snd_soc_component *component,
> +				   struct regmap *regmap);
> +void snd_soc_component_regmap_exit(struct snd_soc_component *component);
> +
> +static inline int snd_soc_component_regmap_get_val_bytes(struct snd_soc_=
component *component)
> +{
> +	struct regmap *regmap =3D snd_soc_component_to_regmap(component);
> +	int val_bytes;
> +
> +	/* Errors are legitimate for non-integer byte multiples */
> +
> +	if (!regmap)
> +		return 0;
> +
> +	val_bytes =3D regmap_get_val_bytes(regmap);
> +	if (val_bytes < 0)
> +		return 0;
> +
> +	return val_bytes;
> +}
> +
> +static inline int snd_soc_component_regcache_sync(struct snd_soc_compone=
nt *component)
> +{
> +	struct regmap *regmap =3D snd_soc_component_to_regmap(component);
> +
> +	if (!regmap)
> +		return 0;
> +
> +	return regcache_sync(regmap);
> +}
> +
> +static inline void snd_soc_component_regmap_async_complete(struct snd_so=
c_component *component)
> +{
> +	struct regmap *regmap =3D snd_soc_component_to_regmap(component);
> +
> +	if (regmap)
> +		regmap_async_complete(regmap);
> +}

[Severity: High]
Does calling snd_soc_component_to_regmap() in these three static inline
functions break compilation at this commit?

snd_soc_component_to_regmap() is not declared or defined until a later patch
in the series, commit "ASoC: soc-component: add
snd_soc_component_to_regmap()".  Because these helpers are static inline
functions rather than macros, every translation unit that includes
include/sound/soc-component.h fails to compile with an implicit function
declaration error until that patch is applied, breaking git bisect across
the intermediate commits.  Ordering commit "ASoC: soc-component: add
snd_soc_component_to_regmap()" before this patch would keep the series
bisectable.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/878q31nttj.wl-kunin=
ori.morimoto.gx@renesas.com?part=3D6
