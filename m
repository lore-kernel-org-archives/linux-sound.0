Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01392FDC57
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 19:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774897869; cv=pass; b=LBBAlmcvpmD9Casg0MGGSH10kgjFRgcFD2TsQiFQu3DqRmwVwluoJyFQws9K2BXTF9OyGZz8EQHiIC4+rNgrg6H91ZKMCKHka3+7sIu0zBqIptiOEPfZiOVZxxJarE++amvOnKuJ82bxCk6yv+aXTKF7CctgaIdgLb6yQzI+SO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774897869; c=relaxed/simple;
	bh=bBqluKZrjDvkJ2sz16Us24mHBI6UQh8bxqWySviNgzg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aKRLV5xKiRbsL1RQUiODbx0N6WhydtT8hYQ7jVCDO8tCW1RfVZvPhhoel/Jj4/SV4Gfg+TWFEnl80g6vFQf8r66ZUIIpGil03MCYTBo3YhcbKSHaOSZmPikGcLxZDiPyfbiBB1gJiAxCWzm0B3JOejEa6On8af4uLdxsPduqQKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i02N8rz9; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i02N8rz9"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38ad12fb595so49139671fa.0
        for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 12:11:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774897866; cv=none;
        d=google.com; s=arc-20240605;
        b=GEmiNgQBS30uZcOTfSVigFMcwQXYJIBP5Yjvv/z5LGkk4L2OcNi11zEGKmPzssYV0Q
         nrpWZFLI5QIrabrv+cSLpr/hx8xrFVb6nmBFjmf1+yl8yfgs8cgkBjpCm7YoCn1L4rfm
         yRbbdHMhrD8z24sotw28f3LyWLh2orLhLIFAsGwCrcMng1lQdNBVgUke2o0D2EgGxhUt
         rpexHliLM1R7xQUawga3kXgeJZSTpEMBq2wyM1TnWv+04suzVszD88CdkCrfCLOcyQrq
         t4OYHtOb4rmqidber9SgRtKUTqFwa2TCdaFUvno+Go9j0YuuJg6BsfiJ1UesskXrQ6n+
         rj4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R4zGI0LF4C8bfxm2P1yp2Q5w8PnJvbwboy4UaVubM2s=;
        fh=JCJSPxYdu8Z9CqZrWj4zrwrgfC1SPWwgssepQpZTy6w=;
        b=kdN86sqicGoPVF2nW/ww18/F+RZFCrMYytdCfDoGUShk2RG6econFvNKrxPjqvrj4y
         V0/5GRUbeqHogcYL2RJ6EpNPa6qX8Mg5eD8U9hB/vA1/eaMLhQRxFA3CyZI49f0hHjsC
         2LTkvZaMymk3MNGcU7KF+1AftztFkFFX/U/Nre1oVoJnhQYfBgCrH7CwZOIBhZvxUqmI
         k8opMEStEb+dedb7fM2279C3dzhTh8j1NKu+d6kkAbc8+nJ/OSXwGEuAwbucbgvRjjco
         B29Hjl2/PuJ6Cfk3AB3s+pGHX3cCGwnM74iYh/PrLkVVSgNiBKslBxODP4/COp9wz8Si
         Xp1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774897866; x=1775502666; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4zGI0LF4C8bfxm2P1yp2Q5w8PnJvbwboy4UaVubM2s=;
        b=i02N8rz9/Sg7pXxvbBeOtwa0OPukryvitio5s57dQ2AiPGNHoOehY2syvkDTkN0Scq
         4PTyDOXOxx4BsOs6hN48JZfw+5IxyP9VxMLWeXJb4gVddcO9Zqe8i7Jk2YlKHAeTYaO9
         0l56Ag7Xeb8RUwMQMTgw9GyunyB6UZFbHdWM7AxX+zqiWur93cfiVYQKDysoI1udfeE6
         nrNev3QUNfivsauqqdrnQl2fvaOqqfze+lUF5SYez+X7briEWKjAK9c1+OXYC6Hd/zGP
         De0aVmYlgWl7KJ2U/HkAiiNYQyPUoWoXS3eJXewLG1ht/bgHZ6cqq7x1jZN7y/zthl6T
         A4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774897866; x=1775502666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R4zGI0LF4C8bfxm2P1yp2Q5w8PnJvbwboy4UaVubM2s=;
        b=dijXHX6me/b0g5pLZxSa1ekv2j02voEeobX6wEU53Q8wIsWxoQSDncoN9pBqcs5yNk
         MVxw2aOXFaIMyOm8fVYl3l0zXZU/Hvg3COULBuRLIgeY67OVfTUqz4yhunXav9MFLpAn
         /RKgmm/XUhz3yR99XJwhGp/acylM+dZ411+UTqa6tUgUg/wj2zGSO1Ta+QO3eCg3f0bD
         4Ud3d05Ah04HmX0hqszOExHZg3usMmpwHVbvoPMVGgicHGv49N+pUidpdwvGjOrmWLvd
         SNz09+82von9zp4+Sg9xJrFhDwDg2CFSNVxh2uub5CA0HQyOIw7PX2H2R2hMsgU5Huxi
         ccgw==
