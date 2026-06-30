Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F103E5A24
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 06:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801352; cv=none; b=m64JUj6kao32QGRahZjcAgG/0TXYDj2QFZh/zc2hJ2pBLH/mHQ4ElM7F5EF2I+Nj+Y+wXWIsAhetvaKjnsQ2UL/lh3tIvjIYiq+JPJ2vV2HvfOP0OEbn2dmFTIK9oO/Atkg9Maw7cPdOaGL/+wXHdFcLApzxj03gN/DBYW2epas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801352; c=relaxed/simple;
	bh=fTei+vUEtZNmVemds32xGB8uary3SUfKARXY0HPVp94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O14ejg+6C3c2KVrhhkcofu/NFdIr5tvLDoSRU0gSiJ9F4vqnZWcNIXqArblgZDsi7VMMyHYO/tsGG2YLMPQw85pm3Tul9BjuvO0H8X5nKN7wtflNi/WsQtP8rNCThwZEKnAjBAI5FW6oz4MAZXbImGRTNX/VzPFRv62JZ4kvg2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FDi6GPhN; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FDi6GPhN"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-846970f0acaso1588208b3a.3
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 23:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801345; x=1783406145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SaBgmvHyCdtOOzTM9Q4PIyXVQ3lhLlNUjuQP2hIqGR0=;
        b=FDi6GPhN+2bto5YvAJvdy8oubusuCrk3xnMmCyh4uxEpjsixGpccJC8MeDbC1MEnNx
         HqnvLeLxjL1xOBTh9vhgacGlkpYSilamQE/KYapFca7dHByVh/r8s+PiKtFlbdE8VEXd
         7sRW1WONAZ0iXN/eu4cmO2CZ6fSPDqqRj9c9FRgxEh5pub/EkTg+CN6qPrava7xxd7fK
         FptGZ7PIVLMDUhbrO/rKx5KlPRUUzvX36cCs1zIMFl7RgeUkDc6KVIauRFqdCgU+6jPz
         AmNAxjMHsao42G0FF6B1fYH3Tl5LZ6OQSGVV9Pu2G2wN/T8qqOHZQay9H5CyjYGU0jrr
         gWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801345; x=1783406145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SaBgmvHyCdtOOzTM9Q4PIyXVQ3lhLlNUjuQP2hIqGR0=;
        b=rWXbOfWLyO97y9ghd+qIz7zLwBo92qQ0E+2/hFm0FMNUNQqnYrCrX1ZfQ8mNPh8QZU
         HIBT4JCugYBBeEMSSAhrmC5JGb7ojrJ5q5mhZTQlvXBfqmAHQRBYmadaI84kapgPCUWd
         swqU26x1rfo8S0QeiEl9WX5CGPl70MvbW5ln5L0qZYJkB+hg4WhXO8IQpsvhW5t+Wn9I
         PNLThWJ0W5saEXZLFGEGelvYj8aMWJhKLBjH34Ag7NfZJo7yeCHm0+1mx17gmR5ANhXl
         YznFNDKZpaukzZb67OCTGz72C7+zXiJFpIE8d3mBRT8HqKaJCaMtJG57OXqGIUb7CXH8
         f/TA==
X-Forwarded-Encrypted: i=1; AHgh+Ro4ifFcVfdQ+CUTjQgOZAnAbozfact2SUu3e2Mx3AFJr9HFfYqACavCRQwLO6OeFtxfJrqZunBxmegmsA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+ecGMEveezuxzTNxwFQOV9jNaO4LYRJHvcFscBflDZogavoT2
	SDg8Mo00kblrB7jYfzY9n9CMLLZLht3kCSgJAyaWJoBod3lsLNPRnhGL
X-Gm-Gg: AfdE7ckTvGr0m/rMXop9/NslANS2mmGqHLQw5Jm6BaPyUvYvG+hv0GT4MxyIHYSHYdr
	Q3EXaB5k5mFNwPkrAhGT3eSpV6Klvj7IIZdHwTeryZs+jYvy/YvNb2+ZB+3zUlPf2UuUYaGwEB9
	Ts6V2Hjc6P2x7f8cKkb9rgVroUpVoviwehbA1vef8wy/G+AiSpD/o6xt6DL1XJfil1B69sq7hxS
	lDi+EWWy32OYguy5w9sDEviuNbXeYfg1PLK59Vvn3669VTRXuJscS0E6Iqaw5LFwib2c2SiWso0
	XdUIcDghZE3uXr2Ksfj1JUYpKOvPTlzgHHscUJfZpnrU4qs1thdvgMVKE71xboW8UPFZ3rCX97A
	QRoduEoQnN9dZh90/y4A9R7MCKSlKfwyIaXS6ugEH3YteDUCxVEXIdgxR9X9fex25w6JEmH2CCV
	Cb4r7VnZAW6xRg1TBCZf8rHEba8XxK1Dl/5lAb0RcgVeaRX5Y=
X-Received: by 2002:a05:6a00:3e12:b0:845:e873:4248 with SMTP id d2e1a72fcca58-8479f3fa66emr1886818b3a.56.1782801344986;
        Mon, 29 Jun 2026 23:35:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:35:44 -0700 (PDT)
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
Subject: [PATCH 05/27] ASoC: codecs: es9356: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:27 +0700
Message-ID: <20260630063449.503996-6-phucduc.bui@gmail.com>
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
 sound/soc/codecs/es9356.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/es9356.c b/sound/soc/codecs/es9356.c
index 8db81d574624..8ef9e70a9316 100644
--- a/sound/soc/codecs/es9356.c
+++ b/sound/soc/codecs/es9356.c
@@ -7,6 +7,7 @@
 //
 
 #include <linux/device.h>
+#include <linux/cleanup.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/soundwire/sdw.h>
@@ -501,16 +502,19 @@ static int es9356_power_state(struct snd_soc_dai *dai, unsigned char ps, unsigne
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
@@ -1092,9 +1096,8 @@ static int es9356_sdca_dev_system_suspend(struct device *dev)
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

