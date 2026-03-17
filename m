Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0B23C4566
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 12:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773751609; cv=pass; b=PRp5Hxta88rdv6K86Em1Z+xiED182CehBCK73FbFJ0x/Tln780r0orqiu7kLtGoUdXP9nLkc3tgfENZZ5PyoABnJ7lvvsCGU8JcufjBNCeeWRh0nVzLolm4YNvQ+NhWHk8ZxRk+xqaGa5JNApKivAcT9fYF2FOZ6bI8CkM8bLuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773751609; c=relaxed/simple;
	bh=mYjGwKJGXb9AdcAJcVyQZLzkZJfik89IS4+cyqBDMrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TL6BJJWQJQjr2lQCHgRs/N28W9miAM//x6FNBucujBegvYei9j9c7WcByye7lNa1jphmbP00nyhUlhkD4wq7jEOe8b6qCXcFQRNHtPTNW2ym2q/rdV1jyBx3ugb+0T3rJAQxP0nLbBrZArBKMVawx20fB80k10HxXQKdWgI7n48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KMrrbhaN; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KMrrbhaN"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b97e5956208so53416366b.2
        for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 05:46:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773751606; cv=none;
        d=google.com; s=arc-20240605;
        b=goENTErwWkU2dcGTzhuKa+VKunsmk1Q0/omdBVH5hyvQriA8MU/yHFw7+wq4/GPk2x
         ucNWFxeoGmnROlmTvfbWqViqIoUxRndJGHt/tXlPqMlpDLGtr8OtbX0TM5Z1vadLN6v8
         U+gAFvW864JME6BWtz4a+nU118pFDE7b+d/rPOaFeOx8cCtq+PDDIqK3Lr4P1if7aTIH
         MvHVNsCUBgJaIMAB0REzXqItRHrinmIApRW73Dcqse9cQ9Bu8m7DcolomNRrtjajkLTj
         cdAlZaY/myq28TPImSPgwDGB2/BgctbIx0Gh6sgt540YCYoSa+qXIcLjXODof0B6bOTG
         k/3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+JaAdR+BAKKabnEcn2fmDmSU35qTJcdB+x0PjifxyzA=;
        fh=Q9Xo6Q5B3SfDCsh9JyQrPk3vsWkMEBhks1FvhS8/QQc=;
        b=HlEY6Kg+MhX7LjhmRa4hzeEqX7nZyYQpu9NLQHn8fZgBQOSpJxeOuwJwm25cM847Xp
         We9k4TM8nx9zyIvatwiYKXnl69436pPmm/IOf9GCkyEy8+paUCFvLNubxFSo+a1EmGl4
         8WkxY99Is7lRa91xqQ5Wg2BpofA4fH2WVMLQFt1nCTU7FP3kvR5ss6ppS7dIQ5TeLyMM
         0oPTdvGlH5tQfjSvrfzBtX1wcToJMFfKlfWVjzgRDWcxBRjAH8lwvmrm83cHGK07/xXb
         uDUNyvJfgPADvoZDchbr1e7mOCyp/08jZXhJX07fnuU1ssejCOOO+lQ7Mmx1gBzmCJsF
         slYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773751606; x=1774356406; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+JaAdR+BAKKabnEcn2fmDmSU35qTJcdB+x0PjifxyzA=;
        b=KMrrbhaNuwNNANo2/hQcNx8kTR51uAplPxKS6Se10KwBRAC9R3OHVdTJKE8+FX6BWe
         zdxMm1dhGJ/fIwutGpoxJ+/qG285q0FhxmYUqlCgxgK5BFO2e2GHydqWTrut0KMtNgsD
         kJ0f1PBmK/8vuC9SMAJxj8HerbbMhX/4zARcbELoXS0Sn5S1Y7g6eWqM+ZE+nRizRt8n
         cUw5ReZKZC5VghCQjTUCejBbY5Qqf4O+Vpo4O3xcEJfMpg2w0fIh+KaNQHJ25jMes4rG
         g0ToivDUYRdQZVEorWrjnU5EVMJT2c9PjpLxzFuhbplTJ4zCO3gcdxSpJ5x6Hz9B/ps+
         cb5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773751606; x=1774356406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+JaAdR+BAKKabnEcn2fmDmSU35qTJcdB+x0PjifxyzA=;
        b=joFPaDNa86M/AzqvnuA8ECYL5uBQ5Fx12SlZr4qrvCH2TioqWGr+ampIE8bBSO2qWn
         um7OmmQHwz9CyIPAx3lppwDXuyyuqgRoupWTunlYHQe2YbpucWSlP3jN53DyPRZaYl0u
         GVSH5NSeH2FWVFtzJWO+CFhvakaLILcW3oYPhSrPXdeFYJ4Uyhj6cW6zL8hGi7U77kD3
         eMeK1jFZ26RVcIxU7TM1utYEpGeqkZ2LHp5c6IfhZb7lDWtkRwr8D00nor8AtMOHrq11
         YuV3/oi8D2r3R72kWRaGrxgxAKu6z/kOTkHyy7ufpRG6n0puaTH2/7/KgrcmMwSTHd0L
         Uf7w==
