Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4476538F642
	for <linux-sound@vger.kernel.org>; Thu, 20 Aug 2026 18:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787250128; cv=pass; b=e82EvsP4AjCcnoem5xPrUTbLOQjgQJkQWNzhttJVVuQVPbhc5HigdRnU5vj8cuZLe6/16haQ4gcTs0HjIT6+Kqb/QNLS7wLutFJGRDyBeUaDnDm3HLIv3q/WCZvrCVUuCKGfZBOjTLRKqL+hCE5a62Tmw8CXStucPn2RSrHpwTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787250128; c=relaxed/simple;
	bh=3AX7QlKXcaZQ6AZXwrTY81KQmVA2RVSHnE3cMv7kyjw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vq2ryJQ/YtX5xkIrgcoqQIZQTaSoUFlWtxmy2zZT8QPW6lOIxHQOnRST4sCynvdE/6WPKJ7RJUQT7WG9a4S3qhyBD06ZxqaNH47Cl0BWjKng/hYBcvBQTFx88umwlf/6iAWf7nNJcZ5QyXdAlZVgqh3iLAIogFTqZlJXTaGWUVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EApx5b7o; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EApx5b7o"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a3819e8be8so194564a12.0
        for <linux-sound@vger.kernel.org>; Thu, 20 Aug 2026 11:22:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787250123; cv=none;
        d=google.com; s=arc-20260327;
        b=jE4dNg7VDGO4MN8ttJf9okCObZl81FxRQ/5TyPwRXnvF35aB+i4OGONkAm4207LcNm
         9K1o6TN3gdl/lf76swaWV3bUSMBZc+NI5zOnG9fiJcibwDEf2r81opOsfKzm+aPDVDIG
         o6lvufHOgdOjQrSMbHKQNdKk3BfxBNgKOV9/EzhNXmXp4uGEj9CTujDi0s8PrkyFQe7C
         wpFdhomlPRoysd3CkbjKAoi98SCHhY63gLwDeO/fy7fNpa5/r8eUqxzUR561kLDuLfxt
         9Set8j/NAUbB/VqrinPRn9y+69dhK6DKcq4jTWyrzjZoWAK+XGlWk0bcXTPtv8gPXpzh
         /MVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=itzgnus4jUqXJ8OTiJcGdr9EJaS2eyWfEY+aKox9aNU=;
        fh=WJyjjp1o5DlnmiuDNsguq0UP0ZLzxNhKoMQ4e8+38ug=;
        b=jGjYzzEzkWu6QjNaobnuAaYEdihQsxv4xQl/Izy2BjWarnaRv6JtHNGFuWuz1pNfVU
         WbaEx+5uyoCBfnGMoL8xJgbvR09RdQ063oOmR24fHB7wcv8M67WKNniSS/nb2eGhnmwC
         hsVBNF91m+/l29epAnG562vP3CkZ4HUR7iApWj1CYeNXwzlaVr2IKhbh5h5ZW5F9YIg1
         CslbMwtKnfA/8K1Y3jrpsyfYH+H4OC2Xmc17CJzc13ObwK/F8znwvVBKq7Ut5PKlm51q
         NLH9E95e1mhsRRiBLqzNpIq0WPzxcbE0FvBcha+A+T8qM/y1iZ3HcGLgUVG1Y61pRWuR
         iwAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787250123; x=1787854923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=itzgnus4jUqXJ8OTiJcGdr9EJaS2eyWfEY+aKox9aNU=;
        b=EApx5b7oQJAIwcJMxAJnojexzoNz5aBieCM8i1iupK2r6dZrx7LM0GzsKo/bRdgZml
         emwnuLMAYZWIpAySENRQb4SQbzsXtS/+BmyiOLzo11n1A6WWpz3KctmCfwrGdHvgSAJt
         iEjfPqJI3emjeA9oiDONZvvjQJg1bynTl+jNpPgdwVWwnaqoH/lRLVsxuJPSCLPq1Lg7
         5ehnfiu2YcB6/w/Xx9a8qu4zufbiudBgzdU/I0KMQhiSlMLmJcbWHqg04fKDl+pEnrOy
         wF2Xa9jI5OHu8aszkyCMVkeXUglPU4FaLLTQkU44JZx7hg1qKOlAeTzXO+x22pi2/d7V
         8omQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787250123; x=1787854923;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=itzgnus4jUqXJ8OTiJcGdr9EJaS2eyWfEY+aKox9aNU=;
        b=GNBoAhhJCGP3XmaeY75MT8kPYf5fm8sSNLiP97+QCzJQphZ7ERiMHLUnZCuR24Orz6
         TJYOo2YS5NbETX8wecFFlvYTSeYBl+SgogGaFa17JEDXG2XkUK6K7SGqPSgtyA10I9Gj
         uVhxkIY6fhZ3MbF9c7v92rRQP7L077kgkHyMkMp6j4rHC1dZfzyuUEefAeGhCAzxhWDH
         oC7E9xQWAoB5zzfbLY0J8QcBmt4dIYOkbjBbMDFvow6UeTihhrrRrexn52BO/Mt3YOr4
         vTFxgBHy3APVareiTllmpypxSb6/ybnK+CIdZObVKc42WjLvfLsolCp+ZT96ko9TLRn/
         00jQ==
