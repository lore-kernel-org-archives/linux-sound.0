Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AF833F59C
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 03:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467423; cv=none; b=sX+hXHPxkxOr1DlIvt9ZhgPax2gA0Q/rCw+jHHsHZ7PY1/3VP04x4S+MTrwITFcKr3fjuMRbhZahWhxFRV1rCNf41uO0/XpOvupHXgW9bBW4HMriUoiE1iBLKL2vjzniz4+ohVW32mmalkA+kUVBRlUTG0PvDIbMtuPy8rf0WY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467423; c=relaxed/simple;
	bh=uAVGrrdJJEkwGPUs8mrqYBmDa0hb+jLcInrWOC6p3cg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ny5XCr+9s0KvLweKF2fQoWsIJJe4dNDXAbWRIVvgMDCvn0fcYf+XOUx1GUIUMNRFRHdGFYNc0cP1pQXdcYh9xF2pADgXbWsYE+y7ve98QZxbPvmopJuy8IXId7h1JauuX7V4KLJVd3HfpXPU0C33okp+KN/YzG5ZgXoO3pflUVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QepmZfPN; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QepmZfPN"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ce7d2adef4so6799565ad.3
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 20:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467421; x=1786072221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GBTpcu0Fe5PsDRigZ5iomgO9tYMapqnlBqmRFhSq3F4=;
        b=QepmZfPNh/XIXd4WiuhjtCFyFfl7BmHtzfyJcCP24Dygwq+aOQSD+1QpwhsroLLNPF
         g+LmAWRBdxmUWNQrY0i3wpG/H9A1ZKxdaoGxNxee4wxsBJ4CNppBCy4Vz9GgZDKa++2n
         eZ8MRP0vQVGYZmXO5TAlRoYEwO1rRJP4VjStQxOUo5IMTn8kd37aJH/kV/GX2DT/PFlb
         TkN8rrziGCLlnFxk0I50vFslHu4oemSlRG28Gj+4jANtNQJzD1YqW3zHLXQItgBjYae3
         Wod4DhG8MwEacD1FD59vWv6HSNl957vsPbV1eA9tmuZTwhHgzpUHuG8wxHrt0DZNR6Ev
         g1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467421; x=1786072221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GBTpcu0Fe5PsDRigZ5iomgO9tYMapqnlBqmRFhSq3F4=;
        b=jFmieUdfbkLyFT7KxIxaw8s2OdlbA2aVQEOv74VJFZ7M3aWVnwRMxguSbBFfv4Q1KY
         gLkAMozB8pp3QiLcFjzOOvh+tALkoNM3CacI8xFEx/iRmwUi1Lz/dD7ZBbEwvtB8YG0b
         tYpKWpe0uaTG/v9741AeShACsBgG9UfDQubTmitxx69yBf4GjYgFQypUPb89a4L0WDiN
         gM/A37d0FqhQfQtK+EA/4KTX7JjXP6p7Yc1dsURQ8kTas7G0IT2YunnBsHYqtf2Vy6i0
         0SxXniedmqO4fbdp++Hangwe4v9l/TgnkgCb/73gEMLFoFvTtaWA47I8UY0Y/aFb6GTw
         CeDQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqf7Jy2n26xTtPYwxdT5aqca5pMoD4xWrpoqMauGqUHnLrZNCG/yIAOGTdAdVF5Y7vD0HymH8QD8mTBPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZwr4BXpAYNmt9/VeBWBe9a3wZWw34QbtcIVFwOKhe8SfthWzd
	a62mS9vcWi9nw0V1NtxJ8cgTFME5KW9k2N2xW5D53K8ZnVwR8g/VLd30
X-Gm-Gg: AR+sD13LyjNaRNkKVXle4hRmSXiU01u91KQn+z3Spya/qsnU3S0N/19R7Nom5peeMA2
	sWou+TOQH20BQaZ/qFI9dq8CYyZkeI4RvmW1mYDOpJSMAUBHCKj0kZn3m5HTrrJ1rwRjHuFck44
	iWaz7F79ByqLWZZRbSwhc0EvR00DmfGovYewCSMH49RAj9rRA2p7s/Fff48uw2sI0uxkny5Dhku
	2Q9+5XpHJtPMLbSkK7PTSczTZjSxg8eXLUttQShl4b176HkFc0KlNxuSQOpHsDei4DpQPfMWI8L
	Kyw+F+sRSTGWNdkTBqyWWPvTliSCUuQIVetrO309xpv7IudACI7et18x7a6tWgaNc5vjrECSzsJ
	ZsiBwkKUsvwBSOz6AfdKAfSwgdxYA+f/raWfoOziXcsCfkftI6h/DHaj3jH6GPWFaslBxqm4zI2
	3B/S6Q+TDeqLCc3ynKBKOoHDhDx+LnswbAi5LtIA7wKoFUv6+4dt6g/W8jFRTYPfVcEPhn2+z7u
	6sgplHtak6htxN2y/cmQk7mVdjBsNySX5nQadpvIGLP+txv+0NsiKzXxfAWXEtpPHPwyENS5sm/
	gKKt
X-Received: by 2002:a17:903:26c7:b0:2c9:e961:d256 with SMTP id d9443c01a7336-2d046eb4dffmr4931695ad.27.1785467421196;
        Thu, 30 Jul 2026 20:10:21 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047ae9f31sm737595ad.60.2026.07.30.20.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:10:20 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
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
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 04/26] ASoC: codecs: tas2781: Use guard() for mutex locks
Date: Fri, 31 Jul 2026 10:06:26 +0700
Message-ID: <20260731030648.8706-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731030648.8706-1-phucduc.bui@gmail.com>
References: <20260731030648.8706-1-phucduc.bui@gmail.com>
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

Changes in v3:
 - Remove redundant comments per Cezary Rojewski's review.

 sound/soc/codecs/tas2781-comlib-i2c.c |  5 ++--
 sound/soc/codecs/tas2781-i2c.c        | 33 +++++++++++----------------
 2 files changed, 15 insertions(+), 23 deletions(-)

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
index 9e6f0ad5f05d..4d5abe01cb22 100644
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
@@ -1765,13 +1761,10 @@ static int tasdevice_dapm_event(struct snd_soc_dapm_widget *w,
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
 	int state = 0;
 
-	/* Codec Lock Hold */
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

