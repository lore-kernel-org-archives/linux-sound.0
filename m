Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479E0377EA9
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 05:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783659975; cv=none; b=uoOkzm2BYhBqi4vSN8Hda0ojzY5FK4AUzgBGgudnAIjHcoQBuv4Ig9o3fVdWflbttQtHSwqXcMd4HihUSXqesqabhl4uB67rLcnD7sgKja3VgbwIxNSrtw/rlM0+LWJznAxK2b5jVR1vKguzT9F6CqOZTIeywp8WAPfHjMMCc4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783659975; c=relaxed/simple;
	bh=+nT6I4Pca0g3yL9/0MMMJ9eU5lzYcdje8+rHxYbR5Lw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f1XEXKAD/so/zvPZlaFX2Dl/EfdyEp24HgPJ8AxBvDYZy6hi5QkdUiVfgyexBHwQp058GynHkw+Z/xcUBSppHQ7QCD777/LBBSPPb75jOclVB3YmQmlPSI9IOJsJD3AvrAwLsKFWLe2OQ8Nq2/VWgjXY14qpqyA+6QC3u6mQLME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fp98KrVW; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fp98KrVW"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84783bce476so581465b3a.0
        for <linux-sound@vger.kernel.org>; Thu, 09 Jul 2026 22:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783659973; x=1784264773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aUrf6Km35HLEs48Iv+5EKVZGrilhk0m+5i7bYMdUoc0=;
        b=fp98KrVWKDFqOYAGRgyUuV5AZwrLOnNEj5oXubdUB4WI752XMWnLe+ctpoBcEnr2ZK
         FSPdi1Q2L4ZRiz/kbcxEmn1Wk+B1I4A56dzjUO/DCQI7pr9zeELJGGIuXHcmqicm5akT
         K+5qQrgb5HVdVM9gX2BWDUQPFkxwz/NtOuPcdBOYiSZmK/xmqAOAUTc9dRoHMnRpM6mL
         BCf4eZWuZn5FX4+QkGs03YHbmrRyIJJ/h/ZMgNAjlknyL41Pd8lKWXIh+tfjlSTPsQyb
         nhNpxjZatCKlZlbMBySn2Om5UhaypTyMxMBs9jJWDBnEEKyejhcecvk3aRia8+JUrLER
         HxEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783659973; x=1784264773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aUrf6Km35HLEs48Iv+5EKVZGrilhk0m+5i7bYMdUoc0=;
        b=cJHcyezrv4hr2zYNbCNX/EEgJksZvO66Oh0eKI2IyyDlOgfzegCUyPuAQMpzY+Aug/
         eGwM7OHgfJccLKL1X7RS6Ck63TKsbfHP4tWJUL2lSCFeS0TTPRjW1qugPChRxqyLZ9Zx
         PXPzX5JJoHoOcb8kYdsLDAoBkEAEqdQ+5t4NtGhLt4Dc+KR5A0mZVQsvCCX4GSCDYi8F
         O/TRGMWmmHAy6+jEkmEw8NnTJxIwEHK1kEHkhhV15J35LcQRTpHVO7GtnRjft1BsNW/N
         OAQ2kZW0BKeN639s4l5WCJWWiPQ7NEHHXd1I2NXmAgm9mrNMXZ+lOcENbvqtPwxWm8VR
         Uydw==
X-Forwarded-Encrypted: i=1; AHgh+RprYeJXhYZvgYy+45PeplL1RSuP4OCYvVcE3jIQJgJrg78ENLyky54Iwm1RHNAh+TksEwXlTylrps4YGA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6yT46DdoIMKH03DSDQCm9+j25aBx7quYvipAf5egjdQmlYy+v
	YDfNusqf5DhE+sZr0JzSNGnj+ivjOuAkfAijQ+UL0UnIJd8srsCX6jY8
