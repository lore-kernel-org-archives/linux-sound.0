Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC21477E53
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 14:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520483; cv=none; b=T3zyrWeA2an/3WoTzjFuWYX49XNDPIOvo1OdUiDDpF3q+R4hhlvPmNFJW2sukOQ7NlHcZDWZduOupfZVr81PdkDC22s55/Oebbh5eHv1rUgDJU3oC01ahRoTMfMFbR2xrH/oKNI/KJJsW0ezOFDfnixTLB55/lmaOy5Gh24e93Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520483; c=relaxed/simple;
	bh=EIQsPIFGpWU19M+kDklYuiSZWizQeKdwr7QPFIQrZeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=piOVkNqUHN/a5+bGBa/NefDB+66Qn98NYh3+CmxiBatwkMOQHoUEnyzqJ/C6+Dep9AFlHLHUgmM42/Pbgii2iKFUNIgsxZRAxw0gnTGROuaB6aIDzKNlW1xfijkaerPyOXyb5FCLVFB1Ruy7t1cK9VGd0JReV4n+QgQNAPxEpjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HYcyeakk; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYcyeakk"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cce6a0c9c3so8635055ad.1
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 07:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520482; x=1784125282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ro7dNqCD2kLl5dqOgIDoE4tVtLHIEVBSdhnRDBcC1Vc=;
        b=HYcyeakk9i05Ka1YwJj1NyWpdfRDD3hsbMfGA2IoJ6aZSJyPDM0q4N65EtRFZbidNa
         Ag6Y+VoqTAzne6AuU3JaDtCpPwsZB0BO2d+dDpAAB5CeF9U2WPvabCr++Jr43JOkukAn
         AABZWdVRZq1PZ+A/XngIhzpv1ipQ8RKvTSXdDg7AVMUifGDzOXosbwXEPIMxet7mjbpx
         SH3PR+5a2pi5pl0f1yp2b97BVdegHQ0zY/p62H06qbGl2RQJakPspu2bncv8JyYM8W/M
         lOyvPHkOnYTl+wSCzHqZ/XSXmd56O3Al/7Y1lXEQq4Kn3kfAXUmL1HjFwWbk7ikTLLiz
         NtKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520482; x=1784125282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ro7dNqCD2kLl5dqOgIDoE4tVtLHIEVBSdhnRDBcC1Vc=;
        b=kADyVWn+bAyTZ/1SNh9DO+NMyWjv+v9eAXzE3B8HhQ6OHVjQwrHHRtKhuwBvt5vt64
         vuHjLsfTGtHiGN+OhdfonQI6rbjqbA9jm57jWVnTG77xeLNQdirVdmwPwZnfHkrXmcHC
         rXdzFwVU12VM/IMbItTG0ssov+Bh5xm6/wyWtn/UHW8upoXuBnyyTnk3M5p34+LrxyFG
         5FT/5nJBE1sc+JrInBs3LZUOaWcMNjQCKeoGwuZZy+VScQkF4Lyoy6DpCssdr7CacFVe
         UfrtYv4ZH2qPpac5gPikLhP3EVAeIEiwPo9a5+jyRgsCkF7IUxH2NQHCBgmEIeux1jOp
         Uosw==
X-Forwarded-Encrypted: i=1; AHgh+RrLdOeW5MQAR2kXd3gW8fN9aeHY/HYpnk3NfnE6MosO8eN2YzXMBWIqgeficwCtPvff0TVcU3Rh6bjR4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwaQ6jmJog7sBWeIfI+eI+jPzr+64/ohQnE+cFxsrtGJocpQ0x
	Msd0uvH1tx5KnTBEl3ONxLNykjelJYpodqLBN8upN2iEWW8qTKvivcGd
X-Gm-Gg: AfdE7cmi8zlP8JeU+yJhJAxRMSuQdivkiRwyICNnZlGukhM0IANM6RWloj5kwwpzxTs
	D0Zigu4g3hCbNZFzaH8whxHwB/8RwkhnNxx++wou9B5SpLg+ebCzNbvgMGI9LfzFP3RGmVEdlVa
	j2BxjnoqI95f9BopyQMZcny/zXHlsog85r2MU+dhxPZ4SjG76MlQpaPqNw6s8Qt+UfVy8OjJAEy
	1gb77gHohAeLXBLtt6RFGSuTCLMk0YO3zJffF9RyOYbhKiwnkfV25wJDDO8L+ihSAuoguESeIYZ
	frMRUB0RQXbeAVEbq5Qd7oDSGPVd1/Whz0kr364loBm5MEnKjuCsPHAGNV9VvK/RgZZmUOTaJpp
	DNK7T/mJvbO+svsYuxf9hAeGY4LR9hbHS4FqMCp+FVvDPtZCIrgW6pOXVC6sKM0fQMyfGf87+Bz
	H1Zkk+cEGREMB9FXWTddOV+DhyC6Q09AI2YgOwoKOCQWdGtj4=
