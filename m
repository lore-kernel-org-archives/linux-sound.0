Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793467628;
	b=KPUKV7xWNYys+qsvtaOfuMdcKdCFKxLyNIvWMuEK5OB5i/ZfK4Q8muItJLw0MHLsylqX
	 8G8Q/n41Cw8Bglx2aNBlXZ5/WOb4LlXu15npniTCSZKKPmvJ+uIWUCZ7biX44paU7m/m1
	 kirENv5qKmUPL5+2wi6tbxkFMKNgdM+rxSp0D6fyZbo1qQycLJXmq327UHLpcnHORmCl4
	 NLEsp4TP4LPQenXWusxw9WkRtpXSDui4o5UCGrlSmQK/GBc/LJ535PjiaYrlGl5BcKaPe
	 m0SUWwQhHzj/UjnEsZkS5gWkZlV5VdQb6+QukJrEH3Vi7roLKOTAJnmrHoHFfJ0CY0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793467628;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kTapRWKuMqTdKPQ5DZi6SV+qjDLyRCHieDfYAVh/C5I=;
	b=nl1zdEZzgQBYXhCOiImpHNb/SwVRKQ2zoO2CzxAKb+zLCu0HYt+vk0iDtMRSMO+KpfAH
	 rm+OSiW2hcKRd05OCFGLFm9arwHHko6tjBaomgZEOxF/hWR/jpXEe+zCe0INVb3+hlQrp
	 qiTkGVLXda5oOxc/mRvSUBnbdl1ARAFqj5v88f9yw8qP7Z9wA/BjF0cvlTFTudty6KTEa
	 Fm/oMUBo0JRNx+9hWpKeAwDy3ArpNqVSLm6annSTSd4mVTm5LQ36+AxHEWmIgjsBGtQi+
	 uGCqQCz4VApBx/kj5F3RixEHqmQtWrBUMseGredomz6gEyb2ufgovB9xzFUxIzuONfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NOy8a0nA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A14606A31A
	for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 17:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NOy8a0nA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EC3E1F000C1;
	Sat, 31 Oct 2026 17:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793467627;
	bh=kTapRWKuMqTdKPQ5DZi6SV+qjDLyRCHieDfYAVh/C5I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NOy8a0nALVSUb9eMFg5K5mcZULD39rBkbNAEuWYeXNyV71w8uGBpvtivHci17WhIC
	 AzUfTtsGow5Z8TzMola1j7yWfjuJLesT3QJJ9OcbXdal6/CBzx+FqRX5znG4MElnj3
	 S2Tzm8w2i3KWPXhrM0BSd5GsgS+k+xaz8mY34rbEq7sTr7Ge5n0GraFaBqBWh506qh
	 ZiSncX2JzD8fPki0atoQFarvdMB2u/U5Lwhr6B8nqqrStS9RXHJ3G2MJnRnCjdtM9N
	 V2EHfMvq/uXyb6e/hRSS0dJMRna3CKfUfU+xkCgqSZqdo+/BCfAdhExqO1T5R+ih3i
	 Xb8yOzSFvGIXw==
Message-ID: <sashiko-outbox-192065@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] ALSA: usx2y: Release the URBs when the DSP load
 fails
Reply-To: sashiko-reviews@lists.linux.dev
To: "YuanZhe Liu" <25031212351@stu.xidian.edu.cn>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261031171612.8148-1-25031212351@stu.xidian.edu.cn>
References: <871p95svvd.wl-tiwai@suse.de>
 <20261031171612.8148-1-25031212351@stu.xidian.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 17:27:06 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] ALSA: usx2y: missing device rollback in snd_usx2y_hwdep_dsp_lo=
ad()
- [High] ALSA: usx2y: unsynchronized URB free in usx2y_free_urbs()
--

commit 8f4b5a194c16ab573b5c1441a177381d9389e8b1
Author: YuanZhe Liu <25031212351@stu.xidian.edu.cn>

ALSA: usx2y: Release the URBs when the DSP load fails

This commit adds usx2y_free_urbs() and calls it on the error paths of
snd_usx2y_hwdep_dsp_load() when usx2y_in04_init() or
usx2y_create_alsa_devices() fails, so a retried DSP load request does not
trip WARN_ON() on already allocated URBs.

