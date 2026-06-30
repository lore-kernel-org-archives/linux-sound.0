Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F173EDAA6
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 06:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801535; cv=none; b=nKcxkQdj+GU9I153qkAI/OCN8kpqC6aFdmnQhmJyRiaN4E1kkpoeJqDHSDSXWOH423Y24pYGQLkkzgeuKJgpPYZYPnfbQy6oQWTH/1Br6JhDLpcC//MkU3H4953vS9RBU6LiKrQghsD8h586hXNdAUXtDX5pnFe4z7yGBQQG+HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801535; c=relaxed/simple;
	bh=ZMoGYXzBLvrBQRdqjdqt98OY+gxVFDlZHgWP4vbmuB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lyoRvU26xAE0tRqi9+M1bStFSUW15OIpz4L+B8wC5ocO62tExxOM9/vmNF3VuE95KZFhPRPhFSUSbly1TCgqdopBpuKX4rh33sTBGR57tzImnTeaZZO1lXdL/VjDCnuDK7SIQcFeqxZH+1quM6D00otTAx6SE3k+FMu7d0+Woa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZpPTcZt; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZpPTcZt"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84592b55832so2065893b3a.3
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 23:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801527; x=1783406327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opfO1uNasWbxDk0QOATGHi4cTsmB3lXCvlDICGsJtuc=;
        b=AZpPTcZt59fOWg7TF0EqNy14xskaoht0Ee8vYnSdU4abfqZb6lJiwRZq2gF4sc/D9f
         bYpDuIMEZTX4G95+Ww2MO2HUER6SgMD2QmS2BzBfhjSgZ7P3woqzTEwbCOs1XnQyY6dg
         nnzRrub3PTCjQLyYFKseNDcN4d/ib3+/39L8mReVzN0RGkStpzbdlKOtWYWlBJuVUFH7
         OCpIBAmbSpXZowfMNJnZ7u0EKwtxTec/FTIa5ZVAVZhZ24pEPE39I1YQr6kAapmhnnX6
         2anNiv/smaRrpsEwy3uAEFoLdFbSeywml5j+XaGpdF1Hyiw/eW2cRzwUOcr201ECgRwS
         rDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801527; x=1783406327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=opfO1uNasWbxDk0QOATGHi4cTsmB3lXCvlDICGsJtuc=;
        b=eLBayJ4CAQt31CgzyllPRz+bmdVPcgTMvWwzlPqB2vmeVxB+vgLgwpclwewDO/W71A
         rFzASnmFBUzoYn99wjcscOFyFDpfPsHj8VUCYS1pKMOkDoijOB4EhCj5P1J6NotCNLev
         FR5nCF5mDyMgbVj45HyCKimv6fE7cXXn2ZB3Pu+cHpc3VckNh+PHPGPbJljYc+X+GQZj
         dSkDWfL7DO55N5BcS4pYQNcWcMtQKpxcCX/OkC8O+JZr7SvDPeh5+i9o7Al4l7UFtDtb
         37Pp7MiBkLgWFoY78vXtR4jlyFLzIQkFv1as5KlcFFUdoIQjsDPO5Y9BQ8vIcGwF3+Ri
         drSQ==
X-Forwarded-Encrypted: i=1; AHgh+RrbBXNXzLXEfqUUXl/JK7CM0JNEud5d6JT9NZaDhpTn+2s1Pc1bAOmBeCxSgk+u99GlW6hqpPdSf3Lydw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5nho0Pa/+bXpLWP0iENrBwEnxbm7puLcQjl8HaRoCpSuB14ER
	7HmTeFg2LYLWQF+OpX4qYp0ZcM8QwKcq49cuJXg0x6K+Bk75rV6uWUVU
X-Gm-Gg: AfdE7cmpZR1xGfReMPq/o5SYRRQlx77aPXphhO6vXVEUvYA9/kS+8LQGDaq2auEro6L
	/uIRX39oN3FX3Q8yu3ICWG/4cc5jKqhHBzY57QyDtxaD+SAfUkv6VGUW6Xt5/eOyMfMCmS5+CX1
	bevjEyezSTE2f93CM78NIi9NxvXYz7Hc4x9yJ9FU7GMjqgP92+x7HUOiy1SUV2cwVI22m+or4BK
	kcIAHiLCd/5QFxRVgkWwytTUAU9lEwptLHmp7zu5e2BF4uDDd9Aoxg6kj4bZ7U1gNoUHa7jaL1d
	63x+qiwymEJzr7M+kFVFrWNpVEvonpl0Dzu2OouX0lmx1M2yf+lrltTrWdoW9xZa4J3L8bsl5ft
	BEe+45oE27cut+VzF70+B1b68fuKGolOc9nR7og76LbgOw3FGMD2fOVQfiupjbB9AACJGXvwPoE
	CpzZaX7iFjhNA8ZOZohEHFGt3MHu9igyrDkmT0IdCLucUGYuI=
X-Received: by 2002:a05:6a00:1256:b0:845:bda6:574b with SMTP id d2e1a72fcca58-8479ee84b9emr1943239b3a.5.1782801527316;
        Mon, 29 Jun 2026 23:38:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:38:47 -0700 (PDT)
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
Subject: [PATCH 26/27] ASoC: codecs: rt721: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:48 +0700
Message-ID: <20260630063449.503996-27-phucduc.bui@gmail.com>
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

