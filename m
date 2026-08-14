Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EC83DAAD9
	for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 20:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786740340; cv=none; b=ZtmWICvYtEh9FdvCSjuKfwe/CfUPRQylfWr1mViNdnyuvLUcxZC1VjPH99uF7Pt7vUwv45Bh7j1SBWliRZxFDQ4Vnm2K/swGu4pLtioeCSd62BkPz+BwELFgtv0JlqSqcl4RC0d/l2VKX3SnDKv1jZtCg2KI9571wrKfFwlNuiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786740340; c=relaxed/simple;
	bh=ExEPrHJrAk0fT1yrA4R4/xrBFDsoxYuE8v7L0tXFDtE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qIGjfYP3gden9agXIyJxSvHIUj4rsTn/YOSFvPhMd0JBgIYB/QGyeDih1/F3Y95yLcGH+x8NPFJDoQTsdWEpeYvLBhyd9eRqrFf/Dqd8+M72vW+Z73Fb2XPv83t5BwYVgGY7gsDnDcSwXe7RqMnNid5voJw9SIHQwi0DjnXuauE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1TSvJ/5; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1TSvJ/5"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so1260076a91.2
        for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 13:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786740339; x=1787345139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wxIm9u0qrjErO4FKPLFmc2VnAoNGd95iljPcraq0ae4=;
        b=d1TSvJ/5mv3MhDjE/vtwgFLRNnxXGda/VrcafY2Q5roqKqrxn7u4e8CDWFfo8lyk0T
         ehC8s7Ty2CsDAnTU5Mrdh76o5YDM1gou/IU0HzvgImdstVi+BZ8Xd40OgvWLGUdNpyG5
         FfPmi43B/L+L8eJcpPTfBvUJHITY50ZejBB9iCupx7cw0z2VFqtNWpwMK1nDt9wzb3cg
         AuEC+oy3YI8WWBpYc0AEjYg3fz64Fw2TADt3XaZkP92z9JvA0MRuKEg6CV5tCDcLXNYy
         I0a28pA63rUYVfcEVicvolmpY3y8fzmJykMrkYXgI5cT6Aytbi8aHRetpyaCkCqCzoQh
         Eayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786740339; x=1787345139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wxIm9u0qrjErO4FKPLFmc2VnAoNGd95iljPcraq0ae4=;
        b=Q7/SFgVm0hZO1OM4dgbxW9N7K2nvekxLTszUrLkLKgRaaENoJaU2nrOJfYlfbMJqNk
         TIoCCrtX842l4fEbdDs2B5BV/bsghx0lmhRURUlV9NvYf4BpHIl2QHmMQRH0b77WvyKe
         nE+vbabkgmg+QaCxsIZ9cpikbnY6WnCL+h7pDpVE7vWMkCf2VCIjLNhr5SjMlYYNBb68
         wyN8pz8typfjkJOUaBH5VqtkAYljEaV1ItvIJ4L2LjpRA36pjLsNAzr2y/cGP+iCkY0o
         pzeuSiiiOMEN1aD3iLTWVT9UErbM0FT4rGgHeaw9KOQvYPWqeyhwDLcfS6iRIr6/AnsB
         5R1Q==
X-Gm-Message-State: AOJu0Yyx4QVLsZhHO4AbK2+JCV+kGAB5wB1Yqk6IX0p5B04qm4w1JCWA
	YwRDgo0MrLgxdbklwTvgVCLcD2syYZQJKb8aVVZM5z000/RueWt5z80Q7sJzFQ==
X-Gm-Gg: AR+sD12zFVVe7tHXYABuR9pd/2DPcsym+15oqhFThyaNplZNBSttwfHc0kQhSOwIV6W
	zoOHgIXSVaibwSwjUqdaxWwKKwMREe+6w0wRbux2pNaSVogSvgn74ajmEYO7LCv67zxpMzJEAXJ
	BZ/L4icpnn+Z1khDHMo04s0dC0aiuGxFbIp62MtY0WbsapwM+OMMTV9RA8MyzlAUgwH0T8suh5/
	POUXcFCnMuEt1crQq7ON1YOQAn9cjQ1wgrQt0ESocADrhWC5XMRa8OvEy1lzbRrIEMXV9ZQtAmT
	iWyHZvPNHt00M5IUlz0Xl/8NWCYR1Q1xULPQSAitS5Ku3w09DFIDAc01VZOI/b9IiQCfJAw0jHv
	C/PdzIEFnGnRTv4yRP7LIx4xMq393lDyVPxpkIJudtbdMHpCk4iufS1z1EloLagJdDtI6bs7OmZ
	s0X7y/bdyVn1My8F7cMWuw3swKwA1E+UT7kXrHB0PjLj5g44kQiAyB2pDOQbFtW8+EwZZqoesKn
	3Gzd5ro/UwzdgIOe/pQNfda8G8Z7a4ZklutHuWwLBeefDjjjUp6tBhlVs/B+xRJrAyMjdzEh6Y5
	pxnjA2ZFalEUC5ALC9cpIJOd5tXvoONTRXa4v4QSqcbuh83H
X-Received: by 2002:a17:90b:398c:b0:382:1a6f:ba3b with SMTP id 98e67ed59e1d1-3933b7532e0mr8794391a91.5.1786740338924;
        Fri, 14 Aug 2026 13:45:38 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ebc08871sm3943246a91.16.2026.08.14.13.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 13:45:38 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/UNIPHIER ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ASoC: uniphier: aio-dma: pass chip to irq handler
Date: Fri, 14 Aug 2026 13:45:36 -0700
Message-ID: <20260814204536.38010-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The irq handler takes the platform device and calls
platform_get_drvdata() to recover the chip.  Pass the chip directly
as the devm_request_irq() argument instead, dropping the
platform_get_drvdata() call.

Assisted-by: opencode:deepseek-v4-flash-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/uniphier/aio-dma.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/uniphier/aio-dma.c b/sound/soc/uniphier/aio-dma.c
index c01eae55d4fc..389a45319dfc 100644
--- a/sound/soc/uniphier/aio-dma.c
+++ b/sound/soc/uniphier/aio-dma.c
@@ -66,8 +66,7 @@ static void aiodma_compr_irq(struct uniphier_aio_sub *sub)
 
 static irqreturn_t aiodma_irq(int irq, void *p)
 {
-	struct platform_device *pdev = p;
-	struct uniphier_aio_chip *chip = platform_get_drvdata(pdev);
+	struct uniphier_aio_chip *chip = p;
 	irqreturn_t ret = IRQ_NONE;
 	int i, j;
 
@@ -263,7 +262,7 @@ int uniphier_aiodma_soc_register_platform(struct platform_device *pdev)
 		return irq;
 
 	ret = devm_request_irq(dev, irq, aiodma_irq,
-			       IRQF_SHARED, dev_name(dev), pdev);
+			       IRQF_SHARED, dev_name(dev), chip);
 	if (ret)
 		return ret;
 
-- 
2.55.0

