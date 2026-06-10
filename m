Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA24432A3FE
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 03:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781063483; cv=pass; b=SNSvsFw9BgvDsgohIdxAY2MkyzvahoeZUcQqJ048MaLwNfexffGnRB6tj6YI86qMKuixNREaW/lMHWzcd6MfSfujHtZzigXlQMfVi4eboeJHh7zMDJ9Om7EtaUs5qq4AXI6GYqNEbpTawghN9XVpoVDr/0zn6ghMsOBm7z8riSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781063483; c=relaxed/simple;
	bh=V98JltAyEkn6qhpFu54OMxe/3D7dQgiMQHy3kmlT/Qk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AJxiT4UjKZOCF9XRgo5idS2/4Kzej+58DNFpiPr0TnouRntfVlecuiykCwkGpM2LOXmdlsWjf0CpFco2lv965ikPfA4ZisSFrJu7dssCFE9VxhdrTFEdvgctsMSP/j4mNb/BoXElA4Zw5U7BLLO+qzAy1KkLSTGDgVqtza1x57w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMaAyKXD; arc=pass smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMaAyKXD"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c85b2139015so2154024a12.2
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 20:51:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781063482; cv=none;
        d=google.com; s=arc-20240605;
        b=Vo3ZdGc/r4UN5dshDIoYjxl8i3J0UEzhXW0QZuKSgwRoQSQ7C5R6pLtnvkTqLHQuIp
         9uHPRKvnVEH8wBXUQ2OGX+/3ZeVDnTgrlQos1UPP51Y2kFtqYG2DHF7PJ9xdLRBgA7NS
         WjIfLQqnwbNth692qwyyJgitJMxwTghD6yoKYviwsBrrQ1iPQ9dmQeI3he+SSTPG+9nZ
         9lnfZIxKp1G3jJSU65F7x2X6NQVdCKSW/w0u4/yYSD2AmCA0iABuBXZ4pbs9Hmuo/tg7
         /bljOYd7CieMYRXgwTOTfqvCPZdqO5f0zIeCk3EFsnE1xIqm1iMUbBg/MjHCjRCJg0Dj
         VqfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=V98JltAyEkn6qhpFu54OMxe/3D7dQgiMQHy3kmlT/Qk=;
        fh=EmPBCHMLh+LCr2tPtgOnKTIfVnGAqZBUlOu05b+F30k=;
        b=IDJa72DiWA6eha2fQbTg8g6WCoAYrvQDAtjUNloeDUTU++yii5u+NN6/bjXhexbzj9
         l24nzTtrdKsU5Kp0rpRT/8RgvnVOjnKhnC6dbiHOjJy+d/eWwMtUQp25EnvPmQH/OaNi
         h/L8nYTdYpPmFUh0EtjSgkJCcXnLhw/aqkT0eCiO9XzwlPJWFYWxJuH0r/rgSzgJilyi
         xKNWrtTdLqVnhrrwZmE2zy0dKi9aOPOSJKJkx38s/2v7LY+c5Ts9NUfGb9OiS581GgsA
         Rqiiqah9Pd3g/3R/8Ysfmbnwd7Ux4QdPu0qklCsWP+468REmb2YLFezlqhQ5mYuc2eB3
         vJyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781063482; x=1781668282; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V98JltAyEkn6qhpFu54OMxe/3D7dQgiMQHy3kmlT/Qk=;
        b=WMaAyKXDvsKebe3ajLA8s2QTa2MieRhwgUT/EMNryGhVESh1e3cgXG2i/XhxIDZVto
         XVdOEGIkW+sFLMSyKt2/svq+a/utoYc2RjoVDpY8yC/9pWwGyE9dsxEbR+wJ8JiINWa4
         6avR3lgHnaawrzADa3sYIUk49XlDIXCOe0HaTLGX/YySUcX0UqV9jGk/Y1NQwPHnECRX
         f/Ck7UGjSe/NHLwkAlFSxsOr/AAmFTIsgtUqrrjOm1hAnGobKm42fDslJzZDYhmKWZVz
         F/1z4uGSjTpGDCg/Zj8m44nJqqPv6MsipO7v0YGYtRLXK1x8r2Q9ABmq+h8kNqoV3Szv
         PN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781063482; x=1781668282;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V98JltAyEkn6qhpFu54OMxe/3D7dQgiMQHy3kmlT/Qk=;
        b=jyC1VehLeU1Ft3vfekJutOayfwMhnm7/w+jOVHVFKb6kaxLj+a0Fz6wpptwPdRXK7y
         FBbFRDpkZhDryxN/bH06DjlLEm4Y/yBDXx/bifMVyM2qDgpU/xo64QCQMYQfh1WLaQy7
         smQjphqwPGaHRGEYkxlevgiOMEzhzTHUrCTulYJfGIdZ+UIUkofNH0ccSNb9ynv6E9Xo
         qPLABIDDAc1a7gz0Bou0pfWkvMDwlipt77S59gWhAHWXU28eF7fC6FK09CJ8fQf6E5/G
         97rxlmaNVPcIxMDV+27FXOCZus142o/WXkgb92Hj8v+28YhkLhqmm9iytzKWSsjWr0Fy
         VuUQ==
