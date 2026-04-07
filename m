Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53753AA516
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 12:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775564330; cv=pass; b=Bu6xSJKO5rWDgWGv7viGHUOfeMtO/hGnbIkGbkLxZVUMBZnQiv/5S+HiDn4tv/gMNIHmHuEod1a7yjp4TT1j3MPqDowqIvbKUGvH1bp0kjYdSzGWYnXltHNFIetcXJLgh6cRfJQJsHv1Q+mPdQ+xsB0bHNqv1TA4OtjX67d3iIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775564330; c=relaxed/simple;
	bh=QiXTocBbUPCne/DLRORZwb1CjVYu9NENBmKQCLcJLiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MzFAv8mGi2HWA4zPV4XIZlgaFMl9BvLeMMcm7ZPUol1d8m3EFnsHcH7VoDJM11rSgTRelQ3BoY+6uIdoQAOjkOBWRtlaeAdU5hcexEirFp40UVmTHZ5h/zoEAqxXkBFuQvFbBW8V6aNXmIX1wUb8fqGhRjDHbcf22AR2yC1eFsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rICtNVZH; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rICtNVZH"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so3016547a91.0
        for <linux-sound@vger.kernel.org>; Tue, 07 Apr 2026 05:18:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775564329; cv=none;
        d=google.com; s=arc-20240605;
        b=Z6G1bH9dLKgNzObHhlGWwmdlDV7SdDi4BH/8SNIejGR1GfPx0sGqJ0b1QxcJY6j1On
         1fu055E9VBLhEkNs4bWRGTjQahV4YXdYqtXqt7LdSSBNO1+CbeN4B0U7/+zwX6KEPV7L
         xQgECCbseeBnqX3nHxIC4PzqQgTdImmQ6XvKyIFurelRYs1pGKLAFzlTqcgXSWI8Gc6+
         VU8SC8pKLd5ULf4qqPwXlachTK4vbimuK+rKmpZA+6zZY6Ju1skkSoA4KGyghiSy9xkO
         vKSbO/p9YCfByxcxXrEXZhxXbYbondx5BSPX5UGNEccoSfDlnv2q+LwSGiw0ryUSnZbC
         7aiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QiXTocBbUPCne/DLRORZwb1CjVYu9NENBmKQCLcJLiU=;
        fh=x/wWmOf0K+byUeSPaf6Ensgne+Q+bwzplYNI9ITIvck=;
        b=eApCJH5i7zT5EscrLL7eESycOz/utQaLCA17E3qgMV/rM0JWrhEPwXruizHSxA79KC
         Ye84ZLarxyZ/fOZN5ZaFIRpcUOHRjzLvRq5Y0Bu9DXFGNtS70yI1wCF7NAJGY/K8Giwn
         Vw0ve1bxrILVw0a7/VvnsNEaEGa2CTuGFf4WwczvRdGT04kCVEseYCdd8HC5FxmmEzjp
         +216yU8qBaSx4dn7X8GS5ebhxtbVe7yV9TNBhRvqnZKT4voJKOF4BxM96Ol7QS66pKtx
         oJk1xUGl/IA3/OvBWQyxoBgaabK5Abw5eI6VM2Nkj71ZiE8GW9wrABFnPSjAV1Fft/g5
         rOgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775564329; x=1776169129; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiXTocBbUPCne/DLRORZwb1CjVYu9NENBmKQCLcJLiU=;
        b=rICtNVZHlvuEUQMSQ3hmhy+UE1jTn05fdRuyIpvZRQohV5ylwLp46uksjIIeQfnVDQ
         E7VpxBFr3aDPGpD76EtlwyOzeWPxFzUQPHWARZA2l5RAjxGwZ5ZzWU940X0vVMPxkQxU
         skyV2xLZWXuGYTP2EZK89gdbtR6p5D5OPPptb3iMmGGoTNtERM6jCGMyNd+89NuQ5arC
         uY2GedKblbTJgqfxW/eL/pt8c4ZoayDrbZ4f1oHxiE6CuV16kQu7V747bcP5gdnFDuUS
         FsgTMTk5E/DXBR0DzorvE/ajiNUGMAAXu8d/hij0g253zyuNcpRpfDslyRvpYdnxyNYu
         6eqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775564329; x=1776169129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QiXTocBbUPCne/DLRORZwb1CjVYu9NENBmKQCLcJLiU=;
        b=ej+KUSlRhiRccxDSgXx9GdvEpi7L2KV20ZybcroU9mkRcK3Pid/GLefkpkzqB0BW4Y
         RJ00yqQznegO6NNM3J1tonCfbE4raJmsWxpna74eOfntU4RAXNoiZxo8Dtl8TXaALgf1
         dT9g9m2suggiK3Z/SrtaEWuI6eaD1pl6DYcbSU6CtRneQifZbrNizBn7QaJ7rThZVDd9
         ys0Qg5wsXfcpYkdI55T5fvGPrJB685sLgxP9Z8Gm0LBBORpEI8UGMIOCkymq39rNuSU6
         cQsY6gGv8yoLQfj8by8P59HCAXFZ9z/e4/rCfyxjFcEto0qQZl56Xs/LTZ6I6FMzsX2I
         8WIA==
