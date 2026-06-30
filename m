Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5510C3E715C
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 06:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801448; cv=none; b=iCPVvTCq/lYkFqxiDl4OO/uFszXV/CvkGFIU8Snm60tHY5uH2lCczXcpawaBQ6j4XPUumraH7j4FF13fYteCWlfAVvvqu9ZZxRe4xCjc5gdlua9JSC+VEZPbxh8PB/WiPmPtgta9eJP/S+tkjx3ADZxllQFwfWdPWAWXMSm/cGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801448; c=relaxed/simple;
	bh=FowDvka7morxmU61JfAbx98ngYcmtDC/p0DW+ZHI0sA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ezhq5W2yjtbjgumR/Kwgu8P2wbrb8E+L/gSNG+y1uXYUZ8uXc6N8+q8M3xf4ntM4jIXr70a4DQJLorYlKi7Lsn2JP4e41fiQyedMh7cUlmpakklheXzkD7LAK10sx+S6f3NlTdnV6iQD9ZT+TY1JqwwaevkfXpQaKCjJElUeOE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mr8eT3qY; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mr8eT3qY"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c9aea40d799so573582a12.0
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 23:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801441; x=1783406241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HsskFA4Wkjx/t3Sa3T1ax8m+7J1jxFkrWrIh8Ok9CUA=;
        b=Mr8eT3qYAIHFQqVuRYmdosPzt4w4YYlxgpJ9R4Hx3ADY1DJQU+4LTmtb69Ah9wK7PV
         9FJipcHKppFFiNvd/ayBZHxNC3z+fY+hj73kM6mQQj2PH2VW4Hkno5AAn+/hZwUFk0qP
         cgNkuncjiQSVEqQbS4N0wA0eikdChdvp8rWTHaNgKKC1DepuQAl6hXmu81QSybz/7TQc
         +SIBOiCt0isLaC3eVBL3qFcY6eESe/Cj+OD7iZ7MilL57KqNBGX42a+qCB9i/dsi2wOH
         RV+86PqkPj5Cnf06DPeOhGCMlMfAwYE/OUWn7AssyyudNuzQea9XfjGOypqR2idyHGoF
         Sr0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801441; x=1783406241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HsskFA4Wkjx/t3Sa3T1ax8m+7J1jxFkrWrIh8Ok9CUA=;
        b=pxm1MQrdnULNhNZZ98B7yPX9DjnwWu7mnIF6awZBxj/9sWzdrNoauic+mNvaWOXoL3
         ZqulpcTLcTI+KtIY/AIwforMx//ba/JoKLbDb38/2UIgCBCOusWSqzvWG63KE+ZdI0x+
         k1OlFiKtvGFSfmMqyaNv1YV1WHbvm2vakio0hbWgDiDn9sauuiAy1Gqw1kezdUlxMBn1
         4llVfgcg2CdICDFulYMcgWE28ufr8Bg9uFnTl/x48WHGEdCg5gBwPBy2WnUQ9TGpn985
         YlrMTDhhxvjiaLkF4slCYDUhtRHeuTlZ6tizdCz4i7CQepBGiW2ob+UEgzIcm2UIG5LX
         hFTA==
X-Forwarded-Encrypted: i=1; AHgh+Rp8Ytwm7CA103PMhLeAIcDijfx4mN+65GMdDktV1ejVPXcXBj7mHZInWyDjYMBf8Rxv/gytQOYLHbJ2mg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAQf7MGVBnAIL+7qMkLEk3ziJijsSKy5583eRjoOQhvwnST4LC
	IBcB7CO+FcZXLOqVp1lWUgqGmovkUGPEAI8x4yM2CNd5g5QPfMZfO6T2
X-Gm-Gg: AfdE7clD6CyhOpLn51eYhpDDEM4sv82VuBLNj8dc2OqR0MeuTOfPNqMmTuDs0j/gP13
	V1cDkU+LeB7K7eePfu6B9cv7kyU0wfcX8IiRmxMl+j9fMmfl1G9QXzPfJD+aroWPwgsMLtQtSyB
	sOMOE43KVWzjl4OvGPJ8SLeo87QQ2gjTl7Mde5CLDPCv0KHdaC6q7DOASNADVdHeiJ+zQCADoxn
	A7zlH+bKyhA8kporbtSzj/kZtValUNkgYNqzHoIFNyc2wFSZco0U2ENEcyR3F5vLWeOkluTisNo
	RMimIye5lkLlGVRd2Woj95pjMufumQ4E0gbUa3+F1iyuINFXBgp54Iw+U0xEQutsd8JXO52lu2d
	WUC8jkXlJzPcmME3kZcI22EFvnpZtDX+0m+6VBzIZTbZNnrL+cz0whLwDR3rZ54Q9ShOxIhH1Pd
	3P6mnaqc3H0KBlRwiZzPwviCKZL+kOJPluXM1vi0ElS1KvdyQ=
X-Received: by 2002:a05:6a00:6c8a:b0:845:e7ee:eae7 with SMTP id d2e1a72fcca58-8479ee9adb3mr1788259b3a.5.1782801441327;
        Mon, 29 Jun 2026 23:37:21 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:37:21 -0700 (PDT)
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
Subject: [PATCH 15/27] ASoC: codecs: pcm6240: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:37 +0700
Message-ID: <20260630063449.503996-16-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
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

