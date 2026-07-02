Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794862BDC23
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 01:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782956345; cv=pass; b=cuRIypbWT0sQk5c8jELwgBqwyPliWWGMKgoHQg6ikYEfBzv5vB3fXWvjiMQnCo1900W4Y4UoGubNPkdDy/FXndgGs/XEfUEPPSPBdO7R0tmIq4AI2az1fAS+Z//eox2FrAcJE7D1S1HFwUKssMcLRj1vQaq4QwLycYLUtC1LIWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782956345; c=relaxed/simple;
	bh=mVL87EttaNCUS0ArSfV9Dq8wYEb+97u4sdSR2BpS7RI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lneVJ4xk0Obp3ONjTYLNHlYvjuJR+eqRWoUoT+gOQxn92TaFPnQltDHwqcUeHzuP/HsqkqDnlaf/xv6O/SDCSadY/y1KNOI9VF77ZZx7Y8mfz5moD8qVfeejLM6gW7qgQFXsG51vAkDHRk+CSGXI+QUnKhy1Uje4Q/STx9Yz1hw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pkzl6cdV; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pkzl6cdV"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c1254b73d63so157643566b.1
        for <linux-sound@vger.kernel.org>; Wed, 01 Jul 2026 18:39:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782956343; cv=none;
        d=google.com; s=arc-20260327;
        b=C9wdOkLc5PNWempIL2qXJYSOWmFddMNUYiWeo1a+sudI2E+lKxlcHh+NOLKzTzRO7c
         xFFsC9EbtmuAEjbj9WIZ69vwBGLXqCmcPJjIJDkgVxEB4tTO73iTag+qog9n6306SKvq
         7+mf1ouVsvfRhNtXDxtyqEgv+h7SUq7NK5yTouveIwg2oyh7rHnK8xvYpVAfedKj2WlL
         n1VS0egGCoxcm7arwspdVCPHUg2RKoM4X53INDuprREcwtyte9MaGezTRXTCAvRhCLg8
         ymrGJQmTThWqkdUT01L0wtw9IJT8qIjklFhGRhKk2LHtAklImMpTCgoAF7zE80iqgwBt
         XUpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gqxqwLiGZi4KRbu+1ajZ1YFNLw0ON224oZgbthL9Ai4=;
        fh=rAxwaQ8avJlCmGOBn2oRa+LzeyT/dno1a9iTXfhisoY=;
        b=jVkO4ekyCKxf16haGyAugufgRupdmxdq53h+csSyc5rdeiOifpG7JDChG9B4voMf9E
         bK2PoW9ggxP0Y9FKLEPbZoUSKOfIAe52Tot6c9jqFiLOrnEHvo7KKVZJuli7sLUvAuyG
         TRAFGzgB6voaTeUw8iIn4ndG0x7nGv2eOWI2oSZ7O2hrQBy717bJ9ysIqD1rJ6qYUWLX
         O9JEP6DHY9rx+yCcy+0XCMYGgguRiFYCGGK5ovllWB3EC4Qu22Fbry6t4zriA08BTgW1
         IwgN/ReNJJpXRFFtao+ucOwX0wKC8JIXmMseViLhltq7i/0zELCEPczxkoNo8B/uHYtr
         fW8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782956343; x=1783561143; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqxqwLiGZi4KRbu+1ajZ1YFNLw0ON224oZgbthL9Ai4=;
        b=pkzl6cdVdE6dPVHzRbf632DmiekFyTFgo1f3Yu2BCJ62RUH+XnN7ISXEYc2WWpIdRA
         JlMvZ3yfRIllVR2VZW14mtJqUdNLrXNVybn+hd1ObGk0dZ0puSunrx+mCBMUXKSfLky+
         yqY6gDiGx1HjhQseD1/gPU9PimvKSwKx/MrnndDUd2s59Ax8sO/rZcRwt6FLjPFZlI/S
         tEifj/eZssfTtaVxa37jb+4zn4gur+hrd9wGzNtg0otYtSCX3X8/nJmVKTplXcgrLYh+
         pJx6RyYEka1zHKCVBEhW8QJHJOoYDa4a0Y0OgKojNNax8LAwCQZ6Rn1nMqoL8a10tErX
         RmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782956343; x=1783561143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gqxqwLiGZi4KRbu+1ajZ1YFNLw0ON224oZgbthL9Ai4=;
        b=GiCfa6kvj0U7xgI7RBuBRlwK1udrOe2qLMWaUZeB41qtId37TaezrCRD9e5GttzYFW
         47tiRHkMgau6FcWzN4L//wjhyIb3ECNKGlCtzLVhx0/BmWbLbP3h3CeAkK6CpwF/U5b5
         qQfbkz5KAXqqF8nbGwQPoEHy0/Hbiwxcd69yG5PfYtjKxB5AgsVZZiSKVl53TcywxxlQ
         mWTwqt6hHt+YoUBwDau816SBR8lG7Ho0tKDyot1MtJtkdammXavj7z3oz60KQe8T5BN1
         htGG0djyZidydV6dOsvvGmvPnZaTBP+ptB+bRKV2KGwE2Vyk3SbxVfl2WKRFJA7XHwK3
         pWEg==
