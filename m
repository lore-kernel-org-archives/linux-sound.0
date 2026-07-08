Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBF548C8A1
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 14:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520369; cv=none; b=ZOmrU8kILTsq3FCiBz+SACtzaT+57cnuQAhasM4DI9LEkqfyDNybdjVdHmijWahY6SoLqLgOPDH0q2EPsi+vSbD3S3zkK8TqoqE38yGZk6LncqDchLl15TxpNzai/TioO2EFBVB+Ec8P4Odaqjx6dpJxgj+6rXJAzyZ33oIJ1x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520369; c=relaxed/simple;
	bh=vGG3xbNRD9aTcWhmHrqO23PJ1N/lJS4R0ZsiliefWlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EnOhapmCCMQIp2/qd/Eo5Tv6j5oRbtHiYD1DGuUBSkLIG3MBBHQHHC2QL75lZkhzsqd6SeHqcEW6djNBx+VE7y31ric06jbuUxarZnd0yHM4yRKH3JGU3w4RYohIFJnUHv48mNnGJQpf611mhqyuI10iv72h/eazOOK6RDXkmRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RHnIz9ik; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHnIz9ik"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cace91f112so8237255ad.0
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 07:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520367; x=1784125167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RozeYceB4iwycNfbGDK46tH90J5JBru51kfxpqOiyNk=;
        b=RHnIz9ikvYpo7/5m3Lv/wD+hLKgADmCSXXATNl/tXz7CK/OfN84PViBiesv4tV3GkK
         Bvd8/m4VotMI1kZ9PR/HQZscBmNBb92y0arzgyJxOjOxGkx2Xux2UN5T8RYINsppp0u8
         FqfFhF84k4VhLfISjtvyzlucP3C4eVtznDWk6x4wlY03evVIyzqu1/QY//z+7+uYB0nS
         iC7Z1ONqDWfPSLXYS0bMCMneEgqzddSGkuqUN9mnja0QRnmkxRojCuvymisfbTHV7r2M
         kr9ZXvB+ubHKh9oHO85bekN3iKvE9SAGtHzzZowQwMfbf0jblou20LWut+eLq/PVZ+Yk
         azeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520367; x=1784125167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RozeYceB4iwycNfbGDK46tH90J5JBru51kfxpqOiyNk=;
        b=sadea6+GwH9V6N04xOCz4gvwm7m6JeSU4FBu+GJYlW762H5X2NvgEYFaysTzpVfxxz
         mXeby/WlZKjC9XakVLPXk6JOZZDhFSg3aIO76w5iV1tvgmZIAbzXRJbHY5zuqh81Etfd
         Q3LNaj3j9s6qRr2OqLOicg8qMjUEDgs/H4CH2SBLlu0h2mIolcmoBp/JEaqdTcAXt1TQ
         rK6HDM7Cz0F0UBX/yHYLzwDuMmTDYg0kp24arC28FXNgzBjfbEU+Mxtef9lnmy7N9/4E
         s8rpom+ZR79rTi83hxsggt1eRZacFDBRRZ+5C1HHwI9ZmitdVVaKBNSDeMA+ySW7mUrm
         UTfQ==
X-Forwarded-Encrypted: i=1; AHgh+RrX6l3UDmXaFP039gykRusPDIHMJnb/VqM57KyKYutmwVPZDHKQMthahfzVFesv7W4h2Dal7H3hyupKeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLNDyseMfOBtk6unOZzQPgvangkeqzgWt57TuriA9/rKBcRA3r
	wekvSiqaWsGGX9laiV/HEDAn1DuWMdFVH7JOF/gwKOZt66fzycrZAAm2
X-Gm-Gg: AfdE7cmh2G1YH/O7ev4fvnIeUNsy/3wTCIlw0+k7Ktn49V2bv6Rc8hJ32OeOVFYQ05v
	Iebfb8rOOR1nUjEY/e4jQFYWZGrc+1uwHj9IDosiiUa4ue7CftcXJE3aM7XNB7twvlwHJ9WZ4so
	Stve4KzpKT9ril3CuMsF5Ds8v7dtMg7cfzeiX9MjL9rKjXzN/4QNBb4RxOw0yNFmOSrHLQMQrVf
	RTRRlLKXvq6h7Bkd/lNw/le4vqfOscSfw71Xm263o/J4EXRmJJL2nHFfV7wQiWt+F2oZo8Mgh3v
	wTEIuSjB+3h2Qt/uSSkBdd8gZKZYZAC3Fw/cQlMuLlQdtEGeJcNHW+eQBW6spifnWPIeo+xpZcm
	vEuG63FbeP8mTOoynnAtsXPNT/mTLtLXx73cm3Fxby/OOdWWXq1Hv2rrjjngTd2qsDTnQ2EDTQh
	yUhp7ANPi8WJyPx8zsd5illk5+vN50tnGUV5ZQfNa3RZEndZ4=
X-Received: by 2002:a17:903:2984:b0:2cb:ea0b:9164 with SMTP id d9443c01a7336-2ccea3849d2mr28129135ad.6.1783520367125;
        Wed, 08 Jul 2026 07:19:27 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:19:26 -0700 (PDT)
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
Subject: [PATCH v2 03/27] ASoC: codecs: es8316: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:10 +0700
Message-ID: <20260708141734.578926-4-phucduc.bui@gmail.com>
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
 sound/soc/codecs/es8316.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 6a428387e496..e83dab0b7083 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -9,6 +9,7 @@
 
 #include <linux/module.h>
 #include <linux/acpi.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
@@ -621,15 +622,15 @@ static irqreturn_t es8316_irq(int irq, void *data)
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
@@ -682,8 +683,6 @@ static irqreturn_t es8316_irq(int irq, void *data)
 		}
 	}
 
-out:
-	mutex_unlock(&es8316->lock);
 	return IRQ_HANDLED;
 }
 
@@ -700,18 +699,16 @@ static void es8316_enable_jack_detect(struct snd_soc_component *component,
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
@@ -727,7 +724,7 @@ static void es8316_disable_jack_detect(struct snd_soc_component *component)
 
 	disable_irq(es8316->irq);
 
-	mutex_lock(&es8316->lock);
+	guard(mutex)(&es8316->lock);
 
 	snd_soc_component_update_bits(component, ES8316_GPIO_DEBOUNCE,
 				      ES8316_GPIO_ENABLE_INTERRUPT, 0);
@@ -738,8 +735,6 @@ static void es8316_disable_jack_detect(struct snd_soc_component *component)
 	}
 
 	es8316->jack = NULL;
-
-	mutex_unlock(&es8316->lock);
 }
 
 static int es8316_set_jack(struct snd_soc_component *component,
-- 
2.43.0

