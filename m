Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD523B8D42
	for <linux-sound@vger.kernel.org>; Wed, 21 Jan 2026 10:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768992455; cv=pass; b=hVF3QoVsr4rXoOMdZHsEbGiR8b9oEjmPeMitlb5hG2bmhrWNTu9Q629aEquxbevAYDIWIRVt5NtW4F+FW0/d+AGDHCJkII6B51K/wbVi4Ods5gS9/To3qPXC4Kld3qpTZPtcxNLH+fNxZj4BhbB6WvDRBTrDMg7eWCOItBi+rMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768992455; c=relaxed/simple;
	bh=x1Jt80LN5/N4tHUEJT3M8l8NQh0Ouao1/CX6fzyd/jc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wj3sFvMzVtBqltJF3z1dm8Z1wa5Rr1h+/bkasUHkk7tekgBnpU/tyW6pKBskBZArr8lH8zbK9zSxyyiCJf12yhCYZpYYpw522wg2WGgw8LKY0fePojX5mM/heV0+suZPBwopquP6xqRDvuz356YJa5G5W7mlVoaLgalyy+LaKyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iDp6n6Bo; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iDp6n6Bo"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35305538592so403805a91.0
        for <linux-sound@vger.kernel.org>; Wed, 21 Jan 2026 02:47:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768992452; cv=none;
        d=google.com; s=arc-20240605;
        b=RNWYP/M3cskDzIcjrCy5i9za/sorQ9uMbiYN8ZrXDmXprEqAvh76vvBIDm2AoeAg/Y
         iXdQuztFnnI9rUqIai38hNNoRMk/MhjGYheWbhHiJ14g17SBNiHkkhO8lPcexjPjj3zb
         GjfcOEG5mdiaqPzxtcE94/y9RjDNz50UcWKLV/DAx4IRDv0NFjk7JeT2IRlhBYNGjL6P
         iHRiYeeGMLOOGNkhFOpvjEM6CtdEP02CJjy2qZQmRD7nYxNt7MbrKFASyycHjOYcNDrh
         z96bQDY/crnmVNQQh9RoUqU0yg7w1LCxY+r1lO3fnUicaqXYU73g7dUT6AtDs8y6gOpM
         bfwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/fMXkDh4NuIGqP7vK0ebKmRodxeqBxQ37RgaLup8t8A=;
        fh=8gvcjGUYydU4X+s8CxU1aJbZTKBfBi4yEb+GeOkoowM=;
        b=X592Vf+G4/5aqnqCdXuAPocvzKPEni+FFerwPf7yx2LZ6Ok6DEyOmGiaEU3P6QwIoX
         6s5xp84B81gViZCJ4Ld0GFSJ6TjL1Vr096c79vsUqPbuPUuC0wyqAbE0eBleE7RgoVnn
         wMcA4d14NXAZEisuUlF4kYbhc8JQrfEnJfovx/oRefq7+3dLpdCE96YGg3tzSsCcAVTQ
         FZQImjMBpWKeVQRK/bNZ00bjmaYcwqBGF5KEP/2l/as5DhKOPempIH0dXBIuKZzCFlko
         kpnmhBPw//KeGOOPS6z/N5cnRWhhZTEONx9hqlIuCTvcvgvB4LrvD/tfbhIVHhqz4FbC
         vQng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768992452; x=1769597252; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fMXkDh4NuIGqP7vK0ebKmRodxeqBxQ37RgaLup8t8A=;
        b=iDp6n6Boe8cdP+pifupFkzyavp/Qhl1D2sur8Ey/A1WmoG7Iez2Ykqbu59tCQ7yIHf
         eUBt2amdBcbf+bh9dDbR3sUH3Gvxq+VkLbeWukRi5sIq2xDnWL/MD62LAmC4JxO1nBYv
         SVWHJpA4R+B+yszJL3J9C5QfOyl3YKmThdkn9FrqRoDnkiLKJT4iWsTXkf2RSlQDrT4Z
         5p4EL9SUveN/Ww+dWnDe4ks5e6P2N9VaTilAEB3NCkHSQzbiGcOgSoJTA5zd++37p/tY
         U9IxZCO0eJ5ip0rII9oJiL1XoL4DtCWG5cSWMmYrNaiELcPecS1Kg9OSW1hd/255lbsf
         PcEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768992452; x=1769597252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/fMXkDh4NuIGqP7vK0ebKmRodxeqBxQ37RgaLup8t8A=;
        b=mEZmvuikBeo3MBcjiuXIbiHU81iNg2iAWn4ye9EfyUTruW6TDxmTGtIp7mmPYxH7cz
         f6e2jYlLIyPdrodX6xcykMR+AevVBAKJljlT3EOJhs21Kv3EClQfb+LI5Q2oprutE5Th
         ysba/KiwZeybI45aX4S5sqCj/s3kTuC5W6l6vEmq/Vs+Qbq3GLtDCwA+WdTR6OMOdfIA
         bV3Dq5+VwIBcu9YfTWjkaWIA2PCNQef6Q3N5YvBZudLzmf3GJUhDWzGedn685XB7iQSL
         2r9VGBj/H0sp6NzSVDyczPaQ/VlIx8vhjakz5ZPfxv1i2yPgnPkbXDMd6cQYSVzFZFQA
         HuWA==
