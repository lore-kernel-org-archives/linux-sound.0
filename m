Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3726A30FF27
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 02:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781231832; cv=pass; b=o75ccnMWtL72IsUOzRHn1P+sXMORROIbIfBHrkNT4jY3Qey2fj5ZHYM2y/FLwSJZXQlVXdm1Ym9ZNxKTFQnxPxxA3mc8YoVeP8673d+dJskBLpRjxRqX1b32fckeBDNJWNLm76HSHXogtNdhPSYB3WIAvgmDZ6vBzZ9BodV6IYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781231832; c=relaxed/simple;
	bh=RY0i1/D5JTxJOtEwxGd4/rYpzx0fZUII0qbxG4uS+NQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KPyer0LM/L/LQ1ZLbCrU+jSnyNvOsgS34ulUXzyMJWh+lAaWmpaSrgiVAVG3xysFvgFG/i+i4yWwn2Kj3Yh/X+SrQ8JaAwvb6yuKURgl1OkQ3dzybTDeRAhTVGjNEU4/7bt552A3lFd21vtzveGfMOxzcX9HsO6KQXmMQnZoU44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tEXBsXCY; arc=pass smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tEXBsXCY"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36dd65b95f2so404470a91.0
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 19:37:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781231830; cv=none;
        d=google.com; s=arc-20240605;
        b=edHhQzEnmUizPRTvr4eLvV8f2j9rLTE0oFBZwkhOPg8mnED44T8mYg0xe6oI/Kvom6
         b/XyqvzoUc1fFQcs7JPNyhSUu/WxWkEyCmYRwAJJisL9fsFdhQZQDUfDFLKYKMGMvT2y
         nm3VCojcXrKJEBdO3gotmmvnHETaQ3H7oQ6/Q9kmjtMMD//Nf1zf00//Ih0YljbPS7II
         7853lOUPkq0HE9HoVPIANR6TbrZ5lFR9EQJaOG3sJc/InWdYjeYq25n3v58ZGV+9WR3o
         wizVF7drRVe/ceK82nLtinP8wB2f25vWZvm9b+0BUO8tLQJxZC+/wnzBWioc7V11CSmx
         TlZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=k7TWkPnU2ZFv4c9L/lpJaAzpAHYUyg4vWnHX2LiMAfg=;
        fh=MmF8SoGykv5bEhZyuRjBD8KbIyUNSLkyPtc1GQIAwEU=;
        b=Ku3ely9PTeMXMlBZ9OH+6fYjVgBg6p9LoKc5pSJoxXNnG4gpLm6S7EhnOxKxsdWMET
         otzKFZEp/ZSIJ9nN17sYaw5bATsxHzI80yMrRRctkQL/99kXP+9cTB0r3D65IFcnss58
         h8+VXgaDsV3B+inWy0c0p9muSxNeDEm25KrGozF2arSg7GreaE+6wrL+GJCQeg9tBVBq
         nxFUon4k8cFx6WjSRd5n5TEJyMyKwFmMSMe4QWumDzT+rFFyi0gpUedt3J0C/Q+bribj
         6TeIGaBxIbHnYnHk5aCmw7iTL87FEK4kNinR7/Xduk8YfM9xg+k3M+8K6DUzGBWRO/iR
         2CrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781231830; x=1781836630; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k7TWkPnU2ZFv4c9L/lpJaAzpAHYUyg4vWnHX2LiMAfg=;
        b=tEXBsXCY1oUh9lgF20sm+8uIRR/Uem+BCOpyAeiwVlTtrect7Y246b3KgxkEucF7bg
         D+u4zrA68NSgzFhYqbhA4yXEv2WKPTupOlYdBpbrVAn6jO67aKAHq42negMZBs18At5q
         LKzKqRF5vkvOQ0TBhws2bfG9LZLGKIjndvjalxW2GAqPHtzxMofCEok7ODJ8R8B5Pb0Y
         1ezHHfaNH84RuuB2rOHUrcjPCy7DPEFF4qMOPEJ9whcpXUanlfkp8GgwWsB4oYI3AHjo
         S+w3mV7e5V7Erd6pSuUn3tn5eCNNCgIIX2YvzfpfRJY8S2e4BQ4pgzoLn2Sgan0bVS0m
         +AzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781231830; x=1781836630;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7TWkPnU2ZFv4c9L/lpJaAzpAHYUyg4vWnHX2LiMAfg=;
        b=WcUd6J04bHyQ38kWnLvqjOVBbI1HqjchQs/nWs54/4meSqEF3iiIWw6ss4QCv3Vem/
         TJxZV5ibFfd8CX1dxZuyJ6VN51gepYwlTulOkiq5fp9UD++I3k0n3ngY3h0k2347MBDM
         c14L3tr9/LaKEy/u8qYkJztLvkDMYhiS0UndXweN9jlDpYwA2Kt6GCAfheUNnfAVjY7t
         PsUu55aYA/2/BdaXpoYoxfl2ISSHqXj+zKakFxdi7677sIzMSGm4FCRt/rwtj1G/GL7i
         m0BXtBiq3R2jtPsJP02MdrJull9466Tnfi//rmrEtHF88ScX/klhV3cnDub+hQ9xLp5w
         Ev3w==
