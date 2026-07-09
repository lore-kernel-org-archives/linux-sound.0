Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792B2340A6C
	for <linux-sound@vger.kernel.org>; Thu,  9 Jul 2026 02:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783564445; cv=pass; b=g9g9E+l3N/jkj3h8o5AyIDffc4eFGB5XvVltRGDtNdrnp9H/t473+gUN1GqNb+eNG6JDtVV9n0WebpCBBXyuy0wXlVGQmI5F55kTA56yJh5EZkRNcVyKlo3B6656iYfhDhzQMFSAxiguVQr5kzh2XtMusezuQwwWK3HH+l3oWFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783564445; c=relaxed/simple;
	bh=9RRwQIJh1889dCPoOcbcg16JSZb+Bt3uDLhus1mbDjw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o6SfK+0t1Y5dd8CNeIyn3zPGWIsexgUvVNcxqmJ8ssXLphqXsMPjqAKxwU2X4yhNGjy/x55pyATY7+xDfisoaSY4zdT+MBuEljd8/Of02Qmm+Ikebvj2xe04dtM7E1iaW6EoTLp7MoEwomJNUWp1tOCFYwPEqO1+aVGB/MQe4Ww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLmjNF9a; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLmjNF9a"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cc73e322dbso12923485ad.1
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 19:34:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783564444; cv=none;
        d=google.com; s=arc-20260327;
        b=FsIbfR3RarWmhCfmE9soiglzV6szpaNMCBwECrVF86dEjzgxl+glbAd7bOQY6RexXF
         dlb01E+jRmz9knT1bCyEH206STOLkqBjPdEtEsxTXb+b8tmOKFyN6m+UmsAeXZr3BRTr
         WA/lEetrhtqhdO/bFftUxfCWPZOrTsVdo3lBAHuVWSNCOFtqvZ859HC9pTe1i1l3aUZj
         lZ/SNLY6Ov9elL+u0uZb64MNl7jRMHW9+uoVBFzZ1k3kb2VRLDTxIa8oKXcUybE01eQA
         qRHy8wJ8kuV/ABwCjrvjemlbMwMe2W9wYm9ofVw1Aj7XQOziVXO2Ku/LosVrF5ZbzaQG
         hTdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9RRwQIJh1889dCPoOcbcg16JSZb+Bt3uDLhus1mbDjw=;
        fh=ROTu5fiDfcKY8OmibCffrGjGuyJW/SFMwRm17eFhMv8=;
        b=KabPNwcIDrA90CG6dhkVwNKGExzp+uNB2UttxVBi2ggi8p2vUAS2jpZBwDy1vAgHW1
         l3rnqhRIyiDzk9ws3JwXq5gbNz1DasuqcVDRvVlVsQWPgJbGjFaZJiGJ5PWxMONHAGMu
         +z9nMHvOwf/MPAPo67JEJlt1fM5IhBxCz/eptylJroKIKjbs1bT7zQslXkfxiJ29ygtr
         xP0+74Zr8M0uu0G5PyTHnMH0Z14ar/MrqJgNj3SOdaW7iMwJPHk8R3oVzDl1rezNKTQ3
         S7Am+eo3FHx5mc4Llwvj6PNT+3Aa1LkzSxlJu2YqKhZMDE/g5SWjHt74Y/hEJohbvXv4
         Il+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783564444; x=1784169244; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9RRwQIJh1889dCPoOcbcg16JSZb+Bt3uDLhus1mbDjw=;
        b=FLmjNF9a1lDQVt0BbHCU5g4AsiakDvBumNOmEyf67LGRiWv6muzPCDXMCqCx0RXnY9
         FAm1WKALQr01PEnnBkti+LvLyjWVJ9tqogbH/tLQW41jMCCBVAn0J5RR32Ek2ixRiPoZ
         PdgmngkA/0Tet/y8D1Eo65YjvLGZq05P4tpirTOkohYSmhSDCei9Zi7EE7GlA8n15ZGR
         mbAu0n1swWKaE2zxBdCfAYhM9Ip16JGUmTigtFej1sSSi8/6xu0uZIxB6Ndn7kWJsluz
         ILu9ZBlD1u0JbA3i5RLvhi/+jkTe6zCzOUTqLpxXVMWc7ocGXY7PgSFd8a3bl8g3VJTC
         C3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783564444; x=1784169244;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9RRwQIJh1889dCPoOcbcg16JSZb+Bt3uDLhus1mbDjw=;
        b=BBR3ftAbn8CneDebxYkW4UhfTyoDuhxguN7wVTBfZ73vX6NUZ1BOV5Wubk+En/LvBF
         eaKNgIMn0vF/7zuNh5BUp2D6CaC1OvttEPo9HbftjyZOPdjAUnWZhgNoTJI9qm3rNQF3
         mFUSNmDSw7WjEw6LdoDuPSTF99O9/w/r9Ymo1AM31P/vhXJn0LoFqUupd/D0dJ9WdoJc
         SY/MlFe7pV5+rP9fIMJuHmCuX76U88mE4tX/N8Wlm6L89OGZFwEn5Fnf0EUkoE+BU0S9
         IdYiRpJEWfm3knxqz1YBwO09ZPr2y7cnYMfgVG77rdIcr/imrz92Js9Y46hCY7NW+Uzs
         NKDA==
