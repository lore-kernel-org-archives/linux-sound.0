Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDF6362133
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 05:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783659931; cv=none; b=hqluySGJ/1QIQnf+Zgo0qwwm3oeeG9FBJ8fWE7ROfkkjCC6xdbppcJo27l27Q/HFhHpkatyKFVNvrMCvAjqUrx482ysTnY6F7bAYDSOfdAuYg+M17jjxQzGSUJ+Ry79qNzGiJjhmLHsNZ6hCgjMTLpRrVzgAh1ezq8obkbbcrVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783659931; c=relaxed/simple;
	bh=XWI4jCnd/t/sfMXYAr8klk5lyo9qyWRg1g/x4qLIB2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Eb21g2+PkOdvkBLhxFRduxsr+Dh1mdDR9IUjEdtCCqI0UN7Cm5wCLmpAHz3NFEuZ7hhJ7b7iPbnpSHyI+FkD6Qr5rwx5fD1CTGyMT4oISLX/C5dggKwHPxyhi1AaL4yUJktafjCNt/VTMkK/oKdmD0W6QejVfHSYdI1jc7ntfik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WNQlyv2B; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WNQlyv2B"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84830c774a0so343494b3a.1
        for <linux-sound@vger.kernel.org>; Thu, 09 Jul 2026 22:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783659930; x=1784264730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8FKz6zL2lYGruFgrXSmVh8CpNcaMm/DKeCPXfcKM2u4=;
        b=WNQlyv2BB5sZzZX4H+nzmWrCc5ZWL4M7Km+7xOqnx6zoVsQ3X5/iMB/AD7MXu3NhBD
         RMEbO9VX2bC53Y8AsfxeRGRACAW0W+cC0qlKS3KZHylzPuEPdDD1FWgABB2GQPXXEU35
         ewLoAmpb/zSTkLvl/ENuAqtaVdqVJZFpBjkWJnchaOswFXmotGViIHY0twnyP4WLxwxD
         noreLd9Pmb+oC6x6XeUeUeB0/h3EYRmCu1xQn/89DZR5AzES1gRmWX3fU6e9/PsU7ZxL
         q34Jj75DK36N4Ir1hDN5Pq11J43Nr+9gSXLMLGKCoHKHrTFGSNmc4YhyMHp2jfwX9dIh
         fiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783659930; x=1784264730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8FKz6zL2lYGruFgrXSmVh8CpNcaMm/DKeCPXfcKM2u4=;
        b=hmWIHngRztihpTyglym+JnZ4UlxkwsaYN2FL7Y4r39o0mXsQczFmJC4pdKHvFw/Vin
         Sz29LNGdt/Hus6vxy528A2UcME5VHqkujUDEubRSUyWYY+yjNZhVfAl7UvfP9Fgm0Bec
         SugkXntubYoX6+jr/ttBtx/nsAsp4bID/6krt2J6IIbtcQqtgEzBeagW9AMEVPvfpNY+
         N2Q8aqKRh5djT+igHFNZE6lcWlIuQjdz83slPoF2ULMmGGhZ8wE13GPF9AwXurmP0KBV
         5dZDoIDGYDYEzGKcFGAtP90Vp/rQ+u3cEQWoRuuBF6uQDdntpvn3DrdZjpHEECfXpmk+
         Qc2g==
X-Forwarded-Encrypted: i=1; AHgh+Ro7y7mJTXl0R7XEoTm8DaEUZJDb8/cJgSj2+yp61sNNRREl9t0k5D+D9S2BFyRSa5kkFFhnEDe0L7vV7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb4boEhGwCwkCtIIB06ZIp4paA9MH6moQQ0q2L2I8/asCuupXA
	XDSkxcRP4+BM22+bqynrMrvSuu+qjCBVruWE+gX/lylf6dYP3i9RJH2B
