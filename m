Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6FB48BD4E
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 10:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629717; cv=none; b=CKoiLDWZgB9qF8YwKkSm093bkXNToLkltbe8mFDUDEmAgPgEBtynxU2WrL++Oh28jrXsQeR6kJV8RwKnnImUk4RTs/65FQK09tVkX86CzmhRwEDdx+KXKEwq4YY8xaBlSGVKgG3jIJ2d79VnTi7F+59u6UjPbM+nHrdEbp9O/E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629717; c=relaxed/simple;
	bh=EIQsPIFGpWU19M+kDklYuiSZWizQeKdwr7QPFIQrZeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gk8Z9Km9yFsLHigK8NtsTPIEG8a09p0Rd4G0c0MJaa/6Mhv6mSfiD317gmsVVbpUaK0Yl/QHrOOt/LDhV14yCqTUdMmMD8tYOKqlNldASu4XySD3Z1TRjaxo1hMCfXj+rCpqlyjOnQ9hTuUb+ugLMLXKtUY/SQr+OXjr0Wlu7V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=km+L7MQi; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="km+L7MQi"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2caea3f742bso132678905ad.0
        for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 03:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629715; x=1785234515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ro7dNqCD2kLl5dqOgIDoE4tVtLHIEVBSdhnRDBcC1Vc=;
        b=km+L7MQiksXqPI04kaC9SiXk1TCuRmJwfhzkLrFLng1hBEil7lXqdvYR7g7adADA6o
         Mcj0D8/eEFp9Vgrw3zTb1d9RIARhqn3b0PNb8bmfVPDs7ZVeAV6EsoUDB/BxP1lH/bjs
         Kr2rPqJRhu3DkjhMvEXJeEKEO6mEmTM4ZA0ObF//852R/qOUgrT1iMyzW55pZwtpw88o
         JReS++pfKvcazgkLYQErdcVMxXsIDtOR/pf0W/809Tu9sE4qmaxTHf20F7xhwCeDABMm
         zLK1+C9sOHRV58Gv5Uqo4G3w8KiUrRZRUCzXYlRHMg07B6R4ofU1fTZv3B4OjX1Hpm9o
         egJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629715; x=1785234515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ro7dNqCD2kLl5dqOgIDoE4tVtLHIEVBSdhnRDBcC1Vc=;
        b=nKEf6DNIW84TO3ueUsXy7KqpKi1fH2NYjmJe7wdlr21pavf+BylcelcVgO4zL3aO7u
         m2bugFkbGIHrbl6R5lxSE7R4UA7gAcv0U5Cr76z0FXHc1PyyyBOKIekmm3sbPtSC059l
         yllFNoGrdJ1UR2/Kc602DUtDQG44HBvxf5A/MSJ4p+ytXwTCyK8Ve7VuV4Y9L43yp2M0
         g2+YXi4XqJ3/YLuhqiiOumU48OiMDJ1rTgxmohEoMWprjiUfWqFpCPDlNcPBESZ2iz7d
         pyTrsj2On2GQT4mwZ2lxyGIzMlON3nGrYwK9J2KulP8rVelTRCu2/1u609jBHn0Y6q8l
         kPSw==
X-Forwarded-Encrypted: i=1; AHgh+RqBgz5zLNKEpIG/IrRIsNyU1j6w/Ngdh8vHXpXsVDHUH5I2AOslAonZZSn+U00BEWKZYT/pllmfRK5CkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjMjv1h9RNJN/v+IEjWOMzlwGD8Z2mckCVkFlpH5d775LaWKIL
	KSQUnQftGltUZjw55ncNC+5qtlJWbilM2Vxhw5ZvJ3S/I/FR7VM+ect1
X-Gm-Gg: AR+sD13GCatCBsWs5WxTju6jb0rNSlDerf6A3uTuLJwLkjzMjLk0tASadVBfKsCdn98
	TXC5IRXDfg1cZfLjLzZ++ibCzSq3HKt/Qvno7yuls3UM7D2RsbdAhqknNQWcdBOPPrm423d9NXy
	dOR8bR5E0XHJ42JnRv7VQ0Q6oHxGXfzyUw67EvHeAYvHRqPrptGIiDDqg01xoRUSumk6pq8g1mI
	NUzOK2U31fJvdwWWoiRAWU4A2cSRo32GvcqrIHOWEY8SZ3Iqj2/bNGIrVtKZlvD7OAxCNwfMvxD
	NCj9nJ13HsT+jpJQjtRajCbZ9/mKKm0vuhSg3fG9y8HUDp/sog69L1ueqa6nyBM7tmEii2Ehk/S
	YAG+/UXp7EAcOx2jw2XuQ7fOPFe+VrBN3BDher8Kifb2uBeUQAT2GC+Jyx1yXJuwi8zj+6Xc+GU
	NNSQBaj/zSsdBpQTO6778hJ2u9wS9mzc3RDrJQ
X-Received: by 2002:a17:902:cecd:b0:2c9:9a19:10c with SMTP id d9443c01a7336-2cf34a4c9d7mr187717855ad.40.1784629715407;
        Tue, 21 Jul 2026 03:28:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:28:35 -0700 (PDT)
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
Subject: [PATCH v4 17/29] ASoC: codecs: rt5514-spi: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:48 +0700
Message-ID: <20260721102600.523199-18-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
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

