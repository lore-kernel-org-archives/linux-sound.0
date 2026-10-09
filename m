Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B02C4B826B
	for <linux-sound@vger.kernel.org>; Fri,  9 Oct 2026 11:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545434; cv=pass; b=myVobVhoX1ZjeJocx0j1djgP7QQQnnNBbrjMPAIKGfRe3Bu4dPS+40M5Na8zDZycrdtfsuvTlNHCr12iyzdzM2mR9aLHSsqFjmx9xaq5iyUwqB85sSlXK8IpIghB5z3xtxfxcg7U8D9Sq29oPfZJrRT42ZhBDseZJHM+dKBuCqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545434; c=relaxed/simple;
	bh=SWFAa3FlRVlkGRW/o5QZDawPsX279VU1DGq1SPr0IVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZrDLGEVHlSGD6h7ujGN2uPPJJq7wv3mTCgOldaJWprbzWEDFuGv/UGYVaVhLn08aMtVYKkwcO7rJd3W3YRtGDfjBFRRMLEri5KLIahpR8ZYXjRikSf9gvjuMeKurzx6nDw4cLLnKxJrgKKpVpeK6ccPL5oMolC37/h8rWj/VSxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=heV51OF/; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="heV51OF/"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6790844c9b0so2770717d50.2
        for <linux-sound@vger.kernel.org>; Fri, 09 Oct 2026 04:30:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791545426; cv=none;
        d=google.com; s=arc-20260327;
        b=M/gnndsc9iEOioTiKv+/6tk8GwSEN7w/80TkU0nv1i4fCK3akdw70LdOI87EIpEUMI
         MPG71N4Zzola3G2gIf3SAhciXEvcaEiv0U5DTKZglFPLauK64wKc1Rf8ICRIgbsnsZZm
         EdGJIV3B9PkV/bWvwjqj62vrQUMYs1sMykKYYqaU3/fLRvoEU2ifXO1/sc3OlPvTLNwx
         5xietzToqdcbAV42/+S1enKDKXxhgQjgmAyoonGhFEF1vx+zMX3AoLl2OekPrZ3t7i2h
         3cC6R25g+8s0PESsJRYYrJkZ9FDXiLfbvq20hxcThBE3nUnwSoK3pQrVJmtHIBIzXmCS
         JREQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SWFAa3FlRVlkGRW/o5QZDawPsX279VU1DGq1SPr0IVA=;
        fh=YuwR/oy5yYN2q31ZbJ6Mui9y+P5ZwYLg75L5uNRKBfU=;
        b=MS8gtWXhlGOssjYJCHx7HLk4Ix2AIU+u52xN1CQUIX98cELXJivPuDReRzJA38VwUl
         8jLvpMSKHK9OM1p19lYVC4q7/47j1L8s0n938QEM76WZNEMlvaQ/JJ16uSXwNxrpn/lc
         Xrt1dtP7d4VJBdRwMFoU5SBq0BRKgocCoJkln7yZtwVsuFMdnGL2bznTSvKot4NpU15L
         23ywL1/Oy+1hB+2xWa5sbm32KTywg4U6zRq8c/uaARX38wtn0NsCiiiqjZFjgAMU1aOv
         YrLIek9TBU+5AR+/tWaS1EBDR0KwfPEbbCr98n0ypBygBvBNO/gkd5rFPOmcRsH3PT/Z
         lokw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791545426; x=1792150226; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SWFAa3FlRVlkGRW/o5QZDawPsX279VU1DGq1SPr0IVA=;
        b=heV51OF/je6TDd7cnA4aqRFA7ufeixuPCY6OZfeY/ZhJPxY4GC8d38L1cUA+Ir9U14
         AtFl+rI0SFkyDls0E4F4Rnyj/a54yZa6jiWThn0cDF4uQajkHXtNRY7YwIcjxJMMLUbX
         8iXL0r1kboWd3J4RIe/8vMdka5inNZIQdvmSg7g2Av1DMVAqBA6JlQaoP7KIbRE8ctdz
         5puxRXOnrstfWHUMykG//7DRMYJ5unSw4Lk8bC9Vm1Vh5Vy1T4GDYQF2GMP1jMDP9wK4
         jEf2NkodhHNnRYMnQbHOcD29v5PGznM+eL4c49ujoIjM33JVRAhtZpQE5tZhbSqKobHo
         Tzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791545426; x=1792150226;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SWFAa3FlRVlkGRW/o5QZDawPsX279VU1DGq1SPr0IVA=;
        b=DpFjVq+J/z24RKdAJ4Tp2N9AEwMJVrS0J2WaqruUN9iVZGOkoSPjwoDOxNVsrM4MZl
         AERwJWjNas4pFYZWMv1S2L+3o5ddjtXSZYa3w+5zOSdYtCw9z9srHWbn3ILB9eNADiAT
         w9sBOHPOXpPWkQ6cthtyLAse81nSA+pxFB6V9tc/SYO4BZ2sAd1bBRsEJZUiov98wVUo
         Vq4Rb0cBUSF3NCF5bIgKQS2bFK8QacqtFENtClF4eWqoeGRHfwBO25UtRZeVlZU+yF1m
         xX2Np0VkzIiBx5GfMXfsebF9E+48s1SGohbjToDjvF7dH0jQix+eoCAUeDj/Xun7Vhy6
         obYA==
