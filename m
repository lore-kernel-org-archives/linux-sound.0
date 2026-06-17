Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F48478869
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692644; cv=none; b=cHYHRzdxXjZXuBZ6Rk+uuxDZ+aYhBSQwqJQDdxx8rFuevkYJzVW4ap68f2O/vzl9tbM66djSWBz6M/1f73bnUPdpnjqWoQPkjSq3KfA13TA9HROUKO4mszmTY61/3xIXo31Eu0p9/no9xwyt+N94xtBIYfLybuLEkRHIK6wEkiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692644; c=relaxed/simple;
	bh=bV0wrsnUSNArsr1QxrKoX10viZPs2daxbLWhpuMFSns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XmsLt/IM+1SfGQvqea7opFEmSKSWKs1zXnYo7Faze9/K95WPCDlAMX10OncIGr8NgxKHiLFgOrZqRl/AVTmX52qX7fg3Q45yYnpSoViYrj0AXwafdNZ0U00Zf3dV72cI/s/XPyoWJVpMyXRlFbyjUNDsgeMWyKPwt9WO9TMCALM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eea3iOUR; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eea3iOUR"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30bb7d20ad9so2337204eec.1
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692637; x=1782297437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RS60dBgVHLJM7xKUP9F+W887F9cI3ycWsKsxpAyWFqA=;
        b=eea3iOURVyf8E+4ARj/UQr7HxQf6cUmpsaDnTTuorf7N5OwqQ8KS8qloR7Uz/vDs6W
         rbFDTPS6ol4LPpvVG4TP2SiyC6+Fl2I0F9c7ozQFEgdW4RnQktdHFjPWK+zevnV/6t4j
         W/AY3r1tKzo4nlt6D6w5RVRkm57OEu0+r9b3KFSLyWT8LuZ5fzFXKfNXBTUHCME1p98l
         C17Qp+m1V1cEF06aUfLxV1ap/IVsdUtLEK9MGPrR+JOJCG4dbsz0rFlIhOWlEGX7Zv9Z
         0nsZ1Ny2/VB2dpeQgCg0khS92VmHqwFeo+vhv4XesuSPlZom4C3D3ydKhOiPtsmCO7DV
         RryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692637; x=1782297437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RS60dBgVHLJM7xKUP9F+W887F9cI3ycWsKsxpAyWFqA=;
        b=KfSKxgV+qGxgOj2RQyWGL5GXZh0MqDuQHL0zMTHHHdOKDEmZgdEZ5AOZj2lNPA9vN2
         N1pQu6oCnRVOfvwU4Atpil+AOBOpXp32DqTLinvjSSMM8qaQtgxCZJrR+yWP00mWAHKl
         9s3quIs6zTRBTm5d6gf1awpU0SNovqnoeOnvD93JwUfY4XWDnyTvj8VYwpMV6Rp6XENY
         PJ2y5kD3OX7r0uWambM3WoigRI5UaQnjjYzZWgSNq0CApV1FRlIxEhYwlyvEont2HpjT
         /iwRa1MKKhcqdzdlXcNb3seYzWKH9/IG+53VlINzjhvt2+G4456G/SgH+mH4mk81fYb1
         bFmQ==
X-Forwarded-Encrypted: i=1; AFNElJ8zwT61PputljMEp0SvrQAf9QwRGHzhTzq48LamKyEStn9dsSHf6KiXBG+ZFaudHqNqRB/C/ScF9uCa+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiNviVqFp/dx8wYR5VMdzzdMwSu9idUBL7SiOcbkm898RLUc4v
	B3+tQBmuRVDVV7f5GF7yK6poAa5Ozp6VtccDO9u5kxiEh1ob0hZzu+uN
