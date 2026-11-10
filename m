Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794305191;
	b=p9uQejzepOZ8dKomdm0CwcplTDvagOVlSjCwu8z4s8uUiLRrdXaPDb93+NGdhFVzMU/i
	 C1F3tQAem7CyOCAfsSZTACeM7kpK9MS0Xy6YnjwZaFEXjzEQBNAXnDjlIrvTpQ85hwbPR
	 p1FyRGyLmwzAcuqqDetRcft9MPD1dArXXsH9+7nKVuFRaa0NBsvX7iwCyDfL7M+Pmomda
	 ckjW55S600wYEJGbu8viRUrNlTwxACWcxyrahlcWhHBP4MSD2qrUx7ACCjubFlxMI/gnV
	 mZZn1t7rIlQhZ/bWm9gH8K1WNQOLEPNrcLzxysJHIOyRC/oVs3G0TQ6ccZrz4Se6uaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305191;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5HfpYIP010NGD2qYUaCwp7lBLRv4lPVbyoTLZ0rNZg4=;
	b=up5p3Vrw8wy/fZ/zw7DqvYAILWQ0VJqQBV/DB8jVeVhdboDrpO+ZVDxS/mTQveTxL9Ev
	 Jlf2Cq7ccevpxibw77en+pCrfjlqZPtsrZxecjLj011TKAgHXMRgm99PFdgh4KFZG8QDg
	 jzi7/xyPM7mxBvhNf7Be+UrUP1icuoq+xxvIPWWVfUJtEGGC2Cn30/gIPg2yvT/F7qNwi
	 2je/EszEtSdSkV6Br4533GCpFQQcacCYmxvUW06t7iJbJbSnHdET/SQkioGzleWnASiJx
	 G6NIL+mT5mEFGjhlozIKUHeDIC2wUB1FsbWk4Y0apSK+6dxhlZuNXIdRZ+UjtSgCLdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cTw+Mj93;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB00606A330
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 10:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cTw+Mj93
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 161BA1F0089F;
	Tue, 10 Nov 2026 10:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794305190;
	bh=5HfpYIP010NGD2qYUaCwp7lBLRv4lPVbyoTLZ0rNZg4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cTw+Mj93xJvL0neSsdJKvqd7CJ368y4AeVrg3cv86GsItZyi8+ePyrdnIfMtOrJ71
	 XNlRcLwluOdmU/7XUixe3edPmJF6V3oJoTuPPiFiolHfwuJuOh4b47UwxKg/x3EyMc
	 dBuH61SnSrUvtzb5OBbl6PJT+5nL7EaqULTXdnnIFoqWXwaIhghwNAG25x8Jsxghsf
	 /Y114n6ca+nq5/jgkXyaU6OiY7qFPxZS/o6+++oivmK7vPrW0/sp9XVXiXw/RIP9bB
	 ojU3TEt2HL7qAAqjqjsGrac3MGo6tewiOu9xVLKWya4edEcDuirruJWLfd7qSAcbzm
	 Qw51w5rqX5/4w==
Message-ID: <sashiko-outbox-206833@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/6] ASoC: dwc: Propagate optional IRQ lookup errors
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261110095525.504660-6-phucduc.bui@gmail.com>
References: <20261110095525.504660-1-phucduc.bui@gmail.com>
 <20261110095525.504660-6-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 10:06:29 +0000
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
- [Medium] ASoC: dwc: unbalanced reset deassert in dw_i2s_probe() on IRQ
  error
--

commit f22e35683fe4bb23831ac84cbbbb8c5cfc290ae0
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: dwc: Propagate optional IRQ lookup errors

This commit updates dw_i2s_probe() to propagate errors other than -ENXIO
from platform_get_irq_optional() using dev_err_probe().

> diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
> index b0d3413c27d2b..0d2be2d8d31ae 100644
> --- a/sound/soc/dwc/dwc-i2s.c
> +++ b/sound/soc/dwc/dwc-i2s.c
> @@ -961,8 +961,8 @@ static int dw_i2s_probe(struct platform_device *pdev)
>  	}
> =20
>  	irq =3D platform_get_irq_optional(pdev, 0);
> -	if (irq =3D=3D -EPROBE_DEFER)
> -		return irq;
> +	if (irq < 0 && irq !=3D -ENXIO)
> +		return dev_err_probe(&pdev->dev, irq, "failed to get IRQ\n");

[Severity: Medium]
Does returning directly here leave dev->reset deasserted when
platform_get_irq_optional() fails?

Just before the IRQ lookup, dw_i2s_probe() manually deasserts the shared
reset control via reset_control_deassert(dev->reset), and later failure
paths jump to err_assert_reset to call reset_control_assert(dev->reset).
Bypassing err_assert_reset leaves the hardware reset line deasserted and
leaks a deassert reference on the shared reset control.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110095525.5046=
60-1-phucduc.bui@gmail.com?part=3D5
