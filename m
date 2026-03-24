Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7464445BE3
	for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 22:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774392378; cv=none; b=n+V7zNBuPQuijcn/6PAiOMBbXjaQHtTLX/Us11Das/PJIf6w7Boyt5QYVpjWNxlUJbkP9ZJ8fj+R5Hhp0KUlyEAGnt23k/y1Gpc9+YyAFgUFP3xg7B8af+IcfRpmxOFOFiwGKRa7RdPy1ZSfG123V7VH7ziAUb45DCPNglNS1x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774392378; c=relaxed/simple;
	bh=8fo0+sx/RX/2eA42Iq/hClJviz6+8NuBW/GxniwSMG0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oBSJluY+EAPiv4N4/v1kYkVMn/lJMRqMC805LseN7A8iOZlKzPquJ6D59737YDnmRwe7n9nUdqBBpeq1uv4Ao1yiVlmz5kHM0gJZz9sXNEG5M5C3JUfwFmsVF5jwLhJxmf36F/5rAA6B9WesHS/pVCIqR6TvSh9LhV0EM0yMfCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dKFQ0I2b; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKFQ0I2b"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48704db565eso35863705e9.1
        for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 15:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774392375; x=1774997175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9uelcnIfXMb824aADRNX9XAQjtbetebQ3hUW5he2ALw=;
        b=dKFQ0I2byBSL9kKkvbBCDsAqtDdhGG5+5ITs9UOX9qzz2C+R1G0pHYf+wFalogWJjR
         VqoOxLcER5seuDlGDUatMQ0dORH8vKZyoTtSz/h5qpwm9e6OC2xFud6W0xCzhQ4Bp6a8
         zwEcMW00/yY14nOnPtElLfBkD3zlAMqbuJXagCZEELVqcCOA+PzELKxzo8aPmcRVxATI
         jA2L6nPHknxL1vxDWwnIgnUXb5Qb65INUXqTzlwfsLAM9Hzdao1Cw696K4s6fBC7eMKr
         Jor1ppRUM9jcE+UxKUYwv6E5opYSNDCbk5HnoxWpHVgeAsR8bW9pZZwMJwLvKcafTS7x
         wtew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774392375; x=1774997175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9uelcnIfXMb824aADRNX9XAQjtbetebQ3hUW5he2ALw=;
        b=Ni1cStaQVsW1pJGHY9NFoMSfrUpLIg72OByjROD5TpaOpnazG5yA64vCbYHclGohlX
         R4B4XxCOVMS6rkeGroGlMSKiZce0Y29dLyafhOYEsAkKu1WSOeCrgYKGFEKoe0TD9gbO
         jr/fmdx76qbVOLuP+y71DfxZ8V1TYgiUrwufMl1BkyBD0L85Ja7L2n796faadv4EuOZz
         fdSKx1O32O7tq+6s1bhEt1KJqhYAmjsSQa7qfyAgR0o+v1EUpziEJGN5I/+XpG+adNUV
         67u7GYEneA5Kw0xin2XEfYnuMLjj75biEI3Hm0qqs2wCiLXMu7ujuot5x6HXzOEZl2JI
         zocw==
X-Gm-Message-State: AOJu0Yx1GjwT+Zo4oBcfw4j6nayGjK0T1voMepLhKf4HtlNJWxfCP3uD
	S/A15Hk2VU2ZTk0UNpt9gAlIdpjgah8U3nTMyujmA1Z6GjLQH4YdRTxvWKt4