X-Forwarded-Encrypted: i=1; AJvYcCVmJdvLSa1YRkWMy3krUOqyJUGhQnh06PicCysROHZ8jVaqn7m1w6tuVdYy71NUI6hEMwkNEKQLELa89A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3+V4ZL6kQwH5yonTDcFIvOPhjCtl+ssST2I0vOaFFQaNdUi1u
	jlEbqlR9vhs+UnsqXbAMZv70EUE/HjGuk9keqrPL1gGfg6dD+bNsPSj97BpY6+ZhWdI7IeoeR7a
	RpDVAZB/PU1unap38bQ9PqcbUeCiUhGNj5h5R1L/Dhw==
X-Gm-Gg: ATEYQzy0uFYnXY0celed8nC9OL6q5Odqy2pWB2Meb2dWwBIAXY8U6PLFAv46wS1j+pw
	mvilFulIPmNvApT5WiSVUPfAiC3LCBjwWQAatfp9MyFO4fiQCv9bIolzF+jLMsBy9U2k7FLLjnw
	LJGk6UhqaH/i6i5ij+28lK6Kk8dynaY8fsIwo3n5GkWXFCpGYc31MYIhxEPuAZGqOtqLIoP4r90
	hjLewvHB7qdezSjOwdLNdkbA73ROJlynH2Rq26NhklidGwdqDoLvupt1GtfliT18zT2uiHHSUPF
	fwLU9gHP9M7yfGl44cPfekQYm6WtRTt+EyKRZSiY
X-Received: by 2002:a05:6512:124f:b0:5a1:182e:1fdd with SMTP id
 2adb3069b0e04-5a2ba97ae34mr259197e87.0.1774897865900; Mon, 30 Mar 2026
 12:11:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327121919.603768-1-padmashreess2006@gmail.com> <b8ca83e9-5a48-032a-96bc-a62990cb61f6@gmail.com>
In-Reply-To: <b8ca83e9-5a48-032a-96bc-a62990cb61f6@gmail.com>
From: Padmashree S S <padmashreess2006@gmail.com>
Date: Tue, 31 Mar 2026 00:40:53 +0530
X-Gm-Features: AQROBzBeF4r6wAKBuXcXygjEyOsXmpae9qyr2Nh1QRmRZXDtSAHuxUe1epk4uG4
Message-ID: <CAEjBr-ZkFWpMARTyVe7Ln7GYPEXAG5phKWUNQFkP2495MAe+hQ@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: sound: Convert pcm3060 to DT Schema
To: Kirill Marinushkin <k.marinushkin@gmail.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lgirdwood@gmail.com, 
	Daniel Baluta <daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 11:19=E2=80=AFAM Kirill Marinushkin
