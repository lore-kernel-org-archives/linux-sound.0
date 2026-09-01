Received: from r3-129.sinamail.sina.com.cn (r3-129.sinamail.sina.com.cn [202.108.3.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CA018C332
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 10:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788260124; cv=none; b=fJjSL17S1cj5u3gV/fZtVqYULR5ugrs8pf6egOQatmczbrBBZ+YQtVqa2rxYr+k9FmcwB1GwXSbSAcUyyPPZ8eSLmcNITjWPXS78JIz7V4RrhzOcmRuyhA7r7uc+VnFOl+KB5QlrCseTLAXVvA98Vz+rckKL+HZVpitwR28dulk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788260124; c=relaxed/simple;
	bh=2rvvDvJ0R3KRV2PGZ5FMwpPag9Imj2m0gWsH04o8E6g=;
	h=From:To:Cc:Subject:Date:Message-Id; b=NQKHb18z+0w8u4NIeSj8z0Z6eeI54QLJa306/XGD1BiLe9wQm9fHAuLRSX3dWE9JfNwBJwLmKg9+FIS+/JzJiQ4nbh/e8bHJVIx6/DMbrPw9YcMEZ4DCLI9QhCXeSnA7qnGZo/bqKInZPPdRnnfPH2gnqU1WP8SJW2llvupR6WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.36) with ESMTP
	id 6A96ADCE00003A9A; Tue, 1 Sep 2026 18:49:50 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: B8E60D78A0B245D0B1A32B4274860B9C
X-SMAIL-UIID: B8E60D78A0B245D0B1A32B4274860B9C-20260901-184950
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: broonie@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [RFC PATCH] ASoC: codecs: ES8326: issue about capture pop
Date: Tue,  1 Sep 2026 18:49:46 +0800
Message-Id: <20260901104946.20114-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

This RFC asks how to resolve the 'capture pop noise' issue.
The ES8326's capture pop noise occurs when LRCK is active.
While the pop noise can be effectively reduced through codec configuration,
it cannot be completely eliminated.
So I decided to create a workqueue. unmute the ADC once the LRCK becomes active.

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8326.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index c5460589a..b6eadc2e9 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -26,6 +26,7 @@ struct es8326_priv {
 	struct snd_soc_component *component;
 	struct delayed_work jack_detect_work;
 	struct delayed_work button_press_work;
+	struct delayed_work capture_pop_work;
 	struct snd_soc_jack *jack;
 	int irq;
 	/* The lock protects the situation that an irq is generated
@@ -628,6 +629,7 @@ static int es8326_mute(struct snd_soc_dai *dai, int mute, int direction)
 			regmap_update_bits(es8326->regmap, ES8326_HP_DRIVER_REF,
 					0x30, 0x00);
 		} else {
+			cancel_delayed_work_sync(&es8326->capture_pop_work);
 			regmap_update_bits(es8326->regmap,  ES8326_ADC_MUTE,
 					0x0F, 0x0F);
 			if (es8326->version > ES8326_VERSION_B) {
@@ -666,8 +668,9 @@ static int es8326_mute(struct snd_soc_dai *dai, int mute, int direction)
 				regmap_update_bits(es8326->regmap, ES8326_ANA_MICBIAS, 0x70, 0x70);
 				regmap_update_bits(es8326->regmap, ES8326_VMIDSEL, 0x40, 0x00);
 			}
-			regmap_update_bits(es8326->regmap,  ES8326_ADC_MUTE,
-					0x0F, 0x00);
+
+			queue_delayed_work(system_dfl_wq, &es8326->capture_pop_work,
+				   msecs_to_jiffies(40));
 		}
 	}
 	return 0;
@@ -773,6 +776,15 @@ static void es8326_disable_micbias(struct snd_soc_component *component)
 	snd_soc_dapm_mutex_unlock(dapm);
 }
 
+static void es8326_capture_pop_handler(struct work_struct *work)
+{
+	struct es8326_priv *es8326 =
+		container_of(work, struct es8326_priv, capture_pop_work.work);
+
+	regmap_update_bits(es8326->regmap,  ES8326_ADC_MUTE,
+					0x0F, 0x00);
+}
+
 /*
  *	For button detection, set the following in soundcard
  *	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
@@ -1140,6 +1152,7 @@ static int es8326_suspend(struct snd_soc_component *component)
 	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
 
 	cancel_delayed_work_sync(&es8326->jack_detect_work);
+	cancel_delayed_work_sync(&es8326->capture_pop_work);
 	es8326_disable_micbias(component);
 	es8326->calibrated = false;
 	regmap_write(es8326->regmap, ES8326_CLK_MUX, 0x2d);
@@ -1291,6 +1304,8 @@ static int es8326_i2c_probe(struct i2c_client *i2c)
 			  es8326_jack_detect_handler);
 	INIT_DELAYED_WORK(&es8326->button_press_work,
 			  es8326_jack_button_handler);
+	INIT_DELAYED_WORK(&es8326->capture_pop_work,
+			  es8326_capture_pop_handler);
 	/* ES8316 is level-based while ES8326 is edge-based */
 	ret = devm_request_threaded_irq(&i2c->dev, es8326->irq, NULL, es8326_irq,
 					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
-- 
2.17.1

