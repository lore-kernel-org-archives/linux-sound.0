Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793311173;
	b=t/bvdaaqT9uN33xRMytlkrdWXSFqIIfkIhDSu0JQQe2UEe8uCPn1uGmNzOylO1HUPOgL
	 ZueZlk0cRv0GyOrgH6D+UobM/BTTCV6tP7YPspc5kQX4+hTesS+u6QP8OGi89KgGf0A24
	 e6uHvZL7VlTtRdRNkbH8QXQCUEmxNasaiz1Qvd48U/8lqZ+muac79zRgH7sBKUHFPead5
	 Hv2HlsCwYZITNEzMb/kxmKjM3fmNh3dBQC4lnKLPHCpRu5Yj+otN4JZwDvyIcESKZnSOq
	 kQeGIySqWL9dRQsIApSlz+KYaKVqDdmnRkJfiLewWC0P3+Y33n+mOETmwKHExHf/xlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793311173;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DZxqNwoK7vg47GdwzjqRdD+EPNNpOm0GFn+AMYsxopo=;
	b=2xtAL3sqFBnIYIwLxMjS/QghKssf7H01tFFzLxOtCp+Z5xsMOKbUcxEgZ8W7ZJQeXeO/
	 LFxvYZyTo3LGKX3cF0Ouy+3VZ8/L7SxDAJUf7zyjeBGQR8T8Qbk/qEAu8oAU3bVjFD80P
	 e6WJxkeJvSwW38SPgRtlDkurJ8nDctqaUx5aXBI+eRri/XK4tdKfgBSiZsCeeDpak9R5l
	 +N4WMTZ4SaMXn7VdtfhP7gRIdt1wrXKJ39zXB8dF37bG8SdJ4SH9X8/e0ke2NuEZCzeYD
	 W2sBo7n29oFOppgMzHaij7tBvB7OnOdzmqiwRQv/1j5ZmT7o6NpHuM0ZPgB7DB4Ocdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AqRYZwrZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6ECC606A321
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 21:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AqRYZwrZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 670561F01824;
	Thu, 29 Oct 2026 21:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793311172;
	bh=DZxqNwoK7vg47GdwzjqRdD+EPNNpOm0GFn+AMYsxopo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AqRYZwrZRv/EiyQRZUw2JtxtO88FBi/WlqmMI8u2Zs4HPHQ1OJaNdXwe86/ezCGwG
	 ZKy4/ek4HI+7BmDDoibakDEKigqDmf2y6PcofjUgqxqMiwzCjKWgBL7aHLDXfLZ/7J
	 tX2gVCBLv1EGUvip/K4TL5tJZsFPjCSTR7LO55ZJYYJPxiq16dQ+JJ0irdGjQXpiqa
	 rcoBC0tUDUuV41cD/wXxXd4oofI3nI/C8dJwDAy7PLu47xOwxN5nQ3p/iXGq71MB6J
	 dgxPVqXeNw7whb7LDduahBphhMZ9BBVpVKE7Jvr3eD0qnIUs1FTAZbPK1+2xhbCzd9
	 YH+JSz7wzuiyA==
Message-ID: <sashiko-outbox-190029@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] ASoC: twl6040: cancel headset jack work on
 component removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tristan Madani" <tristmd@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261029212504.2997364-4-tristmd@gmail.com>
References: <20261029212504.2997364-1-tristmd@gmail.com>
 <20261029212504.2997364-4-tristmd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 21:59:31 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] ASoC: twl6040: work cancelled before free_irq() in twl6040_rem=
ove()
--

commit c1e273e65955a707961d70889d530cc54f85f31c
Author: Tristan Madani <tristmd@gmail.com>

ASoC: twl6040: cancel headset jack work on component removal

This commit adds cancel_delayed_work_sync() in twl6040_remove() to cancel t=
he
headset jack detection delayed work upon component removal.

> diff --git a/sound/soc/codecs/twl6040.c b/sound/soc/codecs/twl6040.c
> index 650836f9615fb..43feb660b635b 100644
> --- a/sound/soc/codecs/twl6040.c
> +++ b/sound/soc/codecs/twl6040.c
> @@ -1135,6 +1135,7 @@ static void twl6040_remove(struct snd_soc_component=
 *component)
>  {
>  	struct twl6040_data *priv =3D snd_soc_component_get_drvdata(component);
> =20
> +	cancel_delayed_work_sync(&priv->hs_jack.work);
>  	free_irq(priv->plug_irq, component);

[Severity: Critical]
Can priv->hs_jack.work be re-queued if priv->plug_irq fires after
cancel_delayed_work_sync() returns, but before free_irq() completes?

In sound/soc/codecs/twl6040.c, the threaded interrupt handler
twl6040_audio_handler() schedules the delayed work whenever priv->plug_irq
fires:

    queue_delayed_work(system_power_efficient_wq,
                       &priv->hs_jack.work, msecs_to_jiffies(200));

If twl6040_audio_handler() runs in the window between
cancel_delayed_work_sync() and free_irq() in twl6040_remove(),
priv->hs_jack.work will remain queued after removal completes, allowing
twl6040_accessory_work() to dereference priv and component after devres has
freed them.

Should free_irq(priv->plug_irq, component) be called before
cancel_delayed_work_sync(&priv->hs_jack.work), or should
disable_delayed_work_sync() be used instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029212504.2997=
364-1-tristmd@gmail.com?part=3D3
