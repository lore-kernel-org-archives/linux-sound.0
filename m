Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169781;
	b=YVrpgjdWKvrMNiv/IDuWYL5alJazzVo728RapTlBabaIRkuqcSqZgGCn/dI3bNpkzB5j
	 D95FLy3J4aT0H/Xepn2wZfuzeOmqbe/x7niEtubXH9NkSmAchXs46dTjYZOxeNRPkfcB7
	 MRMsCvVOX0EBHJ7/T4r1rQHVL25Icy6lwMFFkvP8sSwV8/AtUt2zzGFxlN0psOx1OQaSp
	 dd5zpvZDJfNjCkrq8euX3nqmUzOkRGdCfvLm4NLafqp2H1+rcyedSao5XOmX9j8ygXia3
	 CKVwgV0JrjttbZDqhdfbzX/UAxvSkiNmsaWGPSO+W3aXbhiLHL8j7M2NLfEQ3nTSrfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169781;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GQbPN5tZcndRrAvfa5nH27SKjEauo1gESOKsRiYSP6g=;
	b=o+xnt41UMk5kwEg5QuZMnHAcXjE1D9rnYjJwvIO8oXUXCSgwk22ZReeki+xxQxY6OpPN
	 MdN/q+6PeXiaMpDlJ2l6t8xZaxQRQX9LaebUAKtIHwKkdM+qU7EcQ+I5rLPrYxtMMi1Sc
	 FdGv1pUcoTkA2c69u0ZqTv1OoC1AkEn7NNF9RA3vekPjFzxpKV94jZUX2/8Kk3Ha7uIEK
	 o8sG2lxUdOObxwV22DFrqj6/tcBrOJXB2AyNMaeYjNfm3HZn5W+oE5LN0qCWbWNxZtfFB
	 +8PUrSySyB/x86HSPw4Jji+digjksKj/kZ7fuak93TvjzjTTX19KY/KZY0F9mOYUPXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BczyauTJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E1E606A326
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 10:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BczyauTJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E2DC1F000C4;
	Fri, 20 Nov 2026 10:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795169780;
	bh=GQbPN5tZcndRrAvfa5nH27SKjEauo1gESOKsRiYSP6g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BczyauTJeMdwUPfs023G66ukkurpdRP6bpTBYP7FwO4HH0jNC28l/AubyvVvB2a4r
	 rTl7l4zHvJ3p0HRYAepv0k9wo41d4eVEoW4HPgU3sodrpRgWOXeGKjmS4FJNUMP4L7
	 f7wrDNvT6kIF8qV69xofI/XgCFN7v4/nRc/g89b+yXnhVLjFiWM1g8L6gmfd8hblql
	 upsrLUJ4RMlI/b8xyGEfiwDpb90C++6qLClkyjCa75wEWo3E6E/QEhq5rOGLPTQLVo
	 Sz6FoFP9+1VdBT4pIfR67u/t6weJBj/U50prcP4VOa4JAyVajUozSCT5ONM3+vnZGy
	 y7LsI9/NOiHTQ==
Message-ID: <sashiko-outbox-224919@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] ASoC: atmel: mchp-pdmc: Mark IMR as volatile
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261120100408.8053-2-phucduc.bui@gmail.com>
References: <20261120100408.8053-1-phucduc.bui@gmail.com>
 <20261120100408.8053-2-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 10:16:19 +0000
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
- [Low] ASoC: atmel: mchp-pdmc: inaccurate Fixes trailer citing
  50291652af52
--

commit 2524e29a52dc348922861fcb11ff3299de1fc52e
Author: bui duc phuc <phucduc.bui@gmail.com>

> ASoC: atmel: mchp-pdmc: Mark IMR as volatile
>
> The interrupt handler reads ISR and IMR to determine which interrupts
> are pending. While ISR is marked as volatile, IMR is not, causing
> regmap to return its cached value instead of reading the hardware.
>
> Add IMR to the volatile registers.
>
> Fixes: c5682e2ba132 ("ASoC: mchp-pdmc: fix poc noise at capture startup")
> Fixes: 50291652af52 ("ASoC: atmel: mchp-pdmc: add PDMC driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

[Severity: Low]
In 50291652af52 ("ASoC: atmel: mchp-pdmc: add PDMC driver"),
mchp_pdmc_regmap_config did not enable regmap caching, so regmap_read()
on MCHP_PDMC_IMR always read from hardware.  Regmap caching
(.cache_type =3D REGCACHE_FLAT) was enabled in e8c8e9de4ee3 ("ASoC:
mchp-pdmc: use runtime pm for clock power saving") without marking
MCHP_PDMC_IMR volatile.

Should the second Fixes: tag reference e8c8e9de4ee3 ("ASoC: mchp-pdmc:
use runtime pm for clock power saving") instead of 50291652af52 ("ASoC:
atmel: mchp-pdmc: add PDMC driver")?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120100408.8053=
-1-phucduc.bui@gmail.com?part=3D1
