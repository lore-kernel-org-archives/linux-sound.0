Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687B0334C32
	for <linux-sound@vger.kernel.org>; Fri, 21 Nov 2025 08:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763714280; cv=none; b=SrR41tgvCVkuF++a2yNrHdB54jccyELf8HKbnuQMoTHsO3cupwsD8FE4L0gbv1uKAMxuGCeB/KYYMuflEp1JPxKC0TLQ43nG6s5PT+DL9QopE6iEI51qYgNC9FMo+970ut67XhCfYMIxZcmZJmnRsVquM7d6EonI6p2s43E6IDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763714280; c=relaxed/simple;
	bh=RKkdw4ds7xIqmoTHkH7/H9YNJfhbbWsH8UZSL9tFY+Y=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gXB+WHlcGe0/qpjV461JzENeVbJAPmq2eZoYGtnTwUtusAhouwWlnpXjk3CEmP0WM7PgxO7LM3PkQO4habFECDC1mUyUWAr++O8M36dQ+Ueg9x5L+GuiV3YeAnlVqUS2VHk0NM+D4EhHY2U3bERYFdbmOHFGCTXVhVkZOyB/Srs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aIWaNk/8; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aIWaNk/8"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so15100945e9.1
        for <linux-sound@vger.kernel.org>; Fri, 21 Nov 2025 00:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763714276; x=1764319076; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2qSXvzlmdS35P7fsTtvXLVpdTT/36B4mvzOkNUVsHgc=;
        b=aIWaNk/8NLiLVI2msXyx4lwLhrqBnc9dVziauHradjT2g7FMKRtyMAGhAV8jhllY7H
         eyDudQ2ryXPagk0DS9u6R7OI5LzNhOWYBwXL7ikR3RH3bAG6wDZhRl84rmrxmc5hxXzH
         ib/4VOuHFujDHv4WtGwSmpax8VRSUm5lq/SgRaEtDk5PiHCjQYmZ0URHgTuifSowXIHl
         iBHT7lQE/566BeSg0fSZLyZHDaN4tlakFRko24zW7wnYBEZSrS6yRGr3XVFWIdkQRa8W
         Wk2sjVHKar09xaPAO82vAPOBU4V22v8+AD1miZNswHdt0OShQBx3eQS6c73VRkHcb3SA
         D9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763714276; x=1764319076;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2qSXvzlmdS35P7fsTtvXLVpdTT/36B4mvzOkNUVsHgc=;
        b=Dd1FL/MS2yFbuvKEnWnMBwVVr+nITa6sxzd8LwNPYDOoDTIRyyPM3RMvotUl0j5vQL
         ZPfMOBkXiV51OSFtbYxTfEHa0VO9f7fXzs6m960jKM6VNaucgR//OQwIkG4TERPj7hu9
         VvIH2ghRSxZXZP14qsVHYrp+5DUP7BoicUbWvjMABASMFkml/Afve3PTwTC1sxhvRrUg
         x1U/3mbZBL0V+hHb8hAyqw5e5RkQ57tTzQegecU31me3B22q4qz0GIWW0Vq/sEJkHMo8
         JHy3L8BCYXuCuljl704l7xbFlONZHLUm/QLAXXH6W3662tU1okNIxHfrrfVihYNTZB8C
         py7g==
X-Forwarded-Encrypted: i=1; AJvYcCUnv/x3uw1nBt/hG/8o2HO9bvoVszszdSWWqbsj92gsuLf+/LQV3PivLebL1Fyd0ySRohCWgZfAhem4zA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKPKhPR3qtC9HpipHIDpjkU3TlFF+4/uxCG/ODBJ856otulhXF
	B6vo6dey5KkXdGxhjYf3dcCqBUG1E4eHZYPzDtD+I115qeGsy+Uzewqi
