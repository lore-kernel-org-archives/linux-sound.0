Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793790001;
	b=DukmAC5rj0l1G9jTpvmnkro9n5tqLBUYsGT4xpNZ9MZHviaVTh5x6KomCd/NYNoojvZV
	 T++47ZO7VmSOsxBWB7WW24ovlF61rdmQkUY0DOHhdTY9cgVvSsHpSTTmsuDl/2BNGsGIF
	 uIIsZoUtf9y4ROvYivisiYAXwwgy762PHfcsXekWQRCeK/p6zHVGWfq+aQZ1thH6IBizf
	 fiCHC0G4VJcUkAfhY4IsjinGbIpPidokGpURQPntllPYcMi3Ptw8QPnNVYAjf1u+C50oj
	 BCOfPFYzqhZAL2l3eJXpfJ7regI7dGMIyVw94ilyY0E8puLv8hLCv9fAYKAav39/FJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=GwE8Z7d8hC2B5A2aORLBN7ModRReguom9RWoATcO8ag=;
	b=ylzVPw/ZYhyTxDFPjEunTKXCwB9MAZUAiaxHkZ/vhtQ3FtZUUR8qQjd3CUyXiZnj2KEs
	 rV1qArQyKKuaJOvxkaB1IGqywXdksCtA1arBW2dyrIve2uYcmor8LGO+VVDutm/yN1Yvm
	 LkM2NwC0Q2RlPJsf1Z3UwDBSAXpdfFutMPUGcR32/9c4NQIAvQ7vUi4yjrRW70F3K1YzW
	 hgeQgFNwr69tmuhfSxhIvoQ3MWBL61M/NPj1CVEMMzmCHs7T0C28ijA13JI/l/0GkM32A
	 zuWfWxfOLV6VWvpOSNpTc6bw5UVr/CTLS1AAJih7Ip92748oQq7YgY0XXmvt6WZtGHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=biMU3aw7;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF8F606A31B
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 11:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EF8F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=biMU3aw7
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso3128115ad.1
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 03:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793790000; x=1794394800; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GwE8Z7d8hC2B5A2aORLBN7ModRReguom9RWoATcO8ag=;
        b=biMU3aw77dPtR4+1MwwCrR1Z+AWwD7O9CXK/nOX8AdGa4P0fWDX4ZGkE6kLFX8JKL+
         FPbQNpOurkn3V67WJPHLnjR0skk4vVEUX0kzUMKovXWMLlXxMsUK6pxfXIvPA3nFOyh0
         n/GZ4kpncrWUe137AQauQMwzrqFkXiyDjUFyu778B4CiIiKs6tjeOnCR/Dh/F8xdBLep
         3bN1myXsbWXRldGmXttH1LjDOdAYFwNl4eqrK8Xt9SR5iG8tGluH3877uBSf+/cCceDr
         l4mL4SVDnzyjoJ2kd2vUEmAtD5JV6dtwZU3ruK7kz2IJSu1Q/yZfalzKGVEeyDxQTs4w
         hI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793790000; x=1794394800;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GwE8Z7d8hC2B5A2aORLBN7ModRReguom9RWoATcO8ag=;
        b=Yxup2VmtEMrPBm2Angyur8vEDKFIfb6PNz5MqbfXG6/5sDxPTyogS8eoYpPgpUJoFd
         /jkIbyRNoLh/GpQTFItC0NtyH78E76mZv0UyAfUY86m/bjWlvjMbPqvl6kYjDmfi0Rri
         v2XvvDD4aF94BTh3HioSfIYbVWuT9cZyXQN/YhM+b/ba8lX2ka9YcMAPnVKq1DCNC6fg
         bpDsVW+z8UHx6ar8VU89fqTYK2DJa676E6zuT6cfKouWSw6FHByGqTYzfYaA1B2TSd89
         ZAuMJTdgwmad+HVPeM4tLt10h7eWWkWOxgwdINcC2d1RCLA4ViFoDdGV1ATYLfnQjZwb
         YBtg==
X-Forwarded-Encrypted: i=1; AKwUvBzJnEQ0WfwVV3dmdNB8ShuYUMq/tsZ+6MLdDYbW7jqd2Wm6jPnUOwyU5MLqJytlIZdo+XqrNeftwP2s6A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8CkpAdHt3+5ohNjH5uNPPs78OagfWMmrXbn0DlINHtnoZ1bQae
	IyJYrfBinhQc1DgH8jlnDxak6fTuOtifSnjbtyTDSWGgd63INB6/chW2
