Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794165176;
	b=HVyowiiaeIp+929klP4BTSX29G1Y1DHEoNDxlqMyzVX6apxFeajTcB/w0WkdpOmq5Z5i
	 VDEG7Bk1H065G59Ymrkke/ey8C1ytRlulraIUmWA/SrpjCt60WOO28Gf3pGFWif9NNGjj
	 fmBv8kg3tRBEERYVhJSC5jNKYP2znw4qzzS7wt2vh7mPsLwY5u9uQs0w1doR8GLrNbjhm
	 Yvx/WVaIh9642AJ9YRaWNooRMykpWRsvIPGTd1ssbGMZAqsc6YGEkqWP20qStBn0PqsxI
	 J4aurfM4i16SPmpxkSVufdRmw4BhLqq3FMeN57KEnRawr9wsVsvJeL3w7kT5GUqqJ/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794165176;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1zsAOi9Xw2SiPNjuduuf/4IY90lVeB5LI7v+9ThAXn0=;
	b=UiVV7XkFhz7W+tfhvnwkNn1yBswgGN3kvOX78lD9+iFQAhnO56vCM0soLHPQfNqpHcJG
	 leUuZNuujnm+bY0C25fLN37mRJEb8v1q42dm6daH2tvEjDDn+x4T9ewwbT4AL8ZbMhHhy
	 vYmvMpyrYn776D3pdvYkTkylSJ11SwWBz3PJr+5X9tCZs7EUqvdfVc3eIMMLxo6c98j4t
	 3mioMxtYqvtdY1EtuuRH+3iWSX8uJ9BEdcDCqQULSU4iBQDwYIH5c/rlO27U1R0OfpdtE
	 pmiSR2uILESo9fV/eRSecl2Mq8OU7iI+CkbmhIpLc96G2CzlkJUZLSZhOL7IdqQhYJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LJ5HUzJJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57812606A320
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 19:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LJ5HUzJJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B02441F0089F;
	Sun,  8 Nov 2026 19:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794165175;
	bh=1zsAOi9Xw2SiPNjuduuf/4IY90lVeB5LI7v+9ThAXn0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LJ5HUzJJKi3+j2nHtvrQslJOXqm9hjlABQk9EmS3vlfmuMnNURhDGg1y+UzSpHGox
	 2sE+Q8IhUpfH7gB6FLljcpZxvtWON9eUV1/y6xQ4cfTx+/xtuR3wzHFWh2q0Ueelr7
	 ttBxLZ1+SWfD23MP1R0tzIjss1I2EArbW0LNR6iXRX+7upyvMXzHIkrVFlgOVXtdpW
	 L6XDuDn+1HGAgdTdYE+awwCw2wsG7X+AW9WbIsfZGK+VzQxaHhwpjgxFhLhVFt5cmm
	 sTt3SZj5bQAMLYBAJhYcdAfSH4XtN9XFifrYISLd//WoQNVQrUDBg00yPavzkiEeX4
	 4lf+CoIwCRV/Q==
Message-ID: <sashiko-outbox-203925@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ALSA: usb-audio: Add ES9219 speaker volume for
 ASRock X870E Taichi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Brian Harring" <ferringb@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261108-alc4082-taichi-v1-2-942558088157@gmail.com>
References: <20261108-alc4082-taichi-v1-0-942558088157@gmail.com>
 <20261108-alc4082-taichi-v1-2-942558088157@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 19:12:55 +0000
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
- [Medium] ALSA: usb-audio: premature private_value update in
  taichi_es9219_vol_put()
- [Low] ALSA: usb-audio: wrong feature unit ID in taichi_es9219 comment
--

commit 67dc6589a98098f31e87c384d4ca4f8074ecf8d0
Author: Brian Harring <ferringb@gmail.com>

ALSA: usb-audio: Add ES9219 speaker volume for ASRock X870E Taichi

This commit adds a Speaker Playback Volume mixer control for the ASRock
X870E Taichi and Taichi Lite onboard audio by accessing the ESS ES9219
DAC over the ALC4082 codec's I2C bridge.

> diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
> index 4c7d68311f204..075fb5847030f 100644
> --- a/sound/usb/mixer_quirks.c
> +++ b/sound/usb/mixer_quirks.c
> @@ -4656,6 +4656,159 @@ static int snd_xiisound_init_fu_pins(struct usb_m=
ixer_interface *mixer)
>  	return 0;
>  }
> =20
> +/*
> + * ASRock X870E Taichi (ALC4082): the rear line exposes only mute (featu=
re
> + * unit 19), but there is an ESS ES9219 DAC behind it that is usable for
> + * volume control.
> + */

[Severity: Low]
This isn't a bug, but should this comment say feature unit 29 rather than
19?  In sound/usb/mixer_maps.c, alc408x_map maps unit 29 to "Speaker
Playback" for USB_ID(0x26ce, 0x0a0b).

[ ... ]

> +static int taichi_es9219_vol_put(struct snd_kcontrol *kctl,
> +				 struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct usb_mixer_elem_list *list =3D snd_kcontrol_chip(kctl);
> +	long l =3D ucontrol->value.integer.value[0];
> +	long r =3D ucontrol->value.integer.value[1];
> +	unsigned long pv;
> +	int err;
> +
> +	if (l < 0 || l > TAICHI_ES9219_VOL_MAX ||
> +	    r < 0 || r > TAICHI_ES9219_VOL_MAX)
> +		return -EINVAL;
> +
> +	pv =3D l | (r << 8);
> +	if (pv =3D=3D kctl->private_value)
> +		return 0;
> +
> +	kctl->private_value =3D pv;
> +	err =3D taichi_es9219_vol_update(list->mixer, pv);
> +	return err < 0 ? err : 1;
> +}

[Severity: Medium]
Should kctl->private_value be updated only after taichi_es9219_vol_update()
succeeds?

If taichi_es9219_vol_update() fails, kctl->private_value retains the
unwritten volume.  taichi_es9219_vol_get() then reports the wrong value to
userspace, and retrying the same volume in taichi_es9219_vol_put() hits the
pv =3D=3D kctl->private_value check and returns 0 without writing to the DA=
C.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108-alc4082-ta=
ichi-v1-0-942558088157@gmail.com?part=3D2
