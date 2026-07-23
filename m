Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B705938F656
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 04:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782467; cv=none; b=dtBlL6Zz8vR41HEIklefPUT/446M6ClhpO9xLLgiHJL0rL/ZnIFyo/qMC5vWE6hFjZ7H6d2BGJrFJIUSBqf/mCULKqbqBTvoud0aEE9TT5y6QhNNut9AKOE0P2GDD2xXNQdvQuiKNkcZRbtxoRevBAs+rzHRZJEXZxPnwVFP8MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782467; c=relaxed/simple;
	bh=y5XdJ6OkHgxu+beAwr5WwIRuGIeclzsWyl1XJ6BLy9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c2/XOUeUsd6nLF6jJjOPBrLPewWDVwJsKJKsIGNFfjzbHLa+BiqYnNViJ3vbeNl7U6QMvpSl8Q2cdXcBuStEjkYkFM5MJDiaBWY7MfRonP6l/gH2VMAgzyDri6vfvm4J7OCsuW0gqC80+BYMshy3WGUG6qTPlnhJbay5ABnV5C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MUzre2Tm; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MUzre2Tm"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cf50c6f235so3478985ad.0
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 21:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784782456; x=1785387256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2nJcxVapbgHVBOEWq/X49W5vkvWx4XNnEmWY18iJdtM=;
        b=MUzre2TmGO8l8YjfKzrPH/PeRuCS7kvnk6Jf3XwiNziFk3XcykL6Z6nAljju6kr0vW
         wO4ovAiqyUTu7qsbqnEHWnb/M1MrxezI6zAzxYx4jJfYpn4+lowZ4nGqj3iYhZWiIv/w
         fAlGXKzzPBBftyASL0A8VIu4da/uHLL8GK1VxTx8yenw+lAijrSyEngvh/TiQOt0eFHB
         ODCudE/bJkf6JqXxevQWv6m6d2sLtKtSe7unCWAmpEZU79Cmye3E4pIvuxqlMRfSwjN6
         8SDqcwklyeNXUdRavIW/j7PlQ5bKSU+JsrsGcoFul4RAXI4z4CGU7gvnkXPCjvSmQnph
         nyEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784782456; x=1785387256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2nJcxVapbgHVBOEWq/X49W5vkvWx4XNnEmWY18iJdtM=;
        b=AHH98I69kv3WF8U3jXJheEM591svmCcmiqbOlVrlYh/4BpezaEdSXZpG1pOkTWBwyr
         QBNm9SYxcr3hfXTEsx4Nd4fW0PmgaX6tDHhAUjHxViRvPxhK6NV0EJ3UWab2Pfz1loyd
         Survn9wB/qlnFDlDEXVWH8YPzIa/jfM4bHoNATEHpVFMpSfU9x0kSMKzxn7qNYuphxJD
         O/ve8g6rmHS0Ml5wwFyvW7BSsqKsi9WOWE9IR0ttx+dGYd4dxj6AGlWvvJ9KBwDgj+Bx
         dTSMqZi0UIVms2sy7INdPeNK7AT09DtT5C4/+cEGrcLC4jeZUpKWKE8869rvljYcwFup
         VIuA==
X-Forwarded-Encrypted: i=1; AHgh+RpL7MFd6eGDeJ6kcYigSNXdKGQiEnyF60it/DbX1k/pwZunzh9lQH18Qn59Zu+oACKc3mnuptvW43t7dQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3B+k+Ok7jwCKnJaNr52TmHM71nXIa7dWeayXG2VXPj0d3sqCc
	QklqvFWWKdXqJbm3ciyc+iDMW4eSt3zFEfxg6ZCAkfDbgtL2xgXezP3j
X-Gm-Gg: AR+sD12PGM0EGfRXLvODBZjRQhZ/iu7xAcFtjax5GO+FiyPCiEi4erxOdqOy22JtMvb
	g49HeR6P2yb+7tcN6vVsCi+/qBJxEbyNT43EPcMNehDcjjfy+aRHbAIf256YMBdqNMjp7sNZ3gj
	VkGvkWXTu4ICDGACigbI97rIi+row5SdabRGOz7/uAqWX7Q7yaoU2tCWrAWFpTxtSG28w/7lT5Y
	p37ng0noCbcUnyKY/g9NSin681xe8XRabwrX654Bu3YQBfQRb3priT5dylVegqxsdVoep1wfKI4
	DOBaVwwsD5bWZ8k8YpWmAWipeqWe7AR6YB3poERQIVFOCH+I/YUgHugNZG3jASP6GxidHwnmVQ3
	/VmkfBP5laqvQDPV+Ni5gvcIDHEJi4NRwP647AD94UjmzB7V4x7o34HxQSbgHXyturVigNH5QgU
	qaeF6qpaG4kxwD1G9rHFKPYZH6iwE7uDUXryQf
X-Received: by 2002:a17:902:e74a:b0:2cf:1536:3d41 with SMTP id d9443c01a7336-2cfa74e3c3dmr19166495ad.28.1784782455846;
        Wed, 22 Jul 2026 21:54:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfa57542e0sm7258365ad.67.2026.07.22.21.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:54:15 -0700 (PDT)
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
Subject: [PATCH 04/26] ASoC: codecs: tas2781: Use guard() for mutex locks
Date: Thu, 23 Jul 2026 11:53:05 +0700
Message-ID: <20260723045327.28260-5-phucduc.bui@gmail.com>
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
 sound/soc/codecs/tas2781-comlib-i2c.c |  5 ++---
 sound/soc/codecs/tas2781-i2c.c        | 32 +++++++++++----------------
 2 files changed, 15 insertions(+), 22 deletions(-)

