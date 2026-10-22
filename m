Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792636753;
	b=NChHVXM0XBWXqOUeDQ8oNt7tphlsQnxZvS/pQUNbHN1SIi91xzrOcaIqfM8sPmDl5oya
	 mOn7fhHjZkES9GvIVZ7hhsA59PRZm6LsEfrhu1eqiMfPijkUgrK1vhbLgVg7lpzxUn3uK
	 slHM0lqUyfnEU2xsT9d1A5cJMjns+lxjXAGv4/iLhXDWqvW1Nco/ThTbihVBMBKGPK6Wz
	 uu20AbJVhNbj/SsRjun0xAYc4WSvvMFRh1JSKxHclpCqczSZv/H+LJ377GcH0QTfiimuj
	 dM/kXsqwLlhlWnGdku9Oc6/3V66DoW2oIpRt1AosajiEYER+pW0IMzd5gdZmo78D9NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792636753;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6w4pPXl91S5+B+onExl+ZXXe/g32E+r5lxP0qPxchE0=;
	b=jvDCBN112dGu98VN2nSKHefgGN7xzcUsyuAvlmdnNmc78LlhLjqcyZgvjVaX9uNb9Bb5
	 fy+DSjBh3seDqSL7iW66msinbLZdOeuMg3h80YA79NBjQ0x+EjLLU55icAWwA1mtPoPoV
	 Dzyjx3TUKGe6r8m/OZn94UQyFATaN+N/Wdk1NJjfPRBT+vFeIQ+1FwGKSwoJUdZ6C69LP
	 s8SkzSwtTzCkQ9I/MzCGo5pApcKZz6l3Y9sqsSr1gUClt3rMlaw4R9j0jxIcg+eSHpTSA
	 rnWXWM6RyZp6whSkzBdBggHJDj6eA1N3h3Q+FVa4gpmeKa8FkszmBFfsDOQUp8gqssw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aFRDfaur;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608F2606A319
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 02:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aFRDfaur
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B64171F000C1;
	Thu, 22 Oct 2026 02:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792636752;
	bh=6w4pPXl91S5+B+onExl+ZXXe/g32E+r5lxP0qPxchE0=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=aFRDfauro+A2rIwIuNnMvcEjgwj/cb1/1tU3frvMEnwGitotco2oF+Rz1pM11j2J2
	 MXawUGxrh5YU9zvzIrjMsuAlgBfmYQlCTMtFG7GBCp6nQhnNXXbxadSNiMsro+lxq1
	 nOGWk8xWNr1CpG3hG/GDJa8vZKKeN2sehqzvobbqMori4PdehoAukgHSH9WF+kWxwc
	 B/oXT+1nXUnPBJGiDtLFhGEMBh4oMEp9CgKDKVQ/SAv+gns7Qb7LQMgU4vTbVImcW/
	 G5WnNZjBRlBozlDDT1LVkVJUkpI3aitwUz+19o0XDVVW6/y1uZj9n0N81s8zYN36cz
	 DVheXXyQwVjOg==
Message-ID: <sashiko-outbox-180874@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: codecs: es8375: Modify Register Configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhang Yi" <zhangyi@everest-semi.com>, linux-sound@vger.kernel.org
In-Reply-To: <20261022023336.21653-1-zhangyi@everest-semi.com>
References: <20261022023336.21653-1-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 02:39:12 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] ASoC: es8375: undeclared ES8375_VSEL2 and ES8375_LP_DAC in es8375_i=
nit()
--

commit 17c9435d23c86c411e36588d57fd84ba71d4892e
Author: Zhang Yi <zhangyi@everest-semi.com>

ASoC: codecs: es8375: Modify Register Configuration

This commit updates the clock divider table coeff_div[] and modifies the
register initialization sequence in es8375_init() for the ES8375 audio
codec.

> diff --git a/sound/soc/codecs/es8375.c b/sound/soc/codecs/es8375.c
> index bed872eafc955..501a3eda5a89b 100644
> --- a/sound/soc/codecs/es8375.c
> +++ b/sound/soc/codecs/es8375.c

[ ... ]

> @@ -543,18 +543,20 @@ static void es8375_init(struct snd_soc_component *c=
omponent)
>  	regmap_write(es8375->regmap, ES8375_CLK_MGR4, 0x02);
>  	regmap_write(es8375->regmap, ES8375_CLK_MGR5, 0x05);
>  	regmap_write(es8375->regmap, ES8375_CSM1, 0x82);
> -	regmap_write(es8375->regmap, ES8375_VMID_CHARGE2, 0x20);
> -	regmap_write(es8375->regmap, ES8375_VMID_CHARGE3, 0x20);
> -	regmap_write(es8375->regmap, ES8375_DAC_CAL, 0x28);
> -	regmap_write(es8375->regmap, ES8375_ANALOG_SPK1, 0xFC);
> +	regmap_write(es8375->regmap, ES8375_VMID_CHARGE2, 0x10);
> +	regmap_write(es8375->regmap, ES8375_VMID_CHARGE3, 0x10);
> +	regmap_write(es8375->regmap, ES8375_DAC_CAL, 0x2F);
> +	regmap_write(es8375->regmap, ES8375_ANALOG_SPK1, 0xEC);
>  	regmap_write(es8375->regmap, ES8375_ANALOG_SPK2, 0xE0);
>  	regmap_write(es8375->regmap, ES8375_VMID_SEL, 0xFE);
>  	regmap_write(es8375->regmap, ES8375_ANALOG1, 0xB8);
> +	regmap_write(es8375->regmap, ES8375_VSEL2, 0x05);
> +	regmap_write(es8375->regmap, ES8375_LP_DAC, 0xCC);

[Severity: Low]
Are the register definitions for ES8375_VSEL2 and ES8375_LP_DAC missing from
sound/soc/codecs/es8375.h?

In sound/soc/codecs/es8375.c, es8375_init() adds regmap_write() calls using
ES8375_VSEL2 and ES8375_LP_DAC, but neither identifier is defined in
sound/soc/codecs/es8375.h:

#define ES8375_VMID_SEL            0x2D
#define ES8375_ANALOG1             0x2E
#define ES8375_ANALOG2             0x32
#define ES8375_ANALOG3             0x37

Will this cause a build regression with undeclared identifier errors when
compiling sound/soc/codecs/es8375.c with CONFIG_SND_SOC_ES8375 enabled?

[ ... ]

>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022023336.2165=
3-1-zhangyi@everest-semi.com?part=3D1
