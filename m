Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794088678;
	b=y7EVn9NFSIHhj/xuN0lVATRO/Q9xTJ1wBu4D+cm39OW4tX4AlrS2/FhpnkyP0MlNPZjM
	 mX8pNaZzGmWAeyeSMNu6mrejffXHBw/8ZeiPBZ/g3XOeZnj8l0q47Qg4NLqp7d6bt3JAf
	 l+vgWVzYY5nx8aWivy2KCKqrzQx19CElyyTLj+HEpqZtgr8pioLqWsRah42XxKUH85/E4
	 g9OL8g/yGhDtpVZ+BD+qK+YwxWmNiKo3n5zQu6C21cb+z6FV/Xi/hPQ/a9pwXp2JWgLjk
	 uIVi1qs64Dgk5PH+aYb3cjdjY31NZrtO+HnjtlKs7IC4azplXl/rIXiTtJ4XycOE2ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794088678;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=N7ic/B1EwAk5DLSRzrD0rxA0bqIV2GwABFJPqd6ECRY=;
	b=JbneprBeAHX//ybySw/+DhY0mjUbK+NssTj7x9aYkSFNGVRcUm59E33QLL1ihisuQfzp
	 X5gQdW2JKR9XjLOvXTn/bV/2tUCiPAYCWRf0pwu+j4zIJY/Ek7lhMvh+tTwcaOAScOqQC
	 vIL7OqXSJc/8lCaFrQaVaeJLmq0NudyRFFo2hzDTj/m912QCnlGDh3ShVVbEncPCs93Ht
	 XaF9KmkZvbiDsTyqrsV5Hi4ScDygxlWAB0ltLO1W1+cA40samMuPMwbO/ob8W8hGvAoAx
	 KqcQaAjBxmUuEiujBpKeN6zBHSuJs2zvOGA2oAsHLY6Z3BJJri5krp2adK66EMFrcPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H+poMQoh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27D9606A326
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 21:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H+poMQoh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 563731F0089F;
	Sat,  7 Nov 2026 21:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794088677;
	bh=N7ic/B1EwAk5DLSRzrD0rxA0bqIV2GwABFJPqd6ECRY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H+poMQohJ06YornkX7h+nLYfl1O3vBM3lU731wGGrS+ijUZgH9BcWGUWGCwf1LlKn
	 mL7nGWUp7eW43odypl+vuw5dnnK72lOJ0xPv0vokwq9dlBuR0rpp5Kr/7uH8eBwbNv
	 5uaHg7CbiQ56um4f10vg1sfsojwoopIv5lJ1LKHTBRTfkmdQa8ZZZkTIY1djsoaVf0
	 zQt6+K6h9uMUTvfi2ob1CHLsaIWTtnixIMfy5mJbOPVXpiPRz+3s7Sy0vnL6Arti3t
	 p6dXY+ZQclkAC/w9ih6iTCPtMM7nsooTHeLKOCFypYLyIDTFxKokqZUR5h6WN5v2di
	 DTw3ps033k0Sg==
Message-ID: <sashiko-outbox-203350@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ASoC: amd: acp: es83xx: Enable amplifiers after the
 codec output
Reply-To: sashiko-reviews@lists.linux.dev
To: "Samuel Leyva" <samuelslg03idk@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261107214714.11392-3-samuelslg03idk@gmail.com>
References: <20261107214714.11392-1-samuelslg03idk@gmail.com>
 <20261107214714.11392-3-samuelslg03idk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 21:57:56 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] ASoC: amd: acp: Headphone widget still powers up before
  ES8316 output drivers
- [Low] ASoC: amd: acp: missing Fixes trailer for commit 54fcd9dd44b2
- [Low] ASoC: amd: acp: coding style violation on if/else braces in
  power event handlers
--

commit e34ce394ae054b24a35c55d4522e17f836ad0f9d
Author: Samuel Leyva <samuelslg03idk@gmail.com>

> ASoC: amd: acp: es83xx: Enable amplifiers after the codec output
>
> The speaker and headphone amplifier GPIOs are driven from SUPPLY
> widgets. DAPM powers supplies before the rest of the path, so the
> amplifiers are enabled while the ES8316 headphone driver and charge
> pump are still powering up, which results in an audible pop every
> time the output is powered on.
>
> Move the GPIO handling to the Speaker and Headphone endpoint widgets,
> which DAPM powers up last and powers down first, and give the codec
> output a short time to settle before enabling the amplifier.
>
> Tested on a Huawei MateBook D 14 (NBM-WXX9).
>
> Signed-off-by: Samuel Leyva <samuelslg03idk@gmail.com>

