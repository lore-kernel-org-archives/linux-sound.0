Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC4D3403E3
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 06:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785480357; cv=none; b=OGeEnXTbdPltirb4rFT6F8ovRSE4WdE9GYjaQp22p0qcopbYZusQvQzn8sEkJ393aUS72H7azTrnm9vzYFJRUnH5bqcErNzqiwUJ2EQIsuI1XFFv7bnZxiYYlpkC9Gv/hZ7a9lE5zaSSIGp0nz6lBVNTC3lQDXbZU4SnICaMaIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785480357; c=relaxed/simple;
	bh=yEJiRz0ut4OqquzOoDrHCNnJmPbJdaHDKmPFO5dEKhU=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VYSBNBTS+owUxsXFmrdeLSe7ReNG9zkbsqZ6Ut6mP52e/XIjp0mTgwefXJ7Dx9z1T3Oq3t8OtvQyuqoYHFwSwbz+BxxXJBnmg/YNm20t9pH5nni7nUyxIgCmV1tgBrRjIasIeUMWXyX3jrtS+JQuMIDb28YkFoV3YuyU/332RKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VBTMoe8B; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VBTMoe8B"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6983f20a8bfso1069549a12.1
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 23:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785480347; x=1786085147; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MIbPeVG4258G9HKd8kCy72K/NwqK4KgRygqC+exQgG8=;
        b=VBTMoe8Bpe/kfyG76gYWE7s7OqYe2JbfgKTQPQhPjWBXZkBPclmUY1V/abEp7eAHVl
         bsUx3XDYAs2iGg+gHysd8JEbRfZR+moaOFlJVq6H91IZ8ruUPLASRwDS10O6sRSiZ1I+
         bH0AzVYM5RAMmRo9pym0eZPA7ILKxGNPiImtITJp3xid2Cq+t+tFDTIPSEar2dXfiYyu
         gf09AerkK8iIknReQ4x6i7QMvleI7MWejTsbN1GDgOQm+gCgT8fmmW1b6s81oLVwC/3h
         UNCgJVVxxbi9UCfBosydqmD06dw4APx+prDuUCVcM85YStebWSzifMrtcCJsRigkI86R
         ta6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785480347; x=1786085147;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MIbPeVG4258G9HKd8kCy72K/NwqK4KgRygqC+exQgG8=;
        b=nWi5sOEEW1IEtPj5SaE/o4wVXu6mZRzdsjBcb2Ej8GQUpFwcxJdBIk++AmcqA7MBx9
         G9cM1ln678L6L9qdcfFA6cmfd1G6NHDHiYHdMJYrrvyA/JUHaJCjOE7SyhumWjHr9ePZ
         iekkAjhXOpTy4cNapy2uc4Vnd0kbGeUqB1mTJa8ngj73wkCeGp/BBjPPmI75ckIDr+vK
         MJZeF68W9cw8s+Lg4+X1XPhxrwFvrhinRLwcBHF6Z3RgE5hEGG5xvjEDBtWOWQgGdSdD
         HVh71Tdf7TVN4za5KHmUYhE/5lqD1NjPrx9Bt+XwSp3Z6UDDpBcfTR9WkwXV1owAxSFw
         mrKw==
X-Forwarded-Encrypted: i=1; AHgh+Rr6voHJKch5d7Uh3Ub+t3G5MRRNdlXpoYPg5XevoJiKe4nyELa/cu7NnaNyKr5AKdBtxL/pgnl/gr4vOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzXv9qbMFYQSvd2cCqcQnO7dvu4yehi4ont3jtQ5s0nf02QLmJ
	3u5Pp2N1ESZLl593E8n+Low0KE5QPVFc8lw29GOkZPWkve4YMVeP6vxU
X-Gm-Gg: AR+sD10x9AxyCwQL/iX0qAhZyBQ7xNrcosNry6xmG49JJAjnNCFrGcl8AkaLzBxcQE7
	VJ+tKqLOffQZbWcD5c2loozdlgDc4U8pSc08JuhH8Q+/6VbUUZ3vmyWgJTKzcFIwtCIzcJX95Hg
	8ILx3UfllLJMPrzWixCIF4gE1HsLnp+/At/VspOMXoRbgkTZcQBjXcO+iH/GN6epdRVpeewYlyS
	i3ZYVsXD0VL/MsYJrB4yg+zA60IlvW/T2nnaoyXODL5Zc6+4oJlfDYYtQQ1x4X4o2bXyTWrzWKs
	m3puNvIVvK1iL9Bokf0Mmp/2IL8OsoGoAV76hjA4plN4Bkn01lfeA7EErEIIHZQ8W4AmZWn2Tlo
	zuhyO9LojyQ48JCL10tYAmAYzrbYZofkgNp/1Hz/QFazPncCFI8v6+yDAxwtu2dQ2x4z/MPgmUm
	/TLBMiFFd7W7+BTAr6f43bwJ4GOrD9vMfYJaUbq7gO91fnjcLPS+3ojpobnMsgUdRUp5AI5GyYQ
	Bcdj83FOdZ77Ax8ofOdhdpPurB2+LnAhQ+x6X+/x+FYhLtI
X-Received: by 2002:a17:907:ea8c:b0:c1c:3b06:ed1b with SMTP id a640c23a62f3a-c1fd23f9c06mr42429466b.22.1785480346401;
        Thu, 30 Jul 2026 23:45:46 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-11-254-126.retail.telecomitalia.it. [87.11.254.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd3c5b0fasm33332166b.5.2026.07.30.23.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 23:45:45 -0700 (PDT)
Message-ID: <6a6c4499.797cc74e.266cba.6533@mx.google.com>
X-Google-Original-Message-ID: <amxElLesKZE9DX3u@Ansuel-XPS.>
Date: Fri, 31 Jul 2026 08:45:40 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Chen-Yu Tsai <wenst@chromium.org>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/4] ASoC: dt-bindings: Add Airoha AN7581 AFE Sound
 card.
References: <20260528174840.28644-1-ansuelsmth@gmail.com>
 <20260528174840.28644-2-ansuelsmth@gmail.com>
 <20260531-spicy-sassy-woodlouse-b2674e@quoll>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260531-spicy-sassy-woodlouse-b2674e@quoll>

On Sun, May 31, 2026 at 02:39:32PM +0200, Krzysztof Kozlowski wrote:
> On Thu, May 28, 2026 at 07:48:29PM +0200, Christian Marangi wrote:
> > Add YAML schema for Airoha AN7581 AFE SoC sound card.
> >
> 
> Nit: subject, drop final stop.
> 
> 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  .../bindings/sound/airoha,an7581-afe.yaml     | 41 +++++++++++++++++++
> >  1 file changed, 41 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
> > new file mode 100644
> > index 000000000000..80d9e87f1470
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
> > @@ -0,0 +1,41 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/airoha,an7581-afe.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Airoha AFE PCM controller for AN7581
> > +
> > +maintainers:
> > +  - Christian Marangi <ansuelsmth@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: airoha,an7581-afe
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> 
> This looks incomplete - missing at least clocks. Are you sure that AFE
> here is so limited, comparing to other Mediatek designs?
>

Sorry for the late reply, I checked documentation and the SoC doesn't have
a clock for AFE, Airoha reported that it's always enable from reset
condition. The clock driver doesn't expose it.
 
> 

-- 
	Ansuel
