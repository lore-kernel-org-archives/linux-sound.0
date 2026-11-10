Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794289654;
	b=TYiNnQbN9tnQ32k97akTh/itNtTIfk60ZSMe/Wi+6a5ROilCkgQ01t/XgyIW8G52B9se
	 zB1GmO2vEA85mBSIae9U1y4lgAQy030UuYUuVuI1Lb5ueiZq+0YtE1zh0q8b1BtMNOQUh
	 V8b/AfNuiIVWzIKi4jdcvGeJJRujpALaARDMAXee6VJ2cAq2rG1qGOzNhUYRstslf6meA
	 sfJCUCDPavzbMOxcBDwu/90sEqBX3Gk58nDq/WbkCmLo9hZ0inpAfgidt0x6C82EOJbDt
	 NrAavicOrWIAm7jjbi9zZcljuqeNm+absPZpR0mWbxjsJ74fc9FWqxZPLx4W9CYVvQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289654;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0j9L/QTXzqvGPeDspCouFv3+dmje4VRs5BZ/6hVFzEs=;
	b=IrHW5+Ks+Mmcbjba1HkSJ15Qf6Uc56dF31ex7g2vct9MMVaxborlNFkS6D5Sqom9Wt6/
	 n7BG6mZIjwR8ILH40RfB6VV5StgO5hnQZj5U0iLs4UTAaVc5su221buBz5qZm8B5Su8On
	 akX1j7B+3+SYc05LfW8SzxX24jYmxchX4ZtzOcFHBNSkv7XaImR1308j5QXBFRLKj59Gi
	 uD2pgrWRBlJo0y3SJruzjAizDvvZhaqumxDEbtChC1WDRVYbhXciA3ZAd+brZ7BwmRT+1
	 IKQMN4zo44cSckPdMtxvhDMcgS72AhHvcbCHFF25wLgj5jLPKUvEDYYDetEmsKcnvbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YLuSx1Df;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0075606A31C
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 05:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YLuSx1Df
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 607891F0089F;
	Tue, 10 Nov 2026 05:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794289653;
	bh=0j9L/QTXzqvGPeDspCouFv3+dmje4VRs5BZ/6hVFzEs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YLuSx1Df2R2btq8Di2XwDh4hKjEr/B3WW6eoYpDeYCMLHB3934gHx69vgzLMWCfat
	 YsPpUSoQbCWAGpw4DFfEV68nVt+GO7ZV47AzmSBizPZe/tRthAhU1A8T7decK9P7sC
	 Mpvch6ZEjAaFX6zx54eFmHIEUBcOUIR0c/lJSsY/z0SbZXHIgTlhvEhWxS0SDRHrgd
	 5pvOCFl/ip14K/ICN26/bDYwMe3M/N2MiyZMuK+yJpJo5sRFmmeuayUk6EpF5RPcnx
	 CpESJcslupgrOMNEdFb3iWCR0oDOsgGTGTcNVpNxol4qzMOz17cZbGXe59iw4Ql/dD
	 0BpS/DN+P99oQ==
Message-ID: <sashiko-outbox-206341@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 16/20] ASoC: soc-component: add
 snd_soc_component_regmap_multi_reg_write_bypassed()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kuninori Morimoto" <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ld71mf6i.wl-kuninori.morimoto.gx@renesas.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
 <87ld71mf6i.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 05:47:32 +0000
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
- [High] ASoC: build failure in
  snd_soc_component_regmap_multi_reg_write_bypassed()
--

commit 57b5a81c5a120fd92608fae86a8fb5b252d6cb73
Author: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

ASoC: soc-component: add snd_soc_component_regmap_multi_reg_write_bypassed()

This commit adds the snd_soc_component_regmap_multi_reg_write_bypassed()
static inline helper to wrap regmap_multi_reg_write_bypassed() on a
component's regmap.

> diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
> index 89ae650b74f87..0a8beebd7b038 100644
> --- a/include/sound/soc-component.h
> +++ b/include/sound/soc-component.h
> @@ -489,6 +489,19 @@ static inline int snd_soc_component_regcache_sync(st=
ruct snd_soc_component *comp
>  	return regcache_sync(regmap);
>  }
> =20
> +static inline int
> +snd_soc_component_regmap_multi_reg_write_bypassed(struct snd_soc_compone=
nt *component,
> +						  const struct reg_sequence *regs,
> +						  int num_regs)
> +{
> +	struct regmap *regmap =3D snd_soc_component_to_regmap(component);
> +
> +	if (!regmap)
> +		return 0;
> +
> +	return regmap_multi_reg_write_bypassed(regmap, regs, num_regs);
> +}

[Severity: High]
Does calling regmap_multi_reg_write_bypassed() from a static inline helper
break the build when regmap support is disabled?

Unlike regcache_sync() and the other helpers in this header,
include/linux/regmap.h only declares regmap_multi_reg_write_bypassed()
inside its #ifdef CONFIG_REGMAP block and provides no fallback stub in the
#else section.  Any translation unit that includes sound/soc-component.h
(or sound/soc.h) when regmap is disabled will fail to compile with an
implicit function declaration error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/878q31nttj.wl-kunin=
ori.morimoto.gx@renesas.com?part=3D16
