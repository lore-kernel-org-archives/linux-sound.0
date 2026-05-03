Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903843B2FEE
	for <linux-sound@vger.kernel.org>; Sun,  3 May 2026 12:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777811035; cv=none; b=IFXl/jTBfySTy0aA9J4i1mFQnmO8OlLTeGxHhRRftKWj8OiLPEJBCZX2tU0XvsB9hJW9tNvSuhAZDVD2S4yI+1gTgS6P2iSKaFdKFJeO2VNGi4Do4FWpwdMq5WDDs+Ai0HBwhbBnFNr28k9cBfK9wW7ASOQUapqGLjnvPsP+kdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777811035; c=relaxed/simple;
	bh=MKnHF5kGPsCR4N7ujUtM10eo1Pl10rQIAl+7znui3Yw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CvzNWxR33T0sZ2/6z2JWgFP5yVdjX8fS693jgU1EnZ2nsOLb63gTrBJq6+0Vy9bVDV4v52OrnLejP0VVqVOGI/vWwgdPbsS/cedR/6bZSDQ0z0Mouy7A3JkrKrov40Czs6ez54q0wFkksgUV0geDAc38hYEyjPladkGt3MXxBqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a/I3cZVd; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a/I3cZVd"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36525730172so599661a91.1
        for <linux-sound@vger.kernel.org>; Sun, 03 May 2026 05:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777811032; x=1778415832; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRIl6J1CxzKB9h9sfgFUzYhFZthyT2nAY7hrklEwHCo=;
        b=a/I3cZVdqZJBUg3WZXTng4mzBvlUq1X7Lz552/ajhwWg9XZ6skWCUflxpPOXVjir0D
         SE/PF1sM+APMaE+vkJnuCfck8khBXoBQx/++HJlw5yZFBIBn37aPub7EATAbZ3Olwgxy
         LUf4+BXa1vTfcPSLBhLkY/5xmQqJhdfz+SPiKW3PQ5S4RI3iUwtBocf/9VNGGC18/344
         GT+yB20FUfD9u+/HqYuDMZ3LwX3SU4zFBM/FHmrrpMpyTqj5xiF5xLkXr9lr1pPFZNZK
         40/0RFxChuV8hG1hln2/SQtoB3qUhUoouM9q+iZ7FISAxdVrvS6ECSjil606w3i0R6X0
         R6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777811032; x=1778415832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xRIl6J1CxzKB9h9sfgFUzYhFZthyT2nAY7hrklEwHCo=;
        b=j0/xAkWPimFqMPqkaouKgAnMgIEJQ+O7YmsmF/ko1SGklrOepXeJyUUmg1X93EMEBm
         XWGVBaZsRO5wvF4H8UH9w/fD4f+UPAGzSl1agYJPXotqUYhZWNSkGA5E91Lzp+h14Nhx
         CCa/X2QXQHeG+VBH8sEM2rzON71noMqxj3Hntkyw9E/0S5wTPozTHvnWCah05d9SdR/7
         rQqAXKVOQCpiJedfWj/7MYGAvq8HMjQS2bcCcLHODB2aK8WtMthpH+P9oYAslre30V9G
         xL/VxRJB/M+jhioFfWrlhS9tnd2BAda1IyE9dU2gqefkGvw+9wNK5pSSAHgl3qbB+vBf
         uhOg==
X-Gm-Message-State: AOJu0YxXyUjOLaTjx6Xgx/llr8BC3zesce5NGqcUBFy96s3FSFab6ggX
	83gbGn7BCmO5LIot+vCHCRbdIyYetZBUprNksQyNvs/jZgGFNI1TW/mI
X-Gm-Gg: AeBDietGPOUdskIfM/Y5fqCWmggRG+b4VaVYPC0k+gaBczOW/hfyP9wFrW7iVDXEWNd
	KfENVxP5qc/SYiWj7BAGhzX2M2JvO25CEvlR3wsuozZQPYPvaQO0rK4BzRnIfvcwVQnq7i77uCs
	TDvLqcQnng5YhgQ+lLrOtLSFksRWo0O4uQlHcKqBLhPXcau4Mfk2qx9Q5vE86wAOb2n3S8H9wYr
	IQiHaRp6vWOVM6qsrDSqClNhJdb9DKGgJhNBUXbjdyLzuzmeRTW1Mc+F645j848RzErEjQGzEyW
	7xlmBamZ8X251X0Nh7n0ZvU8eq50lXYvIPMHTVDBxTU2P9hzTS2A8FwXpA1rk/hYTaRVDKiYxPX
	ZnD3W0kqKnQTjeRxFFIJX1YWFkGxP8pbKPXYF3wYTMNcIjgM3xpOkZUxTXLzFmCfOah5+Y9Yxjq
	ff+4uykZU09RB7rb1kedU8KLx/tozJnlEifq3QVpO2jJKfWokAsUxoxNE+Hy0OqUFYunJPyFSnT
	jE3my4p191EUG5T7Qmhm7t9ftZahL8CujbDD3WiuD8xjMqxu+mtf0k/HYYo4JuwCQW7DdgDmrOn
	TdeLNJgxXLM=