X-Forwarded-Encrypted: i=1; AHgh+Rr4mcycvpiiOXEzohNSF5a8okRDSYW4ARUlxFHIwbOPIbzAvDqiAnbVecIkkq248NvsOc+orsN80XK5KQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz60q60vAlV0kEdkouj7Z49OnUxYytqLqrDBR4MZMOlrz9x6hjv
	DJxp7D8VHwUGnoepgWelo6aLxl2quFT3RcpmlYK+6kkEHbLLUIGvNB0xo1HDMggXDg/2rmrzehF
	3VcSXUkw/n+6MKkDBrE83LcchjB1y5ec=
X-Gm-Gg: AfdE7ckOArEwHU4yOt3tUUgzO73TTNs8DYXOO5uc+qe7/C8GSKTaI502VSNBTGa1owd
	TYeIuWfyo1qCYlOQAEiTzf5GjfWizV7CBH/g9h+4AWajP0ZcBADnySFE0RzINScriOIRqhKOjZw
	Prmx6UbwEprEXhWQHXLHBGsLyBLVIDFGDRA/+7Q7PyAmzZUUdBFR2ssUMXliK8iLBaxp4NEMvvp
	WwmU/JkdfFQmsjBT6tAKU1aFyAtdycnFY/5EA0S7TlWeWXHrjzTobEUbUUtperMeS6ta4TxsBI=
X-Received: by 2002:a17:906:b89a:b0:c12:1c9a:48a3 with SMTP id
 a640c23a62f3a-c12a9d8ffc2mr170080866b.22.1782956342673; Wed, 01 Jul 2026
 18:39:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1782439646.git.zhoubinbin@loongson.cn> <ed1314e1d3275fd20aff47397345a88fad6e9368.1782439646.git.zhoubinbin@loongson.cn>
 <c9361380-b28a-4f7d-9ae5-a00042189b79@sirena.org.uk>
In-Reply-To: <c9361380-b28a-4f7d-9ae5-a00042189b79@sirena.org.uk>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 2 Jul 2026 09:38:50 +0800
X-Gm-Features: AVVi8CcmZHG289kX0-X2lVThLi6Vah5Fc-yy-AopmD9GwRf3FHHrHRDDZC-S9I0
Message-ID: <CAMpQs4+Za8=7hUm0SJ_Tp17_Hg+p=RHTsRPeutuPFfTs1rOABg@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] ASoC: loongson: Add Loongson-2K0300 CTCISZ Forever
 Pi sound card support
To: Mark Brown <broonie@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark:

Thanks for your reply.

On Wed, Jul 1, 2026 at 7:49=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Fri, Jun 26, 2026 at 10:27:27AM +0800, Binbin Zhou wrote:
>
> > The Loongson-2K0300 audio card uses a different DAI format compared to
> > existing Loongson platforms.
>
> >       },
> > @@ -177,6 +189,10 @@ static int loongson_asoc_card_probe(struct platfor=
m_device *pdev)
> >       if (!ls_priv)
> >               return -ENOMEM;
> >
> > +     ls_priv->cfg =3D (const struct loongson_card_config *)device_get_=
match_data(dev);
> > +     if (!ls_priv->cfg)
> > +             return -EINVAL;
> > +
>
> Does this do the right thing on ACPI systems?  I'm not seeing anything
> that'd get us match data there.

Yes, that's correct for ACPI. I tested it on the Loongson-2K2000.
The ACPI system for the LoongArch I2S card uses `PRP0001` as the
hardware ID, which also matches `loongson,ls-audio-card` compatible.

--=20
Thanks.
Binbin
