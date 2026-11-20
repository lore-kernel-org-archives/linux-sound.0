Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795183802;
	b=bLfkE4dOkz3NdzOB3v8tRdc+dAJItFK8NmlvYNsOo+w7DDViduXU/MuztLbKyZkMD2Kl
	 8EKmKoGt/0ow0V+Q1WJ8gH9il3qKJjUARvR12z0fACM7F4JYGcS3UJKetJKX6m5d4smd4
	 GP4LhJie1y15xvWb6cIbL7Vi7AAaaAEGFvCo5ErrkaPntNpCrncG9reIFCH5EATwxNzm2
	 mLpSO0fdGVKB6WA4nuDoWn2ohQ2NbRwcN7rGCdaoRjAgQ3jfNb4UTUeCVwS1y39zDMXcL
	 wBywry4FCPj11YhlPR/K8zjgJNRSpapL5uDyY9TC5KOFHCkJ6Ow+7TBigAF1cUjmx3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795183802;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tFjmFxcXe0ZWF2JJWf+bHFY08+mjTowBjuJJs1DSjFA=;
	b=rLxh/sbwXdpuHUyEsHRBhRCTEGDpU+Cl4FEMMTH44Sk+ih5XQLbuwVCX1Qjn6c9opQ/g
	 GUzJr8FWhheHFzC7f4VedpGtpwGVVCDQa/9RP9ipoLT2NW7oWyrYM6hNR8nivEs2nNr6A
	 rtVoaRuCcLJOnbRgD1pfWHHV3/fiji23cYslVpZSMVEoGtR4J+WGGLVm/LVdTAQFcioJx
	 irzYf3C7tTH8geP1rLkFNjuA56DSF3lM9LD/QTIIOBX6huY1IOHE5AQvrQgPpiSVEvjCF
	 tPYZPLTHOfkow5VZj/S6A7F7HKCPzw9H48fd24ee1ttr4jciwnS82bwUZVOF5jruZyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GopLxkQX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D60606A325;
	Fri, 20 Nov 2026 14:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GopLxkQX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 133341F000CA;
	Fri, 20 Nov 2026 14:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795183801;
	bh=tFjmFxcXe0ZWF2JJWf+bHFY08+mjTowBjuJJs1DSjFA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GopLxkQXd9e+PStCBQnuWf2fxxibfYcAVpcZtjVFISFX/7tBXkvwc/VNzEwEt8Vtg
	 /whJ6r606ixL+gb+w0Qf80dWV8FpkvMAzt+0amOzXktSK7fpEZtYzAFrk9TI8OyM4T
	 MczqQ/SkjoWQfQt0GexHcXqgcaY7MXtPS9C9VN2NPjj0akn//UjHsdOtRJCySbEXNQ
	 /BnTrILrMxAMpwDa9dt3mhhKVS77no5jnKWDeCifAUNZ1Anj1z70zYpKnX4g2ox+9b
	 tbE2LQgGo9f/CtznW61cK9AwY3JDdXkw5WJKPcGK1iRZQxeuaaf0emZKjowMjN/mnM
	 DG8+peBxVozlw==
Message-ID: <sashiko-outbox-225329@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: cs42l43: Stop using legacy SoundWire IRQ callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charles Keepax" <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261120135626.2004361-1-ckeepax@opensource.cirrus.com>
References: <20261120135626.2004361-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 14:10:00 +0000
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
- [Low] mfd: cs42l43: missing Fixes trailer for SoundWire alert clearing
  fix
- [Low] mfd: cs42l43: trailing commas instead of semicolons in
  cs42l43_irq_config()
--

commit 1dac89cd53b087ddddba16f33e5c9fbd6eb8fbc3
Author: Charles Keepax <ckeepax@opensource.cirrus.com>

> mfd: cs42l43: Stop using legacy SoundWire IRQ callback
>
> When removing the cs42l43 driver on SoundWire the core will warn of
> too many retries on the SoundWire alert. This is caused by the use
> of the legacy SoundWire IRQ callback to clear INT_STAT_GEN1. This
> implementation defined SoundWire alert bit is used to tie the cs42l43
> internal interrupts into the SoundWire alert mechanism. However,
> the legacy SoundWire IRQ callback is gated by the probed flag inside
> the core and that is cleared before the driver's remove callback
> is called. This means that any IRQs triggered during the driver
> remove process will not clear INT_STAT_GEN1 leading to the device
> being stuck in the alert state until it is removed from the bus.
>
> To fix this issue handling is moved to the regmap IRQ handle_post_irq
> callback which ensures that INT_STAT_GEN1 will be cleared right up
> until the IRQ itself is cleaned up.
>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

[Severity: Low]
This fixes a bug where CS42L43_GEN_INT_STAT_1 is not cleared during SoundWi=
re
driver removal.  Should this include:

  Fixes: ace6d1448138 ("mfd: cs42l43: Add support for cs42l43 core driver")

> diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
> index a83b62064dae6..d36628e8dc279 100644
> --- a/drivers/mfd/cs42l43.c
> +++ b/drivers/mfd/cs42l43.c
[ ... ]
> @@ -917,7 +904,14 @@ static int cs42l43_irq_config(struct cs42l43 *cs42l4=
3)
>  	if (cs42l43->sdw)
>  		cs42l43->irq =3D cs42l43->sdw->irq;
> =20
> -	cs42l43->irq_chip =3D cs42l43_irq_chip;
> +	/* Manually fill so extra settings from bus are preserved */
> +	cs42l43->irq_chip.name =3D "cs42l43",
> +	cs42l43->irq_chip.status_base =3D CS42L43_DECIM_INT,
> +	cs42l43->irq_chip.mask_base =3D CS42L43_DECIM_MASK,
> +	cs42l43->irq_chip.num_regs =3D 16,
> +	cs42l43->irq_chip.irqs =3D cs42l43_regmap_irqs,
> +	cs42l43->irq_chip.num_irqs =3D ARRAY_SIZE(cs42l43_regmap_irqs),
> +	cs42l43->irq_chip.runtime_pm =3D true,
>  	cs42l43->irq_chip.irq_drv_data =3D cs42l43;

[Severity: Low]
The new cs42l43->irq_chip field assignments end with commas instead of
semicolons, chaining them into a single comma-operator expression and
triggering -Wcomma warnings.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120135626.2004=
361-1-ckeepax@opensource.cirrus.com?part=3D1
