Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794866848;
	b=iE8JLU0Rowu161kj/+Y0l051jT5utVWWEtJUIFdv5aHtc7K7KvVC0iBmDg5u8UW0cS8o
	 xZbJKBLq+jZj+u3MUUd/h/g9VwB3cufMUURT9HFJW8h3CJvoXyiD9XYr/ghjQQRMLWwkC
	 wJ7mg+Gn3U3+0z5n84MfQaWZDkSoux9+M2ThQWhr8h1GdkXA87Sahmb3EjaiUXROYmdt7
	 L80us7LY9KcKB4HGhN56lDPg36APtTQDfs9SwRunYQngEUz49+tQayMOFSv3ZeXDhc5If
	 oqbD1OW6kxyXaxEjaYnydwX5jBW725IJPFPOfPJEvZHoq8AlFbetY4Q9+/djVVkwjOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866848;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UIgB1Z89Lb7cIQbZ/HVoIGdCo7WegQj5sXXZD5YXSXk=;
	b=hlcrsgTLURgI9B2+oEONLxmate4OmI4Hb+Dh28+ppXInwGH6Ats/pJOJAgrLXTh1rv0d
	 mTEaBczF/0RdRrSpTblb+3WLJVFCJV0nhKlqr4HQ1KNxwDz85ldDFegM0X+qV9MHDls+c
	 0JzyvVnS+A9U447e3a7VgA45M9DNJSi5ReIY0WATtQa/kn/ou3/Qx9tVzzgE248gq+QaQ
	 UXCAX2nxOwLfcTl0UB71OJ6vAi4+8oN8EKfpGZhx++SQtYkEC+J/rzzPfh0kZdQb8M64D
	 At/Z4POzQmACFgPFN3rYhkYt9WG6ZDjUfycLp9/DzkG1zD4SAD/gdT06jWw0AhomDOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NBEDPV14;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E943606A31C
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 22:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NBEDPV14
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D75881F000C4;
	Mon, 16 Nov 2026 22:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794866848;
	bh=UIgB1Z89Lb7cIQbZ/HVoIGdCo7WegQj5sXXZD5YXSXk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NBEDPV14JoZewZZ6kz3xZET0tdh2NnHVYoVmCY/bDBxhZLBgUIT4k3jAT7ZwcL4kr
	 FLBQ2sO9nKFR5F9uTV7PkKrXLePLoRFn1m2I2ZYnnlz6uF4z7XZ8Ln0Qc+GXBT6ed2
	 SeqVDt7MahHe9TKmJ+dw2v7w2HCTKEK/5E/eCkvTLmPxec8wj2XcAhjGMiSY8gamlv
	 CzsoSAW+iSMfkP1IDS9pXOd2ZRAah0Tr3oRu1PUnko4ac/8st4rzeMIFrcy7wA4Wvd
	 9uULFfyiWV311wU03WOVhYyy51gg1eJ2MaRmX22nAernKPxAZRcnMzlQd4WnSoyqDb
	 CAdQ1A6PVeamA==
Message-ID: <sashiko-outbox-217774@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] ASoC: ti: omap-mcbsp: Use all 8 bits of CLKGDV
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261116-omap-mcbsp-tdm-slot-v1-1-6c9f7aa45a29@telaak.dev>
References: <20261116-omap-mcbsp-tdm-slot-v1-0-6c9f7aa45a29@telaak.dev>
 <20261116-omap-mcbsp-tdm-slot-v1-1-6c9f7aa45a29@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 22:07:27 +0000
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
- [Low] ASoC: ti: omap-mcbsp: missing Fixes trailer for CLKGDV() bitmask
  fix
--

commit 57823beda79b4dd439c729a38d2ffc6f36886577
Author: Joseph Telaak <joseph@telaak.dev>

> ASoC: ti: omap-mcbsp: Use all 8 bits of CLKGDV
>
> CLKGDV is bits 7:0 of SRGR1, as its comment says and as set_clkdiv()
> intends with CLKGDV(0xff), but the macro masks the value with 0x7f, so
> a divider above 128 is written modulo 128.
>
> Mask with 0xff. The only set_clkdiv() user, omap3pandora, divides by 8,
> so nothing changes for it; this lets the set_tdm_slot() support that
> follows use dividers up to 256.
>
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

[Severity: Low]
Since this fixes the 7-bit mask introduced in 81da6a9e49b9 ("ASoC: OMAP:
mcbsp.h: Clean up bit definitions"), should it include a Fixes tag?

  Fixes: 81da6a9e49b9 ("ASoC: OMAP: mcbsp.h: Clean up bit definitions")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-omap-mcbsp=
-tdm-slot-v1-0-6c9f7aa45a29@telaak.dev?part=3D1
