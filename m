Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429263603C3
	for <linux-sound@vger.kernel.org>; Mon,  2 Mar 2026 11:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772452328; cv=none; b=rOrTDfbHS+7CZ4bdQSnP4pIis2dl/Pp9pVLQgfolDGtWVYLVw45ovszn9GlDyHJrt2D+bVD/bmJycnr4VgY4hb9QneD7pNaLSXKne52g0OVUAQ9nJlyFDR0IvatDplxEbnGelfqId9AouD5lxcb0+kQOZZCjL/yV6LuDvDOiWhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772452328; c=relaxed/simple;
	bh=Kq1VY0elzXLE2DLt17TjbEeYDzgRYt9Uu6isa+YAFhs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lB+gz0Jb+u3DpF+EGRt9VbudoONVt8p6359GwtGjAn8I+5+qfX16Pbm1G7/dY+7uzopBbSGOEKO9K1SnGMOPEHQUvGBfAxMaJKtocF37G+rS0IuGMbomIxoT6O+LY4icUexaJ0kJ8Z3MNVxiuTG7Qjfb88LSYw0IkyqCoLYpSGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FUQJE5aL; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FUQJE5aL"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-389ff3f41f8so41766271fa.3
        for <linux-sound@vger.kernel.org>; Mon, 02 Mar 2026 03:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772452325; x=1773057125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gygxDzTWOeNJWfx2seOR9/LrkpWOSWrJ7INpKfiRY4k=;
        b=FUQJE5aLHrmddr+DXa3sLOXUnh11Rs+4oc2NSDVFobMFca70AnV1EU9PBREr+T1LYw
         Qp56v3pJ915koQ+MyVo0o88XI+UzOuRaaCT+eRRM7unjlpB62iWYWes5S9GkmySqTY+E
         7PKeg9/jsy+qo8hqRBKxq0rXGLic/7u3TXb9SefjBB+rP5DcWCNrT9IRosCAhOr04LBH
         L6I9/Sk6NicGbyershNAjfLlMXVNBOfvjJnGAJiGUJUnin0x6yDOYjGsi6sUxwrdRp+f
         tEcyQFvizFyku2dIln41LIcfXw89w88hqup40pBNfOzMM2R5PEGa2sW05/V58WlgglCj
         TgSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772452325; x=1773057125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gygxDzTWOeNJWfx2seOR9/LrkpWOSWrJ7INpKfiRY4k=;
        b=sPwSAhO7S9Js6cF7eAH231gDT4dgA5e8kYqZDnNsV19RAKQ8gb7sYjEzfV045Kq9bE
         L8Vvtc7PY7ygjNLSnKnfo6gVrzQpsJ+sd6/8WBtgdj37FVquF/Z1p+bD9EvHYZomXXEq
         d5fN55uoDQPTs1oOsDvXrAFpF4SS08cBDN7yie8Aslzp2YKbBDxmiN09in8DgR0he8jW
         Krs+T4og/G6VcXfy2oTBEh9fSNih9VkPsUD+mY3f3gCMAZ7zwBjTbn2iJffIiXZoLO3y
         wWw5TUvV3GpRgoTC8StMAPvxnPKv/wP54WJBuUg3o1Od7lTyU+un37lyb+ESANcasY8q
         oIRw==
X-Forwarded-Encrypted: i=1; AJvYcCULFy1UWmw87Xkl1Jav82GpblV+ajU8hLPeA5/K2Y6U4dmS3htT9CvJHGOV1dEXGogTmq4HyfbS6Eu+oA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzefqXeGjg3T07ndgwWYnr6L/PEundLo1jn1dxq81ki4vULcqgY
	X07QUBvver57CdeNPHPV+KK/0dxftAqlDWvPKo76PhAGL/wB68Qva265
X-Gm-Gg: ATEYQzypsN+Gh4LPJj/9x2oXPLPa3oRwLr7nMHvNBJDxMOKEZdjTmx65oNG/IA/mKb+
	RK4meYEo+kipOyLfwIJCujhFkDfheQEjDnW5B4Gx2LIbZxPMZFvpOnBDPaM+R/uhontWTuxJs/k
	YJLWZf292yNS2A+JvZ7lczO3+CETFcmehzoXQJidIk2Iszb2VYZXo1xib9EQCfFgeLOfv+QvTAT
	TV142pf3XEKoHeiToquvXIYI+kMAxVxNEnxvZlvY2Yuc7QRDy3GB3MMDai0MJAhf2lzQmNlF8Up
	rU+Xg61Uw5hnkfh9T0Gafy6hyavTUnLbdmlYMNsYn9sv5ZLqsDWyCWetfyz7q5ujq938iGLFOlP
	F4Pm6IyZHDawYV/bT45uWOOnSicnmEDE1R49+24oUNiOVZoD6yabx9vgb1BiU8OIJ3Nu9hMHIcR
	ahX9b8XxEHf8aS+g8YtydTxUYqdM3/InQ=
