Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9E339B976
	for <linux-sound@vger.kernel.org>; Sat, 23 May 2026 13:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779544528; cv=pass; b=umYHOVT34BloR1ZCiKb0MdPwLQVmWswh36EMMMCeNeB2D/Jsnib+9WxlOGJLkgdineNT1ulS2+mE6iHq/C7pAWDjlvqwJSuX6dpNE5YLDtlv92UuDw6mly1CmLtHgASHksddN7GiDaM/GSYwpZtgwneJ7hE/qchZMtWDilo2rhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779544528; c=relaxed/simple;
	bh=nlUJXscAj5QuomRn5O6cvpNus9+sfZnlQG7j0zzSF+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GBN12gwfmgJTrVNH7LKPUeqXiyuK/UP615cXkcOs1wDGLQucoMFAfZ+LRXG9eQ0EgYm+euSjTkciHIE4+GicDdPHrNqisTliQdUAoSZykLgXqKLiluxxzr4b5lgi7zq6Itj98VzwAU5+BvN2Nhj4TnaLY3xRhreArNeCigv+VzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ij2rfUCt; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ij2rfUCt"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ba21d32776so60557905ad.2
        for <linux-sound@vger.kernel.org>; Sat, 23 May 2026 06:55:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779544526; cv=none;
        d=google.com; s=arc-20240605;
        b=ZGVLRHLL7StOKoJY4ltF8ifRhcw2eiRTLV1/RBSmDDrxzXG+vwOyXPLFnSPlocsa+7
         GjQ5sTHSk0BtsyKxcGt89NTCtHPTcPYDxx/jRVvqU8UOHWVTrEuWTUxMmk6H4RrnI2jB
         xiD33ySGdFq807YuqEeLkw/ptWST4s6rOhUUTBTAQPFLhOE2l+vgOk89cUnaay6X/FI1
         sQb7Szwo/2gcU9OQXbH2ppQ5lo6DkAkfkDeW8pBA99n9kw0h9KX7E54k6zkofrOFAz5k
         TUOIj3x9vA2JlQQtH5jE5jWy5IK7rnb0x3ODQZjt4AlkGH+BdHdLkWuHDSjcTn78ofQd
         ZFhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nlUJXscAj5QuomRn5O6cvpNus9+sfZnlQG7j0zzSF+k=;
        fh=BX5Dq4pdalg7fUkwWliOJ0t7hbCZMYVrvXBtWDX4lRo=;
        b=dwb+0sruKW1DX7I5E4DajOGLy+HRkpTJt0iKcTTGZuUiademLiyEoFIG3pHLgE2cEx
         Kyi7xj5p4juAE1iLxyY4BCJN4AL2+i/yAFzJnInesjBAedLedwnVuM2j3WUwHDKkXK60
         +1cUAkbusFFQ2+XWccP9dJxeayJKdzqLumoNvFWUXHq5Qf5TmAUCULN5oJD4iTHZ7vDy
         BYS52zDF4S4bPq72PLVFrcm4ZQFbr2IIy3PpreoREk+hpyV42mKTM2XdHK4VI1jMhipn
         H3hxnZ1nC/apbcdvmFvU1W7u6Qyg6iTYwWqJD/kd8jGHReHJV7qEcuxH2TSwsPGR+aUc
         Yldg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779544526; x=1780149326; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nlUJXscAj5QuomRn5O6cvpNus9+sfZnlQG7j0zzSF+k=;
        b=Ij2rfUCtxHVHRg9MM9bxc8/J1PZxizsqHMV1TWNcidDef9FWcqo0CtjOtyeuIeloNx
         QRqqGBmT2cXZrIPYJ888FavervED+dEYQNS+/BEFUqzgAWAdf5ae4vLgtTxZy4yD/dgZ
         5GKCPSg/M4fbjOESh7nb0G2+i/M2Pc89FWQ5xEAwZtoQ+CuYzof9lBPB48aR9oWLuP0z
         U6cCA8PUMDbpEg8Jv6EaOV9cBfZhBqqO5o/q28ig2AadSfEhdWj+Tr/gahHRTrGYKgxs
         GqLSmCY2rUpcxaIOD0dbS7QY3ROpXtjnkPxX2bm1mu23ef1ZrSBs+FJ63RSO5/uzjXOD
         kmRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779544526; x=1780149326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nlUJXscAj5QuomRn5O6cvpNus9+sfZnlQG7j0zzSF+k=;
        b=mVlGxTG2XDGaHlLMfhtrHThXUPTAk+D7WCuRY4tC8Xe27E5kDaaRoPqfEsmTqpHpvd
         1jIKYBDyhlADPSjguJqleOjuce3I7HxZ9WXDhs2ctjT5jFPwJssqM7HkWWuL6shkE54f
         CpW3pyouWcD/3ZzeZ1YTcUOz5VDgbGgAB+NMqovqogPvjrJzhmrru08xF9N28Jqfi02F
         bou5HeyYI514OR0C2rI6ltXryMoeuY+McDBuizRFZNfZ0qYbPLkPQ5JUEP0x0rdiwGy+
         JEWQk69Z1oONzB7L0SlSE8NcB6OeN5U/blkE6mK6CzGYmNzwkv+Slw33ooOv3xLsoERF
         rKNw==
