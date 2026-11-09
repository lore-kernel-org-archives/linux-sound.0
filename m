Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794191262;
	b=geTNyheQmH/zyb3GvBJJSsapyYOnu7R+IK6XslRfBrzZMe+3dnWWDANhG41b2qEGfTbJ
	 u2XFRiy6fRTA2o9mYpt07Vnq+Wrt8+GAxRVKPSdsHOf11RFlz951VTGd3EoCvKLfQLDGT
	 hzfDOk3AUasu2vyU1qbI4VjZ8TyE7oA3s4mpcpCQSmrnSYFw6A6sq/GuXWg9A8W5WcVnX
	 wKkyaBI4zxzQoWV0eu/IOvkfsvDZ1OHXmte93L2OE7tAtQkncBiuyhxwae5xFTprAdyaK
	 B10ytWlr7M+tzHYNgsnAZ/oodWaVkBizEdK6RzJIPTc94mtuYcRV0Yi5tT64yUw1RcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794191262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=yPQur+hqQu2q0njQUmv4lZWgo9lpsQ1I9fKlomCvuSc=;
	b=DZBg4G/+iEM98/vHeqQ9nrbzjmq92ueZ3YW87OCPHUeHutJlxc6TVOywXDCmOGYJYu3w
	 Pnxxyjb6rf/f5U6jHx+tNOp0vUPCcE+Cc5+2EdLAucQYcOjLGPG5nouWjtFed/OUhkOTJ
	 8vDDxZH4YF65buoww/mg0kcj9w+qX5N4yPAninqbFBBQQBfAbPMfy9NN+Y1/HQLecBKpK
	 97IV1J6KZMMD6hrdfB94aBvpGTmmkLvDvp++BU4dlmoKGZmWAJTTDYyLmJpVI0+MkNOMY
	 VLu3iALLWuSbgp27mVidPkh9jDDkvgwsRxQnWWSsXhvFkSXkH9HeuR2UUwt/89hl3bQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xww/IyCM";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B69606A320
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 02:27:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44B69606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xww/IyCM
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b12cb3c37bso164992a91.2
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 18:27:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794191261; cv=none;
        d=google.com; s=arc-20260327;
        b=FZrbndQc2/cQzWoyDlQZC5SdFblJVOfvg4bKJ0QesXrn7xwhf1jsAf3fDib2xbRIEy
         ObE8rYufCeoWaTClyb+eNwuKTPsjNMoB6TAhi69yc1c3a5xhfeyDe/oXW4KjZl7NpxK1
         5uk90VxwMSPm5qbdyHrwQ09ci/7PuopwT/DWDArOIqcNvJPkiL8yKVQDK08BxDpzd1aY
         yJjR8ZX5UqcvZMeUymmgVwkWq7gFll9o/l3eBERWRCkVR+GIQn3xAtepXTCfoUK4qHgU
         qXss/4U4rjiCSa+QXsGpFtS8AmR2GBX/TIoR8aVEw++gwcjR5hyUaxLRp6UzGxWfnRvZ
         o3ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yPQur+hqQu2q0njQUmv4lZWgo9lpsQ1I9fKlomCvuSc=;
        fh=O6adXha8SLCSaTU9svVJ+oqjGHKAAd3D24XbOWw8kgk=;
        b=Uer1JeSmLdrC/GHEzT6j7dWFxFmxtN6fTo9lLap/Vh0titM4oK2l0RECyfTv23F3iW
         MgcWFd1Ej8hhTBkbrH6NJP2XT3KOaI/P4SjwmKlFv0cmUh0XNhxsHuagRWCHkKqxYml8
         3G0ERTjfYPyI37ylAlIvVAzPSL4fQu3BBFyCLIsG5HBZyJu+IDLguKqnMXNX1KVNb8OR
         X2ZNcxoylG9+BN5vX5h5bpn2IYWpaWAWU9Q450GMqg54z8qcDyU/1k751rRZdLrQAA2s
         Vvje2M4t762YJwENwhjtSWfbOwg3kWR2HdqpF9DZTnceesaniIUd+BK6goUtQ5ts6zG0
         bjpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794191261; x=1794796061; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yPQur+hqQu2q0njQUmv4lZWgo9lpsQ1I9fKlomCvuSc=;
        b=xww/IyCMrSODtfYtfP34ZKXzfPjx1KMa7MlTuLsdIn0CEJAJe+ZRLMcWzfU4O4LXky
         jwRaYH3/q7QzO+FfGIb/iOeL8K9uHf9JXfPw97NgQijoHheddTxQZRbZC9dFkwOv3Z7/
         qACqquLNS/7uUC5Q3e2xVU7bfaGquwd80IzSaXfBviEyo+vqfgaaiOVQjuwtQWmDNIas
         s1dcDTLURILHODKm3GzYQblmgNFhprbRZxoy3TRP55XNOREZMvaESalCxg7kaGhnxKaM
         ug5JBbD+9CHhcEugPZdlIEVNcRAKxO0hKZO3BKd4iGPqr/SVKBvnbYRGsCQP5ZizPiGn
         4mRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794191261; x=1794796061;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yPQur+hqQu2q0njQUmv4lZWgo9lpsQ1I9fKlomCvuSc=;
        b=G4ZhqfJlh2KHSGDvZevdXZfut7Pes84LXSe1QDMYvUJL8cA+CbSxhoj7iWkM0v7GnT
         MPui7sVbAWuAc5cY5U9xGwSDN8lTNJJNQRk2fEJsk59Fl8nG2f3F5wWqED3OtgPZ5CCC
         GinT4yta5aMmKcY2WBVi+4K9e9JmyXAp+kBa7e5JX+VHL6xBMHY+73z7uE2xef2rF+Dn
         o9wA/u85DSwuEAdTcdEoTFYiBgBwwP4ONDg+yRQ9X4XgtbrSf3rsAy4ZRkE4JoQpPyJ7
         WvgDxMSTht+MbRdJFWFVnuTDYVvVtqcZOrp8O9JyiG02FoGfiHjNXNDlc1pThUYZOkbu
         NpNQ==
