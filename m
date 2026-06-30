Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1E23CF217
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 06:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801341; cv=none; b=kB/Y6VylIbRYgQkWi/pPW7F+wF10F9f6t3UxMgsexGQVQpiiXWsmvngCSLtvUcLECyo/dUEEE6uWKUDCtJTxs6j52b6pPdMeZP5MemO0sOs0ct1J3VIEv9rQZ0gB8/B3/9QYQs89T9l3rRQxa9yLkN7Sx1anlEsC7+agrtbcfZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801341; c=relaxed/simple;
	bh=Nw9I/srswcYHcD3WiPHI5wa7OL9sfHmNK5DnVVQpY1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iankCt9jdN1CnNLTMQ+eeZ3HO6Tuo58ib85XVKKwScXH0Hm3Oom1xW05Z72CDNjFtNpRsv2Rg6k2X4ABk+O0MK745TyzeNSfm6KyMXO9MZ0CTiVo/qVSB4L562cv6dY5BlnhlZ4LMQC8HCUma77KJ0YcwZetjof5vZbHSdAw1bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eaV5O4Aq; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eaV5O4Aq"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-845ea8924a2so958414b3a.1
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 23:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801337; x=1783406137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glNXCWo3feUPJNoiqEbeBkuoiMlb+JtOjIAbpp+cCDQ=;
        b=eaV5O4AqRTJFiHrwuQ7Tj/Izk37nnPCesEz2mQ38l3Pu2+lkX1MWo+YGaDyve9UXxK
         6y5l8ep2E/zPfFIK0EVfU20tlsFN2jSskHjUJNGbVO8193Ale3MNbfPDcQWo2Fp74VZ8
         Ek4jZI3vZnTcmgXh90hR1N2n2/pvs13T4hipqSnYYZ0TMuQGcEN2sM1TmWLHb353HJ4K
         C8TgJYpYyFntEJvf6nChSqSZ90umiUPH04v9RUZ9VdgumeuLkq8y9A/BCTMx2ZBGBHNS
         LwRqnyhupTSzCczVxTF3SMuKTi44H3N1GLQ7w5J9O8ZoN3fW97pidTB5e7KScia/CT2B
         XBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801337; x=1783406137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=glNXCWo3feUPJNoiqEbeBkuoiMlb+JtOjIAbpp+cCDQ=;
        b=eqna82Jrv5XhGDsRuqOdr63Oo7nsIyha1ukbtx+4D7ydNX8saU1PiRcRrHQNK7rGkQ
         xErXfwgZWQ53gSTqWK2gkUlC7Q7PIAihE1f4U9hg4VSVxGN8uAXS0V7QVipGvi1qMESR
         2wLF7IwvKzYfi5BCBWC+ka+QvOVlXwTSPoIF0nn3X7T+VLjpOfT5eaQv3075KHo+pOf6
         mPYk0Kke225O4EEWBdmZ5pACgVGRApl1dFxHdOw3C0A81FU/WPtNTtSMrHYjty7NiGh6
         4nSqCzLw5rm3QNu4vXQj2KM0eRHzt0tdZAyqvH0W4dySKteu245ezV87dZTnoCyc8IRJ
         0lUQ==
X-Forwarded-Encrypted: i=1; AHgh+RoUR03UtT0eETSTVUVrYnQnAmeX+uLDe1SuPKYXj63ExKoyLk4JhyHhkuKZPV6H8HLwIaw3ghYFSi27rg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb3fPDhBu03VjP1TVzsndiEp0yZuJw/bOCHAQ0LDZ0floWfpg1
	rQEXm0UcxJYz8YEkwKr5eP5JtM4Brs+aMbVNsRTh6PgxKe76WZcM69Y5
X-Gm-Gg: AfdE7ckxZFEfjfT53QBvJOu8mB2dBDezv4zYaTKrF+O3NwbWqkGBO/ungFBSq06PqYS
	aDQmC00QEPEg1mK6Yjm0moQVRUBpXwTuPGXDwE77JnkfQsqtdUCVgnylrVxgr4QREQZ0EOOUhsX
	efJOz38y/qkEsPos44Ma0/jCq7FfsiFtACNVqkcU+eeXfaeCiF3KFvEqqpdcGBnArusNVJ3WRT7
	aTrpiHiisRMran3tFBjsdDgFy6VvA9basyuxy9iDgG/gxslR3d9IAn4+OHTjJN3GUYypZ/ICO5w
	UMDY2M42EaHuJji3vqjtBOLjzM0CNCLKzwryxa41/tvISLc7DDi0Upu0OLnFLdUCIdVrCNDIlHE
	dMHT7DyIOsxMU2vHl9qkxwcDV4akOMNUmLyL/QNXp2T3d5ONpBoAHFBrHWEBuLjuLLNcdvvRASG
	XSw3ruCaTMJk3Dre16iA4/jMC5hENNImq6DhP7zZut99oGYNw=
X-Received: by 2002:a05:6a00:1894:b0:847:888f:9b16 with SMTP id d2e1a72fcca58-8479eed1d62mr2006682b3a.18.1782801337316;
        Mon, 29 Jun 2026 23:35:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:35:37 -0700 (PDT)
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
Subject: [PATCH 04/27] ASoC: codecs: es8326: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:26 +0700
Message-ID: <20260630063449.503996-5-phucduc.bui@gmail.com>
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

