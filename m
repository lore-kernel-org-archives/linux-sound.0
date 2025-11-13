Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346C9330D3D
	for <linux-sound@vger.kernel.org>; Thu, 13 Nov 2025 08:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763023877; cv=none; b=e2JbtOf+6U0lcYtmrTG58VZPYBm5yxvBOwsKb/t2A0u0HwnlZdAdbO8e8vqKFG8LRBnalOHDDmMCamsKh2h0KacBY3K0z4AXH+eha54I++wZJeKhR5VMB0hPt74egsXHnry5RDQLjtV+LShedlPNAR47jHDvbAitbt5smBSooSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763023877; c=relaxed/simple;
	bh=Y3cJxBYr0FtmmjeUHDLAuwvYPIolcl+a0e64J8Sa72s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ksUVxSmrVeNGK48JEhxXIYV1JkXc77dmycVYaTRRYDSyRCjLExifjs5kqcBJNgxVBYBdB4AqrzJG/axmQbJje/48Ra3nhzDRFZuTbEtroa+KyTSKdW58CfzyoBYyyoga6OOK/VpAKTtqfnACApr4xr+ibwmUXqtBXJ/WN6YHd0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-54aa789f9b5so333882e0c.1
        for <linux-sound@vger.kernel.org>; Thu, 13 Nov 2025 00:51:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763023874; x=1763628674;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jppCAljRnFmNoD8IBybx1rRIy6Hth1Yqeh1nYPEFHA=;
        b=mhYzCo3ufp+vDZHzqt3jwnvxoifp1p+IBARLWgVn2DxWtF9n9pDpEECT/wV7OXqMK6
         IM93EDyB+r13lI2jxpoKIXKkdKD9xmxuMBSadyrHLRXWvb7QEAt9XwiDUfT0lArZH9ry
         oEkk78fdpDFNCjWeLNJVyeh0V8pxy3X0R8bDmx2CAWPe6dbImtQ2CnJamno95IigYp8Y
         JwHfb9PAWVlOde/Yb85ZMGXUiu7KvWkkjJ6+Uj7zgAAMQvUwGBCr3b5X/GWMm7MsRYbV
         WGKfPo7kL0ywtPMSxbP2yIPsBu703ji0u4deslv0tv9Pt17WYTOCepSWJipgNXZtAxQk
         p6WQ==
X-Forwarded-Encrypted: i=1; AJvYcCUniHBQ7KYY7nlwVRNr1KXbtC0D0zRybveoBxFj49hE5DJVMj3fbZMfi9oxXfpNYgkJTR1Fh7Kz23NPvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzI1pl7cwIVAib3S/NQnaXuSmLHIlQ8otIPbbq23KX+f9p7vvc3
	jNmQ7WzUpxOY5Cjd8NnBM+i3XXlwuZt4kEYMWNFWluS13ifPg+Okqf2CR8mHEdUqmaw=
X-Gm-Gg: ASbGnctVWYB7x88JE9QVusyoLFdS2Pt6ZkjKzzzTF4YaAp8J/dU5AkoWJQwX0xbl0Js
	TNrSrXTksB+uXUgMsu5JbhIyu06oHrQncbSgQA7FpWOJv/xXqXJD1DIRqLGW2AIgVYsqH2tnKvA
	iuCksm1IOmKlJsVI9/Dl7IbH8l8Ks4GQJegpS4UYsAHIgoyndDGhc4Od6Bv5BeaHyTV7TJnvXEs
	1XIqQ9bDeXp1y1inpkd6VBSzIxJPgBRpFizItZ/dw63EuRpUmECF8JNb/Ats/cjIlRssXKffz57
	JoQyoxMDvOEgozZA2/54AhpE+7yOpLKVi8D/3OdYZFpvAtUwnYG+jrahLUc9pVgMEw7TWMibVMu
	P08TALr4qTicAuqsSX6iYogBd5eJUlK6Adq7bnlmrpmaLpcldhXGHO2IT9n+xd3oFPXMeX55sLR
	aUosjyI1Sy1bd1GjawxsZuXzR6fq+f7IrbmQWkCw==
