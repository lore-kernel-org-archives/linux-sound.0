Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793965146;
	b=Waky0O4CJkG9ygaOInw+7W3Ll7X7AB5u857MZCoCRTDLk4CdPqZjtg+Sg+Ix4tH+d1L0
	 bO5pgHwHeG/ti9HE28/GvdT8jAomeNf9VB6BhCsuq/LvHSAfQRPqvtzu3KgwRFWjik+s+
	 hx7OnuJi2Nxr4A3J9Fz4dH8OCsPCoT8xZ9VI6tbwizKrHTfmQVggZZ7Qw4QLcBA0jdpeU
	 /MCslb/P+oTmfuJG/TTMMZv87JT26kxuw8NG8c0gBcRQDiq+w/dBwJY5fVxEs0XwilPLv
	 xQavflxTZrjzlQzBwOL3m/DBDBeXc4HpluUXLnSxYGjj8XqCuBU8uvRBElKThVjew1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965146;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hd8Q8f+JfkpaKIYNuTXkeFzccPhjB/qLK1c8CmPIB3k=;
	b=ZYYoXiKu8UJXyXfcKIvOjeq/aGMeD0sGtOMgkQ59vzhz+/SEwwZprW59+twXfR4mbSOt
	 iRAH4wavNca3WNoOKf02IrbgLZ5IWsqw8NajT3Ds+Sl/bYuetimQe55fUS3J1OR/ljiJy
	 nPbE4xNKizbyVimDbVYIWu8hV0iyKbKcAsymLZirMcTLYWJoiOuup7JExLZE2xkUIIE1J
	 O0SiHCSMiFUBfb50GPjqqQpk5f03bWdQKvYbJN1e7TXiAxdnmOeQTC5WGI12UwyFmBxk5
	 ab10H1AFGZJlnMXyvAHypdI8SwvvETGyFiHarsfXOGAlFVQCgq9U4THpl+SrMfj/hfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e3flBlFc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DCB606A90C
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 11:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e3flBlFc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA3071F0089F;
	Fri,  6 Nov 2026 11:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793965146;
	bh=hd8Q8f+JfkpaKIYNuTXkeFzccPhjB/qLK1c8CmPIB3k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e3flBlFcQYG/rGrluA/DjqEZGQmOZjNRwjf/ZFHZKftNdvyv89u0k0JGU8wJtB8Wq
	 U5BA0/33BEYuo1H+k+o84rUNwMsPttLtr7u8ZX251ZxnZVBd0RJo7xZWUOgBdWLL/e
	 IyFzOXs0SRF17vU1K0LLNvNFZBuii331yV5zcImyTMTmk4q4ZPboq1vHZNWzIrOu9v
	 WO+37zDbhqV8jjLrodpIeXWZhyX2xKLvdNUTKrFq/y9rGpoNr94G0wkXNs5o21b2wK
	 l/nHr1OH1em6TIiWh66lyqOHfqiLqRzQrOZu3dBcEgOPtuHt5giRYyEHuRNllmP4ae
	 e1K+oD0CBE4mQ==
Message-ID: <sashiko-outbox-201325@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] ASoC: dwc: Fix DMA fifo_size calculation
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261106112940.53550-5-phucduc.bui@gmail.com>
References: <20261106112940.53550-1-phucduc.bui@gmail.com>
 <20261106112940.53550-5-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 11:39:05 +0000
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
- [Low] ASoC: dwc: missing Fixes trailer for dw_configure_dai_by_dt()
  fifo_size bug
--

commit 8358dacf329eafc6bd36da9f372ae4682d156a1c
Author: bui duc phuc <phucduc.bui@gmail.com>

> ASoC: dwc: Fix DMA fifo_size calculation
>
> fifo_size should be the FIFO size in bytes (depth * width / 8), but
> the code shifts by 8 instead of 3. For capture the parentheses also
> make it always 0.
>
> Use depth * width / 8 for both directions.
>
> Fixes: 52ea7c0543f8 ("ASoC: dwc: i2s: Add StarFive JH7110 SoC support")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

[Severity: Low]
52ea7c0543f8 ("ASoC: dwc: i2s: Add StarFive JH7110 SoC support") only
copied the broken fifo_size calculation into dw_configure_dai_by_pd(),
whereas the original bug in dw_configure_dai_by_dt() dates back earlier.
Should this also include:

  Fixes: 0d274544bfee ("ASoC: dwc: Add devicetree support for Designware I2=
S")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106112940.5355=
0-1-phucduc.bui@gmail.com?part=3D4
