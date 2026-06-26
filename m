Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058003D4138
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454519; cv=none; b=lIsYqGy6D4J7k/kJc6ydBFQKSL4E0V01EM+L2vAJalVL0FA19szAJUg+HR2RWcVTCVb+a+qHEeZjxcbDYGfaISfuXlMoA6VidImanjy2WIBR4bkBY08zyBrxbg4M0ZoIER+PiWa5xx77PaTOtyJSdVexsS5kJ99cPMkECrZMszA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454519; c=relaxed/simple;
	bh=hI8Uif9OWfUC9nJ4ryYn5lVr61cKx+hjtfZlpJoMJ0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VZQncGtTZoHjJchRBqHTN+mBTUeblY9YVm5qitbeb2GS/Mr5gMAZJQiYd3GEN9YlungbFa8vUaYwoddPE9rHFNMbRQRtRjhPe5PoiyTeRnsv7+Kw8Lm42+3rBw4PwDIxUrubdmi6l7iCRJAzBTKWLYD7lyxHkxqgWi81je1hgAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bF8v9e3b; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bF8v9e3b"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-37cae998401so277258a91.0
        for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 23:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454517; x=1783059317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUaUW9hyC9Ct9STDjbyAspp3HtPck/9M1aAPJx5Uwvs=;
        b=bF8v9e3b1BsDjeZBJN/spVav32M7QH2Abwxp8gBFj/wSRSbP5oTlL/W1TPQgKXaMe8
         y6r+z/9Aq6QE5X2yQAwyAPopQDHdul1YFXgFN6rK4aM7ydHlWmyswWLUX1CSXd7G1agh
         +5qdCmZ3PIdCplAaEMSSpouUDpfpnxXrAEpAseBlzzoCA991vcpbtJfAvH+WopbIXSSC
         dvu9KuxSXjLDLy0GlpOc9etHblMS2vEcis2jM5ULmCHX54YRb5vL1dJHuFttr3PdpWwS
         eU5tXpu1LjsRx4M+hXxu1DeOVJ5W423lLVVYrNORZnlgYM53eiJx62jS1W4LCtGcTMfZ
         x15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454517; x=1783059317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DUaUW9hyC9Ct9STDjbyAspp3HtPck/9M1aAPJx5Uwvs=;
        b=W8M7w1/S6ur9Ryh8TXW472+TjtArHpT6KiyQuqlkcDF5vrEpoZtIelHaiWE0JV7ufJ
         lQvwmJdSn0fuMpccItafVgH1h4/KtAnJAMNP90Gl1oEZyeqa+WT/Fm7+TaLLc1O8C+iz
         fZdUMUuk49sgqdt2EmBcqrnvgDo3A9hotZZBt3t2oRu+BIjnMNDYtgvlJBUmpyKVU85+
         aEqxxSDuTEnd8M211HRzE+9SBG0ymPn7F5+uYV+Ws3NHZiIkU4Rf5L35uZm6GMG/2lgO
         qoGwUcs9x0MyV6zzUDr5cphJecxgjYM2A3SJODdNivIexBgPVIEGfrc6UZE7crAHzSU3
         4NVA==
X-Forwarded-Encrypted: i=1; AHgh+RoHJL7Qwn2szWyAHQqx9K07jD5p+i2x8ZI7KIln08c5U+6nuoUoaxfDBLrYmCo2E3Gefzua2HCt4T3g8A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs7MKQmxgG35RHxcfIENz1GDUbYtVWNzu1oASxqGDTNbKIluXe
	SeILwfNzBBAhVLKI6ZeFE59l7QpnOBiiz4zD0HkIpVSUsPFdw4Ke+57M