X-Forwarded-Encrypted: i=1; AFNElJ97lvVfQqxx5Bleg6rZzz/HUu5luO5fz0uQzCrYleTKiWoTRRtX15xGNYZ94+TBVJp0HU5Ixg9hxC0eHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxuUEdLE3HNZn5bM4QCOlpOuIzayFitTZ4/D1hwMbHGoefEH+w
	7fYzgfxbbDzEnMdFhrcHfjvJOwXVXqVwExkTDpSmX5P6THElZPemOd43lZrk00y0+MYDTCUpYXo
	xJEFtYHtYXYiQy8FqnmK3f1b3CO7Srr0=
X-Gm-Gg: Acq92OFhh0GsfHhhT/NYO2LJZD+EuO5UxaOzBuM+q5R1SEiNqedOUllWSufwv1AcB7S
	PaqJhLbXah8jT9qIT9mFThnc3dxLPv0B+fFlSp0wfC87zmpl4UqCAJUuMMBXiMeCaB/1HEm9ZRc
	b+Te+J0IK9sofql+kvZbR1rzvyz7h1B/1/r3reApn2f5I4TBEsVEtctmd8Cny43Zp7nTccwui2G
	yudYLcj1Gre9aXR50HI7y2BKRK6wUrhroTqjy8A4O5vC6H4ekI8Gfa8ao8ixK7S7wat8nfgCfSM
	ZVj2VkIsDmNL+XRtpOxO/8AzY3WrklXlQ0h2rj8o7QeEpsTC
X-Received: by 2002:a05:6a21:46c9:b0:398:7ffe:472f with SMTP id
 adf61e73a8af0-3b53bbe7ddemr8176176637.2.1781063481857; Tue, 09 Jun 2026
 20:51:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609113836.45079-1-phucduc.bui@gmail.com> <20260609113836.45079-2-phucduc.bui@gmail.com>
 <20260609-eager-nightingale-of-devotion-b6ca1f@quoll>
In-Reply-To: <20260609-eager-nightingale-of-devotion-b6ca1f@quoll>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 10 Jun 2026 10:51:10 +0700
X-Gm-Features: AVVi8CdZKR_uJCuqPpU7lvaDdZ2lLhaOObi_ZoDUvMu1Slc74HJdSHgV3aKtf8g
Message-ID: <CAABR9nGuSJ96reQmZqCNT2z-z9op4N80xTPvbWHuVwC-6A3exg@mail.gmail.com>
Subject: Re: [PATCH v6 01/11] ASoC: dt-bindings: renesas,fsi: add support
 multiple clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krysztof,

>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>

Thank you for your review and the tag.

Best regards,
Phuc
