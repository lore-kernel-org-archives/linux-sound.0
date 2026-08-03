Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8551A317173
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 04:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785730075; cv=pass; b=UY/hFvI3jaZoFvvUEfZOIKTPynvTECI3KWhwTt43/QluEMcTX3HBBJxjQWg59uUgJ0080tbt9LU8YV1IhNbexEQjzO9A6SZuEzVROm+B6LBgG2WJynDWE5ynScMlAV8UvnoHzDILkXxBRe8J9HYesGRM4ezizV2S+wvm2Cc/Rso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785730075; c=relaxed/simple;
	bh=o0bIczJYrX/P4k3ultDRs1w26VKyNpDX5L+21tUITZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qw9iqinOOqgTYyQYMzqaNOLiibVIwy836E19wCSirBTvik6UYCsL5K8OV8Wp7V8KOXYklszkGAZJYE0qrFx9aqczG4eob3FRvWQJJEg5X8cIYsOceTehcuG84yCR3TXZFhLOfrpqUWZpx4w/kjojeqrwZZ/3Gwh54AsSFQZevpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2FISIqf; arc=pass smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2FISIqf"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-383cb94f742so2837671a91.3
        for <linux-sound@vger.kernel.org>; Sun, 02 Aug 2026 21:07:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785730074; cv=none;
        d=google.com; s=arc-20260327;
        b=KFEfGRJzG09SRc7PWX/TR2eS5oRG5jIYD+VxYfAs4G0YKX2SOT7Ym1Aax+mqZmu499
         Yc1DmcA5QtZH09TEsoDSHaivh8Di+Lh1G7pMS09ialJUGcZcK47x3OTCusEFQ0sYWbAA
         5iTaCrq0NacpUPDVYjYQtFkE88RlCamwPgW+bb0YOlb3JnzWH+xyXpQdsOrpmKAZbsj1
         no5WX8XqiJ1y6J5YOL5MN2DGf8D7sC5fMqnN8OVR1FTpMVuad6efgA8ybuWeRffgv3S+
         zxreJFcnHKlYWup0yMj4FO/m2dLCyW5q0NlKIkJjkEexrygdhXnRv6GGW+2d0IRDdKlv
         wEPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=o0bIczJYrX/P4k3ultDRs1w26VKyNpDX5L+21tUITZQ=;
        fh=g0Q6SCSgNTyDbIOHeBrQvdTBgejUYmYEsOVBNl5PfZ4=;
        b=U5M9U5W/3/nz/auS3AfrHTFNgRUQ7j+8mrigZwsg+LLw4tSEJ35Y/rJ9nFujPgQ3te
         92mk/4ELTfo0739ppkL34ODi+vdP8E7sFq7veczAI/DzIZkK2mJ69dt8RquJ3wE0qbp2
         C8N1yoXcPfBCB8n0sZKqQTEIa5t0f+k5LK8wobhnmFjlqveaQuGoZRleSfm1yiEkGu9L
         RQ6vJjOesy5ZJz26j0rum4Y39bRC1QaL+HC9+N3J2k9+k0BG/R01GfWIWMgFNewtc/w0
         JZC2LHBLdZ6wo6WCtk3G1Yf3HuqAv/KjJGiIbvxyTU1bILKkeXqJozr1/WNVxO9lbkgp
         61PQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785730074; x=1786334874; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o0bIczJYrX/P4k3ultDRs1w26VKyNpDX5L+21tUITZQ=;
        b=Q2FISIqfacpz0UnlSy/31UmkJY4rTxpe6fu+uf4p5hvjHNgBpH0ECIjp9EPgC8+5E/
         29D8OTP2WVAaw6R5c/p80/mP7a5JYFILpWx7FJhIZSEsriZGm6Ca36XChovHWC9++uy/
         raH+3eksCO94XCbBVYDEw/E/kImUaKJ9Oe2D52OjjLpKyUUd5k/fgYkwVqYG3zgSx/2s
         JnZd3C2HP4InDnpBHNW8iS64qRCrDEhKcTLTQMNJVOSfIv1xB6qZCyHEaikNagDojzGF
         4RtWoFMt0UAEWIdhdzMaxria6XSO4VaYNr2bUZa/j01KAQiLG/ZQeibHKCDjZFeiaT+1
         KXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785730074; x=1786334874;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o0bIczJYrX/P4k3ultDRs1w26VKyNpDX5L+21tUITZQ=;
        b=X6I5hfqM/cso92EiTMXTwA6MucMXHQaH3eBQKyPMTqZNGRsLvUv4KsJanvNID+DiMt
         T3UN7c5IiojnXyMP0CuplsHkG/creB2DLYWO1XJeiyyLE6wBofJB4J45eeOISMvcmfZ3
         CsPGwXOmsQdCY/tQEJytanvDucjowyHougnY5yrJQlYqdhVN1NXRakTlLyeyX1M9pDeJ
         GWsMpWPXOwOhtdPTKJaJvVZm1dC1aop3fyTd1n3GDKUBmL7NGmj524HozycIcL80wYY7
         k+svESwJsCPWXDukWyJmfGxKnGd3t6+V0w/n9vMf7RqUBEXQ3MhJl2+LZgZ417ILtPWh
         Jw8Q==
