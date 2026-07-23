Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8E036F8EE
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 04:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782443; cv=none; b=Pzrboy7UVmkjWLWUcm+9/4dYzvMXTvDYHuMWyICpKJlnLXTl7kuZa4pE1LOulBpdLCwCbS/0PvSjQQSukAUA/nEJvO6eG8z5LcSPpnK1W2HPFhpIhs1pIGBsCRxw1K5tDX19ntBZEKKJRVBpCIERjd8DEYIf7d2jw+prupI+1/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782443; c=relaxed/simple;
	bh=Fa/+gfQ3SzEgi11qWxA09O6FM4GPY4YkSzC3+KOzEZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qSom1fmhu8zZcZro8SleADd0TEcNqqvr9KOdsVa6jcVcDLjav4n+jy3Xq6LMPEoC4gzLzSnARmeZ0TG430Od49CevrLW9Z8vl5sYH3frBHz8IwSaCNbArgyU3rKvldUhclhUqx2BE61pJHaHh8p4B5J8QuryIgtLv084v1ArKDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQ4YxXvW; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQ4YxXvW"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2caea3f742bso3014815ad.0
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 21:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784782432; x=1785387232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aWHLEKCAQ5mV1sF9yyFHSMFUTDOduAtPgNwQ5RGsXm4=;
        b=HQ4YxXvW1HWsL77uOx4M2OlbEr+5qxltlY2cbuZduHJoDw8T00RUDWtWgZO4ioRGvY
         V2KOC6IAyFIlVIUxNRO0wSNl5NgBmPGePwXpLiydTgrL1YSku/CYRNaISNkmG8vTBCrJ
         3uGAzW9mcaW32NGSk5owYwRikwn7dZMXZWLDahqnAlgG4EY/lo9xtxaKwNq4rHVU8Zcq
         oQLd2E8wwoZzAHn576JoxlXUB0b6Mg4Wl+yO2tFbxNiHGaKo+qo/Ditl8kOefZBUX3ER
         GpFexxbPzOOFYm9MT0G8PjZfu08FYgyBgd7ZDzuIPm5fevZoMCit7p1oDGtggIr/dZ4r
         PM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784782432; x=1785387232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aWHLEKCAQ5mV1sF9yyFHSMFUTDOduAtPgNwQ5RGsXm4=;
        b=Nq4IPatIE55R3uxeN4QpY/O8bavMT+TrSuWDkShE9iD1nwfm6WGnHhr8IGbEvZNiNU
         pmLZ3t6eD4INKfjB6n+/Nhnz1vLgcDSnxJn86c+B45gXLp87OZuU45Op00BpNEdSOl01
         5foyZSUfrP3nhPTFELpHuJ50Sc0CF5QkuWYY3MYML9yKfXx+W8vs5T5cj8a+zlIueJ27
         eY/xXVD3dsyDj/rhMaLRz/OELo//S9aAO5Q60IndFH3o0Q7NVBCeDIWLXeNAc52d9fl1
         kZmIa1hwlpDv3F/Gf0SDb2yzfzm8bfwNp1WGOHLwmO/YNWxSOe4s6HteF1fW9lv8BFSY
         6pIg==
X-Forwarded-Encrypted: i=1; AHgh+RpvdTYSHhLNYVwkIbtqSA2LgIfIy/gXt25nS548FGvHwC/uUnD0B519quFz03NWLmSv1+r7cF9oVFD5cw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1mCZhUnu73BBnkjXljDo5ZOBz8JboE4zRhtmaU6tVmp/jTbL+
	bVW16MrgC7Tp9MieFFiZCVIAVT6r9VgU/fmFwB3ml/YtqpUZSSNllaDf
