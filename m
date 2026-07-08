Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63F847886E
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 14:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520500; cv=none; b=n0CuG4pP5OxhnblDjj//f79c1s2NL6xAWL4QXSaUeiiLHYDgbwCgODYbChHkspH/RMjZD2Wna9EMIyn6WDlpFj9xEl0w65UmVaESkzhbIQrpPYdH8HYsba6RMGIOLuSqZMRGXz/UozYCv8KXVpGhYaWikdh318suY5M224Apyf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520500; c=relaxed/simple;
	bh=71e6v5A0pmTCpY/muFVgY0bKxBOo24zj6ulqSaCErLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F+S759bVMvz/fWGNbDwF2V92/rQP2Cjq8eerXx9i31mKx9Qk3oA8iAs24c2eTHUCvGGS9iPc86aAd3iPp6S6wD+c6UoNdnIi6Qax8g/vDW6sJdg0c6l4GRssfKEyd34D6MWY8J7dJ4ToZhI7IF2dzogVN9xWvcP6bsVGINpgi3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SHsvHxu8; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SHsvHxu8"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cabc0a1ab6so10647735ad.0
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 07:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520498; x=1784125298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jE/vGes9bWof+nCBjw7kvawhZty+DCUG3JNg48uQoDI=;
        b=SHsvHxu8703aB2yGEf6WaOaN+sy9+s06bbZK2fePm09Kso+44hRvlpqnRlVBE4+MUT
         PuHFHVhQiu7w/1f/8loH/1kCeETWYHHPo6my4uh1BL0wg0qEbQ93Z3K9BhygQ6jBZCPr
         17jNMF6Md8qSDjHoiz3Ddq0iC4+l0KLE6G9N+FZcSx9j6WG1Pnd7Be2wH48yGI6sFUPB
         DMEwQJ2iLGIYkwp/efldhxLgdV/cDK9dBGYx901DnNz8bkqAJ/YqmHrekU9nZZ7wQ5fM
         X4FA1VsJ4Zu/Uqq/xFKrMynFzR2ZhI/YPt+ybscmCggn87ZZjmezrBq/+OX52VCCIIM8
         BlYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520498; x=1784125298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jE/vGes9bWof+nCBjw7kvawhZty+DCUG3JNg48uQoDI=;
        b=QCGIajlpQHyuKfjdP6XY5pfBurW8c+KgTD0B/2t6jGNo4pA6CMCR2sw5IHLjukstH0
         3RfouLrFRnBshw1qET1RLnjNPchdZMf3s0EqZeVjLGjJLiWwNzKh7fQJppaoH1MuNXSU
         NdXAEiMFoCDIe1RRaIPf1CTZaArUsYMwIFrMicjQzLdvMGNRmA79qPwce4FQ5CV0P0k+
         KWTvAxmOJPKd6c3069OddZBpzVKA2T2jPu0XJgcabbBtH5/E37xSDyA1cBa1wBhV21be
         NDm7zfJrTn/2tO1Mwj13hsXbwEoe7DBeUi8kW5TrXNK43+xh5YJBocJi58C8euoUnEas
         1a0Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr4M116FH7mGyA7jrcy7DUh761bbOTs0ZH5K8bOp810DSoGcAUdO8RVVwtA2jgVIEfv9ol1xiaeIbv2Ow==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCyZlEnmztsABjiHBu5hxVMkJSmmAuMcAixsJv4EaWMYpNMB2S
	hgNKrxrGPLvHVXfYxEa02DAFpffRlx+yF+z8nKtGq7IWOqhBwmjIzGmD
X-Gm-Gg: AfdE7ckxwTfDPIDueoUlOH0uYvqd7fQlo6G8ecYxmuRsqaHRLP6/VJddsVtD0fnpN94
	eXBHIvyvJ2vGL5RSqjQ+RXJ3pOKhGyT8O39t08pczmb5zv6FBN/ZAj1ErbD0LU25h6ExzoZS24C
	gpZfbYqSzDFvczku01AboDxnDQQFkTQbLJPcG+ZB0DG2NLBKGyUZdZArN0Uy79ejUSdnV46deJY
	ZHG04VflFqP7tShleBQsAKkFvYnmTDG5uXfB42K7m9V+YDq29YGZGWolbjoEWGqDEFzRtQpeGuC
	F/hXyrEW/rsGG2Xjuc3PP4SbX1dq0hAwim+62zFm9LMveqWoHVn7pgkTjBA7o7yS7frOZx6oNkt
	H+en7MOiu3cwkhccR+rZTyZhRHw/IdFgEbXJX5qBbn02Dme0FTwdQReDsTsXi4ZRjF1/tZwHSp1
	IzLmmKu4r3ZKr+Dob3JN6rMfQqPbkpspgfR3fIu9wcBCzbVI8=
X-Received: by 2002:a17:902:ebd2:b0:2c6:a772:7e43 with SMTP id d9443c01a7336-2ccea39354fmr32045325ad.18.1783520498057;
        Wed, 08 Jul 2026 07:21:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:21:37 -0700 (PDT)
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
Subject: [PATCH v2 19/27] ASoC: codecs: rt5665: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:26 +0700
Message-ID: <20260708141734.578926-20-phucduc.bui@gmail.com>
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

