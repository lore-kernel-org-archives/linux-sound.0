Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65ACA42049
	for <linux-sound@vger.kernel.org>; Thu, 12 Feb 2026 01:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770860640; cv=pass; b=i3D8WQZJLeJ2Z9IN5bQ5yw6e/DPfPrrtT9Q0m9zfpqjRtxe+o+Lp221FxIv7wQY5ukkQfPaFPGVogxTKRTI3BNmDv9fkyoRFoiKPbr6a6ITLvd1r7c6vR77WenLIGgGk5RWLjHg5D5o7Lgsp9U2dYxllychUdFakT+wcS+oMTbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770860640; c=relaxed/simple;
	bh=wpm4nYoZnr8E0vskVsJSqDnE31Nxigu3eBCbeG9fr34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b1x2mvbgwPcvJ7VON2OYj4jSij8w4Gshqjg+iG4HRY1zRw2mfLXjIoj8MbafuwfOrSuc8EWesksEryFeUkcyoNbTqN1SCZAdATVcjNCg4IqnxUaNm2KnajcTtqyUcFAqZLrEVD0yaD3I8Q7SimHymVAVyC8DyFYG4TRZLhJ+c3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DkJROqcx; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DkJROqcx"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a929245b6aso52653345ad.0
        for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 17:43:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770860639; cv=none;
        d=google.com; s=arc-20240605;
        b=kMZxadbz0kuta6J/6md3OoKTjygzKyqTCvo9AWDwaChDPkoddouewEFCiOhu7A6FzH
         lY3YrNNJu+Q1zZGaDcZU8D+Qv5TS6xCPnCUjJ2pW7YzPZ5COWweyrVVwF6+uKK6A9E5S
         ZS4ne91yXsH6luhjxihU5PSa7c2hBUfCfRYgb0NrElexZ0igsy6pxAHci/GYQzj6x0gP
         xdvQITfWpPfBOdk6j45YoBKoJ2zQe3TEkDYRjyktduIBm/RAuQkyX23SzcK4uEAQqlWD
         yvcjLyexIZdb6PjfAzhAL9/zqVMhKRPagN2QTupOXwJQp1dUr4HhASMB7muOWU7zJh43
         VwPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RFgZzDUL8NQEcuVi03CI+wzULvYUmUij2odZG0YI+uA=;
        fh=aJSDQCzlkpGpcr6qpD8Z7VvLpKr9oa8cKWC8OycJXLo=;
        b=cvRJF/6B/Lo59FMgeZGvZNP27NB3hoGF3VGgG3emXnpe+dXfrgyGZ9R/T1CrA/G2oL
         jwvD9kQnl/UhkIUdlRoPihkI6QqJxphoqtQVRpdiVC0SaXsoGLLVNvc+Zmrjx40nc3ni
         TsdJei/02PLtWXK76J6jEcF8RcnTxMErxQNCXVivssaoFJzcgZ/pV0tExojkENO0WjVQ
         AAAwx4aD5m3EdJaxCk24rtMeIF9hTZVHuq8O32klpk5OoiZhdMDoMzKXueafcnb8D5wF
         SDbETjtdGXNAMzQDHcFU8hoKnTQeHzDJJUUSmhz2fu1SMGZVDGXUc7RtDlXoMSMVjS9q
         L70w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770860639; x=1771465439; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFgZzDUL8NQEcuVi03CI+wzULvYUmUij2odZG0YI+uA=;
        b=DkJROqcxhIXeah8FTEXgBkIKw52wgqDum0lcM/f+IPquKRbifOwnQJacyVBDdGHbUX
         6fWkFzx9RZ7dDCen+Hn7ioPUoCECctnpV2zpYiInMEakCO28ckO2QcarnisGxRBCo4/B
         Nj88vLEkFla2+iI1RVpn/D2tm0iOq1Z3glM9Q+k/GLaX2gZm2w3Q6Hcz/ms7xyhrIxbW
         YLxYM/kAW782aY3tcM2FGBuLeUvcufAM1+9EZr9RmeT8upaYXQ5oKjuT6eeGy0o2wwXf
         SdPzAieWHtHRTjosG3fleMA6pU3TBFf156MTNALLHNptWcdKlMypeEeT0NjttPAVcbvf
         stIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770860639; x=1771465439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RFgZzDUL8NQEcuVi03CI+wzULvYUmUij2odZG0YI+uA=;
        b=f/VMm4xBGI9BpMmGlSvl9g//Lqcj60w2p2ENfGZSrMUf0fTcKL29oPC84bm4NgewDO
         73ZcxzmZIHJOh05JCRyTRJYOwkfPiyFwtS8g8ar/7N3sRV8IMGpK1+ggCnIoNCyK/NR/
         u32JcYi0KKJIOnUxrVhdxkCxoxVwgT9qRojYVoY2c9Wa7ge6fIqERqg3Wsrs3hMyI41J
         +MxXPNfn/9x9rRw05MUrQI8I86DeTy+1EZ0go7y1ION/qzCPOPgiRPO/2OpdrsxhZcYY
         a3SPYZYrfWV6d52Oo6DrKa8PDT3Ytrh1pc3tDSCbMG79XdxCKQhq86+jA9U94r1CosI5
         atbg==
