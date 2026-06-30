Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA93A3B47E3
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 06:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801480; cv=none; b=QTpjfUU/KC9onzncxx7Wh0icQ2LJBasKQpvK2T26K2JDCK1YVBvRLgmp3jq1Y6dlQMA45gG/3T1L72CS/C4r4etJgeq3NFh0GIRIIKHfzZc9aNC+NDgcqi6y4vkpBGK6JOAXWH4kqIBd8YZml10w62IU/WxT3v9VQ+TrJrfwArQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801480; c=relaxed/simple;
	bh=71e6v5A0pmTCpY/muFVgY0bKxBOo24zj6ulqSaCErLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JEx27IYvB52Oc++V+pc9I4SbC0th9JSjE1KJRvL+ugzNVc7AU7dZRLAneif/NcX2m3tuELewDnojG/wsDeh+LMfb3p0AapgWv56gv/8k2YoKS6IdJe+JZK0Klhq0nZO4+hRaiD/Oz4Yl/Gz9LLYZ4mpa0iNtQF/ZzQaBMAn22kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUYW2Ghd; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUYW2Ghd"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-845ea8924a2so959265b3a.1
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 23:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801472; x=1783406272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jE/vGes9bWof+nCBjw7kvawhZty+DCUG3JNg48uQoDI=;
        b=QUYW2Ghda/7TE9utZn4MLaa/1S340Km4V7AppQb67ZlXL5tlo/EMNrq8rDHxt3C0Yl
         vZFt12UguIehXFBNtF6JgkTsKEW/5J5dtmmMoQg/8wzhFwrY8IB/rT5xyXnzaQpEIqn0
         QiQLkHaIQObd4qRmaD88IhMJXqE1GGYxtsHCn6W5PL0MKkvUDkHdU443vOcauT1IThZB
         3CqPWTJF3Ku48byz9VQ6BJn+ZujZS8xtx+E2gXMzx1Ptkv6GJt9R1lMuMkfGnhP3LlIe
         2q7QiuahTPwD7hRmnSzMBu4u5AhkFM2p2SqngE7x1cX4KWwYobhdxVloKIC+wTae996t
         JbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801472; x=1783406272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jE/vGes9bWof+nCBjw7kvawhZty+DCUG3JNg48uQoDI=;
        b=or0+Ue5k2lkfsKu62hRGPBpeozdsCw78HVK1hu0hleTJVoTD+n555p0jZt7K3kwD7f
         9RE+70vd0y9qWK9sj8tIcFxm2NoH72pymZPAXIWhZ7sWkJU8O3kH5n+ok+CVnT681ijE
         4bGsxEkCd1jIFwQ/Z7wccdea/Wk2YNao5Rr1RofXaFCsvPNFPly4G64VqS2G9NzYeTc7
         8T9ae+1SUUoa6SJWxluwqxR4jftH0C4pjDrdb42i2p0TjNAvREW+LtX8yS38U/x1VEML
         Tvf0oZk2j6CDmoqoieTbooP03yWyAZ4lEK13fOiEeaHx2vzy2QW2vTlRnqYpXyQWa7kL
         Y9AQ==
X-Forwarded-Encrypted: i=1; AHgh+RofDP0M05CYpz7dCzHYRyyXnxfTgAzWtRJx+k2haro6GFxW9/n7saFpaT6YIAPL6F0m8Ll2xztyNPwOVg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8DhFjivLVdmh3iUHCIR5cF2uep5jx20lRPB9xFAi6PQxnP5/W
	GHgMb2wvtei1rY6i8DOZekMOnGgnVDUrX3cHEX8vNZZ1vE2ty1ESADLZ
