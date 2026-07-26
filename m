Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CD4374E67
	for <linux-sound@vger.kernel.org>; Sun, 26 Jul 2026 01:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785027929; cv=none; b=Ua3yP5ApnpfVaabuUnEMiZkXw89qLpz3KjHa3lqunafsr5IgoVa8uCqpzhtc6KuhAHv6npXHfQ2/Mceje5LcQ5GyBx+opOqVbx6E2fA/D/BH+Nuar1zopY2mKBxlRvUEH1wunUEEqUCnz5+3QPg9jBLFAa6cwSkSwmPdYny7r+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785027929; c=relaxed/simple;
	bh=smd9g933g2YumC9ikMtrZHDJtNudStAOek2JZaN4IYw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k9Cx+71fn0cxo/ry4C5KnxSS3LUZxVt6l7ShoQWb22GtPtH5swnvkQS2nWzfcQurCpv6i8KvfkwmD0AjL/mJrnzzzLYnTPvvulzLor3xtZyuin8GwOH08WEmou0lO5WYEwSIl41maqBCk/ycEOSbMweE3oEN4IxYyMG8ujeiUEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GKW/GgiU; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GKW/GgiU"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-381b831d535so1938589a91.0
        for <linux-sound@vger.kernel.org>; Sat, 25 Jul 2026 18:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785027927; x=1785632727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nQWq4NLYnPycYe7rLpw/+6YESy9OQ6gi1dCJvodYH4Y=;
        b=GKW/GgiUbXM74YjcJ9w1ppuAScbW3e33HSvUcxSQRZUlFOWhzfN2mx4XRp9Pegs8Rr
         zmIGss6ThpsXZ8BeuyTwFazcGdHTlmfJX6qYCNz09w+ZqGyVdDzRZmDMEu3jvJou/+AL
         YNne40B1/EZZMRgdmnbaHjNJWSLWurdEVDNXuTEUoMgQcxBnqc0CCPq+ownzCvhsIGYQ
         02rcrkL9IcfP3jpru+6c3YwxdsNUH7nSWfMgm6LZMIrGB5MBp0YDzeJLsS5382JaKj6d
         uTk1pajp46LZOp7yBqpDT2DmSIJybnaRVZIYol1KymP8PyyOF7D918LcvDQhABSdvQYr
         j3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785027927; x=1785632727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nQWq4NLYnPycYe7rLpw/+6YESy9OQ6gi1dCJvodYH4Y=;
        b=bI8Hdo4Ztm0bxls+snn27syKBYfglnLIw95XHSUJab34Y8UDJrWGfS7to62UEOB+3/
         sq9CjOesdonDwt6xzJwSO4LwTHeNyvF1Dxl9r1iDMA9SznRrnO8ninrlmZtmVqgHkT/3
         KOMVxfmYeVBMVqXJ00lkLGBJlHE05TL1H8NDmPYnd9o14s48nmVjn3uGOxQ9M6w5T1nD
         pNbDQdHOwtxUUvIMJ/ECIgdY/0WvK2qHGe30HSQobF8kmDAvsbP8nSLjwTBHqp/odY4L
         4LqwPa/yKDlL8K5WdM3ZLBnlm3+eAmqHFkgTiSRJgj9xefdW5sr5nIFc36qEksyozM7V
         dkQg==
X-Forwarded-Encrypted: i=1; AHgh+Rrruc4b7vFeXZ3oWGApTwllgtRgsCHTeHv+ZN2Pq7riDC0zSIJRHqRuXRGcWzWtYmHlX2E4kBY1rGtNkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6hIWXzSg172nAMpr08iRQTUBDgo66ufHIJJcF6VfCGuOQXEvh
	njvDOjELJ/8VUWtKM6uknf13CBScQiyvtL5W4eBvaphErlG9seiyhj6n
