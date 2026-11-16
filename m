Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844445;
	b=IOUXO23dLhMSqE68MH0mtl86v+nGCgiHnB6aYthJVESPJDvXzybSFi2z8utFR67uNVsE
	 G5t5yEkN6+O2NuduCHe4YlLMWOGQb5OK8mdOHqU8FVv7ikYttbrKh5hM6BfPm+rNyJd36
	 gddYqF+4Nmqa8NF9F/36pEgwsb6RnzbO7A7g6LI4mIiHjHOJgCWtTzw2CwaFgNOlFpfHj
	 LcEqRLQztKzAgUTdqKP9h8dWby4le5CB1v+xAKjDYmYWZM4rz2xInCm5N8uLy7jsKf3Vl
	 u6cBdA6biTQ72YZ95OY9jTSJnHSbuFHKvo3AvVnyKGq9ILhCczmphezWW8m5aB8ZtNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844445;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BBRt/AesG5I7y1kbPTrJtkiuYsfYfTIzG9dM/+XokUw=;
	b=EuQZeL5L59SFp26Ax134VkYQQ8UwMVvx0FAct5qrkyPMhUWMgoSPTbE7LtuRFE9t+KsF
	 gnQVMLgwsG/a61QyXutjtDLqRPWtYAZLejZd3sTrNrt0dNoDD6F9R4PaE5/6hLJ37a/C7
	 ToMCkC51dzERXa07kzmx2IYxM3g9PluRAhyi6JT7cuLXktJFMTPdGOGLNknh9rGdOhqDE
	 3holF/CYJDwBOueacTDG/O69MnaOavY+MbFxztrP/ZugIHyueN8fdMw0+kjMVlocgqWxP
	 eaqkDLiSVLvP0C8E0zZshua3aF2lcRLRt4sR1RC/ZI/u156OaYeyWOXZu0ALZ4AFhGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FA6EtYIf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDFC606A33A
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 15:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FA6EtYIf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B38161F000C4;
	Mon, 16 Nov 2026 15:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794844444;
	bh=BBRt/AesG5I7y1kbPTrJtkiuYsfYfTIzG9dM/+XokUw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FA6EtYIf+hVy7jD3tTebY4PkbZHlk7wurh+ksh85G58jCzfDZo55zufeprQknxrfd
	 N1itkaUFDJwWe7zHunBoIoM2GWlzeQ0NxHZ/DkhsJ/DB3Zx+OsBibtXBmSytZ176ow
	 TM3SzIijy7UbaxiQbutfXokn6DNsx7YIP3grsLR99TrZaZYYxLPn+3qtLAzvvY805N
	 BilMuW8xjPEIpiqYDxaDvgeL9Qp9uFS/e6TOmHPR6GcnfRrxMVzNNQfZMkjz1l/3/l
	 DO5D1fdk67X73JrPLb4+E5NcLdPYLgKUZkSp85pgzR+DAJTMTzSjaw3P9YGqJowXOH
	 3OFe05oNZYidg==
Message-ID: <sashiko-outbox-217317@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 1/2] ALSA: usb-audio: drive XiiSound playback volume
 instead of skipping it
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavel Artemev" <a@pavel.bz>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261116153521.188570-2-a@pavel.bz>
References: <20261116153521.188570-1-a@pavel.bz>
 <20261116153521.188570-2-a@pavel.bz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 15:54:04 +0000
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
- [Medium] ALSA: usb-audio: init_volume_max quirk ignores deferred range
  init
- [Medium] ALSA: usb-audio: 32-bit BIT() overflow in
  snd_usb_mixer_init_volume_max()
--

commit 2df8ef85ac853457efaa66341d89d1aca5a40143
Author: Pavel Artemev <a@pavel.bz>

ALSA: usb-audio: drive XiiSound playback volume instead of skipping it

This commit replaces the XiiSound (040b:0897) playback feature unit skip
quirk with linear volume quirk flags and a new QUIRK_FLAG_MIXER_INIT_VOLUME=
_MAX
flag that initializes feature unit volume controls to their maximum value at
mixer creation.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D221401

> diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
> index 4c7d68311f204..95877685b7f17 100644
> --- a/sound/usb/mixer_quirks.c
> +++ b/sound/usb/mixer_quirks.c

[ ... ]