X-Gm-Gg: AfdE7clk0Z5yrvOdSC9lZeMOirKNHrrKtfcWi/MTcnQiNwWNwxFQZJixKF/9bQDW93N
	V4M1IF8nMWTZQVNP+K9sKRt6zLFILl5oWb6u8vz4g+JOm73pEOyHJRzfpuqSTY4R4jEFFWxzpbF
	L/cPGzEaZMcurEQqe9tXtn/xLHrMIeVAz8uI/AfmupxRuanC+HRSjw2sYnL9NDGRrF2AuyL2HSJ
	JZ1KXz4DHeq3VFK9uv733+iUNOA+zqzD5DXDUdRjjiyikWjMNGwwXtit9izbv8JP34ZQjji0RaT
	n3Z5+o5FtlrMNcHhYIVPbDycpb1M/TSI2/XwQDAJtZIRo8q72OePxC9xzVXOEGBk/pU6BmYTyM2
	YG8QMK71CnaNNCxAATqJbZbw8FBXS7N432Cxv9P/LJVpOv5oXLjUj6JpLQ1hb9TGETxO6QieMV6
	5hW5gtSLSJRRhrqvNHYFoc8i57HbnAINqjanrA6Nx5nUoFfs8=
X-Received: by 2002:a05:6a00:3d0f:b0:847:8a47:264d with SMTP id d2e1a72fcca58-8479f22aa22mr1967010b3a.36.1782801471671;
        Mon, 29 Jun 2026 23:37:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:37:51 -0700 (PDT)
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
Subject: [PATCH 19/27] ASoC: codecs: rt5665: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:41 +0700
Message-ID: <20260630063449.503996-20-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt5665.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index 48f57cd0920d..1d987472ba42 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
@@ -6,6 +6,7 @@
  * Author: Bard Liao <bardliao@realtek.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -1208,7 +1209,7 @@ static void rt5665_jack_detect_handler(struct work_struct *work)
 		usleep_range(10000, 15000);
 	}
 
-	mutex_lock(&rt5665->calibrate_mutex);
+	guard(mutex)(&rt5665->calibrate_mutex);
 
 	val = snd_soc_component_read(rt5665->component, RT5665_AJD1_CTRL) & 0x0010;
 	if (!val) {
@@ -1274,8 +1275,6 @@ static void rt5665_jack_detect_handler(struct work_struct *work)
 		schedule_delayed_work(&rt5665->jd_check_work, 0);
 	else
 		cancel_delayed_work_sync(&rt5665->jd_check_work);
-
-	mutex_unlock(&rt5665->calibrate_mutex);
 }
 
 static const char * const rt5665_clk_sync[] = {
@@ -4564,7 +4563,7 @@ static void rt5665_calibrate(struct rt5665_priv *rt5665)
 {
 	int value, count;
 
-	mutex_lock(&rt5665->calibrate_mutex);
+	guard(mutex)(&rt5665->calibrate_mutex);
 
 	regcache_cache_bypass(rt5665->regmap, true);
 
@@ -4601,7 +4600,8 @@ static void rt5665_calibrate(struct rt5665_priv *rt5665)
 			pr_err("HP Calibration Failure\n");
 			regmap_write(rt5665->regmap, RT5665_RESET, 0);
 			regcache_cache_bypass(rt5665->regmap, false);
-			goto out_unlock;
+			rt5665->calibration_done = true;
+			return;
 		}
 
 		count++;
@@ -4620,7 +4620,8 @@ static void rt5665_calibrate(struct rt5665_priv *rt5665)
 			pr_err("MONO Calibration Failure\n");
 			regmap_write(rt5665->regmap, RT5665_RESET, 0);
 			regcache_cache_bypass(rt5665->regmap, false);
-			goto out_unlock;
+			rt5665->calibration_done = true;
+			return;
 		}
 
 		count++;
@@ -4635,9 +4636,7 @@ static void rt5665_calibrate(struct rt5665_priv *rt5665)
 	regmap_write(rt5665->regmap, RT5665_BIAS_CUR_CTRL_8, 0xa602);
 	regmap_write(rt5665->regmap, RT5665_ASRC_8, 0x0120);
 
-out_unlock:
 	rt5665->calibration_done = true;
-	mutex_unlock(&rt5665->calibrate_mutex);
 }
 
 static void rt5665_calibrate_handler(struct work_struct *work)
-- 
2.43.0

