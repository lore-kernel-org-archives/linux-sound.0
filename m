Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793965403;
	b=rdDWk0Ypk5qTLXHe1r1YtcfjExd7Ry0cHM++axAh+huB1wU6fuZ0mVTX+P4hHwJG/qP1
	 BpfwH2jAhikQj7CLH1AlCBzrGGv7opBrYX0UI/ti4xwzJ1V7GJ20t6ZXikRv+s8k9MjEC
	 l06BYogFzg5VSZ4EKfkpbWh25HUuaxWGmxOmj9Ypg9KN7+VuIVeP2cr+pN8fncgb+2/zy
	 QbUVLWIeeawbPT58Iin6UpybsZQWC7DyTDWpnQ+qH4fqvlSDIt5rY+ev0GFanDnZxgcVE
	 Y06BgIDwNLG6RHzKPNCB3fiHG0bQaUbFbeA5jNHdkn76a+17xRO6VHwBBEdbHtjjx/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965403;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LCPHIGvgHV2zJIXsgCPHo9uMdeQGlb2/8YsZ8M6oQBE=;
	b=IkKA/yPytntSo1KTQTgbUKREB5ZQvLa7ElqQyIUuF+PVYIw6eNgjbPilgEJbVuxCi+f0
	 1FNS3WbFXI+IseOz2A86XveSbb1DwAea41MdWpqqbe7ITkR6XwiEahomqIyln7ywMsq0m
	 m0fRvb/yGnuu7mLLXvUJ7lx45ElhMH8hCahDdiWwv6DlEsu4GNl4bMvcooyXY3fK5ftZn
	 hSKiLFaQMW7FIMSNmmLfLsvJhN8vNLyI8Q/kQNeHz9lgyoG1pFt0Ke+PyXa5bNPdiNe9w
	 1yJwoSN49LGlCNZTOHgqUCLc66EbHhTpXnkicTEQoyObZOZs5bNHCPNMedk+16vjccA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QEzkEOrF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C51F606C7C2
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 11:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QEzkEOrF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFB7C1F0089F;
	Fri,  6 Nov 2026 11:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793965403;
	bh=LCPHIGvgHV2zJIXsgCPHo9uMdeQGlb2/8YsZ8M6oQBE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QEzkEOrFS2J4iFKHdPf/TDAtSt4AUMjogQHuVrL3P1SuGuh+gLCWR6M9NTiLjgr6v
	 UrELGlx34Q3Bfj8VY1B32Ma4kTIXwRERQxqHqjRRa7bhqK9EtQ7G1sJPCWD8SfZOh8
	 zl5Zef+DjTc8yHffCprmT2firyDebHft7VMEag8dh4UbJ1Z/UOKLyWCMnAcYwUYHZS
	 YAeXn0HZqjW3hGOPxpiaA3mloPMzf9Svi3eZzVBI7SBRQjw9T59Kc1xNzmvNdOpr1C
	 owwyGqgOatVrjFH6tXD1l2FLXGO5E8ae8v2wmcL0lh6hVc78ZL+nPEE+8Z7sg78AO3
	 uG9D8wfsWPAhw==
Message-ID: <sashiko-outbox-201333@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] ASoC: dwc: Remove redundant error messages
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261106112940.53550-6-phucduc.bui@gmail.com>
References: <20261106112940.53550-1-phucduc.bui@gmail.com>
 <20261106112940.53550-6-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 11:43:22 +0000
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
- [Critical] ASoC: dwc: use-after-free in jh7110_i2s_crg_master_init()
  [1]
--

commit 5c9147e66967380d8d14ec0323b003b6d572821e
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: dwc: Remove redundant error messages

This commit removes dev_err_probe() and dev_err() calls in the DesignWare I=
2S
driver where the underlying helper functions already log errors on failure.

> diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
> index 1ff5b6f8864d6..87b47661e4698 100644
> --- a/sound/soc/dwc/dwc-i2s.c
> +++ b/sound/soc/dwc/dwc-i2s.c
> @@ -752,7 +752,7 @@ static int jh7110_i2s_crg_master_init(struct dw_i2s_d=
ev *dev)
> =20
>  	ret =3D clk_bulk_get(dev->dev, ARRAY_SIZE(clks), clks);
>  	if (ret)
> -		return dev_err_probe(dev->dev, ret, "failed to get i2s clocks\n");
> +		return ret;
> =20
>  	mclk =3D clks[0].clk;
>  	mclk_ext =3D clks[1].clk;
> @@ -830,7 +830,7 @@ static int jh7110_i2s_crg_slave_init(struct dw_i2s_de=
v *dev)
> =20
>  	ret =3D clk_bulk_get(dev->dev, ARRAY_SIZE(clks), clks);
>  	if (ret)
> -		return dev_err_probe(dev->dev, ret, "failed to get i2s clocks\n");
> +		return ret;
> =20
>  	mclk =3D clks[0].clk;
>  	mclk_ext =3D clks[1].clk;

[Severity: Critical]
This problem wasn't introduced by this patch, but can concurrent probes
clobber the static clks[] arrays [1] in jh7110_i2s_crg_master_init()
and jh7110_i2s_crg_slave_init()?

Both functions declare their struct clk_bulk_data clks[] array as static,
so clk_bulk_get() writes per-device struct clk pointers into shared state.
If two I2S instances probe concurrently, one overwrites the other's clock
pointers in clks[], causing subsequent clk_bulk_put() calls to leak the
overwritten references and release the remaining ones multiple times,
leading to a use-after-free.

[1] https://sashiko.dev/#/bug/linux-89ddb741-fe78-4a6e-bfd0-66e1730f7ed2

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106112940.5355=
0-1-phucduc.bui@gmail.com?part=3D5