[Severity: Low]
This fixes an audible pop on output power-up from the original machine
driver.  Should it include a Fixes tag for 54fcd9dd44b2 ("ASoC: amd: acp:
Add machine driver that enables sound for systems with a ES8336 codec")?

> diff --git a/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c b/sound/soc/am=
d/acp/acp3x-es83xx/acp3x-es83xx.c
> index fb675774fbff8..0a05f1f08663b 100644
> --- a/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
> +++ b/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c

[ ... ]

> @@ -114,23 +117,15 @@ static struct snd_soc_jack_pin es83xx_jack_pins[] =
=3D {
>  };
> =20
>  static const struct snd_soc_dapm_widget acp3x_es83xx_widgets[] =3D {
> -	SND_SOC_DAPM_SPK("Speaker", NULL),
> -	SND_SOC_DAPM_HP("Headphone", NULL),
> +	SND_SOC_DAPM_SPK("Speaker", acp3x_es83xx_speaker_power_event),
> +	SND_SOC_DAPM_HP("Headphone", acp3x_es83xx_headphone_power_event),

[Severity: Medium]
Does the "Headphone" widget still power up before the ES8316 headphone
output drivers and charge pumps?

Unlike snd_soc_dapm_spk (rank 13), snd_soc_dapm_hp shares power-up sequence
rank 12 with snd_soc_dapm_out_drv:

sound/soc/soc-dapm.c:dapm_up_seq[] {
    ...
	[snd_soc_dapm_out_drv] =3D 12,
	[snd_soc_dapm_hp] =3D 12,
	[snd_soc_dapm_line] =3D 12,
	[snd_soc_dapm_sink] =3D 12,
	[snd_soc_dapm_spk] =3D 13,
    ...
}

In es8316_dapm_widgets[], "Left Headphone Charge Pump", "Right Headphone
Charge Pump", "Left Headphone Driver", and "Right Headphone Driver" are
SND_SOC_DAPM_OUT_DRV widgets with subseq 0 and reg ES8316_CPHP_OUTEN (0x17),
whereas SND_SOC_DAPM_HP("Headphone", ...) has subseq 0 and reg SND_SOC_NOPM
(-1).  When rank and subseq match, dapm_seq_compare() sorts by a->reg -
b->reg, placing "Headphone" (-1) before the ES8316 OUT_DRV widgets (0x17).
As a result, acp3x_es83xx_headphone_power_event() runs its 50 ms delay and
enables priv->gpio_headphone before ES8316_CPHP_OUTEN is written.

[ ... ]

> @@ -168,8 +162,11 @@ static int acp3x_es83xx_headphone_power_event(struct=
 snd_soc_dapm_widget *w,
>  	struct acp3x_es83xx_private *priv =3D get_mach_priv(card);
> =20
>  	dev_dbg(priv->codec_dev, "headphone power event =3D %d\n", event);
> -	if (SND_SOC_DAPM_EVENT_ON(event))
> +	if (SND_SOC_DAPM_EVENT_ON(event)) {
> +		/* Let the codec output settle before enabling the amplifier */
> +		msleep(ES83XX_AMP_ON_DELAY_MS);
>  		priv->headphone_on =3D true;
> +	}
>  	else
>  		priv->headphone_on =3D false;
> =20
> @@ -186,8 +183,11 @@ static int acp3x_es83xx_speaker_power_event(struct s=
nd_soc_dapm_widget *w,
>  	struct acp3x_es83xx_private *priv =3D get_mach_priv(card);
> =20
>  	dev_dbg(priv->codec_dev, "speaker power event: %d\n", event);
> -	if (SND_SOC_DAPM_EVENT_ON(event))
> +	if (SND_SOC_DAPM_EVENT_ON(event)) {
> +		/* Let the codec output settle before enabling the amplifier */
> +		msleep(ES83XX_AMP_ON_DELAY_MS);
>  		priv->speaker_on =3D true;
> +	}
>  	else
>  		priv->speaker_on =3D false;

[Severity: Low]
This isn't a bug, but kernel coding style uses "} else {" with braces on
both branches when one branch of an if/else statement is multi-line.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107214714.1139=
2-1-samuelslg03idk@gmail.com?part=3D2