X-Forwarded-Encrypted: i=1; AJvYcCWsfKpGvGqr0Uv7gFGAG0q9JDI1X7bRWgNMRj0TXXjR8r2QvvYBr1iLySclTulsq58pWtG8/jOA7pgxyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwTUwfuykjdN0199LIUnr3jfvAS9hj124ZTSZ0dV/B7tZcWcn7
	SZwH/4PJ1sb+b7jN2YvbbCwz9F1K4lfTz9hvt+MB4o9//DuxKmM5L8qrrzyYUxOewpieI3sN0nf
	wwGWHDw77ZkckLmoECbOpDml/OU5Njvg=
X-Gm-Gg: ATEYQzy7EIjTcjbSyvYE4icuq6ck0pxrT2MYhsYucLm5ltqcoUlpfnNb3rJqc4Bsp/A
	xu1k0D8gaS24lb7T7muNoy/+CZpM4IbDsKppKGbxEeW5DzNCyDkIUzYfx7b1grgp/ULYAajjsou
	/NNOHK202uF86fDGUvsg8eGaKpIuJKrPTwCgp4N+9TfBBz0GD7Fa8d6QReCATNusZrpFx9Q4qIx
	KtJsFv2IFFe0Sq1eTXWPonMUq4f7LkuuSeyWZgkxY6Fb2jg8TfPXshUJTLz5ZIWlu2ZR7WappO3
	/SfXnnyH7A==
X-Received: by 2002:a17:907:746:b0:b97:6384:2317 with SMTP id
 a640c23a62f3a-b97650e5609mr1098522666b.17.1773751606032; Tue, 17 Mar 2026
 05:46:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1773107475.git.zhoubinbin@loongson.cn> <cb7062433863aea0d66959fc0f4aee791cab6402.1773107475.git.zhoubinbin@loongson.cn>
 <dea0bc84-c039-449c-8a6b-652062df75aa@sirena.org.uk>
In-Reply-To: <dea0bc84-c039-449c-8a6b-652062df75aa@sirena.org.uk>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 17 Mar 2026 20:46:33 +0800
X-Gm-Features: AaiRm536vGSN7n9-qJm9TBI4DE0o4d3kzNfShcfuQTENhCd8atZI4Bolz7w2-c4
Message-ID: <CAMpQs4+ASJ=ZC9wH49cnSGk8BRMx35P-OVdxzYW-pXsN6QwPEQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] ASoC: loongson: Add Loongson-2k0300 I2S controller support
To: Mark Brown <broonie@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark:

Sorry for my late reply.

On Thu, Mar 12, 2026 at 12:15=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Wed, Mar 11, 2026 at 02:37:48PM +0800, Binbin Zhou wrote:
>
> > Due to a hardware design flaw, PCM_START requires an explicit reset.
> > It has been tested and does not affect other machines.
>
> Are you sure?  It just does a reset whenever we start a stream which
> means if one direction is already running the controller will get reset
> underneath it and disrupt things if the other is started.  If this IP
> requires it I guess that's just unfortunate but presumably existing
> devices don't require the reset and will be regressed.

Sorry, I may have misunderstood that.
We just need to soft-reset the controller in
`loongson_i2s_plat_probe()`, similar to `loongson_i2s_pci_probe()`.
>
> > +++ b/sound/soc/loongson/loongson_card.c
> > @@ -61,7 +61,7 @@ static struct snd_soc_dai_link loongson_dai_links[] =
=3D {
> >       {
> >               .name =3D "Loongson Audio Port",
> >               .stream_name =3D "Loongson Audio",
> > -             .dai_fmt =3D SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_IB_NF
> > +             .dai_fmt =3D SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
> >                       | SND_SOC_DAIFMT_CBC_CFC,
> >               SND_SOC_DAILINK_REG(analog),
> >               .ops =3D &loongson_ops,
>
> This changes the clock inversion for everything - should this be
> parameterised as that seems to be a fairly generic card?

Okay, I'll add the new compatible.

In addition, this series of patches seems a bit disorganized, so I
plan to separate the first four patches into a standalone patchset
focused on code reorganization.
I plan to add GPIO-based headphone detection (Headphones Jack), which
will be used by the Loongson-2K0300 SoC.

--=20
Thanks.
Binbin