X-Gm-Gg: AfdE7cmNcHd16ThECexT90TYypVemvG/O86dhQOUKju0vd/Ej7DpMLGyWrOFnBnpKqO
	l0+lm/OW2Y7huccU4w2+4Zf0oPWhi/LfXGRFKqmWLERVKl52D1vxRaYAffD5n6uf7BLk2L63qfY
	wBaohAXOchF74UHcW3Fz42S1kahFSnfH8BsqFe3c7dTPyTAhZUerawEp7UM99FN9thzigXDAoAN
	vx87NQVTYCW54Lty7h+o50/1V06Go5/SMJ/Kfvckns9y3Dgqpw961ebge/ZYFhzdbeM9xeEoRn8
	R0w+2hcbA8R6WuBECt+HHPw5tyUo6c/hHakTjoeK7yBOO7rA8vpoNlUmYlJg9QaM+e12h4/xozM
	P1kHLI5+PlkZU5UHOyK+3+HkjPjdXm8a8dMyc7EoUs7nD+6C6xaNKjSeBsLGyUH+W0xmnGsOhuT
	EjsNuhZ+x+CDZLC3R+nvpe17wGHhQX9oaPPf4lSiGnGC38/ZyNP+1rB8jtQA==
X-Received: by 2002:a05:6a00:400d:b0:848:6447:e09c with SMTP id d2e1a72fcca58-8486447e365mr3946827b3a.39.1783659929668;
        Thu, 09 Jul 2026 22:05:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:05:29 -0700 (PDT)
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
Subject: [PATCH v3 03/27] ASoC: codecs: es8316: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:04:47 +0700
Message-ID: <20260710050511.14439-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709045902.498848-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/es8316.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 3abe77423f29..87f331868dc7 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -9,6 +9,7 @@
 
 #include <linux/module.h>
 #include <linux/acpi.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
@@ -620,15 +621,15 @@ static irqreturn_t es8316_irq(int irq, void *data)
 	struct snd_soc_component *comp = es8316->component;
 	unsigned int flags;
 
-	mutex_lock(&es8316->lock);
+	guard(mutex)(&es8316->lock);
 
 	regmap_read(es8316->regmap, ES8316_GPIO_FLAG, &flags);
 	if (flags == 0x00)
-		goto out; /* Powered-down / reset */
+		return IRQ_HANDLED; /* Powered-down / reset */
 
 	/* Catch spurious IRQ before set_jack is called */
 	if (!es8316->jack)
-		goto out;
+		return IRQ_HANDLED;
 
 	if (es8316->jd_inverted)
 		flags ^= ES8316_GPIO_FLAG_HP_NOT_INSERTED;
@@ -681,8 +682,6 @@ static irqreturn_t es8316_irq(int irq, void *data)
 		}
 	}
 
-out:
-	mutex_unlock(&es8316->lock);
 	return IRQ_HANDLED;
 }
 
@@ -699,18 +698,16 @@ static void es8316_enable_jack_detect(struct snd_soc_component *component,
 	es8316->jd_inverted = device_property_read_bool(component->dev,
 							"everest,jack-detect-inverted");
 
-	mutex_lock(&es8316->lock);
+	scoped_guard(mutex, &es8316->lock) {
+		es8316->jack = jack;
 
-	es8316->jack = jack;
-
-	if (es8316->jack->status & SND_JACK_MICROPHONE)
-		es8316_enable_micbias_for_mic_gnd_short_detect(component);
-
-	snd_soc_component_update_bits(component, ES8316_GPIO_DEBOUNCE,
-				      ES8316_GPIO_ENABLE_INTERRUPT,
-				      ES8316_GPIO_ENABLE_INTERRUPT);
+		if (es8316->jack->status & SND_JACK_MICROPHONE)
+			es8316_enable_micbias_for_mic_gnd_short_detect(component);
 
-	mutex_unlock(&es8316->lock);
+		snd_soc_component_update_bits(component, ES8316_GPIO_DEBOUNCE,
+					      ES8316_GPIO_ENABLE_INTERRUPT,
+					      ES8316_GPIO_ENABLE_INTERRUPT);
+	}
 
 	/* Enable irq and sync initial jack state */
 	enable_irq(es8316->irq);
@@ -726,7 +723,7 @@ static void es8316_disable_jack_detect(struct snd_soc_component *component)
 
 	disable_irq(es8316->irq);
 
-	mutex_lock(&es8316->lock);
+	guard(mutex)(&es8316->lock);
 
 	snd_soc_component_update_bits(component, ES8316_GPIO_DEBOUNCE,
 				      ES8316_GPIO_ENABLE_INTERRUPT, 0);
@@ -737,8 +734,6 @@ static void es8316_disable_jack_detect(struct snd_soc_component *component)
 	}
 
 	es8316->jack = NULL;
-
-	mutex_unlock(&es8316->lock);
 }
 
 static int es8316_set_jack(struct snd_soc_component *component,
-- 
2.43.0

