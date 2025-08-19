Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5951C30FF06
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 05:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755581399; cv=none; b=dfvdMY2V2xHLTWOnCHS/u+AuCJVrtqFcvhgYxAfftPklvOcGJAceNgdyQnIpbVX2nTZg9zOSQeRhCwZ5kobL/sQTWKGOLgaBs3eJCwMYq2cQseaW7rJDOpPhxLBYQaoupul8ypGHdCtgU64BpQIU07otCSwEg2+onqI1WRU2i+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755581399; c=relaxed/simple;
	bh=Hiaw+1vru5Gp5FXyAQ8mi6lZwyqhH7knrQYR8u+n6YY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H2fiZekCWNvqj1neHmJFPBLpyaWimj8lJKw+DbvX7fODdKRooDjTWNaoaNrpKBlPDETC3e5QbIMqsOu8LCho/PODwQ5D2Z8G2V5kDV4GIPDdASQmnyscvra0sd9wAhePCjA3PLS8HtFp4XRT4DrrtvthVN90SaEaJ0T7kDQZRfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QCNFgav8; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QCNFgav8"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55ce510b4ceso5582578e87.1
        for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 22:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755581395; x=1756186195; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AY416xR1xycZgMaHjJKQxeOxL60iUIwXBSq8Px9VqF4=;
        b=QCNFgav8kfxSctfpXma/aYgM0IhSUJKWUSJwEbya9vLyXC183syObGesgfv/JxAjH/
         /rhSTHh8E3nsBWeitN1hDAOLSW7POKYGwmalJNrBk9w+ddCUUHFbuABTcDAkGxLjHbYL
         UQjxjvTNaohIoY7C6QTvSnXRHXEi2BXTPg0sY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755581395; x=1756186195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AY416xR1xycZgMaHjJKQxeOxL60iUIwXBSq8Px9VqF4=;
        b=OzEkO1heRZpkgASyzvBeCvSozl78sowbZvlL/caMnFF4cK+JNy/PeJkw+ug7ol/v3l
         JTY6BaA/orJ0kBNGMmMAb00YLsO22DedaxsxZh9CUYc1o1U+LSwSQrPSocXJd/YBrVJG
         U8Tr9BOeGsGPSTQ4EKCRymNgJWzaux2P2Xv4KP5/rCutI6Dzmlf1lNHEUf1wWVDx4KBS
         QKWiepNo67akZpKp0Yyn6sybO2HSDa6Vm3lpTyoDPerne5LxDUCwDSFI8Le81TeuMgAL
         Ii6HXt+jBi3ph9+LZ8hErfC22jEilWCljNKMGrfjDUhc632OcGFjVZzgVY49q/2F5hqF
         fu7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXpC4RkISnwhF396Z2VCLMSGzl9PVQP1xsEX0w6lnGL/DfBkYgoyL1D+FEKyxefvJlKerGZeLWftZ7XPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNMI8mw3rX65sIrZ5T+1a0+7xl/f7i5a/ZkBIK4B/aBY8OBczz
	sgvmYIVx7wrk6is3uDFaglhf21SfS2F5/mAK3ESxf6RgEI047R65MScMXWnILhfgtHATLo2dQek
	jbcaNfjb1YpYB9ugfsGhMd5xZ7ai9YgpP1b0lA/Kt
X-Gm-Gg: ASbGncv+GTm7R28ec0y4arjNyw+SIaVs2JtpjVymhJ5qsxLFjfNDFzNalkO0QC1C2BS
	Ys1MP/31FnI2d8B89RmD9RE7B00w+5GMcvP0HLqBJDV22xjCICH6TsKXmcePBnjzrNMQG6hFxPF
	t8hdNo9FcyXHQF7NQ5g6QWcOwoABQwVczR8mrZyob19B09Vra9klC3XktaB7YJ1+79TzqtORO/S
	z4R6JfnR8K1jMh4BpTAFMskkNq0vPKCTAw=