X-Gm-Gg: AR+sD12P4BecIBpqkpZB53M6HmK5+/y5JvgEbkblZl8wKFHOoZTlE2AFCBhbMXVbn7u
	LKjrVN9ZYlOe+pXIyhu8AMMHjfhimSYloWmmTcA/VYwDWGdG/C6pbc5f9m+NohWynQeikruQIsC
	Vs3xUquPg7/JUC1ouOURAxF+Rq/bI27d2NB468NJdSZid+dlSPBV0A5YNcDrn+f3btYt3FlVZWD
	OZi4i5qg+P9WvkG2jFF6hs24FMuet0OT6L/skKQv+kv0kuvxhgscyEpdCJRx/MsVAtjt/SaCWqH
	Q7TZ4mQkJveFXSI8IEBIm5tJaRKDVOd0Yviu8PWot3fg2yR92M7ADAU+ZaHcXAJzRop/pL5YGpb
	wNKK5TV5PPnynyJ9RmxWlhPYlLcwPL/XcugtiX4cHXZIa7UPK5/zPSS50/O0JIrffyi/brsoW9f
	5A+a/sgD8b/HOqzpPVh+xSke2EAWI04tMdMxRwbUTR+F/pLHC++xGfhDiLq2zRxsMM4g==
X-Received: by 2002:a17:90b:1cc4:b0:38e:64b0:8bce with SMTP id 98e67ed59e1d1-38f296554c0mr3457687a91.20.1785027927359;
        Sat, 25 Jul 2026 18:05:27 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:e2c2:1f24:32d5:9d51])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e0f4a039asm11821445c88.9.2026.07.25.18.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 18:05:26 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] ASoC: tlv320aic32x4: consolidate programming functions
Date: Sat, 25 Jul 2026 18:05:13 -0700
Message-ID: <20260726010519.117805-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260726010519.117805-1-dmitry.torokhov@gmail.com>
References: <20260726010519.117805-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Consolidate setting up of GPIO functions instead of repeating almost
the same code block 5 times.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 sound/soc/codecs/tlv320aic32x4.c | 90 ++++++++++++--------------------
 1 file changed, 33 insertions(+), 57 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index 87b155599e94..6b3ddb89f692 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -222,25 +222,31 @@ static int aic32x4_set_mfp5_gpio(struct snd_kcontrol *kcontrol,
 	return 0;
 };
 