X-Forwarded-Encrypted: i=1; AL+hErGlgYmgAxY8yEzW1QZJCrz9jOS3VLEDcYMvjg4BElW/t2obELDB1555XBDHnISPRipd6REopcPjJijpzg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+10FaewSZxowF0YVix4wNmGhSkVoXiglNU19nugA4OVtF6GBuJ
	Px3/BtSQDYhic6626ZG6Ayl2vUxN3UUYDsHtHg3hBpXFeMYWv/34FKFbvTUxRiD2SfhrkyBQu8r
	gppDLyYj3suFOlF/vKdLo6n5FXJIizK4=
X-Gm-Gg: AYBFou3AvWN+4OU/KhPho7N0Tr0J4v2yFBR+nsCJCirKBoB9Pc89YT4N+2FBuf8E1BH
	YmS6ybjfVe/MnjJNkg15A0+waExBc8WKullEUIpbyNsMxZ/L57uVbE+w3VmnYw4FvCBGIEoRJbF
	UTSJ3peUz3ub8AL+/xMb18A1O9PI3PBgC8HiTTZUBFnyiX9ax9jIJKa/VCleRlNPTBTnZXV4jr3
	5jhGH/V9PiPlLtPKo/YBLEdheQBCNef21y0MhEqyffN1mRyZ2tqBrxg4pkbZYWnlzESRySTnzCJ
	SPuqDnCcZuuk5Se4Wci1788fePxlGOPHGD9bx1mCgpsu49lto6Lao2Zon6VXJhWHc4KhNQVeNHY
	4zPdqNruI1uCys1j33B2Orv8v2fxmS2IiV0yF92rzJ+8JB+lq+Rgy9CbdQwK79c9zkZAYRW7eUm
	I96LOSvZE/Nht1fq0iEOd29+szzA6Du/oJXwH6M9N6zkX562lCiCoA13lQOFKQBSr0tYPT+tU=
X-Received: by 2002:a17:90b:224e:b0:3b0:e2a9:3466 with SMTP id
 98e67ed59e1d1-3b12d2d9c58mr2213613a91.16.1794191261575; Sun, 08 Nov 2026
 18:27:41 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105104237.38542-1-phucduc.bui@gmail.com> <20261105104237.38542-7-phucduc.bui@gmail.com>
 <179397468198.3073895.13432289481715460817.b4-review@b4>
In-Reply-To: <179397468198.3073895.13432289481715460817.b4-review@b4>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 9 Nov 2026 09:27:30 +0700
X-Gm-Features: AclHuK8qWYxsmthTljZlA9XrWRKIopm0BhFLBCTL3jBC3OtGTCQg-V_91oKsLvQ
Message-ID: <CAABR9nG9_aDfphSQ3LuYCjQxKe77woHM4Jp92MLsVx=PYDYmbg@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] ASoC: fsl_sai: Warn if TE/RE does not clear on disable
To: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thank you for your reviews.

> > +     if (ret == -ETIMEDOUT)
> > +             dev_warn(&sai->pdev->dev, "%cx not disabled at frame end\n",
>
> There wasn't a warning before...
>
> > +     else if (ret)
> > +             dev_err(&sai->pdev->dev, "failed to read %cSCR : %d\n",
>

That's correct. Since this function returns void, previous failures and
abnormal hardware conditions were silently ignored. I added a warning
for timeouts and an error message for regmap read failures to make
these issues visible and easier to diagnose.

Best regards,
Phuc
