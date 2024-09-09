Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E161B14F8;
	Mon,  9 Sep 2024 08:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725869578; cv=none; b=A1BLQNdlJI3ESMYucmRxO2V/T1VYKoS/Te3xqoOGMPZ4EBLtQJ+/+H4+RGhZIhVkCW3EAK71VXv32ybUSbD73MFLm3JJmSC/UF+HrlbPOgPA5ZRaqn9uEUDh08QEynyGfIj0I0X1FuUD4TkJdd9SwSNnDahN5d1KA4lb/9iRD1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725869578; c=relaxed/simple;
	bh=qn1o8Intnk0JCIq1CUGzHv/zXzVk+ma3u3ksckHSnV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y3A7JwhE4vmESAPPdJX/oyawFc5OBJNajhtcYVBGVojHKWCyHpjaGwwFyUAq+RzS5fwQ0u2CdBrHxSXEJwzjSJ94MWclShETqAobWpTkp3Qg7cU/FWqJQceSqjPqIg1j6nFRCGhMfm+oaXWgIEUkKbHpzCUUa3g7BXiz/6Yge4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=buAXRUe4; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="buAXRUe4"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53659867cbdso4337543e87.3;
        Mon, 09 Sep 2024 01:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725869574; x=1726474374; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mKbJpq6YIA11aEfz21wae3H60/ixEHXlJ4hbELPq0J4=;
        b=buAXRUe4Qw0V/hR834zf5ajmzx20ym9p0letzBP6bQp31X3ZPprHcUV9bDn++Q+N13
         r9jy7q+tIiNo7981r/wCMtBv4LDAa7Wwg3aWY68oWBbbIrDdJH0afTjDzeuSp37EVClE
         ywngmE7izHdxRF6I5cHbZcs5x8Ps0oMIrGJEOeSuDangaKMrmyJ4hLXrPrwX4AW8MXJ8
         MF9w/Ha1wc8J9IkjOHdN40LT02Gio81NAaqju1K5KeTVRYWH5G2iKe15FVAc3lK0Ez+U
         k1uGN6axOYccUUbbbk3v37B5Sq3Mp1PLY08OfCntoWxmkI2/SIu1K6Ywn7rXby/2V7w5
         kCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725869574; x=1726474374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mKbJpq6YIA11aEfz21wae3H60/ixEHXlJ4hbELPq0J4=;
        b=RzsgvlxTNdh5zZcUSe96Wps34hszD/TPUxXD06vZnEmSqXUvsqIP55xy5Leb8OC/AT
         7+7kLNqA/ErdcRALpTN9JoIb1cTBe3vyPg6KVSPoAuX62sQ2M1PtyCjV7k4saRq0PooD
         BYkM+FsPhwszk0Xdxfd6/LJJmdTr8EihC2KQpMQyY1pG0cThK7R0ATFWW9O876O9SVqP
         AjIq4oHSHq3g+qRtJPQUjSCNUepFErS79+FdaziqV8Bubd4W+l694dIaoBFPkhxVdtAp
         AnvW4R13oCZ9wPadKcnGG41F4FmQHBQ7kXNH8HvuI57t4Q2nc8XgeMzjHXEc7nvu9grW
         2PPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVJVVJlBLro9+8wUW8qdug9m6k/qGQq207cLiji6JN8cZKdZ/yAMFgJuCd6rOe116pD7mbs3O2XR/Lzq4=@vger.kernel.org, AJvYcCXq0jyWAcAsi2fQRUNz2aXJveeSjPieo3EsJYYljoWjsM2BFvXHbK4LN5jBMQyYm3emf3xQuAKAoMKD@vger.kernel.org
X-Gm-Message-State: AOJu0YyrCfIloipEADpMmX9NKgL93hFD8mb5YMhsZCq+fUc4Oj47pg+R
	l22ZW/6+ZqE/nSrdSarbcAjSygDYyyEPLiw6+wDnwe+gSXCMuHR6vb/I8JpgHF5nKVowiOICWN5
	s8tZNpVBXqnb4sDvhJB6wswiyQ8E=
X-Google-Smtp-Source: AGHT+IHnQ8xuztnsBBgMvF4HoqhobltRiRUWVc47gSpztUAjtDauIHerV4oHBCZhp65S/wW7OsWE+NRnD31fY1WpNhQ=
X-Received: by 2002:a05:6512:1245:b0:536:54bd:8374 with SMTP id
 2adb3069b0e04-53658818949mr5167330e87.60.1725869573576; Mon, 09 Sep 2024
 01:12:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1725518229.git.zhoubinbin@loongson.cn> <e987b0beabba169577c8923557690984f226b29b.1725518229.git.zhoubinbin@loongson.cn>
 <zes7kfwmz57lhyfvxuyk64n7eykb52txxatbqgqnue7e3yab7g@d7cg7ql4gyl4>
In-Reply-To: <zes7kfwmz57lhyfvxuyk64n7eykb52txxatbqgqnue7e3yab7g@d7cg7ql4gyl4>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 9 Sep 2024 14:12:40 +0600
Message-ID: <CAMpQs4Jwms+P7Uu-N1koT8WYKW8KCdMoo7pkPkdaO2aY7TAD+A@mail.gmail.com>
Subject: Re: [PATCH v1 01/10] ASoC: dt-bindings: Add Everest ES8323 Codec
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Huacai Chen <chenhuacai@kernel.org>, 
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof:

Thanks for your review.

On Fri, Sep 6, 2024 at 4:21=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Thu, Sep 05, 2024 at 03:02:14PM +0800, Binbin Zhou wrote:
> > Add Everest Semiconductor ES8316 low power audio CODEC binding with DT
> > schema format using json-schema.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../bindings/sound/everest,es8323.yaml        | 49 +++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/everest,es8=
323.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/everest,es8323.yam=
l b/Documentation/devicetree/bindings/sound/everest,es8323.yaml
> > new file mode 100644
> > index 000000000000..0450d0f49d03
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/everest,es8323.yaml
> > @@ -0,0 +1,49 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/everest,es8323.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Everest ES8323 audio CODECs
> > +
> > +maintainers:
> > +  - Binbin Zhou <zhoubinbin@loongson.cn>
> > +
> > +allOf:
> > +  - $ref: dai-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: everest,es8323
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    description: clock for master clock (MCLK)
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    const: mclk
> > +
> > +  '#sound-dai-cells':
> > +    const: 0
>
> No audio-graph-port? Are you sure? It looks exactly like
> everest,es8316...

I checked and they are indeed very similar and it seems I just need to
add to everest,es8316.yaml instead of a new file.

Thanks.
Binbin
>
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - '#sound-dai-cells'
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +      #address-cells =3D <1>;
> > +      #size-cells =3D <0>;
> > +      codec@10 {
> > +        compatible =3D "everest,es8323";
> > +        reg =3D <0x10>;
> > +        #sound-dai-cells =3D <0>;
>
> Make the example complete. Assuming this binding stays...
>
> Best regards,
> Krzysztof
>
