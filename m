Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5565642E000
	for <linux-sound@vger.kernel.org>; Thu,  4 Jun 2026 12:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780575024; cv=none; b=BGFkMMLLVcYDkdcEk4dxxyDIx/slh28jTzWKUtuNNJ4Hv1szny+CVfpOaeIUi2SMhFEEkQ43MvIkQSrgWBN3LRijKf3fMDzvE8y5/bQhCe1LLhhYUqtowofhAD5DPVWtzeRP4g2tZzwTkIHEmHvXhCqhc+yhYByNcMGAYLE5TvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780575024; c=relaxed/simple;
	bh=W7pkTBC2mguqsY9HevqNVRnUGKxiCNpyWrU5jMOs1ug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tWtXq2lbEIDKu4Km57/kgF6rV+TbZNfMHh/69MQSYtPYgEvZzXLHrYIFNLNX37hgL6wSzY380D6m0UFIZpEMo51PL71XsXc/XuUB6E21xlc5BEq5bukFjPSCQbVb88HjiXzoUGSX+AwK5pNFlgyclAJ2Ku7yoNUxw8SA4iZeaEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5a46be4862fso146878e0c.0
        for <linux-sound@vger.kernel.org>; Thu, 04 Jun 2026 05:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780575021; x=1781179821;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24Bm5+9RznVEO/BZ178uK6yDmvRwITtp/jjjxZ2arTI=;
        b=Af1LmKwuJ1tlFRVqzAFVfCfYs78nvAico+kD8kf9col7qc673OIemA0AavC0v37aLT
         GW7l1sa6+wh5qLhbIhjAImtaz1LXAVCUT/b3XLgnbXxCMFQZQGXYHumG+uV3edw2yVU6
         5TpcZzycwLEJKafATKY3G0xLi1rQ2cHRAXczgUMDYgzx7UTy5SbpqWtTd5od858E+el5
         sHgFi+y5XP2WL2CsdmPu3TO/EwSsHpeEK+BHpHCoYdSZVXi1kN1w0EiITcjEBPnl5X+T
         /O5tj1l97Idid8a27YZlAgD5s7p3tpG5YAnMk4aN564vceYtEot9lcF4SniYqac97Wiz
         Ku1w==
X-Forwarded-Encrypted: i=1; AFNElJ+WPpHMVOMJERjj0KFAdtqCBjr+22zNn8jywD3dHp2CugeQbMssecD4CVgKu8dwjfwaPqwDX0jlLjgQvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJV11VHLf3eVfg4zi3E0HOil8P+MOK53zq4kWDpzxSGCAtmnSx
	QsMUWaM6/KFChQoWFisJicsTqEHtQne/nup1Qs7k4Ahpcrh5800qDBTBkfyvFSoqdzE=
X-Gm-Gg: Acq92OH6NITYd2Q9kr03j5gYhzFmj6uA4XHIRnhxHAxnY0Oynnzgyu/8eKi8ccGydvq
	47TL5bWxhlKwvbEEeoh6zY94ziFjDV3lXvAetTDj/jlO+ApidsBpn5LCdNsY2rzD+X9FVzFABO+
	Zcpk5LPsOA3568sQJTHa99wLrJ3+5XLr3oVDnDLXKftYhwN1HEe1b5pk7LZdlkz7A+3r4vXejPc
	kVaZQZYuOTjWSJXYJ1LoMU7urBt0JTrY3y6AhF8UPvSnwOeye/AfnprAJTTf3eAjaVog77JzqiT
	IPn6IyqaEqEI40g4aapg5XTt14EMCP2PdNoMJ5n5d/JONR+GLWFmRJtInV0u/74qWDwss8MjwK4
	StzqBalHuX1bIra6oFBdlWpp9OZdUNZ/kROda8268IJM/WTC9RchbAw/I+1xXOep25StjyNjwKT
	AxQSilhK7+eUi0Uzt5kQrCRZDcVRRpjUuLjx5YBdXw3lxkVRceLYJ0jE8APTn15q79okEeTje5a
	gU=
X-Received: by 2002:a05:6122:1d87:b0:575:29ef:7df8 with SMTP id 71dfb90a1353d-5a6e45687cdmr4455407e0c.2.1780575021291;
        Thu, 04 Jun 2026 05:10:21 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5a6d6fb9ca0sm5608646e0c.6.2026.06.04.05.10.19
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 05:10:20 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5a46be4862fso146860e0c.0
        for <linux-sound@vger.kernel.org>; Thu, 04 Jun 2026 05:10:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8ylB4asN3bMmGSIxPnrx9f8y0qJIfWfVBhkgQS1KxchLhD4q3U2LnXJUTEIHIjJNu7QndEi2+WXSTuOw==@vger.kernel.org
X-Received: by 2002:a05:6122:3124:b0:56b:8e1c:582d with SMTP id
 71dfb90a1353d-5a6ea26b55emr4329928e0c.14.1780575019519; Thu, 04 Jun 2026
 05:10:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603202805.3530046-1-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260603202805.3530046-1-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 14:10:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVHSyaD9JBgCuC-saw8SV2WvN2H+hnMX8Nw6LJmoNQmXQ@mail.gmail.com>
X-Gm-Features: AVVi8CezB6KDo6j8ugocyAfAPtEdt_L0Vgg5u_qdNGl3T-N1qL3CcUP4MWGEjnI
Message-ID: <CAMuHMdVHSyaD9JBgCuC-saw8SV2WvN2H+hnMX8Nw6LJmoNQmXQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: sound: renesas,r9a09g047: Fix
 dma-names list and ports schema
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	kuninori.morimoto.gx@renesas.com, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Wed, 3 Jun 2026 at 22:28, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Express the dvc/src/ssiu dma-names as an items list rather than an
> allOf-wrapped single schema, and drop the now-redundant maxItems. Fix
> the ports container to reference graph.yaml's ports definition instead
> of port-base (a ports container is not itself a port), keeping
> port-base on the port@N children, and constrain each playback/capture
> phandle-array entry to a single phandle.
>
> While at it, drop the unused top-level #address-cells/#size-cells since
> no child node uses a unit address and the ports node provides its own,
> require interrupts/dmas/dma-names on the src sub-nodes to match the
> ssi/ssiu sub-nodes and the driver, pin clocks and resets to their fixed
> counts (47 and 14) to match the clock-names/reset-names lists, and put
> compatible and reg first in the example.
>
> Fixes: a86fd3c20218 ("ASoC: dt-bindings: sound: Add DT binding for RZ/G3E sound")
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml

> @@ -320,6 +333,8 @@ examples:
>              <0x13c31000 0x1f000>,
>              <0x13c50000 0x10000>;
>        reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
> +      #sound-dai-cells = <1>;
> +      #clock-cells = <0>;
>        clocks = <&cpg 245>,
>                 <&cpg 385>, <&cpg 386>,
>                 <&cpg 387>, <&cpg 388>,

What happened to the first clock cells (CPG_MOD)?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