X-Gm-Gg: AfdE7clSfxbkS20A6FMxRKPJNTpX7LGDrLUnhmxiW2M0uaxT2mtEu2OnIc/L5TfsWzo
	Ix0LdTmaAhV+ZUn6eGM2KPOi2GpE8rKfbyps8etGuhu6xgzNeul1tgSX20Z0X+A9dtZ6oRnr3Dr
	tndXj8+hdGQBuV6jxHJ+QIGfWaizVfSRygAzUG77I/2/vjYu0OaiSLCuyE5SJRECNIA6LLnP6dC
	H+l4+Mb+zD4hDJKcKsHb7TSPdY2esUTSfvtJOZdjtAqFtc3Vg17HTpqzCyEfCQonjbVkOzIZ2pi
	N4ncnV5pBSMDykgv9CKPaRj9DmC8Q9pfKPDGRBQBrDbnFdTKHcYf/zzD6GiaD78dkNd7ESTdrry
	8T7AlGCH4gtUttCsLua7BngMT99qA6hyKNq0vDOzVcTWHVk2RfbFyWjsuzRVSim++CSY0IpG7HL
	qrXl+j7qiZwJhaWyaYPYOeiMRwV2XEzdqznrBLl7vfDoiNlfoS8F7CjCfl+g==
X-Received: by 2002:a05:6a00:98d:b0:848:63c9:ee38 with SMTP id d2e1a72fcca58-84863c9f684mr4368247b3a.39.1783659973416;
        Thu, 09 Jul 2026 22:06:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:06:13 -0700 (PDT)
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
Subject: [PATCH v3 08/27] ASoC: codecs: hdmi-codec: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:04:52 +0700
Message-ID: <20260710050511.14439-6-phucduc.bui@gmail.com>
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
 sound/soc/codecs/hdmi-codec.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 13ae9e83bc21..bc2c22436ba6 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2015 Texas Instruments Incorporated - https://www.ti.com/
  * Author: Jyri Sarha <jsarha@ti.com>
  */
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/string.h>
 #include <sound/core.h>
@@ -452,31 +453,30 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 	if (!((has_playback && tx) || (has_capture && !tx)))
 		return 0;
 
-	mutex_lock(&hcp->lock);
+	guard(mutex)(&hcp->lock);
 	if (hcp->busy) {
 		dev_err(dai->dev, "Only one simultaneous stream supported!\n");
-		mutex_unlock(&hcp->lock);
 		return -EINVAL;
 	}
 
 	if (hcp->hcd.ops->audio_startup) {
 		ret = hcp->hcd.ops->audio_startup(dai->dev->parent, hcp->hcd.data);
 		if (ret)
-			goto err;
+			return ret;
 	}
 
 	if (tx && hcp->hcd.ops->get_eld) {
 		ret = hcp->hcd.ops->get_eld(dai->dev->parent, hcp->hcd.data,
 					    hcp->eld, sizeof(hcp->eld));
 		if (ret)
-			goto err;
+			return ret;
 
 		snd_parse_eld(dai->dev, &hcp->eld_parsed,
 			      hcp->eld, sizeof(hcp->eld));
 
 		ret = snd_pcm_hw_constraint_eld(substream->runtime, hcp->eld);
 		if (ret)
-			goto err;
+			return ret;
 
 		/* Select chmap supported */
 		hdmi_codec_eld_chmap(hcp);
@@ -484,8 +484,6 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 
 	hcp->busy = true;
 
-err:
-	mutex_unlock(&hcp->lock);
 	return ret;
 }
 
@@ -503,9 +501,8 @@ static void hdmi_codec_shutdown(struct snd_pcm_substream *substream,
 	hcp->chmap_idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;
 	hcp->hcd.ops->audio_shutdown(dai->dev->parent, hcp->hcd.data);
 
-	mutex_lock(&hcp->lock);
+	guard(mutex)(&hcp->lock);
 	hcp->busy = false;
-	mutex_unlock(&hcp->lock);
 }
 
 static int hdmi_codec_fill_codec_params(struct snd_soc_dai *dai,
-- 
2.43.0

