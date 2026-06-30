Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821913E95BD
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 06:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801465; cv=none; b=RdJGb033HHQWLlS0DrO9/xWIEofsg5HsIOwErnJU/68iPpekRqXjETEElHFqZoIp0gbRY2AlNw02bqIfjh6IbEhM5Insp24JfVv/cTwz+ERLC8Q3RACE6RLxjQhjoApXUe4AO8j256b5CFP2YVN7JZ4YED/OYr0Chgm6VQxI/3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801465; c=relaxed/simple;
	bh=EIQsPIFGpWU19M+kDklYuiSZWizQeKdwr7QPFIQrZeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NPfS4VTzwlR+rmcoZ2r+eHONO2v1bvW3UL94P7yWmrG4H3THeTCSXnJ67tCeWBEPxrW3O2VbtMtK/No04+stFmsVTjEMYR531O0t22/xnE8x9ZmoQzk37sIuorhFlJQTCuaciCg4VmypEHVcFWYyE8Wf4qhU+KxKGvnfQPjHvk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XWPm06LI; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XWPm06LI"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-845b6d9bf39so165788b3a.1
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 23:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801456; x=1783406256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ro7dNqCD2kLl5dqOgIDoE4tVtLHIEVBSdhnRDBcC1Vc=;
        b=XWPm06LIh3EltvrXMwcXsDWmCpOSFikMYgX/83qOjOvCw6LBK7NSGdpE+zQaLQxTyT
         gosq3W9ze6rbT3OHy9H3Zq25ZQ6NHwtH7ZFtQXTmHk/w6XYxReXA8W84sDfoU/CZekWZ
         Z8P8Hfaqdt1v0UHJYb9AieGE3Qth3ckJvT0mP9mP7Sjs/rDJ2Soqu4Bl8wjBHXQTKvpO
         ob4Gl1DMhiy6aitLFEM94f3Z6TOBfp2FKAJ4R12Uww1LdMyvByRZ8mrxAspSAuCDwBW9
         tMfRQrBCx4lb2VZQ+M3jM2SLSY6YFlliCQyB/GgvnPVh+boGalZIc4Rx5Io0Dx1ntvev
         HlaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801456; x=1783406256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ro7dNqCD2kLl5dqOgIDoE4tVtLHIEVBSdhnRDBcC1Vc=;
        b=MWQw6gfrURt8u7yWE47RBZd9u8EIlqaGlavMPGYtcUxx/SaPAUo4j/EmjvSFXpdq1q
         ENsGDyU0BCYcnm7PXGx8A5I3ErvABucJd5HzBaOCiQRb4gda0bshBa88aCj/Nre5yiEM
         JNE1/B9zFwrCJrn+hvR5N8SPcRQMWBcFMLx5mdkaEoufy9swvAW+PnyFIWYtWn3vpnyv
         azh2zJ4roj2Aa6nw19acUPgbRfAzYDpSaWzYAZBfniVFpO/Goiv2P5OvxKdRQDUIzMr6
         64jHvXBOqsiej4lCH69G5c6+DekGGSHRMsWR77AnAvyCotDaX8UmvZsKyODdpKIFm6a4
         GhcA==
X-Forwarded-Encrypted: i=1; AHgh+RoBe6sTASwcVfsvIynN/JJyT0w5DiAd0PDlGp/kq/qyX7+qjcMnE8OaiptfbFYAaV36OholfNtbEML5iw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw019SzjjMf/PpGWobn8HwOMni2+NsdJpsnuSZlak3cB5JByplc
	vNBr5EE70iasemEV4Q/i/Rf+JnD3BNYaYnngl6giyM7ZrSsz7KJ7RSF9
X-Gm-Gg: AfdE7cnU8jVHvLp8/jHz6BG7o87gb87YD8YZ+7ys5NFegbVbmldSShaV0Am/4KyPIiK
	Gs9M8AYxmQl/SzTSJUmy404Viy8GMWGFMpIvWqov1IySfX0UOmxLxU5Zf8gO1MhQyvtBBqiM+sO
	Ev5S8GVSMMCU41sNU39QNbuj0qSauqSTPxu2lxbj3w/5AQ7SN3ZBABRczywAA/iSd0Xs44GxIVk
	GQUBVwtw36HlcnbacmAhns9cM6Xd+8Cov9bMMypyGwa8WTz5Jg4kE6eOHNMCoONb4qLQKzu/uVr
	DdXT14Kf2bMjoInkfB/EaaaUZMinfIAJM7Q/VTeX7G4HKkr4QYKi2VORag3ov2JzrZagaB7U2fy
	wkAZvHxLrkmX4I4mnFFHhAGTwXzJl0JchBJfbpNJQt6KxHZaCC12PXFZSeW6smcl53g50zRZ4gL
	hTiZjyJ+djH7ZMZI37p0Tx9bp2mpJxzPhtn7xDMSrQCKH8mSI=
X-Received: by 2002:a05:6a00:3d04:b0:837:f111:b70 with SMTP id d2e1a72fcca58-847a81835d1mr428150b3a.4.1782801456574;
        Mon, 29 Jun 2026 23:37:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:37:36 -0700 (PDT)
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
Subject: [PATCH 17/27] ASoC: codecs: rt5514-spi: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:39 +0700
Message-ID: <20260630063449.503996-18-phucduc.bui@gmail.com>
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