> diff --git a/sound/usb/usx2y/usX2Yhwdep.c b/sound/usb/usx2y/usX2Yhwdep.c
> index 7f153a2fcdd81..13995e81d2ae9 100644
> --- a/sound/usb/usx2y/usX2Yhwdep.c
> +++ b/sound/usb/usx2y/usX2Yhwdep.c
> @@ -201,11 +201,13 @@ static int snd_usx2y_hwdep_dsp_load(struct snd_hwde=
p *hw,
>  		err =3D usx2y_in04_init(priv);
>  		if (err) {
>  			dev_err(&dev->dev, "usx2y_in04_init error\n");
> +			usx2y_free_urbs(priv);
>  			return err;
>  		}
>  		err =3D usx2y_create_alsa_devices(hw->card);
>  		if (err) {
>  			dev_err(&dev->dev, "usx2y_create_alsa_devices error %i\n", err);
> +			usx2y_free_urbs(priv);
>  			return err;
>  		}

[Severity: Critical]
When usx2y_create_alsa_devices() fails halfway through (for example, if
usx2y_rate_set() times out in usx2y_audio_create(), or if
usx2y_hwdep_pcm_new() or snd_card_register() fails), the MIDI and PCM
devices created earlier in usx2y_create_alsa_devices() are not rolled back:

sound/usb/usx2y/usX2Yhwdep.c:usx2y_create_alsa_devices() {
	err =3D usx2y_create_usbmidi(card);
	if (err < 0) {
		...
		return err;
	}
	err =3D usx2y_audio_create(card);
	if (err < 0)
		return err;
	err =3D usx2y_hwdep_pcm_new(card);
	if (err < 0)
		return err;
	err =3D snd_card_register(card);
	if (err < 0)
		return err;
}

Previously, priv->as04.buffer remained non-NULL, which blocked any retry of
SNDRV_HWDEP_IOCTL_DSP_LOAD at usx2y_async_seq04_init() with -EBUSY. With
usx2y_free_urbs(priv) clearing priv->as04.buffer and priv->in04_urb here, a
retried DSP load for index 1 will now re-enter usx2y_create_alsa_devices()
on the uncleaned card state.

In usx2y_audio_create() -> usx2y_audio_stream_new(), each call indexes into
usx2y(card)->subs[4] using 2 * usx2y(card)->pcm_devs and increments
pcm_devs:

sound/usb/usx2y/usbusx2yaudio.c:usx2y_audio_stream_new() {
	struct snd_usx2y_substream **usx2y_substream =3D
		usx2y(card)->subs + 2 * usx2y(card)->pcm_devs;

	for (i =3D playback_endpoint ? SNDRV_PCM_STREAM_PLAYBACK : SNDRV_PCM_STREA=
M_CAPTURE;
	     i <=3D SNDRV_PCM_STREAM_CAPTURE; ++i) {
		usx2y_substream[i] =3D kzalloc_obj(struct snd_usx2y_substream);
		...
	}
	...
	usx2y(card)->pcm_devs++;
}

Since struct usx2ydev only has 4 elements in subs[4], won't retrying
SNDRV_HWDEP_IOCTL_DSP_LOAD once pcm_devs reaches 2 (on the first retry for
US-428, or the second retry for US-122/US-224) write out of bounds past
usx2y->subs[4] into prepare_subs, prepare_wait_queue, midi_list, and
pcm_devs?

In addition, if snd_card_register() fails after snd_device_register_all()
has already registered the SNDRV_DEV_PCM devices (which also happens on
retry when the duplicate rawmidi device 0 fails registration with -EBUSY),
those PCM device nodes remain exposed to userspace while usx2y_free_urbs()
sets usx2y->in04_urb to NULL. If userspace opens the PCM device and invokes
SNDRV_PCM_IOCTL_PREPARE, won't snd_usx2y_pcm_prepare() ->
usx2y_format_set() dereference a NULL usx2y->in04_urb at:

	usb_kill_urb(usx2y->in04_urb);
	...
	usx2y->in04_urb->dev =3D usx2y->dev;
	err =3D usb_submit_urb(usx2y->in04_urb, GFP_KERNEL);

> diff --git a/sound/usb/usx2y/usbusx2y.c b/sound/usb/usx2y/usbusx2y.c
> index 108f9bddf9aa3..8a551abe47dc6 100644
> --- a/sound/usb/usx2y/usbusx2y.c
> +++ b/sound/usb/usx2y/usbusx2y.c
> @@ -349,6 +349,22 @@ static void usx2y_unlinkseq(struct snd_usx2y_async_s=
eq *s)
>  	s->buffer =3D NULL;
>  }
> =20
> +/*
> + * Release the URBs set up by usx2y_async_seq04_init() and usx2y_in04_in=
it().
> + * Used when a later step of the DSP loading fails.
> + */
> +void usx2y_free_urbs(struct usx2ydev *usx2y)
> +{
> +	if (usx2y->in04_urb) {
> +		usb_kill_urb(usx2y->in04_urb);
> +		usb_free_urb(usx2y->in04_urb);
> +		usx2y->in04_urb =3D NULL;
> +		kfree(usx2y->in04_buf);
> +		usx2y->in04_buf =3D NULL;
> +	}
> +	usx2y_unlinkseq(&usx2y->as04);
> +}

[Severity: High]
Can usx2y_free_urbs() race with snd_usx2y_disconnect() or concurrent
SNDRV_HWDEP_IOCTL_DSP_LOAD calls?

snd_hwdep_ioctl() invokes snd_hwdep_dsp_load() ->
snd_usx2y_hwdep_dsp_load() without holding a driver lock, and
snd_usx2y_hwdep_dsp_load() sleeps in msleep(250), usx2y_in04_init(), and
usx2y_create_alsa_devices(). If the USB device disconnects during DSP
loading, the initialization step fails and calls usx2y_free_urbs(priv) at
the same time as the USB hub thread runs snd_usx2y_disconnect():

sound/usb/usx2y/usbusx2y.c:snd_usx2y_disconnect() {
	...
	usx2y_unlinkseq(&usx2y->as04);
	usb_kill_urb(usx2y->in04_urb);
	snd_card_disconnect(card);
	...
}

Since neither path is serialized, couldn't snd_usx2y_disconnect() call
usb_kill_urb(usx2y->in04_urb) while or after usx2y_free_urbs() calls
usb_free_urb(usx2y->in04_urb), and couldn't both paths enter
usx2y_unlinkseq(&usx2y->as04) concurrently (or two threads sharing the
hwdep fd race in SNDRV_HWDEP_IOCTL_DSP_LOAD), resulting in a use-after-free
or double-free of in04_urb, as04.urb[i], and as04.buffer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261031171612.8148=
-1-25031212351@stu.xidian.edu.cn?part=3D1
