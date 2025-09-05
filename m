Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0DD2F656E
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 11:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757072004; cv=none; b=lWi4Wqm1F6sT0qyZyefXLLXq3d0erHCCHDy8y4yhJWL+hvQ1VDwxpnGOC1pyUNoci3k/YFqYT6TePXVza66byQs7gDd6sXfN0TSqFUEAAAUO/rrGlXH4jzHvAibiLHh6C4WBbqeLGUGx9Eo83E0cRbB5uDEQvD2hyDF9sdDsTMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757072004; c=relaxed/simple;
	bh=o3hildMwaW8SKO7ju4TnjzbgldI5VhKTu/M3PBEf9Pg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hQpQIx0PdMW9jrI4mTRl0ysP7BX32FSx7rSS1+5ziYiSBx7gVfp3Dmr4K9oX3cQjIMmEt5+d7S0yO1kH+frdSCl7drJnBJucVnoCqGxcAKN38tHgDZ4okl+kftLjr0Q9wMiqa6C4BIJ/eLRdbH2flCZxgr9lyGjKLpRZfJ0IdLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wv1ats1l; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wv1ats1l"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-336bbcebca9so15591881fa.1
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 04:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757072001; x=1757676801; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e737NFCnB1pAiZwFeuIFUAdoH1qix+jNDtR6tlkeuzc=;
        b=Wv1ats1lENeDFeCHltS6z4eXYjp2PkHp41U/KSjwkprIJpiwUA2iVdzBaZiRrx1Mt0
         qHGzczd2Z5jSluwCy8P8ACWB3Gle0ScrGvwq4D87K+DQ+Kn1EKuy9V/NtvOQhoVvhDw1
         VlhaCRenYJr1p6TqCwmNzarskvRPWlEJDa2Nj8Rx+vO3RPTFL8o/Q46mAI6+DAl6RbDn
         ZYZKDb0HjPYXY9TG0yQXthJbEdx7DvqMucAOcim7XURySnkfmfW2beuJwk8vwC9AIaRY
         bPmuFP2vDrK4ShsfmwWPEdFTsf1mqOJIf3RdGn/j4v4G0Gq7NWGy2otXfxbf4BukM+3s
         cpgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757072001; x=1757676801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e737NFCnB1pAiZwFeuIFUAdoH1qix+jNDtR6tlkeuzc=;
        b=U2tNOqZyg3jo+xlCNa3LmYre9DNk8jS4q9OPebSKUBt/O1fmucxPKNmpvstaMhZLfk
         G6uZ+6DaKpmfT0jBH5G2d8p0b7c8zSGyHozDZ5+A6SuGrsXK+LkTKHJtGfNalBF5ZRym
         oTet/brWjjapwCeCo+ONGc1CsT6EfmOw0TIxs2eF78DLkTcyHnKWJt/4IdCL6MCEAlQv
         W0cG3D/5lZ+xt89IghI//SCG8kXY4QhozuN4AUaOfal4AcFn7CZu74Uu9A6k/V4VBUS0
         8D/cX8m6MO+Sy5Q8Lk1wAt5+t2M4S431fTP8U3oYyTWzLDRwZs0gCqI+930WUI+O22Hd
         N8mg==
X-Forwarded-Encrypted: i=1; AJvYcCXAFDzT7z95HcQcrQbOT9P0ht8CVrmj7OesCha2dWADfUIdu8ipnpnKmRDKDnA+ok67XQ6SFdVE5MtfXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhXvgarUbrgkauGoGJwkY1Gfi7BQ748jXzfc8y6sjdD4sgkqYC
	jEFHRtBl66CVzr61HGD/Exbasi/WkT1eUhSkMcPDIp4FGLYkvTW0VGYuzaNhvMbj853XbvNV+Qd
	bpkbamShQhJalybbTWO+j0ziGNPoyL1z4guy52F2TOQ==
