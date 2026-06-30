Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9BD285CB6
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 06:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801528; cv=none; b=RHGPQRS2ZdQUdotCjVudmP+rDf+bQonHYUXA5oaZ3GIEA+buiqjJ7d12N9UooAHVDO3OvCWBRumnH97P3PgxBQhxPTUZo8zUf/lDGQxMx4JHzQo2qw+8b/g0BfIe4Z2Qc2bmeZyqAwXZ7hEIRMGxngJUiXrytKbkT/dHezXKjSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801528; c=relaxed/simple;
	bh=R5dedIMDTwE2cId9qK/qWI3uZybefPwOuh0iBG5LWW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ulLIjOGlknCcxS+C38IRD0jJASyBH3nUr70OrB6Xb6fEf4pz/52gFtmuIDLJnXRUE+5ZO0PUegpXUnJsWhEO9U3hXrvHXrMAPXFuDHV9DGPkvLQOuWKMxORUuZ5X11YciRJcgcR2MFWSQlsbqO1chETWxDg9/dgVL5NWtHvcFbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pSyxtejb; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pSyxtejb"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c8deb37737dso1377247a12.1
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 23:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801520; x=1783406320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvHEcHt0Pv/b75XSblH4phF6+1Nj638qki4oB9IDwxk=;
        b=pSyxtejbUyPWBPHkvs0T3oNB91aDxlULEMoLv/YKBNoaIMoGrt/9a74SdPfi+nq1ce
         dyTTIkHJknZIV8KpJYYoRufAFhSM6yZA2/vpp8lDkJds6rG8ZHFPRvUx2wBZ4crROJ11
         KbJfTqn5O7o48QgNgESm3kZ70w/u0hIw1OxziCOH+jnJKvtEEKiqHVNRSgqN7kBPPbUP
         zpMvVANkQld0Gi5cDRpK0NOMyqDNQA4Vkio+sVhUnSzYumU1k77E4IYCOAnB+dMNbXWy
         r9fwdjXz+LouMFpiYyq90WazGkHARjlEy3+Ull/wVMdUKzxieIY2jCJfE9bco6yCm274
         H9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801520; x=1783406320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jvHEcHt0Pv/b75XSblH4phF6+1Nj638qki4oB9IDwxk=;
        b=qvp9hd7hBBFIp81r/p51Wg8tyB7mjAjGuGfqkrkkRkbt8CHuL+yES9qBJIesFZONg/
         6EiiuE103orMKrotMPYQ7Lor3E/EMaECZDjfQ9MkNb7qKvbHN75ErOLV64/S/QnuTR6H
         V47INXirhbxzK05aeJueZeLN7hBF5CCW7LXuC0qUCHgEUHPnUJPCLtr8N2qQwZ0rINeR
         7DnzYcEBF64fq3n0mBVlwG+RgqL0yYx2JWFIo2hMZjuNHMnkzDDKPzJ+a27UxJ7aMN7Z
         KiJkw/E9ioDIDJPDG5XyBPb6ZkRi3w6wBapkjlYICYg9A6c8Rhon1A7bay0WjoClNWd4
         fsSw==
X-Forwarded-Encrypted: i=1; AHgh+RrWcMdkgDK5+Rgw23n0BL9KuLqgpP0czS6dH/iT/fWHUuIKacagXK05Hz+7ZkxjEBd0EWFwZeFwlWnS1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YySKYAL6GoyNgPd8ZG7255aIeLn1Jt36ZnI2NIfvkDIoQYaRLyB
	2FiF0tSklnpkwyOVvvaR9i7dJkFvev3qYJzQiXs72Dnk8Lxiuioy9mrh
X-Gm-Gg: AfdE7cmmv0gbZd95lc9Heikrgmw6PQ/f+WCUyKh55swweb7d7dhloC/NP8cEYZH8fQU
	usn/oHenGiLJXIrje/yui5vNLAJgZSSgJMXPMRnCCow/FBpoJ3ED69j2jGXT2ZPnFyUG/3Hrh6Q
	8BQfjkK9r0pLcpIdxyymKz3cqzedH8/29j+T0flhQhynZOfY9GFHrulfdjjWKR4qU1ePFLQt7cm
	m60SuH4QoUUWL/SHuVn155SJZGhzw0CokIWjfl6BwcT76h19Di70PfpMA036zfRvRsAgYPlb6pn
	P2vCyWtDEx6WbXtG60j8+m6jYNENAymKEPeK9c0AYzfNBo5T8440sHvWuS/Qo/d0LH+hYWX1mv5
	9wjRzKRb04MP3UzJ8g7PCgJU/aIliChnAu2ayxzbXVVWX22Pk2QbQLx6IatVi8ZNQTPc887MlA1
	i4zNc0HUHO76Rb+gakHQ7x8AzItgZoBr+QDpD81B75fVbrJzA=
