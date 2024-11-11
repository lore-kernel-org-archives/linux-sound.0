Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD7B1A3BD8
	for <linux-sound@vger.kernel.org>; Mon, 11 Nov 2024 16:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731344102; cv=none; b=GO4zSQLGdpXyzUob394xJC3pLaJuDF/tbneMXspiE2oZqKmzOzyjiG2ZlFJHQtByQcd8U3kd4S6+e8R7aybEpX2CcIqKVv+Wh8jt+RkZ98gVESewCDjVu1LfpAnlbwC0GdGN/Gz/eOIQkUIqVHdciJ79r//MWot2CMfilcH5lM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731344102; c=relaxed/simple;
	bh=9M5joJfbBbQOWbKmJHrfp9RqR5OA1YrFL+mvdsXfwas=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B2q6W0+kwedBHy8a0GXCxrOv6UiJq9jc8T/wmveMkzGBnzf8leWZ6K/xZrJ1wW/x9Mwm0uhwC12eKEaDdh/+eEcDexO9TKA22e2YRmDOisCnDIFzC67ig6W9FX9VAqa+b/2DMjQ9/IuAa7B2DDCEsvX4jrSdK085vifL5Bgdl9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=zAeSmFZ9; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="zAeSmFZ9"
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 072138918D;
	Mon, 11 Nov 2024 17:54:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1731344096;
	bh=W0qczkU5R7LU/mqh3QQcPqYxgGgt7r7J8yawehsjsGw=;
	h=From:To:Cc:Subject:Date:From;
	b=zAeSmFZ9MLWnYo01f7ReZnjSBbMoCGDTJCG3dolUgQeHlAsV+uB9xqvJ63KQz5n+V
	 3w0XZbXcnHjY0yOcsUO/CdmC4DlaJOCJ4f+gJ2Rt6DCrWizPzWt1uIyYumngG+0xA7
	 E+tPhnwS2KoeTDaQZtqKINFZl08c3ifof654ULZdvdUfFXcBB1DP65niLci01U0Omn
	 TrYuM8ltbnEb2TxRJivMyHe9BiS0N03nbQvKCfgY+YAxtUaBLG/ggXpF8GrkvFmFCa
	 KrntTCY5wNsQQDLQGGPMark2cEHtM74XSR23fa5flBjpzEbD9QqGtbkDJ2TZDnaV8J
	 hU4kLLrmQUmWg==
From: Marek Vasut <marex@denx.de>
To: linux-sound@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Chen Ni <nichen@iscas.ac.cn>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: max98088: Add left/right DAC volume control
Date: Mon, 11 Nov 2024 17:54:04 +0100
Message-ID: <20241111165435.113086-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

Add left/right DAC digital volume control knob.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Chen Ni <nichen@iscas.ac.cn>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
---
 sound/soc/codecs/max98088.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/max98088.c b/sound/soc/codecs/max98088.c
index adb17a458ca3e..d679bd9175ebd 100644
--- a/sound/soc/codecs/max98088.c
+++ b/sound/soc/codecs/max98088.c
@@ -480,6 +480,9 @@ static const struct snd_kcontrol_new max98088_snd_controls[] = {
        SOC_SINGLE("INA Volume", M98088_REG_37_LVL_INA, 0, 7, 1),
        SOC_SINGLE("INB Volume", M98088_REG_38_LVL_INB, 0, 7, 1),
 
+       SOC_SINGLE("DACL Volume", M98088_REG_2F_LVL_DAI1_PLAY, 0, 15, 1),
+       SOC_SINGLE("DACR Volume", M98088_REG_31_LVL_DAI2_PLAY, 0, 15, 1),
+
        SOC_SINGLE("ADCL Volume", M98088_REG_33_LVL_ADC_L, 0, 15, 0),
        SOC_SINGLE("ADCR Volume", M98088_REG_34_LVL_ADC_R, 0, 15, 0),
 
-- 
2.45.2

