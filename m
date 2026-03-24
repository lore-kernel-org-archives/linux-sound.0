Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2F636AB7C
	for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 22:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774392027; cv=none; b=nwmdP6/RR2xpSArYAHgsQMYSEi/zA5/xOr6i0whg3z9i5Pk6CweBc0cGpsyU3+Mn3Pk09VUVoArWYN+oQXBUl2UPUZzq8P9RZ2z/FH+Gb2wr7XBOMrywQN3nbGv3NEmIkOZ/5HaMJhvKZnLsjX50HXPyQTp3DzEjutl4Q1AYXDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774392027; c=relaxed/simple;
	bh=3NQGz/Wow37LwsDtFVCWIwDFxQVvo+kDIoKh4BEK2LE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R2jHVyFTP3UhmXIox6PvnifGwfHW3fZGzSu0YJ/aVFIhHGOlsSNIL9nQgk3qkWZL9XFvqu+eENej3eD4d9TGZeF/AABmQ7Hs89dJmv66hgOlx4ba7CHg6RkDh/KX5+jz9YsOk1pbY3e3WBLkJokLqWrowNPhYleQGue8zkYPDpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SiL2cz3Z; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SiL2cz3Z"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48374014a77so58709085e9.3
        for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 15:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774392024; x=1774996824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OhQpT1uOw3aQFvUDXr78Z5wlFodfeRYW4M5f8BX3v6c=;
        b=SiL2cz3ZzCvdCBqNosHFbcDDx5LwDiHBi0ehqKEr/11HAKKJBC4MVbWCJ8yVU+eRrT
         GEFXKZ4YM3e6OURFpZfIrUVLLbYn8lMBCgCO/5M+JSmBy1GoAkKzd/v6R6/3CWwTYc7h
         E70nW15w9/BwqJGJKxNrOzw5+wCKtWnJdc3/XHDzC/Qy6wU93RUWBjAfdel4O13fUWg7
         s1/mZgQVI1XBwpWJ0jLygiPBN9N86fiNGn8kr0mUpNvVN5Q/Fjs3wb2LcexwKUgy6R+M
         kJw5Ia0hh+8ZdsPyNhuF+XaHKe/4nEKo8k6Y16t+mdr1H/AkfVMxN8ziaOq0aHhS8OEE
         m+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774392024; x=1774996824;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhQpT1uOw3aQFvUDXr78Z5wlFodfeRYW4M5f8BX3v6c=;
        b=dkLPdBYxCkOO+UIDjkgs38IXbia0z/lX5LwE8qV/vKANiKitQV3a1qAex9mEijC5hX
         nLSSf6hMb2nyqbBjnN/Bv+cA7QYvW5s4WGXDk6QRWdOJa7yvIpaZhjvYK3H3PjJ6uwye
         7aUgTYw96s1f2U/wKpLfCilspzcxjjl8LSgWju/d22pFePtNZgxsdra3CYjpPeOatdcf
         XcOpC4tnR7u7u/Fq1xCivF9Um+PUVSYoOXenKRv2i1/AcdchQPlTHFBHscmiBMZosEne
         nHq5+HQnUtFQKdR8vaEd4tBGMgaFnc8ypEDzzy8Etuw9HJbVXoqMXcM5SqzEpcQmflcT
         uKZg==
X-Forwarded-Encrypted: i=1; AJvYcCUCqMu0qAgG3wyn3H8o+dtNE49fvy4ikpqoVPV89f4sGLZKNDYSsSa1Z1UVQQJQDuxrjS7Mmlfyz1FBQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoTms0KSaBCXfPCka5GnN5IgmmJjQj2Gt3GuzSTnVUOc/AcxE1
	diet4cbjgZyxSlISUd9bU8TVXZWdSBq9rlxAUQgWda/lFI/8FzoyDUI=
