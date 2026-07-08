Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8029D466B47
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 14:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520466; cv=none; b=bCiEV+se/F2cLanSAgNmMVaTE/RUOnhvfE3T7q5k8pkLO8jgyJILYO3B3/1tBkZWLq/PFaSJi3R3hZL9jK4kpzOUMBrT83/dE96c0qM/V3nlyFDDLoffl2ppjoUKpIZRtvPskftC1ccm0DgzKcX0FLD8iGFrmfakdoL1scYZDqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520466; c=relaxed/simple;
	bh=FowDvka7morxmU61JfAbx98ngYcmtDC/p0DW+ZHI0sA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CgPWtsz9Bv/LziX0bIms3HX+4Z/Lbb33irwjk4/sLP81x3Fi2AceWBYJIzyaMkk6t5uihf/BOgeZZPi7QAl8WX23hX3qC+02JcTvh3MzaFuCjFWIvphUkiU9AZbHX6KtDxLyW10nQghnrphV9/zaYdtItllFz2mMRpS1kTt6Pd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/bKbHpz; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/bKbHpz"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cab973140bso9599285ad.3
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 07:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520465; x=1784125265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HsskFA4Wkjx/t3Sa3T1ax8m+7J1jxFkrWrIh8Ok9CUA=;
        b=H/bKbHpz1gGX666/ScOrYi3LpG8rtl3xMH2e5uHgyCsh8arbfBjX5AswFi8YWAcR48
         4iwcQqT7Rr33Avsw0uPEAVtcQjT1ja7TfmORWG+ZyOX81/tHwvin2wzf7B8lQiZeSIpG
         Ml/JSPPx/aKSCnt+iAvhiGVV/ONmVC3KD1BZ/7IrUXL5wEeNXf3ZJkJGZ46TGVuiL8Gq
         45N3p+ulo2ib4IbNIZzlNynT74hHkYr+OYbCwCpruzWm8EDaAuwq8ZOb138AkjuOksCD
         HR1DAh0rLqskgPLXh7zeNX4BUm3qCfK2sHrPMrEQIx8YXrhtYdCVC2dpipSrv5FDZMIR
         hsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520465; x=1784125265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HsskFA4Wkjx/t3Sa3T1ax8m+7J1jxFkrWrIh8Ok9CUA=;
        b=cIwS0gtIFsNqq2xMuGjJCmeS42P7RTcGBcn8ACG9aSl8Uw2WpT6skm2h9vkjSs9Sza
         yGzgYDztcrO2ANTOaGabWgVftAS/3B4DZGhta8UBqNCLbNS47u5YWCfBAIy87WhXUKLh
         tvNKSA3/yh7xcFjP/IJ3s53LCzdpGj208qc4y2q9kBedvWzlGL9XGCw0cBJMRLBYfehi
         yVY+HnIUh53VZe6U8DtG2kGEXJUvX6Wm6eGk97CN9Haq0qlarqPXWFL5Oe3YhUlQXnkJ
         ZXQlb9sJ8bLJpw/VqMSLUKs8jABOS7LIA/4xNOaJJMFF+tHpLp9wha4kRyeEwMEVH3m8
         Egjw==
X-Forwarded-Encrypted: i=1; AHgh+RoWGLki4oukYkxBPIju3MfMI6VdMpLq0bnv7xDkzkA7TrGI3lZZ/kuxo06mAji7M6r1ltdGqp2SyC2dvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxqh3OAOFSuXRnLcNuYgSl6jMsJmqITHQJhKIi7El92WNmDj5O
	F/gS+NMIbyPYMrAHju/d70UBc8Iusqb1mqkZGcZr9ZN5wejm8eHv10zY
X-Gm-Gg: AfdE7cmnBi8VP4wDg9zR5B3kB3yX8ds2/G8kmpsryC1iESGKZZ4cGVN375obD13MT3/
	8CHbhO00p8OEqmoqNrHGaSwSUN8s6DO81IAi9/Vpf1RZrqT9fqbe/Yj/RROoyjN8uyw7MF9VXTl
	xHTeLXphf5gdkHey0pY0txZYE1bt7j+L2GvPc/KqhT89iPYVZWLZSEg5+c9KGtopu6ZoI8vFZp+
	pDMs5Oge62LPYobcF/4bDqgJbQGrENyGSTy/PchkMhbyuHw9QEVmgwGaOMqVg8Lyo3oOKqvAaDg
	d0ss4qSqxX1AyPRVzGZ/gHe4hOT6FZIljTd3ThngmSK9nfdnd3r5Rfn08f0iyEhV+yPmvnYf8qg
	KZf43Oxki/jDoMI/9pWhGhzNHFvWNYxAkfNnOxbi5ZjAV2DNczeHsatvSfU0AUMVmHzuA5WIf/a
	5VFXI3crEnigopwjrsE6tfLVOWEjhKY3ap6aoENczPGjIapbI=
