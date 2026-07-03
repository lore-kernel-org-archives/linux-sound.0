Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8C2346795
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 05:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058095; cv=none; b=u+Do0xiO8hH01gYB5AF41EbOchYJtcAse7DJ094cMM9ChWmxAE874E2Sqvpp4n47dm0M1vHfVSjvm+8dIoHNzfjkHYPHOIkcTvroHfSNRt0zbkA3M/269wZRs22ZZW2Y6/yO6b7RmN7qxV7DLQe1VYLqz0li0la29LXAGj9bdg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058095; c=relaxed/simple;
	bh=xKs5OmhRIiqnhvZb6lkj6wzv9qVi42azkDJo9XoZNiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZeaxYGi/E6DGg1dB54sh7eTMKF8DILLvvOIrOvp4bJWDkDmqIiMiz2/D4/2HPnMXWeDWnJalCriC7cAdDTBs28/UqirYhRLD/U5NhBAykSxvAqP/KLdpLtHHZTb5WNs+cAZhj3V6Em7SjKo/dZrRkj16JNrvQuWSLSw+onZO6vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g8ofsuId; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g8ofsuId"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-845eb7b96feso175466b3a.0
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 22:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058092; x=1783662892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6I96oxVkfNpIRakqC/uO6uT6n3Ys4Sg04RqHkwTxN4=;
        b=g8ofsuIdHA5t0AH0r6gBUNMLeX2k2xYPKdS4iVFkbqcgpMlVCV7fu9DIKqeU5bgeuu
         IyyGVbL5E+aW+SaijX6JwtRejd2QIkf2WQylT0GER8KFE+dyxW2z32jzPuqWGuGxKZs+
         aB8jX+VS2q9svMdl2LSUBMbkppJ4AOyPzIKFSmH4KCo9rGZNH0LwsZfAZ4nBGADubpPH
         VuhKs4TmOGf0hfV1KQJWp+xH59HNzBCTx06nMpmT0EKAFM/5IAw9vTGRDBuric+kJSxs
         Mk+WRQc5jtz8ViAKXvRZihHY8p8IOY8PhyXa2+ZtUdXnOR5NLAT8iwCDjrROUAE5rTz4
         dWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058092; x=1783662892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a6I96oxVkfNpIRakqC/uO6uT6n3Ys4Sg04RqHkwTxN4=;
        b=MNRyu3tJz8RMR7hHkc9SCrtE3AfnFtEuW55DPL+jmEn3zG4oxmNrVPLqbeSnXVc4lY
         JelZc62PQawtArzd0dmQpFcqIJ7ubootvZXeT6nhhMLd5H2/m0qckjuCBO8D4dirP4GX
         T9dE12fxfnZaTAk44mJSf2yNIoIADfQ82DyUW0cqqJLgDeU6dSCV3hqVFukHy2w4qZCZ
         lRbGY7gRvKTO13n7NFF9iA6JqRt36yRqFmFj4/hCq6JiLBKEkFwTlC55quI8rK7YvKAX
         ctS5rEHI01EHcSIykKgZ+SZCUP9owodsx94i9N1OmpU/J55OD8ime3ArphbmG5nM/DDA
         mcOA==
X-Forwarded-Encrypted: i=1; AFNElJ+DbrbEycMFRqwPeYndTtxLWgnmeVaCh4m0q+KExmS90JOnjd2u5INVW4c4SM57UNsMZkREgmWP8aZXLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXZfS/1PWRG1BWu3lG1hCH7M1t6os8aaJmmGKktgsEutDDGScH
	biyphqLNlJDiPsCxedSc9+ugEQR12b9vsKiyfKxcCLWhv9aaN2cEK+NG
X-Gm-Gg: AfdE7cl9VT9Fe7yEch+8BmebT/D4s72qNPTBeHywM69eRDgi1ovrJz0xU/PmP6V/bkT
	1Ac4QUCxvzbh4+wU/dMz2xADwRyJTV6kgoX79pDZpZYa0dSo5Jlpz1458SuJSufw1Wz3fCy5bRc
	5aG4fGYjE4JG/btHdwy0jM3qECTgnOufbfiEbn7g4HpQkMGDqaJV+bJLiHPZdtUi5DFzEs28Fmc
	x0zml70ofOQoR7jvok9Y9aV51KqKboJy39t/QVikUTDCiBHASQ6xLqHTbEYvkuwFRbJbpU9ICoS
	mdx9B0UK9GTg78QIfbImYiYiYcOmioibgEN+sKkMKQK20rt62rdoy8HtkuwJ0X29RRImHg0rgoi
	YwUvmxDYlEz3UQIYRfese/zPdDTAZM6ko1EslYe19/ruRcF9C2+Df+0FebY7PrjO93hwfG7bbb2
	AhudGi4RTczdonxV0yG0D/KUJ4wyxVz3byEesanE+q+yhFZMI=
