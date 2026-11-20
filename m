Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795192055;
	b=iT0pifzzavjhiP1DzaSrnklKc30LvK9s3ELo9ghI/vyf4GNTUHnTmYNWq2ni8OPofaln
	 H0+Whr7vYg9qu1p2hcgMsSlkIOGfJsqCk+sRkWCBZXqxUOJFbirvNONRvAk/8iHaHhbq0
	 R/R9TMZkDU22a+/PQw9GN6e+BVz2kOFPQhc0XqNE720Pw0aZEp8zJ8bSSHzPThQMMl8gj
	 n8w0Z1zlIKeaetiVC3PUTY+mFtyQpe70aUfyIPxbVCp9gG0xqJJMqrEyUHudUEO0D7Y46
	 MUIrol/g5XvgM2bFx5b1p97LotrvL8qiDrVUpY6KbY5jM+AkGLClOOtw+bCXO177xMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795192055;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/InuWXHd0UQtikhvnlw3dnsO9L69GG2pRoK+yDoN+Sk=;
	b=oPy6nqYRqfS2JNkGX5vupY89wIA5JiQ/2kD21pDhX2a39fulhKV1lSHMYWCnPd2Ao98+
	 n7qt1y6fDIhTr38kFqLG6EEGzwG83FsbdOuvl9ZWCcbSfsM0LC/u48bqlmoveAGCYxSDt
	 it0D1WLKOqthTdR+W+UggMuHw9m94gopLm3wvg338lmAjmANDQ4KGUakJZhd9iNUolvaL
	 hsXt2T2PNnLPwfdy7g8ZxeKUPDOdRGh+f3ykvGUBe/Q9jRu6EmA5mMLoG8aVmeYcG7dFU
	 cjX+pH92BJio53eGQXqF3ezH1IP62Fxar26X3ky8xVzj6A+r/lv52goravDICgjThmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Eby/QDgp";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E80D606A320
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 16:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Eby/QDgp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 447DD1F000CA;
	Fri, 20 Nov 2026 16:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795192054;
	bh=/InuWXHd0UQtikhvnlw3dnsO9L69GG2pRoK+yDoN+Sk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Eby/QDgpaPG4l+bJGfZQbnRbtUIOobLSjVJNvmpFsBmFUUAH0zsQtfgudKyVteda9
	 spoVrU8aS09FSy3IjV1UfaO9vaz/BYHFsng43NnWduUHrvvfSOQVz0dbvIVq5KYfGk
	 PjQ+uBuh2vAhlkXuTDO9f7I0fqLKHgZU6PMAy6neb3L+ttW/OYsihgLPgIb3lAF0Yu
	 u8Y5bLtbCWtiCl1iYssiQfNZN2+D3B54VbXitXhRXAHk+oT255aoUJAqZRNLlWCPLt
	 4+yftgP6kRk5u91I/lkBZ8K3e0Tkp2PFrJvnAv5dId4AC1+gG8+w3WnI5ayJmtBM0j
	 cOVFc4y/rhWpg==
Message-ID: <sashiko-outbox-225566@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 4/7] ALSA: hda/cs35l41: Split System Suspend/Resume
 callbacks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefan Binding" <sbinding@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261120161136.157593-5-sbinding@opensource.cirrus.com>
References: <20261120161136.157593-1-sbinding@opensource.cirrus.com>
 <20261120161136.157593-5-sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 16:27:33 +0000
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
- [High] ALSA: hda/cs35l41: shared reset race in cs35l41_system_resume()
- [Medium] ALSA: hda/cs35l41: disable_irq() ordered after
  pm_runtime_force_suspend()
--

commit f2bfd6268c2ad165c328e195154a7eb4b196ae14
Author: Stefan Binding <sbinding@opensource.cirrus.com>

ALSA: hda/cs35l41: Split System Suspend/Resume callbacks

This commit splits CS35L41 HDA system suspend and resume into
suspend_late, suspend_noirq, and resume_noirq callbacks to assert the
shared reset GPIO after all instances have suspended and temporarily
disable the shared IRQ line across suspend and resume transitions.

> diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda.c b/sound/hda/codec=
s/side-codecs/cs35l41_hda.c
> index 2e2bf231d3fc4..1a192749c7b06 100644
> --- a/sound/hda/codecs/side-codecs/cs35l41_hda.c
> +++ b/sound/hda/codecs/side-codecs/cs35l41_hda.c

[ ... ]

> @@ -963,15 +961,75 @@ static int cs35l41_system_suspend(struct device *de=
v)
>  	if (ret)
>  		dev_err(dev, "System Suspend Failed, not ready for Reset: %d\n", ret);
> =20
> +
> +	/*
> +	 * The interrupt line is normally shared, but after we start suspending
> +	 * we can't check if our device is the source of an interrupt, and can't
> +	 * clear it. Prevent this race by temporarily disabling the parent irq
> +	 * until we reach _noirq.
> +	 */
> +	if (cs35l41->irq)
> +		disable_irq(cs35l41->irq);

[Severity: Medium]
Should disable_irq(cs35l41->irq) run before pm_runtime_force_suspend(dev)
rather than after cs35l41_ready_for_reset()?

pm_runtime_force_suspend() disables runtime PM and runs
cs35l41_runtime_suspend(), which puts the chip into hibernate or
safe-reset and sets regcache_cache_only(cs35l41->regmap, true).  If an
interrupt fires on the shared line before disable_irq() is reached,
regmap_irq_thread() runs while runtime PM is disabled and regmap is
cache-only, causing pm_runtime_get_sync() or volatile IRQ status reads to
fail without clearing the interrupt.

[ ... ]

> @@ -981,28 +1039,32 @@ static int cs35l41_system_resume(struct device *de=
v)
> =20
>  	dev_dbg(cs35l41->dev, "System Resume\n");
> =20
> -	if (cs35l41->hw_cfg.bst_type =3D=3D CS35L41_EXT_BOOST_NO_VSPK_SWITCH) {
> -		dev_err_once(cs35l41->dev, "System Resume not supported\n");
> +	if (cs35l41->hw_cfg.bst_type =3D=3D CS35L41_EXT_BOOST_NO_VSPK_SWITCH)
>  		return 0; /* don't block the whole system resume */
> -	}
> =20
>  	if (cs35l41->reset_gpio) {
> +		dev_info(cs35l41->dev, "Deasserting Reset\n");
>  		gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
>  		usleep_range(2000, 2100);
>  		gpiod_set_value_cansleep(cs35l41->reset_gpio, 1);
> +		usleep_range(2000, 2100);
>  	}
> =20
> -	usleep_range(2000, 2100);
> -
>  	regcache_cache_only(cs35l41->regmap, false);
> =20
>  	ret =3D cs35l41_reset_and_boot(cs35l41->dev, cs35l41->regmap);

[Severity: High]
Can pulsing and releasing the shared reset_gpio in
cs35l41_system_resume() race with sibling amplifier instances that have
cs35l41->reset_gpio =3D=3D NULL?

In cs35l41_hda_probe(), only the first amplifier acquires reset_gpio;
sibling instances sharing the physical reset line get -EBUSY and set
reset_gpio =3D NULL.  With async resume enabled on I2C/SPI devices and the
post-reset sleep moved inside the if (cs35l41->reset_gpio) block, the
amplifiers can interleave during dpm_resume():

CPU0 (amp0, owns reset_gpio)      CPU1 (amp1, reset_gpio =3D=3D NULL)
cs35l41_system_resume()           cs35l41_system_resume()
  gpiod_set_value_cansleep(..., 0)
  usleep_range(2000, 2100)
                                    regcache_cache_only(..., false)
                                    cs35l41_reset_and_boot()
                                      <-- fails or is wiped by reset
  gpiod_set_value_cansleep(..., 1)

Moving the shared reset pulse and deassertion into a .resume_early
callback paired with cs35l41_system_suspend_late() (as in
cs35l56_hda_system_resume_early()) would ensure reset is released before
any instance starts cs35l41_system_resume().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120161136.1575=
93-1-sbinding@opensource.cirrus.com?part=3D4
