Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756522BAF7
	for <linux-sound@vger.kernel.org>; Thu,  5 Feb 2026 13:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770298447; cv=none; b=Yuflni8SvL4Xz86Ekx2SEN2pe1fu+cuB5wyQtQWJYYmqRPLpfaIjObdOEfHRUXZLmvlLOAoAZk6NqtmWOiNJH+gQZJin4UITQGb5SjbQerj406+ZBmdMGGhai81cHgib/s+2V9TC9VDoM2dgWn2+5g5YsTTW1HfMqTD+RG8p95o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770298447; c=relaxed/simple;
	bh=MvdDi56nBcqeVhfFS06RPVpbBEwUFgl1c2WoubkP7c0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XBdeaJBQQWZMTQcVpXL6xOrDx5k2zcZmS4Px/lhXWL69utxbw87DZXGJdnmnbpRsWsgumDSmJiEP5AFbdYFh1ThO/P1A5rym9DO73nWvUgWDZWw+90ONl1yfUuO5N3t8GLze1yve4LZbaHzENs9zqikuFbYQNCPb6JTCMKj7wos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5635e6b80easo279511e0c.2
        for <linux-sound@vger.kernel.org>; Thu, 05 Feb 2026 05:34:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770298446; x=1770903246;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mlFVvwC8fg/1wsOmrxHFIGxiwllHqY5skW1aHs4QBXc=;
        b=UHCyBT7aEc20MGgePI8nh3uJnrIkCv+sXWPkfw+AJU4KjR2TQjVxhvdSd2gNh8q6h9
         XFHs+H9pD4HHhQYIH/PvyboLU6KyRhWTYDu+4OE4rvTallCWL9Q+fjaJP/qDoOaWPAnE
         Xy7h1jlUItak/hR3DpYi9xbIu2nigvtNXm/PbrTX8d7GVPVOw7YnsKugeXJ5Zv1FC1dh
         uj0DyBz+DgTJ9LGfhX5S4x/09Fpguw8OrHZcePIKPiSFUHrhfpuvgRrQAVgKu2FAoiTm
         z+SC5B643Q3WnBBdiAHIxEBsjpnhpufWkV00NddPQIvjfXoOb17n47GcOrik7OIs6nYR
         HMJg==
X-Forwarded-Encrypted: i=1; AJvYcCU5RaPBR21vjHoz85ow3pQnBfLz9PGAKX6biTwNobahN+vjbQ80pQrqKlcOC9xBLoSD9y79o+pld1sS+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/o4Zf1DxAfKWnI1/MHjqTjuAYL1Nxg/GKbMVcqpN+7iY2F7P2
	euTkAD65+PevyKxsiq0G/D4XZsut+R8XF2JO2MqCr95aX7C1x52R7BDFESgA/EYg
X-Gm-Gg: AZuq6aIYQWkiwpk3lIK4N2iz3Zj9ktQvQBkk44SeNl5ZFjmlpZXAIwT4s6DOYj8tBUy
	jd84/Tc4mw373kffRo+nk+7AMzwhS/NxhAJCqY9JJiFLW7GyvAIQaOlqYSOmVQg2cOEWjcGc8uM
	3XpI2oWQ7yCVfzj/tglrzSh18Mv/Tgjt4j8yoj1maU9bJucVxfdDCHJXtmd31kOmM8OqKXSfRCA
	02ppQlIN3sWV1g8md+TaWo9Lq+tkA82H5XWxNtlXEvpYFewvvkixY9WlXMm0io3mXV/maZXqiBZ
	bvAjh3JYZNbdrJlENkxcUE/h7WC4P/C/w/QvP6DA7m8/lem+MFnZ2I6UchLmYKY3s+TTkLCbxWU
	2l2W1bWD6xd5a1FImWF1kojGzhafaC/ibaO/Sd+uDA+jRTY830W6/CaVho1e3cSWmFygzZkpi0x
	Md/yojXsglSq7AfR5gDyD0QoAquEKpDX6AHiyQ8ftZUK3uM7C7rJ4A
