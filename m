Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4501C33859C
	for <linux-sound@vger.kernel.org>; Fri, 17 Apr 2026 07:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776410779; cv=none; b=klfVTp/NFdi1Vw4ppJxopn4OOEfurcsFTvv5YNHfNfbyzQrnS+PYDiJTmoMErOuJYAN1CQoOMNTwAKUGFdms0TTvpVYBGaaz2QCBCICnMJEJj9Do8ToUQV9T51raGH+6kjV4sNvCT5W5bOOqjKEzAf+W+j35D53AJ5VlFKvIbOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776410779; c=relaxed/simple;
	bh=a3NnvCevtSewQG0Oj/xyg6Ev7RwvAs1YGUH7obmLO9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wv1FvNgCsCrQDD23GpRQGNUaFhnjFkTYQzTl0+PyMmRgkDrNlDDmDmxlSCcgj9BMyHx2SfiF/+jGQXw9gLL8eL1Ym8tJufTx81pTJ+CrGhDHgMJvlMoi1bwlEzo5TbvLYK9SHJo96ksXsYs7FJpliOJL7pqYlNbaVlNuGXjSk28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-94e2ad66abcso80136241.1
        for <linux-sound@vger.kernel.org>; Fri, 17 Apr 2026 00:26:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776410777; x=1777015577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0filTeR7XuW1VhPPsFA0jH5OYwoCxnw8iV1YuSDtZA=;
        b=on1hdvKfUN40NkwKyNhvFSCDWkbiAQu1eu5WmwsF2RVfhSnGxeDbeafxHHrKgqG5Vi
         tYIw6Kx9CvHordknfLPcwf1pGx50t6j8RK/eEAhe69U3FW7vBTQT6PMhyJgZdbOqwFhY
         DG5tj86Bv4I9Cqx5UT7go0jersz6eSv5PHGOR+BMY1Yaap9gIiEkeaAjJSt/w819XXYx
         mb1RPNfTLsVprAPeYoCKIppoZJmkKklVLt+KHQSDgfLhXViKWGhMjlIKikOVprgFn8c6
         YUcEsvMTHYSxRrAc2Wt49k2g4sAzJVOQOCTFrcNWC/42GkyZ84duqLqu6l3a8mPe+w63
         Jrjw==
X-Forwarded-Encrypted: i=1; AFNElJ+myWzeHG1QhfUkueD1mwGGEQJvjTVWdUqjuYuob8IunaXntLU2iTZczKx+ZaO9k5E7Vvmrz5D4zjhddQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv57X0rWZc110sf6T1csj0hEgeVWUw9XWK8dAUle75cTbkTp+j
	JlBApyLYhaz9ouXNSOq2+/EMHs4G7hEfz+Z0L62AQtFJAbB4xLauPCfsgY5reL8M
X-Gm-Gg: AeBDietqKM1gIlmkqlXocrA89BeTRvu8N5CiKAqR15OG0B/VQhEt3ekTfmpO2WqXgpE
	tABHgu89uH9SALx9MaDolUU06vkky/NhoRGlLkNldSszLt2YwiKf6qksNs+4wr2+0NJ6y6qIM+6
	NtusX9LAmmNsn6aMxRHtlnmCMnYEYs2ret7bNjCQUKdXZvxhps+3yYGgpsBJsgf1HRy2W4l/V+e
	klrRKnaQawZtvsg372gWo7+iV0RGKViYPZpb21dKx7TSZHqbw831fUYIPWOmNMo4lwfZEtOZ3s5
	pj8Yqqmk/G4P/YodA9Su5b8jjy4bUjcDj075zLnjLH0weVb7HvadhH7mqkg2seoB6UYe2ePp9vP
	LkwBb30pHYTCf+jRVRxahMWwOoI6Yg85yg6Vf2FAqTwsyPNnJmb9kxl7aFNAOHOgWm9CUI+R+mt
	Fj2UFh2u4tXGUtbhEGdJiNZXKq5Lbg2SdiOxYVFflxjZygFnLZhDUgRLKTG6Tpwl25G1vIaNvul
	zs=
X-Received: by 2002:a05:6102:441f:b0:611:82b:a594 with SMTP id ada2fe7eead31-616f4f742a9mr573050137.4.1776410777199;
        Fri, 17 Apr 2026 00:26:17 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95890937db2sm362296241.2.2026.04.17.00.26.15
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 00:26:15 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56f3e6bbecdso120216e0c.2
        for <linux-sound@vger.kernel.org>; Fri, 17 Apr 2026 00:26:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9eLWRRzw3R1P9YnQlfnssArtEEYBhIF3fU5mqo9kGIdnmADEhCudASZ09Mo+aYjqgXyg4Tuo5k4zMEhw==@vger.kernel.org
