Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276E82E040D
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 08:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773217779; cv=pass; b=u2uhXyYYtmZFaZWUMN0+CpICfEhYysWbNM9sz3ZmtZQlMwSqf/z/euKntcSYKeKQrem972eGC74DAEcTJckDKmv522UQa5hZDiHNidwXhnB6Wi4/flkm3ltSi7g1j/3APC+WLkooQLyx49v9LtdvtY3yPIpF/mmU3pYgR/UXs2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773217779; c=relaxed/simple;
	bh=WpTM2bK03v+GeetS/yO9RyrJ2EbEhx/HhLsYsyaMS4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KioabqTvxuN0L+3/PtKGSQldx3P2tCg8g4m/edJ5GK0x4bs7aWoE5Ga/+h9EzCKuznBkCHhR6JeP79s3o2mGVFKtbCLwQPCGmCBY4iILlpCrftfE1l72k2Pv2ARsLYtcojRddaoH9uxUXWpcow/giE6SpR4MJX+nL02KvDmd52g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kkwj7bRS; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kkwj7bRS"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6616cb8c80cso9152965a12.0
        for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 01:29:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773217774; cv=none;
        d=google.com; s=arc-20240605;
        b=EshF21mVaRfO8gF3OA4sjEz9ztkjJpV5blhTyxRYpV4CqTZo2W/a2tF5DUAobaPhAT
         B7buaDstFDfZG6gmQwuFHimblfHgMCudXLnP2527/4GDDBF3D1icDb3y173HDI8gaj23
         Uzsa1SG2diYaIu4XcPEXYFhMhJkPXPjD96HgTRqoCFS3me63CVEvBryLNmTyMiiufBPP
         f4HZM7B8NHUd3HOzAMgWZMO0/ey5IuRk9FTHi2agWgaVm1LV7Nk+W2OWPxP65IUmvQsz
         c5WGplmEFQD+zUpt6XmgQpwTghFuN9smPnrCbt4nCUmTKI38qBZ75yQo2MvmIyV38NtH
         WomQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YPFuevo92I9LbD3FU4d+etP0u9DGkGJOBwn9Rvp7Sj4=;
        fh=fGiP5F/Xcn1i2/uy9HxVNQdda8kBVfPrAxUtcapcZ2E=;
        b=MQL4WDRSl7fkOhSaE/itR5ZfZqhT+wFIK4VoY1Gve/9XLKq1rbBoWA3MRHeVYxypRz
         zJUmBgCNw4WI35j+4wibrmxZQzo/oqzRONATdHfzMLaJ4DTtZHSTcOm/V6+GVLw0+G8Y
         WTMrCgghJN0R//C9ABB4C8Q0VWPcEI9HdjMs/rRKxDFRXg8YwCtDk0OUQ/YnO9v/HndY
         qdMjAT7266dmm6qAh530czAxxM9ruCFLDHMzGSGrPxPyWABhpxGD7JQ735NG+XmW+g1S
         GcE+Ecoi5f/TKHClJ7zg8Q/AW+WeXonvApQ6tnZETXvW969nO1ypM7zia9ixnwvgj9vp
         Ht2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773217774; x=1773822574; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPFuevo92I9LbD3FU4d+etP0u9DGkGJOBwn9Rvp7Sj4=;
        b=Kkwj7bRSUntw31c/nnlS+IwNMs9LN5aAtCC1QJIL0d3BVyPqf1ZKtm5nQNrfwLOAFX
         fjJAj1QCDvdi6sDBjZvgIBf2Y/r7LNZcpLQ212RVWhhwsvej1sNDEmNwwpAOn+IkgdMe
         CMCan+j+SqVmHkX2YuMvcq6FBijuh/eCv9KV1vWV9Lvd+pg5sdAm2KaEKNzYuGydG+WH
         Q/snLFFgldNd/mh8xsZMpeOiBzyX2O5I5nSdjCd+SouIV+h5je11MVyIRPvzaOqJK5ix
         xhRprq0KHjzR+H3TBW/w0oYCbJoSrbPieOSdQ4UVPBTmeg1jqkyKyEI12FdgmtF24uaF
         JWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773217774; x=1773822574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YPFuevo92I9LbD3FU4d+etP0u9DGkGJOBwn9Rvp7Sj4=;
        b=hDoUFzAN/XO7cAXy/QK6uCeCLrw/8f+535QFVGqKPi+fOV23ntHjMnBE1wGlGqyKRg
         LbnVRzc2tbk7KZdV18Q658oH+DnupSnKssGwLAD8DZxsskNVEQCKCGFA2E1oPOpbZ1YV
         OV76L0ShzF7oUfg5GMNtSp8VYdwZFGFjJfMHjVUeTy9zPzRvH5AeWIMMlqcRSEqZ3KcX
         vSxTNzDYo+SAmidI0I8xkB6fUZyhVP2HEqrgvnzGGDV8jVpsZ9b/67gZuSWi7+P2FOCa
         f29ANc2CnJUZmIv2SqASxROo7hWSG2xEnG0C3EdG34l+aKGj7bmRHTcYJjGksWLoTlRr
         sxXg==