X-Forwarded-Encrypted: i=1; AJvYcCV9rtHGBVljZgSvLCPj269btOerg6abGRmD/hOf1AgcN2n1OU+K0749SLFQH+EWQHZ/idxQyoe6AhsPUw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp46A70F5QrVYUfXfWoIcu5jaTRmmtR0THoHjxikbyQId9sTH7
	h1ZH1JBxq7gqplXt4QTYIDrGRZJjVxTaTohjKZpXkI6XPys4HKrWxVda2PBMipf4vIbEuUPYaQS
	b9uoUxpdalDnKKtZjH3+X5VjvUu46VDw=
X-Gm-Gg: AZuq6aKHATkrDzCDmOMkVXdCkf42ukuIvCWTNTWTAqWTVcAWR4OsCIzMu3Wzz2t8ctE
	GOKQbPWsSH3ChYL6+7RJvZAUMIVhazbqhS+1fItPpvqDodeKEekeGu1GeBd2N719NqcNAsNpozW
	QacGihwawIED4a6kr2nyM9pL0R8ikgsuSZFkpHHR3IssNLhTZ897xyfgeySdLzRrTpZe02BoEzL
	qAPrNHhO9pToMd4vYRtIZc5rJRQXp9Z01CJNVKSAZfZ5xUW+ZuMEWdRp5uBFqt6djVPO1E=
X-Received: by 2002:a17:90b:3b8d:b0:340:b908:9665 with SMTP id
 98e67ed59e1d1-3527329ea06mr14234623a91.37.1768992452459; Wed, 21 Jan 2026
 02:47:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120035210.1593742-1-shengjiu.wang@nxp.com>
 <20260120035210.1593742-3-shengjiu.wang@nxp.com> <20260121-careful-beige-iguana-c32bbd@quoll>
In-Reply-To: <20260121-careful-beige-iguana-c32bbd@quoll>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 21 Jan 2026 18:47:19 +0800
X-Gm-Features: AZwV_QjDpxZv6jt8rBYtLCaZTNVLi3Y8jythwZEftwLkFpk7naOfOY6Hgw_qq24
Message-ID: <CAA+D8ANy6-e3RkhjSKWfqEcxEnsZrEuJvz7Bmp5q6ZO4x3RfVg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] ASoC: dt-bindings: fsl,sai: Add AUDMIX mode
 support on i.MX952
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 4:03=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Jan 20, 2026 at 11:52:08AM +0800, Shengjiu Wang wrote:
> > The SAI can connect to AUDMIX, but AUDMIX can be bypassed or not on
> > i.MX952, so add 'fsl,sai-amix-mode' property for this feature, with
> > this property present, then SAI driver will try to config the setting,
>
> I am still not sure this is hardware static property. You say "can be
> bypassed", so I imagine same board could have it bypassed or not,
> depending on use case (so mixers).

Yes, depending on the use case.
1.  When bypassed,   the SAI output goes to codec directly.
      like: SAI -> Codec

2.  AUDMIX mode:  the SAI output goes to AUDMIX.
      like: SAI -> AUDMIX-> Codec

Will add above info in the commit message.

>
> > fsl,sai-amix-mode =3D <0> is bypass mode, fsl,sai-amix-mode =3D <1> is
> > the AUDMIX mode.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../devicetree/bindings/sound/fsl,sai.yaml       | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml b/Doc=
umentation/devicetree/bindings/sound/fsl,sai.yaml
> > index d838ee0b61cb..7808c324eebc 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> > +++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> > @@ -133,6 +133,13 @@ properties:
> >          - description: dataline mask for 'rx'
> >          - description: dataline mask for 'tx'
> >
> > +  fsl,sai-amix-mode:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
>
> Anyway, string is more readable.

Ok,  will use string
>
> > +    description:
> > +      The audmix module is bypassed from hardware or not.
> > +      Bypass AUDMIX(0), AUDMIX mode(1)
>
> Drop last sentence and use enum [ bypass, mode-1-whatever-this-means ]
>
> > +    enum: [0, 1]
>
> What is the default? What is the meaning of lack of this property?
>

  fsl,sai-amix-mode:
    $ref: /schemas/types.yaml#/definitions/string
    description:
      The audmix module is bypassed from hardware or not.
    enum: [none, bypass, audmix]
    default: none

I'd like to use the above definition.  add 'none' for default.
Which means no audmix connection in hardware. then we don't need to
bypass or not-bypass audmix.


> > +
> >    fsl,sai-mclk-direction-output:
> >      description: SAI will output the SAI MCLK clock.
> >      type: boolean
> > @@ -180,6 +187,15 @@ allOf:
> >        properties:
> >          fsl,sai-synchronous-rx: false
> >
> > +  - if:
> > +      required:
> > +        - fsl,sai-amix-mode
> > +    then:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: fsl,imx952-sai
>
> There is no such compatible.

It is in another patch:
https://www.spinics.net/lists/kernel/msg6004158.html

Best regards
Shengjiu Wang
>
> > +
> >  required:
> >    - compatible
> >    - reg
> > --
> > 2.34.1
> >
