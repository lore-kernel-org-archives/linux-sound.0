Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795203748;
	b=k+1Blq9TWz6yoQvcqwPL6rP3r7YtyGgglRNchY/EHELgJB5KR/xGUOD6pYbXAMw88E2v
	 sKP2L8e5pnFzs3UeDhK7GoxG/E5VNmjvHKFgGCfUPFGt6ZPFhAA8QohCbA1Ciy69h3LU7
	 GtWgedYzo+a44hD4nlle/48mlfr39mSZJcbGxbbrOkuaWtEsNtRGEcsomR1RwQdEYLcAJ
	 A8l+ISKqB7SU2FAWdrVsShH/24z8oVwFGlVqPu14GR2echwominkwAJ1W+JhfOoM282Mv
	 SaDSXd288bsNh50FdPG7ZlQXgYP9yKJfAP6HzOAv7FkljXl9Dg0RpjAnYFPz9Wd2MSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203748;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gKqXFy7fF9OK2YE33xyQTbLoLe6DXzPX87G3l8kNtb8=;
	b=i74mI1C5p3IAlGqiBEOcUnMQcjYIE0doOUes6RO/jKdOxFXtVQcUNh7IVONh4Y0woib7
	 ts4KjwDpqJ8U+oYgRJOLl/2YnbxmDGt5XnNUcqOU0cVOWc9jwFubMbJua8N2bzk7F7XZJ
	 llNDGjGXqqQqkZ8cEhQlSqn/KjxT6GX+AUa425DgLLX/vjwndLp+0sqL98YAdHof9hrI1
	 1O1q9NobIAVV5MM70TDjwaRZXHSDv+IV0BhgllYWN4pcpuTfejsdjPhSV/DjzI0Y4AXta
	 xc4tdXusqUREepDQtM0XaWzLiS+sHUMSNZMYLsRzhtY8t/Bbx1mmWCyQOf3I0kSw3bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KNxna1BT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E11606A6CA
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 19:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KNxna1BT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E93D1F000D4;
	Fri, 20 Nov 2026 19:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795203747;
	bh=gKqXFy7fF9OK2YE33xyQTbLoLe6DXzPX87G3l8kNtb8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KNxna1BT5pboH/EE0OjvJ9E120HAnb0yuOWZgPeGDPt1Ca5cstvGlC+q51zbY1vID
	 AC9pQZO/T1n9VaRsjXfG/7iweNoPoGQAP/qDSEzgGVuZeg8t4m9nIiMV3nta1wGrfV
	 HWc3NmT0Y4VrmIeCcciqpFYWffj2fJVbmcksyzyP4o3PvW9QRGb4TvNL5so0gYj4RM
	 TF+aST9/W1avrN2cCHi3vG3g5cOYiVkVI92P0VNsvA5gYzp2j4wDBAMeZ2FN4lLdAu
	 LOFFrRcKDP6DMm9MR+XZ1Z68Gi3gE5k6bSRmr8IkERTE/IxhBZgLYIfhK+heAuFbmU
	 stULf+PnK9BXw==
Message-ID: <sashiko-outbox-225947@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ASoC: mediatek: mt8189: clear afe->regmap on
 devm_regmap_init_mmio() error
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elkin Cruz" <elkin@google.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261120192237.2870582-3-elkin@google.com>
References: <20261120192237.2870582-1-elkin@google.com>
 <20261120192237.2870582-3-elkin@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 19:42:27 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [High] ASoC: mediatek: mt8189: clock disable underflow in
  mt8189_afe_pcm_dev_remove() [1]
--

commit d8496ec5beb278c4f15ca503ecbd50eb2598abc9
Author: Elkin Cruz <elkin@google.com>

ASoC: mediatek: mt8189: clear afe->regmap on devm_regmap_init_mmio() error

This commit clears afe->regmap to NULL when devm_regmap_init_mmio() fails
in mt8189_afe_pcm_dev_probe() so that mt8189_afe_runtime_suspend() does
not pass an ERR_PTR() to regmap functions during error unwinding.

> diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/media=
tek/mt8189/mt8189-afe-pcm.c
> index f39b01590f714..85b5be6d45ec6 100644
> --- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
> +++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
> @@ -2563,6 +2563,7 @@ static int mt8189_afe_pcm_dev_probe(struct platform=
_device *pdev)
>  					    &mt8189_afe_regmap_config);
>  	if (IS_ERR(afe->regmap)) {
>  		ret =3D PTR_ERR(afe->regmap);
> +		afe->regmap =3D NULL;
>  		goto err_pm_put;
>  	}

[Severity: High]
This problem wasn't introduced by this patch, but does
mt8189_afe_pcm_dev_remove() [1] underflow the clock enable counts by
disabling the AFE main and register read/write clocks after
mt8189_afe_runtime_suspend()?

sound/soc/mediatek/mt8189/mt8189-afe-pcm.c:mt8189_afe_pcm_dev_remove() {
    ...
	if (!pm_runtime_status_suspended(dev))
		mt8189_afe_runtime_suspend(dev);

	mt8189_afe_disable_main_clock(afe);
	/* disable afe clock */
	mt8189_afe_disable_reg_rw_clk(afe);
}

mt8189_afe_runtime_suspend() already calls mt8189_afe_disable_main_clock()
and mt8189_afe_disable_reg_rw_clk().  Unconditionally disabling both
clocks a second time on device unbind corrupts the Common Clock Framework
reference counts and can shut down shared parent clocks still in use by
other peripherals.

[1] https://sashiko.dev/#/bug/linux-7209342b-8b8a-4947-a765-7c521cb675e9

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120192237.2870=
582-1-elkin@google.com?part=3D2
