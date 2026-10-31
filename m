Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793473629;
	b=HxAawl65bz7m0m/J4mQaIuNOXQCMRqzIaZEV6nItr0GTNgOrc+0SLGHSvfElvmZwQFQb
	 7WPaanNYNkMrFSaCzkjkYMqbqzCuMhr65VBMUxWE4uXskmH9y8xe2+3ZpFY4HKfje4A/H
	 dayhtd94fFT4qBJHx5B+ebBNz+kEIE718O6pgl+eTmJ1aXa0SqYKFKnXuWShHetKqdaGW
	 Q4ASFsHtxEIrVRNYjaGHOJ/yw6vN8xsCcXZkjc1iaSP3vdIHZNMPpM5AoIXrDAI17AXEk
	 wodGwWH7GsH2zs4M5F3L3TvJgXfEUYhQj7RXZ6fZ4FuorR8vtv/4fSc2cc4YaUNH/+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793473629;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=U+wrrW2HOSDtjFzDx7hdKCzLBl3TKzwdqLvOxSk+uBM=;
	b=aCwcMJAgwJuB0FvTh5xidAVrF1w1JIwk76/eumitH0ZUymYRzxvM4GmedzsthCZNXmJJ
	 aWQOpYUa9W1A39ZNj14o7wMj2i5MTPRkgKgqeKImGHxrezWDTZae2TaMH6CT9etO+NEqQ
	 gsMOjumwetplWTVAYXTNM4/ZFT8U5xuhU7o2BN8mTs3fjiDQzX2ZmtiMVW/kG7GYBr7T7
	 ovlxUzxq+9i1le5HaIjfbO87bf2XlfkhnvDNAT90fyl6p+hyATgxUnrExr7GTraQH/JjO
	 W23/yOdgwxOkKR2WT5o21xErArCzicdgwj5fiEXQSFpQvXCtN57XgszYMwDFrj8ewYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UMHnNMiA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A5C606A31A
	for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 19:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UMHnNMiA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEAE61F000C1;
	Sat, 31 Oct 2026 19:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793473629;
	bh=U+wrrW2HOSDtjFzDx7hdKCzLBl3TKzwdqLvOxSk+uBM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UMHnNMiAfSk6fPDs47PB66eXoNvf1Svn1c7ww0UJRuldhXB42IQ2EYLzKHFnbu9Rc
	 oFtFUAmAMRJCjzriUdu3dZfs6bDd4ucrPn7EwOJXOM8EGsUx8g/eyZXeFSVoTuR3iA
	 j3w3o94mqvJWDmozYOtziH9Do3hf6qwceV6pOWJg3pj37tvlS8u/WDzKUZdM6DzBfa
	 zUGk7fHnvb7fMv5V+Zg1gHnBprNrAmAdzAtWuULJ4pRtfF/u5JPmMw10wIJaeGkuJ+
	 5hvRu4mz/fl8GB5eRuSNdk+2G9LXnbri0dal96dKOOQbBjSoGA+coM6YOJr8F3G+PD
	 MSGyrfCM/YAYA==
Message-ID: <sashiko-outbox-192101@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] ALSA: usx2y: Release the URBs when the DSP load
 fails
Reply-To: sashiko-reviews@lists.linux.dev
To: "YuanZhe Liu" <25031212351@stu.xidian.edu.cn>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261031185619.18601-1-25031212351@stu.xidian.edu.cn>
References: <871p95svvd.wl-tiwai@suse.de>
 <20261031185619.18601-1-25031212351@stu.xidian.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 19:07:08 +0000
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
- [High] ALSA: usx2y: NULL deref of in04_urb after usx2y_create_alsa_device=
s() fails
- [High] ALSA: usx2y: race between usx2y_free_urbs() and snd_usx2y_disconne=
ct()
--

commit 45a7e14f54ac22210b87cf753196e744d24a4e6a
Author: YuanZhe Liu <25031212351@stu.xidian.edu.cn>

ALSA: usx2y: Release the URBs when the DSP load fails

This commit adds usx2y_free_urbs() to release the asynchronous sequence URBs
and the interrupt URB when usx2y_in04_init() or usx2y_create_alsa_devices()
fails in snd_usx2y_hwdep_dsp_load(). It also sets USX2Y_STAT_CHIP_HUP if
usx2y_create_alsa_devices() fails so that subsequent DSP load requests are
refused with -ENODEV.

