Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884A92F8C22
	for <linux-sound@vger.kernel.org>; Fri, 11 Jul 2025 18:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752259111; cv=none; b=Zy0HYB7pKjta4rmpzN62gMjP/6/TWdBOXPlT6AVbLBX9C1rpOUfpIKRg6RQM+Xc7v0le/8+uj0JKVLwSsgcLjmyKJhZXZDYvJgAI2dDQ1yYjS/divPDNzNrDaZf3cKgHusbqhH8//xC2ejSfWG/RZlLUJLQ/BlWSbeFq37J+7VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752259111; c=relaxed/simple;
	bh=2bGsXgH3DvixXtGmpviPe2FgjUQnTgNIUrHSZYwu9Ks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PycN1dTIRNulkCjm7lFch0ic4nnCJy4xDJbU0bIZZ0ZaD2NdESue/pLaJU5qY2SKYM19Y7BNjK43xv1Vu8C++IYWBPcM8L896FcfTK5f24Nfg71Aou0Dn2KrBMSvVy15TTMxWmBOfpgpZXdkPFxXhFmoxvFHSHxrue90D2uVuio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O9/YF3ZZ; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O9/YF3ZZ"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-70a57a8ffc3so24999707b3.0
        for <linux-sound@vger.kernel.org>; Fri, 11 Jul 2025 11:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752259108; x=1752863908; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2bGsXgH3DvixXtGmpviPe2FgjUQnTgNIUrHSZYwu9Ks=;
        b=O9/YF3ZZZexjg+p3ZweJ5j7u1Xsj2i5R/RgZ+PWDCDuq3IRosbSsvwnz1mxD2/jGTM
         pXWcAyWMqqc78om0BHtuAcyKQ7nZe/uF83jXFtKyMP9F8gBVjuQq+2bhxw4wNCVXilFh
         G9lPQYzzqTO9axpKip7uegN7w6jIt0xQ0rHgN8rmwmX8Ed9kidtRjaM+Pyw10GJRMGUu
         ph6Mg4adhA4ojkFNAJLh9ftty/+mPbA3xfS2mwqtEaB/7E6485NZkZcldwRjjrB4/pUm
         WEQLbCSqn+pW7sbM/J3VHzvueo1oYTWEvsH7g+xof35MfRt7blQe4EVIlu960geRun03
         9RvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752259108; x=1752863908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2bGsXgH3DvixXtGmpviPe2FgjUQnTgNIUrHSZYwu9Ks=;
        b=JAoVieDrDi2IMY/QlJzampAxsSE8nfi9EouW8Glu0Qd15BC8IXp1nX/qBwoQNC3bvE
         rfSPemBV/F2tNY23rPx4ohDg3ktKQrR1yQDHslymcnUx48o+KmXQK6Y+H+cwqWkPUdcD
         hywu6FGlh7wxee9aRCHPv9NcEG9cPvOQms9MX5FR5qk+OlT8TTRHbup8fBFNnqudPTsZ
         /6RC/QNaOUusfS0kiZUZG8oI/VPLOIae+ONtWEOy6gSQVO5ElZggqsdwPq0UMVYQ2hXN
         OCAmrf8Q84UFGxVBk1cf70rLumSb5IQytbqq8RjuDPPGM6Okg6xWM8ffMk3+eAusl5pn
         uDpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPv8iQvP88KKl6RYGl6HfBjNLvsE2icPfEb2L+64fYDiTjViTcfrWCSAfEwjsMrdATz/c9fTsY9dGQZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTNtDweWvvm1iDUBWA112dlqal/el10qBHYfskPiaJc9OndQbh
	WhpqmcORDulFF5nv9UxFxcq6PFqPyd7OpZJOIxj9BbvfmBIKJLWekdwuaBHJdIacRd28Ryf/fdc
	aMkl7Lijf9OIKJi7sISfQxSNP7iIWSKlUSfqs5Sk5st77p/Lur5W3CN4=
X-Gm-Gg: ASbGncvwkPtdI531fhN3GRH01E2p83Ntsyt5UdYEPQhoJPTPTihPSKRPoJTgTDsgDAg
	OV0YyILRnMQf5nV/3IJITI+uJGjYIGLgKY17zMbPz4Hv+ApNMF2K88Gj4qzo2tPwW6iTXtYEA59
	leR5+BQtd28lZ8WzOI257mV1RGORqxKgKA2sfJ8uvkYogiOMu3/ol+We3B/t1ixdRSKcmdf2kNj
	CbAhOA=
X-Google-Smtp-Source: AGHT+IFzTF2BxLSt9iuKshVeWEKTGIk56Q8yBg21xl/RCRmgu7B4ttCYb5cRb58w2puUDMxo3sDj9HkP4vtfxFSxKMk=
X-Received: by 2002:a05:690c:6108:b0:70f:83af:7db1 with SMTP id
 00721157ae682-717d5dc956emr75028347b3.19.1752259108283; Fri, 11 Jul 2025
 11:38:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250710-asoc-gpio-1-v2-0-2233b272a1a6@nxp.com> <20250710-asoc-gpio-1-v2-1-2233b272a1a6@nxp.com>
In-Reply-To: <20250710-asoc-gpio-1-v2-1-2233b272a1a6@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 20:38:11 +0200
X-Gm-Features: Ac12FXxYkcaMNayRRd6fAY4Lr5pyDgoW-GrE4Px5E8aOoHIoAtE2XDd36yJo0YU
Message-ID: <CACRpkdYOUUn6H3=F8Kqeb65giFkfo+7Zz0ozeG_6Ay725q9NaQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ASoC: codec: tlv320aic32x4: Drop aic32x4_pdata usage
To: Peng Fan <peng.fan@nxp.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Markus Niebel <Markus.Niebel@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2025 at 2:42=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:

> There is no machine is using aic32x4_pdata as platform_data, so
> remove the dead code.
>
> Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
