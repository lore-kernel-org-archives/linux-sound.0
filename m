Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF4E1D958B
	for <linux-sound@vger.kernel.org>; Mon, 28 Oct 2024 11:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730114021; cv=none; b=rZi5S6SmWkZH64d5Hwwo0rsap+w2Jyvu+VxQmmJolfveKtJwBQ11eiNZ2WJavrkpL9idoeMqlpiabVMY3Kcm4zmi+qUd4ES+OnH2dGM/P4YHIRQPw1fA9zYYhCzhMa/8IB4vozIgvbdSJFspbP89Mo7+h/cO3YUr5kBvUOHtRGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730114021; c=relaxed/simple;
	bh=67sSyJJi9WY1L30HSgX3jBgORDysaAJJpImWjA7Myno=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fTQTjLtYSTx5dn/Gd8eCAhdk79USKQKjEAImKStteStaBsY3kixDclnDjGnReLDoWXv4xFPRxSOn8rGh+LoXr8MuSjw+fnKMuCkm9vKS9UcMaLj0shZocl/JPOk3u7IqlBcjfYIB4XTrcQDtlZGCjuwWJlK69W2ioEyaJNwLl3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WERRwVcH; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WERRwVcH"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4a484e9d537so1270836137.1
        for <linux-sound@vger.kernel.org>; Mon, 28 Oct 2024 04:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730114018; x=1730718818; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IdHIuXNcRTp7WeqJ7Dz3GAtmBDa+RGbotWoT8FSQELk=;
        b=WERRwVcHwc8jzUQ19SJI7xa3v/yvNiMe1/MCN/KhrCXd9ylo4PDkuz3OLYzHeogy6f
         FfrjqD6YS6lQ1X10bjWJkFWAWEJmxpI2z5YtRESi6IuZnGuvGxLH46UuOzvG887RFiwL
         PqtsIsLHYpXHgQX10GC346+dqFMM5x7dypUqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730114018; x=1730718818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IdHIuXNcRTp7WeqJ7Dz3GAtmBDa+RGbotWoT8FSQELk=;
        b=MsRU5mjbvCGEslRODM/6hsPaiyTw7SCuqizq6gU4Q8EuNQNN+/JpSxNK53YgUEu4df
         xawet3KNnVO2hwQ9J/M4yVCAD8t2uEU/uCTQgmyE5o7pni+qKG85mH6qVJkdpwSI8625
         mS3dhDBjfE9Vhg9RYjbMDkfeIj6LZZA7iUVYaQHZhMB1Xr2kApu6Fi44GkSLustcV0yT
         nlaf3yDbfcU9hsHLAM5X9wf/RaDr6yRGjsg+7XTUuUzgqnb9D7x5EdoamwMFixRXEI1B
         GQxq7c+93+2NG9+Ypv1mWuHIk4q0cIt+uGYVNVVYJpns9DwQWI6q80k58UacuALeIGke
         ozhg==
X-Forwarded-Encrypted: i=1; AJvYcCVrO3x1l8neX2FlA5SwFaumLh5nb72lUbTUVxjmJSPjPEiq1VWNrKbCAdkT8Z9Qwo3a7LNCNCfgZLe7Tw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw14NUZhe3G576r1/GIn/z5Mw6AX7WqgqA1r9w/hypfAKO4nZgV
	PSx4r090+4vdm2Z2U93sbhupxAO3gae2pZsRb8OBorQQ3UCf1haTJ+lU0bLRZWTINabsB99O0/o
	=
X-Google-Smtp-Source: AGHT+IFt0rcJ7v1d/GjUqpmCV+arwDZK3xluZ7jZ2zBCp26ShTo+/DtswGza5XpWW3pMdooNTvwCpQ==
X-Received: by 2002:a05:6102:f13:b0:4a3:e1de:4fb3 with SMTP id ada2fe7eead31-4a8cfd50421mr4952407137.26.1730114017988;
        Mon, 28 Oct 2024 04:13:37 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4a8c5267681sm1011730137.17.2024.10.28.04.13.36
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 04:13:37 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-851d5b60739so800420241.2
        for <linux-sound@vger.kernel.org>; Mon, 28 Oct 2024 04:13:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVnwUp3HfeeZRdOstxQpAWooAf66aHlKaMkLVl2cd1hB203rwkbjid9aPq7VgBXXm6xrY55K+sgjaiibw==@vger.kernel.org