X-Gm-Gg: ASbGncuJofv5hI+fIzOsekHcuBFoMqI3HnJbQK5JYHJVv8mM4pQHMch6dTcQx6od9bk
	kR/zNRcYoSyhkJ1W3j7dtgJqEgYMGm7XevGaKNhIGKBXS+hDmp0U7dVDj+v0PUoy4w0F4+v+2zP
	8pwq1pZPEypyFuSgtQc5GV3TbpVxLtbPe0javTLIU9VSKc2NICTBsubOXn7Ri0m73kIRW/jlk3e
	QpoYxkSxjLuS6UdeQ==
X-Google-Smtp-Source: AGHT+IGSWO4nCHB8o/6t/y6RH8BOysPzoQ6jiv8gZqcTwwokf+Kq7hYmaaHYY9kCJZ1mu3fJ8bEoY6l6Nt8aDc5ponQ=
X-Received: by 2002:a2e:a482:0:b0:336:7c7c:5ba5 with SMTP id
 38308e7fff4ca-336cad21f17mr50388961fa.23.1757072001159; Fri, 05 Sep 2025
 04:33:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-14-ariel.dalessandro@collabora.com>
 <CACRpkdbpKqKyebADj0xPFq3g0biPh-vm4d6C3sd8r0URyfyYRg@mail.gmail.com> <caguo7ud4dapb4yupeq2x4ocwoh4dt5nedwjsyuqsaratugcgz@ozajhsqwfzq6>
In-Reply-To: <caguo7ud4dapb4yupeq2x4ocwoh4dt5nedwjsyuqsaratugcgz@ozajhsqwfzq6>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 5 Sep 2025 13:33:09 +0200
X-Gm-Features: Ac12FXx6o0aglHH6TQGfVH200HSX_9WYooYS5LFefZX_Ln3xQz4XYXPyVN0c3dY
Message-ID: <CACRpkdZRHQ6vuchN8x8d0uPCVMPPHOdBVWiUhzFJNs2paHGbYw@mail.gmail.com>
Subject: Re: [PATCH v1 13/14] dt-bindings: input/touchscreen: Convert MELFAS
 MIP4 Touchscreen to YAML
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>, airlied@gmail.com, 
	amergnat@baylibre.com, andrew+netdev@lunn.ch, andrew-ct.chen@mediatek.com, 
	angelogioacchino.delregno@collabora.com, broonie@kernel.org, 
	chunkuang.hu@kernel.org, ck.hu@mediatek.com, conor+dt@kernel.org, 
	davem@davemloft.net, edumazet@google.com, flora.fu@mediatek.com, 
	houlong.wei@mediatek.com, jeesw@melfas.com, jmassot@collabora.com, 
	kernel@collabora.com, krzk+dt@kernel.org, kuba@kernel.org, 
	kyrie.wu@mediatek.corp-partner.google.com, lgirdwood@gmail.com, 
	louisalexis.eyraud@collabora.com, maarten.lankhorst@linux.intel.com, 
	matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com, 
	mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com, 
	robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch, 
	support.opensource@diasemi.com, tiffany.lin@mediatek.com, tzimmermann@suse.de, 
	yunfei.dong@mediatek.com, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-sound@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 5, 2025 at 12:02=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Thu, Aug 21, 2025 at 01:56:24PM +0200, Linus Walleij wrote:
> > Hi Ariel,
> >
> > thanks for your patch!
> >
> > On Wed, Aug 20, 2025 at 7:17=E2=80=AFPM Ariel D'Alessandro
> > <ariel.dalessandro@collabora.com> wrote:
> >
> > > +  ce-gpios:
> > > +    description: GPIO connected to the CE (chip enable) pin of the c=
hip
> > > +    maxItems: 1
> >
> > Mention that this should always have the flag GPIO_ACTIVE_HIGH
> > as this is required by the hardware.
> >
> > Unfortunately we have no YAML syntax for enforcing flags :/
>
> Theoretically there can be an inverter on the line, so from the AP point
> of view the line is active low while from the peripheral POV the pin is
> active high...

Yes, I think someone even proposed adding inverters to the
device tree and was nixed.

It's a matter of phrasing I would say:

"Mention that this should nominally have the flag GPIO_ACTIVE_HIGH
as this is required by the hardware."

s/always/nominally/g

Yours,
Linus Walleij
