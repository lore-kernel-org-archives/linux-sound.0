Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA04739CCFF
	for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 12:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315352; cv=none; b=Hb3Ur3w0d4JUMZeQDLsdmOUJeoDeWcdVt9OPLhEwYgScQqRHDOeB/NRBG+6MCIXkrt45hkPw/9mFYXr4Dreq2vzANEI7fQkD+4u7BI+jzuF1C7RHcaPXfSEo5qJshi0lJ63kApmelreCJi6/UgSJVitlPAcU6Eq5Oi1AzrdcqeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315352; c=relaxed/simple;
	bh=zX2xH0hnleXnxASw3p8mQlwKldU26+p9sD9F+XzEK5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a43As3xyveb0KtQdqIRtBEN/CHPXlO4gOd6WcC8EFwwL4duzKjuLAxCjgNdAtir6YbLpa4tmSlC82IVZrNI51JkTVdC+yCGq/e+Fsd+2od9uO1y6y2aUGLDSg7EAnZC8vjkmPWpOvP6YR3RwcuQBs0KWDcN1bIOvAMgPLH1bcgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BVQBrkkP; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVQBrkkP"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cf50c6f235so11600935ad.0
        for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 05:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315348; x=1787920148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A4REjDq3qQ541r3i4ayJG3CleHwU/s8ILvHOWp0kZT8=;
        b=BVQBrkkPMFrZmGHr5yoU5G8m63rUw9ws0EWoQTohk5ZRm71blab+ULdS9egcqjFC6q
         kuyxd4BlTzekDkq48cbNIfvNCBrOwzBn7+RoTEc/oPU1kPQ62PYTyeTHwFi0gpizDZqc
         SV/kNmq1cFBllOcDjYZae5TU6SQpHu3YGL4QRCDEcM5cmDtvG11o8cFg9IutTker/ztH
         rIC3XSF+bzeaFHMXt4lLxgQygPoxwDigEomwFcF1yVrQrgTgmHA7VE9HO6Gl1hz7to2Y
         khwKJ63rbWm3wnmDqsoruuEdvM/EeiUh7sFInx15SgKj0CvOzHOKWjoqZRGMuhzzcR1S
         HgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315348; x=1787920148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A4REjDq3qQ541r3i4ayJG3CleHwU/s8ILvHOWp0kZT8=;
        b=ESPBaSZIvD+R2QreEe7N1mwY5g6jTzylnhvQe8mo8JVtDgh4r/spbMJ8Qb51aOZpcX
         gb2zP64slL+QhcP05esxhIC344vZV1M2mf60fa3SEAENi1XuDaqANBC6xXHEl0IHG9hE
         /5wHy7eXj8L55gbEuIHtWUDEG7qDsfKNrxdfLG2WFi6I4U3EzWtbB+/7JEgh49M+wZeE
         /Z9WAmkstA6vw6ujrNqQgu9So5jKT9Jrv0TX12DPYDI8M+Dclz7zas6tbdr+GFuuFmK8
         WRHk7Aq5pXNO3rcCfI1bDErYfLj6s/Q15qFX2NIVblM4vrIZGrpKLF8kl9r3fcKYqRyM
         m3XQ==
X-Forwarded-Encrypted: i=1; AHgh+RoE/0ea64/wlcVQVWx1zsPyOmzy9u3nBZyPryoMIlgkUdYbaydO61DJuyKb/11rUO28sEvQGPig1/FXLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyH2mUVK+Cu8ODMKk/2pLNnccMr99H3AgK2d7DnQHZQaNzp0nUG
	IVZvh/DJydD9Qqb4v0BbfpiTAyyvO+LUH4H5MRTsPVkfXVpmRUbpExDu
X-Gm-Gg: AR+sD13YthKxaVgLvQKFHHC5GJyoraOg7jHwQc7OxWZHS67WE8iQ37oLSAkV1+GkioG
	SzdTZ/hIPRVc/1shY5MH9VwZ+tAgOCRLzcR6hbwWFUpJWaVmeNhu5HyoNhqh+cNuU5XIdN3EMlN
	TM+q9ZtSuqOC+2TBqfDE6VYmELUzRElxtYzRd8xNqyKkULu2mr2m+rEKgDFP+fW4xYyi1MEF992
	1Cnc0odERKTR2T9/IcELf3qjEULznNdGK2PO0jCehF9kKBNICFlaCRfE0RafevijFcJ4IJg/DLq
	IkF+jdLVhdSYJ1KNjvPNV0T7oWQf1heoZIz321jjkNBvQTRdUlhwLcPh0XB8Byd5A/ThhHgBJa0
	W9B1jwZjijj5LPUMi8gewSDYt/xXBvdxyFSFZb0chbxv4p7DRqUS8M1Z0DJfeUa2asNHku9LRm7
	TpoT6ZODNpijU+bzhBddSj4+qwrkmv/5CL5h1SE/SMsGXEm47rzgtV0kVe+w9XlZfMgO+cXCpNj
	r+90ri+AripmmqZFf7gehaCwqR9UYckR5A5JctSOxGIp/wthPe5FNteDWRw2M1QsW9Im/Wanh8m
	bS2y
X-Received: by 2002:a17:903:2b03:b0:2c7:f4bd:91b5 with SMTP id d9443c01a7336-2d64a9b349bmr122049005ad.0.1787315348266;
        Fri, 21 Aug 2026 05:29:08 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62d554450sm18134515ad.2.2026.08.21.05.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:29:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 3/3] ASoC: mediatek: mt6797: Drop redundant probe error messages
Date: Fri, 21 Aug 2026 19:28:40 +0700
Message-ID: <20260821122840.41266-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821122840.41266-1-phucduc.bui@gmail.com>
References: <20260821122840.41266-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The errors handled here are already reported by the called functions,
either directly or deeper in the call chain. Therefore, the additional
dev_err() calls are redundant and can be removed.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
Changes in v2:
 - Update the subject prefix from ASoC: mt6797: to ASoC: mediatek: mt6797:.
Changes in v3:
 - Add Reviewed-by tags.

 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
index f62a32f2f2b6..dfe67727fe47 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
@@ -754,10 +754,8 @@ static int mt6797_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* initial audio related clock */
 	ret = mt6797_init_clock(afe);
-	if (ret) {
-		dev_err(dev, "init clock error\n");
+	if (ret)
 		return ret;
-	}
 
 	/* regmap init */
 	afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
@@ -800,10 +798,8 @@ static int mt6797_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq_id, mt6797_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret) {
-		dev_err(dev, "could not request_irq for asys-isr\n");
+	if (ret)
 		return ret;
-	}
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
-- 
2.43.0

