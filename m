Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC10377EDD
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 05:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783660035; cv=none; b=MuywAj+ofU/X9XiY3Ue+RwEeEXkKbUrLTpxQGj1zvV3s1i4OHrWilM7mnt1DAH+tLOFuMq7D4/qeVM2jCrLsMSoHFP+j1CE2EnXbQeovdTvttSYTSo6npU+356tvML8/0QLmJAMRl45js70+3sG6h3uxo3+8uZ1+0UKjJNA8ZWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783660035; c=relaxed/simple;
	bh=FowDvka7morxmU61JfAbx98ngYcmtDC/p0DW+ZHI0sA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jcFPqIdJzMU2u1PU5nn65NSSGBcfSNpsztngyYOTK3GFrLkLDfUsarM+qjz0cfR/Z8PK/C7iMKzp6saCSesxMcXKgcZGGDIzvcEeHFzgETko+P9NapmaS++kegPeGN2C3MXZKxfs/mLAksy0OV5gOlakJdMCqd2s3XoV/8N1nn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KmP9vrbI; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KmP9vrbI"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-848743155bcso79340b3a.0
        for <linux-sound@vger.kernel.org>; Thu, 09 Jul 2026 22:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660033; x=1784264833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HsskFA4Wkjx/t3Sa3T1ax8m+7J1jxFkrWrIh8Ok9CUA=;
        b=KmP9vrbIKAyOU/nx53BDWcnJY6GiZLmxPoWr/sSvPj4hid+xrul/vN/UgMOnQC+pI6
         dSkmwVETu2klWvrXr3wMB8e2OTuaeyP51nepqS/SvDLtrrlu74k7f68T8simG3fpDlJz
         OyeANrUTCdAGx5spViNq1BK2ou0yzfOqRPCG94J1axWGO0zFcJtLTXloRgh76Ky+FGlB
         b3KYvw1toQBfZvdtrke8l9OkKMzKDPjexS11mOtihpNq4tpP0TcH9MOj2bz9h7UR0ggK
         09cl/BjJFHAsyCBG/+CA0OrjdvGRxPV/hoiD+6CM/32fgNd0SlCreqQbsf6Jvdjn0QRq
         7ZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660033; x=1784264833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HsskFA4Wkjx/t3Sa3T1ax8m+7J1jxFkrWrIh8Ok9CUA=;
        b=jBcQHKrbR8918Qn1nWW+wtEHNuHbA/pTSrH8jDsbhgotkT6MND+ffL7CBvEQ/w4zHj
         a4WhcrNTcRreRWetqcr4Wpvoh5Q5FEd3DpU4Eys4cMXNAfTQRrqXEmVo2ZPTxtrbOAiJ
         XdHFi/2VbloZauknc1soYAzx7NGmue2nUeV0CMZPsaOmvCmZNzdwrhm/eT7OE9JqQdIn
         TJVAfEUEkUClrlTcPLFv1hUSZmHmNW+QHMpgCbiieNSPmOp1dDqHTiUKhz13CUfU2nd/
         LowbslUaiQe+RtS0Q9+NnjWR8BRPDwQ2M/I8QzyKOC0FeM+FrMsp0epLdmRTQ2uHt1Qm
         prRA==
X-Forwarded-Encrypted: i=1; AHgh+RrYl14LLmQLopYPq0hYuno4l2dCltQzkXYdBe2fv5d0VA79obuPVlr/e+qUnO3K1zfptAisRFyu3EOhGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyDay80PUcph45JiHDapT+hbGcid1/rlVe8rXDFPTM8C6fPooS
	zu7nDCx9p8ijH7i+cibDWOI35+UEMgYgYPNYZX2omiJhdRF9EPnveoDA
X-Gm-Gg: AfdE7cmEzn4Ro5HavpD84BdeYEE0rDa0n6A2BuikUC+Yto8mDcLbDS7/kUtGSfK+Uqy
	KLagTuAGsPNwfIXeE1Hzw0IxZp+UTm52caxrfCkH+dPiad0zPwpntlcn6aTDPr9uPDrhqk6Kej8
	E8DZ0kYnskzpOpTbSo1u788jDEwaB5QQDi9FMRPvwyzNl/VzADt+P3zhr/SJli+ryMJVVQgjvSL
	uNEsMATdBfLmbIBqisbqO4XqcglVg2wwDCf7GN37eIdHY5Z3TKNoM1peL9A/jxUqCHY8ZsW3hye
	XV9aNYnakaRiPpmEnDgnWo9bNd6Ua1/5Rlz7MdZXfWBMv9fuFRdW7N1sbDsh3Ve+710LbkbKwqx
	xYX67wqlzMLCfXN2ZMn7/RC5D2X/nXb0IgNqw+uyZPaQ81y1DRUOiI2lQ6jcYqS03V8bS7HNLqk
	b9isjaHNpV0C1pkbsfjyFZAeHC+uTnjMBtVm/rUcEIyiI/b2w=
X-Received: by 2002:a05:6a00:348a:b0:848:2f74:1d5d with SMTP id d2e1a72fcca58-848438a7e5fmr9480496b3a.67.1783660033363;
        Thu, 09 Jul 2026 22:07:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:07:13 -0700 (PDT)
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
Subject: [PATCH v3 15/27] ASoC: codecs: pcm6240: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:04:59 +0700
Message-ID: <20260710050511.14439-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710050511.14439-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com>
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