-static const struct snd_kcontrol_new aic32x4_mfp1[] = {
-	SOC_SINGLE_BOOL_EXT("MFP1 GPIO", 0, aic32x4_get_mfp1_gpio, NULL),
-};
-
-static const struct snd_kcontrol_new aic32x4_mfp2[] = {
-	SOC_SINGLE_BOOL_EXT("MFP2 GPIO", 0, NULL, aic32x4_set_mfp2_gpio),
-};
-
-static const struct snd_kcontrol_new aic32x4_mfp3[] = {
-	SOC_SINGLE_BOOL_EXT("MFP3 GPIO", 0, aic32x4_get_mfp3_gpio, NULL),
-};
-
-static const struct snd_kcontrol_new aic32x4_mfp4[] = {
-	SOC_SINGLE_BOOL_EXT("MFP4 GPIO", 0, NULL, aic32x4_set_mfp4_gpio),
-};
-
-static const struct snd_kcontrol_new aic32x4_mfp5[] = {
-	SOC_SINGLE_BOOL_EXT("MFP5 GPIO", 0, aic32x4_get_mfp5_gpio,
-		aic32x4_set_mfp5_gpio),
+static const struct {
+	unsigned int reg;
+	struct snd_kcontrol_new ctrl;
+} aic32x4_mfp_cfg[] = {
+	{
+		.reg = AIC32X4_DINCTL,
+		.ctrl = SOC_SINGLE_BOOL_EXT("MFP1 GPIO", 0, aic32x4_get_mfp1_gpio, NULL),
+	},
+	{
+		.reg = AIC32X4_DOUTCTL,
+		.ctrl = SOC_SINGLE_BOOL_EXT("MFP2 GPIO", 0, NULL, aic32x4_set_mfp2_gpio),
+	},
+	{
+		.reg = AIC32X4_SCLKCTL,
+		.ctrl = SOC_SINGLE_BOOL_EXT("MFP3 GPIO", 0, aic32x4_get_mfp3_gpio, NULL),
+	},
+	{
+		.reg = AIC32X4_MISOCTL,
+		.ctrl = SOC_SINGLE_BOOL_EXT("MFP4 GPIO", 0, NULL, aic32x4_set_mfp4_gpio),
+	},
+	{
+		.reg = AIC32X4_GPIOCTL,
+		.ctrl = SOC_SINGLE_BOOL_EXT("MFP5 GPIO", 0, aic32x4_get_mfp5_gpio,
+					    aic32x4_set_mfp5_gpio),
+	},
 };
 
 /* 0dB min, 0.5dB steps */
@@ -955,44 +961,14 @@ static void aic32x4_setup_gpios(struct snd_soc_component *component)
 	struct aic32x4_priv *aic32x4 = snd_soc_component_get_drvdata(component);
 
 	/* setup GPIO functions */
-	/* MFP1 */
-	if (aic32x4->gpio_func[0] != AIC32X4_MFPX_DEFAULT_VALUE) {
-		snd_soc_component_write(component, AIC32X4_DINCTL,
-			  aic32x4->gpio_func[0]);
-		snd_soc_add_component_controls(component, aic32x4_mfp1,
-			ARRAY_SIZE(aic32x4_mfp1));
-	}
-
-	/* MFP2 */
-	if (aic32x4->gpio_func[1] != AIC32X4_MFPX_DEFAULT_VALUE) {
-		snd_soc_component_write(component, AIC32X4_DOUTCTL,
-			  aic32x4->gpio_func[1]);
-		snd_soc_add_component_controls(component, aic32x4_mfp2,
-			ARRAY_SIZE(aic32x4_mfp2));
-	}
-
-	/* MFP3 */
-	if (aic32x4->gpio_func[2] != AIC32X4_MFPX_DEFAULT_VALUE) {
-		snd_soc_component_write(component, AIC32X4_SCLKCTL,
-			  aic32x4->gpio_func[2]);
-		snd_soc_add_component_controls(component, aic32x4_mfp3,
-			ARRAY_SIZE(aic32x4_mfp3));
-	}
-
-	/* MFP4 */
-	if (aic32x4->gpio_func[3] != AIC32X4_MFPX_DEFAULT_VALUE) {
-		snd_soc_component_write(component, AIC32X4_MISOCTL,
-			  aic32x4->gpio_func[3]);
-		snd_soc_add_component_controls(component, aic32x4_mfp4,
-			ARRAY_SIZE(aic32x4_mfp4));
-	}
-
-	/* MFP5 */
-	if (aic32x4->gpio_func[4] != AIC32X4_MFPX_DEFAULT_VALUE) {
-		snd_soc_component_write(component, AIC32X4_GPIOCTL,
-			  aic32x4->gpio_func[4]);
-		snd_soc_add_component_controls(component, aic32x4_mfp5,
-			ARRAY_SIZE(aic32x4_mfp5));
+	BUILD_BUG_ON(ARRAY_SIZE(aic32x4->gpio_func) != ARRAY_SIZE(aic32x4_mfp_cfg));
+	for (int i = 0; i < ARRAY_SIZE(aic32x4->gpio_func); i++) {
+		if (aic32x4->gpio_func[i] == AIC32X4_MFPX_DEFAULT_VALUE)
+			continue;
+
+		snd_soc_component_write(component, aic32x4_mfp_cfg[i].reg,
+					aic32x4->gpio_func[i]);
+		snd_soc_add_component_controls(component, &aic32x4_mfp_cfg[i].ctrl, 1);
 	}
 }
 
-- 
2.55.0.229.g6434b31f56-goog