X-Received: by 2002:a05:6a00:44ca:b0:845:d285:3b67 with SMTP id d2e1a72fcca58-8479f26f9b7mr1978158b3a.51.1782801519609;
        Mon, 29 Jun 2026 23:38:39 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:38:39 -0700 (PDT)
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
Subject: [PATCH 25/27] ASoC: codecs: rt712: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:47 +0700
Message-ID: <20260630063449.503996-26-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt712-sdca-sdw.c | 30 ++++++++++++++++--------------
 sound/soc/codecs/rt712-sdca.c     |  8 +++-----
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca-sdw.c b/sound/soc/codecs/rt712-sdca-sdw.c
index 2787524c796e..e784e8b7d167 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.c
+++ b/sound/soc/codecs/rt712-sdca-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/mod_devicetable.h>
@@ -428,13 +429,13 @@ static int rt712_sdca_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt712_sdca->disable_irq_lock);
-	rt712_sdca->disable_irq = true;
-	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
-	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
-				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
-	mutex_unlock(&rt712_sdca->disable_irq_lock);
+	scoped_guard(mutex, &rt712_sdca->disable_irq_lock) {
+		rt712_sdca->disable_irq = true;
+		ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+					SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+		ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+					SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+	}
 
 	if (ret1 < 0 || ret2 < 0) {
 		/* log but don't prevent suspend from happening */
@@ -456,14 +457,15 @@ static int rt712_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt712->disable_irq_lock);
-		if (rt712->disable_irq == true) {
-
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt712->disable_irq = false;
+		scoped_guard(mutex, &rt712->disable_irq_lock) {
+			if (rt712->disable_irq) {
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+						SDW_SCP_SDCA_INTMASK_SDCA_0);
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+						SDW_SCP_SDCA_INTMASK_SDCA_8);
+				rt712->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt712->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT712_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt712-sdca.c b/sound/soc/codecs/rt712-sdca.c
index 4796fce084ff..5ab1d3961409 100644
--- a/sound/soc/codecs/rt712-sdca.c
+++ b/sound/soc/codecs/rt712-sdca.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/bitops.h>
 #include <sound/core.h>
 #include <linux/delay.h>
@@ -79,7 +80,7 @@ static int rt712_sdca_calibration(struct rt712_sdca_priv *rt712)
 	int chk_cnt = 100;
 	int ret = 0;
 
-	mutex_lock(&rt712->calibrate_mutex);
+	guard(mutex)(&rt712->calibrate_mutex);
 	dev = regmap_get_device(regmap);
 
 	/* Set HP-JD source from JD1 */
@@ -126,7 +127,6 @@ static int rt712_sdca_calibration(struct rt712_sdca_priv *rt712)
 	/* Release HP-JD, EN_CBJ_TIE_GL/R open, en_osw gating auto done bit */
 	rt712_sdca_index_write(rt712, RT712_VENDOR_REG, RT712_DIGITAL_MISC_CTRL4, 0x0010);
 
-	mutex_unlock(&rt712->calibrate_mutex);
 	dev_dbg(dev, "%s calibration complete, ret=%d\n", __func__, ret);
 	return ret;
 }
@@ -403,7 +403,7 @@ static void rt712_sdca_btn_check_handler(struct work_struct *work)
 
 static void rt712_sdca_jack_init(struct rt712_sdca_priv *rt712)
 {
-	mutex_lock(&rt712->calibrate_mutex);
+	guard(mutex)(&rt712->calibrate_mutex);
 
 	if (rt712->hs_jack) {
 		/* Enable HID1 event & set button RTC mode */
@@ -450,8 +450,6 @@ static void rt712_sdca_jack_init(struct rt712_sdca_priv *rt712)
 
 		dev_dbg(&rt712->slave->dev, "in %s disable\n", __func__);
 	}
-
-	mutex_unlock(&rt712->calibrate_mutex);
 }
 
 static int rt712_sdca_set_jack_detect(struct snd_soc_component *component,
-- 
2.43.0

