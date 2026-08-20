Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0315540F733
	for <linux-sound@vger.kernel.org>; Thu, 20 Aug 2026 10:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220843; cv=none; b=r52a+kAfUBSpPQNWyQyhJI2w0O2CIHKAbyBp7VEnx3sirzkMM5vT8H+ba9nSSPkzNv2J/KtNi282x8sqmwXKy7JsGu3h/cUFz9iOeMAWqv9MzgGjYUF870Go6mD+66SaNkyKskIVvzJAK2CTmbZumX1L6+3GIfJCfSqmMLzwuZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220843; c=relaxed/simple;
	bh=J8SsCEbocsyTwxq3MZbYRuvps2cw72VJe49uJ1IGeUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZzHzVApIDy2nWQg2Z2hT9PBHEg3lwRPGSUz5DCeTmAEPzHetNSK+W6t1ZPCbPESzWA+LJCrQnKNFkIbZ8eVkaigX95rEMJ6pPa6xEJqxTau17+avE80cydcQLB+m1LOFKpCeTUWmJuBhgsEAZ131AuOIV8IZQDSdRvOIHazNA1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-73b909fbb6bso1306623137.2
        for <linux-sound@vger.kernel.org>; Thu, 20 Aug 2026 03:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220825; x=1787825625;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+W1h9goTHh77Au8749p4RyYvKYe3xrOhWg/p6R4W4WY=;
        b=nsut8FdyEDygjqKhf0Twmrn0fBVrnlu9fv1+MJGwj4PEBFER/GfFFFxSntHcnLFzPq
         ndbZY4ApO7XkHH3SVtYOa5IQyrFd5HQJgtwe+QLXKun3lVJba8NMwefEjBpJ78grd09R
         G6QbF9MBjMCxD1C5BYBBXr8/bLRnkh5ftpB2YZLSMq4sBAvU6hsyWigygTgauuahd8Dj
         nzzvTjXEZJx/FEkQ1v5J8bhTmNL61wboK9K4lB+dVCtbCkqrXiG8pDSLmIzy4D69pCJk
         Gnvd7KpcAXVFh+1r6SxRdnsH7psVAZ8+34/MyTKRthqp8H2OxXUtbaMhEJF6VDryLIoN
         UKdw==
X-Forwarded-Encrypted: i=1; AHgh+Rog4ULnCiC/OlnGT0aRiDMJ+Wwtfcy4+bjt2bsClpv3qAcX4M4HOFz7Yr8VJD4Xl1dtDVIMCio89A7WgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOVhXR58E4eFVu8nR6Awxb6SHwaeBTS6E0UJndoRfj1HAgSnKU
	DC1H8H9ywQb/4JaerLjzgHZ9Y/40SntLu3Er6edi//vTMtPd2RGiiQ1QeY6083eq
X-Gm-Gg: AR+sD101HF4Slpa6JFizulI7Rqr26u3V+BUcyc4pPkszRmQQSU2jfV81nMXfGnoO9CP
	DYtuh922SEaI52AvdUM1CkIrpVM/XEGSoRr1nxHv2NUhdned1zq2WfKJ+qfWR2q3Udh/qtXoGfR
	lhcvGd2YoRfIRQvbVlEBNa59u92EnjayAtug0vqHcebY10LKZJsoXZ3pXYRIc4mtKFCnKN73Mbs
	FhG/6D2pK4am+A33pwnAzG8oRJ6OXWWBb5/uuKeYxBr4TiImUB0VMDrmAi5hX82qAtwOaHZhfCb
	rsD0L9kq04JejEr+kuOCfIUwcTdoc4wJIfpLner/Sspqgl6yDr46TaXDgi18vi07dc3M6kEygeW
	ANBbNY21sbSlSnTO30O6Gkb7faQcS8yNhwqLQBLKsRVSl4wl3sPhLglCZ/8TOSwITn+XMy8ahsJ
	EQZNAnb6XDXGspMBiPO0+P20+PZM2jwSEdgH448qvI2iynuDX31B+cfWWPif/VaulivFAXKUqGv
	c5N5ioxgprfffxU8UvRNpOuEkmtMQ==
X-Received: by 2002:a05:6102:5cc5:b0:779:fafc:99e9 with SMTP id ada2fe7eead31-779fafcd43amr120925137.0.1787220825487;
        Thu, 20 Aug 2026 03:13:45 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97c4e90738dsm5161245241.9.2026.08.20.03.13.44
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 03:13:44 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5c5f23666d0so425747e0c.3
        for <linux-sound@vger.kernel.org>; Thu, 20 Aug 2026 03:13:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqj6FPoU5oK5SU25oBPOFYnRs9GCs6p5DznDjD9sIIYC7uYvLt9qgTgRm2gvaZhM6kJU7zqirzF3IPsyQ==@vger.kernel.org
X-Received: by 2002:a05:6102:370f:b0:738:fd01:5b63 with SMTP id
 ada2fe7eead31-777f8f80ec7mr4599483137.4.1787220823887; Thu, 20 Aug 2026
 03:13:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820095742.3094558-1-tommaso.merciai.xr@bp.renesas.com> <20260820095742.3094558-2-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20260820095742.3094558-2-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Aug 2026 12:13:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXUu8M4Xjb27XLcMWGYFk6NdKwKB6WO2ZQ_FCAvMTJshQ@mail.gmail.com>
X-Gm-Features: AcwNN1VNatSgn9Gu7wVYSsx8Z9RP9z3QZYhaLomWZy8kncfpOIt52cycw16PoQc
Message-ID: <CAMuHMdXUu8M4Xjb27XLcMWGYFk6NdKwKB6WO2ZQ_FCAvMTJshQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: sound: renesas,r9a09g047-sound: Drop
 #clock-cells from required
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	John Madieu <john.madieu.xa@bp.renesas.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Thu, 20 Aug 2026 at 11:58, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> `#clock-cells` declares the node as a clock provider for AUDIO_CLKOUT,
> which only makes sense on boards that route that pin.
>
> Drop it from the required list so that boards which do not wire
> AUDIO_CLKOUT can leave it out.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> @@ -298,7 +298,6 @@ required:
>    - reg
>    - reg-names
>    - "#sound-dai-cells"
> -  - "#clock-cells"
>    - clocks
>    - clock-names
>    - resets

I disagree: this is a property of the sound block, not of board wiring.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
