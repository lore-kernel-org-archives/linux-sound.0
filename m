Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEDB344D8E
	for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 10:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776249840; cv=none; b=nz0pQVt/GqnFsSCkfZhu7WOE0rK29S8NyULdwuSMB5dK51t/0tzY9dU5tiKlToz6qzKzOjKvaHAFifZl2YrlxyuxgPs3QvFB6MzKpXyEkeD0Xw+CwYetPP8PoKplljtegjueVswMlsMYVESLCZHIdcv1g50B/u4q8peirr8xzNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776249840; c=relaxed/simple;
	bh=I5rwwyun5vLsa+Rz7N5Es5Z7F8X7j52CQZjUfE9JhtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJmJIu9Ma5IiLun+L8XvzM+XAlinzoTo9jKsdmQB9IEePFXGaYEk7On1cktkjdyumiGY8SRoPtS5pdknuqDQQd7dqBGU1l+aO4I4QIRwyPb8ymBm0ybrnvUZj7LXoYgGHWYiTT8NywVp2hZGTDMxxpsIyt3oiO7Y7PcyyDY+IRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=giZH8VJP; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="giZH8VJP"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso77737115e9.3
        for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 03:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776249838; x=1776854638; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+SC14nnT8Z+MZcGYvcmlfpHodRTXT6Fog7SITNI+yb0=;
        b=giZH8VJPdgey27mzyma77E2lHOjQSjaBpAN1wEJ1QxzGm5aDqaXF/J+kJfKBCBK8KA
         9y0fpUIQknDG/cYr/9DMqJetrT+gsxbCsgWByDBP2EGMl6smehPMnDwHR0nBV0mfVpQV
         cnRHSv7NUxfVTO0BD1ItMQuHO6F1T3JkHKkvug/xTBcRSdjcqzmd97iNhp7SxiFzGDl3
         39JSVhv66PhdCJiePJr/XJKDRr67lILofa1u7FkDqeLhw0rTB8lcttxDBePdNlswEf0W
         xsRoPACic9K8zw0Laf/MS6d4ZvxBoxeZDs4uuB6Xpu1F0GIMZdtnAnuhL20mTkrhNf9N
         mTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776249838; x=1776854638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+SC14nnT8Z+MZcGYvcmlfpHodRTXT6Fog7SITNI+yb0=;
        b=fnfd/WrcOL5+udBPLcDmw8U/BMgK8dWRFHCbQh67G4sTDBp3u/YwSN0eHbCF+0+NGt
         F2zUgpxZneGzxHkrucWeTbDn5cqZ2k4FLcrmStwyJYBzFrIQwrvr7hMvUX8rcRhgP4Q3
         Ld2nyoLnAgDEOQcJfwEL1MOc+/XJkjDYkd9qxTJXxW1esio4JqmnLasJMe+Lhx3SBmkH
         cQQKIpc/5njw4dj7JnSjDYFENi21mHPoQfEjOzQjV1MHd3Gp7BTkA36sJJtBV5TQ/6W7
         AsZt7zgKxU1ExdLxj5C8D4fR0stYh1PE0JWYUHsllvnx3kGjiBW7FNuLVv+jhBht9Af7
         VboQ==
X-Forwarded-Encrypted: i=1; AFNElJ8SKRmGbD+jo6sEbx9q3/WIEm+zYqFXtfGod5REBal1fpQGZ0/5vhMXpxXdFvjdXg6e4KNBdY2udf40eQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwW4iilim5WnrfcFC19XP/PujPe6rD3l/duhaNhD8iGEzzLtJ7m
	dA5+LFwSLpprJ53qkUlt4JdcVOdZvBH4JD1vKVEK/ePZGNj2fP3CfIa6
X-Gm-Gg: AeBDiesFnIfeW7KUZCxbqgTovFgAlh4zF+NdtQ3ZUHjRKeQZKK3VIajTRut58x67Cuz
	2F4D+ms4+tngrUw1KZ9sESAQchvdI1Ro4HCZFlrwPSG876IqW28nTB86aImJgz8DUsmtg7CHSUs
	CM6YvH2Lf4tcjCxrfnFBDBvFxrg/k0AfNrzE/Ux3tHaExCs5ugqQTRYgQd3ou+sRKuFSa/Iz6vy
	mpOcTI+xquJY6HU24eFE2EU3t4EN76CK2LM5tiz2ZQQSOVo+/nsnMt3NBsL48sn9Aa2znfQEbnu
	8yyCexHsvPGjhuQglXcm82nNPqFk5v3v18Fk+ZmcOqX0YDgQpstENKfkCNLYJuJYpWFj1u10TMr
	/N4FvCHaG2C5d7VJH8la626blaaAKFnXyS/JMxuCwwT7sphAkKJmjU6QXyjqAh74T3kn5UA7EDL
	6o5LCqvKNEBjhESbGoTE642WQqijSr7MFEuLOemZWOMLqDKhOu2wsdn8sV
X-Received: by 2002:a05:600c:c0da:b0:485:4eaf:eb53 with SMTP id 5b1f17b1804b1-488d685c12dmr246513395e9.19.1776249837368;
        Wed, 15 Apr 2026 03:43:57 -0700 (PDT)