X-Received: by 2002:a05:6a00:368b:b0:847:926c:582c with SMTP id d2e1a72fcca58-847c0988950mr8839800b3a.29.1783058092111;
        Thu, 02 Jul 2026 22:54:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:54:51 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	u.kleine-koenig@baylibre.com,
	kuninori.morimoto.gx@renesas.com,
	christian.ehrhardt@codasip.com,
	Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Chris Morgan <macromorgan@hotmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Rosen Penev <rosenp@gmail.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Teguh Sobirin <teguh@sobir.in>,
	Val Packett <val@packett.cool>,
	Luca Weiss <luca.weiss@fairphone.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 04/24] ASoC: codecs: arizona: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:35 +0700
Message-ID: <20260703055355.244898-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703055355.244898-1-phucduc.bui@gmail.com>
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
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

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/arizona.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/arizona.c b/sound/soc/codecs/arizona.c
index 8c683b0bb74c..4411165c3734 100644
--- a/sound/soc/codecs/arizona.c
+++ b/sound/soc/codecs/arizona.c
@@ -7,6 +7,7 @@
  * Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/gcd.h>
 #include <linux/module.h>
@@ -1158,17 +1159,16 @@ int arizona_dvfs_up(struct snd_soc_component *component, unsigned int flags)
 	struct arizona_priv *priv = snd_soc_component_get_drvdata(component);
 	int ret = 0;
 
-	mutex_lock(&priv->dvfs_lock);
+	guard(mutex)(&priv->dvfs_lock);
 
 	if (!priv->dvfs_cached && !priv->dvfs_reqs) {
 		ret = arizona_dvfs_enable(component);
 		if (ret)
-			goto err;
+			return ret;
 	}
 
 	priv->dvfs_reqs |= flags;
-err:
-	mutex_unlock(&priv->dvfs_lock);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(arizona_dvfs_up);
@@ -1179,7 +1179,7 @@ int arizona_dvfs_down(struct snd_soc_component *component, unsigned int flags)
 	unsigned int old_reqs;
 	int ret = 0;
 
-	mutex_lock(&priv->dvfs_lock);
+	guard(mutex)(&priv->dvfs_lock);
 
 	old_reqs = priv->dvfs_reqs;
 	priv->dvfs_reqs &= ~flags;
@@ -1187,7 +1187,6 @@ int arizona_dvfs_down(struct snd_soc_component *component, unsigned int flags)
 	if (!priv->dvfs_cached && old_reqs && !priv->dvfs_reqs)
 		ret = arizona_dvfs_disable(component);
 
-	mutex_unlock(&priv->dvfs_lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(arizona_dvfs_down);
@@ -1199,7 +1198,7 @@ int arizona_dvfs_sysclk_ev(struct snd_soc_dapm_widget *w,
 	struct arizona_priv *priv = snd_soc_component_get_drvdata(component);
 	int ret = 0;
 
-	mutex_lock(&priv->dvfs_lock);
+	guard(mutex)(&priv->dvfs_lock);
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
@@ -1222,7 +1221,6 @@ int arizona_dvfs_sysclk_ev(struct snd_soc_dapm_widget *w,
 		break;
 	}
 
-	mutex_unlock(&priv->dvfs_lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(arizona_dvfs_sysclk_ev);
@@ -1657,13 +1655,11 @@ static void arizona_wm5102_set_dac_comp(struct snd_soc_component *component,
 		{ 0x80, 0x0 },
 	};
 
-	mutex_lock(&arizona->dac_comp_lock);
-
-	dac_comp[1].def = arizona->dac_comp_coeff;
-	if (rate >= 176400)
-		dac_comp[2].def = arizona->dac_comp_enabled;
-
-	mutex_unlock(&arizona->dac_comp_lock);
+	scoped_guard(mutex, &arizona->dac_comp_lock) {
+		dac_comp[1].def = arizona->dac_comp_coeff;
+		if (rate >= 176400)
+			dac_comp[2].def = arizona->dac_comp_enabled;
+	}
 
 	regmap_multi_reg_write(arizona->regmap,
 			       dac_comp,
-- 
2.43.0