> @@ -5218,6 +5159,41 @@ static void snd_fix_plt_name(struct snd_usb_audio =
*chip,
>  	usb_audio_dbg(chip, "something wrong in kctl name %s\n", id->name);
>  }
> =20
> +/*
> + * A Feature Unit volume channel left at the minimum value silences its
> + * audio path on some devices.  Write the maximum volume to all channels
> + * once at mixer creation, so that the audio path is open; the controls
> + * remain writable and the hardware volume operates normally afterwards.
> + */
> +static void snd_usb_mixer_init_volume_max(struct usb_mixer_interface *mi=
xer,
> +					  struct usb_mixer_elem_info *cval)
> +{
> +	int i, idx, err;
> +
> +	usb_audio_info(mixer->chip, "applying init volume max quirk\n");
> +
> +	if (!cval->cmask) {
> +		/* master channel */
> +		err =3D snd_usb_set_cur_mix_value(cval, 0, 0, cval->max);
> +		if (err < 0)
> +			usb_audio_dbg(mixer->chip, "cannot init control %d ch 0 to max: %d\n",
> +				      cval->control, err);
> +		return;
> +	}
> +
> +	idx =3D 0;
> +	for (i =3D 0; i < MAX_CHANNELS; i++) {
> +		if (!(cval->cmask & BIT(i)))
> +			continue;
> +		/* per-channel writes apply independently; keep going on error */
> +		err =3D snd_usb_set_cur_mix_value(cval, i + 1, idx, cval->max);
> +		if (err < 0)
> +			usb_audio_dbg(mixer->chip, "cannot init control %d ch %d to max: %d\n=
",
> +				      cval->control, i + 1, err);
> +		idx++;
> +	}
> +}

[Severity: Medium]
Does BIT(i) overflow on 32-bit architectures when i reaches 32?

MAX_CHANNELS is 64 and cval->cmask is a u64, whereas BIT(i) uses unsigned
long.  On 32-bit kernels, shifting by i >=3D 32 is undefined behavior and, =
on
architectures that mask shift counts modulo 32, matches bits 0..31 a second
time for i =3D 32..63, sending UAC_SET_CUR requests for non-existent channe=
ls
33..64 and writing extra entries into cval->cached and cval->cache_val[].
Using BIT_ULL(i) avoids the 32-bit shift overflow.

> @@ -5265,6 +5241,11 @@ void snd_usb_mixer_fu_apply_quirk(struct usb_mixer=
_interface *mixer,
>  		if (cval->control =3D=3D UAC_FU_VOLUME && strstr(kctl->id.name, "Captu=
re"))
>  			snd_usb_mixer_fu_quirk_linear_scale(mixer, cval, kctl);
> =20
> +	/* devices that silence a channel left at the minimum value */
> +	if (mixer->chip->quirk_flags & QUIRK_FLAG_MIXER_INIT_VOLUME_MAX)
> +		if (cval->control =3D=3D UAC_FU_VOLUME)
> +			snd_usb_mixer_init_volume_max(mixer, cval);

[Severity: Medium]
What happens when get_min_max_with_quirks() returns -EAGAIN during
__build_feature_ctl() and defers range initialization?

__build_feature_ctl() continues past -EAGAIN with cval->initialized =3D=3D =
0 and
the failsafe cval->max =3D=3D 1, so snd_usb_mixer_init_volume_max() writes =
1 to
every channel and marks cval->cached.  When mixer_ctl_feature_info() later
runs get_min_max_with_quirks() to finish initialization, init_cur_mix_raw()
either overwrites all channels with cval->min without
snd_usb_mixer_init_volume_max() running again, or skips channels already
marked in cval->cached and leaves their cache_val[] entries stuck at 1.

Even when probe-time range discovery succeeds on a device with broken
GET_CUR, init_cur_mix_raw() first writes cval->min to every channel before
snd_usb_mixer_init_volume_max() writes cval->max, so if the first write
lands and the second is dropped, the channel and cache remain at cval->min.
Handling QUIRK_FLAG_MIXER_INIT_VOLUME_MAX directly in init_cur_mix_raw() (i=
nitializing to cval->max instead of cval->min, and across all channels)
would cover deferred initialization and avoid the initial cval->min write.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116153521.1885=
70-1-a@pavel.bz?part=3D1
