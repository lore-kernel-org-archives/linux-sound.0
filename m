Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794247871;
	b=Pua7dZkXDEgLlsUYKhGupA1f4mmTZ+ZgZnW1nAhmfB3qGj475mwTqZs4y32LUu9lSbQS
	 gMOUXhTREQrFOiKhKT/snQdt9vi+ltievAgvuw3pC4hdu5VABZOBLyYfiLsP2AznTIRXD
	 J7M4HTmpvpX4FD2uTXIU8mfzfQKZ6a6FjPunzUfvhS6kW/bKL0OzGUg+uXuvtTkF7tMA8
	 wbfvyCFcALugkcBhjhgjJUkf54SXNdN73nTyMxBGgH/JEMn9nSRJPaBeFpwWvaWad0kU9
	 bLP3/BQ+CgZATenkmb5FGMRjkl8gweoSmFFIsbgQ5g4vscATpcWf+7AgG2x7L2DLrjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794247871;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=k5YosKwUS94F1TjDE7+zEX7MPtGv59igbPlvBGqY+oo=;
	b=3PcU4Kab0ont25SrOaLyJn2hbZgwv2R/OCMm0DAlMmBnkZuiw8upytK/IIz6q2OWm1Wb
	 9U9JbMBC/BmmfJQWXvQzbfpV/f+0O8Bh51Q/ioWEhG2RSfNgCZFjiworKSvpyKNwl1/Zz
	 +iS9BqqvRAz4BNX4qp7UnNGNyW0n0JHZR1KHAGi7d5+eTW9VRcu3cZoYB6H+xxOLFZO0V
	 z0uVTCfOmmvwOhHjQspkrcGR0VzE8Te2/q56wzOUkPZcyAZzRQ5YXwlkws5LYuhQbaYWG
	 5RIWqkATLDUKssNrjpXQ8CWXbBxJ1d1kzQYQS3xRl14Ra8JRWUd4OwGJAbAfGDASwnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Xg/gvws5";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C01606A321;
	Mon,  9 Nov 2026 18:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xg/gvws5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5972C1F008A2;
	Mon,  9 Nov 2026 18:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794247870;
	bh=k5YosKwUS94F1TjDE7+zEX7MPtGv59igbPlvBGqY+oo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xg/gvws5D7c5D+SKyR/JmJS6eN+IwzJZQWsdKm0fWUkYyJ6W+8zW1CptI5XYFGj57
	 qM7jv43lZSe/B3k2OllB2sgXglmPhaSsh9kkaykroDS+x/S7gpHguWaZ9DIiR6H/EF
	 nRE7/uv0khBw9OsWmb0DFnl5h1sln+EIRJjr3SqHAP95G7mCfM9sqL8hTwI/2LGlmm
	 AfrCTSRxR8XE8N9HbBMr0lMvxa23L7267X5fs2e+LNa3W0Py1r9ixP7LjzaGrj6VR3
	 s2XOnyqb5Bg1q/ibbKG+CtpKI6LwbOPw2DxgmT8ThQPL0inAvXNLKtzNOOhIGBgAGe
	 9wtfatMLClPdg==
Message-ID: <sashiko-outbox-205377@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] ASoC: cs35l45: Adds support for ABPE feature
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ricardo Rivera-Matos" <rriveram@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261109-cs35l45-bpe-v1-2-9d7bc95a90a4@opensource.cirrus.com>
References: <20261109-cs35l45-bpe-v1-0-9d7bc95a90a4@opensource.cirrus.com>
 <20261109-cs35l45-bpe-v1-2-9d7bc95a90a4@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 18:11:09 +0000
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
- [Low] ASoC: cs35l45: wrong constant NUM_BPE_MODE used for BPE level
  calculation
--

commit 7442e06bcd39f5fc281e35f2b0834bedc508545e
Author: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>

ASoC: cs35l45: Adds support for ABPE feature

This commit adds boot-time configuration support for the amplifier brownout
prevention engine (ABPE) via device properties.

> diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
> index 064ee612f05ef..72f4ab1b89bed 100644
> --- a/sound/soc/codecs/cs35l45.c
> +++ b/sound/soc/codecs/cs35l45.c
> @@ -1148,6 +1148,225 @@ static void cs35l45_apply_sync_property_config(st=
ruct cs35l45_private *cs35l45)
[ ... ]
> +static int cs35l45_bpe_set_rls_rate(struct cs35l45_private *cs35l45)
> +{
> +	u32 values[CS35L45_BPE_NUM_LEVELS];
> +	u32 packed =3D 0;
> +	int i, ret;
> +
> +	ret =3D cs35l45_bpe_read_array(cs35l45, "cirrus,amplifier-bpe-release-r=
ates", values,
> +				     ARRAY_SIZE(values));
> +	if (ret)
> +		return ret;
> +
> +	for (i =3D 0; i < CS35L45_BPE_NUM_LEVELS; i++) {
> +		if (values[i] > CS35L45_BPE_INST_RLS_RATE_MAX) {
> +			dev_err(cs35l45->dev, "invalid ABPE release rate at level %d\n",
> +				NUM_BPE_MODE - i);
> +			return -EINVAL;
> +		}

[Severity: Low]
Should this use CS35L45_BPE_NUM_LEVELS - 1 - i instead of NUM_BPE_MODE - i?
NUM_BPE_MODE is the sentinel for enum bpe_modes (the number of BPE response
modes) and only happens to equal 3.  The same applies to the error messages
in cs35l45_bpe_set_atk_rate() and cs35l45_bpe_set_thld().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-cs35l45-bp=
e-v1-0-9d7bc95a90a4@opensource.cirrus.com?part=3D2
