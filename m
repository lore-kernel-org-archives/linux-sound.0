Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794322994;
	b=38dSH8z9a/9epqHoKU/RSHSrqpIDfWP8OMYTpWVx4rSOgXThi2pfTBlrQ+kROmCvhjrY
	 f+uPX0tAeV9IZz50dXk7V0ja75QJCwGMxx4g4tGYo6dDBisosV+OycF1JwWJslwjk6Xce
	 6Rp5BEDadDSE4zbgMmSGcZebO9BdXjIHFkUJJYKaRO/M/ZDscfgvkPUC3ebIVqRC4sx7+
	 blFxh8DL6omazx/hsWcitg5cE1LlR/7EFkVfYrsWqXcXd1VBRc+Gakdw7R8tgdy6U03BJ
	 NR81FuI+jNz9a3yJSPvSC6CnWwK/HEx1CsrtSX/zE0GFNzMZ7HImTa72L6tnS6ZzWOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794322994;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=D3VtpJkLqEMgoBTbjKb0S6NEC2QhqY4bO2W/1ap/LyE=;
	b=KyBjXSLDH+AOEpCmoa4AtgBboXop0pVG65CGMcWopORB7QciO9CbXTv7hs2XayWihTz+
	 ecL/XPvJ54uSHDfDNzSySXn5kC4PmPKqOB2/2dN9WZLZjify5JTLqlNfqVdDOaf5ETIBV
	 TOxqJmmk6WLSzcEWGbEzX4kB9s+0PHxMkRw1c11sHKDwDPNvRi5yhbjupKIOsgA5UliE9
	 ilRaarQcsg7+fR2NYnH05i3ufQE/detP+I4WLN7+3vK/wQrM7gVUnTPqAbv8EfchTfCOa
	 +oVNtWni8aENLxgFO9Sp2dQRnpMmae4yfmHQAkJY25TnN38KPQtOYWPG7uttOx8/hJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RI0Gnbhi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CB3606A320
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 15:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RI0Gnbhi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D0441F0089F;
	Tue, 10 Nov 2026 15:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794322993;
	bh=D3VtpJkLqEMgoBTbjKb0S6NEC2QhqY4bO2W/1ap/LyE=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=RI0GnbhiOS4lxAPRBeBsSqRowHDg6PlQiHEu4TvdFIIlT7glGZnDTAEV6CA/UdQW+
	 krCLJlYxRDjBhQhX0yeQjao6HG5cLRDsV8EoV+cvqar+a2BxMovu6JwlxcSyNwNg/2
	 k7dd6R2VxM7/5sVkD+54BhpdypzpcK0dOAgAy+MQGNZtPdBSyG8RZ+4uomCbC6L8Vr
	 nfHVW5B6s4+X0um0ruC0KTHh2Jx8LpUuh34GwMLAEwZVzagYkXzirVrSd+dVmWnPtL
	 8yi4TIF+FOORmGUtpnM6CDm8hs+NTuG/Zb0EpW0Pxx92oeVENr1Tn1/49ziLlFPWpG
	 kRziKIWEbtRJw==
Message-ID: <sashiko-outbox-207223@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: es8316: Allow more time for headset mic bias to
 settle
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ilya Muhamadeev" <nicourced@altlinux.org>, linux-sound@vger.kernel.org
In-Reply-To: <20261110145835.106381-1-nicourced@altlinux.org>
References: <20261110145835.106381-1-nicourced@altlinux.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 15:03:13 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Medium] ASoC: es8316: uninitialized variable read in es8316_irq() [1]
--

commit 83fd03ee6536ad322b774377b945917b625ffca5
Author: Ilya Muhamadeev <nicourced@altlinux.org>

ASoC: es8316: Allow more time for headset mic bias to settle

This commit increases the settling delay in
es8316_enable_micbias_for_mic_gnd_short_detect() from 20 ms to 100 ms so
that ES8316_GPIO_FLAG_GM_NOT_SHORTED settles before jack detection reads
ES8316_GPIO_FLAG.

> diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
> index 334ac9119c18f..470c503010fc1 100644
> --- a/sound/soc/codecs/es8316.c
> +++ b/sound/soc/codecs/es8316.c
> @@ -616,7 +616,7 @@ static void es8316_enable_micbias_for_mic_gnd_short_d=
etect(
>  	snd_soc_dapm_sync_unlocked(dapm);
>  	snd_soc_dapm_mutex_unlock(dapm);
> =20
> -	msleep(20);
> +	msleep(100);
>  }

[Severity: Medium]
This problem wasn't introduced by this patch, but can es8316_irq()
evaluate an uninitialized flags variable [1] if regmap_read() fails?

sound/soc/codecs/es8316.c:es8316_irq() {
	...
	unsigned int flags;

	guard(mutex)(&es8316->lock);

	regmap_read(es8316->regmap, ES8316_GPIO_FLAG, &flags);
	if (flags =3D=3D 0x00)
		return IRQ_HANDLED; /* Powered-down / reset */
	...
	} else if (!(es8316->jack->status & SND_JACK_HEADPHONE)) {
		/* Jack inserted, determine type */
		es8316_enable_micbias_for_mic_gnd_short_detect(comp);
		regmap_read(es8316->regmap, ES8316_GPIO_FLAG, &flags);
		if (es8316->jd_inverted)
			flags ^=3D ES8316_GPIO_FLAG_HP_NOT_INSERTED;
	...
}

Neither regmap_read() call checks for errors.  If an I2C read fails (or
returns -EBUSY while the regcache is in cache-only mode during resume),
es8316_irq() branches on indeterminate stack data, which can report bogus
jack events to userspace or leave mic bias enabled in the wrong state.

[1] https://sashiko.dev/#/bug/linux-3f2856a8-3cfe-4dc1-bfa0-d15ea515aabd

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110145835.1063=
81-1-nicourced@altlinux.org?part=3D1
