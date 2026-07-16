Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AC83F58F5
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 09:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784192953; cv=none; b=DFE9aRV/vP9Z3YjwirVl1Q2DnD1RRwQAqff20zDKtiL/izAwywlt0YEDw3ruDvsJKJn0ZTqj02gfysBhu5kG2fGlgm1iF13j+KMwld4ptF/Uw89YC/uXeA+GdnOZFxI1BAxphcAz+ECgCnNGLgxLcOJVKaQ3T74G6fHb+/KQa0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784192953; c=relaxed/simple;
	bh=+/YqiGn7cykJAzG8bjIMCJHbbdXednP2qib+QW4GpCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E4bt7ilIqY8arnsW7CVq2dk3rXZFRvDneehjV0dEFthQdydHNPXnRSS48f0R4WQ0sRPbqf1SOwkt8l0ZfIGOGEWEhxg+peaOsKn36bgrUzszsMQgVR9ECYreLQZ/GOl7TtxTbpGaIg0tMbmv07qm3WOG9mWpGJdvwG8ciL8VvsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kLrcm5CV; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kLrcm5CV"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-848761b5897so3344709b3a.3
        for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 02:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784192948; x=1784797748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2J+VREtQ4n4G6L6SKO8vPnjuq5ltVfgrR5RTZCU3biM=;
        b=kLrcm5CV0TJRe8Yhf9Tf5K6LGU/NfMgs5iOcQ3a6UYHbxstUqLuwmblrlQORZVtZDt
         GMjxDw4a0y4vLlGmqTkQ0O3XX2oDrAUoZTjug7GeAnuW3yTdhpPB1M2flOY0HadbFnHk
         0222vGaLTXKCcqS7TT6F4+5eO4yf6nvjlpkz4AdY9xxHSjjoIHSZ3FGJ1d+ARhMT9sg5
         pqVw2IBR14bidhvk8BTjbDjUyDfqw6xlw9/xKOaH67otZYiVGrTEEdMMnYhLGK0pQvp7
         Q8qdqdyh+E0SqHUutsNLrdc+DTflMBXLmI+7F5YwMZUJgCespIHVX8gRZGNsTWPjMQpA
         YQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784192948; x=1784797748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2J+VREtQ4n4G6L6SKO8vPnjuq5ltVfgrR5RTZCU3biM=;
        b=V28RcVU58X3bcNh3idTAjVtuMfe9RseoPaZ7z8XL55+BnbJzQtD5d31zz10H5SVAiP
         WCBBpF83YJWHZbSojEWXfCUwaBfQ+VrusQ/twqGsiaYuflaOLSYbZxTucyX6mnsB5nTK
         omEJRw2a9WVUURdfr/PErcCv4+S2evw0FwGTsUcQFqKZqpJMCZRaJFVGihEFKiZRpzVq
         QxhYOXxe/5Hw41PR89az9UApReVvJh7IWwpzQh2aTXzJ0VfdH2HLp9Bf+8OD2oK/a0b6
         PGdcqjgV5nj1Y5H/b0wejyAWDpLPrbeUYuM4W8/ls+voMVRjnQNFzx+STXt+15pIP9w9
         syyw==
X-Forwarded-Encrypted: i=1; AHgh+RrdVhl30tOz6PumNUJrpREhIp8v77FB28Pww175SocEzuMtfoDxgalxuEABY7l6ddIanvU3a0U4CAMIrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWyXDAQzTS/Ru8AVjb5k7cpBEy+GrqM5w2fO1+1XbSL1P+iPIE
	rb0fxs3ZehQbqfGIMOzM52Onao4YnJYkqfuYudirD782lLqDs/HyiM3R
X-Gm-Gg: AfdE7clHb2LEWvZkU2QcimlEygrvXEwXbQgq7q4q47PMBKuXiBNLmWm13nWTbrWn853
	c/xdYheyP2XabwSgsfBGLqVrrKTwE7doquZ+v8hvshxFlov5Er0jPVxKZR9l1LwZaPxMJV0EadL
	RGO59JHDzIXx/yp4WAvocglfavBKRpJ/jyvzK5NmibHU9SaUaRm7LFqq6A/ZBV7g+SXP37+33O8
	Ly2GmZhkVsAQjVC8SMuo37rPmP7ENDx0BfgcvF1VMG2eZW5RQy7ZWrlzo3ajmgN+k/HKWoK7mvo
	qfSfB5HKua0W+fIVlDcJLG/13bfTTJ0lDH7YazzwL1W7UsfFpo3dVkUSr7EHddgXDkwS9+dBI52
	6SF2ievrmyWUrtdP4sdQ43SMeBorCvJ6lWDaKwqHNGpZJhrxZ4P6rboMaMh3zqE4Q7zubV/HEHC
	vS8FF/1fDZsnPEZY4JQNS0kxHc7dhUeamfZOazAiqzSyfd+ME=
X-Received: by 2002:a05:6a00:3e12:b0:848:2f6e:e537 with SMTP id d2e1a72fcca58-84a5588c65amr9075061b3a.75.1784192948259;
        Thu, 16 Jul 2026 02:09:08 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f6bf5ecsm4511800b3a.29.2026.07.16.02.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:09:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 06/10] ASoC: ti: omap-dmic: Use dev_err_probe() for error handling
Date: Thu, 16 Jul 2026 16:08:25 +0700
Message-ID: <20260716090829.72082-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716090829.72082-1-phucduc.bui@gmail.com>
References: <20260716090829.72082-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Replace dev_err() with dev_err_probe() when handling clock lookup
failures. This preserves the original error code and suppresses
unnecessary deferred probe error messages.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/ti/omap-dmic.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/ti/omap-dmic.c b/sound/soc/ti/omap-dmic.c
index b795b9f66b0e..c8d791f05ae4 100644
--- a/sound/soc/ti/omap-dmic.c
+++ b/sound/soc/ti/omap-dmic.c
@@ -465,10 +465,9 @@ static int asoc_dmic_probe(struct platform_device *pdev)
 	mutex_init(&dmic->mutex);
 
 	dmic->fclk = devm_clk_get(dmic->dev, "fck");
-	if (IS_ERR(dmic->fclk)) {
-		dev_err(dmic->dev, "can't get fck\n");
-		return -ENODEV;
-	}
+	if (IS_ERR(dmic->fclk))
+		return dev_err_probe(dmic->dev, PTR_ERR(dmic->fclk),
+				     "can't get fck\n");
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dma");
 	if (!res) {
-- 
2.43.0

