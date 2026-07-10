Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E553BB110
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 22:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783722953; cv=pass; b=iVyw971V1YrmcvivbFKRQX+852JpEZ4AA6kJodidTId74BVQ0urkv44ESsuGjoaBU7k3H5+dXQ3AY405CszqOLf9/NdDi3FY6P9zd3hWuLaOaq/FNjMGnDwoQrL/eAznvybFjLDRaSxGCqrBDYJFaTpyG7A5hFIIoLhSdS5axj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783722953; c=relaxed/simple;
	bh=bF6mnDIsCnLF3CpiNDgMvY2beaAe2wRXN0+14PO5j9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JtYr9nmQcecH2197Wa1nX+pUNGYaB1LNIZbpQa5SwwP7uCkfXeNUaBwU7Tlnw3YSkQAcehZsdWOXpP3wc2V4NTsaW9GwMnogFhI2q2RcnA0UEudw8JgArHA/6L85B8qER4vGEdN07VKKFPngLiGqjzv04ri3nXwNBxmO/iTk7wo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=opOCEBEc; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="opOCEBEc"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so1743677a91.3
        for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 15:35:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783722952; cv=none;
        d=google.com; s=arc-20260327;
        b=FO82sdSFWZEFeFuTv78RH+AIFO747cmNC2EdheA6ZjOin3R9dR+al+GwNVeJStv1tx
         bjTOCoM2Jgp2wn40j2OLn2XWEJqLThcyJGMpsJ7cPmSPhK2l5F1rwCLL+hgg+XxnWZry
         43i73bn6WXrFJ8u6f4Ho/yyTpSmSLvICElk53hiOXbxJTq6F/QHcofWQV/ICQvTJ+zCw
         m6Bh8ldCx/XcVRdOZn/x5p33MUAcUz+XgRw849onU7CpecqBrrs1S/Uk1385p7T6qVY/
         LGSw0wPE96ZVbt/sr2fi5YOr4jLTa78VBdn+R8oEM9zfD5ul5aU6/3D8YtP7BPk8Nwxk
         6g6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7+hIVLQLM/sGDz5ot7h7L83Hul9pDF/wx6nn+5acERA=;
        fh=5pvDpsHLP1IrLHI5CQ9+s9AaXd8XET4DNR3xHPgUEUc=;
        b=ja5ljukJTJvzm07bAQolTcdMXOhFP4v8GKwFRTZ1yguFajmPazVFPRl6K5zZaV2/n6
         nJLPM0KPEgTtKoQ5dILw93FxAkt/vU13WQ1hVIW3IzNyO7QDBggi2FksgW2WbnYBU03i
         tUv2YINa5HYEWZndlpentl5Q1pj0KrEwo9bMAEc1hFSuXAAwzG7mGjbHQmOlhIDi1aj/
         FlDpQ02CoxFEw7tPI8NQzDcSxGkuMan75QidXV4V6g2pCJ0srCFm/39yz5O+1O42JGlw
         LLdwMrnZusaa2g0IkBl1OFImArdHye/tg8JBYdq57axG3AHApQzZscunJRSKGYiqRR9u
         UOjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783722952; x=1784327752; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+hIVLQLM/sGDz5ot7h7L83Hul9pDF/wx6nn+5acERA=;
        b=opOCEBEc8XvTohSnHHBVlCkyVt7VnYD3M1A49pRz+UvofD7L6pQQR4CiS2NYaw01Ei
         3+l7kAejDLDSCC2d1JuPVKHB2RhMp9F+NK1jzxvIM04WsiggTVN41A0sPYfFDBQWqPEY
         26N7vUBhNelaGbYxc/CiIzvluy8Z9wigJtgQolAJeE2oxKwd/y8iOBxvyjtaBwV/Gv/1
         lgXyICRXFWMUbrTyaenJq6QjqNMGEsoJj/S/E470TuhFIIlG9dqM2QJq9jqKNuFL58hz
         MvQW3+u968sude1+AF5A3IctIQTMt3Jl2epWR3EA9lmM1O0luiqekU5vXOaCcJvPlnjT
         +1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783722952; x=1784327752;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7+hIVLQLM/sGDz5ot7h7L83Hul9pDF/wx6nn+5acERA=;
        b=CofWiwfV6PeVQkpKhQc+Sa6nKGHJ0kcaQubuL1Po+vLdJOiM1il1h0F26WkhArue1y
         et+cvfTHLiJmW0D8aoyFihteXwmAVLw8hMW+vtJtrUaC1Df6rYjkknIb7TWcS5VmwUzI
         C2GtlCwMFaW9SNeoR8loOhgYdZLt3KdMSEUMCtXEYMifPlqHvxtHnfJD/3yJNYXeSgw9
         iMNoKgGyivchXkpIHzNkwJa1gdz7bxDGMBIJPpb/O1uuqTKvD2JX/Nvi3wafK3mATrui
         AUZWRylD3/+E4OusW3vmVoEcEM52xeokzTm55T0mPKVYzLB/0OCEZm+/Le/dEbjA1B6O
         kvsQ==
