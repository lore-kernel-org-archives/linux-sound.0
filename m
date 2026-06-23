Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708A43D0905
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 10:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782212021; cv=pass; b=U70P9HavmHpPH4Lj+LsWLbR6DoS9jWSf+jiS2qHr4j0uh2TbofN20at5E2z/1eAMiCP2cnXqQXCey20m/Qeh7QgrU7U0QW8LXy86QpH5THG8KFUyXtIiwLt1Q8NcxvykDTnS/21pLNCmgFbSvNNV+JrX+dyhu4uT7zhQ/ztMBFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782212021; c=relaxed/simple;
	bh=/btRBz4iJF96KbhaBsDhjmj4pM02xLdJ1Mk/5GVjzkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rRFiJydmlmL0opAufL/4ncBSKeR0uTfPr4uGTC55btuQOpThhDvls/WDU98WHH0WFqNrt4/2d1R/04avGTacuG/peSLpaqrka8aFdsHh5g5PndwXbJkbBRM0QZJJ1g+4y4fr6xaWhVx/lm8dZGYUsiGqej9Q5icvNYGGNM3Tolw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HiBcRDhQ; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HiBcRDhQ"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36b8d414666so3034515a91.3
        for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 03:53:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782212020; cv=none;
        d=google.com; s=arc-20240605;
        b=iAuUiMfxxp9CSJ6iJ26NYEU4k0QIxUusynH3yp6kYBtzQba6C5Aw0sNYRqMO43Kqye
         Y1Fu0s/okDoif4SEsrIuqv2z7JonZvFeHb9eHObKFgQ/yXZIrTEQSqD0U7fmAz7cwTM4
         l52koKS9kUTY0hgMwTpEA9xu4lvYAUkVN6OlB3pI2s31Sk/y4ZAn22dbaEU8wy3+8vtO
         d7maj7a7e4ee+SN1mLXCNobGUWT0wdXpLuYB6PxpgVfJe/CY6SLriYa7y2Uj8XghFScY
         IqRWS9Wk1ZjSjDtPojWTJ4GLRURp30OAkHemZjSQ90zdH5p5WJGYsWFsEvDaxGRWNtoH
         HBlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0t8B9KiaKml1jWkv/ehgW2nxgxFMiIhxgi2j8Q8oeTs=;
        fh=CLJOopznzuttPNTMhJ88iTYPKmf4WvqkXrTytu+RlZg=;
        b=SikuH+Cnt4uWIva0t/iVJ9wgowZbg3TMpUPdvOdqXCcp8O1EDyka3KLK6kf6MfhzK4
         PiPLnS+mPiMV633W2cZ0RNx2V3qO6rUeMssC9H00DSsM8fbA20TM/wZ7Rv9qTZ9UfgHq
         xo+yS9cAa6Z/3Hk17wNubfI243ClxjBtXDBca2x1gyod/ZVsfbm5Fx2BS8BlLjT/VAdi
         HY8J9xnupWzqJcwNz9jPDuna4+eDDPG5NiGblz6NuTJKm8yV2Ge9e4AjvSGZIEEttScb
         8XgfdEy0IZSpmnux4EYlN7rhy+ujJM73CD903hKZeLBO0CMT20TyDjVDSDfVMz9H3o7w
         tcTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782212020; x=1782816820; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0t8B9KiaKml1jWkv/ehgW2nxgxFMiIhxgi2j8Q8oeTs=;
        b=HiBcRDhQuprYofcr/6Y1E+VlgHtgTCbluTtcasreqS82O23LY5RLUdXpLBDZy1fR8r
         /sVoMxz9ebvWdPzg9YloaqIxMZfyNHpNY57S3Xp8lQ9rINZQdj2rJGOT9t6BbfapvCmD
         xnOYiSbQERF2jl1WxoEr4eSOyNNLAdxw5U8mxXOQGQuF/twrPr+AivzIDFV/JlyZm/nd
         0Bg4Vz2C4iGs+XFMIhtPltso6fxjR96jy2GArRpRVIiR+bSUsIcWeF+WWzBRT3bFOg0J
         HxqlXozUCT2EFnO7E5mE0XPlLrAAv95yaQnK/s/xyJW1FmDSgto8+3dbmeWQRDHIjFqc
         f7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782212020; x=1782816820;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0t8B9KiaKml1jWkv/ehgW2nxgxFMiIhxgi2j8Q8oeTs=;
        b=ld12gy15ahUhVmngbZH3cAkaIdZop4UzlPxc80NBRFtJJquHHuVAv49lRSmFo4nfSK
         E+TuKvFnGiuuaEKWAsyXJjT0ZFgml0emPfuqWXpvofbjb66dmxGMtE9IJyGedkiicHNk
         voCNkGavz11M0d1wKNd1R2IcTAMXRCKfWb2Eux3k61S0Qsr1rA8mDl7jymflVl7YQflB
         mXKZQiv8H6FG9e+JiGCkQ/AI+pbu4NrXpvv5qT69kgjZ4JPQKhfkazPLmPZ3a6WHvWA2
         q1IW1vEfn6frFGo1leqJxxw2EckA5NlBSMCtQbAbwxpdW41M2khbrfnnwSedU3Y9f/MY
         nYYQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ltLLn0nvZkTCvJ6xQu4QCwcr6IQZCmQ5Zz71u2laiJUcjAi+zhpxp7rhCcq/z76Xnv+cchdt5mDSNdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbkQUiweDmVsUSXG3MY1eDngbuUKDR/cnwEFU00PRf6g4NIAIT
	SiZ5jvqA54hxIdYqvFhS+vPXPOJUxTL0/jkv6rn1aLNFkbwEYu535Uz5fgfN3GANF/VhLiwi9dT
	A8llsty0fnEOw2m/Ihx6Kp4ze/uBONGMv+xS5
