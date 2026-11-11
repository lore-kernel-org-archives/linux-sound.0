Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365306;
	b=uf2FEHnrSpP+U5JdyLcP7jBk/m7yEbxaz369YT0u5L2MJO+6fdZGixb5xf8TflK7ukuV
	 NZNZBgIAnCsFej185ZHqR8lFnfq6gYjfPoG/Fjoa1QuXQPu+hd3gDmwHNGNRooCjfDWrI
	 434h09Na0jZE+JYshKqQCS3RvBiXfluY7ZOzLb6Xqs5iUKoOYT5Pf0W3cZFamIrTnkY2j
	 5rM/zS0gPNOKlaGIws+Zt8vHqhDZRaRoA+zsbCoIbki5K/6J5vvoz5KYo1U4weTbvjDAy
	 lgSJEHvgIkjP3j9EFYBKsfTn4ymY4M9D74s8EX1QBz28SwKgB33h0Z6dw214rc2gPmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365306;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+0HHaiRa8oYCUlh0y9kKel6nVox0BtWueDPV87FxHE4=;
	b=MUjBsyMrEOzV33puSJy0EP4XfGBuYpy6LeGFsCzkK2bEISJVLVIxyCWthwl6wPdkDoTa
	 SNPv5jTjJUvv/ezeiXfCNlZESF2qFjVF+1jhR6cG5GHYZnKAFb+hEYvSeObNS7f2nrCbv
	 zTVyhnGS1WLvf4K1t+zExtxtipLse9poD7liRh5wzqqJyNLFQsJZi1qW7h2NPL43ZeL5Z
	 oAEtnpzlOk4WY9PUC+A56vJ8Sr8XS50/ZYzCY8VyXmr7ce72Z7W2pC3JFYBDEB4Orjrc1
	 I0dzqE/iKFfaq4H2lu8BLBdKyCiXPwx+C3IvSXj93TGaCn0S636R1wBFlU8Gy50vInA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gVKVspx2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8778606A320
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 02:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gVKVspx2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B9531F0089F;
	Wed, 11 Nov 2026 02:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794365306;
	bh=+0HHaiRa8oYCUlh0y9kKel6nVox0BtWueDPV87FxHE4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gVKVspx22pJaG6Z3rjalxnm142uki45l37b7seHfOyOvEhq6Z7rLcvSAqf0mrl+RL
	 R2xkEqWT5RhFystt6SVnk44bvjU8lbLlz21VwOtwgPvB21mlotIuhpkvLtkRf2QA/X
	 JRJf3gO584ZXoYSeB/8JZmO1lg+QQTmHFzglDStOzcK5IFp8VKwloOkdlU9NRECKyi
	 sFL6Og/i3XyMKymhQICVRlRgeqJLSSsa9zmf9Cqt90SYCrNlZgwgWeYf2jRRbPTrLl
	 WqcA1B/5lW7pmKGLKMHwed3RP5+2f2XoqokTFiNVoymeWSZkGYBFOlbsOudzqcBx6J
	 oF3m773JrkhSw==
Message-ID: <sashiko-outbox-208117@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: add micmute LED quirk for Acer
 Predator PHN16-72
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fa-Iz Faadhillah Ibrahim" <faiz.faadhillah@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261111021328.16153-1-faiz.faadhillah@gmail.com>
References: <20261111021328.16153-1-faiz.faadhillah@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 02:48:25 +0000
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
- [Low] ALSA: hda/realtek: duplicate 0x1025:0x1731 quirk entry in
  alc269_fixup_tbl
- [Low] ALSA: hda/realtek: missing Fixes trailer for commit 34e08ad3a8da
--

commit 5bafc10ed11e5fc65c61bd076960d71905ca3545
Author: Fa-Iz Faadhillah Ibrahim <faiz.faadhillah@gmail.com>

> ALSA: hda/realtek: add micmute LED quirk for Acer Predator PHN16-72
>=20
> fix micmute LED for Acer Predator PHN16-72.
>=20
> Signed-off-by: Fa-Iz Faadhillah Ibrahim <faiz.faadhillah@gmail.com>

[Severity: Low]
Since this updates the incomplete quirk added in 34e08ad3a8da ("ALSA:
hda/realtek: Add quirk for Acer Predator PHN16-72"), should this include:

  Fixes: 34e08ad3a8da ("ALSA: hda/realtek: Add quirk for Acer Predator PHN1=
6-72")

> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek=
/alc269.c
> index a756e0076021a..fa78a36bba5ff 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -7553,6 +7553,7 @@ static const struct hda_quirk alc269_fixup_tbl[] =
=3D {
>  	SND_PCI_QUIRK(0x1025, 0x170f, "Acer Predator PHN16-71", ALC2XX_FIXUP_HE=
ADSET_MIC),
>  	SND_PCI_QUIRK(0x1025, 0x171e, "Acer Nitro ANV15-51", ALC245_FIXUP_ACER_=
MICMUTE_LED),
>  	SND_PCI_QUIRK(0x1025, 0x172c, "Acer Nitro ANV16-41", ALC2XX_FIXUP_HEADS=
ET_MIC),
> +	SND_PCI_QUIRK(0x1025, 0x1731, "Acer Predator PHN16-72", ALC245_FIXUP_AC=
ER_MICMUTE_LED),
>  	SND_PCI_QUIRK(0x1025, 0x1731, "Acer Predator PHN16-72", ALC2XX_FIXUP_HE=
ADSET_MIC),

[Severity: Low]
Should this replace the existing 0x1025:0x1731 entry in alc269_fixup_tbl
rather than adding a second entry above it?  snd_hda_pick_fixup() stops at
the first matching SSID, and ALC245_FIXUP_ACER_MICMUTE_LED already chains
ALC2XX_FIXUP_HEADSET_MIC, leaving the second 0x1025:0x1731 entry
unreachable.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111021328.1615=
3-1-faiz.faadhillah@gmail.com?part=3D1
