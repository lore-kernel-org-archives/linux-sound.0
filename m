Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B8836605E
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 05:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783659942; cv=none; b=J3ozd1T8LdqUotJU0hOaEf1txshNS/P28GpAts7oDPTOAYKNNEbviqY+WHNcOVy907zOBdYMoRimsLi+zL72FXZ3d1fxcCX9Fp848Uy7xYPyJo12Czh3Q7sGdThLEn9ktCuz+4j28QUjpgH0kOp0XHX9Bwyl5PnT+2ffhYpHNZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783659942; c=relaxed/simple;
	bh=Nw9I/srswcYHcD3WiPHI5wa7OL9sfHmNK5DnVVQpY1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jLE1l3rnlBuN1A9r5F0oeo5tdlOLGiGixJHV0lzpxoyNVjE5mZ1TIZB9I4IYGM+6o9Wa7dCJE6gIGyqNBBhUpT7gefQfQ6CRLDpwj3r1aikZN0nI8c7u1dYTzbhFTgwew35EPIaLZlSBYjCmmg2jMiokL61eexwAzudG/47XUCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ddYFGF9I; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddYFGF9I"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8485ef63b68so463971b3a.1
        for <linux-sound@vger.kernel.org>; Thu, 09 Jul 2026 22:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783659939; x=1784264739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=glNXCWo3feUPJNoiqEbeBkuoiMlb+JtOjIAbpp+cCDQ=;
        b=ddYFGF9IMnDNRxEg4QzjbR+d24b0KzHR3C79ZFprD2MztRdgFd25cVbEJcBSVXL3r0
         VtyQQwyVZAerAN1hdm6av0vm44T9Pb3VUBMSRsw4o1BWUUcy69fnX0nnDC6kfFZ9Fp9B
         83sJLvv6uIePjVR92PHh9N7egVrOz/xd1sDlVJahbNsG1Fyl0CdsaGH6ooQcEQqos6hq
         I+wOh6zcre2OIFXhfRnvknxsxjTZb2kC5Bmt886oY7do/TtUd2k5fuVc/AHzNSOkT+yQ
         600S/rDISxphjlq5RCg21/OxrW/hYUqHbb1pJ4HQ0aGVtOEen/IUr4b6d3/ilNZXIYLW
         7Kvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783659939; x=1784264739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=glNXCWo3feUPJNoiqEbeBkuoiMlb+JtOjIAbpp+cCDQ=;
        b=CR80N5Q4cak0CMjnpFdUdqxx9OxS262OBAHntdJ0NyA1rtbXJKZ6XNJ4+N1/vvv1A1
         ttQzsnZB8YjDLn/mXteiJbx+V9ocsdv5KywPWrDd8S6GlPi8enm+/llHZj+uZbbb0IYe
         FtlSqkHW+XnR0qZ5xCX81MOdwtmUMcWL657WNU3Z68/tIsFALYo3nwQg3h1LcOKk9SPJ
         Mwf/6C/3/Ea7qtR08pIO0zNYhzdCzpLI1tgJnfUovsqrDc93j0rlPvNE8/U/FphGdSdz
         XGsStpv9u8Yc918Ou3h8Vqz5qNvTCWs4cbv5T8CPcXq/alkjgpaUyI5Ovir0Gd4gR+JW
         aMwQ==
X-Forwarded-Encrypted: i=1; AHgh+RpDVgpc/KK+t69C3h+z0vvmQXFJFOPccn1kTilHFCsjL3m5MYHfRiyxyE/9YpLbEC9blidX8JsIPokQKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEhFI8A91sSgA+NUzh8zU4Gc/FPfJJGR2OsafVgxkyogfRL9BU
	ydjz3sfwA44rVcydSZpfXjOMXxPlwLnUYlFngBxBxoSH8j+/cu7Ek03B
X-Gm-Gg: AfdE7cnSKTnghn/UiK4QshsM5kRUvGdA6FvdSWPzDY1mMlZ1o9BebJ2+PZtV9C/IbbC
	MdrRYbzUmad/og1prIdw14pbIz2UMcDrmrOjyFBY9y9NemcXC27v9xvVzVJUgjN7yWGsssfe5Cw
	5GmSa+dnRao3AephK/FWze5ZCEBadbig2PVF9XkFT/Q6AlhYunOp3uA/8dhnRnlC7kKe8mdZRKQ
	w3ZMIg1HfQwYsQqlWsyd5u96uhBhvwUawFewZ36oXN4LOfQUmZ7HRPwyjPofBNrAZo5CAH17Bxn
	VRUZ+EpKyqUcx2az8WTSJe3dwwKPBpuZWV0PCIQ0U9QEWqQmEbBYCPFs/U6x1Mezu2rbdXhPDu6
	Zsjgs2F8rcY9rdEgYeBXAdEo71PIL3H6fTb6zPhdixMZqvm6GWuVuznLptGNjOTmw5IfAc3NRop
	vwvv8KKdwPA32kWKTJb0YNZz+Bx0KwiwJ+i9Gana68ywH4CGBVLyBgFtkJ8g==
