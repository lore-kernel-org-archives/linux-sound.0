Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361B3480320
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 10:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629623; cv=none; b=gL1cVgnRqvKQQc41/QehRF7JAy3FkIZW7EZrE9jdnMrbZ/PEosS/PkABnUqzFYi/zIu6U1+iDH+fIyT96mmFJIUHZmAZzw+K9YAvIoU4I9bRkI7pYM+4fkqeI3BFHHcNpjJyZj5eUvqH16hJqype41JffqHDt1taIcBhzn5MOFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629623; c=relaxed/simple;
	bh=Zdr8hLxY9++tkgvmrSBQ/nmGUnRqi1UBxCC3v/LYELg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qiKCuIzwxAa2A9ndO0c9WYXl4utoafc66I009wqt/I09vRfROG1VD3mvBNs/iGhnyAFtxHTpUqYWXCBWB49hF88Wt37QpnTmb3mJA0qvKSGzOdl0caYG50GeS/D3OX/3vc08mi7/WzfLxNqfmd59Kl8Sn436sSIsLiQHjt+bxNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N7R5xvVu; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N7R5xvVu"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ce98cb8165so49944155ad.1
        for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 03:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629620; x=1785234420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hzI+xvr6p88cYg+8jImYn6yoqZyRq117x6xc2+j9GZs=;
        b=N7R5xvVunErfhJR0ADvhnNPNEWcXlY2EoRLsk76MmixsliZWyGmI0zCU+FvWEW61Ty
         MRdB/MegMoYKT7g2qRtZNF5uAK72fy7XzAQlsndEUwmA24WtUnMOZ469MJqD0QSAJWF1
         OfRBqFWCoBwVeg6S1SYDJ8baz19YIDbCXRcGElEhZJFefe2e1WpjU/5BpV/WPcADF9PQ
         NRxzvLyInEs7kyCfpsSXqSkBPzcVG+pkmjiLRA/MIanKQO/+8ypWzvD4NZxM+CkmknN+
         /1MobZwbKiGg2NFdKvAXuESylphOOtbry+uXMzF5CtALWmSKbEP0KxcyXa33P3QnJzET
         RAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629620; x=1785234420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hzI+xvr6p88cYg+8jImYn6yoqZyRq117x6xc2+j9GZs=;
        b=pbuBxrUfsYBEdWyBbeWPxAIO5Hl/nCmPCdrGeRkGNJT/hon2F6bhW+DaTYicYa4tBx
         pFo+1GvEK/dsZgHH36CxCzGJGJVM1eGxBaUEtaFAFrYNHBBI1fvpV/eZWm3l3UyfMp3i
         /ATFcCSBLswKkcX8eLDr5ngPmutN2nPn2CeIA/fOytXWHVSI9fXTeREmVAUQVYVQVUFM
         /JQpvLEmrwVRsBgsvubjcNdsTtnrOh+Ngh6R9R2+Bzxp1Reizs6DXt8SlpZHCoB+8Akc
         kY2iDWt1dodWW+sYQej3fkR+b/9C8jVEGRZYtQtsvsZSnDS9O0pj5lD/m9pU7r7Vrcwq
         xZkw==
X-Forwarded-Encrypted: i=1; AHgh+RoTZFKDNB2BXlQ72gy0qeKdIQZ2tPvVf9UzkBosOw4p6PE551BPobjR+Zea+ehbXyd7k38/4QcfvAPN+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqe5it1ITMwHC6PiUhqrUYa38oq/n1imyB0kTPSRbPKvJ92+aP
	sGx2fvBGNBq+1vuYb6qTkZ6NDhUj7dS9ObuuRF79LIgp7M20BPQlCTB6
