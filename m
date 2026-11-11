Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418609;
	b=EbiFEZmk/pQzixQu8UpJJJIg83roaFnFSh2yibeUI33kWdsBUyFzV9NS2VLjxhkf9Ljp
	 2KWaXRsnsmSSKa8qe+x3fguXa4tHjv2B/sRuHRQGF3tf/RN08/9ydbCDhem6W7FDyT2Kx
	 cL3lfguIJOP4MLoPiBPsEmSebgTTWmbwxcoNi9ep/SSSK1OpkotHEY7kTgZtnJjqML8d+
	 tWfR3g/VZd439WRIJPIWX0ijbH/Wy/m06vq6Fk06boibQpjpH/AATlHf2ZzCSbXQoe9g8
	 BLQZ4eTBDA0srrtbmP1T5iqwma5Y1I/odSyO/gbFIMrHnyQ80CLbhfi2NCmlYBOrEZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418609;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vN8Uwz7K/RJgoFMcc7W5icB0xZp27mmbAKXy27PjhPU=;
	b=b/j25WZzvg96SP6myfTZJzT8dqFI9EoSJA8zBXUQ0Igopv3yscIvQJ9AotJScf4SIaO5
	 sbawJ1h8kvLp2iUytGQvGBohWcnO4+i4eJaMaq9MDYcPINNxmOKLUiwa5K+pFk5ed37dA
	 AwzbXdJokcOjG57RBDCKHrPrUYBIblF7B4iOBmrBHt5UQoT6CedTQdBipGpPcFaBOydrW
	 zB+dkXqjnQ3hxWgjJsP2yAMGpr9iLFyuhApfZlkvqJaGsoZwYOA6tSnKyY4fvSunkep/m
	 RR3PDX10GJCHRFNSfBNf2wqoixv0Tce2uhv5ZZS6ZJYhFWVrgjut9pEuLvybXmDifdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=omi76W6o;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACF4606A321;
	Wed, 11 Nov 2026 17:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=omi76W6o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7982A1F00A05;
	Wed, 11 Nov 2026 17:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794418608;
	bh=vN8Uwz7K/RJgoFMcc7W5icB0xZp27mmbAKXy27PjhPU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=omi76W6ooFQ7eKanXp7NVqdAOi+kQSz6QzCh45P65o87gpbD8O5nEyIHNaTfIX6Ts
	 2dtExH59k3wncSReYkhRCZJ2pju8Qhk+NDHUk588UWCCUUstqRevMrQbistyOdcy0K
	 brgE8LSruefYGEMPRkjOGj2DVV5SDde/LQlb9bGC9cmeKaw9Urj3oIYRv4byZxlAV3
	 KLhu8+LAB2Hgg8jynheJwdImafEWrYTjWcSTYHYIuVGZHRSMojsJi1vL9rX22jfCay
	 5GjJgk/Kapt37GAukvf+iLSG2DzTbALllcZQ3g+oYkdTG6SkGzIvaIg9HeBwnmRCaS
	 dk09qf1n6Sa5g==
Message-ID: <sashiko-outbox-209423@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] mfd: cs42l43: Add load detection register needed
 for cs42l43b
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charles Keepax" <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261111171032.1491717-2-ckeepax@opensource.cirrus.com>
References: <20261111171032.1491717-1-ckeepax@opensource.cirrus.com>
 <20261111171032.1491717-2-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 17:36:48 +0000
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
- [Medium] mfd: cs42l43: missing CS42L43B_LOAD_DET_SEL in
  cs42l43_readable_register()
--

commit 86bb228eefe713b198f8b6a31cc740c008b39cd7
Author: Charles Keepax <ckeepax@opensource.cirrus.com>

mfd: cs42l43: Add load detection register needed for cs42l43b

This commit defines the CS42L43B_LOAD_DET_SEL register and marks it as
precious in cs42l43_precious_register().

> diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
> index a83b62064dae6..4e5d82c355ee3 100644
> --- a/drivers/mfd/cs42l43.c
> +++ b/drivers/mfd/cs42l43.c
> @@ -425,6 +425,7 @@ bool cs42l43_precious_register(struct device *dev, un=
signed int reg)
>  	case CS42L43_RX_DATA:
>  	case CS42L43_DECIM_INT ... CS42L43_HPOUT_INT:
>  	case CS42L43_MCU_SW_REV ... CS42L43_MCU_RAM_MAX:
> +	case CS42L43B_LOAD_DET_SEL:
>  		return true;

[Severity: Medium]
Should CS42L43B_LOAD_DET_SEL also be added to cs42l43_readable_register()?

regmap_precious() and regmap_volatile() return false before invoking
cs42l43_precious_register() or cs42l43_volatile_register() when
cs42l43_readable_register() returns false.  As a result, writes to
CS42L43B_LOAD_DET_SEL during headphone load detection are treated as
non-volatile, cached in the maple tree regcache, and replayed to hardware on
every runtime PM resume during regcache_sync().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111171032.1491=
717-1-ckeepax@opensource.cirrus.com?part=3D1