X-Received: by 2002:a05:6122:2519:b0:563:6111:218c with SMTP id 71dfb90a1353d-566e811a076mr1877578e0c.17.1770298446333;
        Thu, 05 Feb 2026 05:34:06 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-566e81d712fsm2281618e0c.10.2026.02.05.05.34.04
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 05:34:05 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-566360cab07so308713e0c.3
        for <linux-sound@vger.kernel.org>; Thu, 05 Feb 2026 05:34:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVMJ7E0HOtMVqj4wik/BqdLopfxQFH5i4B1g2SGHmEJ8tfjiqmRxeJh5y2KBttXAXHOiG3Du1cojPQ2Uw==@vger.kernel.org
X-Received: by 2002:a05:6102:38c6:b0:5db:3111:9330 with SMTP id
 ada2fe7eead31-5f9395a4fbfmr1887930137.27.1770298443995; Thu, 05 Feb 2026
 05:34:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126103155.2644586-1-claudiu.beznea.uj@bp.renesas.com>
 <20260126103155.2644586-6-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB113461F734BA087B60605C6FC8693A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <16a6f14a-93e6-472c-8718-d46972f0ac5e@tuxon.dev> <TY3PR01MB113463BE8A4B1A40DBB0860538693A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <5438ccc8-ed5a-4dd6-8995-e8e9926883a5@tuxon.dev> <TY3PR01MB11346325F46C2BCA6B2B181D08693A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <ad752abc-275b-43ca-aec3-188c1a69c50b@tuxon.dev> <TY3PR01MB113460006A458AB2F8B96542C8693A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB11346C8AD27554E40EC5746E38693A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <7f0305f6-ae2d-4069-b53a-d2a81e75d164@tuxon.dev> <TY3PR01MB11346321A9AAE93C7070C6E578699A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346321A9AAE93C7070C6E578699A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Feb 2026 14:33:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWUpq1bUbNLu4WGheovQ1pYdEJGBMN3jdb6PZqXanN_GA@mail.gmail.com>
X-Gm-Features: AZwV_Qi97SNEv7WiclTdTjDZPIBKqJuIZIg8jIizASzQUOTxleO9LeGP-MsKx4c
Message-ID: <CAMuHMdWUpq1bUbNLu4WGheovQ1pYdEJGBMN3jdb6PZqXanN_GA@mail.gmail.com>
Subject: Re: [PATCH 5/7] dmaengine: sh: rz-dmac: Add suspend to RAM support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "Claudiu.Beznea" <claudiu.beznea@tuxon.dev>, "vkoul@kernel.org" <vkoul@kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>, 
	"perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>, 
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	"geert+renesas@glider.be" <geert+renesas@glider.be>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	"dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 5 Feb 2026 at 14:30, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> > On 1/26/26 17:28, Biju Das wrote:
> > >> For s2idle issue on RZ/G3L is DMA device is in asserted state, not
> > >> forwarding any IRQ to cpu for wakeup.
> > >>
> > >> For S2RAM issue on RZ/G3L is during suspend hardware turns DMAACLK
> > >> off/ Asserted state. Clock framwork is not turning On DMAACLK as it critical clk.
> > >>
> > >> Can you please check your TF-A for the second case? First case,
> > >> RZ/G3S may ok for reset assert state, it can forward IRQs to CPU.
> > >
> > > Just to summarize, currently there are 2 differences identified between RZ/G3S and RZ/G3L:
> > >
> > > SoC differences for s2idle:
> > >
> > > RZ/G3S: Can wake the system if the DMA device is in the assert state
> > >
> > > RZ/G3L: Cannot wake the system if the DMA device is in the assert state.
> > >
> > >
> > > TF-A differences for s2ram:
> > >
> > > RZ/G3S: TF_A turns on DMA_ACLK during boot/resume.
> > >
> > > RZ/G3L: TF_A does not handle DMA_ACLK during boot/resume.
> >
> > I'm seeing at [1] you are addressing these differences in the clock/reset drivers. With that, are you
> > still considering this patch is breaking your system?
>
> Still, thinking whether to add critical reset or go with SoC quirk in DMA driver.
> Some SoCs need DMA should be deasserted like critical clock
> that can be handled either
>
> 1) Add a simple SoC quirk in DMA driver
>
> Or
>
> 2) Implement critical reset in SoC specific clock driver and check for all resets.
>
> Is simple SoC quirk in DMA driver, something can be done for RZ/G2L family SoCs?

What if the DMA driver is not enabled?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