X-Forwarded-Encrypted: i=1; AKwUvBz5l5M9BuljLciO/oVIRsfx8W7njS+yhXVIaLqCQZ8uxvS6xYbOFzaroQE2ROnNHWuwdzzKaijZoeCL8g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJt+6q6M2AR+EBTnWxXNq/FZ93kmEz1BaNndyUJbkhbypUnQLlz
	wRYUpD9QHV7za2IZabW7YpbqqOdYHERFFXYNyd8uTImShXkqbFCdnWg9zdI/4Pdwt3b6rEdA9Bt
	xVpRt7WxahyehxHRkL6zH/LplVhSzKTE=
X-Gm-Gg: AYBFou084rR8vjtSp0XQpsoUU9tigFE8Gi7Cb3JJqdnaqdPRCyw9Wnr4EXavAVa4PBh
	TIgE/C/zIsXEPjl0QpdnMGzYaOI+0dD8AVKwNs7fDKAoGyhlHDB3wSPh0BReKuzUzahh90a6oCv
	nQ/tLj7Hu/tncMt9D3Jdu1HmtSq6s2mvjdX6Yk7MuQq88syEG2JFAiOLGHgi5ed4KCxusqxzyiw
	4Q+NRtmDGhqwrZRsR7ZKSAnKsJzHW5pxxw/tmS34Z231i2GsorBFac2Qs0GnqG0WWQZoD+PjXDZ
	p8lsStsHHvlScMphPDBu0jKWzUrs2TPq4aamBpC+sog/zn1k+hDKAFsJ8KX/B4KdkrB4B24GIz5
	kekfFl+GDCvHO+lEcJZZ/5P0=
X-Received: by 2002:a05:690e:b49:b0:675:6da9:1473 with SMTP id
 956f58d0204a3-67936984122mr569837d50.19.1791545426481; Fri, 09 Oct 2026
 04:30:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908090448.3332-1-ansuelsmth@gmail.com> <6c610758-5f34-4408-a6e5-f3718218ba94@intel.com>
In-Reply-To: <6c610758-5f34-4408-a6e5-f3718218ba94@intel.com>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Fri, 9 Oct 2026 13:30:12 +0200
X-Gm-Features: AclHuK8eqfw6Ev6f1SKA8eu2eg8tRj5EFkf2BXzzFiX-0ipAFbVTyYej92ofmYs
Message-ID: <CA+_ehUwrzx2gLS88438mqQC=ms71kaJpoU9ib8=zAdpsrXcGeA@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] ASoC: Add support for Airoha AN7581
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Darren Ye <darren.ye@mediatek.com>, Rosen Penev <rosenp@gmail.com>, 
	Daniel Golle <daniel@makrotopia.org>, bui duc phuc <phucduc.bui@gmail.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Il giorno ven 9 ott 2026 alle ore 13:25 Cezary Rojewski
<cezary.rojewski@intel.com> ha scritto:
>
> On 9/8/2026 11:04 AM, Christian Marangi wrote:
> > Add all the patch and documentation to support Airoha AN7581
> > sound driver.
> >
> > The card follows similar implementation with Mediatek with
> > the codec present on i2c but with a simplified implementation
> > register wise and additional frequency supported.
> >
> > Changes v6:
> > - Fix PCM probe allocation logic
> > - Split driver patch to dedicated PCM/ETDM patch and machine driver
> > Changes v5:
> > - Address comments from bot
> > - Better handle concurrent irq status bit
> > - Protect enable etdm
> > - Add Review tag for documentation patch
> > - Address formal comments from Cezary
>
> You've not included all the reviewers in the Cc list despite addressing
> some of the comments. I hope that wasn't done in bad faith to avoid
> further review.
>

Absolutely not. I usually use get_maintainers script to get
the emails so it's totally possible I make mistake and I forget
to include reviewers.

If you have a better process, please suggest it!

Anyway, what did I miss? I can totally send a followup patch
to address them! More than welcome to fix anything.

> > Changes v4:
> > - Improve Documentation YAML
> > - Move IRQ regmap to mtk_base_afe_irq
> > - Use mutex for user tracking in ETDM
> > - Register IRQ after memif allocation
> > - Address suggestion from bot
> > Changes v3:
> > - Major fix to the ETDM code
> > - Add duplex support
> > - Improve Kconfig setup
> > - Rework and improve YAML schema
> > Changes v2:
> > - Fix wrong edit in MAINTAINERS file
>
>
