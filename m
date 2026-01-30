Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E56E30BF68
	for <linux-sound@vger.kernel.org>; Fri, 30 Jan 2026 16:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769788836; cv=none; b=IeMRtgHhIz+TSSYZC141t4eNzzAEhWQsSy6BfMSrisvNKdUDRGSuWU3CmuXq2bHKTjgDf6Hs2Rum4vqOoYoBlIHQdcgyVlhMQE1WuccQYB6EpmqpntfHvIlw/Su6MGg0QTgj/mAu9jzxSeUAkj42++NG6KptHWFQXqaWUdQaD6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769788836; c=relaxed/simple;
	bh=0/im8kx0zPyEBLQf6ubHULC1bBWHvmxHWRDfS1wMOAA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R774EHuuEnCm6KNbrfM5J4sqYng/oCc1f6fWdV7HFwEnxYrmAbaEQGI05/9b5IlgDw4Q66u/xZ+OOoMVR6ntSCJKkIByFByvX9MoS2PmwQnY7wam1i5JbieKqeQYR7hZfbALv9wKCrfkhLPpBl5zM9gE54pRRgQNqHSE3piaxNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UKXLP7IT; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UKXLP7IT"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a79ded11a2so16212005ad.3
        for <linux-sound@vger.kernel.org>; Fri, 30 Jan 2026 08:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769788835; x=1770393635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLDLL3kyEUxzdubW/tmfOQW+ssbXyES9ltcFQWfgmXY=;
        b=UKXLP7ITFwWKDTsJJC/YrnCVM49SgPI2WlQ2DmCaMBdMGYCcDJQLKTPdGnUisSuGMo
         bPy/IlR+9VlEPWP8zSj+T044FKT1HjyUq6tNiDp0Cdw22dfVxdTP2bQZiSVBJpmmBP+b
         NP5KM4bDUeNF0ki7vbBfCik4Bmm5Xb8ao2/7D1mqD7jFn0KqaCULhdguqs8K3hWTfljm
         kyG3wzbTaVt8dF3StVXK/QfcxcJQVxf29t+jD0TX5vt1TQnHmlXgafFrrDWkjhIgrCxr
         z9WNUu6oLUNqS6aWLAmf6zPGQfGwl5ZcmpxSrV2mv1YT1cTDehJa68p6/tZi9x9wBaZO
         sT9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769788835; x=1770393635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hLDLL3kyEUxzdubW/tmfOQW+ssbXyES9ltcFQWfgmXY=;
        b=wkm3dsKs5/hmC2qL+/DGkgFekm9GploEsMZiEjZ8ILa3HC+59U1rZ+GnN+JadtaUT8
         5y7z1+xEOv5bxo0bUvxO8nRBKDz+9xflV4i/Q5kyJeO5LPVJXlzk9MNrNVlPH1/r3W3v
         FrEEqGEleRB374X8Re/gwzCZcq5u39yF4KXSnvNZMX9k6kmcUEeiNkf0B5M3bTNyu5IV
         BNWgjzzzZFV/wurOUxugbAqJPyIZbpnITkSO871NWQ+73GLna/kdxaklGFLp5lBG5clX
         t+/IV72C36fDA7u6kaqIK3ZOkJ+Sbykjj7z4/ue3ezDOV7xwphTGNaEH2mQjeICb+3RJ
         r7eA==
X-Forwarded-Encrypted: i=1; AJvYcCXr16sPMInPnBwXgu3GIQJQXNAHcafY12qUzREx2xxwNS3QomUuj5HZ2dq5fxgSrvlo28Rd3mRjEcNQKA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu6DkCI4AB5r12QgYyIoBAiFbEPKF+/YtOIBHczQ2uj6DZO1oq
	aCslDVPHmgavnPCVjMVy19rbJGM2aBEl7mvQkJNibSTR8yWdKPkdFhL1
X-Gm-Gg: AZuq6aLKVCVCy6fstXZcuBe0xnTiDrdsURlHnjBkrHTiYFdpAf5TcHaVQRx5wl5fWhi
	T76rjrzAhT99gFF+GpuxVTlHyAdGB52TK3eea5ZstbgTDrxMcFv/OygrmVG9qNka00hEaExsGvU
	+wxpEnGFESyS+4b0vrRkIBrcUU7phvFeEUSBtRUWScJMnYg9dzQ8hiOxfOTNCOQ4qGoSNW/MmzN
	wnSQTy5pQSRHc/ErCTUI/LBpkeZYltEAizPCFf8Lev2z9TgRDa9L419g+i/WCoiNw+mRZLgN3w2
	96oriCvgNp4H7Bb/8+e1Swdwt5JmatXoqRg3HJNzu+1u14j7b1NYqxTA/UYfXCWV3w78UZr93ur
	UzS6Cqq1w44rbLa9IvyJqlWwmm3lXMSzj/F9HMJfzzKLx2thxb9cCQXreBO5OVSiMIfX0qwrMjw
	xrGbnojWZENn2ZI8RKI2wH694WEzggWqOl3wrpoX/a9g4KBhb+FnPP+zjezAvpiHctbE7PM1I=
