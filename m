Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B894943ADE;
	Sat,  7 Sep 2024 08:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725697121; cv=none; b=sK0E2e5DJin3xzAlXGlQCp1i85Dg0zX0lQra9pKqkqsMBs5rRgO3O2rZvmNtIBOOczCE5fctmJSU4NEHfNrOoF2iPZ+pZsjzOUQNWGtSb1HkR6BXDo5xeyu4CFotCqpph8ZoEvOaOCKPhpF9z5lqOClT9JnWQHfA4mOvoFABAPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725697121; c=relaxed/simple;
	bh=G0ecZV3MYJG0NMMD2nY8I/zM982tZIc04oCMJMSXf4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dc2ZabBjXr5mCq3gvTjJt2dadHceKNYfewyBLuT6LfyhW4CLOmrepv2dDqjCxbxh65UtmmRSZ7Tq10gjbFonCyou/r8lq5LBSMp1LYQBWbfSDRvB/ddNjDOamn7Ws9+o9NDwiPxObwRxEN9t9cXzIiljDj+NuvpEx5rE8MEXbj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KXc8PXkV; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KXc8PXkV"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a8a789c4fc5so384555466b.0;
        Sat, 07 Sep 2024 01:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725697117; x=1726301917; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ITEF1I8ktjsgdGr8HU561lKFX4loP7tyJC1Yx632Ah8=;
        b=KXc8PXkVRmgdL7wKx+hZIIXIkVdPO1EplPlK+buEJRd3mTzg47UAzr6BF64ANX+cVY
         Q5fMcil8rzb4IzgSEIdJeI5ffzxnO5XUHzVfZm83VPxrvI82+DtNSY4gEaZinUP0aUdY
         eR9+IX4GKjEpamVZVOtU30d4P9VDO0DVwaFpvGtgBIpXMu6Wlr9n6GHFOtwtdeME0czT
         dDS0GnGBcFZKim8SlfZOuKhmttT6YUmv6wC/3W9tRnwduV5SUVgi1j5UQuJbOwTuM0KC
         E45+Et3KE7sCpcV4mtvXVKVxKZFBwMulpujFTgRldUPSxA0Lxp4oCtH3A8cwXwwrLmI4
         EOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725697117; x=1726301917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ITEF1I8ktjsgdGr8HU561lKFX4loP7tyJC1Yx632Ah8=;
        b=MTS2Txq0oCpHmzsYisrzWpjRvZdQnY4cL3T4ZbiVdESOdF9VsawQpV3gkqvXgnqy4X
         srsTear0QPABOZOoOG7z70A564PNka34gGUolOLV0mdqU1oLekgmObnESG6cPcZI81Um
         6Ia1XLf21Zf1n4pIrgG3+uwrC/SrZpjZrH+qEudnUM6e+Y3Nv6MHdGoBW/+2fUG/e6ah
         PoVom0wK3d4jj58+mLICg1u8A4E+8ulgC9iPCgV7w9s96vBVQZmPmfAsUIfi2sUcKcDv
         fogzKB3uzxBsOfA+lYgNNybeS3QgubCMkKHsb+C5gDyC9H7T6cNXxXyqAeSbNyhoFJMK
         BgGQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6ezkBB0AVufEmODYbIhQidebR+gSlwUGSg/1+ZQq7c030vuZeFYbNhadcmS8+RqmXmjkkuSnKlaWw4JM=@vger.kernel.org, AJvYcCVuKA92QzEoml9yXAE8pj6v+WtX9GAF3c7yRSU7hm2jBoo+W1ta6XdEJiTXKgxZJMqkyijbv3Zbh+xq@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs7AWwoBXOW/DMOpqINtdk2LnO+9W/6pszdtW0DaSYrNMktmtb
	N1LlOot3oGVn95s7tVDgP9IeUaFvP/rtqX08KU86EHv5pF4eyJtBrup4daLiAkgYN/2fo0m/yvP
	XUvtOmAqHA7DzZR7EnAnivsgV3Nk=
X-Google-Smtp-Source: AGHT+IGP5PwhM+mVTH7/JKuP6gDNSBqHTqVTfG4IvV7CKDqZhFoge7/zd4knhe1gYOteaPQa69oRbac983Yu6njcJAg=
X-Received: by 2002:a17:907:3ea0:b0:a86:b9c4:a439 with SMTP id
 a640c23a62f3a-a8a431c7209mr1316444266b.21.1725697116946; Sat, 07 Sep 2024
 01:18:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1725518229.git.zhoubinbin@loongson.cn> <282dadefdaac7917fd681a6e84a5f0f07d0557bc.1725518229.git.zhoubinbin@loongson.cn>
 <CAMuHMdVLErqWPDs27yeRc96Ly1ukds1-id1KNy=aWvNmffWicg@mail.gmail.com>
In-Reply-To: <CAMuHMdVLErqWPDs27yeRc96Ly1ukds1-id1KNy=aWvNmffWicg@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Sat, 7 Sep 2024 14:18:24 +0600
Message-ID: <CAMpQs4LUNnE9do=PWMcFzBu9JNkOLjo+7UX+_Qk0J8vHvBqyQA@mail.gmail.com>
Subject: Re: [PATCH v1 08/10] ASoC: loongson: Add I2S controller driver as
 platform device
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Huacai Chen <chenhuacai@kernel.org>, 
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert:

Thanks for your reply.

On Fri, Sep 6, 2024 at 5:37=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Binbin,
>
> On Thu, Sep 5, 2024 at 9:07=E2=80=AFAM Binbin Zhou <zhoubinbin@loongson.c=
n> wrote:
> > The Loongson I2S controller exists not only in PCI form (LS7A bridge
> > chip), but also in platform device form (Loongson-2K1000 SoC).
> >
> > This patch adds support for platform device I2S controller.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
>
> Thanks for your patch!
>
> > --- a/sound/soc/loongson/Kconfig
> > +++ b/sound/soc/loongson/Kconfig
> > @@ -13,10 +13,20 @@ config SND_SOC_LOONGSON_I2S_PCI
> >           The controller is found in loongson bridge chips or SoCs,
> >           and work as a PCI device.
> >
> > +config SND_SOC_LOONGSON_I2S_PLATFORM
> > +       tristate "Loongson I2S controller as platform device"
>
> depends on LOONGARCH || COMPILE_TEST

This is will put under SND_SOC_LOONGSON_CARD.
>
> > +       select SND_SOC_GENERIC_DMAENGINE_PCM
> > +       help
> > +         Say Y or M if you want to add support for I2S driver for
> > +         Loongson I2S controller.
> > +
> > +         The controller work as a platform device, found in loongson
> > +         SoCs.
> > +
> >  config SND_SOC_LOONGSON_CARD
> >         tristate "Loongson Sound Card Driver"
> >         select SND_SOC_LOONGSON_I2S_PCI
> > -       depends on PCI
>
> "select SND_SOC_LOONGSON_I2S_PCI if PCI"?
>
> > +       select SND_SOC_LOONGSON_I2S_PLATFORM
>
> Or perhaps do it the other way around, i,e. let
> SND_SOC_LOONGSON_I2S_{PCI,PLATFORM} select SND_SOC_LOONGSON_CARD?
> That would be similar to SPI_LOONGSON_{PCI,PLATFORM}, which select
> SPI_LOONGSON_CORE.

Yes, it would be clearer. I'll modify it in the next version.

Thanks.
Binbin
>
> >         help
> >           Say Y or M if you want to add support for SoC audio using
> >           loongson I2S controller.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
