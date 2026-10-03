Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BD2190473
	for <linux-sound@vger.kernel.org>; Sat,  3 Oct 2026 00:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790988162; cv=pass; b=kI9AAb3DoKatFkIvaBEKz9CS4HFnpKyQmBZ4Q0dm/JMlML5nPG9Q7KWlJ9ZMWnKieHg0jtH6YtxXI604YRb4YCdQibY7XaCykIPrH/kofqYe5RpN/vpBlHpT8SuI2FddKVOUBaywOn6vUQEO6t1qhPzeQL4ejqkeek73LNYL0Z0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790988162; c=relaxed/simple;
	bh=ML6NEOBBfNtXpryfGQbo4Bek1EvjVxfFHhmjTthWptI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tvyOM462q8m1tYpPdfTv9JstJmseBmhYwikF6aJ2oO0OgHzEIAltLV6erUUYQCF7Lt5KNdDi9iOfgwofTCwOEXrKyRDGfqcmfRY43yo5mf5bwNz9BAApopD5e7+nEvzbEihrez4HCTIrFY3nwDoEVQqNKin5FLT+0InHtDMZFus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CA3Uw51c; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CA3Uw51c"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4c3304833so148a12.3
        for <linux-sound@vger.kernel.org>; Fri, 02 Oct 2026 17:42:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790988154; cv=none;
        d=google.com; s=arc-20260327;
        b=Y8pZA4QjjBuKLZLIqyOCRISDjOuJ847N11VCskTCej8Gd4MDX06zM9elmZsrcDmKOf
         fcm2916Orhn66YmDgD4OI+DefDmWvZRmC4cOMTFL3p2Ip0zPRtpz6h5OVtd9/+9b5Bmz
         QsQdvyNMSDwHMW3xGL4d0Ys6UCwk6tlwYoKm6GDJeW6aNJzIO/V4x9jUFAUleDn/tpS6
         x0KCRcxKdi4EWJtnFQBcZSXEEoVTnV5ZNLLY2r9njkq01zykQR6G0RHrGxXs5pFE6pds
         4x96jjzh0UfittlWTC62wKwW0DbNwDUFUAILbj84Wl4vB+MlYGf2n45eHgMU2FimF60j
         Jq2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ML6NEOBBfNtXpryfGQbo4Bek1EvjVxfFHhmjTthWptI=;
        fh=Tu8oluxvI3v1lRGE/oInN6zTxxDrWmHXJCVxniOfz7k=;
        b=jZ7A/84d2po+3yvezn4EPrH5ArhWE758AM+AioCem7o9YExD5TFsrLk9TXT5IBiez4
         jwoEdLD4oOQqrZSgt0Q8UB6oYspJSq9q4jdJhbCbDWqAqGN9KNshDWBAuw0rF43MkdnU
         bgbczUUJEn9vSx2Ugpek0pKX+vrlsxgVSw0eN1RSfn3Ne80y7vd+rcnHiNQgjLC3/+De
         g/AWemLQoDOxPj5ZAhrsCkEnofQ/BdtOdz2iXmh3TATY+CQk5gTXBDLe3S2sSVcmYk/7
         8T3SeFUtt5naj8b+0L3MQBvr4f/Bw5Y6FA2lvAtlsPTC45OHhiVIhqCXmqjuKNCYdSlB
         1l9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790988154; x=1791592954; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ML6NEOBBfNtXpryfGQbo4Bek1EvjVxfFHhmjTthWptI=;
        b=CA3Uw51chd7eshmFNbmSJdfqxCU+/LIpRfYCfH3PuTskuV4G6XzTbwckILDGiMf628
         dqRFfRsRgP+UdDxMMClRTboJUOFvA6BymbnVoPQ51oGiHl7P0nZEV+gHuf2i58CkWTzx
         lwJUNLj1umAbv6/9md6EGSWZziws1YD3+Lsguw6OfnpZaHIFU74/MVqaKbVzmyzFvUSI
         Qx/VyLeBHS9rsJKvdDSESU6GsNNKR6YXOVwoWGORCtLE19mUNBe9eIvLdrMzNEzxj/4J
         +bG/19jEi7/HwSvgl/yFM1dkCv9z0JyHGNVjeNpN/aeL7E2reCo6YlG/SdVuNi0B2LTq
         CVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790988154; x=1791592954;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ML6NEOBBfNtXpryfGQbo4Bek1EvjVxfFHhmjTthWptI=;
        b=S4DR10Kk4fKN5sfzCkUfvxUsDEcLp1NFm7IHH1rLztV2pkbHWqZQwjBcuevgCAGEh6
         sdwpBPxxz8OoJJIXgK1UNTngHoQYE9e6jSnsU+91+tgIbpR9S1Vw1X1RX30pSW4H+QNS
         VNjUyNccaWHPv4aZ7hoXYpxa+76yblnmWONaq79CVuPYOJSECFYf2DYSo22zIL+Re7/7
         8+GUwxh3OXtWeTRe8ysT4LxrM9iTParWCLvDfvjcMa5F8rrXbVM3n9B4AzZ3oDSvd9mb
         ZZ4z+PI8wtNqrUVXMxtnnKDsPnmeolYYbbc9krtzbWD73mL3B81/izdv7w98765DSKKg
         4w7Q==