X-Received: by 2002:a05:6122:4881:b0:56a:e46f:2cfa with SMTP id
 71dfb90a1353d-56fa59f3567mr602125e0c.12.1776410775292; Fri, 17 Apr 2026
 00:26:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-7-phucduc.bui@gmail.com>
 <20260414-funky-sincere-polecat-20b0bf@quoll> <CAABR9nEKGSRNp=eK=ZHf6-MNsj=6cDCy1YdbzSPrHyuc3Ux0Ow@mail.gmail.com>
 <CAMuHMdVPbcz4rF8ojEcvxp1NaM2mbQ2o+HZLwnnjNnX8uHf4HA@mail.gmail.com> <CAABR9nF131G3K3-vUdaDwHuQ7MCCLd-VO5syLApE_qsn+J49kA@mail.gmail.com>
In-Reply-To: <CAABR9nF131G3K3-vUdaDwHuQ7MCCLd-VO5syLApE_qsn+J49kA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Apr 2026 09:26:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXie1HR6XzkHXAtonh2oemNxH2UZE3uSUjW3xoOmhRjYQ@mail.gmail.com>
X-Gm-Features: AQROBzD4ej1pJTTRzELIJ2wgirossSrvDsKxLrNzMC07pv8sxHPrEXyoOqf8Biw
Message-ID: <CAMuHMdXie1HR6XzkHXAtonh2oemNxH2UZE3uSUjW3xoOmhRjYQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] ASoC: dt-bindings: renesas,fsi: add support for
 multiple clocks
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, kuninori.morimoto.gx@renesas.com, broonie@kernel.org, 
	lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	geert+renesas@glider.be, magnus.damm@gmail.com, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Phuc,

On Fri, 17 Apr 2026 at 05:35, Bui Duc Phuc <phucduc.bui@gmail.com> wrote:
> > Where does this match the driver?
> > Usually the functional clock is called "fck".
>
> Regarding the clock name "own", I used it because of the following
> implementation in the current driver:
>
>    clock->own = devm_clk_get(dev, NULL);
>    if (IS_ERR(clock->own))
>       return -EINVAL;
>
> The driver currently fetches the first clock in the list (index 0) and
> stores it in a variable named own.
> That is why I named it "own" in the DT bindings to match.

Thanks, I hadn't looked at variables names (I searched for "own"
including double quotes).

> However, I have noticed that other DTS files commonly use "fck" for
> the functional clock.
> Are you suggesting that I should also rename the variable from "own"
> to "fck" in the driver code ??

I think there is no need to rename the variable.

> For example:
>
>     clocks = <&mstp2_clks R8A7740_CLK_SCIFA1>;
>     clock-names = "fck";
>
> But from the hardware manual, MSTP refers to a "Module Stop Clock",
> not a "functional clock".
> So I'm not sure if using "fck" here is appropriate. Could you explain
> the reasoning behind calling this clock "fck"?

It is the main clock that needs to be enabled to make the device
function. This is independent from the notion of it being a
"Module Stop Clock" or not, and became sort of a convention.

> Regarding the FSI clocks, they can be categorized into two types:
> audio clocks and module clocks (which may include bus/bridge clocks).
> The driver itself does not explicitly handle the enabling/disabling of
> the module clock; it only manages the audio clocks.
> From my code tracing:
>     At boot: The kernel automatically attaches the PM domain and
> prepares the clocks during device initialization.
>     During playback (aplay): The FSI driver doesn't enable the module
> clock directly. Instead, it is handled via:
>     genpd_runtime_resume -> pm_clk_resume -> clk_core_enable ->
> cpg_mstp_clock_endisable.

Correct. On most (all?) Renesas SoCs, devices are part of a clock
domain, and their functional clocks are managed by Runtime PM.

> Since this module clock is essential for register access, it must
> always be the first entry in the clocks property (index 0) so
> devm_clk_get(dev, NULL)
> can fetch it correctly, right?

It is not strictly needed to be the first clock, and mostly a relic of the past,
when clocks weren't accessed by name, but by index.
Also, many devices have only a single clock, so don't need a name.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