X-Forwarded-Encrypted: i=1; AHgh+RrPKorgABCweMQ0LiJU+Vk9TkWmD4ijLBIQylur2zAEsqjFge4HNfHo4w9RGOxoBO0/Q+nJvMXmpUESDw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5ilLof5EHv+56TF3nmpGafF6JVKdtPrOXF6adqy7xZ8bMuRql
	fFQwKdez8r9iQajEzANDasDIJ2kfuqUUh1CbYiSJTRmYO0HiC2/SjNBHbi9ZtFMWfVP3ozmBAsl
	I2TBnq9JLLIpUw6swOmTlbEd+m5p/io8=
X-Gm-Gg: AfdE7cn35AofAwhhKwQGnJuN/YH8ItDMR12509NJk26ic07/2Jzs6zHpzX/oRGFWMJC
	mztvlKg1iQTVuqr6vZdkh7Jti7u50m/Cphd0fITFmmjiD1ji7eRarUTo++tmZ8SQHj5R8sc2Aey
	TrZlEHlyjnLiACx+uS7+o1ZIDFwiD/8bbzlhcZJ8lfD57YS0VPY4plHlf+mnbXxgkLg9yCYDn2n
	ham1gIY1L8Y2499hc6kpwzwGb1WmOHDt4Yl2AJpfdk1DXWd869PqhqVHUjQIzK1kxU8PWGIi03K
	LuTppWG3oYerMBnlr9HeRpbak0M=
X-Received: by 2002:a17:902:ce91:b0:2ca:ec6f:aeca with SMTP id
 d9443c01a7336-2ccea3847b4mr47728935ad.8.1783564443676; Wed, 08 Jul 2026
 19:34:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708141734.578926-1-phucduc.bui@gmail.com> <c9f7eaac-9bf7-408a-a4a6-56f3ec6177a6@sirena.org.uk>
In-Reply-To: <c9f7eaac-9bf7-408a-a4a6-56f3ec6177a6@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 9 Jul 2026 09:33:52 +0700
X-Gm-Features: AVVi8CfyewtsE3QT1H6Qb0mhvtRsc5zTxpasaNVBWAckYMH2ZTVpwhyO0FrCTdA
Message-ID: <CAABR9nEjwXufG5FyWm=ExiDEmpO50U8Tnr6yg=CSFPo3SWrJJw@mail.gmail.com>
Subject: Re: [PATCH v2 00/27] ASoC: codecs: Use guard() for mutex & spin locks
 - part 2
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>, Nick Li <nick.li@foursemi.com>, 
	Herve Codina <herve.codina@bootlin.com>, 
	Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Srinivas Kandagatla <srini@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, Linus Walleij <linusw@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, u.kleine-koenig@baylibre.com, 
	Zhang Yi <zhangyi@everest-semi.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Kees Cook <kees@kernel.org>, HyeongJun An <sammiee5311@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thanks for letting me know.
>
> This doesn't apply against current code, please check and resend.

I'll rebase the series on the current for-next, check that it applies
cleanly, and resend.

Best regards,
Phuc
