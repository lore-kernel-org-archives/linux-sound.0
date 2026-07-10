Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60742378826
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 05:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783660076; cv=none; b=D2yx/OZDZOecy74oQykq3l2Qac0q7+yWQ81Jtdq2cDABhXLfWwFtBsKxCEX8vwFsk3BrifkVtOnw5e1ulvLxYdp/FOVR4jQImpNcEfHhWTGJBytvTEOi9Anlk6eCURBvxDH6fDddipeqzy/4z1nJsO3V/HeIW6oZ/i9kI70F6ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783660076; c=relaxed/simple;
	bh=j1KzWxhp75swdsTYPJvVoYjcP8hTRieKELlWe5iEq2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SfdaUvdRyEkMPMVGuneOaEOR656ejX6uIIFHUjPB/viAvKYnpK8IMpc/ilx9i5MZZDz/CGniZJLVjfEhNc4cWytbHkZNCKsphr9+QChhNKRsgMEnN7v5RrJcRGt7NUIpVy2iaWqUp9hT+frwMhZjgkD1VUwiQXYLtKZ1cQABnL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C5sEkSBk; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C5sEkSBk"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-848479c9bd5so341390b3a.3
        for <linux-sound@vger.kernel.org>; Thu, 09 Jul 2026 22:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660075; x=1784264875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=26LuwxXuYnG2tABKOgMVR7HJmLwQlsRPpHyBPQzuKoY=;
        b=C5sEkSBkcLelKqHy4TJOpblUo59/6F30ozLNQGYYo0kFQQCfgkjBWm+oEXJoD6eFhe
         +i7PyEkiAr1/jM1w080pssJpuFSZkIjPX9Do3DtzIiP1TZ4PYbTzCyNyARX5oEIBGfhP
         PRYWZX5Gb/5cx/Wfbfgdsyk9/+8fd7FSV3zEPyqCzIPasghGKo6aX1yvqjMcr2/sobBt
         FJ6KnPBOpkUXGO/ih8pT9/92F8hc5OUJ6QUZEL89LdJ4szZfW4oNwY/1Pj7zAdZ6NzYs
         3yKf+C98Xd30Q/Dyn+VuRSfbZydKygSF4QSVumjxqbWrQtTKoGfbOIQYL36LUs4+Jy3l
         tXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660075; x=1784264875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=26LuwxXuYnG2tABKOgMVR7HJmLwQlsRPpHyBPQzuKoY=;
        b=QgTnxAr4LLqIt9WJVX8YgexA2ovHNV4TUuqmX4VKHiu2d/EmdQ6ZFJxWcttZbrrPto
         Gn6mn20cEFoeLcmi+uuXNf4YJRGyNFDsrud0PkABcS9HYMju9/N5/U5Yll9sfsIImY62
         mQgoNoNRF2wca13QOtHbcT4/+SRYWVEVF7fA6gB13gzcHusx3eP6Bs8t/OqjgL55F6kW
         GnKQUudVrFb+xrN773EZnPaEUrdt8kns9zjKkTl18gFAp5QYrpA+wExGaxCe4csb47xi
         ONru6kHD77iGYRukBrx2OdVBQR2atXW+v9vZeyQiwQOKkAS+F4WgWnLjzNi3D4tQr2ic
         DZxA==
X-Forwarded-Encrypted: i=1; AHgh+RqnqFT7c9Soi0Laie20hX62l/BbidBWSdypYnJ86S5073DqrEF9FWLUGZfI6yaXzZvkM6RQ5zffs5BQYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ5bBoWlh5q/xkOweJ46yf61XjUVTfkpDcs8zF5kr3fflXwqUC
	5w/jCk3M7YtnLIYtymtG3Gea//T4VXHyZPjrXqmOfObTvSNXYSrzQEyL
X-Gm-Gg: AfdE7ckMVNlpa9TBRiRqKiYtQefDPEPxcR3TeRGqdKSsCyKH4Oa1DvFX+tUQYYxMKSt
	+gWtIIYIJr8/bMO6cbMVzSOgUqevjI/hY2jAC/XTllaH8MZP+6iG9BRha+780V2dS17pf4KDv+3
	ypmIIo15QpneOu3Y0nk3rYbqbA9d2v3fYvcxA/MqK9b5dsd1g0psKz6pJ/gmGNB18CAXPtFh0Cb
	LW5eyXM6/yaoZnghT+DzOxXBBPbUakmoT+9rFufGkNG+YWgofJL7I1JfEn54yWP7pyuzRRtAvf7
	4fzURgMpSV+Wenky/WN3I/kjDBepLb77aD62wmnG2ZnKu3fjYcfDbw564TBTZWuwae8oTrtkv2m
	mqUyBfreEe18jZUcy7RWhIIjT/2EcK+mdRdkUvAtWPg+cE+Os39qPo/T9SV0knbTCZ4+ExwrElr
	wmQGY1VeMnXPto6LKOT+oPOlIBzalh8k2a2jypItpS5rNMj4sxGk+cNvQ4nA==
X-Received: by 2002:a05:6a00:2e24:b0:847:84a1:9782 with SMTP id d2e1a72fcca58-84842ede4edmr9311865b3a.26.1783660074723;
        Thu, 09 Jul 2026 22:07:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:07:54 -0700 (PDT)
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
Subject: [PATCH v3 20/27] ASoC: codecs: rt5668: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:05:04 +0700
Message-ID: <20260710050511.14439-18-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt5668.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index fed6de40b8c8..4154bad27610 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -6,6 +6,7 @@
  * Author: Bard Liao <bardliao@realtek.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -986,7 +987,7 @@ static void rt5668_jack_detect_handler(struct work_struct *work)
 		return;
 	}
 
-	mutex_lock(&rt5668->calibrate_mutex);
+	guard(mutex)(&rt5668->calibrate_mutex);
 
 	val = snd_soc_component_read(rt5668->component, RT5668_AJD1_CTRL)
 		& RT5668_JDH_RS_MASK;
@@ -1053,8 +1054,6 @@ static void rt5668_jack_detect_handler(struct work_struct *work)
 		schedule_delayed_work(&rt5668->jd_check_work, 0);
 	else
 		cancel_delayed_work_sync(&rt5668->jd_check_work);
-
-	mutex_unlock(&rt5668->calibrate_mutex);
 }
 
 static const struct snd_kcontrol_new rt5668_snd_controls[] = {
@@ -2356,7 +2355,7 @@ static void rt5668_calibrate(struct rt5668_priv *rt5668)
 {
 	int value, count;
 
-	mutex_lock(&rt5668->calibrate_mutex);
+	guard(mutex)(&rt5668->calibrate_mutex);
 
 	rt5668_reset(rt5668->regmap);
 	regmap_write(rt5668->regmap, RT5668_PWR_ANLG_1, 0xa2bf);
@@ -2400,9 +2399,6 @@ static void rt5668_calibrate(struct rt5668_priv *rt5668)
 	/* restore settings */
 	regmap_write(rt5668->regmap, RT5668_STO1_ADC_MIXER, 0xc0c4);
 	regmap_write(rt5668->regmap, RT5668_PWR_DIG_1, 0x0000);
-
-	mutex_unlock(&rt5668->calibrate_mutex);
-
 }
 
 static int rt5668_i2c_probe(struct i2c_client *i2c)
-- 
2.43.0

