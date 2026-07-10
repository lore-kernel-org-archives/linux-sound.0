Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2E4377EAC
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 05:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783660018; cv=none; b=s/yKmiMf3GIn4+7lvOqILg6bCvVCFj1MSx9qtFXq8Huoc9w6j4DGo9d6yCRaARwXSoiFyuuPFRlZQNQRicPHaI+jt/4Ib1Eerqx4OBgFHA3smB18z98thlP15M9q/TheAPPYwJySk8XG7c0qIcrtNivn9jXZRrziA1OAOG4Weq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783660018; c=relaxed/simple;
	bh=nILbPuYN5HDdgGpTz+3+vLTQdHEtspoh90a2ct25aWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MEkQqH1sM541OOu/tWMJxKBYoZAeAy3bjkGMNACrjS6YgFhq+uDG8RHvjQj+Hn6TMEswrVZLDoGDjiVjvZYrjJ6jXYWK49vJhelICccVmSJu8XH3G6DO2d2POLgvegMRbHTeKycF6PKFAVCEb34ff8LRSzxNdsXmiVSJscecUL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qzZl7c1B; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qzZl7c1B"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso467487b3a.2
        for <linux-sound@vger.kernel.org>; Thu, 09 Jul 2026 22:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660016; x=1784264816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E+Xd5j1FUZKxifc/BkYvhS7CfaonB+06ASWIZ0hNhk0=;
        b=qzZl7c1BBH95+b6sa8wYEeki7AIdI5/Rl2idOtiEuLGbm/Hf8C0hon1zDpSMp6BU0q
         Vb7WQjs6MpL4+qJ4hPD5YZuseOvy035FQCpske79RNmIowKiEk1ntpSDLk4EnEuzP8L5
         ReIE5A8urelhm6NLuN8fpdqoTpNWuEI5ffkCqOoRDtMW7/2nIwD4h+9p8SoJ/kU00MQl
         mFn2J25xb41UzhHf14++dFOG6Mcy/WRhcf5AvtoGEEYjOdjqBlp4nvkZQMB6FN3q3IYU
         33DBDbD3P4FsfNMCgoHrnxsfjqlqJ194MwdhuV9ObQ5OM3X5Z4P1iAsoUdJWZl90Uyp3
         KgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660016; x=1784264816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E+Xd5j1FUZKxifc/BkYvhS7CfaonB+06ASWIZ0hNhk0=;
        b=Fs/XwZWy33C27nUjgcO36zfZiPpD7GL5c7dro6arWBz996Xe8pWm6fJ62j0bSPfcOi
         NqiksibW8nxG4EfwFer6pe5+QV69IINQc0/9emnwCB9Zr5hGAb3CmrOSw8vD+CA6plTU
         DF9l3ZxrqmQRcckvMxeyaGWtOeMYe19kWe0HbOqOckDprYV2msXkiXAiwCw2mKiqsbeI
         2oIDNlIgzPpQ8SpunlnYYmwwnlcRdNUVM4PmfGTiZ3UZPNF5tJZ/r+QjK5z2xkbcjiCp
         bmegNe9nwfluUW+0IbMSsKRdHfcRpOgm8Pz2td0DrUjDvRSjoKh83YoYT2Q5sskRoNa0
         a3Pg==
X-Forwarded-Encrypted: i=1; AHgh+RqM+YaWb6eIXMrIT/yiWh4CCX1/qfBex2U9Vjj3A3hd+BnNbPLoifHA2mrSI/wMloslZNJMtFDIcUFQGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMcT5FVLlhH6YhfhcZOTLnIQQEp5Nu8OTcqKZZNPG0hsxuTEcA
	wCp6nIhk1jAwxE4jdLivBEcJ3ItvDQJwsnQF7qioZvoBtUACWS3UTcs8