X-Received: by 2002:a17:903:4684:b0:2ca:9ab:e723 with SMTP id d9443c01a7336-2ccea481a57mr30746255ad.33.1783520482185;
        Wed, 08 Jul 2026 07:21:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:21:21 -0700 (PDT)
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
Subject: [PATCH v2 17/27] ASoC: codecs: rt5514-spi: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:24 +0700
Message-ID: <20260708141734.578926-18-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt5514-spi.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/rt5514-spi.c b/sound/soc/codecs/rt5514-spi.c
index 199507d12841..91290bfe8daa 100644
--- a/sound/soc/codecs/rt5514-spi.c
+++ b/sound/soc/codecs/rt5514-spi.c
@@ -6,6 +6,7 @@
  * Author: Oder Chiou <oder_chiou@realtek.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/input.h>
 #include <linux/spi/spi.h>
@@ -79,17 +80,17 @@ static void rt5514_spi_copy_work(struct work_struct *work)
 	unsigned int cur_wp, remain_data;
 	u8 buf[8];
 
-	mutex_lock(&rt5514_dsp->dma_lock);
+	guard(mutex)(&rt5514_dsp->dma_lock);
 	if (!rt5514_dsp->substream) {
 		dev_err(rt5514_dsp->dev, "No pcm substream\n");
-		goto done;
+		return;
 	}
 
 	runtime = rt5514_dsp->substream->runtime;
 	period_bytes = snd_pcm_lib_period_bytes(rt5514_dsp->substream);
 	if (!period_bytes) {
 		schedule_delayed_work(&rt5514_dsp->copy_work, 5);
-		goto done;
+		return;
 	}
 
 	if (rt5514_dsp->buf_size % period_bytes)
@@ -111,7 +112,7 @@ static void rt5514_spi_copy_work(struct work_struct *work)
 
 		if (remain_data < period_bytes) {
 			schedule_delayed_work(&rt5514_dsp->copy_work, 5);
-			goto done;
+			return;
 		}
 	}
 
@@ -146,9 +147,6 @@ static void rt5514_spi_copy_work(struct work_struct *work)
 	snd_pcm_period_elapsed(rt5514_dsp->substream);
 
 	schedule_delayed_work(&rt5514_dsp->copy_work, 5);
-
-done:
-	mutex_unlock(&rt5514_dsp->dma_lock);
 }
 
 static void rt5514_schedule_copy(struct rt5514_dsp *rt5514_dsp)
@@ -216,7 +214,7 @@ static int rt5514_spi_hw_params(struct snd_soc_component *component,
 		snd_soc_component_get_drvdata(component);
 	u8 buf[8];
 
-	mutex_lock(&rt5514_dsp->dma_lock);
+	guard(mutex)(&rt5514_dsp->dma_lock);
 	rt5514_dsp->substream = substream;
 	rt5514_dsp->dma_offset = 0;
 
@@ -225,8 +223,6 @@ static int rt5514_spi_hw_params(struct snd_soc_component *component,
 	if (buf[0] & RT5514_IRQ_STATUS_BIT)
 		rt5514_schedule_copy(rt5514_dsp);
 
-	mutex_unlock(&rt5514_dsp->dma_lock);
-
 	return 0;
 }
 
@@ -236,9 +232,8 @@ static int rt5514_spi_hw_free(struct snd_soc_component *component,
 	struct rt5514_dsp *rt5514_dsp =
 		snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&rt5514_dsp->dma_lock);
-	rt5514_dsp->substream = NULL;
-	mutex_unlock(&rt5514_dsp->dma_lock);
+	scoped_guard(mutex, &rt5514_dsp->dma_lock)
+		rt5514_dsp->substream = NULL;
 
 	cancel_delayed_work_sync(&rt5514_dsp->copy_work);
 
-- 
2.43.0