X-Gm-Gg: AR+sD13k/DJx6LnbtPqdxTCwFrtuAwPrL5yUR+WM24/yILinfLQ7OV0VYXNjXk4/O+5
	aT4hiEdgmzTzbABBM6e6AmtXK7YxqyrzC3NS29JzMwgFF8nj3LUJz3+8G4GZ8gas3l0Z0On0kiY
	YnhxCfMDK3rR/ytq0Nk831OncRXCeAgrLEIqbo7l9/5QOeYB7xxIrFzstOzYxTacZNpMr1FE29u
	hjX23W1W+yTHwD9u9cEFvK1jZbUCmQqtf+JkdaaBP/YFEBOPNFGvXy/hp9VdpuCSZt76fgH2mAo
	++YewbfeC5Zm3wo/lH3wCDdLCPHbIs28qm52kflF09TdMXj42w9Swk98y9OpHLdwIcolVUCtLk1
	52lMAu7zBmmfknuH16qphdyppVeoQiCeez/zTSoE83RL9lIdBJHOuhnckZIPvfekcEQmuQ6y7Cw
	OZWT7n7UolrNpsGAr2URtb4ImJDSRgQ7A2D1zs
X-Received: by 2002:a17:902:f544:b0:2c9:97a8:8c17 with SMTP id d9443c01a7336-2cfa71ccbd6mr18632095ad.42.1784782432272;
        Wed, 22 Jul 2026 21:53:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfa57542e0sm7258365ad.67.2026.07.22.21.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:53:51 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>
Cc: Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	u.kleine-koenig@baylibre.com,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Kees Cook <kees@kernel.org>,
	Chen Ni <nichen@iscas.ac.cn>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 01/26] ASoC: codecs: sigmadsp: Use guard() for mutex locks
Date: Thu, 23 Jul 2026 11:53:02 +0700
Message-ID: <20260723045327.28260-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723045327.28260-1-phucduc.bui@gmail.com>
References: <20260723045327.28260-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/sigmadsp.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/sigmadsp.c b/sound/soc/codecs/sigmadsp.c
index 2e08fde3989c..b7dbeb237447 100644
--- a/sound/soc/codecs/sigmadsp.c
+++ b/sound/soc/codecs/sigmadsp.c
@@ -5,6 +5,7 @@
  * Copyright 2009-2014 Analog Devices Inc.
  */
 
+#include <linux/cleanup.h>
 #include <linux/crc32.h>
 #include <linux/firmware.h>
 #include <linux/kernel.h>
@@ -135,7 +136,7 @@ static int sigmadsp_ctrl_put(struct snd_kcontrol *kcontrol,
 	uint8_t *data;
 	int ret = 0;
 
-	mutex_lock(&sigmadsp->lock);
+	guard(mutex)(&sigmadsp->lock);
 
 	data = ucontrol->value.bytes.data;
 
@@ -148,8 +149,6 @@ static int sigmadsp_ctrl_put(struct snd_kcontrol *kcontrol,
 			ctrl->cached = true;
 	}
 
-	mutex_unlock(&sigmadsp->lock);
-
 	return ret;
 }
 
@@ -160,7 +159,7 @@ static int sigmadsp_ctrl_get(struct snd_kcontrol *kcontrol,
 	struct sigmadsp *sigmadsp = snd_kcontrol_chip(kcontrol);
 	int ret = 0;
 
-	mutex_lock(&sigmadsp->lock);
+	guard(mutex)(&sigmadsp->lock);
 
 	if (!ctrl->cached) {
 		ret = sigmadsp_read(sigmadsp, ctrl->addr, ctrl->cache,
@@ -174,8 +173,6 @@ static int sigmadsp_ctrl_get(struct snd_kcontrol *kcontrol,
 			ctrl->num_bytes);
 	}
 
-	mutex_unlock(&sigmadsp->lock);
-
 	return ret;
 }
 
@@ -677,10 +674,10 @@ static void sigmadsp_activate_ctrl(struct sigmadsp *sigmadsp,
 		return;
 	changed = snd_ctl_activate_id(card, &ctrl->kcontrol->id, active);
 	if (active && changed > 0) {
-		mutex_lock(&sigmadsp->lock);
-		if (ctrl->cached)
-			sigmadsp_ctrl_write(sigmadsp, ctrl, ctrl->cache);
-		mutex_unlock(&sigmadsp->lock);
+		scoped_guard(mutex, &sigmadsp->lock) {
+			if (ctrl->cached)
+				sigmadsp_ctrl_write(sigmadsp, ctrl, ctrl->cache);
+		}
 	}
 }
 
-- 
2.43.0