X-Received: by 2002:a05:651c:2352:20b0:387:323:f6e2 with SMTP id 38308e7fff4ca-389ff13694amr61997631fa.9.1772452325253;
        Mon, 02 Mar 2026 03:52:05 -0800 (PST)
Received: from vovchkir.localdomain ([95.161.223.42])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-389f2f70aa8sm29812691fa.19.2026.03.02.03.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 03:52:04 -0800 (PST)
From: Vladimir Yakovlev <vovchkir@gmail.com>
To: Rajeev Kumar <rajeevkumar.linux@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Vladimir Yakovlev <vovchkir@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Brady Norander <bradynorander@gmail.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dwc: rework pm functions
Date: Mon,  2 Mar 2026 14:51:59 +0300
Message-Id: <20260302115159.776850-1-vovchkir@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using a power domain, we must completely disconnect the module and
turn off external signals when it is not in use and turn everything back
on at the right time.

When entering system_sleep, pm_runtime_force_suspend() is called, which
turns off the device if it was running. When exiting system_sleep, the
opposite occurs: pm_runtime_force_resume() is called.

Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
---
 sound/soc/dwc/dwc-i2s.c | 38 +++++++++++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 28001e9857d9..1d99d42400c3 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -481,8 +481,11 @@ static int dw_i2s_runtime_suspend(struct device *dev)
 {
 	struct dw_i2s_dev *dw_dev = dev_get_drvdata(dev);
 
+	reset_control_assert(dw_dev->reset);
+
 	if (dw_dev->capability & DW_I2S_MASTER)
-		clk_disable(dw_dev->clk);
+		clk_disable_unprepare(dw_dev->clk);
+
 	return 0;
 }
 
@@ -492,10 +495,18 @@ static int dw_i2s_runtime_resume(struct device *dev)
 	int ret;
 
 	if (dw_dev->capability & DW_I2S_MASTER) {
-		ret = clk_enable(dw_dev->clk);
+		ret = clk_prepare_enable(dw_dev->clk);
 		if (ret)
 			return ret;
 	}
+
+	ret = reset_control_deassert(dw_dev->reset);
+	if (ret) {
+		if (dw_dev->capability & DW_I2S_MASTER)
+			clk_disable_unprepare(dw_dev->clk);
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -504,22 +515,16 @@ static int dw_i2s_suspend(struct snd_soc_component *component)
 {
 	struct dw_i2s_dev *dev = snd_soc_component_get_drvdata(component);
 
-	if (dev->capability & DW_I2S_MASTER)
-		clk_disable(dev->clk);
-	return 0;
+	return pm_runtime_force_suspend(dev->dev);
 }
 
 static int dw_i2s_resume(struct snd_soc_component *component)
 {
 	struct dw_i2s_dev *dev = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dai *dai;
-	int stream, ret;
+	int stream;
 
-	if (dev->capability & DW_I2S_MASTER) {
-		ret = clk_enable(dev->clk);
-		if (ret)
-			return ret;
-	}
+	pm_runtime_force_resume(dev->dev);
 
 	for_each_component_dais(component, dai) {
 		for_each_pcm_streams(stream)
@@ -1030,6 +1035,17 @@ static int dw_i2s_probe(struct platform_device *pdev)
 	}
 
 	pm_runtime_enable(&pdev->dev);
+	if (pm_runtime_enabled(&pdev->dev)) {
+		/*
+		 * runtime_pm will control clocks and resets,
+		 * but if RPM is off - turn on clocks and resets permanently
+		 */
+		if (dev->capability & DW_I2S_MASTER)
+			clk_disable_unprepare(dev->clk);
+		if (!dev->is_jh7110)
+			reset_control_assert(dev->reset);
+	}
+
 	return 0;
 
 err_assert_reset:
-- 
2.34.1

