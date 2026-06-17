Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FAD405C54
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692731; cv=none; b=XCVxl5eGTP/kg1LVhOO/bOIY8Ro0WytpnIO+ETZhYrTuuvHdcqXeUYGZ4GfEKcmgb8pYWZw8eiza+qDSiCa1MzAhqEKDb223rXjHO+BGe2ZUs6MHv4w+hEuUCy0NOxoCDyGiCMZVL2ZMtRdxZXxh/wFQdqeJP0dRjHJs0CONhVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692731; c=relaxed/simple;
	bh=OOjMBd7CyBdHcAZuYiDu+E3s9djgXa4ysbiJU+FU92s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bjSFou4PbFAUp4IHd9lODJWXSvesDTTwcly8pJ1HWSRO+H9cK0+6LJmKyTDFoAcKBusSIN4LDCMmBjOI0BnCUtVjK1Hd280Rbtc/8CBKnVdnjp/ZT0LxniJmZIehZF6afa8qissG9zA50y+9u/RIRGBpgzF6nuZJOTySms0LerU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PXZaXkRY; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PXZaXkRY"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30bd445db39so182209eec.0
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692729; x=1782297529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCUXvrbdh2cMObj7Yx72xMWUVLVGbJrlQPkt6NyxLyU=;
        b=PXZaXkRYmVa+I4eLhfvwYaKp+z3D4mujEuBN++rhGjwQCDphHuG/f6Yw6XMdNDmm0E
         HujL+wxE32oqVTZ+ATWCqzwVJmwIoNCpP15Wx/frUOKYRBjsQ2S+whx2T0QLGSd2b7Vb
         hlw9YpiV7YGWJaOlnIOH3AlOYKW7Llrx2zVvQplH0fclB6mlXHuQcybfPq5fyhrI+DBI
         q0Orz8nB9qIHq62Mo6XgiHH7TzLlmoCi8UaYw/RHga/Re/mSHYifNJznQTdrr1tBVj+u
         4W/Jw1OtNhw+51KWcV+9xsjRA8DUHUrhT2WY7ree7AMX5Iq9nFK08Lct8sHQT/44BNbc
         XKlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692729; x=1782297529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oCUXvrbdh2cMObj7Yx72xMWUVLVGbJrlQPkt6NyxLyU=;
        b=mg8UnQzxZSBqAnHjufAGvnc/iepWvP/t/FFdmwTdAqXFX9Mvnw15YByaa3EGApEdDS
         7mHahZgbtXylpqU6wSZKjgR13YmFBes8h1G/GG3gLL5CESuyw1k/JGDWYGxaK5V967au
         DvQBR9OPM+YjOH/FE7r3ew1tojoJVxyqmFbAOdhkEiIzFz0SNFlgcfshxeGJX/xytlUQ
         2YSBI9FMn5zaNXrzC0GrsrF1blG2gyN3hD7kosACtnYnmnFazdvPSlx2PAV4UP8b+Xoa
         rzME3G1NLhhOQqPKspEeiOuY6vhnusoqzRs8y7tVWEqfGLeO84BGGvEwVsb4yWOChPZR
         5r8g==
X-Forwarded-Encrypted: i=1; AFNElJ+afT//aNbm2ItuxyPwR6T2lyS86xlQZT7fd71UbOJl3gl6+Xls9bJVM/m7Nw1tpuJmvf0Xlv0p8tOLkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YygtULjx3ePrIUj6fF+DaifH7v8QWdn7fxbpqm5fsJVnYRqK3rd
	qp4r6qeiixqvOT33dmlhwmIOqJBvy7AO0UrM0LHGbabWeevYvQDGvLFj
X-Gm-Gg: AfdE7cmH93YEg8Rrfl+EYERa+585U7Z0dcWltl3IWwxfh4PZKvMu2D03NxE5F5OhqEV
	5RMYKb1/x7miTaYEZBXydAHKq9CyfPEashX1nelSFchZXl8JUTL9ZS9nvmXSbmyBnzUVyp7veLb
	kp19ihQ2yu0q9hLMcw6fujphaNKxFzHC4jSsjQY5n+RL1n4jJA3mkwHIIi+W4jk3u1rSAkwwk5h
	Rwrs55MB45tuA9Lkr+cvOOiBuVDCnTK0cu7YMXNdJaoYUI42SzUD7kXRPFq9qlYlzNKFXOdCD5J
	/NaLLQFe4aYBXVD0P2+jFSmnVXman6QcUCiX0DeV+1VVvx533eZ5aRxVLKkucDZ0fZ/ez08Mab2
	/zr4g9dC5MXFOpuTRDqBratFQk4WwRezs3OjMFldw5WWMyx9VbRJ8JcULfZdIO87t7vnFDWjLoV
	no0YkMo2fS4CDbWHhtw5EYiT2YP79g9kjj0x4sD5Z744SvALs=
X-Received: by 2002:a05:7300:3aa8:b0:30b:df3b:fe94 with SMTP id 5a478bee46e88-30bdf3c0705mr265671eec.3.1781692728927;
        Wed, 17 Jun 2026 03:38:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:38:48 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 37/78] ASoC: codecs: mt6359-accdet: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:54 +0700
Message-ID: <20260617103235.449609-38-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/mt6359-accdet.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index ed34cc15b80e..5feefd0cad75 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -398,14 +398,13 @@ static void mt6359_accdet_work(struct work_struct *work)
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
@@ -416,7 +415,7 @@ static void mt6359_accdet_jd_work(struct work_struct *work)
 	struct mt6359_accdet *priv =
 		container_of(work, struct mt6359_accdet, jd_work);
 
-	mutex_lock(&priv->res_lock);
+	guard(mutex)(&priv->res_lock);
 	if (priv->jd_sts == M_PLUG_IN) {
 		priv->jack_plugged = true;
 
@@ -450,7 +449,6 @@ static void mt6359_accdet_jd_work(struct work_struct *work)
 
 	if (priv->caps & ACCDET_PMIC_EINT_IRQ)
 		recover_eint_setting(priv);
-	mutex_unlock(&priv->res_lock);
 }
 
 static irqreturn_t mt6359_accdet_irq(int irq, void *data)
@@ -459,7 +457,7 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 	unsigned int irq_val = 0, val = 0, value = 0;
 	int ret;
 
-	mutex_lock(&priv->res_lock);
+	guard(mutex)(&priv->res_lock);
 	regmap_read(priv->regmap, ACCDET_IRQ_ADDR, &irq_val);
 
 	if (irq_val & ACCDET_IRQ_MASK_SFT) {
@@ -474,7 +472,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 					       1000);
 		if (ret) {
 			dev_err(priv->dev, "%s(), ret %d\n", __func__, ret);
-			mutex_unlock(&priv->res_lock);
 			return IRQ_NONE;
 		}
 		regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
@@ -498,7 +495,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 			if (ret) {
 				dev_err(priv->dev, "%s(), ret %d\n", __func__,
 					ret);
-				mutex_unlock(&priv->res_lock);
 				return IRQ_NONE;
 			}
 			regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
@@ -521,7 +517,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 			if (ret) {
 				dev_err(priv->dev, "%s(), ret %d\n", __func__,
 					ret);
-				mutex_unlock(&priv->res_lock);
 				return IRQ_NONE;
 			}
 			regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
@@ -540,7 +535,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 
 		queue_work(priv->jd_workqueue, &priv->jd_work);
 	}
-	mutex_unlock(&priv->res_lock);
 
 	return IRQ_HANDLED;
 }
-- 
2.43.0