X-Forwarded-Encrypted: i=1; AFNElJ+5xRHNRpcEEqspS6dLo15wpc1ruQVvEGX9R6WLviE8deBt+UYhxJxeThEtGVJBOFO4uOySE1YFvvfmyw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/8BZfKlOrRi8grWXRRQKij1pN4t3qHyJniP/3/3w4BKZLHx+g
	ywjUbZ7y8xCk+os0/uVFWwthx2C2sHPw5M4fYyKIrtrhKwayy/rGM2Fv74TDv6brQvtMTTuTVdy
	RBQbuaudU6H2egffn9hVmkI79pi2eBfI=
X-Gm-Gg: Acq92OFwVUhkkFbsZliaG8VyUkltXRfU7e9X2EQlphxAerZQTaN6EkCpzn0wRVOqT9j
	TaDLxJ+2TvFsmLmIVaeNddrLJIX5dDkGxRAlbikU8ngxNAR5WAme5Fs8UpZ7yCxUK5WLfdsRr87
	gJHMSgrqn89hpn7j+rEPfni8BMPIDhRH8k/Hsm8UbMcapfeqENvzpkiw3tNVBJbTVtkmw73E7R9
	aJa9/Vuu22i7fAfFgKYpW2vlC3Nmb3ncQPN8I30LYI1Kk64ZRL+KCsLyWAOS8Y9tgjvGxq5uVxs
	qU8cGw5oU7cp0pz9bvsgjdWi9sCeZ/LcE1I+hoIKs/vUnMQkfdOyUmhEs2anTv+FpdlH6UwqyhI
	3vzkOa1g=
X-Received: by 2002:a17:903:2c04:b0:2b4:61cc:37a8 with SMTP id
 d9443c01a7336-2beb037a5ebmr84878125ad.17.1779544525740; Sat, 23 May 2026
 06:55:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522095401.72915-1-phucduc.bui@gmail.com> <20260522095401.72915-3-phucduc.bui@gmail.com>
 <CAGb2v67UmMmM7bQOSf3VxsN9D8s3N8nMMX079_kiMcPU=VszFg@mail.gmail.com>
In-Reply-To: <CAGb2v67UmMmM7bQOSf3VxsN9D8s3N8nMMX079_kiMcPU=VszFg@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 23 May 2026 20:55:14 +0700
X-Gm-Features: AVHnY4LdsB2vxkXWpfCH6RC9wHMSLxokWJG9po2ovVtNcvhv5VoQTpPnz_GBIew
Message-ID: <CAABR9nEB8jizn+NrVgrjcOOJRtaU0u+TH705unMTh7HYO=8Wcg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] ASoC: sunxi: sun4i-spdif: Resume device before
 kcontrol register access
To: wens@kernel.org
Cc: broonie@kernel.org, codekipper@gmail.com, jernej.skrabec@gmail.com, 
	lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, nichen@iscas.ac.cn, perex@perex.cz, 
	samuel@sholland.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

On Sat, May 23, 2026 at 2:19=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
> And when you do add patches due to Sashiko raising an issue, please
> do mention it in the commit message.
>

As mentioned in the v1 discussion , this issue was originally reported
by Sashiko.
I'll add the Reported-by tag in the next revision.
v1 links:
https://lore.kernel.org/all/20260513105003.81880-1-phucduc.bui@gmail.com/

> Did you actually reproduce the issue, or did you add the patch simply
> because Sashiko mentioned it?
>
Since I lack Sunxi hardware, I couldn't reproduce it or perform runtime tes=
ting.
But I did compile-test the patch.
The patch aims to fix unsafe register accesses that occur before ensuring t=
he
device is runtime-resumed.

> On sunxi, either it will hang the system because the bus transaction
> got ignored, or it won't as something else enabled the clock.
>

If Sunxi's PM design already guarantees safe access here,
feel free to reject the patch.

Best Regards,
Phuc