X-Forwarded-Encrypted: i=1; AJvYcCX+xhfMUGK4F9kViceZVyYePiYkCycrC5w5bn63XGYU+NKvACZviEW7ZAiFhEbZxw2WOLvbjFNgvUU9qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdaSUXH7zq/TKSmshlvJPOYpKMMFbnsyPpKmGav5gqfPc6HJZ1
	PmYLclaauMVs3v9HfE9+CKdxR5wlYOsncs+veLdrJZfRZTmRgW+eGxXrU3CSjkU7TDrDnQlRiM5
	hopAfBl+oLI0n0B36uSH04oJ382d/ygg=
X-Gm-Gg: AeBDieuagxLofOe5RfPn7ITP15P878JC+jip8XMGkicae+8BpzmTF4gAiH8vQ4Wx6uS
	I64swzU5ZWe22D48t4Ht5Mg5y+5rVb0CqXokzUTHRv0En5LtWLzC8hvRPbHHpi7kghXtrn4iZR4
	n5Mq9vFXnRyouUz+AZqFQ2hOZr1VbJhHYUNvtkS9+uCMN1ysYWQDxND78jb88My+8WMoILU93YO
	DIG2zS0pT4k6U9bc+jGDsM5ltIogEiphryfSfMbSYDMjxwTka/Wo8MWaP6rWu3AYolHKsUPrOyG
	AYqQwgiDGpNNQ86eD21OHb5Ol+DBiKC+LDY9dg==
X-Received: by 2002:a17:90b:3c85:b0:35b:e553:9cc2 with SMTP id
 98e67ed59e1d1-35de6977d09mr15551822a91.26.1775564328881; Tue, 07 Apr 2026
 05:18:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403112655.167593-1-phucduc.bui@gmail.com>
 <20260403112655.167593-4-phucduc.bui@gmail.com> <87v7e5t16l.wl-kuninori.morimoto.gx@renesas.com>
 <CAABR9nGUyTkDmB0SgKAuM1Pp75L=m1q4bLSfhobm98TswDnt8w@mail.gmail.com> <87a4vfu0mz.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87a4vfu0mz.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 7 Apr 2026 19:18:37 +0700
X-Gm-Features: AQROBzBRZftGMEKWFlfQx7m6sTV7mWUH_AhSwIbAfVFsIBCiqbQ3JqmVTbVg1mc
Message-ID: <CAABR9nH-1eBPFxtzVR6QBE1=esDN8x=hZpAkRSCO-TLmn0tRKA@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: renesas: fsi: Fix hang by enabling SPU clock
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san,

> Ah... is it because PIO transfer ?
> I have 100% forgotten, but FSI doesn't support RX DMA...

That is correct. Currently, the Armadillo board lacks DMA and HDMI support
after the transition to DTS, so FSI is limited to FSIA in PIO mode. I plan =
to
investigate those drivers further once the FSI implementation is finalized.

> Hmm... fsi_dai_trigger() seems strange.
> It seems (A) stops clock, and (B) sets register after that.
> Is this the reason why you get error ? I think (A) and (B) should be
> reversed. The balance between SNDRV_PCM_TRIGGER_START, and with
> __fsi_suspend() are also not good.
> If so, can you use hw_start/stop() ?

Thank you for the guidance. After reordering the sequence and moving the
SPU power control to fsi_hw_start/shutdown, the system hang is now resolved=
.

> Basically, concept of this driver is that power/clock is enabled/disabled
> when trigger() was called (except suspend/resume).
> While your testing may be correct from an ALSA point of view, but setting
> configuring it in multiple places will lead to confusion.

I see your point. I agree that keeping the power/clock management centraliz=
ed
in trigger() is a much cleaner approach.

By the way, I=E2=80=99d like to discuss the fsidiv clock handling.
In the legacy implementation, it was handled here:
https://elixir.bootlin.com/linux/v7.0-rc7/source/drivers/sh/clk/cpg.c.
Currently, this has not been ported to the Common Clock Framework (CCF) for
R8A7740, and it resides in a different register range from the core CPG.
For v2, would you prefer that I implement a small clock provider for
fsidiv within
the FSI driver, or should it be added under drivers/clk/renesas/?

Best regards,
Phuc
