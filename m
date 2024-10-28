Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186D01D47A6
	for <linux-sound@vger.kernel.org>; Mon, 28 Oct 2024 11:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730113870; cv=none; b=P3fnEpxiEn9X/mMphRHTsSdURwiLC/TnCu1aIHVJZnqPQCymmcW81p+BLE+pRls/ImlRWa1lcFTgXJOKOS8se/fVr/4NkxrWrA/vYZk2ALuKkBOGMzfYZU64uskoak4iz2b+Rb6maxUoaRqII4vX0Wul5+R29leB1UgzvLlAtvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730113870; c=relaxed/simple;
	bh=ZgTV9zpZbKQQXLQ5wQfQWN0K4yKV8OzqkCwsGVG8/BA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CXTY8fwUC39u99kOtl2y9bo+0pbbOri6xDhLFctgC3xa6bONCA0FUTvNHFByEIZybLmdLRGqkb9/5kwPMa48RvC0kYspH+0REaXFF1c6gg5d+3ed8KBp+2K/4jTSA7PZM3FvCfBN3pYJ8kmXJxRveJFxvjHPN+z+ggKyrwKFWyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XEeMnEnu; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XEeMnEnu"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-84fc9005dccso1089267241.3
        for <linux-sound@vger.kernel.org>; Mon, 28 Oct 2024 04:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730113866; x=1730718666; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wVZy5IrMKfr30Sb+HXmGpWXo6EuG4COK1gDvgq9aZn8=;
        b=XEeMnEnulr64ndPI4xdutkSZubgv/iQvdX4a2+reazuy0m3jJmQkyunxWTt4ppMNPR
         MW07MXPm2OWprCcfEPEV2H+YNJTjBUUhyz/Rd6tZGiSjcWO2Tp8+6Ry3ojSJR0ZCzHCG
         F0+jo3MGW9X3vGKSw6VLLv7d09xP+XFEIHSxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730113866; x=1730718666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wVZy5IrMKfr30Sb+HXmGpWXo6EuG4COK1gDvgq9aZn8=;
        b=TNsqlekDwhMse+Zzcuy+RyBk3gODDnhl2ZvUfofM2qWwUU563o/zyyZ/AIq5Uv7f1R
         0n8McrDQ3zG4mrYMviSsGQBWckLprg7IWjJVGTkS9BUZcPp6XTY6dJqv6qgJ2/mgtsQO
         8lOeZw40yt2E32JyNhjdwFpfHsagxk7zItQPZt7hNSHiGu57NRFDGmYh0QFH14pqgpHQ
         wEKHOFUkH+J6iHCAnh4aacsUT6opJGeZHQ8zbEhHqe89kLmURFSwU1yKQQP9DLv9oDSx
         OGm1uywTVVqiWBpJC2ZOHU27zddRftwOp3yKZBEyEjL06raZ0gtSJSONNPvgAWMVezw+
         Zq7g==
X-Forwarded-Encrypted: i=1; AJvYcCVyIDncHdgtN8mDjcOI8gsMwqVcqib2B3q+SFufiPIipDLed1XcwrO1fL5RKHIdXDfVm4pOGsHR7Ebyfw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1baO7gvKopSHhQTbujw2wxoGtP+fIXegyrDqZhVkMvuBXdF3U
	lUjmngVFqkJG/P815uLs1dqHxE9UFOeyzeNIQgD6PRlISOpmSYKwU5BYbYiyhGj7bxnSgIURhVA
	=
X-Google-Smtp-Source: AGHT+IF6DqjqyjTQuEOca+DDEMfVWjQSB91TAsSq/wc6Tg8F8N+AzwAbuiaqgpFX04o+vvdbByKi4g==
X-Received: by 2002:a05:6122:3d01:b0:50d:99e4:dea6 with SMTP id 71dfb90a1353d-51015055166mr3900838e0c.7.1730113866332;
        Mon, 28 Oct 2024 04:11:06 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51004777d3csm831084e0c.39.2024.10.28.04.11.04
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 04:11:04 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-84fc7b58d4dso988607241.0
        for <linux-sound@vger.kernel.org>; Mon, 28 Oct 2024 04:11:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV4hF+engAOL3rdwigkkObgh2owSjlrb95GlWC4m/Scq5ddAyNEngK4nqlFI+82JsrwzxysE9PbStPBLA==@vger.kernel.org