<k.marinushkin@gmail.com> wrote:
>
> Hello Padmashree,
>
>
> overall, your proposed changes look good to me, thank you for taking care=
 of
>
> the DT schema for the pcm3060 driver!
>
> I left a few minor comments below, but i am open for a discussion, if
> you think
>
> they are not relevant
>
>
> On 3/27/26 1:19 PM, Padmashree S S wrote:
> > Convert pcm3060 to DT Schema
> >
> > Signed-off-by: Padmashree S S <padmashreess2006@gmail.com>
> > ---
> >   .../devicetree/bindings/sound/pcm3060.txt     | 23 ----------
> >   .../devicetree/bindings/sound/pcm3060.yaml    | 42 ++++++++++++++++++=
+
> >   2 files changed, 42 insertions(+), 23 deletions(-)
> >   delete mode 100644 Documentation/devicetree/bindings/sound/pcm3060.tx=
t
> >   create mode 100644 Documentation/devicetree/bindings/sound/pcm3060.ya=
ml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/pcm3060.txt b/Docu=
mentation/devicetree/bindings/sound/pcm3060.txt
> > deleted file mode 100644
> > index 97de66932d44..000000000000
> > --- a/Documentation/devicetree/bindings/sound/pcm3060.txt
> > +++ /dev/null
> > @@ -1,23 +0,0 @@
> > -PCM3060 audio CODEC
> > -
> > -This driver supports both I2C and SPI.
> > -
> > -Required properties:
> > -
> > -- compatible: "ti,pcm3060"
> > -
> > -- reg : the I2C address of the device for I2C, the chip select
> > -        number for SPI.
> > -
> > -Optional properties:
> > -
> > -- ti,out-single-ended: "true" if output is single-ended;
> > -                       "false" or not specified if output is different=
ial.
> > -
> > -Examples:
> > -
> > -     pcm3060: pcm3060@46 {
> > -              compatible =3D "ti,pcm3060";
> > -              reg =3D <0x46>;
> > -              ti,out-single-ended =3D "true";
> > -     };
> > diff --git a/Documentation/devicetree/bindings/sound/pcm3060.yaml b/Doc=
umentation/devicetree/bindings/sound/pcm3060.yaml
> > new file mode 100644
> > index 000000000000..2d920a70bced
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/pcm3060.yaml
> > @@ -0,0 +1,42 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/pcm3060.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: PCM3060 audio CODEC
>
>
> Here, we seem to drop a short description, that this driver supports
>
> I2C and SPI. It's maybe not a big deal, but maybe we could return these
> details,
>
> as a `description` property? Let me know what you think
>
>
> > +
> > +maintainers:
> > +  - Kirill Marinushkin <k.marinushkin@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: ti,pcm3060
> > +
> > +  reg:
> > +    maxItems: 1
>
>
> Here, i notice, that we remove the description of the `reg` property.
>
> It was there originally, and in the 1st version of your patch, but not
> in v3.
>
> The description here seems important to me - being a documentation, this
>
> yaml could be more helpful, when it describes the meaning of the properti=
es.
>
> Do you think it would be possible to bring the description back?
>
>
> > +
> > +  ti,out-single-ended:
> > +    type: boolean
> > +    description: |
> > +      If present, the output is single-ended.
> > +      If absent, the output is differential.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +      #address-cells =3D <1>;
> > +      #size-cells =3D <0>;
> > +
> > +      pcm3060: audio-codec@46 {
> > +        compatible =3D "ti,pcm3060";
> > +        reg =3D <0x46>;
> > +        ti,out-single-ended;
> > +      };
> > +    };
>
>
> Best regards,
>
> Kirill
>
>Thank you for the feedback, I will bring back the descriptions in the next=
 version of this patch.
