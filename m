Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795192630;
	b=EJgkZfumvddKT9aPlyZz+GccB2rEDzpjleJ/xLzVurxBMeJpQtPdwaLKOiJWuVg2qzvZ
	 6ATRV93YdhpthMwFHujQw3XIuV3X6zG631w3UFGPzhPhClEZAlvdaWmZtdlutHgLHVf1L
	 GKE2L+36+F5dEEt4jFv029rEF+4046YceYh7dk01dzyH8bHTxUS6zdZXTZM1WwhL7AMM4
	 xwYKI+7mDPK9uB5eKwJ/S79/zV+F31iIhSAMUPGT8tIH3K25FCritPGZsckImLCi1y/Qt
	 i9eTmwMqDeiN5IZFTvHttJGPap8bzLBg9CKENiEJyow/EyrD1FZMf/pg/GMt6UNC0oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795192630;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=LllCkifyLZHZsmUqrWM2olB5E55wg9TtY6x0+O+3vRQ=;
	b=wywzPxKJdlPHYc3CNMGvwSkFu+zt/mfLLh2tcwVx4dDnH9/34n37eEXnjAtVt7bOXt9h
	 YG5UT+wvbzv0zr4DuSRrb9bsnmAvfhrtgwepk5nz87rjfwIWakbPYu3CXDKZsJcia5JLW
	 SRV95DFb9rp4K7zYT8O93Y2dlhJ8XZC+0W3t8vLO71/Na3nwMW+wfvO3IdWnKJh0iTvxS
	 FbpQaPNEwa05ultskCkax3N1F6HkCPbRUZumpaX8YHZzx8wK9yvJG/Qy3ZaRBZk76dPtf
	 njAtNdEKnxfvXPgo9j64IfhR78wk5V5WYKic61nv5V3Fl2XtXDztf+ggq0qUZmRSSMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FbTNGwmO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587A6606A330
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 16:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FbTNGwmO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A9BA1F000D2;
	Fri, 20 Nov 2026 16:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795192629;
	bh=LllCkifyLZHZsmUqrWM2olB5E55wg9TtY6x0+O+3vRQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=FbTNGwmOEvZvdnkOFipQ0cz32BhXv9yZpWVJdD3S/YO2Yg9TcVD/9inedpWyeRci+
	 G9UObQ3tpokd6RjCgwtH/6vZ6FuaaLo8GJHsvOPvg6nPbrUgER+3aI/iivDWkE2y2S
	 9RZipTD8hhgmG7TWRoFnr7hEE09OYS6pcPvyr/gP68kfVgWrTBse6hwb6mnWuTVV2v
	 nr7xUQbOTieAMXxSI/fN53BLsHy1nNJYwV1MUHrY6NHUMBl+TTHwjiZo/PQ4CMvrky
	 /btMZbXfkYcSO1a7gD79/Z73hcrjnwLg5yzta7vWpHnp5zF1+7sgL+MBSPGFv9pYxh
	 2BPuS9k/9g//Q==
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] ASoC: wm8731: power the converters together,
 activate the interface last
From: Mark Brown <broonie@kernel.org>
To: Rafael Diniz <rafael@riseup.net>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org
In-Reply-To: <20261120080825.2078162-1-rafael@riseup.net>
References: <20261120080825.2078162-1-rafael@riseup.net>
Date: Fri, 20 Nov 2026 16:36:23 +0000
Message-Id: <179519258391.6016.15133087600189015778.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1371; i=broonie@kernel.org;
 h=from:subject:message-id; bh=RYy3GQyCZGG3NOsKsfxlHRlwhrk59kxoXeWn8NDcBvA=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIZyo0SVwTMq1o/zalp0jq/B8t5b22eZnz4RRn7mY6r0
 keu+8/U7yhlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBEHpxh+CsnJrDwYjZnUQHf
 LK5J2hnv/iS9/K04c3FKROWTZTqPq2wYGY4vKl2QFP/CvE7/y8aQLM6Aq9fW5e9lMYm4dFlv5+P
 EFywA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> The datasheet's power-up sequence powers the converters, sets the other
> registers and activates the digital audio interface last.  The driver
> has ACTIVE as a supply widget, which DAPM powers ahead of the ADC, DAC
> and line input, and gives each converter a widget of its own, so a
> capture starting next to a running playback powers the ADC up under an
> active interface.

> +static int wm8731_interface_event(struct snd_soc_dapm_widget *w,
> +				  struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +	unsigned int pwr = snd_soc_component_read(component, WM8731_PWR);
> +
> +	if (event == SND_SOC_DAPM_POST_PMU && !(pwr & WM8731_PWR_CONVERTERS))
> +		snd_soc_component_update_bits(component, WM8731_ACTIVE,
> +					      WM8731_ACTIVE_ACTIVE,
> +					      WM8731_ACTIVE_ACTIVE);
> +	return 0;
> +}
> +
>  static const struct snd_soc_dapm_widget wm8731_dapm_widgets[] = {
> -SND_SOC_DAPM_SUPPLY("ACTIVE",WM8731_ACTIVE, 0, 0, NULL, 0),
> +SND_SOC_DAPM_POST("Interface", wm8731_interface_event),

This will run after we power up the output mixer, the datasheet
recommends setting ACTIVE before updating WM8731_PWR.OUTPD.  See
datasheet page 61:

   https://www.mouser.com/datasheet/2/76/WM8731_v4.9-532414.pdf#page=61

-- 
Mark Brown <broonie@kernel.org>