diff --git a/sound/soc/codecs/tas2781-comlib-i2c.c b/sound/soc/codecs/tas2781-comlib-i2c.c
index e24d56a14cfd..79b5f5b04c74 100644
--- a/sound/soc/codecs/tas2781-comlib-i2c.c
+++ b/sound/soc/codecs/tas2781-comlib-i2c.c
@@ -6,6 +6,7 @@
 //
 // Author: Shenghao Ding <shenghao-ding@ti.com>
 
+#include <linux/cleanup.h>
 #include <linux/crc8.h>
 #include <linux/firmware.h>
 #include <linux/gpio/consumer.h>
@@ -342,7 +343,7 @@ int tascodec_init(struct tasdevice_priv *tas_priv, void *codec,
 	/* Codec Lock Hold to ensure that codec_probe and firmware parsing and
 	 * loading do not simultaneously execute.
 	 */
-	mutex_lock(&tas_priv->codec_lock);
+	guard(mutex)(&tas_priv->codec_lock);
 
 	if (tas_priv->name_prefix)
 		scnprintf(tas_priv->rca_binaryname, 64, "%s-%sRCA%d.bin",
@@ -360,8 +361,6 @@ int tascodec_init(struct tasdevice_priv *tas_priv, void *codec,
 		dev_err(tas_priv->dev, "request_firmware_nowait err:0x%08x\n",
 			ret);
 
-	/* Codec Lock Release*/
-	mutex_unlock(&tas_priv->codec_lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(tascodec_init);
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 9e6f0ad5f05d..16dd0989e5e2 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -13,6 +13,7 @@
 // Author: Kevin Lu <kevin-lu@ti.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/crc8.h>
 #include <linux/firmware.h>
 #include <linux/gpio/consumer.h>
@@ -843,12 +844,12 @@ static int tasdevice_digital_gain_get(
 	unsigned char data[4];
 	int ret;
 
-	mutex_lock(&tas_dev->codec_lock);
+	guard(mutex)(&tas_dev->codec_lock);
 	/* Read the primary device */
 	ret = tasdevice_dev_bulk_read(tas_dev, 0, reg, data, 4);
 	if (ret) {
 		dev_err(tas_dev->dev, "%s, get AMP vol error\n", __func__);
-		goto out;
+		return ret;
 	}
 
 	target = get_unaligned_be32(&data[0]);
@@ -868,8 +869,7 @@ static int tasdevice_digital_gain_get(
 	/* find out the member same as or closer to the current volume */
 	ucontrol->value.integer.value[0] =
 		abs(target - ar_l) <= abs(target - ar_r) ? l : r;
-out:
-	mutex_unlock(&tas_dev->codec_lock);
+
 	return 0;
 }
 
@@ -882,29 +882,26 @@ static int tasdevice_digital_gain_put(
 	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *tas_dev = snd_soc_component_get_drvdata(codec);
 	int vol = ucontrol->value.integer.value[0];
-	int status = 0, max = mc->max, rc = 1;
+	int status = 0, max = mc->max;
 	int i, ret;
 	unsigned int reg = mc->reg;
 	unsigned int volrd, volwr;
 	unsigned char data[4];
 
 	vol = clamp(vol, 0, max);
-	mutex_lock(&tas_dev->codec_lock);
+	guard(mutex)(&tas_dev->codec_lock);
 	/* Read the primary device */
 	ret = tasdevice_dev_bulk_read(tas_dev, 0, reg, data, 4);
 	if (ret) {
 		dev_err(tas_dev->dev, "%s, get AMP vol error\n", __func__);
-		rc = -1;
-		goto out;
+		return -1;
 	}
 
 	volrd = get_unaligned_be32(&data[0]);
 	volwr = get_unaligned_be32(tas_dev->dvc_tlv_table[vol]);
 
-	if (volrd == volwr) {
-		rc = 0;
-		goto out;
-	}
+	if (volrd == volwr)
+		return 0;
 
 	for (i = 0; i < tas_dev->ndev; i++) {
 		ret = tasdevice_dev_bulk_write(tas_dev, i, reg,
@@ -918,10 +915,9 @@ static int tasdevice_digital_gain_put(
 	}
 
 	if (status)
-		rc = -1;
-out:
-	mutex_unlock(&tas_dev->codec_lock);
-	return rc;
+		return -1;
+
+	return 1;
 }
 
 static const struct snd_kcontrol_new tasdevice_cali_controls[] = {
@@ -1766,12 +1762,10 @@ static int tasdevice_dapm_event(struct snd_soc_dapm_widget *w,
 	int state = 0;
 
 	/* Codec Lock Hold */
-	mutex_lock(&tas_priv->codec_lock);
+	guard(mutex)(&tas_priv->codec_lock);
 	if (event == SND_SOC_DAPM_PRE_PMD)
 		state = 1;
 	tasdevice_tuning_switch(tas_priv, state);
-	/* Codec Lock Release*/
-	mutex_unlock(&tas_priv->codec_lock);
 
 	return 0;
 }
-- 
2.43.0