Received: from localhost (16.237.129.77.rev.sfr.net. [77.129.237.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3f92f4sm3535100f8f.34.2026.04.15.03.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 03:43:56 -0700 (PDT)
Date: Wed, 15 Apr 2026 12:43:56 +0200
From: John Madieu <john.madieu@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 02/12] ASoC: dt-bindings: Add RZ/G3E (R9A09G047) sound
 binding
Message-ID: <20260415104305.ygt6ai66qk3tcuus@labcsmart-sqy>
References: <20260409090302.2243305-1-john.madieu.xa@bp.renesas.com>
 <20260409090302.2243305-3-john.madieu.xa@bp.renesas.com>
 <20260410-astute-celadon-dugong-ee367b@quoll>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-astute-celadon-dugong-ee367b@quoll>

Hi Krzysztof,

Thank you for your review.

> On Thu, Apr 09, 2026 at 11:02:51AM +0200, John Madieu wrote:
> > The RZ/G3E shares the same audio IP as the R-Car variants but differs
> > in several aspects: it supports up to 5 DMA controllers per audio
> > channel, requires additional clocks (47 total including per-SSI ADG
> > clocks, SCU domain clocks and SSIF supply) and additional reset lines
> > (14 total including SCU, ADG and Audio DMAC peri-peri resets).
> > 
> > Add a dedicated devicetree binding for the RZ/G3E sound controller.
> > The binding references the common renesas,rsnd-common.yaml schema for
> > shared property and subnode definitions.
> > 
> > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > ---
> > 
> > Changes:
> >  
> > v4: No changes
> > v3: No changes
> > v2:
> >  - Introduce RZ/G3E sound binding as a standalone schema
> > 
> >  .../sound/renesas,r9a09g047-sound.yaml        | 371 ++++++++++++++++++
> >  1 file changed, 371 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> > new file mode 100644
> > index 000000000000..1dfe9bab3382
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> > @@ -0,0 +1,371 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/renesas,r9a09g047-sound.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas RZ/G3E Sound Controller
> > +
> > +maintainers:
> > +  - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > +  - John Madieu <john.madieu.xa@bp.renesas.com>
> > +
> > +description:
> > +  The RZ/G3E (R9A09G047) integrates an R-Car compatible sound controller
> > +  with extended DMA channel support (up to 5 DMACs per direction), additional
> > +  clock domains, and additional reset lines compared to the R-Car Gen2/Gen3
> > +  variants.
> > +
> > +allOf:
> > +  - $ref: renesas,rsnd-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: renesas,r9a09g047-sound
> > +
> > +  reg:
> > +    maxItems: 5
> > +
> > +  reg-names:
> > +    items:
> > +      - const: scu
> > +      - const: adg
> > +      - const: ssiu
> > +      - const: ssi
> > +      - const: audmapp
> > +
> > +  clocks:
> > +    maxItems: 47
> > +
> > +  clock-names:
> > +    items:
> > +      - const: ssi-all
> > +      - const: ssi.9
> > +      - const: ssi.8
> > +      - const: ssi.7
> > +      - const: ssi.6
> > +      - const: ssi.5
> > +      - const: ssi.4
> > +      - const: ssi.3
> > +      - const: ssi.2
> > +      - const: ssi.1
> > +      - const: ssi.0
> > +      - const: src.9
> > +      - const: src.8
> > +      - const: src.7
> > +      - const: src.6
> > +      - const: src.5
> > +      - const: src.4
> > +      - const: src.3
> > +      - const: src.2
> > +      - const: src.1
> > +      - const: src.0
> > +      - const: mix.1
> > +      - const: mix.0
> > +      - const: ctu.1
> > +      - const: ctu.0
> > +      - const: dvc.0
> > +      - const: dvc.1
> > +      - const: clk_a
> > +      - const: clk_b
> > +      - const: clk_c
> > +      - const: clk_i
> > +      - const: ssif_supply
> > +      - const: scu
> > +      - const: scu_x2
> > +      - const: scu_supply
> > +      - const: adg.ssi.9
> > +      - const: adg.ssi.8
> > +      - const: adg.ssi.7
> > +      - const: adg.ssi.6
> > +      - const: adg.ssi.5
> > +      - const: adg.ssi.4
> > +      - const: adg.ssi.3
> > +      - const: adg.ssi.2
> > +      - const: adg.ssi.1
> > +      - const: adg.ssi.0
> > +      - const: audmapp
> > +      - const: adg
> > +
> 
> Missing clock-cells.
> 
> Mising dai-cells.
> 
> Why your binding is so flexible? You have a fixed (as in afixed) ABI, no?
>

Will address this in v5.
 
> > +  resets:
> > +    maxItems: 14
> > +
> > +  reset-names:
> > +    items:
> > +      - const: ssi-all
> > +      - const: ssi.9
> > +      - const: ssi.8
> > +      - const: ssi.7
> > +      - const: ssi.6
> > +      - const: ssi.5
> > +      - const: ssi.4
> > +      - const: ssi.3
> > +      - const: ssi.2
> > +      - const: ssi.1
> > +      - const: ssi.0
> > +      - const: scu
> > +      - const: adg
> > +      - const: audmapp
> > +
> > +  rcar_sound,dvc:
> 
> All new properties must follow standard rules. I understand it will
> create duplication, but really that's a mistake of 2014 of adding fake
> vendor prefix rcar_sound.
> 

As this definitely changes from the original implementation, I'll simply
drop the split patch and add a standalone binding for RZ/G3E. Hope this
is ok for you.

In there I'll address all the comments you've mentionned.

Regards,

