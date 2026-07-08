Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED914C6EF4
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 14:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520557; cv=none; b=ppFcWaAbr2T2a4qpizAW7AErJvB84x7Eqe9igrXfD/C0Y6u7UMx/M1sVe3N7jnI4zOGtEsSx7GOaszn8AtXipOJP7DMNK9pOYHybUqIrwYbuealOcH1pdylAR7QQ2BiEASsY4HNTxHa9PC+NYxNhgtuL2l0Cy4E85TigR3fxs04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520557; c=relaxed/simple;
	bh=ZMoGYXzBLvrBQRdqjdqt98OY+gxVFDlZHgWP4vbmuB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OR3S8UlJMEtBWKA+J7J8+rF3ypjU4mLg1D0Lg1BRgyIog+gV8EcfS/J4Ab+2zhReMGJKehgPChDZDWCX4IUG8sIg2HONS5VeDsA3C/ONgQ4sdvmPbrZU4Qmlpu6EjfGl6xeHzcKos+ocOxNqL07/eju7Eq7qWNQgsyPPgmGQIvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mYvqEb7y; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mYvqEb7y"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c6b67d5fa1so8375945ad.2
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 07:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520555; x=1784125355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=opfO1uNasWbxDk0QOATGHi4cTsmB3lXCvlDICGsJtuc=;
        b=mYvqEb7yPs7l53jqqPMNtIn/9QZf02GRnmk1rwF90x45p/eCWJlarXkZpBzNnakTbz
         dIV0HP6M0l9D2kiFyflcYBND3ulwypHcArnnaP6uIyRovqlfvsN0njPgPZs0ToWP0zZW
         QltZj9iR5REQarAqQI+d4B4QQvdSlQfOvpHZugpmxnAix3pb2y6SNbEJtZFj8C61P/98
         6d9CRz80TY1rQaBEuNiPJMplI8eyAO5rWuU74WGK8TDSNSmnpRsc1rj5e1ErzJfLUh3c
         XJ9xzIe3KpkxroypoIt7otNIYvGvvN0bnS/Y6nfpR3eAy2qFET9r7sfvNFOPqoYrCunN
         R4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520555; x=1784125355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=opfO1uNasWbxDk0QOATGHi4cTsmB3lXCvlDICGsJtuc=;
        b=XeL+vex1qxhxHECumPg62D+Vaje2pN5GmzdDILp7fZkku9KiKjw+7mTCpa273s/Usf
         H+uqOgQa2SUyCkxZdQQwfRymlOF1V8ec1KhBahnx+YsMZFsk2VBbxKNvBTNLxbN/wyXs
         cK3XlmUKzeqlA6v/KY0DfXOq9tr05Xok+TNjpBiETJvPwV59sp/Cq1cSST6hRPZdZvwY
         zHMS8qj7B+DFapEr2K7VTpWVpdQXpizaHFLvGjDU9Hq+xM1x5j5FMfQgNfwdMpu+WS4/
         pjckHjT2hx2jFDvxDY84WWliBT92lFH1NuG1bmBDA/2DwpiEJ4OBOtx16XTqrBIbwxWd
         3PgA==
X-Forwarded-Encrypted: i=1; AHgh+Rpk9mPFDpQoaFNi8v/LcqkiLM++GUnHs37Ws4xu1Sc2na9Ru8J576Y0u2S/8zKF0fu6S/yTyauW3gOKYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDgRAqGmFPWv5AchIUsPe1OaJ1ZbbB6LRZ0wMc9dApBko+WYem
	WF8uqGQQU19c+TFIMVe8yP/lSjpPtfB7/BmdLUlSc3eoYetx1KS6/W/x