X-Forwarded-Encrypted: i=1; AFNElJ9bq9NI9R6qX8L1nN3WPtqcg1qR9OyonI5Y8qwIaNG46DMmRpmcv0Vtjh4epwo59w4FXBYnc6WaMTtRYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiN6BEleU80V9Jblei3WIW2BLKEoQA+wBuCOVCvYaR/BBu2Ut0
	FQTNtKHozyw+DCFmJoGR4WlsbIg/tlzo90/6M0bvlTxRENEDn9g/+c12lgvtFyvs76YP/qBj09y
	0ScqhgoLg9YqcKbRI8Q/drAF6wHW3izI=
X-Gm-Gg: Acq92OEg9vq9A4dJLK+PPv65F0n+CkA+5y8b6wKC3wSBsk+Dwk7X0Hsxe8IYcffYqzf
	HZapHy6B7uWpUmAU26uxZfQfBQyv6vheZ/PvTmdyxsSwrUyTf/bWF9rfaG5BfB9SN/fZVKQeJAT
	ZP4wlfyb2iKuWCfV17wwKs+jGgUP/sqNjsEtAdxe3nnu3oYk3plEIhae70/G7lEH7lf6UTU/aBL
	HfSOab0TvvlK9EK2TXdNOq0RALXtKCkEkBpY1MscD6N1pJ1b3Su5f1QeDo0PfqmWA/xyJoDdedN
	ilLu0zKe0OEzEoLrqyB0zNz9Ny2GqyfSqXwsbQ==
X-Received: by 2002:a17:90b:1dce:b0:369:7491:7b24 with SMTP id
 98e67ed59e1d1-379ed8e27d2mr1063022a91.6.1781231830513; Thu, 11 Jun 2026
 19:37:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610102153.83367-1-phucduc.bui@gmail.com> <1j8q8mfte7.fsf@starbuckisacylon.baylibre.com>
 <CAABR9nGC=f_hO7FX2RnRHLb5D2Tt9=qT_yv-Fv2y32AAoQy+sw@mail.gmail.com> <1jo6hhebus.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jo6hhebus.fsf@starbuckisacylon.baylibre.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 12 Jun 2026 09:36:58 +0700
X-Gm-Features: AVVi8CcLu5Ty5I6ab3mqIKLS740KgAX1K7YLQYr3jFBVdQ6AaZKqSuuk1kFJF9c
Message-ID: <CAABR9nGQt0zsH2McjOFO91tS-CHsudzioxCkPvbkgmTyfKVo=Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: meson: axg-tdm-formatter: Use guard() for mutex locks
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jerome,

Thank you for the review and for the Reviewed-by tag.

>
> The code is not better or worse with the change but you went through the
> trouble of doing so, if Mark is fine with it, let's have it
>
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
>

Regarding the point about whether the change makes the code better or worse,
I have sent an additional patch to address related cleanup in the same area:

https://lore.kernel.org/all/20260612020113.9557-1-phucduc.bui@gmail.com/

Would appreciate your review on that as well.

While looking into the Meson ASoC probe paths,
I noticed a few consistency issues that seem to appear across multiple drivers:

1. Mixed usage of dev_err_probe() and dev_err() in probe error paths.

2. Inconsistent error message formatting: some messages start with lowercase
   ("failed to init..."), while others start with uppercase ("Failed
to register...").

3. In aiu_probe(), error paths for IRQ retrieval do not provide
additional context,
    making it harder to identify which resource failed:

   aiu->i2s.irq = platform_get_irq_byname(pdev, "i2s");
   if (aiu->i2s.irq < 0)
           return aiu->i2s.irq;

   aiu->spdif.irq = platform_get_irq_byname(pdev, "spdif");
   if (aiu->spdif.irq < 0)
           return aiu->spdif.irq;

4 ......

Do you think addressing these issues would improve readability and
maintainability of the Meson codebase over time?
Or is it generally preferred to leave these kinds of consistency
improvements untouched unless a functional bug is being fixed?

Best regards,
Phuc
