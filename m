Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE882236FD
	for <linux-sound@vger.kernel.org>; Mon, 26 Jan 2026 14:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769437934; cv=none; b=FNnh0MESR9aUopm9iJ23vO5C6uftI+KtSeq1IKfAyzIl/ZrfGvbpcLPpAMjMzyr/08d1MGO/0VXE3nHADYz+cj+tnhB1BUa/UvD04mI28P5c2G0EJRUrU56E0+RtHNdow3yac3IFkajL3fuhEpfIN0bFU7fKgZugpGrb/X+bRSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769437934; c=relaxed/simple;
	bh=PsOC2v/AYbvlfb4MfXbU5AGiA/whklG4mc3MblwxpCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tPZmD7j3VvigLObMYmMzUzlJGHBc70r8yAYccgW45rdh8UP3rcIV/a+rFbguKelppfBUW+Xseet2xYq+8lloEFAS4LRg1F4uM0pxJCkfyI3nl/tD+OiTn9bLen59fhiyNqEi1CVUlx7QahcSYoSS/U7W675DKAjWR36OQcDf+CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-559f4801609so2071434e0c.0
        for <linux-sound@vger.kernel.org>; Mon, 26 Jan 2026 06:32:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769437932; x=1770042732;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7iJqQHbebbJvqdS+f32gVVmPeXTBs2LPTWdyCk8n5XQ=;
        b=ny0mrFOyY35kutNj3Xlii912xjGNLyXWzmq2SS3f5pR+vxaLjKzK/HyQmMaAdDrLNW
         KkzLzuEsc+IXJQeZ/CBlRI81/ZdPz1LXBKTscZHiogJ6M0nUcuG583ba4eI3ftZYjDtJ
         s7gigMLib4S8TTCDWPHikBJ7em+8r8WmZHjr8kBLhBWc372TstTlT48NkdG9QdMy7JA8
         HcQot8An+bSBiNbNRlUxXOhrFHcHqbrzOi1jNxira+aEVoWxW4yntCHKIXMPIc4ffLff
         5jWVd3a76vf+iC9Y0mOGzttjQ6Qg2sFmWOskxqgq34Akeq+Gx/LRkG9tX8UEQGlY6/jx
         c3HA==
X-Forwarded-Encrypted: i=1; AJvYcCX8+blyWokiFSUKeR3HIM6v+Cfa3MosES1v2ktJqqIspsv1/1v956O2L8xoRkeZsXgFnBaiAKdceov2+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEtbFj2ZuqXLI7idh4CYk/oZKKQTggPxuzyRq7uJeMpr3wNAgA
	yzAwXQ1Z0NMY/p0e7ZGikuWKq1r0YBuVrZbkiahbU9zTo7Tf8DHald3XXAtz77hV
X-Gm-Gg: AZuq6aKSBMusSEmuXIUtg08zn8n7lm/sg4nlSz9gqDQbBa8rODHZ8orKvw5g+MZLy9O
	dS7g/3nBST736UZvhux75SgSalJezp2vX+BbbbUuY6ziwO92T+NtQSZ0dimyEZ3qYBn9ufP8oQa
	ibxo7JNCbdYEuW5sLVWr5dVyMttyFQXNEWw889ftzLJ4ubM/zf35qplPu7kChodXG1cnUN2CUiL
	BpaJSaWM8E/cWYLFG6YUvQyPpfndFutjj9g7+VxJlS28UiqejfEv6HPJ8OHWd5RuMfZnZcL2i3O
	eDnuA2k0WM0YY2ueInxp882mq9Fpj0Fiv0sCeCNZM/xJno4NQjrPiD34mASSsnUmP28ISbBoP1n
	nywyVYiFIlzUncznPjekI0VsmaTHtWm5M0cFGKwYE5kyOSVFbUby47XHvjh8RhMX7Fmht4eP1KA
	DFG7NKkh4U3oRNtJA1EgcvKTmej4Qt60ngzWb5R+1Gb+i6iBTvF1jS
X-Received: by 2002:a05:6122:1da1:b0:563:618f:b7e1 with SMTP id 71dfb90a1353d-5665c82f6dbmr1524981e0c.4.1769437931536;
        Mon, 26 Jan 2026 06:32:11 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5663fb584ebsm1753280e0c.11.2026.01.26.06.32.10
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 06:32:10 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56376c3e866so4407221e0c.3
        for <linux-sound@vger.kernel.org>; Mon, 26 Jan 2026 06:32:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVym+dj3RhI1PsgMuC+RkCl6GVYm6SkzIrU8EREpbXyZH6mKYf1GnpK+UHItsIgRhB4kuxN+YW9ERotLw==@vger.kernel.org
