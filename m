Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131D11FF1D7
	for <linux-sound@vger.kernel.org>; Wed, 11 Dec 2024 20:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733949325; cv=none; b=LHHl2nUB0kQrHu+FnpIpazcxfh8sxHxRubLhCXMMdcgHIyN8ELT0c21Ut7Clyn/WgklDPG/uHUP0VthdUl7lUGcKelOOegN7HJG1Ih10vUr5WKVxbylyDF20V1HCouTUTN6yEGLBePUlAKegT0nE4UMxOfYN0BZPYTarHqQtHd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733949325; c=relaxed/simple;
	bh=Tj2T0jHpnxc9hzjyEB3IbVNpdJMAMoG6iZPl2j/XGQ0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=iM435GYqEsERj1kv1Q34x+6YqN7BrIRSzAJjdTHcJf8ZDo5YGhCaMIjbrHvf7B1FXUHMq3kCJI7n3/ZLlB6Uoji7cFNcTGoHBlAx3CK6BmTEjwUr+2wausGLrjbgjSHagD/xzOYCWM9WAUGlKtlYH4VRfLAGErkPsH1ow7HhjAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ypZ384k9; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ypZ384k9"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso14694245e9.2
        for <linux-sound@vger.kernel.org>; Wed, 11 Dec 2024 12:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733949322; x=1734554122; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFRzH/Iv8Aaw4sWsAQhZm9VRnaxy7gZCZYmxkSDRSlw=;
        b=ypZ384k9YprNIGK66fxB1tBMaGFZiqNxEgZpDBoUf0l5QFURs04aCjOwHkxHPH5o5u
         WPctAyhqptAoNfevf9fmLHovXIv6eDKEmyb76mwZWH+lH1yESx5YboB6F8PPolSdP5zd
         8v+U/mNey4rMSfcgaZlOeWh/Y1sGF340JRN0bbrbt2mF0ogGtFc2BzwwbZCJUR7hecEe
         CKtLTyYQDppU8zDfszGj6RnQ60Hch3czjrHltn54ghNI8fpWvEst4HFkk/51v+ac1SvU
         YN4B2LE1Yp/Gh42oj0ygFr7p/ebpm6UoMqHVqhLe44CTTNK5XB5wIllBo0dqoUUUiqly
         aGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733949322; x=1734554122;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uFRzH/Iv8Aaw4sWsAQhZm9VRnaxy7gZCZYmxkSDRSlw=;
        b=DGJ8+NZ9hpB3ot2D7PXM1JlMKH1/qKx6EOrTj+D1E04bB1fcjJjyO1fEm9v5KTl7Cw
         nL4qRPBNY4jMFmP0xKW0t/TTvogFJdJ+FL+OivYjncdvFNcdW5vkw4+qJqulA1IQUImO
         0YW2BSLbqnsfgThghmPluw5Wjk6VL1qHXEQJzaSvUbpoo/7mxbnwo0fA9hSd4Tof27da
         SmBcJIFVZlF8VuS+AtT0mJYbFVa255V2Tqw61Umf3UOsnM3jtaQjktsBxc85dG0Of4+F
         Gt7sSymj7blXM6kPBznTe9wFProo4eME4d+QYrvzYAAhuQBo6wLp6TjyjRBwFJwnosqh
         S8cA==
X-Forwarded-Encrypted: i=1; AJvYcCVpfVH1JTLYPy2yEecAkjBYqj5T9gvBNlHT5OGRV/UHwvppk78qAJj2VVgwiI0MM4NRspxmA3sJuRJWLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd3zTihOC7f5quOHdCwB+l6khUzBv6gP2sbYXtFHB/SRj0z4eP
	CJ13mFNhgtRuFmIAqEZB79FDSiVII8KFlNthw6zAlNPrDdQzSA290Lhovds2xfU=
X-Gm-Gg: ASbGncvrhP8B0odX3XJNobx/gtRBiTRRmuvYyaJftFdYb6H/tV5OMgTERAackM29DiH
	M1QeWGj/VRRuU2jG/gBn/kx/Ch1eadyMu1SSuBUHoQKjyZw1NwEB+EOeU1H6gBcJPLGEutBK0Sx
	qq/Eit974sNM5bxwW5pHMhVIhlq/s/s+zGC6tNPT/xfC5KdQr0B/Prg3n+x67b/oh4ju4MBDvVa
	RTQBwYvPLA2Ty2YKEUgxX5IxpqwysV3Q8TdI7v9YpNW3sEKTni5i61n