X-Forwarded-Encrypted: i=1; AJvYcCXa+NsoSol+qW4kOnnXTRCppZMr1EulktpbVQ3IJEv9tONsxPM/ScuVyHXNJvAaN40FH5Ko3KdBuTRdxg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm1YIvMwtz5xO516oNE0ptxMugMcacH8Dh5PxhG+qU/X/N8fPQ
	YYu3mt/8khjVqXd4YwX1F8+77+pUHQQw2AhJlhP78xl6uW+WLE68JZyX41c6+dz+js1fBx0OOF/
	DNtZPiDcG5OsLoFFAyxQNW8nlXKFJIVQ=
X-Gm-Gg: ATEYQzye+0GMriFvq564Qb0PqFHvbKazLcpWbsC3c9oNBa2UE6KamnsRLHolsf5oxDi
	Q0kMNyRZ0VQqlhd68hDocLHgMO2pmLbiWzSGSWNtDw4NXUYme/9PlU7bXRlGEI11ln1t9+vfHBS
	FcEjKHGbiuyNkrmK4zwBobpjDUENEmPZF8Q7t4rTAsMKKeFep2mmgoM3pVYlOAJ6XHFLyNTVSaT
	luut2qyXRzpdnPuCdBAj97qYGeO5qr2zEa0D0cky/btACc2TCpekt0QWd4gp9usua2EpZp8VpgL
	PDXzGceHXiR6z285Sg==
X-Received: by 2002:a17:907:3e23:b0:b93:8460:4af with SMTP id
 a640c23a62f3a-b972e638494mr92203866b.56.1773217773738; Wed, 11 Mar 2026
 01:29:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1773107475.git.zhoubinbin@loongson.cn> <600bfea91c1f14f089b2f7677578cd8690412fac.1773107475.git.zhoubinbin@loongson.cn>
 <CAAhV-H6zg2MfO2HC1+Q-FE4CJJLh2+Boo=ZP57XYPfufvCBhkw@mail.gmail.com>
In-Reply-To: <CAAhV-H6zg2MfO2HC1+Q-FE4CJJLh2+Boo=ZP57XYPfufvCBhkw@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 11 Mar 2026 16:29:21 +0800
X-Gm-Features: AaiRm52LMclNErp_XC41jPQYbAEz3jRj8zDpbY8eNCvPJgxQGExmtPVsZSonLDk
Message-ID: <CAMpQs4Ja_+B28p30dJYM0WU-scwgZSxLO9igvsXY+0dtbSxAGA@mail.gmail.com>
Subject: Re: [PATCH 5/6] ASoC: dt-bindings: loongson,ls2k1000-i2s: Document
 Loongson-2K0300 compatible
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Xuerui Wang <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 3:57=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Hi, Binbin,
>
> On Wed, Mar 11, 2026 at 2:38=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.=
cn> wrote:
> >
> > Add "loongson,ls2k0300-i2s" dedicated compatible to represent the I2S
> > interface of the Loongson-2K0300 chip.
> >
> > The hardware integration of the Loongson-2K0300 I2S interface differs
> > significantly from that of the Loongson-2K1000. Specifically, while bot=
h
> > utilize external DMA controllers, the Loongson-2K0300 configures DMA
> > channel routing via the `dmas` property, whereas the Loongson-2K1000
> > requires additional register.
> Can this patch be the second one?

Typically, I place the dt-binding patch before the new platform driver
patches, while patch 2-4 involve code cleanup for existing drivers.
Therefore, I prefer to position this patch after them.
>
> Huacai
>
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../bindings/sound/loongson,ls2k1000-i2s.yaml | 22 ++++++++++++++++++-
> >  1 file changed, 21 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/loongson,ls2k1000-=
i2s.yaml b/Documentation/devicetree/bindings/sound/loongson,ls2k1000-i2s.ya=
ml
> > index da79510bb2d9..51e23c189f7a 100644
> > --- a/Documentation/devicetree/bindings/sound/loongson,ls2k1000-i2s.yam=
l
> > +++ b/Documentation/devicetree/bindings/sound/loongson,ls2k1000-i2s.yam=
l
> > @@ -14,9 +14,12 @@ allOf:
> >
> >  properties:
> >    compatible:
> > -    const: loongson,ls2k1000-i2s
> > +    enum:
> > +      - loongson,ls2k0300-i2s
> > +      - loongson,ls2k1000-i2s
> >
> >    reg:
> > +    minItems: 1
> >      items:
> >        - description: Loongson I2S controller Registers.
> >        - description: APB DMA config register for Loongson I2S controll=
er.
> > @@ -49,6 +52,23 @@ required:
> >
> >  unevaluatedProperties: false
> >
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - loongson,ls2k1000-i2s
> > +
> > +then:
> > +  properties:
> > +    reg:
> > +      minItems: 2
> > +
> > +else:
> > +  properties:
> > +    reg:
> > +      maxItems: 1
> > +
> >  examples:
> >    - |
> >      #include <dt-bindings/clock/loongson,ls2k-clk.h>
> > --
> > 2.52.0
> >

--
Thanks.
Binbin
