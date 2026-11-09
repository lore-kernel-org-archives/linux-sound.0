Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794212578;
	b=d4dUB2XJ26CXZEOfCvDINBdtecbj/KcJFZbV6C5JACZCdI79xtu3Q8RjYeeoT1mtnZrK
	 52dmjgACqSyC2aJMs/W0bMlUTO+QSJ4PIMJZjNtTQUu797pIpgmrWbqCBQQiH1b5xcUeN
	 zT1ak7w28bWyfFKSkghUoYN3hn8guBbmCJ5nw7MhUagkqK+0wsSSoE6UxJYDssZ5iLH2i
	 IpaW8zrkIvchxdHhr9YlKP31jMAFLp1zgpgq6i9EswiWDjAEFRmM4GuV/mO0sLpQ32LBl
	 1nKodp56z96Y6Qi2wcP9a62UOqGCn9FMCmRBBcyDWmXrZp6ZhL25WxQDqZiuxLFzzPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794212578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=NxG/u4u9BGu7G5Ao9Bh0a6rRDz42atbNH5H/yOM96FE=;
	b=2opKeGr3gJlOEnWYBYTXjo2GMfBhn8zpIaQP4koF3p8hvJBo92hLQQHXiFspIX4hCsGZ
	 7vT5pdLzWY0TP1gY0pFs8G1sBovPzgC8/j7xEFGyd9Y+NUYFLNlw0gRbowuWOr0rCQoDZ
	 bA4JWb8K05d7DJrVs/zCMtnwrVq87rP5RLrNtXQlA/Ads3M5ijuVlNPcnRmXfx2Sz5WYD
	 Sgt7amQZc8pztecvfNCZc2KaMkpyaD5DDWxgzueRp22i1gkn3MmkObhPUqWGsNlsnkeQ2
	 XbE/VK76l6155TepeTFL75WGtm0TUxnJfZBYqUoLaJLWALxYrjcxlcLsisg2S59Xhlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=e1+BlNEK;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD35606A322
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 08:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AD35606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=e1+BlNEK
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so4691775e9.1
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 00:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794212575; x=1794817375; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NxG/u4u9BGu7G5Ao9Bh0a6rRDz42atbNH5H/yOM96FE=;
        b=e1+BlNEKoOVHMw6ZSYrl81mAyS7B2vn/1v0q7Gf7iW/Bx9KkfVzP7lP3NzS+NntQKt
         vbAFvzpbBBpYbln2KjMEu0tDc3qFDoQLypFkc7AKbCrVUXK9g3karlx/nA4xxV/s8Wv6
         xFZ6xqijOIkjuVxXCCpQXPVq6UFjp3m4BskCESh+D9/JW807grXeyGsSKMrKVumI7DDc
         ecGK5jMnZkGCRlZZ6KekOWwpeTa36+34iSLv7FkdO6oOOGcTjJA6J2XpeKZKuFjnMNaE
         5+OMU+vpRJa8GmLErJY84EIsp1bZrulLwbRaGGcrf/4qMnvH291rP+xxoydSxscspelp
         Dr4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794212575; x=1794817375;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NxG/u4u9BGu7G5Ao9Bh0a6rRDz42atbNH5H/yOM96FE=;
        b=GknZCtHJh4ekhyZYPG2XKWWOB87TLcWN5unMdvg6mekQQhZE3hyVMoojczgSQmKhcD
         n6SfXdM0WXLXRBZkhkaEn+eSNSAeyea0yAHeryVw2snCIdwnzaYYgTFKV3tbUsJz/Cih
         6YcUbecp8BSfbI7aqmdYjiKVIWh6+l2+e+KicHIkbYCgaSr3Y4PaTOE+SP95EsWzWlhm
         zZb8Tm9KttrC4G1qYgjYwYWMUQ1ZidY3j2zU0/iwZbIsWisr7Rmgai+WucLWcqZQRQhg
         96yFUYFdLam3o/6tqjoap/G8gQuBmma/zLKJ7z6MUrBcBmLvBJPIYxO8ZvMsiR+BFLRq
         Lu+g==