X-Gm-Message-State: AFq9FYJnfxtC4R1xpf+AQkmf9fIqyAcCBpcdsZfVIxQlsG+21p08GPqH
	OHnukvZWgEcKzPQIDulR5SsK1I9gld8eXlsuwOL4WZovDbvmAfl+sEbKnT8j+LwSjGk4fwyPuOT
	YmaZ3yzSIc91VF12toW6+YQd2TSiZmBk=
X-Gm-Gg: AYBFou26QMx4c86ITs0O6v4v+X18tLM7tOB6PZkrsxwhy91l86+sIzI/46HP7WXHF1A
	d+tnMB6emBRm4wPIGxOp9W+EMTte71hMI585PhPvCA3+nyLlhUx8emMhOM4daL+cIUalzzPB+Fn
	isbOhRCWZBY/Ei4/AfYdgcELJiguAZQlfEIHFKO+xvGKeHpjY4sSZM1gjLfILQ2N52mUuOEN+mh
	uEA55c65osSaxwZq80+MbDBa4VUSwSulMo+8xZpS+4BsovT0Szdfyvifp1XQY4rfL4wghj4+xIy
	y0D51p5femEP54gTS1Ps0IBDb7G0f4vg6la1/GTvZOWW8F1zDTPgJsYtL2m55x+WDL8Mcd3N08S
	wkMRX/eThBLz33p+vcFuXCdtCxKnMUAcR6GTlT5dl0sRExhJGU8VB2O/4Y427ufhRmWaSZU4QfJ
	aFi9ufv+1gXqc4CbiMG0hz9X9nkw==
X-Received: by 2002:a17:90b:3b84:b0:3a4:948d:9dc3 with SMTP id
 98e67ed59e1d1-3a6ce6b409fmr3782543a91.21.1790988154507; Fri, 02 Oct 2026
 17:42:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20261002092341eucas1p106b159afbbb9f78eb1a7f9bfaf2ff376@eucas1p1.samsung.com>
 <20261002092336.585546-1-m.szyprowski@samsung.com>
In-Reply-To: <20261002092336.585546-1-m.szyprowski@samsung.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 3 Oct 2026 07:42:20 +0700
X-Gm-Features: AclHuK-JXzzK1cJIteyqpSei_lBae1PIJNwKuBcphGKFtrT7QViNmH3OD5BCvOQ
Message-ID: <CAABR9nE9zGHbABn2+=+zOsGTvDbLsCYp6RWMkK0RyJF6c74ooQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: soc-generic-dmaengine: don't request default
 channels from dma_dev
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-sound@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

Thanks for the fix.

>
> Fixes: 9167f260477b ("ASoC: soc-generic-dmaengine: Handle DMA channel request failures correctly")
> Assisted-by: Claude Opus 5.5 <noreply@anthropic.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Note that the bogus "rx" request predates 9167f260477b;
the failure was just silently ignored before, and my commit
only exposed it. So the Fixes tag might better point to
the commit that introduced the dma_dev usage for
the secondary DAI.

Best regards,
Phuc
