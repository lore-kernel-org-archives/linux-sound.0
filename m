Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD7F50EC07
	for <linux-sound@vger.kernel.org>; Tue,  8 Sep 2026 09:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859168; cv=pass; b=Q09nyxmEAp6K1J6RHsX2Pc0LRCjFbKEPpLsj1E0+QZiBjobHY7ctVRg1NUR/wi29lajqhZr4DUu1zbl64Nj756+3Ndg1IrAQLjVh3gzDDMVEuih9dh3QN2xCL3pK6d1TS2GKZiey5ASmDHndNw8HKtW/cZFeJksKtMDFKs5sd2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859168; c=relaxed/simple;
	bh=1CJ3Fj5ZeETTIou3X8k81+BylqMvg1us8lXgPWVlAw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RzNklgMeB3Go2C6i2fwPFp8C/8ikDNTm9tZX3Fw4Buje39V6OqBLLG/jF/K2WH9OwSVI+unXafMzQP0MjFqsnp/IOFGhl53ZmrPwMNg5gFGSQ05VubB37jgQI/e5c+VSLXIqPJizmKKFOh2n2ZkI5e92h3W2xIy2yVXOyRGueaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+XC3HIE; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+XC3HIE"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d6fe26ef1cso43309845ad.2
        for <linux-sound@vger.kernel.org>; Tue, 08 Sep 2026 02:19:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788859167; cv=none;
        d=google.com; s=arc-20260327;
        b=SfWW3T5lsVA1yZ9dYD6EiIM1wlTofH+PWZqVvDC6VYVlRhYZrn1kQ5tZ3AzvKnU63e
         mtnuKyHW2Tq3iqdWgh2PzID2qHejC4GkFSh6wj9Fh5JEUPwWfUMpH1Lllw1l8v/ty07w
         ViU9kQOPJQLdKuPjmVyu3ynGcjuFlkoXLnHnRTMP9rCtA4ZzgNdS7EzMcTLIQTuk5xs1
         WEg71FlQ++fH5LgrvpEaYDyZSVM8kTEgko/qmmsGVMRK17CUKD4fEB4tX0OTY3cY5FvR
         XiVT0+YHjn61wQGcadh8L/+6Al/+MAz4l4r7A4gNYeyjVgSzvbS8X5IEd0XK/J7dfVSP
         qgGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yG4Pnz01dW2S7kM9qcZcTMa47qByQxdGgpfF/vR9rUI=;
        fh=gw2Fznk9mpxdQcuDmzxB3dbWG0xgAnACG+8N+SjDh5g=;
        b=rtM5HRstTjzLWOM/mKXmbbe7nGCHw/YsdJQ3pu8qsVVsd5EM1iciZViFxAsSlGlg4g
         QaOOr0y1JTL3wEAUe9EeI3Ggrx0MRemS5lWCGoC3sYWCLZGrkbq8BwfpFsVwr5+MjLB6
         h/7Ib4v+JiB4LFd8uW71+oC1QnpTCl9GDCG5nCojk3D7d7fFr5N/Z4r8VAEIoSdmIqmL
         2dYiSChF/67/ItBKE7/w96WWLHXu0oTVr2jL5BrXZD08CvFRP0mrszX1Wngck7MhJtl8
         9q+LPsbRDRtGogmnUB7zUtVRhbDMrLs/0/NLSArIMI1pOgXkfCDBn7E2LYcUcxi2BsKJ
         J85g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788859167; x=1789463967; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yG4Pnz01dW2S7kM9qcZcTMa47qByQxdGgpfF/vR9rUI=;
        b=O+XC3HIEh4BvShXFCFAaXRAFIX46peg6MtueGCced9Gl6ZE3xOxNkfco69Lfy3plI3
         szB4t5ssfobRGXsPxZgr8QvO/8va2hII6m/9oMSj5+0rD6wWoFT4BScsIJL9lO5gWEWX
         gDItRBp2o/heh/OfsLdLVFnlS7VWf3B4sZenYi804DwdILHrM2TzosHoRq4R3X0ldary
         VBP1R9T+LCZZivgjKOTkvUCYyWWfbxkyx91fQIF/j25ldADwBKnBgtfJt8T+iBBcqVh0
         1ytdA2H2jShNv5YGSmnMpi2Bm9dYa1HFfB5YbZmAxgfAEv7+/6ls9rDEboZlhOpJKm0q
         lqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859167; x=1789463967;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yG4Pnz01dW2S7kM9qcZcTMa47qByQxdGgpfF/vR9rUI=;
        b=bMdVmrgXz7v+370ortISseT1xoVpMPQIfE+LMthj1yJ/wrmb/avihkHc0bDfP/huPp
         G5Pe4jHFRPTB+XCiiYXLUBk6m0AQBv4fdQoSzT9gzVMLsxAD7SdMEGHmpvCXSWkQwPML
         zb+7Gb46FNh0GMVLSiWII+N6wJLYFgD/lsi1B0nCGvjSjxiJBNtX12RKnl2C2VuAM+zh
         N52tWQwdA8CkcFf9I1x2UO25dTyxQgbHLoqWeUgz8ZCseBl4mnEJU6xdiO7CY5EbK4kU
         9m9esWnxzHIFoQXb0Isnmyfz005LdO1pFNqQfHETmaXrV2fYP5QyeLLRZTZNrVb/LbVw
         qglw==
