Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F6E130E58;
	Thu, 26 Sep 2024 02:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727316252; cv=none; b=Y+3aaz9o/HperQubHzgF/AI/czCI4vQkQJ/oybUEqTy8b6si2jCFY4RpcGE8UQ32SinU/AodEnzcEabHyicIFgsZTtbN/USxfSB8fMc9jNvnrYSPkpHk2nSbgohmRW2VR4lrTzXlMLoS9wLCEpixre92XDYBtqUljt+HH2tAgJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727316252; c=relaxed/simple;
	bh=rnTEbCFDOfXQfDY6AbPrrjGrFyYYn0angyCoGJOYUws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=op937NKa5RtrC/4zcVDM9gqPi0Qro+1nuX5LlfJ+2X2WaYHhUVBadHf99BeLpm/EEsmF1+ix0MKVWOS5ixR4TA3y71lN8iOwbXUaIEz5cT3fEavge2oj85GfH3joR8x9KN9KpIjM27W+RXyb7+Xzpf4Dc2wT2sMzJrIk5aGPuwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lyQ1DPzs; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyQ1DPzs"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c5c3a1f474so384208a12.0;
        Wed, 25 Sep 2024 19:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727316249; x=1727921049; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uepY68ZxdZEGIoFno1fijjUOFz/iGyTi+j8yAIgrbRI=;
        b=lyQ1DPzs0CzIkQAnsxvE3ZXaUiHqfJfg0xnuOwZ/o2dyHPli2eS2rLmdL8+P+7SE6w
         ebxO+o0+LPJvPqVAatv8JHX1InOHWO6DDyrdiNFZyTOZjlD0XVv3aXtin8ETMK/2XmcO
         F9PeWMX9/oLFHYMyVKkoDNBAEXc3orj/WK+sCcbhGYKTETeFQnxi0iLN4sk5XAmi/fRU
         F1r8Q9ib/vHJ3odll+VhD3FvybsRrZGF0NzRMsiwDLKs28F/DBMyrypQOIepqsD0nTSY
         geFTO6NtmJY0u+FzcRFC4DrcDOVeCafPlU1RQUd1Z/BKRt42NBMbYiAg9ijYMeQLPN09
         3rnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727316249; x=1727921049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uepY68ZxdZEGIoFno1fijjUOFz/iGyTi+j8yAIgrbRI=;
        b=whnKC5h1J3iEdLL2sluhchFmMrX8Rza+rHFEpdrWdPngKjModRgLy4bPoTCOP+3hrY
         lRPl5hy1S55fmyrXeppC7uo1Nwjhjr0qAfZJAIl6J6Y+r4YhvglvM2NvVAgN7n1qedZL
         CbhiJyt1nWpRMdkGzUepnxQiZg/kEfZtwMyTeaFm2mj/U4raAo9gUl2cCjyzoxpzkH2k
         fL1Fa6nqndoN/shvmM3/h9kRqcObBAB1UqXdIQ5wKUQulb7n9B3AJs9FpBlOglBQnyTS
         ui9sOW5utBNGOtxVCoL0SlqnqTj/X9qLmHqYcO9TqSXgIoKphdNOEvS2nHRRlA6YeK0B
         OJ+g==
X-Forwarded-Encrypted: i=1; AJvYcCUGM7UNhOKxFXzzS9MrvWrkQwJem2Uwd5XVW/7zS0t8DsoslaOKdle84ppY7Y/9iq7w4Uk3QVurpZHt@vger.kernel.org, AJvYcCWULg8NLX72e4loc9gG77g1++MPdaCtXvspLYY4UTcedKCpt7rsjkikK6WfZp2LMYdVb9YcXKXkoEbJfr0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPlNABgs9R7liRR1FNBxCxICB7Usbtknu8yS2aylbk4rbI97rg
	yXABwbZ2irZlhRYHu7dhpeAEx8wn50wzaUmsdwk6TKrJGUt0/jn7kNKxWe3KJaln32BA8KuQiLM
	pGIfw8lQVU04FvclxlS7KAxODLTY=
X-Google-Smtp-Source: AGHT+IF/KR6xfiJUHZTvUsIZhDO8sCqMLIEb2EKea2TOgeoogE/KiWFUQoO3906Czfj1LCNIJA3yZnmbbMqvgBY0WnU=
X-Received: by 2002:a05:6402:254a:b0:5c5:cf0b:b515 with SMTP id
 4fb4d7f45d1cf-5c72060a5bfmr3234419a12.1.1727316249172; Wed, 25 Sep 2024
 19:04:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1727056789.git.zhoubinbin@loongson.cn> <fd3989d15546502b47f580e6a2c3a59cb628ce93.1727056789.git.zhoubinbin@loongson.cn>
 <ZvKDBc2Kohx9kPfQ@finisterre.sirena.org.uk>
In-Reply-To: <ZvKDBc2Kohx9kPfQ@finisterre.sirena.org.uk>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 26 Sep 2024 08:03:55 +0600
Message-ID: <CAMpQs4+xP7wMSm4wgE97hnbmrS5oVtQTQWXNLvK=O+SkeZnEsw@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] ASoC: loongson: Add I2S controller driver as
 platform device
To: Mark Brown <broonie@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Weidong Wang <wangweidong.a@awinic.com>, Prasad Kumpatla <quic_pkumpatl@quicinc.com>, 
	Herve Codina <herve.codina@bootlin.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Shuming Fan <shumingf@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark:

Thanks for your reply.

On Tue, Sep 24, 2024 at 3:14=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, Sep 24, 2024 at 03:00:48PM +0800, Binbin Zhou wrote:
>
> >  config SND_SOC_LOONGSON_I2S_PCI
> >       tristate "Loongson I2S-PCI Device Driver"
> > -     select REGMAP_MMIO
> >       depends on PCI
> > +     select REGMAP_MMIO
> > +     select SND_SOC_LOONGSON_CARD
> >       help
> >         Say Y or M if you want to add support for I2S driver for
> >         Loongson I2S controller.
>
> You shouldn't select the card from the DAI drivers, some system might
> use the driver with a different card for some reason.  If anything a
> select from the card to the DAI driver is more appropriate, cards are
> the main user thing.

I will rewrite the dependency between the card and the DAI driver, as follo=
ws:

config SND_SOC_LOONGSON_CARD
        tristate "Loongson Sound Card Driver"
        depends on LOONGARCH || COMPILE_TEST
        select SND_SOC_LOONGSON_I2S_PCI if PCI
        select SND_SOC_LOONGSON_I2S_PLATFORM if OF

config SND_SOC_LOONGSON_I2S_PCI
        tristate "Loongson I2S-PCI Device Driver"
        select REGMAP_MMIO

config SND_SOC_LOONGSON_I2S_PLATFORM
        tristate "Loongson I2S controller as platform device"
        select REGMAP_MMIO
        select SND_SOC_GENERIC_DMAENGINE_PCM

Thanks.
Binbin
>
> > +++ b/sound/soc/loongson/loongson_i2s_plat.c
> > @@ -0,0 +1,186 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Loongson I2S controller master mode dirver(platform device)
>
> Please use C++ style for the whole comment block so things look more
> intentional.