X-Forwarded-Encrypted: i=1; AJvYcCV7+FTg/KCtrDLkxyIMycmJqaMDgnCmX0u3syoOo0kXhx5Wqnz2JNlw9e5CxJedB4RMHLj0QVpJFGQtjA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6pGbXRGgPdpom/oT1eCuooWbViNHpIXQSF0o+502T9fhe5DRc
	EZg1dnIzT9JcM7X5zKJMe+/yI8tu9lfxEXLs1Zn7ARSSC/WVsk2QlVNvtOcXPaRjB8NNY9VN6wq
	XC37Lqz8FpuC44DngW5/pSukBooWrtSg=
X-Gm-Gg: AZuq6aIvZZom5o6OmularHimG/X9Ishyj6CwDDD30gIKsZ31PIuIzzREXeTUv9VxiGw
	aAiQWP8eL43vRhhhZpnkekrM9VTZ224heVzA1rldprdAfsyNGM27fhqG5AwNxv3V+0/KFt1qrEc
	JVQFsznTF0tkaKNLVbOwMZT7BqmJus9EGYBTFivXkUX4xTNd7yzaMZ8sdVBIDYOM4jopgIX3gKd
	LCMFjn5PWBuFOXVq3Fkk6CAjKb3Xu0nf8+Vy931l1NEeknXsYEIbm5PrFYdi3Df0JoWeEq4n114
	Y1Vn6fE=
X-Received: by 2002:a17:903:2f0c:b0:2a7:9592:210a with SMTP id
 d9443c01a7336-2ab39c29a48mr10091365ad.33.1770860638714; Wed, 11 Feb 2026
 17:43:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211093527.2892297-1-shengjiu.wang@nxp.com>
 <20260211093527.2892297-2-shengjiu.wang@nxp.com> <20260211215346.GA3958740-robh@kernel.org>
In-Reply-To: <20260211215346.GA3958740-robh@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 12 Feb 2026 09:43:45 +0800
X-Gm-Features: AZwV_QjAVRht36rdtyJlQLcJz5vrrk7UWVke583zejwvcdcPOTiO2Ws4TtS541o
Message-ID: <CAA+D8AOTgp9Oi3puOdZv4oYTHGBVHtgbBRV-U10hzMJMpQbBJQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: asahi-kasei,ak4458: set unevaluatedProperties:false
To: Rob Herring <robh@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, broonie@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, perex@perex.cz, 
	tiwai@suse.com, ckeepax@opensource.cirrus.com, 
	andriy.shevchenko@linux.intel.com, nichen@iscas.ac.cn, 
	kuninori.morimoto.gx@renesas.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 5:53=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Wed, Feb 11, 2026 at 05:35:25PM +0800, Shengjiu Wang wrote:
> > When including the dai-common.yaml, should use unevaluatedProperties:fa=
lse
> > according to writing-bindings.rst.
>
> Generally true, but not always. Do you have an actual problem? The only
> possible problem is you want to use "sound-name-prefix" property.
> Otherwise, you don't need this.

Yes, I want to use "sound-name-prefix" and "#sound-dai-cells".

Best regards
Shengjiu Wang

>
> >
> > Fixes: 8d7de4a014f5 ("ASoC: dt-bindings: asahi-kasei,ak4458: Reference =
common DAI properties")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458=
.yaml b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml
> > index 1fdbeecc5eff..259e97b7a3c0 100644
> > --- a/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml
> > +++ b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml
> > @@ -60,7 +60,7 @@ allOf:
> >        properties:
> >          dsd-path: false
> >
> > -additionalProperties: false
> > +unevaluatedProperties: false
> >
> >  examples:
> >    - |
> > --
> > 2.34.1
> >
>
