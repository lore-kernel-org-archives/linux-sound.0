Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D8B428495
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 07:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785310562; cv=none; b=PJqihPRL7PhlWWPajioXosCtTrdGs7hR3fvumjUbmAMMr/lJg/qpaXLFfiYA6QuPYs51g6FEiEMGqzJ47W5PtKLfiBXg1WcpHVqWGrGViFAyQyjemK+zMH+6YRdOBw17D7hk+WsXSSxPptdTYaOn1hgQJbespV9pyyFCiMavxOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785310562; c=relaxed/simple;
	bh=XytYGQuoLlXBLhvXDsWyE91ea73tHgVvBViTbTzsUNA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Djt/q6nB6Utv1dDXnq0mg0P1h+1pbkCIqgrB2ks28IFIv1KF1vju2vphWWX2eRPidRllxdnJRXSVIIb22ai/H5yyjWawn6uJwLa5HksWxMbitVdQMBsWos8iM+Dxup52cS2RyjPKItctyaVmzWtYH158qhy6+SL5iqXDYGKzFJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BD4JVmNI; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BD4JVmNI"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-848761b5897so374886b3a.3
        for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 00:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785310547; x=1785915347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V1BquY8jDe8O8DHdri6jK9j3L71Y1o+7vewRJfpHh4c=;
        b=BD4JVmNIcgKjHD2zraicu8qr6AgxhkqGviD9IaA1AwX2raeBj05BBcsShx0WImSw3K
         gVDbDJSB6yk5Ane4ZiCyj9pG1aHQf6+Lj1k0VZwXD511Q3JYKn7hurnYR9Rq5KCitHX6
         23SzbE6SFzhJjS+JzHSXu8LI+GXdK9QO7WGz9ukSEA8nos4jWlHC2efwdJiX4elS93BB
         4ijN4IhPOTJ8Bej2dk++h78H8Dkl6C1ynRrcLPADRTUWO4O09eNJ9FGs2rScs2N6ezo4
         IgpuLuDpeQPUU7d44CuWmFsw/jx9DDS3KQbHlCisOuF66feqRdfYCj+VbV4yMB0OMLaH
         tOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785310547; x=1785915347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V1BquY8jDe8O8DHdri6jK9j3L71Y1o+7vewRJfpHh4c=;
        b=cmfTaAEb4lIH/GY3XmtriHvkhrxefzPIB3fULOD9Fe1++4Hu+qfL7UgJJErbpZqmK8
         DI2bC63/LVsGU6aPlWP4uLeNcpWgUVEhjIV2kFoj185XL6W2r+ijHE4Zos2XtGPW5kRC
         GDjyufyY0Jb3FJDibfJYvMavxvY/Uz1qZy/7uic1zYeXD2p0zvht4RyoAbRmMdKgGqZY
         23/l/e05EBGi6+eYU1QYUxLbyswQJl/UwcTDYXRfSx8i6/NysUDalx4cv3s4R6F/9iFO
         nR0qSyNjHMRgMu7jcznKiXQqY5yDPmve2m/YO388V47pKikG+rUlxOJSkxbL9Omq9DJX
         hXAw==
X-Gm-Message-State: AOJu0YwhINGfemiULc/bAZmoob4RkV9ytNnWAJeHDaWu+AoCN8vtDOLV
	3hI1b4cIXieYjLdBvKiaRH13BN+v4wjrnM5AU9FA5RjqzYHJ8o2f58Ci
X-Gm-Gg: AR+sD106vFmp8fvfz8B48Is/QO5XizIywqwVWVCOmIITphRuj0y4PEgsGlYMt3YwO5b
	SAwcXRHwOo+E0Embss+g24Q2H+c07sSZU0oGeqJgleCzLGzNM0lx8c+W7QuwHySpp4mhT7dU9kt
	p3UxODHXdV2m5PDI85oOe19GT2iynLYNfE9Xvd0Wa+nTQe8g2bxkmcHN7EzFAQ1/3V2J6H5PATR
	a07u6SQrJVZav+vYtunCWCxQGKfB2eImxNBXqZ2BBVxCByxvtwdmsU/5CqaKLq8w3xve2Y9OlaL
	SydHzqiVKOmlouYtpufMsvejhFlW0Ks7k5prsWT0Jdx5xtHcbDtyxVBCyfRZteQSbabKwgS50/K
	SbuQBzOGGGq5Tv3J9fV8zN7KQXcv3L9mWomMZehvFjczJXsDoAVMKeLRa43toBYmBkGdgZPg2Wj
	ao8Vhv+JdE7Dgg6d7BBFUlF+LO8DlY26i9wVXTR5Oe4gtP6pW2pDUwPf3mOWt6QQMZ9tVvD9a9s
	V4/mT9uTIb+mVyHHt8H1z1cv4XIG7xT556DZVQ5NrYji0mriv42YUNy3Zt5+gDDIulyEFrvt46a
	ceyG
X-Received: by 2002:a05:6a00:4c99:b0:848:417a:d1a6 with SMTP id d2e1a72fcca58-84e931f69f0mr5961043b3a.15.1785310547543;
        Wed, 29 Jul 2026 00:35:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdb7a99a7dsm513175a12.5.2026.07.29.00.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 00:35:47 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: sprd: sprd-mcdt: Drop redundant error messages
Date: Wed, 29 Jul 2026 14:35:31 +0700
Message-ID: <20260729073532.56468-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The called functions already log failures where appropriate. Return the
original error directly and avoid duplicate error messages.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/sprd/sprd-mcdt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/sprd/sprd-mcdt.c b/sound/soc/sprd/sprd-mcdt.c
index 5f3a2a7bce31..d9a7bbd6c0b6 100644
--- a/sound/soc/sprd/sprd-mcdt.c
+++ b/sound/soc/sprd/sprd-mcdt.c
@@ -931,10 +931,8 @@ static int sprd_mcdt_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(&pdev->dev, irq, sprd_mcdt_irq_handler,
 			       0, "sprd-mcdt", mcdt);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to request MCDT IRQ\n");
+	if (ret)
 		return ret;
-	}
 
 	sprd_mcdt_init_chans(mcdt, res);
 
-- 
2.43.0

