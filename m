Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1DA37881D
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 05:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783660127; cv=none; b=k1AcLXPzZI8f/0xL179sayuB1kCs+Yli6uZhIcw3itxajAW5tADI2uBujBoAkS9ZGIyZSOyNsTPZz8Yg9ejSMAxHEAwRcqToqDBGjpOz4K2nEQpwvRUFx4J0wFz2x33fdFAn6AohrhgV+oMuNM0M2ADiWXVjz2xetLAVsXhZqd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783660127; c=relaxed/simple;
	bh=MweVdIXyxpSdaAyXydGV9k7M9ZgI8Ju7aFXZhHZMKi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a3rn4aQxKGWp5dLYab2vZiDQijOkswdzlELwewoeriBqQ265+2oF7C5cXexgj3dMFrKZkGd+0b7cSgniGm58AQ0hv/T1EMihBGSpGySUbfqQuDwY5xhaxvYDYwGRYvqc3BkxtETUSFgBz45vCDyyEHqnRtMvgmI73khRyIiphgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MuOxYF/7; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MuOxYF/7"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-848643382fcso448614b3a.1
        for <linux-sound@vger.kernel.org>; Thu, 09 Jul 2026 22:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660125; x=1784264925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K4c06G1YhkVvW99Bq1imq6AORHZjUoeyckmKw8GFUMY=;
        b=MuOxYF/7sqOP3EYBykWZmuThKlq9Nsex/t+FsW7FZU2K6CGGP1FiWjE1Y4Q6mhwb7X
         VpPPWEMuQ7BJwZcVLF1LGoFdVC3ImWMCJWirQ8ZgyVWJVOcidoV6q0ERfxJNZktZWJI/
         OmEdP4hDTPPryYgswuwOBX+mJiYOaMzIZgc0zbLPJepxpJ+qxP/fkYWlVni55fEn5iLb
         SIRpQ3K77vRJ/LJvFBjS9RNBRphvfCL68nPNZ3hbLBwrsIL1GILgfQ7tzkNo+DGmT8QB
         r25k3zSp2EJDE8OS3K27nkzKuBmfRGptSY2Do68IK9HiLZQtusr+4aS6Ntg3iFkbVQ1C
         FyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660125; x=1784264925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K4c06G1YhkVvW99Bq1imq6AORHZjUoeyckmKw8GFUMY=;
        b=WioRzfwcDoVQ/vUrVUnCn+u4Xts5FeJO5GuCWN3pCDRaswyuPUfGQ+uleDC1PglYeY
         QEjge6dfkuUQUlUgRmgrX4kyPu+brpEF+ta7SWWXYoDuNGyu3afjwpRWd4nz79OtEtD8
         55T4kpSW77aECEHX+5JWc21KCfxYr0MFO58hcNboTdkqMK26v3W5Qbrr0sW2QNlBjYw7
         SPD9DHP+nI5IreQTQzEhIjr80C/xIjHxXebXbGrQv5nVG+ngA/Qr39kymO6mURtyEWdo
         k5wmUZsU8/GRY6dzLqynAW4t6mXa6Myouf/HB4cfOK0nRRMu4R38JW76IuuZm14iSiJ3
         cL3A==
X-Forwarded-Encrypted: i=1; AHgh+Rryk4ELFlFtNytjcD2i0s0tw88KbFLW+JTjk7VMx7Y3YmSQehMZQrunP+lSopEgI1uRuGQ0wCtVuV6qgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyliLGjrRy3fLB+N5uVzbSzrsSWcRqQ/KAzIwdNlQvksWM00/3i
	YIV4KVQblZihcpoR8HdJZ7Cty3CuDNiz/0aEPib7BFCR6PV0d+UCWQEf
X-Gm-Gg: AfdE7ckXMaQUYCXKt08oOku0phcXrwB7SufhsM2XPIGaP77CRGL7G9xw8ChSgBTYoXO
	FmWllxv7kiAsat/YQcKPXYJJxQOfPq/3w/eniSVmHC6S+l79flGGrWYxLHqf5DlbUQmmthgYWo4
	yD3O1/zIO5PMOdjnUPes6DGoWY6130Ivq3eW0TYqiV7bTL+7dfD3rlX5n419CWf0MFliPHhOgcQ
	ZY2mlQJRUU5RkUmq8H4e6lVOx1iWnidnZ5UTZh8tFg4OcGW0pMdOFtfaGo3Pgo7zGIyvYYIFCfZ
	GiWvjaX/TKbRa7+Y50pQdF7iuRkY865B5nup23lePR5Byo6r3KQM2Aq49blAAu+aFKg//AGJ/Z7
	z2xP5TTiuYxyd8w4jWwmmbUG2DT42BQCCt0TmgPhCe0uV2L2iMXsTEDF40tO/H8EYlKhRWcAgkn
	QyhRCblF2HLPMAj9Lk8MMJnbthDSB9en+zSjdUHw2hnWhAcaY=
X-Received: by 2002:a05:6a00:a02:b0:848:2f73:8fff with SMTP id d2e1a72fcca58-848436944cfmr10668853b3a.72.1783660125218;
        Thu, 09 Jul 2026 22:08:45 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:08:44 -0700 (PDT)
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
Subject: [PATCH v3 26/27] ASoC: codecs: rt721: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:05:10 +0700
Message-ID: <20260710050511.14439-24-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt721-sdca-sdw.c | 29 ++++++++++++++++-------------
 sound/soc/codecs/rt721-sdca.c     |  5 ++---
 2 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/rt721-sdca-sdw.c b/sound/soc/codecs/rt721-sdca-sdw.c
index 041b381e582b..d54f3f2d5bdd 100644
--- a/sound/soc/codecs/rt721-sdca-sdw.c
+++ b/sound/soc/codecs/rt721-sdca-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/module.h>
@@ -466,13 +467,13 @@ static int rt721_sdca_dev_system_suspend(struct device *dev)
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
@@ -494,13 +495,15 @@ static int rt721_sdca_dev_resume(struct device *dev)
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