> diff --git a/sound/usb/usx2y/usX2Yhwdep.c b/sound/usb/usx2y/usX2Yhwdep.c
> index 7f153a2fcdd81..366167c62575d 100644
> --- a/sound/usb/usx2y/usX2Yhwdep.c
> +++ b/sound/usb/usx2y/usX2Yhwdep.c

[ ... ]

> @@ -201,11 +204,14 @@ static int snd_usx2y_hwdep_dsp_load(struct snd_hwde=
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
> +			priv->chip_status |=3D USX2Y_STAT_CHIP_HUP;
>  			return err;
>  		}

[Severity: High]
As reported by Sashiko on v2 [1], can freeing priv->in04_urb here cause a
null pointer dereference in usx2y_format_set() if snd_card_register() fails
after registering the PCM devices?

In sound/usb/usx2y/usX2Yhwdep.c:usx2y_create_alsa_devices(), the driver
creates the rawmidi, PCM, and hwdep PCM devices and then calls
snd_card_register(card):

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

Because snd_device_new() orders card->devices by enum snd_device_type,
SNDRV_DEV_PCM precedes SNDRV_DEV_RAWMIDI and SNDRV_DEV_HWDEP. When
snd_card_register() runs snd_device_register_all(), it registers the PCM
devices before registering the rawmidi device, the second hwdep device, or =
the
procfs entries in snd_info_card_register(). If any of those later registrat=
ion
steps fail, snd_card_register() returns an error without unregistering the
already-registered PCM device nodes.

On that failure path, snd_usx2y_hwdep_dsp_load() now calls
usx2y_free_urbs(priv), which frees priv->in04_urb and sets it to NULL, and
then sets USX2Y_STAT_CHIP_HUP. However, neither snd_usx2y_pcm_open() nor
snd_usx2y_pcm_prepare() in sound/usb/usx2y/usbusx2yaudio.c checks
USX2Y_STAT_CHIP_HUP or USX2Y_STAT_CHIP_INIT.

If user space opens the registered PCM device and issues
SNDRV_PCM_IOCTL_PREPARE, snd_usx2y_pcm_prepare() calls usx2y_format_set(),
which unconditionally dereferences usx2y->in04_urb:

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
As reported by Sashiko on v2 [2], does usx2y_free_urbs() race with
snd_usx2y_disconnect() when the USB device disconnects during DSP loading?

When dsp->index =3D=3D 1 in snd_usx2y_hwdep_dsp_load(), if the USB device is
disconnected while usx2y_in04_init() or usx2y_create_alsa_devices() is
running (for example during the wait_event_timeout() in usx2y_rate_set()),
that initialization fails and calls usx2y_free_urbs(priv) under hw->dsp_mut=
ex.

At the same time, the USB disconnect handler runs
sound/usb/usx2y/usbusx2y.c:snd_usx2y_disconnect() without holding
hw->dsp_mutex:

	usx2y->chip_status =3D USX2Y_STAT_CHIP_HUP;
	usx2y_unlinkseq(&usx2y->as04);
	usb_kill_urb(usx2y->in04_urb);

Previously, usx2y->in04_urb was only freed later in
snd_usx2y_card_private_free() after snd_usx2y_disconnect() had finished. Wi=
th
usx2y_free_urbs() freeing usx2y->in04_urb before clearing the pointer, can
snd_usx2y_disconnect() pass a freed usx2y->in04_urb to usb_kill_urb()?

Additionally, both usx2y_free_urbs() and snd_usx2y_disconnect() call
usx2y_unlinkseq(&usx2y->as04) concurrently:

static void usx2y_unlinkseq(struct snd_usx2y_async_seq *s)
{
	int	i;

	for (i =3D 0; i < URBS_ASYNC_SEQ; ++i) {
		if (!s->urb[i])
			continue;
		usb_kill_urb(s->urb[i]);
		usb_free_urb(s->urb[i]);
		s->urb[i] =3D NULL;
	}
	kfree(s->buffer);
	s->buffer =3D NULL;
}

Since usb_kill_urb() sleeps and s->urb[i] and s->buffer are only set to NULL
after usb_free_urb() and kfree(), can concurrent execution of
usx2y_unlinkseq() cause a use-after-free and double-free on s->urb[i] and
s->buffer?

[1] https://lore.kernel.org/r/20261031171612.8148-1-25031212351@stu.xidian.=
edu.cn
[2] https://lore.kernel.org/r/20261031171612.8148-1-25031212351@stu.xidian.=
edu.cn

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261031185619.1860=
1-1-25031212351@stu.xidian.edu.cn?part=3D1