X-Google-Smtp-Source: AGHT+IFc+cNqQJD94yOsJXvxKRjOpffc7Ia22z42Fq9ZyFSlD4taXbrHvujNSr7HuBf9iSSI7SrVxD3w4KS0qImpweY=
X-Received: by 2002:a05:6512:3f14:b0:55c:cc6a:a212 with SMTP id
 2adb3069b0e04-55e008451ebmr402983e87.39.1755581395466; Mon, 18 Aug 2025
 22:29:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
 <20250801-mtk-dtb-warnings-v1-8-6ba4e432427b@collabora.com>
 <CAGXv+5EHk=f62+KiLo-aWMcd0-q+_59kno+uOW5rdYaq5q+5tQ@mail.gmail.com>
 <CACRpkdbWctNH0XJfcHfVJM9Etp0WCXpdyhhyaQemH-Xc0LDr0A@mail.gmail.com> <CAGXv+5ECsP7_wbdcaAkWuD=RyJiJpPe4r60bhD5U8xUvEBzmXw@mail.gmail.com>
In-Reply-To: <CAGXv+5ECsP7_wbdcaAkWuD=RyJiJpPe4r60bhD5U8xUvEBzmXw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 19 Aug 2025 13:29:44 +0800
X-Gm-Features: Ac12FXx-vk1JhaQ3rCWpmDReEnhaHNW7M5aboaWtjp9aXHyjGH_2VPoF2xHclbY
Message-ID: <CAGXv+5FXZ_byK8Ftb9LjfQMkgtLd7mTmWgz_Nsvcv8=jy53T=g@mail.gmail.com>
Subject: Re: [PATCH 8/9] arm64: dts: mediatek: mt8183-kukui: Fix
 pull-down/up-adv values
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ikjoon Jang <ikjn@chromium.org>, 
	Enric Balletbo i Serra <eballetbo@kernel.org>, Weiyi Lu <weiyi.lu@mediatek.com>, 
	Eugen Hristev <eugen.hristev@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Julien Massot <jmassot@collabora.com>, 
	Sean Wang <sean.wang@kernel.org>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 1:27=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Mon, Aug 18, 2025 at 11:22=E2=80=AFPM Linus Walleij <linus.walleij@lin=
aro.org> wrote:
> >
> > On Wed, Aug 6, 2025 at 8:38=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org=
> wrote:
> > > On Fri, Aug 1, 2025 at 7:18=E2=80=AFPM Julien Massot wrote
> >
> > > >                 pins-clk {
> > > >                         pinmux =3D <PINMUX_GPIO124__FUNC_MSDC0_CLK>=
;
> > > >                         drive-strength =3D <MTK_DRIVE_14mA>;
> > > > -                       mediatek,pull-down-adv =3D <10>;
> > > > +                       mediatek,pull-down-adv =3D <2>;
> > >
> > >         bias-pull-down =3D <MTK_PUPD_SET_R1R0_10>;
> > >
> > > and so on.
> > >
> > > ChenYu
> >
> > I agree with ChenYu, the more standardized properties are the better it=
 is.
> >
> > All the custom properties makes sense for an engineer working with just
> > that one SoC (like the SoC vendor...) but for field engineers who have
> > to use different SoCs every day this is just a big mess for the mind.
> >
> > The standard properties are clear, concise and tell you exactly what
> > they are about.
> >
> > The argument should be in Ohms though, according to the standard
> > bindings, but maybe the value of MTK_PUPD_SET_R1R0_10 is
> > something like that?
>
> For reasons I can't recall clearly these are just placeholder values
> that the driver then maps to the R1 and R0 settings. But at least they
> use the standard properties.
>
> The reason was either one of the following or both:
>
>   a. not every group of pins had the same resistance values for R1 & R0
>   b. there are no known precise values; the values depend on the process
>      and batch

Also, their customers seemed more accustomed to dealing with toggling
R1 & R0 vs setting some actual value. I presume that comes with the
uncertainty of the actual hardware value, and they just try which
combination works better.

ChenYu