X-Gm-Gg: AR+sD11Ot4x5wynwxm6/Eevhgv3PHvNxQEESR7Qq+yO1FWK/GUlMZLUz9FrtJxB4LB+
	8Wzcw5K++ytgaaZVOncY240iaEbARWChzVJc/2ixmWIn4LKBb3R3WNupJilMJf9fc8m4UwYWIAL
	5sXeRpVRgimiHnlqA0eTVOth1X8lqNxaxKJCJjQVYEoL7Erhq59u1axA5ckqmWNkX8gHA2TGvAz
	zoCBCpu8VTZhHR1F37NO5givvN4Kh+Np9+PdXz8M7QrzyKwXxFJF4DaJVJ7wnV/SFJ9lxmk2E73
	NvE5HKsqytNU25T03uvn01BM16/Dc6OQ3LxM+yiT9Ce169Mq+qlsZPbS1/n6uVDrka4G5lht5Ym
	WsztfJ0NrDDR6ZUyP7w56UhA2WOMgRt2SiEUKFHnXvDF3nByaG6PrF21WUARF36XICGv/mpxV8n
	KSKkPI3tOGVZrunSp3qqDKhvcDyMvbsnf6i21c
X-Received: by 2002:a17:902:fc43:b0:2cf:41ba:96c2 with SMTP id d9443c01a7336-2cf41bab3cdmr143685015ad.12.1784629620455;
        Tue, 21 Jul 2026 03:27:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:27:00 -0700 (PDT)
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
Subject: [PATCH v4 05/29] ASoC: codecs: es9356: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:36 +0700
Message-ID: <20260721102600.523199-6-phucduc.bui@gmail.com>
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
 sound/soc/codecs/es9356.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/es9356.c b/sound/soc/codecs/es9356.c
index f574b3d6cb3c..a9863900bf70 100644
--- a/sound/soc/codecs/es9356.c
+++ b/sound/soc/codecs/es9356.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/soundwire/sdw.h>
@@ -500,16 +501,19 @@ static int es9356_power_state(struct snd_soc_dai *dai, unsigned char ps, unsigne
 	}
 
 	/* power state changes are not independent across functions */
-	mutex_lock(&es9356->pde_lock);
-	ret = es9356_pde_transition_delay(es9356, func, pde_entity, ps?ps0:ps3);
-	if (ret) {
-		regmap_write(es9356->regmap,
-			SDW_SDCA_CTL(func, pde_entity, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), ps?ps3:ps0);
-		es9356_pde_transition_delay(es9356, func, pde_entity, ps?ps3:ps0);
-	} else
-		dev_dbg(component->dev, "%s PDE is already %d\n", __func__, ps?ps0:ps3);
-
-	mutex_unlock(&es9356->pde_lock);
+	scoped_guard(mutex, &es9356->pde_lock) {
+		ret = es9356_pde_transition_delay(es9356, func, pde_entity, ps ? ps0 : ps3);
+		if (ret) {
+			regmap_write(es9356->regmap,
+				     SDW_SDCA_CTL(func, pde_entity,
+						  ES9356_SDCA_CTL_REQ_POWER_STATE, 0),
+				     ps ? ps3 : ps0);
+			es9356_pde_transition_delay(es9356, func, pde_entity, ps ? ps3 : ps0);
+		} else {
+			dev_dbg(component->dev, "%s PDE is already %d\n", __func__,
+				ps ? ps0 : ps3);
+		}
+	}
 
 	if (rate)
 		regmap_write(es9356->regmap,
@@ -1091,9 +1095,8 @@ static int es9356_sdca_dev_system_suspend(struct device *dev)
 {
 	struct es9356_sdw_priv *es9356 = dev_get_drvdata(dev);
 
-	mutex_lock(&es9356->disable_irq_lock);
-	es9356->disable_irq = true;
-	mutex_unlock(&es9356->disable_irq_lock);
+	scoped_guard(mutex, &es9356->disable_irq_lock)
+		es9356->disable_irq = true;
 
 	return es9356_sdca_dev_suspend(dev);
 }
-- 
2.43.0

