Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794288931;
	b=rB/iGf40KWlssBvfCwLSCjMXLDHWVv19NlSIDpEzfvsdMoSmDMHyn9wG1WZHpMI4nfbN
	 DdVoOKY3ixZ21Izwve4Poquj+X45LzrF6FOP9pgRatUr9PrGmugJevgn80NUgQCyog0LW
	 Nc9/Qj9fM/PlqL1ZZAyuUNANyksmL35iuqxEoXeH3kB8GI8gnI94SJXHUhSFZnxctTNjJ
	 pWTzeDiQs3+IA41TGHQsJuMEP513OGZ8hc6wPjoloN8mZa9+7RXfVyAIJr71BU3DU7YQb
	 2Sa9CqKGgp8vzVWBbHPOBJBBhU7Z+RQfM+yCVADZmPWsSko76PkgqtqqlMfGvWNCunw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794288931;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Q+nRVFDmniy4q/+/Ur+hyMxqa6YOzsh8oYRu+T+ypfk=;
	b=chmqP8Xby/erdpVM51p7Fvk7LNbSjD8klVSPPP9BiTnaCrmy8hsqa8XrcHaHk+TYznZJ
	 VIGNFRtSvCE5RXp3/mqKsEjw+0TIjSOXuBT/Y6SP/NYAzF6N3G+6YXW+qdSGv/Pj1Pu+s
	 ve+dXuSpH9gJjCivNhUYHAIWhybF/MBtO54dyfZat3xcumcGK+l+ACgRF90/XgQCzTKAW
	 tqOHMXjIVOPceAN2f05WIh4+xlBXzMQEmuJbjgokz9yu6sag9JAah59ON8egEsZ3RMD0h
	 +42pLDoXCVE2yAlKQ3JfFAt4T3IlSVwjaJE92ag45o9voHizhSP3iib61L3VhGbN4Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ckD+GWaT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1617606A32E
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 05:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ckD+GWaT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B2C01F0089F;
	Tue, 10 Nov 2026 05:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794288930;
	bh=Q+nRVFDmniy4q/+/Ur+hyMxqa6YOzsh8oYRu+T+ypfk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ckD+GWaTgwIUSICSpoGo83upAsTok2rHQmRZlEOf4/LmN5iaeLJAj7qSi1DVP4G48
	 4MjDWAOtGxKRZ/qM45qPsDHRJQN8TRfaABYboQUxmOI6Ntph6FjIhs84Et4mZxJuCX
	 5ufOcI4QudSI21nBUfR2lmBdV2FMtPfTzV87TN6rj6AeMW6R+hw8cJUvZ6GvotUHOf
	 j1s4UZz1pN6Jwdq8m/XdI3R2fYlVlXXcJozNthm5XnvFJDUR46+APec7/sFxfTRsOf
	 auVB/DshSIiv+ThK4vo0Ia4mKgrGH8C/oE6n5aaIyJ/xXAsaaDZ2ZlACKAPChNvQQl
	 lv0KgN9eRVVyw==
Message-ID: <sashiko-outbox-206311@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/20] ASoC: soc-component: rename
 snd_soc_component_{init/exit}_regmap() to
 snd_soc_component_regmap_{init/exit}()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kuninori Morimoto" <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <875wy5ntt2.wl-kuninori.morimoto.gx@renesas.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
 <875wy5ntt2.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 05:35:29 +0000
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
- [Medium] ASoC: soc-component: build failure in
  snd_soc_component_regmap_exit() when !CONFIG_REGMAP
--

commit b2a7793f33b0c23793a100c7c2aba1692324766a
Author: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

ASoC: soc-component: rename snd_soc_component_{init/exit}_regmap() to snd_s=
oc_component_regmap_{init/exit}()

This commit renames snd_soc_component_{init,exit}_regmap() to
snd_soc_component_regmap_{init,exit}(), provides compatibility macros for
the old names, and removes the #ifdef CONFIG_REGMAP guards around them.

> diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
> index a6e280c798f3d..6dad994009bdb 100644
> --- a/sound/soc/soc-component.c
> +++ b/sound/soc/soc-component.c
> @@ -432,10 +432,8 @@ void snd_soc_component_regmap_async_complete(struct =
snd_soc_component *component
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_component_regmap_async_complete);
> =20
> -#ifdef CONFIG_REGMAP
> -
>  /**
> - * snd_soc_component_init_regmap() - Initialize regmap instance for the
> + * snd_soc_component_regmap_init() - Initialize regmap instance for the
>   *                                   component
>   * @component: The component for which to initialize the regmap instance
>   * @regmap: The regmap instance that should be used by the component
> @@ -445,15 +443,15 @@ EXPORT_SYMBOL_GPL(snd_soc_component_regmap_async_co=
mplete);
>   * yet ready when the component is registered. The function must also be=
 called
>   * before the first IO attempt of the component.
>   */
> -void snd_soc_component_init_regmap(struct snd_soc_component *component,
> +void snd_soc_component_regmap_init(struct snd_soc_component *component,
>  				   struct regmap *regmap)
>  {
>  	component->regmap =3D regmap;
>  }
> -EXPORT_SYMBOL_GPL(snd_soc_component_init_regmap);
> +EXPORT_SYMBOL_GPL(snd_soc_component_regmap_init);
> =20
>  /**
> - * snd_soc_component_exit_regmap() - De-initialize regmap instance for t=
he
> + * snd_soc_component_regmap_exit() - De-initialize regmap instance for t=
he
>   *                                   component
>   * @component: The component for which to de-initialize the regmap insta=
nce
>   *
> @@ -463,14 +461,12 @@ EXPORT_SYMBOL_GPL(snd_soc_component_init_regmap);
>   * This function should only be used if snd_soc_component_init_regmap() =
was used
>   * to initialize the regmap instance.
>   */
> -void snd_soc_component_exit_regmap(struct snd_soc_component *component)
> +void snd_soc_component_regmap_exit(struct snd_soc_component *component)
>  {
>  	regmap_exit(component->regmap);
>  	component->regmap =3D NULL;
>  }
> -EXPORT_SYMBOL_GPL(snd_soc_component_exit_regmap);
> -
> -#endif
> +EXPORT_SYMBOL_GPL(snd_soc_component_regmap_exit);

[Severity: Medium]
Does removing the #ifdef CONFIG_REGMAP guard around
snd_soc_component_regmap_exit() break builds when CONFIG_SND_SOC is
enabled and CONFIG_REGMAP is disabled?

In sound/soc/Kconfig, SND_SOC only selects REGMAP_I2C if I2C and
REGMAP_SPI if SPI_MASTER, so CONFIG_REGMAP can remain unset.  Unlike
regmap_get_val_bytes(), regcache_sync(), and regmap_async_complete(),
regmap_exit() is only declared inside the #ifdef CONFIG_REGMAP block in
include/linux/regmap.h and has no stub when CONFIG_REGMAP is disabled,
causing an implicit function declaration error here.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/878q31nttj.wl-kunin=
ori.morimoto.gx@renesas.com?part=3D2