X-Received: by 2002:a17:903:110f:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2ccea388b1bmr30568515ad.14.1783520464839;
        Wed, 08 Jul 2026 07:21:04 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:21:04 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 15/27] ASoC: codecs: pcm6240: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:22 +0700
Message-ID: <20260708141734.578926-16-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/pcm6240.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/pcm6240.c b/sound/soc/codecs/pcm6240.c
index 4ac4448ac3c8..a2b66eae6ac4 100644
--- a/sound/soc/codecs/pcm6240.c
+++ b/sound/soc/codecs/pcm6240.c
@@ -12,6 +12,7 @@
 // Author: Shenghao Ding <shenghao-ding@ti.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/unaligned.h>
 #include <linux/firmware.h>
 #include <linux/gpio/consumer.h>
@@ -605,7 +606,7 @@ static int pcmdev_get_volsw(struct snd_kcontrol *kcontrol,
 	unsigned int reg = mc->reg;
 	unsigned int val;
 
-	mutex_lock(&pcm_dev->codec_lock);
+	guard(mutex)(&pcm_dev->codec_lock);
 
 	if (pcm_dev->chip_id == PCM1690) {
 		ret = pcmdev_dev_read(pcm_dev, dev_no, PCM1690_REG_MODE_CTRL,
@@ -613,18 +614,18 @@ static int pcmdev_get_volsw(struct snd_kcontrol *kcontrol,
 		if (ret) {
 			dev_err(pcm_dev->dev, "%s: read mode err=%d\n",
 				__func__, ret);
-			goto out;
+			return ret;
 		}
 		val &= PCM1690_REG_MODE_CTRL_DAMS_MSK;
 		/* Set to wide-range mode, before using vol ctrl. */
 		if (!val && vol_ctrl_type == PCMDEV_PCM1690_VOL_CTRL) {
 			ucontrol->value.integer.value[0] = -25500;
-			goto out;
+			return ret;
 		}
 		/* Set to fine mode, before using fine vol ctrl. */
 		if (val && vol_ctrl_type == PCMDEV_PCM1690_FINE_VOL_CTRL) {
 			ucontrol->value.integer.value[0] = -12750;
-			goto out;
+			return ret;
 		}
 	}
 
@@ -632,15 +633,14 @@ static int pcmdev_get_volsw(struct snd_kcontrol *kcontrol,
 	if (ret) {
 		dev_err(pcm_dev->dev, "%s: read err=%d\n",
 			__func__, ret);
-		goto out;
+		return ret;
 	}
 
 	val = (val >> shift) & mask;
 	val = (val > max) ? max : val;
 	val = mc->invert ? max - val : val;
 	ucontrol->value.integer.value[0] = val;
-out:
-	mutex_unlock(&pcm_dev->codec_lock);
+
 	return ret;
 }
 
@@ -678,7 +678,7 @@ static int pcmdev_put_volsw(struct snd_kcontrol *kcontrol,
 	unsigned int val, val_mask;
 	unsigned int reg = mc->reg;
 
-	mutex_lock(&pcm_dev->codec_lock);
+	guard(mutex)(&pcm_dev->codec_lock);
 	val = ucontrol->value.integer.value[0] & mask;
 	val = (val > max) ? max : val;
 	val = mc->invert ? max - val : val;
@@ -702,7 +702,7 @@ static int pcmdev_put_volsw(struct snd_kcontrol *kcontrol,
 			__func__, rc);
 	else
 		rc = 1;
-	mutex_unlock(&pcm_dev->codec_lock);
+
 	return rc;
 }
 
@@ -1645,9 +1645,8 @@ static void pcmdevice_comp_remove(struct snd_soc_component *codec)
 
 	if (!pcm_dev)
 		return;
-	mutex_lock(&pcm_dev->codec_lock);
+	guard(mutex)(&pcm_dev->codec_lock);
 	pcmdevice_config_info_remove(pcm_dev);
-	mutex_unlock(&pcm_dev->codec_lock);
 }
 
 static const struct snd_soc_dapm_widget pcmdevice_dapm_widgets[] = {
@@ -1890,9 +1889,9 @@ static int pcmdevice_mute(struct snd_soc_dai *dai, int mute, int stream)
 	else
 		block_type = PCMDEVICE_BIN_BLK_PRE_POWER_UP;
 
-	mutex_lock(&pcm_dev->codec_lock);
+	guard(mutex)(&pcm_dev->codec_lock);
 	pcmdevice_select_cfg_blk(pcm_dev, pcm_dev->cur_conf, block_type);
-	mutex_unlock(&pcm_dev->codec_lock);
+
 	return 0;
 }
 
-- 
2.43.0

