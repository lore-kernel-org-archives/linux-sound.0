Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9AC23504B
	for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 10:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777372340; cv=none; b=kaO9U09rIdK84/MD1P3WtZ3s1XY09eJmagDbjctEZFAI8L/cghMvQ//0CnpmJo2/bg5fSejT94XdscAVJLT9hZGi4K/QLN1ll7NTDp3IkAmt+GGI8TpozAP8M6HI+fRZ8MumfLDmgEIawrMp3+AU8pV6GwNJUn27ztXeabK7/XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777372340; c=relaxed/simple;
	bh=UG+AWWYF8+8wcJMCUjbTFh4VwOPAlhF8FZLDzvsNMAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nzk+T6GK4jA0UlTtdJBQ6ZAZog4kwRY1dmXOb1qHRVjao4EVXw1AX2/+sCoyHhy0mXjlQenYPgybg8oAC6gXsliWD+jS2/wvP/mZyKwPzjIKBJ5U++Aa/9JxNOyM4kB2h88WQf6ejMKjjUcAsVaR+bTmgd+RPDPsG+RcOGfM9m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56eee0ba462so6819189e0c.1
        for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 03:32:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777372338; x=1777977138;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yX0h1Y9Mkq6p8qHdHFJchBdDb8mSjHkwiA1G/+/zjKk=;
        b=R32AMQJ/sRQus60g5pMCFpTz3oocxQ1keNle9O0+cxZSK7jAZjF+naDGfMOJvyBLi5
         jCnl7yA953sidgSYiodKd83fdDssBfoMSEFje1jPiQ1jrwnJEIB40ledXoWarAQXruhO
         F/eQ7hLJjQJ64rfmqzXvy2Chv71LPQNsnEVYFpYs4foeNFPugkS/io3NZBzNpzpWzkwI
         +CfsurEWj0afB7b//A3Qh1t8ksNdKihJ0a/l5BMMD++ClDxBVoqDVsLHGsSie2DMZ1Hc
         t7lyEIwWizncz4e0WWgw7ASBR21xIsh2mZvG2Yj6/EJ6DbAQOyGqzlNTtnAjsDkyfPF4
         Fa7g==
X-Forwarded-Encrypted: i=1; AFNElJ+8EA60Q88KcBlVbO2yrDH+81FDo6IQRCdw2ksCR6Wx58lswguTuozVWWSCfk0IOBDCfUg/R6EU6a5EEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIMokCJxwamdzhb9G7WrYMnsj2WE2U4bizYqPtjt5fLjxgedhg
	HCCRs48X1FyAGkUDUltvyq1hOamsm2v4yAb5W3WNz28hVNqrSp3Vikm5rcjN3eA1kQA=
X-Gm-Gg: AeBDiesA0mM+FNPulCVCEkqy8+c+I+0lMDxqr9mqeyXdXAOUNZVragZcDD2Kya8C4OW
	3+rSjiPTLkGj0yxxnlfkLGh4OCh4HCM6qE4roPQ0U9r7+lkFdNfVRAp1UwpSk826mbKV1Fpu7PD
	i6x45109q1SYXEv58nC87FedBHgzGJIVAlPdUPOJeaAXiRHZCw96J3341OE8k1I5gTZgm6Mgg7S
	Rb+jePu0CLrzp1UyJoQOXWekvvMTO6LrAQgzcVExAkN29z7n1bC1yVClvPgDrbw77msoGCfI7Nt
	v6e6K+t0xqbueL2E8B7g97ccrr4wIVHPSxhG22wgyOUemvBHa83A1D976vn2nBgvSpSSVT/zNbm
	BjSzQ48pmApu6BG18tSaH+lN3rqhWO0onvqMAGi3Su8a4FoD/JY7XT4vT/7hIaMKbaw2kH26788
	WpuA+JlOuJ5gSqovpl4yxC5weyb7hzip+wkqy5uwxj2qfB1E/w0eBRWxH+x0xR0o6fhRHZHas=
X-Received: by 2002:a05:6122:219e:b0:56f:3b3b:eea with SMTP id 71dfb90a1353d-573a59f0232mr678194e0c.2.1777372338228;
        Tue, 28 Apr 2026 03:32:18 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-573a4338401sm1404195e0c.4.2026.04.28.03.32.18
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 03:32:18 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-6058a955e04so7229500137.0
        for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 03:32:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8EA6FNDSAvLK/NZkM73/pdOrS4iySGYkyHvY7TqXC53BFwGbULdMxuQQPPMsY7+7JIuh89t2Zg3NjRQw==@vger.kernel.org
X-Received: by 2002:a05:6122:4b81:b0:56f:b831:909c with SMTP id
 71dfb90a1353d-573a54f6dd3mr738558e0c.1.1777371942065; Tue, 28 Apr 2026
 03:25:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com> <20260415124731.3684773-15-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260415124731.3684773-15-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Apr 2026 12:25:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWnZhUeY+498Ot4wCjRKM3YEpq9C1vcqbyKe=_Rt4O3Aw@mail.gmail.com>
