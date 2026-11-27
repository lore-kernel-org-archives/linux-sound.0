Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773537;
	b=0A0njJT0KHAxpmabjPLNeZEeGTlsE5EqwB4ekUagf7wn6SsA9ei1RegSDiTuogYUK2Xq
	 aPUORRQG+wsF3gNBEbmP+SYt9Cc3MFI7oZuHyHt/JOx+7qa0Rty6AlgYM8CFx2BfAIAuA
	 HddmS1S4v5GW4h0LN1zdbx3R5ywUYJvHb9O99RMlwe0P+1HqlfOLCoByKXLHRCJf3wn1t
	 Du1ICPL7Fimq8yz4hiHtHLF518kVQVQb1LcQJ8ROsM8mJd158YNdGvVp0JUf/EeZKZdoB
	 vHAFnMOnu0fACiI19mMcX/Qrd2E1ym+dEkkiOALAx2Of1VCGlB+L6mZDn9tMzo9q5kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773537;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ySxbTEasYpmUknu3HYlfPmP5niyJht+kxuadd4MscMo=;
	b=APe51GQpuBfyCaxRMkKfQxkksjeWjYvrkb44Hte/FYWWXnpFTj8QLsW56lQVH+WVCKUs
	 Hzl6C/UXEK4CHbAxCkGOU1SEkKddNQU0m+t/DFK/xKvH6sh4sx2IuymH/Igd7wnJxtDEu
	 m0CxPOHdTLPIcxl9ONfrxOVWkySfMncgF6m2va8ex8ioW2pI6Bl/anaj902omIec2U6MZ
	 i6EFO4wj9hLDxVmB8mmvzp5cacqtLLc4THjOOmyxl0hm7zvK6Wzt+na5pY0q6H1k/LYTB
	 mV2pWV0FzihVJ4W5jok5tZ8PfzbbmHQe9hMRXpfakzVbUXo9Yg1ck3zXmJobB5FNbIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="A5y3/23w";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3D7606A6A6
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 09:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A5y3/23w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CFA51F00930;
	Fri, 27 Nov 2026 09:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795773536;
	bh=ySxbTEasYpmUknu3HYlfPmP5niyJht+kxuadd4MscMo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A5y3/23w2C1xYYuAJdgykOn/uazCBQj9C2ZobR7ztEr+2MwsuOLzcYzpnYgGPgP/5
	 /2AalQF+UdhaIIz3DieKLkuN3IecnBWQcVyUxEN6XsvWNMMTzpmtvYhcwLDyT+ggLB
	 7923nwrKVrzPI87Mz52RtI8Eh1NDUQLTVGFxLfXAN2P/ZZnynJUjALkqj/zWuhtqC+
	 vjBGPt1ubNm0IwXg8VeNR+GrQlWAJO832P2oMr9RXO3ZGQ/MSrGdim2h2WKGbMi7F2
	 Sa5HPnvGaoQTLYJ+0MYBdt3Zxs0nKqjQSK/PQfxW1zVhFge6o7ozOpuyuY/ctw7enE
	 rRrpdgn16Fa5w==
Message-ID: <sashiko-outbox-237035@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ALSA: atmel: ac97c: fix reset GPIO error handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sreeraj S Kurup" <sreekuttan2156239@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261127095029.3280-1-sreekuttan2156239@gmail.com>
References: <20261127095029.3280-1-sreekuttan2156239@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 09:58:56 +0000
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
- [Low] ALSA: atmel: ac97c: missing Fixes trailer for reset GPIO error
  handling fix
--

commit 656d7dbe132930b3438ef77f14be3d7acdf72afa
Author: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

> ALSA: atmel: ac97c: fix reset GPIO error handling
>
> The driver currently ignores errors returned by
> devm_gpiod_get_index() and continues probing. This can cause problems
> when the GPIO provider is not ready and the function returns
> -EPROBE_DEFER.
>
> Use devm_gpiod_get_index_optional() to handle the reset GPIO as
> optional. If the GPIO is not available, the driver can continue using
> the internal reset mechanism. If GPIO acquisition fails for another
> reason, return the error using dev_err_probe().
>
> Also, check the GPIO descriptor for NULL in atmel_ac97c_reset(),
> because the optional GPIO API returns NULL when no GPIO is assigned.
>
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

[Severity: Low]
This fixes the devm_gpiod_get_index() call and ignored error return
introduced during the gpiod conversion.  Should the commit message include:

  Fixes: 5f10e84934e4 ("ALSA: atmel: convert AC97c driver to GPIO descripto=
r API")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127095029.3280=
-1-sreekuttan2156239@gmail.com?part=3D1