X-Forwarded-Encrypted: i=1; AHgh+RpDxJP35fqASkILmc5DitoNSFhA6qspwPyWYrBgYcSVlZkg5vE4M9Hs+2Xfyc0z/OMEf/LjLQ0oiCBcpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb0eF7/XXSejNoiX4A8/7+zspPmvZOvSxs5O/+2VW4MumgzgeT
	rP5xEkAjjp3As8OyHnFCvVOFXZb11rPkLtEsY8tptZoo+XZfdr4iMoFnN6g17iJRYDwFmSUbV84
	ff9UcKgNyG/2bFSXACJkgS1iU3+VBfGA=
X-Gm-Gg: AfdE7ckVX299HT/qkRF0f6uFLv20ZqS5F8yV4BuGLhMnxxG6gJDQYFDNbIDbPLBQyAy
	Dgc6EqV77zgkIYL3dFdqke8OXjbjIHLO9MZGkzWmXJ+ezSSRf2aslVb68NVvgEE6hG6DkufypOZ
	Il/55uJ0SsOrDrtC2Lg4ZrWSCgREZZMOzlbZC7jsg/qAqlJ2/vdWQm9WuFBjU+AzDqqAT6Cqp06
	xL5LYdMilpGyyklrrBna7NVd1EMlCe0O6tWQm8Q1Bf0PC5j3rFqokUmtEMyviRzXMz0GGrjADIe
	C5jXyYxjRs0QbdyYBk3ufay6tbFbL+sM3pzZvO2s0Z0da3AFV0sKyZnisTnXwGopTaz7QIhx
X-Received: by 2002:a17:90b:4b83:b0:387:e0db:3d8b with SMTP id
 98e67ed59e1d1-38dc77c6073mr661104a91.38.1783722951858; Fri, 10 Jul 2026
 15:35:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com> <20260710050511.14439-23-phucduc.bui@gmail.com>
 <95f5d6ec-ecc5-4090-ac04-27cdcdc21b8a@sirena.org.uk>
In-Reply-To: <95f5d6ec-ecc5-4090-ac04-27cdcdc21b8a@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 11 Jul 2026 05:35:40 +0700
X-Gm-Features: AVVi8CcV1gryT8dmwOHw2o14YhUF82x6D_iNoN6GwcJljlfAz-HFYF2Z94CVwBU
Message-ID: <CAABR9nHUc3KvC4t=hJ9osyw93aXa+kEL07G1posnYJdLvjHEkA@mail.gmail.com>
Subject: Re: [PATCH v3 25/27] ASoC: codecs: rt712: Use guard() for mutex locks
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>, Nick Li <nick.li@foursemi.com>, 
	Herve Codina <herve.codina@bootlin.com>, 
	Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Srinivas Kandagatla <srini@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, Linus Walleij <linusw@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, u.kleine-koenig@baylibre.com, 
	Zhang Yi <zhangyi@everest-semi.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Kees Cook <kees@kernel.org>, HyeongJun An <sammiee5311@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thanks for the review.

> This function does also have some goto based unwinding, there's a
> similar thing in the rt721 changes.

It seems this goto block was added recently, and I missed it after rebasing.
Sorry for the inconvenience.
However, looking at the goto path, it seems we might need to unwind the
states more completely. What do you think about rewriting it like this?

------------------
regcache_cache_only(rt712->regmap, false);
    ret = regcache_sync(rt712->regmap);
    if (ret) {
        regcache_cache_only(rt712->regmap, true);
        regcache_mark_dirty(rt712->regmap);
        return ret;
    }

    regcache_cache_only(rt712->mbq_regmap, false);
    ret = regcache_sync(rt712->mbq_regmap);
    if (ret) {
        regcache_cache_only(rt712->regmap, true);
        regcache_cache_only(rt712->mbq_regmap, true);
        regcache_mark_dirty(rt712->mbq_regmap);
        return ret;
    }

    return 0;
--------------------


Best regards,
Phuc
