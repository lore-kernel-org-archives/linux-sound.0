Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C532377EAC
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 05:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783660068; cv=none; b=np90dv+FdA5OdnlRF3NJyXPSZrKblQBMzDyX+b7ndNb2QjxZbZfDreXVzP5TiuGXgKpIBktLy3Im9hCtoBuDRD0Uzy7+KdsRuKTXqVGMKvF0WgJzeyNOMVVveDcHRethG19794it6ZEoZp1Bg0c/yqkYYiO8J1M6e6DzgIzx9qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783660068; c=relaxed/simple;
	bh=71e6v5A0pmTCpY/muFVgY0bKxBOo24zj6ulqSaCErLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RR09x9J7L7pqzlgE7X52cxfKQIko8PfQF2S/k53qnZVkUbM6AORypTmG+35Hg7ucM2/7tbt82RTQB2iVuAEm2m1f4PNaLjtYu6yvwx3P4VAdgMsLgF5L3FGRbwe6ciY6VeZi0yQWKz1bSWb9nnDQ838GcSpP3f6yKvex14L+3iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GzDs+1ln; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GzDs+1ln"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-848643382fcso447963b3a.1
        for <linux-sound@vger.kernel.org>; Thu, 09 Jul 2026 22:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660067; x=1784264867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jE/vGes9bWof+nCBjw7kvawhZty+DCUG3JNg48uQoDI=;
        b=GzDs+1lnTs3aLpvj/vfh1Y/G4/ej1tSf2LhGiThKo2qDirto+mIwU8iIcGVw9x6aZ+
         QIWHWH+Unc1WMB/oNYw1uuHNAkkAuzB/gJbnUPwL4LgRSZeITz4RpzR/+LyDCpRTm4NW
         93cpMddysW9JwU1d1C9/I+5Xwp4s8qSe/+0QSsKvlZK2DJs5kOy4ehXfsGXxIduG/8br
         kjpBNp1ETcOyKRdAZWnEQduh0Pq9OsJOSKaKZSyQz77T5VyVUOSPNxWjHlKzkwbzwB8j
         Kflq6B6lZMZsnPRxbFNCM5X2Xuuso8Fp2rIq5r3liivcyqx6Nbgc4iILmL2dAX5Rz9IA
         4RGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660067; x=1784264867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jE/vGes9bWof+nCBjw7kvawhZty+DCUG3JNg48uQoDI=;
        b=ShczxM3HeI2nNHZRN10DRL2262hMftbErXCerbbhRQxtnl6KH/WXrNToTMb4mRPb/D
         QLPuFxTYs2Y82YJoQ298jIGrIJVqIOHtXaZJUYoQPJKiFE8nswtfOFp2HL+IdSfYmhMO
         0Lq1f8hlPvihRpaQwhCmAncWijEEtkSKsNW6+3TlR3/3JUBJNKdzbt4xTgn6N3aPT1Py
         FaROakzWct14WmP+1DuPPOR83O+xBkAsSVNlGP/YIocQ4e/KvMaYVQJSolvhwc/0xQJh
         aojybP2GVC7o12J1+EEuu9YTq/Vrk4zMrGzM63f8moGsR9qDOYicj/0+A+bFqr3fSYHT
         2x5A==
X-Forwarded-Encrypted: i=1; AHgh+RroR4pqef44mE3XCLabCIrb2vpim3QfZzO6zdnJEyXGjPW4aTuWgv8t2+Umxa7MPFmMppgjlTgw/AJ9dA==@vger.kernel.org
X-Gm-Message-State: AOJu0YypUvLqQvEOYwrutTPBKJKi8Oce9h/gDqUvehqMLgteRQNPzYDK
	a52Mg1CssfgpJNvuzU6JNuppnXoNv/8mdLB2yVblvyg4nKRb800sttce
X-Gm-Gg: AfdE7cmOY8lgY4x0PippNnFN032k/Ge7lOXkFK82YITrFu+77Tsq5mZlkD72qKTgI95
	NWSuQrMtrGjwAqKydX9fXUa51lOlfIha+JdHcC0WpWeScgA+5HuUKOkvfPOA0jJyPJkZLqHmv9S
	ieEJSLXYZNVad6aS7d3paTkkCpSPxX0lHJfI3ddDfzIYuF158fc937PzMsU0Gw3fIC6Nk5efgwE
	gxfLs+rmvRsKrsMCFAOYFYfv/WXGdGMjx6lCkmrxJNDPmriP2PRq8YyFCq0cH2G7I9FdYdnjM3S
	r0fCZpvsWhEhhJR6m2MYiSwPVCjeg5PQ4eTMYHlai3JkurJFVIfvwOaeFXw2VN42D0tLHa4KeSO
	jNJh14FmgJKzG2pGXGmc4VwEoPDRcHlPit0W+wpy1zVU5tkciOOcHJJKVNAQ6HSmXWRzm+jIH9p
	idraUf4JS2GKp47/8PDI2S+ixCCLB+XfcFn8IePIFC1dqjlGs=
X-Received: by 2002:a05:6a00:3923:b0:848:7b92:8e79 with SMTP id d2e1a72fcca58-8487b929051mr507140b3a.67.1783660066423;
        Thu, 09 Jul 2026 22:07:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:07:46 -0700 (PDT)
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
Subject: [PATCH v3 19/27] ASoC: codecs: rt5665: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:05:03 +0700
Message-ID: <20260710050511.14439-17-phucduc.bui@gmail.com>
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