X-Received: by 2002:a05:6122:82a9:b0:566:395c:ed5d with SMTP id
 71dfb90a1353d-5665c9d2073mr1538350e0c.11.1769437587151; Mon, 26 Jan 2026
 06:26:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126103155.2644586-1-claudiu.beznea.uj@bp.renesas.com> <20260126103155.2644586-7-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20260126103155.2644586-7-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Jan 2026 15:26:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWhY7nNanQ=h8HGrWyDfpCSL33QFJorhLCgnKASbmHiYw@mail.gmail.com>
X-Gm-Features: AZwV_QjS0M2A0ks0k6a-mivuyl26TKVYOh4l03PhTFHHbbMOHWiHryV9qXisIqI
Message-ID: <CAMuHMdWhY7nNanQ=h8HGrWyDfpCSL33QFJorhLCgnKASbmHiYw@mail.gmail.com>
Subject: Re: [PATCH 6/7] ASoC: renesas: rz-ssi: Use generic PCM dmaengine APIs
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: vkoul@kernel.org, biju.das.jz@bp.renesas.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, lgirdwood@gmail.com, 
	broonie@kernel.org, perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de, 
	fabrizio.castro.jz@renesas.com, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Mon, 26 Jan 2026 at 11:32, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> On Renesas RZ/G2L and RZ/G3S SoCs (where this was tested), captured audio
> files occasionally contained random spikes when viewed with a profiling
> tool such as Audacity. These spikes were also audible as popping noises.
>
> Using cyclic DMA resolves this issue. The driver was reworked to use the
> existing support provided by the generic PCM dmaengine APIs. In addition
> to eliminating the random spikes, the following issues were addressed:
> - blank periods at the beginning of recorded files, which occurred
>   intermittently, are no longer present
> - no overruns or underruns were observed when continuously recording
>   short audio files (e.g. 5 seconds) in a loop
> - concurrency issues in the SSI driver when enqueuing DMA requests were
>   eliminated; previously, DMA requests could be prepared and submitted
>   both from the DMA completion callback and the interrupt handler, which
>   led to crashes after several hours of testing
> - the SSI driver logic is simplified
> - the number of generated interrupts is reduced by approximately 250%
>
> In the SSI platform driver probe function, the following changes were
> made:
> - the driver-specific DMA configuration was removed in favor of the
>   generic PCM dmaengine APIs. As a result, explicit cleanup goto labels
>   are no longer required and the driver remove callback was dropped,
>   since resource management is now handled via devres helpers
> - special handling was added for IP variants operating in half-duplex
>   mode, where the DMA channel name in the device tree is "rt"; this DMA
>   channel name is taken into account and passed to the generic PCM
>   dmaengine configuration data
>
> All code previously responsible for preparing and completing DMA
> transfers was removed, as this functionality is now handled entirely by
> the generic PCM dmaengine APIs.
>
> Since DMA channels must be paused and resumed during recovery paths
> (overruns and underruns), the DMA channel references are stored in
> rz_ssi_hw_params().
>
> The logic in rz_ssi_is_dma_enabled() was updated to reflect that the
> driver no longer manages DMA transfers directly.
>
> Finally, rz_ssi_stream_is_play() was removed, as it had only a single
> remaining user after this rework, and its logic was inlined at the call
> site.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/sound/soc/renesas/rz-ssi.c
> +++ b/sound/soc/renesas/rz-ssi.c

> @@ -1116,15 +936,19 @@ static struct snd_soc_dai_driver rz_ssi_soc_dai[] = {
>  static const struct snd_soc_component_driver rz_ssi_soc_component = {
>         .name                   = "rz-ssi",
>         .open                   = rz_ssi_pcm_open,
> -       .pointer                = rz_ssi_pcm_pointer,
> -       .pcm_construct          = rz_ssi_pcm_new,
>         .legacy_dai_naming      = 1,
>  };
>
> +static struct snd_dmaengine_pcm_config rz_ssi_dmaegine_pcm_conf = {
> +       .prepare_slave_config   = snd_dmaengine_pcm_prepare_slave_config,

This fails to link if CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM is not
enabled (e.g. renesas_defconfig):

    aarch64-linux-gnu-ld: sound/soc/renesas/rz-ssi.o: in function
`rz_ssi_probe':
    rz-ssi.c:(.text+0x538): undefined reference to
`devm_snd_dmaengine_pcm_register'
    aarch64-linux-gnu-ld: sound/soc/renesas/rz-ssi.o:(.data+0xc8):
undefined reference to `snd_dmaengine_pcm_prepare_slave_config'

Adding a select like this white-space damaged snippet:

    --- a/sound/soc/renesas/Kconfig
    +++ b/sound/soc/renesas/Kconfig
    @@ -56,6 +56,7 @@ config SND_SOC_MSIOF
     config SND_SOC_RZ
            tristate "RZ/G2L series SSIF-2 support"
            depends on ARCH_RZG2L || COMPILE_TEST
    +       select SND_SOC_GENERIC_DMAENGINE_PCM
            help
              This option enables RZ/G2L SSIF-2 sound support.

would fix the build.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
