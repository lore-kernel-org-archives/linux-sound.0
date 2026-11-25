Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606195;
	b=UeNnqITvBszr2r5q04VlSlR8uPXitsImxq7q71OC1PyYocZM8AECK8vG8dXzxOIi6hGd
	 WrcFDikTU/w/VT046eZAMR+1MqgebfGuVtBysuAJrE9wl4EsMY5vxR4nfjBlbDsjHCKpO
	 Yr+qeLgWdDEnhVDWbsu+rnza9igA6GRQZiPBcGbsrc8AW3EodCXiLXzeiizQfwO9S0a8T
	 vjAztEcmtecC6R3++g+xS/6OXfbKpzddZCuinUlUCI48Idr11/DXVil/+GpcrrF4IPDku
	 aaYbFA3YMvxNlv1TeI8ymdd91s7pPhi6Pvbb4f7qBDcLKrkR52AYtB6n1nljoA0Di8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606195;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eWxEtVIOx49sxanBQWsSFAwqIT+jM50oAW+oUw/DNVM=;
	b=PVtD9drxK5HKmprDItc9o/AWn89wTSboUHJ+1/kaMk4h71hhpoh9HdOR41dZvJnqEJJI
	 iEvbJyey8ODGBvnQ5C1yxlq4+8LgAgiDY3RVf33S8K4voha4sgvzm9h6F1roLUwtBhbin
	 AB+jpoplVHPKYQRAYTg/0FoZZ5+0sFu52nZkYHz1YqImhDmgay+WzptfUvigf4BVy5IOu
	 F7oa6E5WcRbq14x49Hw0YgItt4SV064dmlS6AuQ4SKvN2sjeKrwKDA/3qvBu1THLheaql
	 o4othbVezcYlNm5e+DvOzDa/5oI4qv2xIeRThmpFJZSRfbiTZvYSfGLfoS+iSDPCdog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OjNDvg98;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D317606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 11:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OjNDvg98
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB3021F000C4;
	Wed, 25 Nov 2026 11:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795606194;
	bh=eWxEtVIOx49sxanBQWsSFAwqIT+jM50oAW+oUw/DNVM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OjNDvg98V4unYgsOSzvF1hRncJzOZ67SLwB4wltpAru4yRjOYKt4sQ8xGyTELR56Z
	 UflupndD2Pbd3ldCaEBATzGlrcpEnk6mYwQWCP73Rb43jJv9fL12muOmfDbpfY7613
	 wU4MMb4otgMxbKerGQedPoZ21m4VOhcsXG5CLnjeWsHrZXs0c9WPCHDvn2sEtrPolB
	 yUOcA/VjyzHk6rggkVpB6wPFv9I6gKL+EEIZozQIt7vNJJRXTLIMk32QRJ1GpF55up
	 qW8fsGiPK4CB9j2NfIN8qHy5wbS2ZEup2YijJHij0tYfGIFTgnrgUUznvUKE8HiAHp
	 KbD9pYta8xmJw==
Message-ID: <sashiko-outbox-233248@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND 1/4] ASoC: cs35l56: Remove SDW1 TX source
 controls and widgets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Fitzgerald" <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261125110853.741337-2-rf@opensource.cirrus.com>
References: <20261125110853.741337-1-rf@opensource.cirrus.com>
 <20261125110853.741337-2-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 11:29:54 +0000
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
- [Medium] ASoC: cs35l56: missing volatile marking for DP3 input regs
--

commit b3ae50f49f263d1a4523d5cee3a2aa7287b0ace9
Author: Richard Fitzgerald <rf@opensource.cirrus.com>

ASoC: cs35l56: Remove SDW1 TX source controls and widgets

This commit removes the ALSA controls, mux widgets, and regmap default/patch
entries for the SoundWire DP3 mixer source registers, and connects the SDW1
Capture DAI to a dummy siggen source.

> diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56=
-shared.c
> index 4d76f17779272..073f7bdd3b0d4 100644
> --- a/sound/soc/codecs/cs35l56-shared.c
> +++ b/sound/soc/codecs/cs35l56-shared.c
> @@ -49,14 +49,6 @@ int cs35l56_set_asp_defaults(struct cs35l56_base *cs35=
l56_base)
>  EXPORT_SYMBOL_NS_GPL(cs35l56_set_asp_defaults, "SND_SOC_CS35L56_SHARED");
> =20
>  static const struct reg_sequence cs35l56_patch[] =3D {
> -	/*
> -	 * Firmware can change these to non-defaults to satisfy SDCA.
> -	 * Ensure that they are at known defaults.
> -	 */
> -	{ CS35L56_SWIRE_DP3_CH1_INPUT,		0x00000018 },
> -	{ CS35L56_SWIRE_DP3_CH2_INPUT,		0x00000019 },
> -	{ CS35L56_SWIRE_DP3_CH3_INPUT,		0x00000029 },
> -	{ CS35L56_SWIRE_DP3_CH4_INPUT,		0x00000028 },
>  	{ CS35L56_IRQ1_MASK_18,			0x1f7df0ff },
>  };
> =20
> @@ -105,10 +97,6 @@ int cs35l56_set_patch(struct cs35l56_base *cs35l56_ba=
se)
>  EXPORT_SYMBOL_NS_GPL(cs35l56_set_patch, "SND_SOC_CS35L56_SHARED");
> =20
>  static const struct reg_default cs35l56_reg_defaults[] =3D {
> -	{ CS35L56_SWIRE_DP3_CH1_INPUT,		0x00000018 },
> -	{ CS35L56_SWIRE_DP3_CH2_INPUT,		0x00000019 },
> -	{ CS35L56_SWIRE_DP3_CH3_INPUT,		0x00000029 },
> -	{ CS35L56_SWIRE_DP3_CH4_INPUT,		0x00000028 },
>  	{ CS35L56_IRQ1_MASK_1,			0x83ffffff },
>  	{ CS35L56_IRQ1_MASK_2,			0xffff7fff },
>  	{ CS35L56_IRQ1_MASK_4,			0xe0ffffff },
> @@ -121,10 +109,6 @@ static const struct reg_default cs35l56_reg_defaults=
[] =3D {
>  };
> =20
>  static const struct reg_default cs35l63_reg_defaults[] =3D {
> -	{ CS35L56_SWIRE_DP3_CH1_INPUT,		0x00000018 },
> -	{ CS35L56_SWIRE_DP3_CH2_INPUT,		0x00000019 },
> -	{ CS35L56_SWIRE_DP3_CH3_INPUT,		0x00000029 },
> -	{ CS35L56_SWIRE_DP3_CH4_INPUT,		0x00000028 },
>  	{ CS35L56_IRQ1_MASK_1,			0x8003ffff },
>  	{ CS35L56_IRQ1_MASK_2,			0xffff7fff },
>  	{ CS35L56_IRQ1_MASK_4,			0xe0ffffff },

[Severity: Medium]
Should CS35L56_SWIRE_DP3_CH1_INPUT through CS35L56_SWIRE_DP3_CH4_INPUT also
be added to cs35l56_common_volatile_reg() alongside the other
firmware-owned mixer input registers (CS35L56_DACPCM1_INPUT,
CS35L56_DSP1RX1_INPUT, etc.)?

These four registers remain listed in cs35l56_readable_reg().  If they are
read through regmap (for example via regmap debugfs), _regmap_read() caches
the values in the REGCACHE_MAPLE tree.  Because they are no longer in
cs35l56_reg_defaults[] or cs35l63_reg_defaults[], regcache_reg_needs_sync()
treats any cached entry without a reg_default as needing sync, so
regcache_sync() in cs35l56_runtime_resume_common() or cs35l56_init() will
write the stale cached values back to the firmware-owned registers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125110853.7413=
37-1-rf@opensource.cirrus.com?part=3D1
