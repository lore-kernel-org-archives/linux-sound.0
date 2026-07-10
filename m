Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3705537881D
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 05:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783660135; cv=none; b=E99VPCbmX2YD3rPI3ocIiQxtRyiDFZowxrpG96xB/u9QtMowd+X3zSb0dQf56ah+74KTz8z6YIF1ix1r5ikBS/FdLPUgps9MjADtczDE/oPLQ74Aq8DT5MPr067bQXTMGViJJ7DnBM9yRAWrHzmTQZuk32MoGj2DfPRbtJzvMCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783660135; c=relaxed/simple;
	bh=4l47nKOfFrpcLKwvsMkxuD6ryRZ/IuK5tCYTAO4zVh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jI3GAPDJEve6IrmN9ZHOr/HZGxDS0yZT2hp5K95Jhjp1crGtovwykXT5wRZWrf7RPFj9OFLPsEc2dItjBU4VyYCGioyQh2Xd+gzOMiGSSXrllyjorsYqRDqzeaiR6uOXfTM1DTAE/3ga3B8HUZrn64mwsXfYcBUxf1nJqYltJyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=he6aQEHO; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="he6aQEHO"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-842338c18e0so427604b3a.1
        for <linux-sound@vger.kernel.org>; Thu, 09 Jul 2026 22:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660133; x=1784264933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/iQDQsc59ksOHtvDkgxoCvh5YAWSsI1newC+9ZPwxzo=;
        b=he6aQEHOUrruYGQRXKgLuiLDlWdSM1rHQWvU3ULJoCzh3wZH/X6nsbdhTUd2Q7RK1S
         lFj9yKoiczL80uYAvjpykdzuyY66a8mo5CM02vFqN1HrtmJbOx7KhlUETiamToXhtRdc
         y3UF+vNKgxnVyk3oYtQADNEUjE5P4JWSFLo5CRUlyUmUr7bdziSx14L69hswUSKb8LfU
         2uAY6HqDaQBBb+ASDraijUxk/an6Bn/du1cnLS9VEBu94C6z7gH4LibV2OPAyaqS8XVJ
         2G8Jq2bYLVuNjTXWtkAcvpccR/FiVSXKFwgWPtxHJv5ieDVjWrqEPy9jpcwklLEUEVBe
         xEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660133; x=1784264933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/iQDQsc59ksOHtvDkgxoCvh5YAWSsI1newC+9ZPwxzo=;
        b=X7nA6nXdUXREYB7RueeXBJeweECm1Rkk/mJN8hSiIgdekiRountpNnjcudA1/IW7ap
         JsKzB0jhf8yCubx3Zbwuq0cOjwlWWFfVCrztKSOMuRektL6Q0H0k3k8FV3OtX1N6sA2b
         cBVUPcWaWC96DFXSt7IAmX/ihtY76gV2c2EdWe9nTfK33QSgBAcjNMionOc1WPmbulJS
         R3AHHVIpmM9bsv/oV3Ii9577PHFudoj7O9q7KFRKEpWlMHzJZWuLfWuGNaOcR+s8Exr1
         Pw2rVMR56nH47O2xh2HS3JsKnOVf73cLKPErAXJ/bXY5r/kYLXa5y+9Shd5HL2bkl+RH
         Osmg==
X-Forwarded-Encrypted: i=1; AHgh+Rqyzj+7JdJS4oypyaRONBhKST7KglrOSfg+08GUcfUAxS1ysHH5vM/bnbZbYv1qFST1JkQd6UjYdgfGCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwahTBTrhka5Ofhpi2mV0Cl3eO1ZkgKdTp75Cd9WEC/2FNlLD2E
	bFlUt35BrodzkJTjwH1OfWxi2yutq3K8DZJBBMx/EmWBLPsA71TpP+gH