X-Received: by 2002:a05:6a00:2d9d:b0:848:67ca:bfd with SMTP id d2e1a72fcca58-84867ca1b16mr4077056b3a.16.1783659939223;
        Thu, 09 Jul 2026 22:05:39 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:05:38 -0700 (PDT)
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
Subject: [PATCH v3 04/27] ASoC: codecs: es8326: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:04:48 +0700
Message-ID: <20260710050511.14439-2-phucduc.bui@gmail.com>
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
 sound/soc/codecs/es8326.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index a79b2da35099..c5460589a88b 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -6,6 +6,7 @@
 // Authors: David Yang <yangxiaohua@everest-semi.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
@@ -790,7 +791,7 @@ static void es8326_jack_button_handler(struct work_struct *work)
 	if (!(es8326->jack->status & SND_JACK_HEADSET)) /* Jack unplugged */
 		return;
 
-	mutex_lock(&es8326->lock);
+	guard(mutex)(&es8326->lock);
 	iface = snd_soc_component_read(comp, ES8326_HPDET_STA);
 	switch (iface) {
 	case 0x93:
@@ -845,7 +846,6 @@ static void es8326_jack_button_handler(struct work_struct *work)
 		}
 		es8326_disable_micbias(es8326->component);
 	}
-	mutex_unlock(&es8326->lock);
 }
 
 static void es8326_jack_detect_handler(struct work_struct *work)
@@ -855,7 +855,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 	struct snd_soc_component *comp = es8326->component;
 	unsigned int iface;
 
-	mutex_lock(&es8326->lock);
+	guard(mutex)(&es8326->lock);
 	iface = snd_soc_component_read(comp, ES8326_HPDET_STA);
 	dev_dbg(comp->dev, "gpio flag %#04x", iface);
 
@@ -873,7 +873,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 		regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE,
 					ES8326_HP_DET_JACK_POL, (es8326->jd_inverted ?
 					~es8326->jack_pol : es8326->jack_pol));
-		goto exit;
+		return;
 	}
 
 	if ((iface & ES8326_HPINSERT_FLAG) == 0) {
@@ -930,7 +930,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 			queue_delayed_work(system_dfl_wq, &es8326->jack_detect_work,
 					msecs_to_jiffies(400));
 			es8326->hp = 1;
-			goto exit;
+			return;
 		}
 		if (es8326->jack->status & SND_JACK_HEADSET) {
 			/* detect button */
@@ -939,7 +939,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 					(ES8326_INT_SRC_PIN9 | ES8326_INT_SRC_BUTTON));
 			es8326_enable_micbias(es8326->component);
 			queue_delayed_work(system_dfl_wq, &es8326->button_press_work, 10);
-			goto exit;
+			return;
 		}
 		if ((iface & ES8326_HPBUTTON_FLAG) == 0x01) {
 			dev_dbg(comp->dev, "Headphone detected\n");
@@ -958,8 +958,6 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 			usleep_range(10000, 15000);
 		}
 	}
-exit:
-	mutex_unlock(&es8326->lock);
 }
 
 static irqreturn_t es8326_irq(int irq, void *dev_id)
@@ -1200,13 +1198,12 @@ static void es8326_enable_jack_detect(struct snd_soc_component *component,
 {
 	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&es8326->lock);
-	if (es8326->jd_inverted)
-		snd_soc_component_update_bits(component, ES8326_HPDET_TYPE,
-					      ES8326_HP_DET_JACK_POL, ~es8326->jack_pol);
-	es8326->jack = jack;
-
-	mutex_unlock(&es8326->lock);
+	scoped_guard(mutex, &es8326->lock) {
+		if (es8326->jd_inverted)
+			snd_soc_component_update_bits(component, ES8326_HPDET_TYPE,
+						      ES8326_HP_DET_JACK_POL, ~es8326->jack_pol);
+		es8326->jack = jack;
+	}
 	es8326_irq(es8326->irq, es8326);
 }
 
@@ -1219,13 +1216,12 @@ static void es8326_disable_jack_detect(struct snd_soc_component *component)
 		return; /* Already disabled (or never enabled) */
 	cancel_delayed_work_sync(&es8326->jack_detect_work);
 
-	mutex_lock(&es8326->lock);
+	guard(mutex)(&es8326->lock);
 	if (es8326->jack->status & SND_JACK_MICROPHONE) {
 		es8326_disable_micbias(component);
 		snd_soc_jack_report(es8326->jack, 0, SND_JACK_HEADSET);
 	}
 	es8326->jack = NULL;
-	mutex_unlock(&es8326->lock);
 }
 
 static int es8326_set_jack(struct snd_soc_component *component,
-- 
2.43.0