X-Received: by 2002:a17:903:2bcc:b0:2a7:ca82:c198 with SMTP id d9443c01a7336-2a8d9593256mr35115235ad.6.1769788833205;
        Fri, 30 Jan 2026 08:00:33 -0800 (PST)
Received: from LAPTOP-LUFMQ4TC.localdomain (118-161-168-35.dynamic-ip.hinet.net. [118.161.168.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5df0desm82025645ad.82.2026.01.30.08.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 08:00:32 -0800 (PST)
From: Hsieh Hung-En <hungen3108@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Hsieh Hung-En <hungen3108@gmail.com>
Subject: [PATCH v2 3/5] ASoC: es8328: Check errors in set_dai_fmt()
Date: Sat, 31 Jan 2026 00:00:15 +0800
Message-Id: <20260130160017.2630-4-hungen3108@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260130160017.2630-1-hungen3108@gmail.com>
References: <20260129174733.6660-1-hungen3108@gmail.com>
 <20260130160017.2630-1-hungen3108@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check and propagate return values from snd_soc_component_update_bits() in
es8328_set_dai_fmt().

This avoids silent failures when register updates fail and ensures the DAI
format is not left in an inconsistent state.

Signed-off-by: Hsieh Hung-En <hungen3108@gmail.com>
---
 sound/soc/codecs/es8328.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
index 98fc798ff565..a18c3fe22da5 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -592,21 +592,26 @@ static int es8328_set_dai_fmt(struct snd_soc_dai *codec_dai,
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct es8328_priv *es8328 = snd_soc_component_get_drvdata(component);
+	int ret;
 	u8 dac_mode = 0;
 	u8 adc_mode = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
 	case SND_SOC_DAIFMT_CBP_CFP:
 		/* Master serial port mode, with BCLK generated automatically */
-		snd_soc_component_update_bits(component, ES8328_MASTERMODE,
-				    ES8328_MASTERMODE_MSC,
-				    ES8328_MASTERMODE_MSC);
+		ret = snd_soc_component_update_bits(component, ES8328_MASTERMODE,
+						    ES8328_MASTERMODE_MSC,
+						    ES8328_MASTERMODE_MSC);
+		if (ret < 0)
+			return ret;
 		es8328->provider = true;
 		break;
 	case SND_SOC_DAIFMT_CBC_CFC:
 		/* Slave serial port mode */
-		snd_soc_component_update_bits(component, ES8328_MASTERMODE,
-				    ES8328_MASTERMODE_MSC, 0);
+		ret = snd_soc_component_update_bits(component, ES8328_MASTERMODE,
+						    ES8328_MASTERMODE_MSC, 0);
+		if (ret < 0)
+			return ret;
 		es8328->provider = false;
 		break;
 	default:
@@ -635,10 +640,17 @@ static int es8328_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	if ((fmt & SND_SOC_DAIFMT_INV_MASK) != SND_SOC_DAIFMT_NB_NF)
 		return -EINVAL;
 
-	snd_soc_component_update_bits(component, ES8328_DACCONTROL1,
-			ES8328_DACCONTROL1_DACFORMAT_MASK, dac_mode);
-	snd_soc_component_update_bits(component, ES8328_ADCCONTROL4,
-			ES8328_ADCCONTROL4_ADCFORMAT_MASK, adc_mode);
+	ret = snd_soc_component_update_bits(component, ES8328_DACCONTROL1,
+					    ES8328_DACCONTROL1_DACFORMAT_MASK,
+					    dac_mode);
+	if (ret < 0)
+		return ret;
+
+	ret = snd_soc_component_update_bits(component, ES8328_ADCCONTROL4,
+					    ES8328_ADCCONTROL4_ADCFORMAT_MASK,
+					    adc_mode);
+	if (ret < 0)
+		return ret;
 
 	return 0;
 }
-- 
2.34.1