X-Gm-Gg: ATEYQzyhLD3lBS3wz05CuhzznZHpuEtLY9VlYd4QAiAefIBBkq7i1Rx0yp3O/69OjDn
	L79DoXi/7qs8reFEybuf2ICRBoI77UGVSXsxGVnI8A41k0nHRfgQO3uIWnRoL60GSXK6RZr4EFZ
	5EjBBywTlJMzCMleExflQZPzdsY3Jh4LyXMo0bAIopRIxOkmViS9cc5X0dQYrVo7AtwS4q1lU6i
	kZPlkVyaPX+Gaj0iiD5D/vasPPezrp/l+ZMOppOEpG0ucl/mcxcLPJbCTkdcX/5Y//wFzVaemLt
	YO99l0pL78HXXy7NdygUY5i6HkA2RHoXDN2pKYr4+td+0qqRG7DcRxaC7iyG4t105iDT0HIrdjL
	jbeJxoVbKN9XdbvMYb95iKwjAop75zl4YFgS+2Vf0P5doBN4EXiFp4sRez/MlrX0s2KwwXpjJ3y
	DtnRoDgHvQhCxDmchz8ge3TvmFRvgvVFmhEZPER1XWMw==
X-Received: by 2002:a5d:64e5:0:b0:43b:883b:9548 with SMTP id ffacd0b85a97d-43b889e3553mr1653243f8f.33.1774392375049;
        Tue, 24 Mar 2026 15:46:15 -0700 (PDT)
Received: from localhost.localdomain ([78.240.217.74])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6cdfdfa9sm32355707f8f.9.2026.03.24.15.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 15:46:14 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: linux-sound@vger.kernel.org
Cc: kees@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH] ASoC: fsl: mpc5200_dma: Convert to devm_ioremap()
Date: Tue, 24 Mar 2026 23:45:30 +0100
Message-ID: <20260324224530.102164-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace ioremap() with devm_ioremap() so the mapping is released
automatically when the device is unbound. Remove the corresponding
iounmap() calls from the error path in mpc5200_audio_dma_create() and
from mpc5200_audio_dma_destroy().

Since devm_ioremap() failure already returns directly and no other
cleanup is needed at that point, simplify the kzalloc error path to
return -ENOMEM directly instead of jumping to the now-removed out_unmap
label.

Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 sound/soc/fsl/mpc5200_dma.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/soc/fsl/mpc5200_dma.c b/sound/soc/fsl/mpc5200_dma.c
index a593a95aa532..a0d95473bec0 100644
--- a/sound/soc/fsl/mpc5200_dma.c
+++ b/sound/soc/fsl/mpc5200_dma.c
@@ -326,7 +326,7 @@ int mpc5200_audio_dma_create(struct platform_device *op)
 		dev_err(&op->dev, "Missing reg property\n");
 		return -ENODEV;
 	}
-	regs = ioremap(res.start, resource_size(&res));
+	regs = devm_ioremap(&op->dev, res.start, resource_size(&res));
 	if (!regs) {
 		dev_err(&op->dev, "Could not map registers\n");
 		return -ENODEV;
@@ -334,10 +334,8 @@ int mpc5200_audio_dma_create(struct platform_device *op)
 
 	/* Allocate and initialize the driver private data */
 	psc_dma = kzalloc_obj(*psc_dma);
-	if (!psc_dma) {
-		ret = -ENOMEM;
-		goto out_unmap;
-	}
+	if (!psc_dma)
+		return -ENOMEM;
 
 	/* Get the PSC ID */
 	prop = of_get_property(op->dev.of_node, "cell-index", &size);
@@ -424,8 +422,6 @@ int mpc5200_audio_dma_create(struct platform_device *op)
 	free_irq(psc_dma->playback.irq, &psc_dma->playback);
 out_free:
 	kfree(psc_dma);
-out_unmap:
-	iounmap(regs);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(mpc5200_audio_dma_create);
@@ -444,7 +440,6 @@ int mpc5200_audio_dma_destroy(struct platform_device *op)
 	free_irq(psc_dma->capture.irq, &psc_dma->capture);
 	free_irq(psc_dma->playback.irq, &psc_dma->playback);
 
-	iounmap(psc_dma->psc_regs);
 	kfree(psc_dma);
 	dev_set_drvdata(&op->dev, NULL);
 
-- 
2.47.3

