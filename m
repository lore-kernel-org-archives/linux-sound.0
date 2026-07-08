Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FADB44D6BB
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 14:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520376; cv=none; b=P1/NBbmsHSEw2sO1MQoVSL3QheV01LsPT0fFXeJgIxVp0QNEyux8gzQCRdAaJko2VoNlCm5T7tShdlB/Hd1MkYpfqxH2LHG98AS7JGbHeMe4Rp8CtTDRcmJY/5mHekcgi5JzUKFsr4FyD/gCB38yYe8VHP67ufoPIb6ExctK3Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520376; c=relaxed/simple;
	bh=Nw9I/srswcYHcD3WiPHI5wa7OL9sfHmNK5DnVVQpY1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IwPZKplYd2dUhYkEparLHS4b2ReGX0DlSc+3I0p79TD37W9w8OCDgvY+GJQ8iucvq7gWhVj1Zwn+E/HtJUkziN1HGrun6dXni6sM597yCrs1OavmcerY2yxyq6BQ6RY3M6txMDX3Q1xCpn4HyN+0RVTdmznQKfObwJ7eec5F5lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UKHD5lRu; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UKHD5lRu"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c7cfa17fedso8122185ad.3
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 07:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520375; x=1784125175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=glNXCWo3feUPJNoiqEbeBkuoiMlb+JtOjIAbpp+cCDQ=;
        b=UKHD5lRucofxCJnuSido8gOdpgOvcmQ/ZkzWQJNU/yO6QQnYqEOVpEbcSXHWjsyFEa
         6O2s9WTbtEhIlyi+wK4IPsGI4ZuplELycXy9LY/0Npoqzx1lyb46XkecUFbF5PLhs/ej
         /u6nM/x6PWA2QPcjkVP3+nkhV4jEJbhMuVf/ZM0AXnEloS45p15NtkKlpHE/uh+qhSAz
         XM57onoJ3Gy5iZBHjHmNUVnq4YjKP3UNohSqnhT5Q3lYFc/2lMYTJkLaaR4juDaWkUHV
         YzHmIc2TeE20B/dXeBRPIZWFJWf7ihP7v8DlXlgU51SbYtYg2DLjARA8RGMH0bu41tq9
         Br/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520375; x=1784125175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=glNXCWo3feUPJNoiqEbeBkuoiMlb+JtOjIAbpp+cCDQ=;
        b=bsBHEPFWOjKrbla3AToRhMzoDOm/9k6JKz1iLDCa3Nx7YkGjT75do17DyUzUOS4/4c
         7gZG8oozcfvOicJeMtMyii6LL5Oq7vgX+yMTB7WG5nrMmm2Yls/G0xLp1bPfWbyr+kjp
         drVuuqH6IN4amg+ElpKR862EK1MGt3trpXEsq5qlVQIXiOAFjcsLdHQ3Lvhegny2ie0c
         zuDjBiT5aSvUvxMqTQYdqo9bYDYqTkbU7jxbIHmq47WJu2BDl0VXhyPNLkqAXJsPiFs5
         EEgHMmXr6bq6Wdjer21SqcZ6GAcj+MjHS6Bcg5chboM47qXHToWdNt3sCN37oCB10etL
         o2cQ==
X-Forwarded-Encrypted: i=1; AHgh+RpUFEwoHFoPVyN82aVMPUSxMYNZpQCRmXdKYvj5M20bK6YfvJSHGRIO+cS2v+PdYS6gu4iKSA2Tvp6zjA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy91bwZre+CwkP0slIXEsFZNIGKu/N3ZvcUFw18cu8gGdEyG8g8
	NiDBt1irARedPWnxfUQ+v5nSLnOCxWEjfrkArqcSSke0e27e8Q3o1vY/
X-Gm-Gg: AfdE7cnQG+A6jBLfU1fVhzufKaZnWBJLc316/SiAVySZk9dHvJYHWIQnESd/i5TsK9I
	TZx+M0rJ/DosZ5BVW8UHSOmMRVjLF+1sT8JtUwo8B//mjlbfalOZwG21NrHpVr+11Y0/267vIU/
	4gTLADtoEQbhu3KyDLncPM9SPklTFSE/q26NP4s/uE6Z36eKj+mU/ta68OX97XaN4S/dVwNh7tI
	rywAQueJ6ThM9difZKFC6AJzrNz9FQ1eyElXYUTVK+Z1Xqd02qCCcUIVdCwH43Qk50EZOd+UboT
	tMEnsKRc7CPiQmmAViNqUS1j/C7NO4I4cV8oxIg91TjKJp1nScIeXY+73CneiWqDqRekYh+cyrw
	dt+YiiwVtjEJ7KSHEHSkbhsoU3WfdADbUtSOJREodMdJUjChcE2lSJPiuNMJIsJwsDZBkHX4P1a
	TIQ/H4cx/YUvS1zUP7DtNgvxLrBcbLYF1Mi6e5mNeQOf+6hI4=
X-Received: by 2002:a17:902:fdb0:b0:2ca:c84b:c4a4 with SMTP id d9443c01a7336-2ccea37bde9mr27502985ad.28.1783520374943;
        Wed, 08 Jul 2026 07:19:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:19:34 -0700 (PDT)
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
Subject: [PATCH v2 04/27] ASoC: codecs: es8326: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:11 +0700
Message-ID: <20260708141734.578926-5-phucduc.bui@gmail.com>
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