X-Gm-Gg: AfdE7cnk6yNV/RDBW9wABMvdwjb7vjpqxUMBBsjOmCooTP3VGZx/I/+2/G7MUYghHSt
	qapRHr2IV99HoUMRJGemRc8WMAYRxd31xKIFMAIFoqFzNzYpNmNBvlV/Q2zfWIjIXwYiD1KGQq+
	Wb82h38AYnYAQqcS6wqo00BBcdT5SJ5Ha2Ekeit1RhyB8g7aFUC/srNxstHJ6Annp9EHm5VZnH6
	+A1Li54Oup11SDVcsaHSdnuX07EnPAmY8K5zllTRuhgVKVIzyytTmmZ4HkA/I19GGP273gQbHYT
	X33SUwGCJ2RYGr2lxuNlFBUhkKrEDyANkUZ+UB6/7GsqZLWPZ4k5EoFk8e2IydRa7qHtuu55i6h
	jxUIjMpe7E1ni9ZgwIGCJDtqdil6sTwZjaWl0f9x7icb/rGRb179jjKJWmc4dQsdi9+ZGv1qTmZ
	ZIaCUUUDWC98wioZ7hgn6G11w4J9RBiNR7lOOlQ96yyBEb2GM=
X-Received: by 2002:a05:6a00:bd0d:b0:848:6698:2d5a with SMTP id d2e1a72fcca58-848669830bfmr3555077b3a.20.1783660133566;
        Thu, 09 Jul 2026 22:08:53 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:08:53 -0700 (PDT)
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
Subject: [PATCH v3 27/27] ASoC: codecs: rt722: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:05:11 +0700
Message-ID: <20260710050511.14439-25-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt722-sdca-sdw.c | 29 ++++++++++++++++-------------
 sound/soc/codecs/rt722-sdca.c     |  4 ++--
 2 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
index e68aa0350a5b..db1aeea2ecb3 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.c
+++ b/sound/soc/codecs/rt722-sdca-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/module.h>
@@ -513,13 +514,13 @@ static int rt722_sdca_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt722_sdca->disable_irq_lock);
-	rt722_sdca->disable_irq = true;
-	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
-	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
-				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
-	mutex_unlock(&rt722_sdca->disable_irq_lock);
+	scoped_guard(mutex, &rt722_sdca->disable_irq_lock) {
+		rt722_sdca->disable_irq = true;
+		ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+					SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+		ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+					SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+	}
 
 	if (ret1 < 0 || ret2 < 0) {
 		/* log but don't prevent suspend from happening */
@@ -541,13 +542,15 @@ static int rt722_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt722->disable_irq_lock);
-		if (rt722->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt722->disable_irq = false;
+		scoped_guard(mutex, &rt722->disable_irq_lock) {
+			if (rt722->disable_irq) {
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+						SDW_SCP_SDCA_INTMASK_SDCA_0);
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+						SDW_SCP_SDCA_INTMASK_SDCA_8);
+				rt722->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt722->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT722_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt722-sdca.c b/sound/soc/codecs/rt722-sdca.c
index 1b6729f363fc..decf9407ab6d 100644
--- a/sound/soc/codecs/rt722-sdca.c
+++ b/sound/soc/codecs/rt722-sdca.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/dmi.h>
@@ -294,7 +295,7 @@ static void rt722_sdca_btn_check_handler(struct work_struct *work)
 
 static void rt722_sdca_jack_init(struct rt722_sdca_priv *rt722)
 {
-	mutex_lock(&rt722->calibrate_mutex);
+	guard(mutex)(&rt722->calibrate_mutex);
 	if (rt722->hs_jack) {
 		/* set SCP_SDCA_IntMask1[0]=1 */
 		sdw_write_no_pm(rt722->slave, SDW_SCP_SDCA_INTMASK1,
@@ -317,7 +318,6 @@ static void rt722_sdca_jack_init(struct rt722_sdca_priv *rt722)
 		rt722_sdca_index_update_bits(rt722, RT722_VENDOR_HDA_CTL,
 			RT722_GE_RELATED_CTL2, 0x4000, 0x4000);
 	}
-	mutex_unlock(&rt722->calibrate_mutex);
 }
 
 static int rt722_sdca_set_jack_detect(struct snd_soc_component *component,
-- 
2.43.0