X-Gm-Gg: AfdE7ckbg7AAfTutdmIDDuDhb44SOwgWy7vK4CIE7sYQXKvxKHzsrOR6zSpbClanwmo
	X2V1NQNzA4NEaSF2Kq58Y6mgZ4K2QIYvHZRYtTZ1nrr4SALNf5zlsRXFRBRjrABw1kFpvk8i26B
	jwQc/uTkRxpmFr3Q6aswbZSZwh6phMYOFlz2gaWl7QbBpf8nZZls3MUZkCeW4ZQgNa9AklkgqiL
	rmWM3jIwg2omd79JroIA/2tRlORrBge/m+KN3faVJaxqyDOmmPgx4/NQM/LpWaTLCVbd3CPRDwT
	fuM97E6B9jmZv4fJNitjt4ItZ8yYlFDw6snSzFE4EGP/OUFULE62U6wNJNlwysuUxMzwuRcvzhY
	kfog/wX9rqPcqa9M3OxymeZ0MdQwQplA9t2ltVlFsVn1+qWLjvrXOouq70fFwYYDeSM1yD0KvIF
	zOUYgCbrejiKEmhpMt9VqgDcsbb2xL/hKxwtQZaFL60IJ9T18=
X-Received: by 2002:a17:902:f68a:b0:2c9:fbde:ab66 with SMTP id d9443c01a7336-2ccea472721mr33400315ad.37.1783520555235;
        Wed, 08 Jul 2026 07:22:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:22:34 -0700 (PDT)
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
Subject: [PATCH v2 26/27] ASoC: codecs: rt721: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:33 +0700
Message-ID: <20260708141734.578926-27-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt721-sdca-sdw.c | 29 ++++++++++++++++-------------
 sound/soc/codecs/rt721-sdca.c     |  5 ++---
 2 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/rt721-sdca-sdw.c b/sound/soc/codecs/rt721-sdca-sdw.c
index 02df04a0ddad..f4f7fc306ea5 100644
--- a/sound/soc/codecs/rt721-sdca-sdw.c
+++ b/sound/soc/codecs/rt721-sdca-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/module.h>
@@ -467,13 +468,13 @@ static int rt721_sdca_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt721_sdca->disable_irq_lock);
-	rt721_sdca->disable_irq = true;
-	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
-	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
-				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
-	mutex_unlock(&rt721_sdca->disable_irq_lock);
+	scoped_guard(mutex, &rt721_sdca->disable_irq_lock) {
+		rt721_sdca->disable_irq = true;
+		ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+					SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+		ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+					SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+	}
 
 	if (ret1 < 0 || ret2 < 0) {
 		/* log but don't prevent suspend from happening */
@@ -495,13 +496,15 @@ static int rt721_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt721->disable_irq_lock);
-		if (rt721->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt721->disable_irq = false;
+		scoped_guard(mutex, &rt721->disable_irq_lock) {
+			if (rt721->disable_irq) {
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+						SDW_SCP_SDCA_INTMASK_SDCA_0);
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+						SDW_SCP_SDCA_INTMASK_SDCA_8);
+				rt721->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt721->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT721_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt721-sdca.c b/sound/soc/codecs/rt721-sdca.c
index 35960c225224..159c35d19dba 100644
--- a/sound/soc/codecs/rt721-sdca.c
+++ b/sound/soc/codecs/rt721-sdca.c
@@ -5,7 +5,7 @@
 // Copyright(c) 2024 Realtek Semiconductor Corp.
 //
 //
-
+#include <linux/cleanup.h>
 #include <linux/bitops.h>
 #include <sound/core.h>
 #include <linux/delay.h>
@@ -289,7 +289,7 @@ static void rt721_sdca_jack_preset(struct rt721_sdca_priv *rt721)
 
 static void rt721_sdca_jack_init(struct rt721_sdca_priv *rt721)
 {
-	mutex_lock(&rt721->calibrate_mutex);
+	guard(mutex)(&rt721->calibrate_mutex);
 	if (rt721->hs_jack) {
 		sdw_write_no_pm(rt721->slave, SDW_SCP_SDCA_INTMASK1,
 			SDW_SCP_SDCA_INTMASK_SDCA_0);
@@ -309,7 +309,6 @@ static void rt721_sdca_jack_init(struct rt721_sdca_priv *rt721)
 		rt_sdca_index_update_bits(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
 			RT721_GE_REL_CTRL1, 0x4000, 0x4000);
 	}
-	mutex_unlock(&rt721->calibrate_mutex);
 }
 
 static int rt721_sdca_set_jack_detect(struct snd_soc_component *component,
-- 
2.43.0