X-Gm-Gg: AfdE7cny9SR6OsJqZ+tSm5KqwxD/ktRe0x8PxcBGpjR9Fu6S9H1/3AqygKPwgnOGI7O
	5TH8XPDv9pmie6fLD7R4OamBUs8mXmgc6m99rD31BYBlts38uihXbrUoGIwMeOVGMSqpT9SiXyj
	pGe6YHNEpasA3NgHajqoX9XGJVBF7txnWWU5eH0xOZ1E1Y8GIfSF83sbR5sfC6zEa7OMHjKGiMd
	f3C7BnKTPhOUXGL6b8r5evjN5w+zQi7zSD5rA/mqLCAQXNQWNybqVYEoaMHmvHsYFQ5BomFFswf
	MARM/6eP0FM5x4SOfiTLHExYh/0o6KB79B3cDwsUOyqNdLQWebsTPSEjQ97KXKZyNOHyrav8Y/u
	ZzUcgoQB7rBHDqDtVN6kO3jOxMvltaHELRMa9IZNPFG01IuNc+qNhsZYaIQXaWJcyr5RjUHt1fk
	c0ib37OaGnLWBjeS/ZfI85C9rtTqyp2LqCTgt3PoFMbHegMaQ=
X-Received: by 2002:a05:6a00:9487:b0:848:4b27:36a3 with SMTP id d2e1a72fcca58-8484b274223mr7138346b3a.72.1783660016109;
        Thu, 09 Jul 2026 22:06:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:06:55 -0700 (PDT)
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
Subject: [PATCH v3 13/27] ASoC: codecs: mt6359-accdet: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:04:57 +0700
Message-ID: <20260710050511.14439-11-phucduc.bui@gmail.com>
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
 sound/soc/codecs/mt6359-accdet.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index ed34cc15b80e..e1190c644021 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -6,6 +6,7 @@
 // Author: Argus Lin <argus.lin@mediatek.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/of.h>
 #include <linux/input.h>
 #include <linux/kthread.h>
@@ -398,14 +399,13 @@ static void mt6359_accdet_work(struct work_struct *work)
 	struct mt6359_accdet *priv =
 		container_of(work, struct mt6359_accdet, accdet_work);
 
-	mutex_lock(&priv->res_lock);
+	guard(mutex)(&priv->res_lock);
 	priv->pre_accdet_status = priv->accdet_status;
 	check_jack_btn_type(priv);
 
 	if (priv->jack_plugged &&
 	    priv->pre_accdet_status != priv->accdet_status)
 		mt6359_accdet_jack_report(priv);
-	mutex_unlock(&priv->res_lock);
 }
 
 static void mt6359_accdet_jd_work(struct work_struct *work)
@@ -416,7 +416,7 @@ static void mt6359_accdet_jd_work(struct work_struct *work)
 	struct mt6359_accdet *priv =
 		container_of(work, struct mt6359_accdet, jd_work);
 
-	mutex_lock(&priv->res_lock);
+	guard(mutex)(&priv->res_lock);
 	if (priv->jd_sts == M_PLUG_IN) {
 		priv->jack_plugged = true;
 
@@ -450,7 +450,6 @@ static void mt6359_accdet_jd_work(struct work_struct *work)
 
 	if (priv->caps & ACCDET_PMIC_EINT_IRQ)
 		recover_eint_setting(priv);
-	mutex_unlock(&priv->res_lock);
 }
 
 static irqreturn_t mt6359_accdet_irq(int irq, void *data)
@@ -459,7 +458,7 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 	unsigned int irq_val = 0, val = 0, value = 0;
 	int ret;
 
-	mutex_lock(&priv->res_lock);
+	guard(mutex)(&priv->res_lock);
 	regmap_read(priv->regmap, ACCDET_IRQ_ADDR, &irq_val);
 
 	if (irq_val & ACCDET_IRQ_MASK_SFT) {
@@ -474,7 +473,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 					       1000);
 		if (ret) {
 			dev_err(priv->dev, "%s(), ret %d\n", __func__, ret);
-			mutex_unlock(&priv->res_lock);
 			return IRQ_NONE;
 		}
 		regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
@@ -498,7 +496,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 			if (ret) {
 				dev_err(priv->dev, "%s(), ret %d\n", __func__,
 					ret);
-				mutex_unlock(&priv->res_lock);
 				return IRQ_NONE;
 			}
 			regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
@@ -521,7 +518,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 			if (ret) {
 				dev_err(priv->dev, "%s(), ret %d\n", __func__,
 					ret);
-				mutex_unlock(&priv->res_lock);
 				return IRQ_NONE;
 			}
 			regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
@@ -540,7 +536,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 
 		queue_work(priv->jd_workqueue, &priv->jd_work);
 	}
-	mutex_unlock(&priv->res_lock);
 
 	return IRQ_HANDLED;
 }
-- 
2.43.0

