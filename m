Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0FE48094D
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 14:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520450; cv=none; b=hz0jkSgXKTFe9VXKmaSaw9d3qDdDqin+MQzvCscn1tcc11Csh0oxxdHjDURbU2puHA8jWLUL29wHpT4d1qd7XHASG4AJw1nsLqbxC0EwXztSZ11ISpaBeX41PNVXUN+s09XLCvKrH8Y6hsTNunbtWVfSIhueFwxLHbVgs+YS4tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520450; c=relaxed/simple;
	bh=nILbPuYN5HDdgGpTz+3+vLTQdHEtspoh90a2ct25aWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s/TlPQG0TiU6SzpyJnJNp5Af8ZL2WjdnKidI0HIAba6ueFwdhrFdH1WtIatKZrtJ1HwGs5Ca8cWCg0OqOetXaR96zgzriNcBdAD19HTLiuAId40T/I/NH7Ny14N88aJToBaSuhzkcmix7GC3OaZx9tMbahI3qr6n5S0ZXJvEoqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WkEDZbZw; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WkEDZbZw"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cac59f8b64so8683745ad.0
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 07:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520449; x=1784125249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+Xd5j1FUZKxifc/BkYvhS7CfaonB+06ASWIZ0hNhk0=;
        b=WkEDZbZwU9JCOFbwkEcQmPeX935aWTo49+/CbEHuuFFGxh5EXcMPNkPCVWZVDZTzO6
         Hky5ubjnZjCwZF0A2/dvJcVLV91ITlbbhUusbZTy60WFeQqGpz+r6tbbd9ckBIL4HU+r
         bNW0+WPQfFmeuC3UDjDB7ML/oYpnWnScFmYZtb5KrYaOR4lRa0Q4HFEklrvxkd/M8nsi
         /iIRA0QOkfDcvb3bFqimDTTn1QUBgDcNW0QflX++iaDJlQPAD7oprObAF0h2/Ubr39zS
         PF19XiVn9gWsvCEk7XumvA03qiKgxBc7VKjwmYrPQ24OE3aPqOTi7A4oT3Stb2GSDkJl
         jYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520449; x=1784125249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E+Xd5j1FUZKxifc/BkYvhS7CfaonB+06ASWIZ0hNhk0=;
        b=VEaoLh12CZXdWHpPXGh+zzuyqzpY7eeCSN20ZxDvLdG8JVeK7+6bIJQXR6l2cDpQ3z
         wGABsGoSGvMW5m01g/h5LurZ83FBlTiNjrCYsuqZfHKi69UQMkwzIrhe/H+u9lUe4ou8
         WXlsrGfa11vQ5+JYYnSRkG2VtgrUS5s3OCeXzAByynZB2d3rChGOQ0s9++lkmh02zMOu
         Q84j6Dr6s+dA8XtpfBlKmM446eXHOoQAOOQlYVI8lHOX5G6ItF1625A1fKR7uYfY24HJ
         UApGqad0oMjeKiSl3IWFjcYpzjzJm9a+rcBPSCn4/49ELsBjD25dYqz8SKGE+xee25wd
         5aow==
X-Forwarded-Encrypted: i=1; AHgh+RrXFHZ5SO8zlzwOeilHkxznJsU0PyYks6mul8dWHod5JTL5lGKEQPkBZSPBi3eTyd7Xxpmzqup6lqXRNA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe9/G8ZfDRAuHomDf33zUaopJNgCwPNf+hBzIh5T7okjyu7FgH
	M/KCwFWh7QVnHh9KVCsCpNwID/roG1+DS6KMA3x6Oe3MNeLx3wk/ffwZ
X-Gm-Gg: AfdE7cmg4xZ8nSJossQnfJLjvVRnNsnLQcfz8+qDQ3mghbBjnKVgRcUB+7ZimuUKdWo
	tP2HAQHhWBGIxaOgvdsQ79sjFHiH7dtREBE+9wBpHLECOVoBzgQSW6xVms/CgNxPaAb7l+ighuW
	Klp33iQrSYtRIgk16293gfribpvaeFp6e84krHBzi5r6HbpTZbbvpJ2EosNPtLM/VWjnS442hXO
	Sf4zakikZT92x0p5WMjWbsx3jmMdld91vW82ZzqFEuzE0qLl6QY/BllVk++TAGEo6a1cbjqGMM2
	dCOG+4O9gyjYuVn1A8YJvD0PGAwCiw8+pAEniltmug0qO9mf+GM4VTrlVpOtNWw5dfhV1DF04Rp
	zMEiVsyYS+w01m3WDbBpZdtUgjhdW3m7864M2j9rZsKQMQE6OOZhe0R97mamQElU4ccxGKnZLk5
	3XXJ38VcBH9hK8reVVnDZ+dsjmbOAZNoAsFr2VHYJC/2tcR7U=
X-Received: by 2002:a17:902:f64f:b0:2c8:248a:5dbb with SMTP id d9443c01a7336-2ccea2d7881mr31360455ad.7.1783520448903;
        Wed, 08 Jul 2026 07:20:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:20:48 -0700 (PDT)
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
Subject: [PATCH v2 13/27] ASoC: codecs: mt6359-accdet: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:20 +0700
Message-ID: <20260708141734.578926-14-phucduc.bui@gmail.com>
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