X-Gm-Gg: AfdE7clICvKadrsAlXzeuW7ry6KvwwtgLHcYAW674jOv5LCgP3dJusjfGf3E/3deYnN
	drieQwyAFwUZ6C/cnd8S187PSPDQT2Bs4XoRfh4AdYszXHCghEc3jz7vwNaXhhU8I72eBck3Go4
	eFKieP50Qlkfo0tW0ppro09uzQRUnSMioAR5FD8fmeCWt4ZjLoccJtFFpTSstIQTzwG7eaL+WWH
	HQBcsL4gQCyud+Jdo2dTCPOVt4/EE/j0QkGqXzPtHiptbeKuTP3QUSvV20vYnrQwuamClFO/tSU
	Iv3NwP64eVOCJcdQmdPNIy5kZgdhBtO+VeAMuCZvNZ0Z5uC7R4ABAfvWP1/Ej5C0FVYYbaQaG5m
	FEx7TxbAyfEZF8SaebqMffdmA5Be4370FJR7ecQEHnFh4SRhq+KfDGbyEGpTa6ZpDGhwf9zu7rd
	XyAa0uk+PIePtwVla1Udt2qg5doBcglJU8qLwDOcoaMeVtJ9A=
X-Received: by 2002:a05:7300:7481:b0:30b:bf5c:c878 with SMTP id 5a478bee46e88-30bca067e13mr1803295eec.25.1781692637212;
        Wed, 17 Jun 2026 03:37:17 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:37:16 -0700 (PDT)
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
Subject: [PATCH 28/78] ASoC: codecs: es8326: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:45 +0700
Message-ID: <20260617103235.449609-29-phucduc.bui@gmail.com>
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
 sound/soc/codecs/es8326.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index a79b2da35099..4aaae6eab7f2 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -790,7 +790,7 @@ static void es8326_jack_button_handler(struct work_struct *work)
 	if (!(es8326->jack->status & SND_JACK_HEADSET)) /* Jack unplugged */
 		return;
 
-	mutex_lock(&es8326->lock);
+	guard(mutex)(&es8326->lock);
 	iface = snd_soc_component_read(comp, ES8326_HPDET_STA);
 	switch (iface) {
 	case 0x93:
@@ -845,7 +845,6 @@ static void es8326_jack_button_handler(struct work_struct *work)
 		}
 		es8326_disable_micbias(es8326->component);
 	}
-	mutex_unlock(&es8326->lock);
 }
 
 static void es8326_jack_detect_handler(struct work_struct *work)
@@ -855,7 +854,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 	struct snd_soc_component *comp = es8326->component;
 	unsigned int iface;
 
-	mutex_lock(&es8326->lock);
+	guard(mutex)(&es8326->lock);
 	iface = snd_soc_component_read(comp, ES8326_HPDET_STA);
 	dev_dbg(comp->dev, "gpio flag %#04x", iface);
 
@@ -873,7 +872,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 		regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE,
 					ES8326_HP_DET_JACK_POL, (es8326->jd_inverted ?
 					~es8326->jack_pol : es8326->jack_pol));
-		goto exit;
+		return;
 	}
 
 	if ((iface & ES8326_HPINSERT_FLAG) == 0) {
@@ -930,7 +929,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 			queue_delayed_work(system_dfl_wq, &es8326->jack_detect_work,
 					msecs_to_jiffies(400));
 			es8326->hp = 1;
-			goto exit;
+			return;
 		}
 		if (es8326->jack->status & SND_JACK_HEADSET) {
 			/* detect button */
@@ -939,7 +938,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 					(ES8326_INT_SRC_PIN9 | ES8326_INT_SRC_BUTTON));
 			es8326_enable_micbias(es8326->component);
 			queue_delayed_work(system_dfl_wq, &es8326->button_press_work, 10);
-			goto exit;
+			return;
 		}
 		if ((iface & ES8326_HPBUTTON_FLAG) == 0x01) {
 			dev_dbg(comp->dev, "Headphone detected\n");
@@ -958,8 +957,6 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 			usleep_range(10000, 15000);
 		}
 	}
-exit:
-	mutex_unlock(&es8326->lock);
 }
 
 static irqreturn_t es8326_irq(int irq, void *dev_id)
@@ -1200,13 +1197,12 @@ static void es8326_enable_jack_detect(struct snd_soc_component *component,
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
 
@@ -1219,13 +1215,12 @@ static void es8326_disable_jack_detect(struct snd_soc_component *component)
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

