Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5475E3D8915
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 08:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784105385; cv=none; b=AsxE2fuuvJtlH7ZH8I83qQyCBkFExIrK/D/Yxg7RIwnESZ6O7wKgduvyoP9bU6tj3ysl2R5GR4EuNy+fc8knyFiEaGq40frVqBigPlDHqOxOZnhJoyrVR66hxohFGe2wJMQNEdEiO/kvRiU4jiPq1KZhobaLZfY7A7n5V9jvdXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784105385; c=relaxed/simple;
	bh=sPupfMIvRyc1zwc1GOdAnPJmK/zIKkGIh1ujRUFw7q0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r6yVOyS/lbOzwYl210yUHq65NYzd0VuA7kXQIohblGgynzLj/ISXRy67ztenFskTQ+ecEE6/uGgmyoy/JYeQL1F70/cr2Pz7OLcArgpEH57Q6Q2S/1gwsXcenKAvWNvrq2vID3pB2D0oLthwdkrh+0193pxjgnbWchvIt8XYZDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5bf95ade656so687495e0c.1
        for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 01:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105376; x=1784710176;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1TRR41G4fbrKFn7izDIjOVXGMByR097P/ma6UvjSrTg=;
        b=rI4V+fPMwSLjjhsbDJ1vY/bVIO5EQOWeljOAp+dgexLTNYPOkSN9Jay10WnRlppND1
         WztJ3M4PLvur+qUZlvfYJ49YiTVP0zCM6ux3WH8zSLHMoHmhBo1/ZLbC7KHimKogXkdX
         02egcYk7VzLdlnSIE1kemgv6fWw6mhSnfBD8Wbspm5W0Fi3c60rmp9cqVtNjjEqTpnv2
         RGZAxc9nh6ujlqMtcHdjErwfdpJ4UWTXr2f5pC6ASX1+5NP9/bY8Nu29v7kmYqJo2vTA
         QVA+cRH2sUGctAmtk98o4mpl7vu80DXZiAE42tx1ryZQSDSo07NZ17rSHx0v3MeWcQ9m
         samA==
X-Forwarded-Encrypted: i=1; AHgh+RpQ+6RUbNM+mcwmHcniXNnzqzzuj4BwYc/++jAXpca120wzrm20rQT5tcuS00tiXTpNiLimEHee/Jfx0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqVdVdPmK9oYcd3SZUS/EzQe9yg0d2ujCqeVegaN2yYFoY8bNG
	Y+B+sg5cKiaGT1iGzm1v+7YyVutMHzPvmg0ivvhqWhSxr/iTbpwNuAXTGfr7bVqLYMg=
X-Gm-Gg: AfdE7ckIcQHV4ko9bvvP0grhTsyZDdyhaGboTztDSBdYRmD+OcWr9iI0lnKYrlzfq80
	ENHat+37RsigJ6yciZCt62tuXUzTeAmDqLsbqw4nx+eL7dlE/6tDxMQFCeleCJtGaORVyNk0Z+Z
	wkuXBSu30wJffuJax5H+Yk1/pGIUDmu2JsQBCwnGT9ygU7RTsGlFnSnzxleRH/ZW7C3vB9G+ubJ
	up7Do6bAI3vOEUprt+j4it385VO7GzYDtV0oyxxktFI2+T0AyIr5dafIDDBfmlaGcoEDCBQR3xA
	BYbSPxkZQPWwdCXlEgPS2p336f6tuja5srbmWkoOC1zO0Xcc+w8gSMNGGvAx3zS8GOqSAK918LD
	qbtaTK0mty3gHjNvVJpo5aJ1/2yIhbnu8nqrBGL4w1sxaY/CATzPc+WfItnnMlijCu3A+nKnq7G
	PT0uEaLwyTPXq6mRgQKIABd76qB9dvKIQQXuQiXDjEkiXEKoELoQ==
X-Received: by 2002:a05:6122:459d:b0:56d:b639:5c0d with SMTP id 71dfb90a1353d-5bfbf41eb67mr8928850e0c.13.1784105376312;
        Wed, 15 Jul 2026 01:49:36 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bfc655c77fsm6613866e0c.15.2026.07.15.01.49.34
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 01:49:34 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7387ac7d28cso535314137.1
        for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 01:49:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqzFRLjx4zcV8yTINT7jxQ6HGBvWPPm/WtxbSIwRXmWRlzCvTgJsRKW8utFGGZuIyOe2eOMfgXETJyoLw==@vger.kernel.org
X-Received: by 2002:a05:6102:5810:b0:744:dc62:55ae with SMTP id
 ada2fe7eead31-74533d60832mr8373853137.16.1784105374266; Wed, 15 Jul 2026
 01:49:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87zezt0zlw.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87zezt0zlw.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jul 2026 10:49:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXfwYbMhzU4Q4L3Gz1vaatJs8gdgPytVGRUCzWAHTVK1w@mail.gmail.com>
X-Gm-Features: AUfX_mx1W4-bigTkTe8QGRV7_w2yUpf2F_MMUV3Tv1JEabEnQSmtIJ8bjCQbjW4
Message-ID: <CAMuHMdXfwYbMhzU4Q4L3Gz1vaatJs8gdgPytVGRUCzWAHTVK1w@mail.gmail.com>
Subject: Re: [PATCH] ASoC: generic: Card name parsing should be called after xxx_for_each_link()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

On Wed, 15 Jul 2026 at 04:13, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> "tidyup simple_util_parse_xxx() in xxx_parse_of()" commit changed the
> function call order. But simple_util_parse_card_name() should be called
> after dai_link settings, because it might use dai_link->name as card->name.
>
> Fixes: fa6222d5e121 ("ASoC: audio-graph-card2: tidyup simple_util_parse_xxx() in audio_graph2_parse_of()")
> Fixes: b8081307f5c9 ("ASoC: audio-graph-card: tidyup simple_util_parse_xxx() in audio_graph_parse_of()")
> Fixes: 27ecf4da5ad3 ("ASoC: simple-card: tidyup simple_util_parse_xxx() in simple_parse_of()")
> Reported-by: Mark Brown <broonie@kernel.org>
> Link: https://lore.kernel.org/r/b81ebfa2-6a35-4ff0-9d04-b867233eda4d@sirena.org.uk
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Link: https://lore.kernel.org/r/20260714103428.2318895-1-geert+renesas@glider.be

s/Link/Closes/

> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks, this revives (at least in dmesg) the sound cards on Koelsch
and RZ/Five (simple-audio-card).  Sound cards are still instantiated on
Salvator-XS (audio-graph-card) and Gray Hawk Single (audio-graph-card2).

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