X-Forwarded-Encrypted: i=1; AHgh+Rry345E0c5htw1wt/yOXB9+K+wdrMnDKz85QNq9NRf2XuAe4X6DFEAR3gx/3VT54yzo1LV853ZHeqjmWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjACFaWYY/7sBGatUQ8DSu6+7Q1dMeFBWq3KIY7ybBJlrs3ib4
	u/CmmevijNm+fL1Nzlwznvi0AERS29yLDJr++kg/jxJmAo/TASGrNpOAZ78AWShrEECmPd0RSut
	lBm/hbTIvni6uNpdBMT7P+045Z66sqsw=
X-Gm-Gg: AR+sD10wpbnKp8Xdjw2irn/IOVqGK94oN69GoVr/oQrJLucjCnbzlPsNjuqaKDq0rwm
	A7YV6VqfVTGNPSGZYWCVjvFp4mFP24FEJz8lTxGgfpMVLdnYB91yOvIzOjxzoloqEthOpy1fj5a
	3iUAXP7v7D9dwIkJnhEYqkd7IcsCM7AUVRLTjBXMuBiRQbdQk6CEAAkEXpRfY/k68+2X1Rg76J/
	J2obONivsmNyDtsUUwjaMOIqNvlONt293vylLNH67i359wR2MUtp+2qFWk+QgafqrlUPo6iadvX
	erWutSvt4vf3IU3GZtRZTUDW7084JRWTm9adx8rp8MnmABy97U26LYsaqUC+RLwtXHhhL4rWkYb
	yJiEO7ndruuOVG3/a/4OgskVruYAYmTikTfi9bI0ebyRCb2g/hx3OEy3R
X-Received: by 2002:a17:90b:4c0e:b0:385:393e:7124 with SMTP id
 98e67ed59e1d1-38fbc48e76cmr7516377a91.14.1785730073725; Sun, 02 Aug 2026
 21:07:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731101539.36290-1-phucduc.bui@gmail.com> <20260731101539.36290-2-phucduc.bui@gmail.com>
 <DKEYE4CK1DUW.1PQ03VOZZT9TH@linux.spacemit.com> <CAABR9nEqZG1Vywb2CkoLVgqoLVPKqfYt01t3dF=WTu9qJSS=bw@mail.gmail.com>
In-Reply-To: <CAABR9nEqZG1Vywb2CkoLVgqoLVPKqfYt01t3dF=WTu9qJSS=bw@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 3 Aug 2026 11:07:42 +0700
X-Gm-Features: AUfX_mxoZsbHdTwTqbI_xo8lAz5x-PfMgbH_dD_PFhYYBwi0-5mHQuUL3UsDbSE
Message-ID: <CAABR9nG=s78=5_tGSieN7hdCQOMNzJKdzJo5cx2bMfgAvJM+aw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: spacemit: init *dp to NULL before error paths
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@kernel.org>, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
	Goko Mell <goku.sonxin626@gmail.com>, Jinmei Wei <weijinmei@linux.spacemit.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Troy,

By the way, I noticed that spacemit_i2s_init_dai() is quite similar to
rockchip_i2s_init_dai().

However, unlike the Rockchip driver, spacemit_i2s_dai already has most
of the playback
and capture capabilities initialized statically. As a result,
spacemit_i2s_init_dai() ends up
assigning the same values again, for example channels_min, channels_max, rates,
and formats, which seems redundant.

If you think that makes sense, I can either remove those redundant assignments,
or make it follow the Rockchip approach by keeping the static spacemit_i2s_dai
minimal and initializing those fields only in spacemit_i2s_init_dai().

Best regards,
Phuc
