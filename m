Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DFF23A561
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 06:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784528660; cv=none; b=ubOU0ydd00qqtD3SsAuFH6wsxck8/jxTbSsjFdwOKaY8XjZZQI5EQQsHKgjK0qXJ2HK6rlUShi6une7mEprcC3DYc9DqjnT+PrR2MEy9tlQDJx6oQbmrZ2uNxv1S4IKYfSxgYdeEaUVZ349Lc9zW4Poi3QjZQnm1DvyIgj1/hXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784528660; c=relaxed/simple;
	bh=BqIi2660BTiwbGipQFxMch04ohRI7z8sfcaL8IOwo6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FsjUvMQqUE33VNlJuFlcWYaXB43nk1m8iSP6gOekaI5OaLSDmY51h9erwX+euZrTPWZDvvVmBXDmNwZahwWVFn2GeGOYOOhfxxkNMjxM2iBP9dn5T7HvJyAR8Hku5vT3yPypxp8diQxQkyZT76Ko84655+euj7HJ+mP8gwdQfA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=krgrldFc; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="krgrldFc"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-495590ba856so7874155e9.2
        for <linux-sound@vger.kernel.org>; Sun, 19 Jul 2026 23:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784528652; x=1785133452; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DnQaZJGUMBW8PmJXvoCRSJmk20vajChp/22T5URlFFA=;
        b=krgrldFc9ztb4EOeAo366hlG7Zlkqtl9J6UdAw6f4mhhbcwbraXDw6SrdNriVMEZfp
         pak/ajbec/y3+QNCKqqiphObTkqvHCmMHOjMb5XB4SVjqKy2mCBGYvcEGVMRWG2j0f8+
         hVntFV3v8QcXV7wEqYX4hk8b2jKyUNY7Y5mRPIIG7Y3Vksl3z1Hl5uHt0lXx1yZ9DkCa
         eOTL5CbgSwn5jX/L8GEIw8xq47khgZmivI2oGe9CRw/7v6z6ifhE4tqMJPD4UN9aqyNZ
         xCktT7bV4Hd43hiRKqq77rS9KHpioc2q66GP7wROHw+MgDzZngAwJNrYY4Y3D+iABJRH
         GWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784528652; x=1785133452;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DnQaZJGUMBW8PmJXvoCRSJmk20vajChp/22T5URlFFA=;
        b=jNV10DJJpPkWpXvspTWiZ6xcDeoKqLF/jApd6pO9DTFLN3UduIDrrh5+XugnxITCQj
         xiGLFUsOuitr8hld6AXn9PBh/oNSe8jeNAG+4YD1tcqSlgelisOsVUizUXR7GPTx+z2u
         KCRK1nIxr4ACGLEEFGHjrifU5djemEamnH5wLRmdM6zUR6qvrkf7Yp0rulzFM2UOMU40
         QpeKVGpraUIgkRRLcgAKmBJcAat8aGDKDTQa3qjYNxWrvPOLiZ1C7kGwjEKJn/t8LhnO
         ZGG2V+QAljsRV02/vi5eU6e60iZSBxdvoeo4AY5i5Ibl9EYIqlI3gEobTn5Ig7tX0aNr
         G8cA==
X-Forwarded-Encrypted: i=1; AHgh+RrSNiCzrB1PuPTS5/dZmdL5Gy3Qa+aYbQPXewwacL/y6RGCa82RlRgKk22LIkrRlPjdJAeJOb7KxZrFNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQBW+126n/z/ETz0/8bK5XfjR35V6KRxOD73pQIvbBoyP8awrP
	nGHr4zsSCJ9C1A46aVd3DvWWl+qDqxncGlhjcBOSzlvpqE59pkH73J+XYeB/YKlRXP0=