X-Forwarded-Encrypted: i=1; AL+hErHDpZ0L0OYnzB6Y9qy4NiIgSF8P5/Ezva/Xt4HOejwPS6ajxgtgx+yqTRSXJ6HvxrMfnw+Nn/b6nkI4vA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/hSzGu/zYu5Wgm7thEv46Jlwm9vLcktasxPKZjm4NMHcQCWZAR
	ie51jDZ8tEOfPr+PzFMVtu7fUIuI1oBU7MdvzIiGp/H0X1d9RSDFM5+zVGPP647TnW8=
X-Gm-Gg: AYBFou3Iw2ynwuZLLXhL4+oF0VN80w7R2/tPI/60u23Lm/25flgStCmCFNHpR3MNXne
	z4cHTOP0+2O4Rib0fG7obRt3XS8RrhI0IEWqQA4+0wWECS6MmkARoUaYe3JdC5TRcZslkfq3hVE
	f80I+2gzPb/0oMXr1KSyGVG9THmoH+SAT79P6GCryJQgPZJmnSFAtEa6skI+8mCa6W5ROlhU4am
	dli0n2QbhGhJJSonfreb6J2rqMqQqy08zeCkWmY1o1ozDhUDnF9ATsuwsHgH5K1nMpCOVWrF28q
	S3FGAvOCm2HpPrfcKbGm+WX9dxZDhm71jhIMFU3HODbQ8SsIceW7Wy4VDp2fYrzZJPsPVlO6aDo
	H4jAjTrcP1ZLO+wWRv8OGUH57voG9BD48qKmNGAM/IBo/fjvjZfxJi7O1am0ckCJCdnnFT2fUx3
	rI/EOYcJuK15BmTQBimNKF4han4fcFfHjTVnfGLI7V67XQrHP5/Ws0XEPtsqJY0JGjHxN2mQIsF
	lyf7yGkbJJG65R7JmmJXzGSB7Oid/6hsyT1+R6Y0xTk0KNcdjtC8QMm8l9l7p4b7bINcVCTtk0a
	VwHIi+4rE7vvpr/tpduHRCDqF1U=
X-Received: by 2002:a05:600c:1c23:b0:4a1:f736:79f3 with SMTP id 5b1f17b1804b1-4b960da4ad3mr74504955e9.5.1794212575442;
        Mon, 09 Nov 2026 00:22:55 -0800 (PST)
Received: from [127.0.1.1] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90f1117fasm139701265e9.13.2026.11.09.00.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:22:54 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 0/4] ASoC: meson: fix missing REGMAP_MMIO dependencies
From: Valerio Setti <vsetti@baylibre.com>
To: Jude Gyimah <jude.gyimah87@gmail.com>
Cc: jbrunet@baylibre.com, lgirdwood@gmail.com, broonie@kernel.org, 
 perex@perex.cz, tiwai@suse.com, neil.armstrong@linaro.org, 
 khilman@baylibre.com, martin.blumenstingl@googlemail.com, 
 linux-sound@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261107165527.576383-1-jude.gyimah87@gmail.com>
References: <20261107165527.576383-1-jude.gyimah87@gmail.com>
Date: Mon, 09 Nov 2026 09:22:49 +0100
Message-Id: <179421256915.10992.15316919043567627727.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=502; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=N6o2biIKf/6AqsgDmShn74SQm8T8RQuwU2MQPtShIl8=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFkfm27vnJKjU7tJrMtO/JTW7R3vjztV9PvXdLJdz0vgi
 7l76NTmjlIWBjEuBlkxRRaW6fd+F5SqPTROOFkAM4eVCWQIAxenAEyk8QbDf/9y36b1mSGnD2qF
 cz/nW+su0sFV6up2+uSmkEVTsmLTPzMyXK6okvrTo34y7vq6ezOrj8iF6VfY8HHHl3BErQ31aPH
 gAAA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

On Sat, 07 Nov 2026 17:55:23 +0100, Jude Gyimah <jude.gyimah87@gmail.com> wrote:
> ASoC: meson: fix missing REGMAP_MMIO dependencies
> 
> Each of these drivers can be built into vmlinux while the code
> providing a symbol it calls is a module, which fails to link.  The
> same shape in 4 drivers, so they are here as one series.
> 
> Affected: aiu, axg-pdm, axg-spdifin, axg-spdifout.
> 
> [...]

Reviewed-by: Valerio Setti <vsetti@baylibre.com>

-- 
Valerio Setti <vsetti@baylibre.com>
