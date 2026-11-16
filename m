Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794803961;
	b=yc9mzAB3uIXU22Ow/XKVqZ9gnLhwDkeqx7aXEsBNiDapklwWor51g1r4yTrZDeE9Kbpw
	 7iEFYsXgDK627x4BVkvnHcQNjAhHgZvPy/zSAyrcHAelpvrXZxu2SdgWuI9yUjC3+SPtW
	 OyE9zTG+DG7590agKoZFQob9F0yEP2cUcWG9hiejN9v74+kImmnSBbw/fcBRrdjnSEC3E
	 irYDi9tXMV+FY3q7YE27Lakn+w3JBcYLNQtaxXBaXwFPbUtoHtoGeQ9bV4Tx30lmWrDq7
	 Ecei6PE9ethNUL6/ExhP81bcJKl+uJwbeDWqqO+xezm77qR8P6TlWVvil74xmHhwFew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794803961;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3HNFENnyt9415DX7kkpJAZJkGsW/YAQiYs0ZUa2Dhtc=;
	b=vyuwFcybmaFlEtI8pSMbczlT49y44bkCBCsodgAkfu6iX+RtW1Tyi5W8rndxAICfkk94
	 Azsnr2IbjBJY+JiosyKaJhw8ZrYyqu1A0oQvn6oB+OvQ42YX34v1xThODRgnd+P/fLDNI
	 ZvF+A/SEy00zHF5knz1Ph+7lK9gicc3q8ekl4Rrqo9bHIZeFLqhsY0MYpxoFmZfIeOl+N
	 cKP8zd1Ako+NxLGNUsy3kbYFvJLjvX4XwiJeqc2NqEZ0kj7h04on7vFXfRovl8uyWFYf4
	 Kz2hKcxHnKp2MjF8TPRqlAi6q/AwyQ2Nq0z+i9nVuM3+G2Ksgh+Bg7uaQSplJQrcNcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jOHmQsvA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3893A606A31F
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 04:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jOHmQsvA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A91041F000C4;
	Mon, 16 Nov 2026 04:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794803960;
	bh=3HNFENnyt9415DX7kkpJAZJkGsW/YAQiYs0ZUa2Dhtc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jOHmQsvAtQHMYgTz+Xu+iiRYZwDhkJpwG8J9mUr0ZhoDmLwqDm2Oj2/zXlnq3BNai
	 2ZakfSILLqDFWHf31Qhl/fnTLKSg5DP8ZOW1cOpN/l0FNj25MdmkXVUOxxuhDQKj/w
	 +hjSZ0iJM9frBI4BObS2iqNVdXeYC/gOjnaFaJVsiSHhzMHvXR75IJjCiWuQTboOsw
	 HU/p5w3Jua/W1vFLrfg4FYqVgm7jkcuEqpxAkIYHZ3QF+5NeBOWygzssGhpv6UjTV1
	 CaKyTqMOfrhBIJEQlc52GJ0jioC2BWUgrQ+YnLcMgcpUaOFxujAK1N/P7Q7kssxbMQ
	 JJGjcpxEcNjOQ==
Message-ID: <sashiko-outbox-216193@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] ASoC: atmel-classd: Enable pclk during probe
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261116042633.497423-3-phucduc.bui@gmail.com>
References: <20261116042633.497423-1-phucduc.bui@gmail.com>
 <20261116042633.497423-3-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 04:39:20 +0000
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
- [Low] ASoC: atmel-classd: missing Fixes trailer for pclk leak in
  atmel_classd_cpu_dai_startup()
--

commit 649a4204c070ced412b97a23b481af5d990b2be5
Author: bui duc phuc <phucduc.bui@gmail.com>

> ASoC: atmel-classd: Enable pclk during probe
>
> The peripheral clock is enabled in the startup callback but never
> disabled, causing its enable reference count to increase on each
> startup and preventing the clock from being gated.
>
> Use devm_clk_get_enabled() to enable pclk once during probe and
> automatically disable it on device removal.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

[Severity: Low]
Commit 1dfdbe73ccf9 ("ASoC: atmel-classd: remove codec component") merged
the codec and CPU DAI callbacks, dropping clk_disable_unprepare(dd->pclk)
from atmel_classd_cpu_dai_shutdown() while leaving clk_prepare_enable(dd->p=
clk)
in atmel_classd_cpu_dai_startup().  Should this include a Fixes tag?

  Fixes: 1dfdbe73ccf9 ("ASoC: atmel-classd: remove codec component")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116042633.4974=
23-1-phucduc.bui@gmail.com?part=3D2
