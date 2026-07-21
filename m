Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0D0480DFC
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 10:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629737; cv=none; b=O5Lvofc6CL8WSBupqAc1GdYS8Al3WTaq9G6+CPgEjs3bt+19L0kzA4v9zZXgWXOigDleL4k0ByGVYNa08LrPf/h5jKMMxdduVdT6pKCoDAIZX6SAnZ0Wxc+QEhS2VzqDuGdnDzpuQelgn5/qMFYbeX12CBzGJH6IvJGdbh33v5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629737; c=relaxed/simple;
	bh=71e6v5A0pmTCpY/muFVgY0bKxBOo24zj6ulqSaCErLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U0fnd6/G2Tax6BECCRCg7xjQOPEOVOE44sBZID4LrCcZfX/zu1KXNTi6P7x2OANsiUmjA1OYjpWPzEHYYuWiraoGk5+n4FDYMR8NU7rC2Rpp9nm3NttNckWwsBIV8Kx8ZTHwSEofGxSqzw6wF66ja1UjGRuwiQbP7BfkZUn6Lwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qvKMWgnN; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qvKMWgnN"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cab973140bso136550195ad.3
        for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 03:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629731; x=1785234531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jE/vGes9bWof+nCBjw7kvawhZty+DCUG3JNg48uQoDI=;
        b=qvKMWgnNn1YFVGOCpX6r+V+fS78YWOo5eycufmTkDAAM+876VlCQgeWn6QbzjGhIjr
         NJbAyYDdxe4YgEI2AvQ4RlLtHiVup994C5Y+7nnT3dmQ+FL+rv3EEQtzBuYzW/er8T0R
         wWdvC7FzHi9a4ZjAtOd5bq1dNFqqcIZiTUWbuSahOu4IPlHpLVbs0laEOVGcrCshQt6Z
         vFOYtgjs0ORZsDUFz8ieumhr25IwalTP/UQnB4LIHYWc0Siwf2c8o72zxYPvCwAE84en
         ACHNbmFyfah+Ndhd+ou5S6jdulVdrrr9Od6KPxNTLEti1utlwNxvVssITevTIQnYDW9R
         WWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629731; x=1785234531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jE/vGes9bWof+nCBjw7kvawhZty+DCUG3JNg48uQoDI=;
        b=RO+yuN01SGBNWmocdyTodsmAAfhfa79OT8OcO0eu23xB6oCV6+e8145S9W5FLe2H3N
         bCsYPSJFBbtcMHAS0PYo7ZrYTdvEJi3gw6BB2s5Q4mDXxVMJeJDRF9SVymrmksmhaCJ4
         R8a7CwHUTH0erDbVDV4JE3I0E6gdV8MxXBDm8A5GreKWWt9f5ZWrXWRtZgq05MagT4ey
         z42zX6ELkYlnayr4sEejQdHQoyNTNaYAAbdKVOd+fWHIAMsH7O02oXVNuMlOqnMdzzXt
         c7u9mYohnGmD3YSkZwzCH8Vh2jJr+VFsV8pcb6yGT/XWfZKeT6C9huNjPo868FN3u//v
         p0Fg==
X-Forwarded-Encrypted: i=1; AHgh+RqK6LnHgckrzEMgvd3jKnn8u/LVuZxAWWdiKXaAGtnEXpMRMIc4BS4+PGku6jImhZ61zQN4MViectrhDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVFbOOPZEy3Of7Mqy3wa0lPwgk1tzAPaI6R+1nqqZXChBxvftF
	nOb9Jms9rE4ZT48s+Fy69Gl8nX1RiLXkIUvoGkaUsNJ8kUxmQcfNYeI0
X-Gm-Gg: AR+sD100q3hrNhsVdy6Cx8OQH+6u1h99RETIaNZw2hc8ZFpCFiHYRFV3uOeTcOJw6hS
	gBM/k1AMeBhcVKimRxYw3pSL2p+f5Eafc8RkWIe+w0UtQUBnxK8+iDtprXBpWhGVFOlTW644e+B
	CNCP4EHNHwqfa0E7eP3iylRqM5XRqGVin+pqaaaF+rX4j2DogdG8igpexIDoKbTBhzzc44b9udO
	AGlCEqqdX931xlg8Aef6lba5ongvHU/sTphjmc9Xc4/1VkjlLO9DLJMYidtZTBaZOW7TDqlG0+e
	S7Aftb2wbtT9tAl/h/BMNuGPR5HRTXbFjekdmG5yf+ldO+ROpmwHO23YHF/HTuWWYmYczblcUXn
	bJ/PAeWA9vq/wFui2KdoIGGVLKErO+ZVFRMl5I6TFcokma2rleX64K4qjlkLXs6ZKZZijwqqI27
	IGH2/xhOPBGhc33slXulEsHVLL1NTyu9ZB+1wN
X-Received: by 2002:a17:902:ce07:b0:2cf:7d0d:ddde with SMTP id d9443c01a7336-2cf7d1d27camr38565945ad.0.1784629730842;
        Tue, 21 Jul 2026 03:28:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:28:50 -0700 (PDT)
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
Subject: [PATCH v4 19/29] ASoC: codecs: rt5665: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:50 +0700
Message-ID: <20260721102600.523199-20-phucduc.bui@gmail.com>
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

