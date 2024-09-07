Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91A11B85DC;
	Sat,  7 Sep 2024 08:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725697621; cv=none; b=Jt3Ns9iOFBi7ZEnrK/q2HCN3Pp71FJAqgGYJQDVg1LrYoOjxfnCDDPen/p3HM51rYJdi6wBvPMU3cCXY255T3ufPa5rGWGx04VzE5B3s2S5JfKpg+9RU2Hn+VDQj0JUznbZK9Ie+Ty01Q1RTIIz/acRLHIKhIzBVnIcw3jdkUtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725697621; c=relaxed/simple;
	bh=FYQ8VwUdwnULFKJxaP8IG3aHPu6C4xVkNHPGnNEz/TQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JITIrDZ5AgQdu+gfdfujdXR6pn9S7sJXWJt/b3gq06KovJmi4sXAQkiO3d45TvHVZnLJX8JOGF1IDDpue5p9X76A3nglZ33i+VB01gG1y3vRL3gJqqhvdoNAhpc4HpGYAcaHaJ0EG0c1nWqnVjCPy4RYW3Jz7wvYgPhsVgmLBbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJzzao/9; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJzzao/9"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f029e9c9cfso37972601fa.2;
        Sat, 07 Sep 2024 01:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725697618; x=1726302418; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VqyzkpHLHrWtDycv18ymB8QgfohFB/0/rJM4KU0imW4=;
        b=aJzzao/9rLQZBp66lv2LUwYMCdeoPqqfLbPLVbrZm+p82SpFUcZNlZnM8/NgBHMj6y
         phby1k3Nl8zpq+BPi+CjMWl9rnHQYHwX7SpUGeeVnMTZAJn4iaUX5udQxG2jqhZEIQfd
         i06rOcLVYh9bvmfHf4pOJ8rY0s/WhEZ3s6IZrzuhvKzMD0I1GLGQU/Q3JTVKnvoiIoyy
         JHT5/jBDyTrM1TUObL8YFFSSZsZI+I5C6qL23scClC3yEbQ5SOAorXYUlEUcTHanBwtT
         IweH+pr/1vPnAQbBqHfGR6U8g5Fj/KokA69iIBiJ0m9yr+jkhpqsz9J+0CSX6/d1Jm6k
         LsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725697618; x=1726302418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VqyzkpHLHrWtDycv18ymB8QgfohFB/0/rJM4KU0imW4=;
        b=ikOD1nRSJqKhgK6cupqtZudWV1HTaTLp+IB7WOSWs9RhIWVb7Bb1uwzA6IIwstkz1x
         xwQg2G5Z/CAe9iFywubgAdJ06iy6Nlh70eNrQgulELrECqKF6UvX8+e6y8B/QisrCg5E
         160jZyS6Cq7tu6TZiUt8yI6x98kQej7m/OJL3hoilavBnT9mWW+WD5qHIOo0dmi553YG
         hDJxGaZacPlc8bCGSYdACYKBE8JQzPodB9P8lg82ZgabtrDfmP16RSueq9/UzYhQfHNJ
         DPpT2PV2nOPoImaKIuwKcpSSwupSWymfHuv22p0fr1BQAdNCvEA6ILkJvU+LdeTckj3n
         39QQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFfxjeDFCz8rJ+lcs7nSE5XdJufsYdZrikRVwG6WV2OzSax5wQtXmjYXx//TiMp0sTip6pyIMyOpkb@vger.kernel.org, AJvYcCW65Rjl775dTlRCLj6/xcT4h/bREylP32GWRlHYS6olbidBDuI76sfmKfPHNZF76xeWw5OBEHVx6Qiw2Lw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGQCE65wzcjj8kHdnA+uUqwIHV7a7coZ45pBhI8xZBTakWisgU
	fTOYTlPgfuiulfMHJJunlGaCjkZvdBNcRFjKPEqAfEsx7rFuFx3ZpK3/LmPspGRG1CNR6CuE2R+
	ZaFC4OmetRo2JuFdh6DJ+6Na7bMM=
X-Google-Smtp-Source: AGHT+IET3d9NRhbKeldMGFos0aLckCZuN7TRfuI0EgD71XrMV6VDi4eoRvEwgUlcnNyrnfDH+RE5Maj+e7OXvGYplkc=
X-Received: by 2002:a2e:9c95:0:b0:2f6:62a1:25ff with SMTP id
 38308e7fff4ca-2f75a99f825mr10427181fa.28.1725697617377; Sat, 07 Sep 2024
 01:26:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1725518229.git.zhoubinbin@loongson.cn> <ca09352c70c8e69d95dc085c8b479bec21560309.1725518229.git.zhoubinbin@loongson.cn>
 <2bel2spvqvuqyyvuv32wevxmf7tv6w336f7zfj3uq3wslwgr32@weiqjaqitqt5>
In-Reply-To: <2bel2spvqvuqyyvuv32wevxmf7tv6w336f7zfj3uq3wslwgr32@weiqjaqitqt5>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Sat, 7 Sep 2024 14:26:43 +0600
Message-ID: <CAMpQs4LO1hQpnQvVTqTs66F4J2rMGasfoszJKcDBgWkVvuVz4g@mail.gmail.com>
Subject: Re: [PATCH v1 07/10] ASoC: dt-bindings: Add Loongson I2S controller
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

Thanks for your reply.

On Fri, Sep 6, 2024 at 4:23=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Thu, Sep 05, 2024 at 03:02:56PM +0800, Binbin Zhou wrote:
> > Add Loongson I2S controller binding with DT schema format using
> > json-schema.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../bindings/sound/loongson,ls2k-i2s.yaml     | 66 +++++++++++++++++++
> >  1 file changed, 66 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/loongson,ls=
2k-i2s.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/loongson,ls2k-i2s.=
yaml b/Documentation/devicetree/bindings/sound/loongson,ls2k-i2s.yaml
> > new file mode 100644
> > index 000000000000..a2e3bbe00dab
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/loongson,ls2k-i2s.yaml
>
> Filename matching compatible.

I will rename it as loongson,ls2k1000-i2s.yaml
>
> > @@ -0,0 +1,66 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/loongson,ls2k-i2s.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Loongson-2K I2S controller
> > +
> > +maintainers:
> > +  - Binbin Zhou <zhoubinbin@loongson.cn>
> > +
> > +allOf:
> > +  - $ref: dai-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: loongson,ls2k1000-i2s
> > +
> > +  reg:
> > +    maxItems: 2
>
> List and describe items instead.

OK..
>
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  dmas:
> > +    maxItems: 2
> > +
> > +  dma-names:
> > +    items:
> > +      - const: tx
> > +      - const: rx
> > +
> > +  '#sound-dai-cells':
> > +    const: 0
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - dmas
> > +  - dma-names
> > +  - '#sound-dai-cells'
> > +
> > +additionalProperties: false
>
> Instead:
> unevaluatedProperties: false

OK...

Thanks.
Binbin
>
> Best regards,
> Krzysztof
>