X-Gm-Gg: AYBFou0yzE1jg6ohv4aeSdIV3+3VsaIPOGmzdyL5HBTqva/oFtmObvMx7vMm1ktyq8L
	UxIqnl2OcVZhPkGGhHvpzLRdlHAahM8z4Mx/XRYieuJ9lnIvMc/ZDPe9fk89BJ2zoUohHjSvTot
	hpNvoKobvvhIILWP/NPoR1ZJfSkma6ve4ZLzuei51nSkfOwpBWfTFnzUUfHJ80k+QpqM2B5Y/r0
	ge+ltuSd9npCjIcAL+4MfKC1pNM0ONEZNT3WQ52EoMNom6GmZ5eACTcyMmIAUn7vAuAlZSIQLHh
	4X8PnuiR4aezLfXRZwtoMmNZnxCcYwvvYHVihn4Pd5T3ccJzhI99tmlASIgc6El96AUy2Htr1M3
	txqhtJj4rcePT0KtOPryiXhNOmWhnA9z+7++ctgQWCI+SX6QN1Idc264bagPKFQfuCy/sRyjo45
	CmDQnBHAo08c6L53xpl2SM+Ti8isH51Axz02IMa0eQDZ+A8jEj4SiiA71p/9wTjZJ456q0momX1
	5wkR1QOYdS/34wpl1yOCkFoQBjix/p5kYFVUwreq2zxrM/31yyaaiv3hEmICbb/SdlzLZe/yubY
	CNonyFczfrTRmO9ivGxdC/1/BjbW5S8dwE5FWIecNjHfPEsPnroD5liMz7Sa75A8uGPGD0wOPZx
	s+Z2UtBIBiGMWmEbBDJlCXeM//azogPqT1R9ETXzHYYBQSGZhYnG6Jo/8o9+eNJSddU0QWtiDUg
	YunSO9YDE+96XQoRHh0vUUnhokhA==
X-Received: by 2002:a17:903:1844:b0:2e9:8bd4:577d with SMTP id d9443c01a7336-2eb364de4d8mr153487635ad.37.1793790000537;
        Wed, 04 Nov 2026 03:00:00 -0800 (PST)
Received: from minako.localnet ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed090f7313sm5843875ad.45.2026.11.04.02.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 03:00:00 -0800 (PST)
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
 Re: [PATCH v4 01/22] ASoC: dt-bindings: cs42l84: Allow referenced dai-common
 properties
Date: Wed, 04 Nov 2026 20:59:50 +1000
Message-ID: <nYufjgFVShG0c_ndRsefxw@gmail.com>
In-Reply-To: <20261104-eccentric-auk-of-zoology-55bcc4@quoll>
References:
 <20261103-macaudio-v4-0-637484efe46d@gmail.com>
 <20261103-macaudio-v4-1-637484efe46d@gmail.com>
 <20261104-eccentric-auk-of-zoology-55bcc4@quoll>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Wednesday, 4 November 2026 8:48:25=E2=80=AFpm Australian Eastern Standar=
d Time=20
Krzysztof Kozlowski wrote:
> On Tue, Nov 03, 2026 at 05:39:49PM +1000, James Calligeros wrote:
> > Some consumers may wish to prepend the codec's name with a known value
> > to identify a specific codec among many and set #sound-dai-cells. Allow
> > this by allowing referenced properties from dai-common.yaml.
> >=20
> > Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> > ---
> >=20
> >  Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml | 8 ++++--=
=2D-
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
> > b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml index
> > 94062c1d9d45..66cae8b7db5d 100644
> > --- a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
> > +++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
> > @@ -9,6 +9,9 @@ title: Cirrus Logic CS42L84 audio CODEC
> >=20
> >  maintainers:
> >    - Martin Povi=C5=A1er <povik+lin@cutebit.org>
> >=20
> > +allOf:
> > +  - $ref: dai-common.yaml#
> > +
> >=20
> >  description: |
> > =20
> >    The CS42L84 is a headphone jack codec made by Cirrus Logic and embed=
ded
> >    in personal computers sold by Apple. It was first seen in 2021 Macbo=
ok
> >=20
> > @@ -29,14 +32,11 @@ properties:
> >    interrupts:
> >      maxItems: 1
> >=20
> > -  '#sound-dai-cells':
> > -    const: 0
>=20
> This should not be removed. Why cells of 1 would be correct? If so,
> explain in commit msg.

This was unintentional, already fixed for v5.

>=20
> Best regards,
> Krzysztof

James


