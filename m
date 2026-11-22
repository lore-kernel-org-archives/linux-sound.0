Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795385569;
	b=fBhib8dgzJTo4Zkp0iGsecb/GKN6Zu3174qdNWQPqKEsXLp65BH3ohS7tulPkR3XSLBj
	 nOEHWm/2flLQxC7h+yz1qup7oWGbhnvuUgfRgAKR/z0hfWoApKGxM7ngv5Oz6UXulIm5n
	 ObIBO8zVPnZ97PcF6kccMqn+mAOQ6ieUMobS567URPu0zj6gyPyOhJdkprvuQR0gYO4yS
	 hRRRRkQG9zugTrjzBWud+mZGwhF9LS4bzt9qRbN6RUsHYH1jTyx0DKwRUMEppBnFCP5g8
	 2kte2NqWjviBYbNbSuh0fA5TZNs3yMlMIg3645+nmu9gNkWDowNXxam7ynzPmH5ZYjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795385569;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QCe26N/RTjtafKOoyg9zOxXBHVw4tRGUczoZZNC0eSg=;
	b=Lm4uA8ZOJMxx9iPI3XNvbxzecpoUq3VYjGjfBgcvXbEtp9RRcr3dp0XAvWAgNDUykG7I
	 6LyPFcMunl26mc3rSl9yVD5A1J2oui4eE0wDdAQqbRxOODsmD5IbhvXM1UiS+kRjrDPpJ
	 0OIY/VsxX4zyVZFfi4ELHYmNoc/2ihXhbgMDVSQbJeL94ovZM/M3CGEVvhztQVHgXUJTC
	 8jaiOVz4N9e0rqXFOC1aHkjMoP71mF6LnCBlPbUCXpoT0QC5yJ2tW+/U/IBjzY2v891Lq
	 6gdF6BJIDEzK9c89B8kD+7iTJwX9IQ+yQExjlYR2dOU7q6G3OyqqZDsYxJGo7g7jsNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b7UIQ4BE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D086606A31A
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 22:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b7UIQ4BE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC9D41F000EB;
	Sun, 22 Nov 2026 22:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795385569;
	bh=QCe26N/RTjtafKOoyg9zOxXBHVw4tRGUczoZZNC0eSg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b7UIQ4BE3SEeElLgOGre3P8yUfHvmmx+9LP7wv1zZ2pDghcn8bFMSVRw22Aw6pkkj
	 bRXVg8W+CA5DnxSmJtfzmnhTPoXAinv9teWURaxFawnytcOmNFRuOWxlicXtPA8FbC
	 qFZLO5xeafyLJ6JmousZIwlKHHly8d8oyPcFNyLRKyVoGRVXtJQYRrN7xt12lYBLN8
	 V5+cHhw7nmcHp6Uiy51xkyBVcwcZ0IboD8D1Ffce4292zw6dzCSuz0OO146S0RVXQI
	 iEbzwZ0AAZ4ElAk4PkQ3erFtU89QNt90BD8mYe/2nYlA9KtWHP/k7IErAcU2TU2cWB
	 BifHJQNfO80Ug==
Message-ID: <sashiko-outbox-228402@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for HP Spectre x360 2-in-1
 Laptop 16-f2xxx
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abhiraj Dutta" <abhirajdutta7@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261122-hp-spectre-16-f2-quirk-v1-1-2011ef8986fb@gmail.com>
References: <20261122-hp-spectre-16-f2-quirk-v1-1-2011ef8986fb@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 22:12:48 +0000
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
- [High] ALSA: hda/realtek: duplicate LED registration and leak in
  16-f2xxx fixup
--

commit 1e1f85383f6e0d271a8e66afdced2477c34a6570
Author: Abhiraj Dutta <abhirajdutta7@gmail.com>

ALSA: hda/realtek: Add quirk for HP Spectre x360 2-in-1 Laptop 16-f2xxx

This commit adds a quirk entry and fixup for the HP Spectre x360 16-f2xxx
(SSID 103c:891e) to enable the treble speakers and configure the mute and
mic-mute LEDs.

> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek=
/alc269.c
> index d38be4d500b21..edfd5ebe8b084 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
[ ... ]
> @@ -7226,6 +7227,12 @@ static const struct hda_fixup alc269_fixups[] =3D {
>  		.type =3D HDA_FIXUP_FUNC,
>  		.v.func =3D alc245_fixup_hp_spectre_x360_16_aa0xxx,
>  	},
> +	[ALC245_FIXUP_HP_SPECTRE_X360_16_F2XXX] =3D {
> +		.type =3D HDA_FIXUP_FUNC,
> +		.v.func =3D alc245_fixup_hp_spectre_x360_eu0xxx,
> +		.chained =3D true,
> +		.chain_id =3D ALC245_FIXUP_HP_X360_MUTE_LEDS
> +	},
>  	[ALC245_FIXUP_HP_ZBOOK_FIREFLY_G12A] =3D {
>  		.type =3D HDA_FIXUP_FUNC,
>  		.v.func =3D alc245_fixup_hp_zbook_firefly_g12a,

[Severity: High]
Does chaining ALC245_FIXUP_HP_X360_MUTE_LEDS here register the mute and
mic-mute LED class devices twice?

alc245_fixup_hp_spectre_x360_eu0xxx() already runs both LED fixups directly:

sound/hda/codecs/realtek/alc269.c:alc245_fixup_hp_spectre_x360_eu0xxx() {
    ...
	cs35l41_fixup_i2c_two(codec, fix, action);
	alc245_fixup_hp_mute_led_coefbit(codec, fix, action);
	alc245_fixup_hp_gpio_led(codec, fix, action);
}

Chaining ALC245_FIXUP_HP_X360_MUTE_LEDS invokes
alc245_fixup_hp_mute_led_coefbit() and alc245_fixup_hp_gpio_led() a second
time.  In create_mute_led_cdev(), the second registration allocates and
registers duplicate led_classdev instances and overwrites
spec->led_cdevs[LED_AUDIO_MUTE] and spec->led_cdevs[LED_AUDIO_MICMUTE], so
snd_hda_gen_spec_free() leaves the first devm-allocated led_classdev
structures registered in the LED core after they are freed on unbind
(use-after-free).

The 103c:891e quirk entry can use ALC245_FIXUP_HP_SPECTRE_X360_EU0XXX
directly without adding ALC245_FIXUP_HP_SPECTRE_X360_16_F2XXX.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122-hp-spectre=
-16-f2-quirk-v1-1-2011ef8986fb@gmail.com?part=3D1