X-Received: by 2002:a17:90b:35cf:b0:35f:b5df:456 with SMTP id 98e67ed59e1d1-3650ce7e5c9mr6377278a91.18.1777811031895;
        Sun, 03 May 2026 05:23:51 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8023e6eabesm2098464a12.5.2026.05.03.05.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 05:23:51 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 03 May 2026 22:23:23 +1000
Subject: [PATCH v2 1/2] ASoC: tas2764: Deal with bogus initial temperature
 register value
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260503-tas27xx-hwmon-fixes-v2-1-208e802be4ac@gmail.com>
References: <20260503-tas27xx-hwmon-fixes-v2-0-208e802be4ac@gmail.com>
In-Reply-To: <20260503-tas27xx-hwmon-fixes-v2-0-208e802be4ac@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Sen Wang <sen@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3388;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=MKnHF5kGPsCR4N7ujUtM10eo1Pl10rQIAl+7znui3Yw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnf7Xyvn3p16mylh1j2t59a2y3fGqgtVVeR4oneY2ZVH
 yAx5eejjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFSf9GP4K3x+TtGrE9nK8YUL+A6HGq1c/PyYwLdK3Yx4/5LDyX0J6YwMm10f68Z
 +MUu4O02C58i1v7X/xOv3mTBVc24Uub5su8M8dgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The TAS2764 datasheet specifies that the chip initialises the
temperature register such that the temperature reading is 2.6 *C,
ostensibly to prevent tripping the chip's protection circuitry.
The chip is not capable of representing 2.6 *C however, and the
register is actually initialised to 0. The ADC does not start
sampling until the chip is powered up, and the last sampled
temperature persists in the register during software shutdown.
Therefore, any reading returning 0 is almost certain to be
from before the ADC has actually started sampling, meaning that
it is invalid.

Return -ENODATA early if the temperature has not yet been sampled
by the chip, and indicate a fault condition using HWMON_T_FAULT.

Fixes: 186dfc85f9a8 ("ASoC: tas2764: expose die temp to hwmon")
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 35 +++++++++++++++++++------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 6aab6d2b7419..55211266927d 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -684,18 +684,33 @@ static int tas2764_read_die_temp(struct tas2764_priv *tas2764, long *result)
 	 * As per datasheet, subtract 93 from raw value to get degrees
 	 * Celsius. hwmon wants millidegrees.
 	 *
-	 * NOTE: The chip will initialise the TAS2764_TEMP register to
-	 * 2.6 *C to avoid triggering temperature protection. Since the
-	 * ADC is powered down during software shutdown, this value will
-	 * persist until the chip is fully powered up (e.g. the PCM it's
-	 * attached to is opened). The ADC will power down again when
-	 * the chip is put back into software shutdown, with the last
-	 * value sampled persisting in the ADC's register.
+	 * NOTE: The TAS2764 datasheet mentions initialising TAS2764_TEMP
+	 * such that the temperature is 2.6 *C, however the register
+	 * is actually initialised to 0. The ADC is also powered down during
+	 * software shutdown. The last sampled temperature will persist
+	 * in the register while the amp is in this power state.
 	 */
+	if (reg == 0)
+		return -ENODATA;
+
 	*result = (reg - 93) * 1000;
 	return 0;
 }
 
+static int tas2764_hwmon_is_fault(struct tas2764_priv *tas2764, long *result)
+{
+	int ret;
+	long temp;
+
+	ret = tas2764_read_die_temp(tas2764, &temp);
+	if (ret == -ENODATA) {
+		*result = true;
+		return 0;
+	}
+
+	return ret;
+}
+
 static umode_t tas2764_hwmon_is_visible(const void *data,
 					enum hwmon_sensor_types type, u32 attr,
 					int channel)
@@ -705,6 +720,7 @@ static umode_t tas2764_hwmon_is_visible(const void *data,
 
 	switch (attr) {
 	case hwmon_temp_input:
+	case hwmon_temp_fault:
 		return 0444;
 	default:
 		break;
@@ -724,6 +740,9 @@ static int tas2764_hwmon_read(struct device *dev,
 	case hwmon_temp_input:
 		ret = tas2764_read_die_temp(tas2764, val);
 		break;
+	case hwmon_temp_fault:
+		ret = tas2764_hwmon_is_fault(tas2764, val);
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
@@ -733,7 +752,7 @@ static int tas2764_hwmon_read(struct device *dev,
 }
 
 static const struct hwmon_channel_info *const tas2764_hwmon_info[] = {
-	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_FAULT),
 	NULL
 };
 

-- 
2.54.0

