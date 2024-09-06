Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE67364A9;
	Fri,  6 Sep 2024 11:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725622638; cv=none; b=oTaGB2JBTyuaEAnsBhrG3k7dpgtO7Zu9vsGwYV79BueBdi+PhTwJdmNGh5ASH3sCspG3j1aa5ouEbV03pbc+yxRNIMsycSfiqjUwsDa2oS4fhgHO26v03GSuT22bbUnILfzsaq/xmCKuagDpfLeh3B0hlQzyx6rMlKITBmbECdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725622638; c=relaxed/simple;
	bh=lqxOlJQgWQl22rUCJh2s6jVJRGmlJQYQOFRPj2vMNII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WEDMY+NIpBXKiO6fv/CcOW5RxFQ9NVIip5Ie4dYpvlrLCxABE4PBZ60hPxonPUpv7fDktTEkfYQs9VBriV/sel4ftnqdayjDlmG78TM4TxyLKzJN5Bx4DGXjzrGTB/r/bMszBH3l55fQGkYajamH7K/zRs9a5pvfpqvrVQtRWhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6daf46ee332so18843757b3.0;
        Fri, 06 Sep 2024 04:37:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725622634; x=1726227434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kjnr2492P/BcID81zdCH2qFdKNtp4VQucHhzLNMBu9w=;
        b=NJ/6B4nNrWSJRLeLmVu3pw6UO9pgoWRmgK0L1U/38M7lt+iWmLZH6WPNgdokK1UViX
         anlB48qzAK44Fb3fNIbkksG7w698frGnABSMMgumhzkAbZONWZ3q0xTgM8oE++FXZAZP
         xgQ+P2KUrY/O65ks2cXDDV/Sskncm2yhzEzTPrX4hkC3CAdqEGyOhl1l6qu6vaFa9puN
         HsrZH0CvZxL4HvZ39IjBJbgbv4ZIxgXyIOaWdj1Q8y1RavLoHXDNgtX5slIw1pm5XQ+M
         r75qBMNXY5FkCw1gMrxdpd2iwSdzS9K/Q8UQP610gQ4atfJxlPWsdzUcAzTyDQxhupb+
         dpcA==
X-Forwarded-Encrypted: i=1; AJvYcCU93sQ8n3tDPfPgXw927yuwTnj3u6adWvwF+p/huNasEJF8KEooL/jlvzv76yUUof1yzRIkK+c8c2uw@vger.kernel.org, AJvYcCVh3ovil/fgDAfdX5nljDy+npfjZ/XAde1kMjmdCsV55FRYQbXrEluWnviNVIxH4jsLcQbaNnymo1+AKXk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyE9JmdXlymALcxfS5pul3t2N0pGrAxRlUc2sjlRJCKVu1H4ht
	g/bHTlF2+JgsGUF6vb4EI3/ME0+9FVDg3hORW/05Dio/W17a94F3X/JDFsx0
X-Google-Smtp-Source: AGHT+IHIYVM/fx6Sxo2Yy7Qop4e1v7TRMseSR85+8d2TpidMRFGl+OTsM7kZPNmsckacmxW/ugyMdg==
X-Received: by 2002:a05:690c:48c6:b0:664:badf:5a80 with SMTP id 00721157ae682-6db4515496emr29428947b3.28.1725622634136;
        Fri, 06 Sep 2024 04:37:14 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d2d40a7588sm32298647b3.57.2024.09.06.04.37.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 04:37:13 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6daf46ee332so18843277b3.0;
        Fri, 06 Sep 2024 04:37:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUtwNMEGntWotqvBLKQ0oyXXGVsdjP71cpevqAlWSckCVeuk+zOppS0/5TYSpbqk6U+XExqF6gpRrOT@vger.kernel.org, AJvYcCXTBCoJx3zQO96cfWRkQNtfzJWg9B0pRJCNsWPMJhv9vHgR3WPnuU9K7pFXggfyY2efKDH1QO4Nu7Q2RXI=@vger.kernel.org
X-Received: by 2002:a05:690c:fd4:b0:62c:e939:2ffe with SMTP id
 00721157ae682-6db44d6c68fmr28000367b3.7.1725622633634; Fri, 06 Sep 2024
 04:37:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1725518229.git.zhoubinbin@loongson.cn> <282dadefdaac7917fd681a6e84a5f0f07d0557bc.1725518229.git.zhoubinbin@loongson.cn>
In-Reply-To: <282dadefdaac7917fd681a6e84a5f0f07d0557bc.1725518229.git.zhoubinbin@loongson.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Sep 2024 13:37:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVLErqWPDs27yeRc96Ly1ukds1-id1KNy=aWvNmffWicg@mail.gmail.com>
Message-ID: <CAMuHMdVLErqWPDs27yeRc96Ly1ukds1-id1KNy=aWvNmffWicg@mail.gmail.com>
Subject: Re: [PATCH v1 08/10] ASoC: loongson: Add I2S controller driver as
 platform device
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Huacai Chen <chenhuacai@kernel.org>, 
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Binbin,

On Thu, Sep 5, 2024 at 9:07=E2=80=AFAM Binbin Zhou <zhoubinbin@loongson.cn>=
 wrote:
> The Loongson I2S controller exists not only in PCI form (LS7A bridge
> chip), but also in platform device form (Loongson-2K1000 SoC).
>
> This patch adds support for platform device I2S controller.
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Thanks for your patch!

> --- a/sound/soc/loongson/Kconfig
> +++ b/sound/soc/loongson/Kconfig
> @@ -13,10 +13,20 @@ config SND_SOC_LOONGSON_I2S_PCI
>           The controller is found in loongson bridge chips or SoCs,
>           and work as a PCI device.
>
> +config SND_SOC_LOONGSON_I2S_PLATFORM
> +       tristate "Loongson I2S controller as platform device"

depends on LOONGARCH || COMPILE_TEST

> +       select SND_SOC_GENERIC_DMAENGINE_PCM
> +       help
> +         Say Y or M if you want to add support for I2S driver for
> +         Loongson I2S controller.
> +
> +         The controller work as a platform device, found in loongson
> +         SoCs.
> +
>  config SND_SOC_LOONGSON_CARD
>         tristate "Loongson Sound Card Driver"
>         select SND_SOC_LOONGSON_I2S_PCI
> -       depends on PCI

"select SND_SOC_LOONGSON_I2S_PCI if PCI"?

> +       select SND_SOC_LOONGSON_I2S_PLATFORM

Or perhaps do it the other way around, i,e. let
SND_SOC_LOONGSON_I2S_{PCI,PLATFORM} select SND_SOC_LOONGSON_CARD?
That would be similar to SPI_LOONGSON_{PCI,PLATFORM}, which select
SPI_LOONGSON_CORE.

>         help
>           Say Y or M if you want to add support for SoC audio using
>           loongson I2S controller.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
