Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9EB4248DC
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 07:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785827717; cv=none; b=aqYBnU1SpvfJApFc/nkr/H30cvSAmEfIj66VUGzmaegxtr2UyenGsHdVWt/H4cYUlO3Oz2tMgSWC4I89F4e5/Z9qk5mg/pxOLOWEblr3Fc2xHTTYXNSDOCFfyjvWgbcpSzasod3Pay/SDqHa+4+obasDBEFfimvNWv5dqUH8U8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785827717; c=relaxed/simple;
	bh=En5JIyCBi5re4kDTDhikKbFTpnbZcU7Y7O/dS4net+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bWMuKhw7qAbUNT0RS1C8Q5l9WKFH2rD2e/q5BrVUb2jrb13PkhXVCu61phEsmabIeNiYEmKCvzonBfGvmzmRW+Yfb6EmVRsYtiAYUeGO/AYpC4OJAMpQwK2wKMLjkmDToUQ8jqJ6wx5X0yY9ynIHXPIIKwfVVsq8+MQjuKEerZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5c27e38ee18so2442734e0c.1
        for <linux-sound@vger.kernel.org>; Tue, 04 Aug 2026 00:15:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785827714; x=1786432514;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BAW6xuCFOcp/POVOPiZ6lw4M3RrPPkp7LBnSgPXQNZE=;
        b=MLRXHyPGhuyYb8cRI64XaenPh2CV0ERvTlycwkyzdQSgQoJJtbo3vUzrNdk41dsmYR
         2SvX0YUfM0nkfOA44kn6VHYrgiTe1IzSzbzJW2fZq48PBKg/h9JaUv62fQhw7UDD4W0U
         fbHfXL3MsS06b0g86oRiIssW42BpFl8IW/wrQAmDiwT/s4HAe7eTrXkDXTRveIP+ydD3
         FbbO7Iu3Dpam9wkI8YlJKhjnMrDhiRJ6JavZueH35s9z/84sw1SjVegZFI0UZJNEkMz9
         HmUHs485setg5ByaddJXeJKaGri3U5z08ss+CLqT3/kKAXSSd0JW+M5XnS0IwCg8dae1
         23Xw==
X-Forwarded-Encrypted: i=1; AHgh+RrJTF6eigmwOLKAJOc2Q6mhetW7nlw9G5fyIuIbi78g1xowWE2Nvw19/6lxJUrsDKFaOgbLtDBbb+lGjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YypEsUhoGyJnZ37BV+qWOJ8fMcd+vMSIWUKhujIhmVpnCX9ssqW
	bZMAXkaGV5X9M8P6WbU4C52FZPhdmPimom3+9lAaGYVM07R8DZoTnVypaJXLe1X7
X-Gm-Gg: AR+sD10IMWnDGVG8epVwReHBhnj0kmvkNIggedvYv/wW3IHVHsGM0hIhAoAKFue+tta
	D5L9+mE/Vf/ReGTmzHRGEddX+MTY7ZstkgLt4V3FnA9HwIlPLs8fn0weyE7K81FDC5QMKZBAWaV
	++mEjZGjb94EIs4QDY+7qPtkN7v5F66IAi1WZ0ZWA5/1MNvcjXuAVL2RY5eMzC5WYLKFb0dIJof
	I3m8SAwBT1DlYaozPiCmWmkwfc3al6QbGwJWDO9VCYTm4Ij1Q7BxcDVT00ce6fASybhvEg4isAQ
	pTpEh4JH7T7fStCo7IXZnZa2EMMyfoF/Psjxc4WyJWmu3swfjE6ympIRfNWbcffuO+faz8iC+LK
	BnAqtUnNDNImfQf32JfVjDydD4h9MUxkKLvxIDEGkTG75mFEW973XWOyfrdKYHNzb/YgbjjWpdU
	zE05oMrmY+JOluCESdtoLXV7wQ5qrlIKSP2PINfRK0oPSsVp12j9wG0VFDYIVuVAdLFsCH7hLTK
	4xUJ76UqqE0Wcb3vHDCrGgEUc5ShA==
X-Received: by 2002:a05:6122:45a7:b0:5c1:47db:cfcb with SMTP id 71dfb90a1353d-5c38772e182mr4630980e0c.4.1785827714470;
        Tue, 04 Aug 2026 00:15:14 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c3d01eab3asm37849e0c.0.2026.08.04.00.15.13
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 00:15:14 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5bfc5b77c02so3096788e0c.0
        for <linux-sound@vger.kernel.org>; Tue, 04 Aug 2026 00:15:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpjpRHY4SApMVxvIvuBynb8K1LDRLuE0/pXEWXRekdWU/r9pdV9H2TsDNhUi6QzHiaBigzhQOXTNioSDw==@vger.kernel.org
X-Received: by 2002:a05:6122:6d06:b0:5bf:bb2c:1328 with SMTP id
 71dfb90a1353d-5c3b3802351mr1936417e0c.3.1785827713776; Tue, 04 Aug 2026
 00:15:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87zez4rmrq.wl-kuninori.morimoto.gx@renesas.com>
 <87wlu8rmr3.wl-kuninori.morimoto.gx@renesas.com> <c474b067-e549-4d51-be21-4337cb8de184@sirena.org.uk>
 <87jyq6vgyd.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87jyq6vgyd.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Aug 2026 09:15:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWxRASq-jwryP4prDMAQuYEBSYpPNY2iw8GbQUKh-P2ww@mail.gmail.com>
X-Gm-Features: AUfX_mxRHC-uqjF24qFeTEXuEmQ45bSshehVmnozBsmWiJbWPNhp1JZXn_G-nJ8
Message-ID: <CAMuHMdWxRASq-jwryP4prDMAQuYEBSYpPNY2iw8GbQUKh-P2ww@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] ASoC: renesas: enable COMPILE_TEST for PCM SH7760
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

On Tue, 4 Aug 2026 at 02:59, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > > PCM SH7760 is not compiled with COMPILE_TEST, and there is no defconfig
> > > which selects it. So it is easy to be overlooked for compile test and/or
> > > ASoC updating.

Thanks for your patch!

> >
> > > -   depends on CPU_SUBTYPE_SH7760 && SH_DMABRG
> > > +   depends on SUPERH || ARCH_SHMOBILE

You can drop the ARCH_SHMOBILE part, as it is a subset of SUPERH
(if ARCH_SHMOBILE is enabled, SUPERH is enabled, too).

> > > +   depends on (CPU_SUBTYPE_SH7760 && SH_DMABRG) || COMPILE_TEST

You can drop the CPU_SUBTYPE_SH7760 part, as SH_DMABRG depends on
CPU_SUBTYPE_SH7760.

> > SH_DMABRG looks like an actual dependency, there's custom IRQ request
> > and free functions which don't have stubs.
>
> Ah...
> SH_DMABRG itself is depends on CPU_SUBTYPE_SH7760.
> So I think it should be "select" instead of "depends",
> like below.
>
>         depends on SUPERH || ARCH_SHMOBILE
>         depends on CPU_SUBTYPE_SH7760 || COMPILE_TEST
>         select SH_DMABRG

1. "depends on SH_DMABRG" should be fine, as SH_DMABRG is a
    user-visible symbol,
2. SH_DMABRG depends on CPU_SUBTYPE_SH7760, so you cannot just select
    it without enabling compile-testing for SH_DMABRG first.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