X-Gm-Gg: ASbGncuTjYk0LOANmi0km1DgFwnQY+49YhSlyz3Dz4sUKlVZB2HZ4mcGWwdkOitZCr+
	c3UdvDjctuQCy3t0KpA5qZsMZb7xGQ8nsqMaMkSRuJClZ68FtK/qJyCerMdx3QBYAdT80pCVvde
	cOTz6EOkgHOcb2wW8YC0vqS9Fi+AbcL5Mlh6prr2NlzYMuyBUDIiGAXjLs8372wRPVJG6Ix5B26
	Ca3piHOkMuB/4TC/btZXQ4grIp3Bcu4YGuo4WavR9tdt6TlQEoOWhnhQvYRJ0BCXzL9AYLakVbA
	14puG1G+rCyPxNvmux+23se3IHrX9k2YDCHiDtp5X7h/305j89eoxtm9NzT28Lhr1+/QrSnjEI7
	PYpQUHa6XeiCO+wrvRxxl4We77ZQ5gO5E/uJQiwjwkOT22hAr4IGoN1QzYvwGdTKjak1TwzAZDR
	RBQmlHNcOeMba6yP8fRtdwTgtZ668g+JFHWgoNeUE=
X-Google-Smtp-Source: AGHT+IEA+dyN8n6gI9VghYdVrCVyA5Lkx+Pi/7Qw0bW1qYcQrv+1D9Mt2waBz7nsc6tPHypUcxzIAw==
X-Received: by 2002:a05:600c:35ce:b0:477:6d96:b3e5 with SMTP id 5b1f17b1804b1-477c016c071mr18413245e9.7.1763714275447;
        Fri, 21 Nov 2025 00:37:55 -0800 (PST)
Received: from Ansuel-XPS. (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9deeb96sm82356155e9.4.2025.11.21.00.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 00:37:55 -0800 (PST)
Message-ID: <692024e3.050a0220.183811.f1dc@mx.google.com>
X-Google-Original-Message-ID: <aSAk4XQ-S6d7iXUs@Ansuel-XPS.>
Date: Fri, 21 Nov 2025 09:37:53 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, upstream@airoha.com
Subject: Re: [PATCH v2 2/3] ASoC: dt-bindings: Add Airoha AN7581 AFE YAML
References: <20251121054537.25796-1-ansuelsmth@gmail.com>
 <20251121054537.25796-3-ansuelsmth@gmail.com>
 <20251121-daft-secret-collie-629a2c@kuoka>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121-daft-secret-collie-629a2c@kuoka>

On Fri, Nov 21, 2025 at 09:36:10AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Nov 21, 2025 at 06:45:00AM +0100, Christian Marangi wrote:
> > Add documentation for Airoha AN7581 AFE YAML schema.
> 
> Drop YAML and YAML schema from subbect and commit description. See also
> submitting-patches in DT dir. You cannot add documentation for YAML
> schema. It's like adding a Linux driver for C code.
> 
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  .../bindings/sound/airoha,an7581-wm8960.yaml  | 67 +++++++++++++++++++
> >  1 file changed, 67 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
> > new file mode 100644
> > index 000000000000..ebeda0876280
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
> > @@ -0,0 +1,67 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/airoha,an7581-wm8960.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Airoha AN7581 sound card with WM8960 codec
> > +
> > +maintainers:
> > +  - Christian Marangi <ansuelsmth@gmail.com>
> > +
> > +allOf:
> > +  - $ref: sound-card-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: airoha,an7581-wm8960-sound
> > +
> > +  platform:
> > +    type: object
> > +    additionalProperties: false
> > +    properties:
> > +      sound-dai:
> > +        description: The phandle of AN7581 platform.
> > +        maxItems: 1
> > +    required:
> > +      - sound-dai
> > +
> > +  codec:
> > +    type: object
> > +    additionalProperties: false
> > +    properties:
> > +      sound-dai:
> > +        description: The phandle of wm8960 codec.
> > +        maxItems: 1
> > +    required:
> > +      - sound-dai
> > +
> > +unevaluatedProperties: false
> 
> Please place it after 'required:' block.
>

Thanks for the review. Will do!

> > +
> > +required:
> > +  - compatible
> > +  - audio-routing
> > +  - platform
> > +  - codec
> 
> Best regards,
> Krzysztof
> 

-- 
	Ansuel