X-Gm-Gg: AfdE7cmo8/DbYjrIBW+XQwr2D999jxJrxQ6a9rjO2hVFN+9yYq+A8bkjfG0tNSt0N66
	S6yo2If8h1lu05wQ3uvtV0POYv4vdwt5mj4qGRtXnUY9C04PSKMln6ZIKluYz10g6cTLPf777pZ
	Zgchj07cB5VAw5YEIMvMj8CAuLviEsGBG3R2BHePKsUI44sJeTu+La5P8HFY04ZNUzkk8frk6aw
	YraVvE+JURGQ10a27pKmQupRS/+Rcy9o6SxiAf5flRZIICEsTW7unaqvPuyxJxr1vQf9Ut6e6vp
	sDKcO471XDZxqn/3LEskgb+UKCa7kDPLXkloEvSDekzrJCofdehfV7DSxgvwHIYVQFSwGMDl2hw
	FP2DIZOVe1nwGuQaEX86EtkGHUSOOoNwEFCTMNmRPEpWXVC0pLptmbV1zszjyDng7AKk7EuogR8
	UEWxPL1WcHw70YINJOnXTSuuhmr9OCSS9dLvB2zJRxmPSqk9s=
X-Received: by 2002:a17:90b:4acd:b0:36b:93f7:a903 with SMTP id 98e67ed59e1d1-37dfa25a0d4mr5820315a91.18.1782454517324;
        Thu, 25 Jun 2026 23:15:17 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:15:17 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 10/24] ASoC: codecs: aw88399: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:15 +0700
Message-ID: <20260626061329.23264-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626061329.23264-1-phucduc.bui@gmail.com>
References: <20260626061329.23264-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/aw88399.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/aw88399.c b/sound/soc/codecs/aw88399.c
index b2ec3503f7e2..67ea073abdb7 100644
--- a/sound/soc/codecs/aw88399.c
+++ b/sound/soc/codecs/aw88399.c
@@ -7,6 +7,7 @@
 // Author: Weidong Wang <wangweidong.a@awinic.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/crc32.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
@@ -1140,9 +1141,8 @@ static void aw88399_startup_work(struct work_struct *work)
 	struct aw88399 *aw88399 =
 		container_of(work, struct aw88399, start_work.work);
 
-	mutex_lock(&aw88399->lock);
+	guard(mutex)(&aw88399->lock);
 	aw88399_start_pa(aw88399);
-	mutex_unlock(&aw88399->lock);
 }
 
 static void aw88399_start(struct aw88399 *aw88399, bool sync_start)
@@ -1702,11 +1702,10 @@ static int aw88399_profile_set(struct snd_kcontrol *kcontrol,
 	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(codec);
 	int ret;
 
-	mutex_lock(&aw88399->lock);
+	guard(mutex)(&aw88399->lock);
 	ret = aw88399_dev_set_profile_index(aw88399->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change");
-		mutex_unlock(&aw88399->lock);
 		return 0;
 	}
 
@@ -1715,8 +1714,6 @@ static int aw88399_profile_set(struct snd_kcontrol *kcontrol,
 		aw88399_start(aw88399, AW88399_SYNC_START);
 	}
 
-	mutex_unlock(&aw88399->lock);
-
 	return 1;
 }
 
@@ -1939,12 +1936,11 @@ static int aw88399_request_firmware_file(struct aw88399 *aw88399)
 		return ret;
 	}
 
-	mutex_lock(&aw88399->lock);
+	guard(mutex)(&aw88399->lock);
 	/* aw device init */
 	ret = aw88399_dev_init(aw88399, aw88399->aw_cfg);
 	if (ret)
 		dev_err(aw88399->aw_pa->dev, "dev init failed");
-	mutex_unlock(&aw88399->lock);
 
 	return ret;
 }
@@ -1975,7 +1971,7 @@ static int aw88399_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88399->lock);
+	guard(mutex)(&aw88399->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88399_start(aw88399, AW88399_ASYNC_START);
@@ -1986,7 +1982,6 @@ static int aw88399_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88399->lock);
 
 	return 0;
 }
-- 
2.43.0

