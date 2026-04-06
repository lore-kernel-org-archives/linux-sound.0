Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5CE29405
	for <linux-sound@vger.kernel.org>; Mon,  6 Apr 2026 13:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775480408; cv=pass; b=hdffKHFwmTc8SXrOiVOvgD+2vR2tzMcCEfK+saKWJwYsk2Pmy0ckzOnJ2Q/V2emcGLTDlnZd8gTn7n2wpwtiBQ0KMK8nHGEF2GVND9fzuGvxH2XGYXd8MsjYwhiG8rLHKDd0MI29hiedYhzIgdJx6xu3HRw1vuFutrWUWpVQG0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775480408; c=relaxed/simple;
	bh=71WGBGMayEvABBF0fn5IqveJ4CNkW/N5vMCCLU3oCbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JxBalkMo8TNcLjOAVri3KNKyxhDnJg/D60W6oHTO4VhIgfq3TtUJqCKTzTSTb4Ue8t9zvY1Gx7lIYrdaIs0RvyV3u/g283GuEO2mRQO156ZI830JaL1LR0+Hkb9msLoFAfBDMSWs5z1eoIpD5gxb87Tzl9b9ZD5NmJt0vBJg7ug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VX3W1vq+; arc=pass smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VX3W1vq+"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82cd70febc7so3040811b3a.2
        for <linux-sound@vger.kernel.org>; Mon, 06 Apr 2026 06:00:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775480407; cv=none;
        d=google.com; s=arc-20240605;
        b=BVJsE/ncJRx09DcqsgqP9E6W7IjwD2DIQdwAcBqvMWrL2QOm0XZjz8wNH/jd4zaxlw
         7DM+v2fsNizP8Yv1W0ekiz5H6osBv1vRvSja2Q63IpqB2moSvvMHKYs/a4B87Fch5m3n
         G+x6Y/084hYPalPruqEik2o6laPkz0+z7foRfmdAOs2TPZXS0ciJkADZvCzvofx/cc5A
         kCH7/hPDZbuTtZIhuzOCTiOWVC4MzLr/oBXTxLIN73zuWd14VQrJxY4smY4QnId0F1yH
         6tEiqd0umJ1+ZTlpnhlLmAluerRCBv4LNdgChilpLpjfjf5FpPzli2OvJPvnKo2gJanv
         8mqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RgxYtygl1sS+JwTdfDRJk+SRB6rzeXJ0kjY/bbGJFGA=;
        fh=v0Jg5lDwa/oBniSwuNxDy4RuPKJC9G3/17jK9TXt7Ps=;
        b=S6FkkwMmfCjoaln2sS+uQbxNyY8/JKIYDKGCDW1GXNXsO29r58MGNCPhn1dQYejiFe
         pKaEoulZ40SFQznOl3L7yVarGqQ0wGyocuoHRM4kVy4prKJb5A3gCt6TK7k1TODc9Iv1
         iLZfbO8EQtT1K3Mo+f5kO1sNxLI7ZSg88vBwSE1RoPr16uGKcV04x2hisEMygS8gEWiZ
         kfgZpTuPAdSzFNAxbhW2Ics0w5HMNydjin/vIb5JtXPMJ9fSNNw1/EMIY3uuQyv8RHSB
         cnBJYcDD6heHDojw4g9c5lcvlonRhDX4db92UNdUMVd9CeIOux/hPxF92/uq8Y8+1m7F
         AvVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775480407; x=1776085207; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RgxYtygl1sS+JwTdfDRJk+SRB6rzeXJ0kjY/bbGJFGA=;
        b=VX3W1vq+C8i+aS5yB1tc3R5Aso+r/eXIzRVwGkOCo/mSGZ2FnPGx57EsIWXSiUUfFw
         WYmbxcchz3jCFemFzFcN7nR1lDUWmb4Tw6410wAnwUAk2aJ3BSToBlpb0HLKoa9Vr/qc
         uPDvfkPZS+0cdWk30UVgybCO4htmjGSBILG2NgVegvo6OWT9nBa9tga7aotl7K4kzt8G
         mPwGZ33FSHRIppXM1/CL75fFMKEVCrxTS4vdB8qLnJHmFhRHXHuEvJoJQql3+xYZ85oJ
         SPsUSM2DfQh9xSM0tsHNMl2nNPYC71TEGe0lIkO4YFBrptYwf4NzntGwoJe/olQbUMFJ
         PWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775480407; x=1776085207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RgxYtygl1sS+JwTdfDRJk+SRB6rzeXJ0kjY/bbGJFGA=;
        b=b1JDyK4fB9xCs+AuPnkQ2yytgpP4E/m5lTJ586KxvBPG0haY5R/oYvDf1ogEdF+9jt
         VP5XQWHCQCYvcm81pppul8vIyR4K+DW212RZlNMPos1vJpQ/Vngxmal7uxQVWBSKwUF3
         WztruegJgdswG33UEz4ZXq3fQ3UGizbWKCBATA2y2MQ5+IgZFiHZAjSD2Bj3EaBLAU51
         gA1gN3Ip5nFHSXeH4VycnYeAumqfrKeEwYL3+gyko8SebJ/fDQIlNlkrZrbkfVt7ReTm
         44tw+Y8zH9FhwlC1g4SB7Jkcf80VnkwAGTIIL4qYcRykIR0XxFsezM2RUBSNzyfxF3Kq
         l1SQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJUeJ/NaHmHxGOiy4MjIrGqm15fOvGoptabJUQaLKUEy9dLL8znMQLtoAa69hn8zay03pr5HahvDi8iQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwN55VFQ5p7wg+itpr5chLe1gAtldDsx1MJ2Wx1tr2pRldcCEj
	eKnu/JILPFVesTvzr6nMkb6o18CbQ0Ux+ZgDqwntNr99v3dp9sZnNr7Avjfhegu1yt7+g4CT9jU
	2uvjH6avxl9p2TFiySwxo9WALDq6birM=