X-Gm-Message-State: AFuF++kxDki6UGLnXZb7jL7EnsTVivNQ0SiWyj4FBez6NAxE0+pLNiuF
	GLDaYwUw3PfSCotzij7KaBWrAsWdNzk758Z31K+c1d/tFDhvqCb3FnCMHLOFlQeZu+LRCrW3coO
	gVg3DqOgqJLmw/SCzMzIxn+JKOnIwN+c=
X-Gm-Gg: AR+sD10f6mM8j173BswFubJ/bGUTRdXJDsgiaxfNkv/iJfc9PhF29NVCurWl89+Hu9y
	1q+90M+Ee0Qx3o/PdHv7z/RWeXtxhWt97Cu56AlFzyQPO85bEPXnH42bmEsH9uCRmoOdjJE0qnF
	sjBiCdn7WBrME6LSBuBcMjayE7mdI06ZkrInPOjsDkrUd5fAFTuqr4NkGOTzQ42dkeqZ+pnPpmQ
	J63ra9UKxGSwHUC/WTdEPE6icwAvrO6Uk6jaMJLYpfeygZhjpLjDIWyjOpukq7RigOAUDxlIIO7
	XMZi7kUFo1dBWVnsrZXeGECqtInN/Pkn/4CZ+lb7dhG68XAmHm35Lp69+XIRSLyaGA++2Qzo1yl
	kuHHYNBieN6GDjpFvGJOMet/b8T/BsH7qOLXSjvzwS6rym2EMZ3a51Yhovm5S/8qLG/ooQXAd8o
	6mf/REtHvkLENET7JLvw771tOjPcm+XJ7LaBVLcEN8jNFgwcD01nESYKw=
X-Received: by 2002:a05:6402:21c8:b0:6a3:5685:703 with SMTP id
 4fb4d7f45d1cf-6a41125bdc6mr5703880a12.3.1787250123304; Thu, 20 Aug 2026
 11:22:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260814205018.39015-1-rosenp@gmail.com> <aoQ7SynywUKcIAaS@orome>
 <DKSCUAP946RH.AXJJ9UJMW9CU@gmail.com> <aobUUhKX4rGgjQzX@orome>
In-Reply-To: <aobUUhKX4rGgjQzX@orome>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 20 Aug 2026 11:21:52 -0700
X-Gm-Features: AcwNN1WVF-hgYrtYMI7-M7s069HOFUOCrZbmrvRyHy9PX9rnw41C4d8dGqW0HIU
Message-ID: <CAKxU2N9-uK1_aLMfW_sfWUyWE+fxB=LVrnjYTO_Ghu00DxZgpA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: tegra: ADX: convert map to flexible array
To: Thierry Reding <thierry.reding@kernel.org>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2026 at 3:20=E2=80=AFAM Thierry Reding
<thierry.reding@kernel.org> wrote:
>
> On Tue, Aug 18, 2026 at 01:33:45PM -0700, Rosen Penev wrote:
> > On Tue Aug 18, 2026 at 4:04 AM PDT, Thierry Reding wrote:
> > > On Fri, Aug 14, 2026 at 01:50:18PM -0700, Rosen Penev wrote:
> > >> Replace the pointer-based map allocation with a flexible array
> > >> member and use struct_size() for allocation. This simplifies
> > >> the code and avoid an extra allocation.
> > >>
> > >> Assisted-by: opencode:big-pickle
> > >> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > >> ---
> > >>  sound/soc/tegra/tegra210_adx.c | 12 ++++--------
> > >>  sound/soc/tegra/tegra210_adx.h |  2 +-
> > >>  2 files changed, 5 insertions(+), 9 deletions(-)
> > >>
> > >> diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra2=
10_adx.c
> > >> index 9175598b52a7..d607ba4233b6 100644
> > >> --- a/sound/soc/tegra/tegra210_adx.c
> > >> +++ b/sound/soc/tegra/tegra210_adx.c
> > >> @@ -677,11 +677,13 @@ static int tegra210_adx_platform_probe(struct =
platform_device *pdev)
> > >>    void __iomem *regs;
> > >>    int err, i;
> > >>
> > >> -  adx =3D devm_kzalloc(dev, sizeof(*adx), GFP_KERNEL);
> > >> +  soc_data =3D of_device_get_match_data(dev);
> > >> +  adx =3D devm_kzalloc(dev,
> > >> +                     struct_size(adx, map, soc_data->ram_depth * TE=
GRA_ADX_SLOTS_PER_WORD),
> > >> +                     GFP_KERNEL);
> > >
> > > This is slightly hideous. Maybe add a temporary "count" variable for
> > > readability?
> > The reason for this is to allow a treewide conversion of this when
> > devm_kzalloc_flex() gets introduced.
>
> Huh? Why not do this right away, then? It's a waste of everyone's time
> to do these two-staged "cleanups". You're making maintainers do the work
> twice for no benefit whatsoever.
I'm not handling that patchset. That's the linux hardening people.
>
> Thierry