X-Gm-Gg: AfdE7cn3G3FWEFP2nnYSdp9Uvjl+1tktR8rlMgWerFZ0ik/deSZAsxKAhLBdjzzmqqw
	AJe0vh6AaXqXQm/lFQHi3lzumrgEUqldQKk5v9JvaQH1QiZw1nW7ngsKo2rXMtnQNwCZ5mYHAYC
	JweJB3d8sf2i/CLSQFMXKzqcU/ioAQ2zJqyuWdlIzvBa9xEhYznHZpF/vfRdRr07cgavAPPIOG2
	vqi6oSWtd5zx21bIgE/1wHyHp5SchLJOciKVcmAK99OGeFqh+plo9DoFEbIkWnmO4kGXM7OE7Y1
	RhiC5/D6GvMgI8rqy2f1gpvlRD3HSLh12Qgh9Q==
X-Received: by 2002:a05:6a20:d045:b0:3b4:904f:c9cd with SMTP id
 adf61e73a8af0-3bc5181907emr16930605637.6.1782212019669; Tue, 23 Jun 2026
 03:53:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622005613.21870-1-phucduc.bui@gmail.com> <229ba136-66eb-4a30-a316-58377836b4dc@sirena.org.uk>
In-Reply-To: <229ba136-66eb-4a30-a316-58377836b4dc@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 23 Jun 2026 17:53:28 +0700
X-Gm-Features: AVVi8CfJTdkORwgI_XliseheOLtan_Kjx0p8qfbLbr6t29reUwoDQB9fLtkHz3Q
Message-ID: <CAABR9nG6BL+-urEg0qDzJHYmowm7O=du_0T4+K2ogdrcD30CXA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rockchip: rockchip_sai: Hand over hclk control
 exclusively to Runtime PM
To: Mark Brown <broonie@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thank you for your review.

> >    1 Reverting back to devm_clk_get() to remove the implicit devres
> >      enable/disable behavior.
> >    2 Manually enabling and disabling hclk explicitly only around the
> >      early register access before Runtime PM takes over.
> >    3 Dropping the stray clk_disable_unprepare() at the end of probe()
> >      so Runtime PM solely owns hclk afterward.
>
> Note that runtime PM can be disabled at build time so we might not have
> runtime PM at all...
>

Thanks for pointing this out. You're right that with !CONFIG_PM, the
driver only relies on the
two manual calls to rokchip_sai_runtime_resume() / suspend(), so hclk
stays enabled the
whole time. I understand this is unvavoidable in that configuration,
throgh, since there's no
Runtime PM to re-enable the clock when it's needed.

I'll update the commit message to reflect that the driver uses a
combination of Runtime PM
and explicit manual enable/disable, rather than relying on Runtime PM alone.

> > Links:
> > 1 This change is based on the discussion around manual hclk handing during probe(),
> >   as raised by Krysztof:
> >   https://lore.kernel.org/all/20e4754b-ea9a-404d-b529-ec44a7263cbf@kernel.org/#t
> > 2 Background for the earlier devm_clk_get_enbabled() conversion:
> >   https://lore.kernel.org/all/2818018.CQOukoFCf9@workhorse/
>
> > An alternative approach would be use devm_regmap_init_mmio_clk() and let regmap
> > manage clock enablement around register accesses. If preferred, I can rework the
> > driver accordingly.
>
> > -     sai->hclk = devm_clk_get_enabled(&pdev->dev, "hclk");
> > +     sai->hclk = devm_clk_get(&pdev->dev, "hclk");
> >       if (IS_ERR(sai->hclk))
> >               return dev_err_probe(&pdev->dev, PTR_ERR(sai->hclk),
> >                                    "Failed to get hclk\n");
> >
> > +     ret = clk_prepare_enable(sai->hclk);
> > +     if (ret)
> > +             return dev_err_probe(&pdev->dev, ret, "Failed to enable hclk\n");
> > +
>
> > @@ -1482,8 +1492,6 @@ static int rockchip_sai_probe(struct platform_device *pdev)
> >       pm_runtime_use_autosuspend(&pdev->dev);
> >       pm_runtime_put(&pdev->dev);
> >
> > -     clk_disable_unprepare(sai->hclk);
> > -
> >       return 0;
>
> Are you sure that the runtime PM state there is such that it knows a
> reference is held?  The driver used pm_runtime_get_noresume() so the
> device didn't have RPM_ACTIVE set I think?


You are right, pm_runtime_get_noresume() doesn't set RPM_ACTIVE. I
think we need to add
pm_runtime_set_active() before pm_runtime_enable(). Otherwise, with CONFIG_PM,
the pm_runtime_put() at the end of probe() might skip the suspend,
since the core still considers
the device suspended .

>
> The runtime PM API really is a miserable collection of landmines :(

Yeah, plenty of landmines indeed :(
I checked, and rockchip_spdif.c does use devm_regmap_init_mmio_clk() for hclk,
rather than wrapping every register access in pm_runtime_get_sync() /
pm_runtime_put()
the way rockchip_sai does.

Best regards,
Phuc
