Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A8A369236
	for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 08:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778402653; cv=none; b=ItxxBO8H94qvYzsEl8q9uva9qbMWagCqGJxlEZNfiofPSiDsAINgaICMtRR4HP4K8vhc8S+PLVsi043g6cQ0MFYBJIHs+uoGberi8SvRQ/ccDgq/tf0QQ19ZXetMLK9iQ4N+5QVpQEu+SIGyHV3xHaXH26igjmpPCcSEWcTbz0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778402653; c=relaxed/simple;
	bh=WeUvgemHKksYGxuMitCOutRZJO5PJ2Fdf4PAHkwxyB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YI5kAkfav6vskfLtQIE7g9RSAy9gO9DPVfX1aRk9xbby5D7qnCLWatLaeebYCMFxIq0ndgYdxLdx0keVUhmEhhwXrKaGnk68eAdJ4iDBXzNltjNmxK3VF9KAlFe1xDz31hGGrZeZ2usJp3fwwcSuTkbh1w/Ym4trJrLasTt3LNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HZyifJGD; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HZyifJGD"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2baca78cfaaso22586265ad.1
        for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 01:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778402652; x=1779007452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0p1tPnU7aXFXjhJ/ud9Kouh0tfwhorNg//3KttLCIYI=;
        b=HZyifJGD9IOKnXSX4fE+LNsAdDTtrnuqXz6JnZkRem8eFk8mbjerQ5GKsi09JZQWdZ
         UaMdqGWfvGmRgum9ZSk4qtC3SH5uV5cdjy430K6euFdGdVgLQPdDE1rHMCoU9NLIzo/L
         FtzcQbvEncdyTnMEPRlPwlUCo+3H+GU4yKylvQXxFM8iL/IyYaAXN71aOjyfU6+OkK57
         mFuXnCpdVQPOsIYD5REEma4a5Wn8CH1kYr80zPvLwnINVrfQA2oapUR59H6S1dOllUIo
         cZfHBMD16qt+Anc9chwzwr1dxcrnb9FMByoEZDTszSeDqNae/vEd5ZXNaANJ5p79gLzg
         2Kpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778402652; x=1779007452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0p1tPnU7aXFXjhJ/ud9Kouh0tfwhorNg//3KttLCIYI=;
        b=cqIITRfNVIAt92HFHDY6o07VkoBB5kHx/2ImWJCFGCWL+Kk4jJeyADt3i5JMMCDTiQ
         x2Ddee63vq84XUPeZdClH/P95fqrWAzLRhpE4EzdJ9LcS2xROTZc1gxYKWOG7Nc9h9pF
         O3UdjqrjHnBz/V9jXAq11AgRXV2vqg4355NAesjEk0lOurYUEqpKlUUDKjHysI90qEwQ
         YXYpSIOszH70hlqKCILZcO8r9efVv5lIg1cV6Nb1JqgXkvENoFQa7m++urz5/E0tttRW
         lXpBTlQAwhQLAb4k0mYK1xMVRPwWEMC0HsLxUpoZt1CmMW+klPZe6iG3eInd7jSUg3cj
         1rEg==
X-Forwarded-Encrypted: i=1; AFNElJ8amfMMtoMWJQjptTCktl/cpeFflNM+1W2UcNKTHUbxUCwqEbH5Nso3VH0ZKXncXFMMP4MWhIWNwTrrAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaslkvDbsdsBcHmels1DokD4tzx62PP/dMU6EzdVUXB3CwFIqA
	EAHE5bb3hvgwrlUjX6b0goz+dJHHnr7OZtdBDPxjk8iKmVkDtFK3fhDN
X-Gm-Gg: Acq92OGbVJRw1TMzd/aww9+RVrIuI15NvKnpqi1PsVK1wg0WDjrcJyKTbZ5EmJpXBLY
	ivPGsZw1Upu6td1FpkXAd529+7pc9DzmHy6Qn0SnLKm6N9/8Q1uJPxhmoU7jb6fRgJx7y3Hn7Xu
	W9gJLs6l690AgY7MrN8PiRrveR7FWYiBmkGbEWthIfZQkS7NTR5LOBDEzXAhcOnhKLWCgEuyfHI
	fb68Mf2PndbgkDmpJ+fkf6+mmE1Bbit2QCboPGEktZMEfJ2DQjxqNCkgKThdTU+DcvpYLAzwCFH
	6lMNmUoY9F57c6s791Vg9I3ps24Jct9n9iUT3UqNHIYg1VuazaghK53QTVjU7G7VlU9ByBoluDM
	Rgt/QolBdN1mLPoP2K2HVfa/32bWZfqPg1ezz20IT8ggGct78e7Yc+ne5bpkjblG9JOvyOsO8o/
	/7syyEY2FCmsKZDpjNLpHSYe7l0XlB7TZ0Qco6dR/LltiLHbh8G7mgBuWCZUda+yZGk3Ti
X-Received: by 2002:a17:903:2904:b0:2ba:85:5827 with SMTP id d9443c01a7336-2ba798d3e99mr143113545ad.26.1778402652107;
        Sun, 10 May 2026 01:44:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3ffa0sm70471005ad.25.2026.05.10.01.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 01:44:11 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com
Cc: broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	tiwai@suse.com,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 06/10] ASoC: renesas: fsi: Add shared SPU clock support
Date: Sun, 10 May 2026 15:42:59 +0700
Message-ID: <20260510084303.122426-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260510084303.122426-1-phucduc.bui@gmail.com>
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Add SPU clock pointer and reference count for shared FSIA/FSIB usage,
and initialize it in fsi_probe().

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 06ec5709216b..55a11f1fe8aa 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -295,7 +295,9 @@ struct fsi_master {
 	void __iomem *base;
 	struct fsi_priv fsia;
 	struct fsi_priv fsib;
+	struct clk *clk_spu;
 	const struct fsi_core *core;
+	int spu_count;
 	spinlock_t lock;
 };
 
@@ -1984,6 +1986,7 @@ static int fsi_probe(struct platform_device *pdev)
 
 	/* master setting */
 	master->core		= core;
+	master->spu_count	= 0;
 	spin_lock_init(&master->lock);
 
 	/* FSI A setting */
-- 
2.43.0