X-Gm-Gg: AfdE7cmnX03bZW9DXtp800bh0hEG1Zfvd4ec5BJbgFpBvExf5lphfxN/khkqttVJaI4
	7lSumSi4fzEKbyKgrQZjyhJRTGOdoIddLBt9c9fS4LzYpPPEf4Cd7wcYviBNe4snBdUO77SAQ1U
	8OI7HlxRBqQ0V6fWWR4sVZTXhUUX3oZC3El3GGJM49ppDrXag2fHWuJHy6z24wdglRXnYIr4ke6
	SE3ftv2RAWr4MdZ5KNF30KZwJtzQf8BuRyQhwiQvQGtDGuCcT5Qpn0hNY02d+X0ud0GMeDNJmr5
	NvPrxZRkHjUnZ2bjjLNko4f9pfUr+rUQvz07SRWjDS3jXVr6f8zuMNha4E8jUxKZ0Y7ocOMKieA
	2c9ikSsw4Uaa9Iokpk12y2b9l7wHP2BEaDMqqAvPTBp19gqMfnHiJHSa5XvrHqufYa/jjO4FN1O
	jaO5Oq7wA=
X-Received: by 2002:a05:600c:4fca:b0:495:4e1d:82df with SMTP id 5b1f17b1804b1-4954e1d843cmr107883215e9.10.1784528651910;
        Sun, 19 Jul 2026 23:24:11 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4955de8895dsm54511125e9.4.2026.07.19.23.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 23:24:11 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] ASoC: renesas: fsi: Drop platform probing metadata
Date: Mon, 20 Jul 2026 08:23:46 +0200
Message-ID:  <c79fa0d31abc0c80fbd7b4ec94d95b197ddb9f94.1784528081.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1784528081.git.u.kleine-koenig@baylibre.com>
References: <cover.1784528081.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1365; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=BqIi2660BTiwbGipQFxMch04ohRI7z8sfcaL8IOwo6k=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqXb72KPtdb6nmkop75TLr5aqhAGIk9bWXRTKQz jo/JTxNKhOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCal2+9gAKCRCPgPtYfRL+ TnFiB/wIAQWDqjeBkHJ7XfgrAz7GJMvtyaVtIsGk6NPvnUKWBv6t9VLPniIH5gOS8R+SMKG7IME fbnjzew+MoY198bLHA7lxGuqhRRiRuJENwUvX3CZcLT7/Pqu+p3hLuHt/kUYy7iPGhlE8rOclrV BEtQirzsgbORBy8e6FPnnbudlef3Luz6xceKkUgZAH57jPvFwrOsU7XMVWZsyt0fJgAtlWxRisi WO0+DXo0h10zh3XG/kSTfuY18N4WQKDrb2Kv4pK8QwWwQ6zbcGgR+5Qex6I+9JknakGcCWlBxrh frq+8L2bHHRQYFacklNPhVjYAjRNN8gi0iz1bH3uIqxUCZGX
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Since commit 38d3273075d6 ("ASoC: renesas: fsi: remove platform data
style support") probing using the traditional platform bus matching
isn't supported any more.

Drop the platform_device_id entries that should have been removed in the
above commit. Note that keeping the empty array results in the driver
not matching on "fsi-pcm-audio" (i.e. the driver name).

While touching that array, use a single space and no trailing comma for
the list terminator, which is the most used style for this.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
I was unsure about keeping the array. Also dropping
MODULE_DEVICE_TABLE() if keeping it might be worth a thought.
---
 sound/soc/renesas/fsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 6be6587e1095..23b7e63596d3 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1979,8 +1979,8 @@ static const struct of_device_id fsi_of_match[] = {
 MODULE_DEVICE_TABLE(of, fsi_of_match);
 
 static const struct platform_device_id fsi_id_table[] = {
-	{ "sh_fsi",	(kernel_ulong_t)&fsi1_core },
-	{},
+	/* an array with no valid entry prevents matching on driver name */
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, fsi_id_table);
 
-- 
2.55.0.11.g153666a7d9bb