X-Received: by 2002:a05:6122:1786:b0:509:e278:c28a with SMTP id
 71dfb90a1353d-5101504d301mr4253732e0c.7.1730114015383; Mon, 28 Oct 2024
 04:13:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241025104548.1220076-1-fshao@chromium.org> <20241025104548.1220076-3-fshao@chromium.org>
 <j5qw52grlce63mccduvryx467h4hvcnqrxrova74d52izq3g5r@wjiflssmq6a5>
In-Reply-To: <j5qw52grlce63mccduvryx467h4hvcnqrxrova74d52izq3g5r@wjiflssmq6a5>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 28 Oct 2024 19:12:59 +0800
X-Gmail-Original-Message-ID: <CAC=S1ni-F_oudNyskSbxS1s2gZG7m4U4+nLxt0=dt5+DDkhV4Q@mail.gmail.com>
Message-ID: <CAC=S1ni-F_oudNyskSbxS1s2gZG7m4U4+nLxt0=dt5+DDkhV4Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: mediatek,mt8188-mt6359: Update DAI
 link node pattern
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

On Mon, Oct 28, 2024 at 4:56=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Fri, Oct 25, 2024 at 06:44:42PM +0800, Fei Shao wrote:
> > The associated machine driver is not dependent on the format of DAI lin=
k
> > node names. This means we are allowed to use more descriptive names
> > instead of indices without impacting functionality.
> >
> > Update the binding to accept arbitrary DAI link names with a "-dai-link=
"
> > suffix. This is the common pattern used by the target (MT8188) and othe=
r
> > (MT8195, MT8186 etc.) MediaTek-based Chromebooks.
>
> We do not want arbitrary names. Why for example green-batman-dai-link
> should be correct? The existing pattern looks wrong. Please read DT spec
> and chapter about recommended names.

At first I was thinking about regex like
`^[a-z-]+(-[a-z]+)*-dai-link$` based on the DTS coding style guide,
but your example is not suggesting that.
and the name like "hs-capture-dai-link" was rejected, so it's not just
about enumerating the names either.
Or "^dai-link@[0-9a-f]+$"? But they don't tie to particular register
addresses... or just for some pseudo indices?
I could miss something about DAI links under the sound documentation.
Still trying to figure it out.

>
> >
> > Signed-off-by: Fei Shao <fshao@chromium.org>
> > ---
> >
> >  .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml     | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt=
6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.=
yaml
> > index 701cedfa38d2..2da34b66818f 100644
> > --- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.ya=
ml
> > +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.ya=
ml
> > @@ -40,7 +40,7 @@ properties:
> >        name defined in the machine driver.
> >
> >  patternProperties:
> > -  "^dai-link-[0-9]+$":
> > +  ".*-dai-link$":
>
> This breaks existing users.

There's no existing users in upstream, and the only downstream user is
the MT8188 Chromebook DT that I'm trying to upstream, which I can fix.
This binding was upstreamed exclusively for that DT.
Even if we take a step back and assume someone has another DT already
following this pattern (and that would be a surprise), this wouldn't
break anything except a dtbs_check error, which would be trivial if
they don't run that or attempt upstreaming. The driver doesn't use
node names to distinguish DAI links.
I want to fix this pattern before any actual users are in the tree if
possible, but I'm also fine to stick with dai-link-0 to dai-link-10 in
the case that nothing is changed and the DT has to follow the existing
patterns.

Regards,
Fei

>
> >      type: object
> >      description:
> >        Container for dai-link level properties and CODEC sub-nodes.
> > @@ -112,7 +112,7 @@ examples:
> >              "Headphone", "Headphone L",
> >              "Headphone", "Headphone R",
> >              "AIN1", "Headset Mic";
> > -        dai-link-0 {
> > +        hdmi-dai-link {
>
> No. Not really justified.
>
> Best regards,
> Krzysztof
>
