Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CA439184A
	for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 21:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774389051; cv=none; b=XOgKObww9bWuqIS2Zag/5PoTkOldhY4APmJ1aZPrHluoWRDens/OYuJo0EqGO4W81teHjp5ZNdV4WNBMV7fw3us2m07c4zqznxUpFSE2Et3IHnd4+TaBvqvx//jIyULIQIFgQphROcxBAMBoBzBSqcgESeftcbTyHXDk2fzqBf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774389051; c=relaxed/simple;
	bh=qhZ8R0yRYhIF608sZp9mMMUOurmOgNZ0x6Oaxpa03EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wc9Ti4ZZBtvHAivftCDDdWlx8gB3SsXNRbEYrsIvsyJNchZshsABQsS6uewSh5y4h7w3uAuJllblWxNm8aRO90JVBj5tfQ2saFXKiOY6f33KWlSGMxnY9qqLYFgOsGzLsOaTzi2klk+kge0C+jSj31UR5PJz+vDMsyjzT5xeUHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aec5NogJ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aec5NogJ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486fb439299so48798035e9.0
        for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 14:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774389049; x=1774993849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wcq9y3MJkXUEWL1rs1a0TtufuT0OngDhzvfcDsLp+fk=;
        b=aec5NogJnbgC1jqz6QfYiQPKRSsR8nkTAtVdagXddDg3QOEpuD1K5ukzHl6f0k7X3M
         6NlDUydbiYFAsJ+dyfYJ+vqaxBs9jyFhsT34xYpf6m57APEOayLnWuP9zscP4F3j/4W3
         gjMenoSsrPibbjbr5ulzF2qJlpQJFumH1A17SmM1FqSK/Vba2KXJ+f8VxvlpZYdrMzrT
         4qFQsYxhNskq36pNLg06xg7QoydsX2EiMv5R1SrMOYUyL3HFv1vHsmE6Cb7WYb5V1M5G
         h3MB+out4firFlG6GEqZo001hCQzWIKVzWPqGr+fkresMFOjOhtf3jZrT5/Xb5mFmT5z
         y/IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774389049; x=1774993849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wcq9y3MJkXUEWL1rs1a0TtufuT0OngDhzvfcDsLp+fk=;
        b=DeHPYyDEPIEupvqWIgXqUypyTlRhm4joSJBKVMs/84wvg6yWaz+ij/GBMQtcIw8q2Q
         FoX1cjD4KDVmqCo5oTN9FccRZYEA13xgkJO9SH6EpZGYtF/FwUTJ9eSGgGcMfRDGCnSV
         8xTQRgSZEKerp0vbLsDYElhbCqQVK8naQB5qkAWesmWsFbZ/t4XMaybZZtKswarc+bd2
         YdHx/qGIqCmVbFL8hqI3LUUVjZeclZi4QuWe+m5fTmpfNglgJKhSy31Ya2kToZJi4ShX
         /bxf/t7RXJObYgo3Rn6osre8pSZr6fQgiLPKzpiMqlCku/wpALkwKAoqSUVhbSW0OmtY
         0LnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYDRQ5X/zgZn4JlUcBmff9t80eg5aytXxdpxtNxzUU4PX75sPLp8C6gbcH+rkwseZ0RY3nCQS/LpRR0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs0hv6R7duUq3txFp7eJLhwn57LdsARVwphtW4TzeN0pPMeZTp
	pxfuNDNNL8dIuzJJ1+ErHor9v4UhFrirUaGiwhkbndA8F2fgTmxJXao=