X-Gm-Gg: AeBDiev8lm5XN0+46O0lzDhx6fNG5MJ9t413AISrzjCS6eeWYh9pddduR0/VGd3T68i
	5xCXNfEuGEv72gYOwbxuuR72hLy4qjMZHruKYtmt46j+x3y6kMRk7KgP6cHHNbZZknonqWFTgVG
	Nsy8LnrNgCRzd0MJp5dhKwG9ApdWyxk65NzLwsAxIOZLtbM7/OUalATYNHPx4OAcOzAuxLynaOO
	XJ64PjzWHyJMbEg41fHkwXyJu8thpUhp1xJD4ZyGU0EohpYcXYSqMygajww9/I9dJ6nCaob8TJ7
	UjaUiSqdIdTXj8hf/VBpMOixZtn56cvzPLhA0Q==
X-Received: by 2002:a05:6a00:18a3:b0:81f:31c3:2e34 with SMTP id
 d2e1a72fcca58-82d0da90bc1mr12334891b3a.25.1775480406401; Mon, 06 Apr 2026
 06:00:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403112655.167593-1-phucduc.bui@gmail.com>
 <20260403112655.167593-2-phucduc.bui@gmail.com> <20260405-ultramarine-orangutan-of-wholeness-bbcc6b@quoll>
In-Reply-To: <20260405-ultramarine-orangutan-of-wholeness-bbcc6b@quoll>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 6 Apr 2026 19:59:54 +0700
X-Gm-Features: AQROBzCHyrvZcOJgbKx4MTiVA2A71CHfHy4r9SQf2vs20ty6n_Z1SVNKWQPD9p8
Message-ID: <CAABR9nFsde-Hxk5cOosv0MeSisck9Aq6cWnNe2PFc-RJq87XUQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: sound: renesas,fsi: Add support for
 multiple clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kuninori.morimoto.gx@renesas.com, broonie@kernel.org, lgirdwood@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	geert+renesas@glider.be, magnus.damm@gmail.com, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark, Krzysztof,

Thank you for your reviews. I will fix these in v2:

- Subject Line: Change to ASoC: dt-bindings: renesas,fsi: add support
for multiple clocks to match subsystem style.
- Commit Message: Reformat to 72-75 characters per line and remove
manual line breaks after every sentence.
- YAML Bindings: Properly constrain clocks and clock-names by
following the writing-schema and existing
Renesas sound examples.

I will submit the v2 series shortly.

Best regards,
Phuc

On Sun, Apr 5, 2026 at 2:32=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Fri, Apr 03, 2026 at 06:26:53PM +0700, phucduc.bui@gmail.com wrote:
> > From: bui duc phuc <phucduc.bui@gmail.com>
> >
> > The FSI on r8a7740 requires the SPU clock to be enabled
> > before accessing its registers.
> > Without this clock, register access may lead to a system
> > hang.
> > Add support for the "spu" clock so it can be managed by
> > the driver.
> > The binding is also extended to allow additional clocks,
> > as FSIB may require more clock inputs, while FSIA
> > typically uses fewer.
>
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/su=
bmitting-patches.rst#L597
>
> And not after every sentece, BTW.
>
> > Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> > ---
> >  .../devicetree/bindings/sound/renesas,fsi.yaml       | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml b=
/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
> > index df91991699a7..225cd8d369bb 100644
> > --- a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
> > +++ b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
> > @@ -38,7 +38,11 @@ properties:
> >      maxItems: 1
> >
> >    clocks:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 8
>
> Needs valid descriptions.
>
> > +
> > +  clock-names:
> > +    description: List of necessary clock names.
>
> Instead constrain it. See also writing-bindings, writing-schema or
> example-schema documents.
>
> Best regards,
> Krzysztof
>
