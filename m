Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794372338;
	b=w+7ARg3tAhk8NT8sXTQlnskv39dhYQCgMTss/aho0ABahFzZQAeEpiPyZZGFBym2B+sC
	 avXneXYzhSyPcxd99H8oF2cP6aWglCAJ/BxfLOA/M/EVIb5YIARj0GAQ19zqd5GzXIZXx
	 pVSXu/FrAxcYkqPsVfhh+O4oUXhFQulVG9oq39DPDZzb3FmRLtxWIDz+cCCpzHcwuOc2L
	 vNnmPua5b20HE2iaSjkfgdDl3ydjG9pgHLXq+bTKA30zr2b3KRPVh3IrXYiLLZ+BmwESF
	 aQAt2gcbJZKIyxdERccGJGo1EzDc1uqhyt6Litk9lRl7UFPgchtiPBRg+Rl1rgc/YhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794372338;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pkkLI1QWGYnktCo0zXI480QpduLyJHEOSbsDuB0tj0o=;
	b=YFWWs5doOGRPq5s2cLNfQdYbGvCGSC8ClmH1x41GtqcBviIb9ZPAo0Mt+StkwoStpeeI
	 iScADND/xg9K2gl/BPX1MzoQicSTOgiu6WSE19N4kyBvjEI7cAVBlDVPycXKteoR1BqMU
	 Ek9WAkIyjo2yNGAA3e0B+hsVAcLN3Si9HuwzR5W2HVoZihFUbOLSGKHscuTLvYNHjNTSj
	 E8qeOhz3dHVyn+kRCliIvUNuR3lnOT3e/BDTbJfo2yqakjxBZw5WSvJ7FNKg+PhCJg6Jx
	 sMIrxBaMZY7c4Cf4jt0WbSUJw5N1q/zVO+vVxCln6ZJi8QhU/XyOUaWqeeFNdxPcWFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KtJkdFnB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F5760A261C
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 04:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KtJkdFnB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 256DE1F0093C;
	Wed, 11 Nov 2026 04:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794372338;
	bh=pkkLI1QWGYnktCo0zXI480QpduLyJHEOSbsDuB0tj0o=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=KtJkdFnBTi97Z75FKlSU58GCwJExUFvES2YhEF8L6sRAjdNFLmbR7aI9tEJI0DfCE
	 Fw2enB+gdCWNn//sraJ6nT/wY+L0YcQt65KYMVY3T2D3Tu+9TNt7Ts3VQ6sO/mIBwL
	 eESxzzfTtjlrBvvBTQFzy3zup3YUzBYZxlHW4l6nk4vbHLtJQdKP7yny9w+yvZXulh
	 EyVjKcHYe8gBrHYjbxP0mBnxDqDfL+vttsOas8tRPdxSSHPgeWGezd9CY+gTkvqeZV
	 kdfpiO2gYh5ykR40KSSnY/7A9wS+f/SHf22qD75WiOh2brf+1XuXLaGn1on7syApYc
	 WT0BOTTadgH1A==
Message-ID: <sashiko-outbox-208312@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: hda/realtek: Add support for Lenovo Hudson
Reply-To: sashiko-reviews@lists.linux.dev
To: guanlan@awinic.com, =?utf-8?b?b3BlbiBsaXN0OlNPVU5E?= <linux-sound@vger.kernel.org>
In-Reply-To: <20261111043601.306427-1-guanlan@awinic.com>
References: <20261111043601.306427-1-guanlan@awinic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 04:45:37 +0000
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
- [Low] ALSA: hda/realtek: duplicate and unsorted 17aa:3814 quirks in
  alc269_fixup_tbl
--

commit 7ce4d2a12d39225f2afc7745135304f988537c37
Author: Tao Xiao <guanlan@awinic.com>

ASoC: hda/realtek: Add support for Lenovo Hudson

This commit adds ALC287_FIXUP_LENOVO_LEGION_AW88399 quirk entries and an
AW88399 channel-swap entry for the Lenovo Hudson (SSID 17aa:3814).

> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek=
/alc269.c
> index a756e0076021a..b33bd4efb51c8 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -8664,8 +8664,10 @@ static const struct hda_quirk alc269_fixup_tbl[] =
=3D {
>  	HDA_CODEC_QUIRK(0x17aa, 0x3937, "Legion R9000P ADR10H", ALC287_FIXUP_LE=
NOVO_LEGION_AW88399),
>  	HDA_CODEC_QUIRK(0x17aa, 0x3938, "Legion Pro 7 16AFR10H", ALC287_FIXUP_L=
ENOVO_LEGION_AW88399),
>  	HDA_CODEC_QUIRK(0x17aa, 0x3939, "Legion Pro 7 16AFR10H", ALC287_FIXUP_L=
ENOVO_LEGION_AW88399),
> +	HDA_CODEC_QUIRK(0x17aa, 0x3814, "Lenovo Hudson", ALC287_FIXUP_LENOVO_LE=
GION_AW88399),
>  	SND_PCI_QUIRK(0x17aa, 0x393e, "Lenovo ThinkBook 14 G8+ IPH", ALC287_FIX=
UP_LENOVO_XPAD_HEADSET_JACK),
>  	HDA_CODEC_QUIRK(0x17aa, 0x394c, "Lenovo Yoga Slim 7 14AGP11", ALC287_FI=
XUP_YOGA9_14IAP7_BASS_SPK_PIN),
> +	SND_PCI_QUIRK(0x17aa, 0x3814, "Lenovo Hudson", ALC287_FIXUP_LENOVO_LEGI=
ON_AW88399),

[Severity: Low]
Why are both HDA_CODEC_QUIRK and SND_PCI_QUIRK added for 0x17aa:0x3814 in
alc269_fixup_tbl, and placed after the 0x39xx entries?

snd_hda_pick_fixup() scans alc269_fixup_tbl sequentially and falls back to
hda_quirk_lookup_id() on the codec SSID across all entries, so one entry is
redundant when both entries map 0x17aa:0x3814 to the same fixup.  In
addition, alc269_fixup_tbl is sorted by subvendor and subdevice ID (so
0x3814 belongs between 0x3813 and 0x3818), and placing HDA_CODEC_QUIRK at
the end of the 0x39xx block means any shared PCI SSID earlier in the
0x17aa range would match before this HDA_CODEC_QUIRK is reached.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111043601.3064=
27-1-guanlan@awinic.com?part=3D1