X-Gm-Gg: ATEYQzwWixag6XnmC7Q2dPDhwssppYpvU5iCHYXT8Po1E8KuG1caFPNzCxKtHahhKjX
	HhWhYcJZ10WOALiy3mE6MTcDa8moFp2qwUMTvaHwISlX919PpxzgEXCK/YnWQpLLjEtE47xASPb
	wHDTy9acIPYnODjLus0xyWYNgigOkvoFY9Tdd6CSZIbQQxRKnZ1Hm8UIf0+I8COAqZ0FtUulu9G
	iqq0pgKOkTd3N/A/ASg7PXE9+eqQm7lUr9o+9XD7jidqNsFOgVWbYwPJJ4BWBTEo76O87VMBDV2
	YC3haVVbAu4Lsdviv9PtaNgq5j/YfXx5l5TDgBM8+sY/kCI4+j7Xk3kpH+uBvnEUQEsyBY8z/P6
	QmfxAdJl6YkYahRzpyfLSYxLsxHS0Gp5V85735+uMMNOPzvaeXiTGZ3Kvs/sQREc2kmyfnGpBEJ
	sL8ARosvbMWlwkBOn/XTjV7+YXuVhzsXQyGA0HiKOmGw==
X-Received: by 2002:a05:600c:630d:b0:486:fb0b:ad79 with SMTP id 5b1f17b1804b1-48716046e69mr18717395e9.20.1774389048619;
        Tue, 24 Mar 2026 14:50:48 -0700 (PDT)
Received: from localhost.localdomain ([78.240.217.74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116c0c13sm159316465e9.7.2026.03.24.14.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 14:50:47 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: lars@metafoo.de,
	nuno.sa@analog.com
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH 1/2] ASoC: adau1372: Fix unchecked clk_prepare_enable() return value
Date: Tue, 24 Mar 2026 22:50:14 +0100
Message-ID: <20260324215016.66347-2-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260324215016.66347-1-jihed.chaibi.dev@gmail.com>
References: <20260324215016.66347-1-jihed.chaibi.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

adau1372_set_power() calls clk_prepare_enable() but discards the return
value. If the clock enable fails, the driver proceeds to access registers
on unpowered hardware, potentially causing silent corruption.

Make adau1372_set_power() return int and propagate the error from
clk_prepare_enable(). Update adau1372_set_bias_level() to return the
error directly for the STANDBY and OFF cases.

Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 sound/soc/codecs/adau1372.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/adau1372.c b/sound/soc/codecs/adau1372.c
index fdee689cae53..6345342218d6 100644
--- a/sound/soc/codecs/adau1372.c
+++ b/sound/soc/codecs/adau1372.c
@@ -782,15 +782,18 @@ static void adau1372_enable_pll(struct adau1372 *adau1372)
 		dev_err(adau1372->dev, "Failed to lock PLL\n");
 }
 
-static void adau1372_set_power(struct adau1372 *adau1372, bool enable)
+static int adau1372_set_power(struct adau1372 *adau1372, bool enable)
 {
 	if (adau1372->enabled == enable)
-		return;
+		return 0;
 
 	if (enable) {
 		unsigned int clk_ctrl = ADAU1372_CLK_CTRL_MCLK_EN;
+		int ret;
 
-		clk_prepare_enable(adau1372->mclk);
+		ret = clk_prepare_enable(adau1372->mclk);
+		if (ret)
+			return ret;
 		if (adau1372->pd_gpio)
 			gpiod_set_value(adau1372->pd_gpio, 0);
 
@@ -829,6 +832,8 @@ static void adau1372_set_power(struct adau1372 *adau1372, bool enable)
 	}
 
 	adau1372->enabled = enable;
+
+	return 0;
 }
 
 static int adau1372_set_bias_level(struct snd_soc_component *component,
@@ -842,11 +847,9 @@ static int adau1372_set_bias_level(struct snd_soc_component *component,
 	case SND_SOC_BIAS_PREPARE:
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		adau1372_set_power(adau1372, true);
-		break;
+		return adau1372_set_power(adau1372, true);
 	case SND_SOC_BIAS_OFF:
-		adau1372_set_power(adau1372, false);
-		break;
+		return adau1372_set_power(adau1372, false);
 	}
 
 	return 0;
-- 
2.47.3