X-Gm-Gg: ATEYQzx8PcfBqz9KiJdngtBAq+dLXw7Lp8mHNK/UulnFbt+KZLEcTbXMIVNd1ewSPsf
	nseWHoAlf5iSYB/0eTA7ZFBBueMyUDveds2cWpcJz1sUbRbY5W61Eg7+M/d0p7n9w0oSylEONUP
	km0+VyCyGeZsjMkPSa1uey7t8BZMg9+GvEh2fctcwK0Sasodl24O8DbXbHYbkcyHY5o3CJ6FYzk
	OPt9cseGlP7/I0PG/Q3iM+rrzB02bNOdZneWmAFvApXRTq4wMnZbq7hTJd2crdfVJUw/BMaXGR+
	mr9jCbzwY/eLiZNzkxQOmMVDbtZvWYpJ8z/5577Bllw2xDE9rPSLDFu2PBsreXjwSQbHVfZtGgr
	Qw4VfWb4eOqBGEVPatawlfhDMmPYL/+UhHYLGblAkInaEYw/JctDxw/kXX2gcSs8nf+v0vhLcUE
	wzJVZu7LFMSTlg+7uarqmtQ9W+0By0VDxNuBGw1d80Zi9jbMFa7nX9
X-Received: by 2002:a05:600c:4685:b0:485:40db:d40c with SMTP id 5b1f17b1804b1-48715fc3971mr21709525e9.3.1774392023919;
        Tue, 24 Mar 2026 15:40:23 -0700 (PDT)
Received: from localhost.localdomain ([78.240.217.74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487165e8e0csm8504735e9.1.2026.03.24.15.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 15:40:23 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: s.nawrocki@samsung.com
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH] ASoC: samsung: spdif: Convert to devm_ioremap_resource()
Date: Tue, 24 Mar 2026 23:39:07 +0100
Message-ID: <20260324223907.98897-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded request_mem_region() + ioremap() sequence with
devm_ioremap_resource(), which handles both the region claim and mapping
under devres lifetime management.

This eliminates the manual iounmap() and release_mem_region() calls in
the error path (err3/err4 labels) and in spdif_remove(), simplifying
the probe error handling.

Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 sound/soc/samsung/spdif.c | 29 +++++------------------------
 1 file changed, 5 insertions(+), 24 deletions(-)

diff --git a/sound/soc/samsung/spdif.c b/sound/soc/samsung/spdif.c
index 235d0063d1b3..fb30f6b637a0 100644
--- a/sound/soc/samsung/spdif.c
+++ b/sound/soc/samsung/spdif.c
@@ -407,21 +407,12 @@ static int spdif_probe(struct platform_device *pdev)
 	if (ret)
 		goto err1;
 
-	/* Request S/PDIF Register's memory region */
-	if (!request_mem_region(mem_res->start,
-				resource_size(mem_res), "samsung-spdif")) {
-		dev_err(&pdev->dev, "Unable to request register region\n");
-		ret = -EBUSY;
+	spdif->regs = devm_ioremap_resource(&pdev->dev, mem_res);
+	if (IS_ERR(spdif->regs)) {
+		ret = PTR_ERR(spdif->regs);
 		goto err2;
 	}
 
-	spdif->regs = ioremap(mem_res->start, 0x100);
-	if (spdif->regs == NULL) {
-		dev_err(&pdev->dev, "Cannot ioremap registers\n");
-		ret = -ENXIO;
-		goto err3;
-	}
-
 	spdif_stereo_out.addr_width = 2;
 	spdif_stereo_out.addr = mem_res->start + DATA_OUTBUF;
 	filter = NULL;
@@ -435,7 +426,7 @@ static int spdif_probe(struct platform_device *pdev)
 						 NULL, NULL, NULL);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register DMA: %d\n", ret);
-		goto err4;
+		goto err2;
 	}
 
 	dev_set_drvdata(&pdev->dev, spdif);
@@ -444,14 +435,10 @@ static int spdif_probe(struct platform_device *pdev)
 			&samsung_spdif_component, &samsung_spdif_dai, 1);
 	if (ret != 0) {
 		dev_err(&pdev->dev, "fail to register dai\n");
-		goto err4;
+		goto err2;
 	}
 
 	return 0;
-err4:
-	iounmap(spdif->regs);
-err3:
-	release_mem_region(mem_res->start, resource_size(mem_res));
 err2:
 	clk_disable_unprepare(spdif->sclk);
 err1:
@@ -463,12 +450,6 @@ static int spdif_probe(struct platform_device *pdev)
 static void spdif_remove(struct platform_device *pdev)
 {
 	struct samsung_spdif_info *spdif = &spdif_info;
-	struct resource *mem_res;
-
-	iounmap(spdif->regs);
-
-	mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	release_mem_region(mem_res->start, resource_size(mem_res));
 
 	clk_disable_unprepare(spdif->sclk);
 	clk_disable_unprepare(spdif->pclk);
-- 
2.47.3

