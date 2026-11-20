Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169430;
	b=zZxidCyLKU1txyZ/MKlE4aJyxP7/p3JGIdouwMMSeGYxIgbA2pqOGPdY6D/4kKwP0FQb
	 KfkhSOXqO7IVJDxp7B4bqVJKEBd6H/HzcQ33tilP5ih80SQcvDHTycnb85FkKiw4J9PBP
	 08gp/pGvc3fDYNDw4eIzpDY4VO9Vh+OLMm+8Ju3VNLkP/bMw+ogiE3CuRqb8BtdUwJanq
	 5eJRXZsVzKHypgdnmhfKx9ERRbAT9DagUS8clgW/h8Ih4YvVOLZVZiNlk0471Otm+VtQk
	 AVRCLBNe2LeWasbI3zQJ7dj45ZZ8MksxcinjimOrF40bhoCdXjXPAyZVgSctMPHL79g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169430;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EvwxZkdh0Db4iQKWfKjmhHDvynEiABvrv/BGfHyK+tg=;
	b=ZawWa1HdhJ83yso3oPVQVrUy6Rrq0aXAWwsNtSeJcnUWnSPY17M1LT3S460Vh6ya4rMO
	 xkVN27yBrsBdOPWqL0Szx0B/LHO2b3YNKNGS0Gm1x6ohUzH/miaTtnzT5kN8NWm9EsShx
	 ApmyvawYY+5JR1KBa/FfTd4NcKP7dskQsP1El83eXxsME4zR7AINN5RoEX49SRSourenF
	 OLy1WtzeBxnnqEvFAeK2v/MN0AOAO8V/YoTn4lphA5O55jTCqqoyaTxL0UI3ZGbR4CIuf
	 Go9z86m/HDiZA3jhBdaExu72N5PTWIDPtwwglekYj8ern6MRvs9nPbKhpdWuKU8fbeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fCIxAlSV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA087606A32A
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 10:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fCIxAlSV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36F1A1F000C6;
	Fri, 20 Nov 2026 10:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795169430;
	bh=EvwxZkdh0Db4iQKWfKjmhHDvynEiABvrv/BGfHyK+tg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fCIxAlSVJVuBUAc3tuIosgt9dYbqtbSO/IrH8SB0UVDlVEXxQ/E365DeaP6g122mu
	 mNr+y/40EzV+UTfETl6Vo9SqgVJ4QhHLMRkD6H0Dt+7R8ymXRHeaZ5d0sXolbiECY7
	 6i2e0oNIRzNk70bey8YKAF40oCmSDDcHRW/NOzhohcgD9nCGd/mdf2gLaucXWp9cKx
	 W/2U2L5gm+JII7u7dNR2KiTejfPimwrJInAA3T5wNwqY7qygKQ8EMmukFcwKDBOq3C
	 V1q8zuPPfN4Sa5lilsdomBhAE6TNRydQn09abAZhY68SzsKHnLNYTq7OxkN0a+D8dl
	 oJUzNpnrbQxHQ==
Message-ID: <sashiko-outbox-224911@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ASoC: atmel: mchp-spdiftx: Mark interrupt registers
 as volatile
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261120100408.8053-3-phucduc.bui@gmail.com>
References: <20261120100408.8053-1-phucduc.bui@gmail.com>
 <20261120100408.8053-3-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 10:10:29 +0000
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
- [Low] ASoC: atmel: mchp-spdiftx: inaccurate Fixes trailer
--

commit 8b049b6663dc075bd7b0f48f483d1e20b6fe30c6
Author: bui duc phuc <phucduc.bui@gmail.com>

> ASoC: atmel: mchp-spdiftx: Mark interrupt registers as volatile
>
> The interrupt handler reads ISR and IMR to determine which interrupts
> are pending. Neither register is marked as volatile, causing regmap
> to return cached values instead of reading the hardware.
>
> Add a volatile_reg callback marking IMR and ISR as volatile.
>
> Fixes: 06ca24e98e6b ("ASoC: mchp-spdiftx: add driver for S/PDIF TX Contro=
ller")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

[Severity: Low]
In commit 06ca24e98e6b ("ASoC: mchp-spdiftx: add driver for S/PDIF TX
Controller"), mchp_spdiftx_regmap_config left .cache_type unset
(REGCACHE_NONE), so regmap_read() read SPDIFTX_ISR and SPDIFTX_IMR
directly from hardware.  Regmap caching was enabled later in commit
4bf54ca60f99 ("ASoC: mchp-spdiftx: add runtime pm support"), which added
.cache_type =3D REGCACHE_FLAT without a .volatile_reg callback.

Should the Fixes tag reference that commit instead?

  Fixes: 4bf54ca60f99 ("ASoC: mchp-spdiftx: add runtime pm support")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120100408.8053=
-1-phucduc.bui@gmail.com?part=3D2