X-Google-Smtp-Source: AGHT+IEvGMvfNKL3Lr/V0TIh8L5co6EyNTn2QDgjDa1ZNU6WRGQ6MpM69ERpnAXmDRumCMLvlZCOWA==
X-Received: by 2002:a05:600c:3593:b0:431:55af:a230 with SMTP id 5b1f17b1804b1-4361c43ed3fmr33174845e9.33.1733949322346;
        Wed, 11 Dec 2024 12:35:22 -0800 (PST)
Received: from localhost ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4361eccec81sm25126715e9.37.2024.12.11.12.35.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 12:35:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Dec 2024 20:35:21 +0000
Message-Id: <D695QHHBLGUF.7HOOI1E8RMTS@linaro.org>
Cc: <broonie@kernel.org>, <konradybcio@kernel.org>,
 <konrad.dybcio@oss.qualcomm.com>, <andersson@kernel.org>,
 <srinivas.kandagatla@linaro.org>, <tiwai@suse.com>, <lgirdwood@gmail.com>,
 <perex@perex.cz>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 06/10] ASoC: dt-bindings: add wsa881x-i2c binding for
 analog mode
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
X-Mailer: aerc 0.18.2
References: <20241101053154.497550-1-alexey.klimov@linaro.org>
 <20241101053154.497550-7-alexey.klimov@linaro.org>
 <woeeh7cosv47z4ckqbomfc3rqqxfolyfycgcz32do2yadg7xdj@geqank3dp55t>
In-Reply-To: <woeeh7cosv47z4ckqbomfc3rqqxfolyfycgcz32do2yadg7xdj@geqank3dp55t>

On Fri Nov 1, 2024 at 7:57 AM GMT, Krzysztof Kozlowski wrote:
> On Fri, Nov 01, 2024 at 05:31:50AM +0000, Alexey Klimov wrote:
> > Add binding document for WSA881X family of smart speaker amplifiers
> > that set to work in analog mode only and configurable via i2c only.
> > Such devices are found in Qualcomm QRB4210 RB2 boards with
> > SM4250/SM6115 SoCs.
> >=20
> > Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> > ---
> >  .../bindings/sound/qcom,wsa881x-i2c.yaml      | 103 ++++++++++++++++++
> >  1 file changed, 103 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa881=
x-i2c.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa881x-i2c.y=
aml b/Documentation/devicetree/bindings/sound/qcom,wsa881x-i2c.yaml
> > new file mode 100644
> > index 000000000000..51b040b134d2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/qcom,wsa881x-i2c.yaml
>
> Filename must match compatible.
>
> > @@ -0,0 +1,103 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/qcom,wsa881x-i2c.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm WSA8810/WSA8815 Class-D Smart Speaker Amplifier in Ana=
log mode
> > +
> > +maintainers:
> > +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > +  - Alexey Klimov <alexey.klimov@linaro.org>
> > +
> > +description: |
> > +  WSA8810 is a class-D smart speaker amplifier and WSA8815
> > +  is a high-output power class-D smart speaker amplifier.
> > +  Their primary operating mode uses a SoundWire digital audio
> > +  interface however the amplifier also supports analog mode and it
> > +  can be controlled via I2C. This binding is for I2C interface.
> > +
> > +allOf:
> > +  - $ref: dai-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,qrb4210-wsa881x-i2c-codec
>
> qrb4210 is a name of a board, not codec. i2c is redundant, codec as
> well. 'x' is not allowed.

qcom,qrb4210-wsa881x-i2c-codec came from qcom-soc.yaml with the advice
that it should be qcom,SoC-IP.

Anyway I am working on updating the qcom,wsa881x.yaml as you pointed out
in another email.

> This is qcom,wsa8810 and qcom,wsa8815 compatible with it.
>

[..]

> > +
> > +      wsa881x@e {
>
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-device=
tree-basics.html#generic-names-recommendation

The best I can come up with is "amplifier", or it should be at least "codec=
'.

Thanks for the review!
Best regards,
Alexey
