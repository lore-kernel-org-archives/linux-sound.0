Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D03470EA1
	for <linux-sound@vger.kernel.org>; Fri,  9 Oct 2026 07:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791530525; cv=none; b=VlurwN5odzas45rAonyokjFZbWO+jbBmooCDivHDhTtKlVOlXxPazr2bdjcVIliD8wSstgDzWAIkR7/xSJYlWgkwHfG9epg26HgUjM8aPrST/ShscAkVtK64YyQ5j6Hz9J/uljfsLmP+9Oo2zm02IcOtsSyZEFki+Xb+/cAhh1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791530525; c=relaxed/simple;
	bh=ay7Lrhmehs7j0JdHgXH5IIpsVNVS4CqUBpPRiqIzs/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pwMFoE4s/wfWjV72k2NaZsAJwzpVa2TH8i62H8Hv5NuNsIigahAzaNw+ImvM3EMKZvJMrIdoizzqua+VcZ6E6QZpXSRkASkt9Vst1jQEsu/22F/pD62qwLnSkMF+rlGLnhcLmJ8bpGKJbMl1UaQrPZLxTAdIi9koMQA4VcvAAZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gJ7WAWXy; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gJ7WAWXy"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3a4c47bb6e3so2022328a91.1
        for <linux-sound@vger.kernel.org>; Fri, 09 Oct 2026 00:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791530524; x=1792135324; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vGQ1K2lnEtPHoywNrrfZAa9ebz8nSIt73vgH/dzJD9c=;
        b=gJ7WAWXy+WcB/LFetY1pL/TwuUe8XtFQ5aPHkvI/AMwy8gYtq3dQkeyrI1SygF3D0+
         Y9lW9MHZhEUtNX9GDBXP8ICdDyh/Zmq4QAPonYcXw2j+skSp3g3doVRUOulcdoXX4hSG
         ilNrB1mEtlY2s7duH5OxYslO7uPMjznHvejIByYL3i9Mln0BE67RqknMWVqbMPF2NcZt
         l4Fvbght//qL70PH4myZ246aEW6SiA5hvZZvb7oe6iPlsTn9wrm390WuVghTxsGWts2G
         M7FmI9eKLCkee9tcKlVUoAXq6t9wV3piw6zIP/Vo7dwPjAhUZR1FCAJUEJL7LDcrhj0o
         j+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791530524; x=1792135324;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vGQ1K2lnEtPHoywNrrfZAa9ebz8nSIt73vgH/dzJD9c=;
        b=UEqS6jnoz4xAPPtYnOMQ04fOBED0Skv5qTZqh7pVQl/0zdpR1OdJF1jgHPP7krmL9H
         TphykVAm214HivT+8IKtLCw6AWsNTbtLsJVwIoosNiWBu1g/ULTCtGlWaFBVbEITw6GP
         2//odlHovwppFcJLU5B9sXAsJkLZPDZdPik+43zt9t7OkDnaz9Sd3oj6g+oHjU696gJb
         w2aN6d1RxdBi594+vXMCYQjZPTYmJLqH2V1OGZlvTAYTFTYMOGVrwWyqJP096A0ztyD8
         sCQgtYOPH2FpZzdeZHUZhS8jkUM2fM+A+7qrUm4kPRpBajt7h5U9KTWiB8fSircuD7fw
         NxCA==
X-Forwarded-Encrypted: i=1; AKwUvBxQVm8rZDQo2Hr5dpawWUeCxGbvQCE4aKqclpp5cVCo4WQUsen9MP1w6EBsEV6TKiOyPi5HcXqVIegoSA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJZKedTbVPLWF/F6/aZkLAiZwVy1B2/R1xo9my2cWkP5b8Z028t
	GA+7bnz57C3hNd/HxvmM/8wOK4pgMxikoPWaZ68NzD8JzUAI84J2WVgg