X-Google-Smtp-Source: AGHT+IHX+Bshs18Vv1CdOIuINEOAM0xrpXcUnn+R/iESG/CjXnE2oOGOV6gWkneerRneE3Z10xuueQ==
X-Received: by 2002:a05:6122:1b09:b0:559:7394:9c3a with SMTP id 71dfb90a1353d-559e7ca8767mr2142917e0c.8.1763023874415;
        Thu, 13 Nov 2025 00:51:14 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b0f4426a5sm495326e0c.12.2025.11.13.00.51.13
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 00:51:13 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-93515cb8c2bso380847241.1
        for <linux-sound@vger.kernel.org>; Thu, 13 Nov 2025 00:51:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXXTIk10M/TVZMMBQCYpraFlumzhVGxlfEb44ur2SWz4k/w84zpIjP+IpgI4vqu7wcwibYQE5KO7Na8fw==@vger.kernel.org
X-Received: by 2002:a05:6102:2b92:b0:5df:b1f4:77d9 with SMTP id
 ada2fe7eead31-5dfb1f4937fmr1427327137.17.1763023873293; Thu, 13 Nov 2025
 00:51:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251113082551.99595-1-biju.das.jz@bp.renesas.com> <20251113082551.99595-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251113082551.99595-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Nov 2025 09:51:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUdiczsrB8H57VjPbcaWWS22HmUvc_iU3rs84qHAsfB6A@mail.gmail.com>
X-Gm-Features: AWmQ_blLiZfPk5wgCv0WpvOv1cvXZLyFXHVM_u5r95hEUYF3wWO-Xhplpf5nrtE
Message-ID: <CAMuHMdUdiczsrB8H57VjPbcaWWS22HmUvc_iU3rs84qHAsfB6A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: renesas: rz-ssi: Fix channel swap issue in
 full duplex mode
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, stable@kernel.org, 
	Tony Tang <tony.tang.ks@renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 13 Nov 2025 at 09:25, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The full duplex audio starts with half duplex mode and then switch to
> full duplex mode (another FIFO reset) when both playback/capture
> streams available leading to random audio left/right channel swap
> issue. Fix this channel swap issue by detecting the full duplex
> condition by populating struct dup variable in startup() callback
> and synchronize starting both the play and capture at the same time
> in rz_ssi_start().
>
> Cc: stable@kernel.org
> Fixes: 4f8cd05a4305 ("ASoC: sh: rz-ssi: Add full duplex support")
> Co-developed-by: Tony Tang <tony.tang.ks@renesas.com>
> Signed-off-by: Tony Tang <tony.tang.ks@renesas.com>
> Reviewed-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/sound/soc/renesas/rz-ssi.c
> +++ b/sound/soc/renesas/rz-ssi.c
> @@ -374,12 +379,18 @@ static int rz_ssi_start(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
>                               SSISR_RUIRQ), 0);
>
>         strm->running = 1;
> -       if (is_full_duplex)
> -               ssicr |= SSICR_TEN | SSICR_REN;
> -       else
> +       if (is_full_duplex) {
> +               if (ssi->dup.one_stream_triggered) {
> +                       ssicr |= SSICR_TEN | SSICR_REN;
> +                       rz_ssi_reg_writel(ssi, SSICR, ssicr);
> +                       ssi->dup.one_stream_triggered = false;
> +               } else {
> +                       ssi->dup.one_stream_triggered = true;
> +               }
> +       } else {
>                 ssicr |= is_play ? SSICR_TEN : SSICR_REN;
> -
> -       rz_ssi_reg_writel(ssi, SSICR, ssicr);
> +               rz_ssi_reg_writel(ssi, SSICR, ssicr);
> +       }

You can reduce indentation by restructuring the tests:

    if (!is_full_duplex) {
            ...
    } else if (ssi->dup.one_stream_triggered) {
            ...
    } else {
            ...
   }

>
>         return 0;
>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