X-Gm-Features: AVHnY4JGBNGTte30b8cNYuVFq1Ftrjan7Mckgl-ml10MKOiPXuleAlM2Dd1l_54
Message-ID: <CAMuHMdWnZhUeY+498Ot4wCjRKM3YEpq9C1vcqbyKe=_Rt4O3Aw@mail.gmail.com>
Subject: Re: [PATCH v5 14/14] ASoC: rsnd: Add system suspend/resume support
To: John Madieu <john.madieu@gmail.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-sound@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, John Madieu <john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Wed, 15 Apr 2026 at 14:47, John Madieu <john.madieu@gmail.com> wrote:
> Add per-module suspend/resume functions following the existing driver
> architecture where each module manages its own resources in its own
> file. core.c provides common clock/reset helpers and orchestrates the
> calls in the correct order (reverse probe for suspend, probe order
> for resume).
>
> Infrastructure clocks (ADG, audmacpp, SCU) are managed globally
> using optional APIs to remain transparent to platforms that don't
> specify these clocks/resets.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

This causes a crash on Gray Hawk Single (R-Car V4M), but not on
Salvator-XS (R-Car H3 ES2.0):

    Unable to handle kernel NULL pointer dereference at virtual
address 0000000000000008
    Mem abort info:
      ESR = 0x0000000096000004
      EC = 0x25: DABT (current EL), IL = 32 bits
      SET = 0, FnV = 0
      EA = 0, S1PTW = 0
      FSC = 0x04: level 0 translation fault
    Data abort info:
      ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
      CM = 0, WnR = 0, TnD = 0, TagAccess = 0
      GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
    user pgtable: 4k pages, 48-bit VAs, pgdp=00000004879ed000
    [0000000000000008] pgd=0000000000000000, p4d=0000000000000000
    Internal error: Oops: 0000000096000004 [#1]  SMP
    CPU: 0 UID: 0 PID: 675 Comm: s2idle Not tainted
7.1.0-rc1-arm64-renesas-03756-g4cf47bc1e3d7 #3579 PREEMPT
    Hardware name: Renesas Gray Hawk Single board based on r8a779h0 (DT)
    pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
    pc : rsnd_src_suspend+0x60/0x98
    lr : rsnd_suspend+0x44/0x6c
    sp : ffff800082e03ab0
    x29: ffff800082e03ab0 x28: ffff000444022ac0 x27: ffff8000817d9050
    x26: 0000000000000002 x25: ffff80008073dd64 x24: ffff800080ab0b20
    x23: 0000000000000000 x22: ffff0004408a84a0 x21: 0000000000000002
    x20: ffff0004402d6e80 x19: ffff0004402d6e80 x18: 0000000000000000
    x17: 003fffffffffffff x16: ffff800082d8bc18 x15: ffff0005bef86f00
    x14: ffff000444022b40 x13: 0000000000000112 x12: 071c71c71c71c71c
    x11: 00000000000000c0 x10: 00000000000009f0 x9 : ffff800082e03880
    x8 : ffff000444022ac0 x7 : ffff0005bef86f80 x6 : 0000000000000000
    x5 : 0000000000000084 x4 : ffff000444022ac0 x3 : 0000000000000000
    x2 : ffff000444022ac0 x1 : 0000000000000000 x0 : 0000000000000000
    Call trace:
     rsnd_src_suspend+0x60/0x98 (P)
     rsnd_suspend+0x44/0x6c
     device_suspend+0x134/0x3d8
     dpm_suspend+0x164/0x268
     dpm_suspend_start+0x4c/0x64
     suspend_devices_and_enter+0x1c8/0x544
     pm_suspend+0x194/0x1e0
     state_store+0x7c/0x100
     kobj_attr_store+0x14/0x24
     sysfs_kf_write+0x78/0x8c
     kernfs_fop_write_iter+0x128/0x1d0
     vfs_write+0x210/0x390
     ksys_write+0x6c/0x100
     __arm64_sys_write+0x18/0x20
     invoke_syscall+0x50/0x104
     el0_svc_common.constprop.0+0x3c/0xd4
     do_el0_svc+0x18/0x20
     el0_svc+0x24/0xd8
     el0t_64_sync_handler+0x98/0xdc
     el0t_64_sync+0x154/0x158
    Code: 6b13001f 54ffff0c f94013f5 f9402e80 (f9400413)
    ---[ end trace 0000000000000000 ]---

> --- a/sound/soc/renesas/rcar/src.c
> +++ b/sound/soc/renesas/rcar/src.c
> @@ -848,3 +848,29 @@ void rsnd_src_remove(struct rsnd_priv *priv)
>                 rsnd_mod_quit(rsnd_mod_get(src));
>         }
>  }
> +
> +void rsnd_src_suspend(struct rsnd_priv *priv)
> +{
> +       struct rsnd_src *src;
> +       int i;
> +
> +       for_each_rsnd_src(src, priv, i)
> +               rsnd_suspend_clk_reset(rsnd_mod_get(src)->clk,
> +                                      rsnd_mod_get(src)->rstc);
> +
> +       clk_disable_unprepare(rsnd_priv_to_src_ctrl(priv)->scu_x2);

Apparently rsnd_priv_to_src_ctrl(priv) is NULL.

> +       clk_disable_unprepare(rsnd_priv_to_src_ctrl(priv)->scu);
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