X-Gm-Gg: AYBFou1YObCY5JFbAGEiZpmji6fAUELjedC+BTtGSddSuSu12J+8DQdwby6unKqBi8g
	6mIXFiL2krLlVYiJSqCCa5rWVSooJtq/jOQoDbF1WmKevSao957niZUpp7xUOyJU2NIc26jIFdL
	IDZ/ovdW7A9h9+hHl0wfrsadS0ggUdDNSfNaAUKB8tMrCX6hlBpjVq0+x1wh4RQLVNfo5T3T4it
	cBquNHoj79BiX6m/bNzFNnvGAyQKKKemqpgL5/0poqJhfjD9HZGYGqkAhsobPdsyK860PC+9Ziw
	VdGHv6uafh6xE+Z3O1Xi7/WiZy4dXWhgidBiIvkwRcH32aia6UDLaU9WaB9U3/sMxO8n0el9Khb
	S5Y8Y476LMJXYTCb/rVI96xVBydMg8nQDmxpnMRkAj5AQ5KCuC7fTf65cBGyVZ8zmnqoV+sz+rx
	wxagAAf+hLO3hXGfNyP3zy0CReyA34dEgN+h+oxAN/ldXrQxYw8PQTyAakb44OzcelF8HTAXu3g
	Amx4eRR+gsLWlGugWVoo2xLXN0OTAWsB+PZd4iCltgy9odsUA4x/dK7FK4UaJiFoIREccqN94oV
	s803RWXIojG9Naeevos1JZ8hSoKs4uV72btZ2PoNDZCB7y5+BIA=
X-Received: by 2002:a17:90b:3a48:b0:3ab:413:49b6 with SMTP id 98e67ed59e1d1-3ab3a79a2d8mr1074419a91.41.1791530523677;
        Fri, 09 Oct 2026 00:22:03 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab397920b4sm1115948a91.4.2026.10.09.00.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:22:02 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject:
 Re: [PATCH v2 05/21] ASoC: dt-bindings: Add binding for Apple Silicon Mac
 audio
Date: Fri, 09 Oct 2026 17:21:52 +1000
Message-ID: <rT1KWd0SSiuQLd7MLQWREA@gmail.com>
In-Reply-To: <20261009-daring-objective-flounder-c0b66d@quoll>
References:
 <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-5-7b47ed6335a8@gmail.com>
 <20261009-daring-objective-flounder-c0b66d@quoll>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Friday, 9 October 2026 5:17:53=E2=80=AFpm Australian Eastern Standard Ti=
me=20
Krzysztof Kozlowski wrote:
> On Sun, Oct 04, 2026 at 04:03:32PM +1000, James Calligeros wrote:
> > +examples:
> > +  - |
> > +    sound {
> > +      compatible =3D "apple,j416-macaudio", "apple,j316-macaudio";
> > +      model =3D "MacBook Pro J416";
> > +
> > +      #address-cells =3D <1>;
> > +      #size-cells =3D <0>;
> > +
> > +      dai-link@0 {
> > +        reg =3D <0>;
> > +        link-name =3D "Speakers";
> > +
> > +        dai-tdm-idle-mode-0 =3D "zero";
> > +        dai-tdm-idle-mode-3 =3D "zero";
> > +        dai-tdm-slot-tx-idle-mask-0 =3D <0xf0f0f0>;
> > +        dai-tdm-slot-tx-idle-mask-3 =3D <0x0f0f0f>;
> > +
> > +        codec {
> > +          sound-dai =3D <&speaker_left_woof1>,
> > +                      <&speaker_left_tweet>,
> > +                      <&speaker_left_woof2>,
> > +                      <&speaker_right_woof1>,
> > +                      <&speaker_right_tweet>,
> > +                      <&speaker_right_woof2>;
> > +        };
> > +
> > +        cpu {
> > +          sound-dai =3D <&mca 0>, <&mca 1>;
> > +        };
> > +      };
> > +
> > +      dai-link@1 {
> > +        reg =3D <1>;
> > +        link-name =3D "Headphone Jack";
> > +
> > +        codec {
> > +          sound-dai =3D <&jack_codec>;
> > +        };
> > +
> > +        cpu {
> > +          sound-dai =3D <&mca 2>;
>=20
> Example looks incomplete, you miss TDM slot properties.

The machine driver generates the TDM slot assignments for the DAIs
and sets them at runtime.




