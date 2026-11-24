Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795490296;
	b=iOU0uP4ZAnTmq3LiCRNroa3HiMDKjfRq0BdqfDQ2XCBV4DdIRE+6TsFOJJr2HxGfMQfg
	 AduR9TXqWbyxkSql+PTIPhpt1CmaceP/ngOm6x09PnQ6aohf/zCgujbO9Rib6hCLJ1Qjd
	 Y682HtmdJfp+64RAenVvFhJ5J1kHEnxcURIZKGCLWFvoF7Md33hakMB5VM56Zy91Kjs9a
	 wy/rK3d2RaxbLQXp8uXha/q3yTh/Fnktym0tY0Yv6hv1VrtcpeMo9LIM8ET2E4CrGelRT
	 XBn30D/Ag0TIGUx9NHnN7QzoxoArPyr1/FX4jQMkeErzbLe1ZKsR0jbAJE8DguNGBQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795490296;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yHuW4jaBnbhA6oBc+UhsCIilp/B6BAsefqLjPeUfGVU=;
	b=A0UNT4cobpsfrsthuh1GAlXJZFFHN1Kt4ST6vfhK5fe/mqMuA7NaPJJ3kNFLEaD1tdKU
	 0+KArXG6AtW0uP6hHYCGzWbwd9jR1B/eG8xJmbzfqLt2ymkc7FHilEipv7uTw/lm2QQVm
	 QhBrV6pkUNnMWwTi4zdW6CgSIHZe0jnFJ4zwIGDiYIIdxbBAB2HlIPilPg2ao5L7KmKrT
	 wqOP3cm3I3J5rVcXEFX+BXjKgqglskxg48WAytXgqSpdP81c5XkLkleSxPJ2yxG0F3XQA
	 aJHFyjdqERWdTztaluYRCiW/Uc2yNK3m/7czIto/TU/7tJzxaCUJt5u3e+rmVvmzgdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qwf2cdSI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50167606A31E;
	Tue, 24 Nov 2026 03:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qwf2cdSI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16B0D1F000CA;
	Tue, 24 Nov 2026 03:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795490295;
	bh=yHuW4jaBnbhA6oBc+UhsCIilp/B6BAsefqLjPeUfGVU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qwf2cdSIlgZ9+g1ehKY3sU58LKUukKALulPgFjpJNVWR8vEmd0k8Zyxd0g0Zpd5JI
	 pn6bfgLETKDRjr6uPnJ2PpyrL8LvEomDVzbS2wefNq40hHwXSTNX9auPRXUkKTWBHp
	 3e22bUmh1pwn0CybckwE34wia+743nAt1mMe+vdOzlFGCPRWOcv99yXg6q+RDN82JW
	 9fLj/44nOxHeXmVlKJnjL4C7zHDj1CCBpK+460dYWY6E2ZZuEiAjQessPXhHjqorW4
	 qscOXb0Ahs2n+9vgwqzYFe9tpBrJvgryJ9QRqbK/jIVivnXS9kuuyHdVnbSKNivnjw
	 hmy5wWUrlL6sA==
Message-ID: <sashiko-outbox-230449@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/9] media: i2c: it6625: add I2S audio capture DAI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hermes Wu" <Hermes.wu@ite.com.tw>
Cc: devicetree@vger.kernel.org, linux-sound@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261124-upstream-it6625-alsa-i2s-v2-6-a154685f6989@ite.com.tw>
References: <20261124-upstream-it6625-alsa-i2s-v2-0-a154685f6989@ite.com.tw>
 <20261124-upstream-it6625-alsa-i2s-v2-6-a154685f6989@ite.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 03:18:14 +0000
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
- [Medium] media: i2c: it6625: work teardown after subdev cleanup in
  it6625_probe()
--

commit 853245ce8c11b8ab4cad5a6167d0cdd74d9412b2
Author: Hermes Wu <Hermes.wu@ite.com.tw>

media: i2c: it6625: add I2S audio capture DAI

This commit registers an ASoC component with an I2S capture DAI for the
IT6625/IT6626 HDMI bridge when #sound-dai-cells is present in device tree,
and updates audio controls and capture state on status changes and
periodic refreshes.

> diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
> index 6ff5a5574b379..4a6ab00f04013 100644
> --- a/drivers/media/i2c/it6625.c
> +++ b/drivers/media/i2c/it6625.c

[ ... ]

> @@ -2434,6 +3001,13 @@ static int it6625_probe(struct i2c_client *client)
>  		goto err_clean_debugfs;
>  	}
> =20
> +	/* may bind a waiting sound card, so everything must be set up */
> +	err =3D it6625_audio_register(it6625);
> +	if (err) {
> +		v4l2_async_unregister_subdev(sd);
> +		goto err_clean_debugfs;
> +	}
> +
>  	if (client->irq)
>  		enable_irq(client->irq);
>  	else
> @@ -2442,6 +3016,12 @@ static int it6625_probe(struct i2c_client *client)
>  	return 0;
> =20
>  err_clean_debugfs:
> +	/*
> +	 * Events dispatched by the probe control update or a debugfs reader
> +	 * may have queued it. Disable rather than cancel it: a reader still
> +	 * running until the debugfs removal below must not queue it again.
> +	 */
> +	disable_delayed_work_sync(&it6625->audio_refresh_work);
>  	v4l2_debugfs_if_free(it6625->infoframes);
>  	debugfs_remove_recursive(it6625->debugfs_dir);
>  	cec_unregister_adapter(it6625->cec_adap);

[Severity: Medium]
Can polling_work or hpd_delayed_work run after it6625->cec_adap and
it6625->hdl are torn down when it6625_audio_register() fails?

Before this patch, v4l2_async_register_subdev() was the last fallible step
in it6625_probe(), so no subdev callback could have queued polling_work or
hpd_delayed_work on the probe error path.  With it6625_audio_register()
placed after v4l2_async_register_subdev(), a bound bridge can invoke
subdev callbacks such as it6625_isr() (which schedules polling_work) or
it6625_s_edid() (which schedules hpd_delayed_work) before
v4l2_async_unregister_subdev() runs:

CPU0                              CPU1 (kworker)
it6625_probe()
  v4l2_async_register_subdev(sd)
  /* subdev callback: it6625_isr() */
    schedule_work(&it6625->polling_work)
  it6625_audio_register() -> fails
  v4l2_async_unregister_subdev(sd)
  goto err_clean_debugfs
  cec_unregister_adapter(it6625->cec_adap)
  v4l2_subdev_cleanup(sd)
  v4l2_ctrl_handler_free(&it6625->hdl)
                                  it6625_polling_work()
                                    ...
                                      it6625_v4l2_sd_ctrl_update()
                                        <-- use-after-free on controls
  cancel_work_sync(&it6625->polling_work)

Canceling polling_work and hpd_delayed_work after
v4l2_async_unregister_subdev() (or at err_clean_debugfs, matching the
teardown order in it6625_remove()) would drain them before the CEC adapter
and V4L2 controls are freed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-upstream-i=
t6625-alsa-i2s-v2-0-a154685f6989@ite.com.tw?part=3D6