X-Forwarded-Encrypted: i=1; AKwUvBydxagJLMD6YZL3QZ67GJfaCuOSZw2MUHAWu7ynYNdmXLJmJrYGMDuKqVqiYa6ss4zb/+csr0QNUHFOcg==@vger.kernel.org
X-Gm-Message-State: AFuF++mRmqSu+1+rpjQsHmuBU94xdf/VnfrJ5AwXoj0ixC5c4TjSeS3Q
	KyfE0kaO80nl5T+YU+upVqZGZrOVBunxKRyUzPrCtwwsRaolXu+BI1wdPiSKuDEAuJVLfgSW8t5
	hQ7B0BCZTz3aK9SicZeRTrc9BIfccuBk=
X-Gm-Gg: AYBFou3SGXk3HdAqM5+Ttxd1XVludIe2TaJVZhbDhs8d/DK1ars7NfuGiUihYUiJybv
	QlOXeGDVqVyXaNrbiJoQIuUE1L305tW1WBWuPsMpFE3pFL08+26foXPlqT/QaUZoBukABEh34+r
	lCiKiwW0Sd8icJ2QNvGhI9E+rw01wRxWmvxcCTnvADjrt6aYS2RxES24NwltGF77kByQjP+jKh/
	5lk8+Y9uxBGqbjG/BUCjwlEz75ru24nRXUPYPGjYGggsHljihj7I4s1qyfLFIfugJjmmBDFrAp5
	yAuJ2Y9VaIBoyzokTCrLAlDKUnF6mRcusDSpga0ARVWfDs1WlbUChzmZ9x60Mf+dIvBg3bzdpbZ
	/xQdiR3SwA8SugfaSfF6sVqsmDB25TkJYEhlE6yZJwv57Hmgpn8j563TT
X-Received: by 2002:a17:903:3c47:b0:2db:eb5:47ea with SMTP id
 d9443c01a7336-2db12106896mr426721305ad.0.1788859167169; Tue, 08 Sep 2026
 02:19:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908090448.3332-1-ansuelsmth@gmail.com> <20260908090448.3332-5-ansuelsmth@gmail.com>
In-Reply-To: <20260908090448.3332-5-ansuelsmth@gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 8 Sep 2026 16:19:14 +0700
X-Gm-Features: AcwNN1VpPKN1gkIiS51yj4BLA5N52CV9eNK9WOCJ4im1zZlIaPxLmU_uBzBetZQ
Message-ID: <CAABR9nERV0bGkEQm=4kLNBZVfurr+6c-Q_to9=XixJV9CT=vyQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] ASoC: airoha: Add AFE driver for Airoha AN7581
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Darren Ye <darren.ye@mediatek.com>, Rosen Penev <rosenp@gmail.com>, 
	Daniel Golle <daniel@makrotopia.org>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> +       ret = devm_request_irq(dev, irq_id, an7581_afe_irq_handler,
> +                              IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Failed to request irq for asys-isr\n");
> +

I think we can return the error directly here, as devm_request_irq()
already reports the error.
dev_err_probe() would result in a redundant error message.