X-Received: by 2002:a05:6122:3d01:b0:50d:99e4:dea6 with SMTP id
 71dfb90a1353d-51015055166mr3900796e0c.7.1730113863969; Mon, 28 Oct 2024
 04:11:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241025104548.1220076-1-fshao@chromium.org> <20241025104548.1220076-2-fshao@chromium.org>
 <5vmfh2nkxtpzt2vk4j6ghro7z5stoyvry3enzoqepg6hjxqrho@fofs5cwa2iqq>
In-Reply-To: <5vmfh2nkxtpzt2vk4j6ghro7z5stoyvry3enzoqepg6hjxqrho@fofs5cwa2iqq>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 28 Oct 2024 19:10:27 +0800
X-Gmail-Original-Message-ID: <CAC=S1njPjtvhsc+voNK447wbQmRiN0xVDi-jgOmba4NLRiNi0Q@mail.gmail.com>
Message-ID: <CAC=S1njPjtvhsc+voNK447wbQmRiN0xVDi-jgOmba4NLRiNi0Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: mediatek,mt8188-mt6359: Add adsp
 and dai-link properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Rob Herring <robh@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 4:54=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Fri, Oct 25, 2024 at 06:44:41PM +0800, Fei Shao wrote:
> > Add "mediatek,adsp" property for the ADSP handle if ADSP is enabled on
> > the platform.
>
> We see this from the diff.
>
> > Add "mediatek,dai-link" property for the required DAI links to configur=
e
> > sound card.
>
> We see this from the diff.
>
> >
> > Both properties are commonly used in the MediaTek sound card driver.
>
> If they are used, why suddenly they are needed? What changed?

Nothing has changed. These should have been added altogether when the
binding was first introduced. This patch is to fill the gaps and fix
dtbs_check warnings, like I mentioned in the cover letter.
I can add a line in the commit message saying it's to fix the warning
in addition to the cover letter, if that's preferred.

>
> >
> > Signed-off-by: Fei Shao <fshao@chromium.org>
> > ---
> >
> >  .../bindings/sound/mediatek,mt8188-mt6359.yaml         | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt=
6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.=
yaml
> > index f94ad0715e32..701cedfa38d2 100644
> > --- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.ya=
ml
> > +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.ya=
ml
> > @@ -29,6 +29,16 @@ properties:
> >      $ref: /schemas/types.yaml#/definitions/phandle
> >      description: The phandle of MT8188 ASoC platform.
> >
> > +  mediatek,adsp:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: The phandle of MT8188 ADSP platform.
>
> And what is the difference between ASoC and ADSP platforms? What are
> they used for?

I'm not a MediaTek or audio folks, and I'm afraid that I'm not the
best person to explain the details accurately in front of experts on
the list... I know it's an audio DSP but that explains nothing.
MediaTek didn't provide a meaningful explanation in the tree or
commits, and I want to avoid adding additional but likely misleading
descriptions from someone who doesn't have enough knowledge,
potentially causing even more confusing situations in the future.
Plus, the same changes were accepted as-is in the past, so I assumed
they might be self-explanatory to people who are familiar with the
matter.

>
> > +
> > +  mediatek,dai-link:
> > +    $ref: /schemas/types.yaml#/definitions/string-array
> > +    description:
> > +      A list of the desired dai-links in the sound card. Each entry is=
 a
> > +      name defined in the machine driver.
>
> The list is provided below. I don't understand why do you need it. Your
> msg is pretty useless - you describe what you do, instead of why.

I think this is used to explicitly list the intermediate but hidden
DAIs, but again, there's not much info about them unless MediaTek can
explain more details and why they need a vendor property for this.

Regards,
Fei

>
> Best regards,
> Krzysztof
>
