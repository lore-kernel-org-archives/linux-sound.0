Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A764346E51
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 03:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467595; cv=none; b=QrBci9lIQu5U5et88ZcX3c7ucfOxBpKVSvFTCMPPou4jmn3K4euLcQSWG0cu0YhoB9vqamV+ZKe9yGAAnuazvnEiX/wVLd8j9k7NcBwfp7FLu0RHudPGFSBQPV80OIOO0j6BJd5JB9pa3FHhgU7Tz1P/N/kifIYFQvF0W/v7uQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467595; c=relaxed/simple;
	bh=Ds1oSBp7qIaR/cxOtW8lrLLJ5mM1JWB+K+07h+UG/zI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m7saunQFKIZkqk4jdVdmKKfqcoCiB2QkW72ynbiIwZ5mljsO+tj06ump6JXsr1gb+11TN09mIHQY3C2yOlLOKcSiI4WPrqBLkvTgT+GR5kjyaLL/ajCh/7gQxH1+1a7gxpEJz+kNEb/mE+Jldvj5sFi/pmW8y2S++zzx6Z5xm30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PXBLurNN; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PXBLurNN"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cfff5f88dbso5051895ad.3
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 20:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467594; x=1786072394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/lM2ofDG/902k+KDKV+BqCZHBuk3CZZsCrVHXaT0OY0=;
        b=PXBLurNNPAaIiWy1b8cQSMQGMa2BGmbDCa09C2gTrJnAOUy5u19zCGw0vuLDd3Fp0X
         KKvJweK6uZ8P259g1IHLUd2j94SIsGMIx90JrMo2K07lzQh9kcLL8wYYQSLT9HprH3Gm
         i2SbVOjgH31w62/+4ZWn8Ybe8wOATePvObn/GNrqn0wqExWsAPXBNogDQ5gl8b/e6u45
         slRAojYfzM8QDi6huJSVNITRHb39/D26CQPgYL16fMkwRFiksrDVvciuRyJzzeNQElxb
         s2+jXZGvgXvEsZFbBXh7Cz6fGbYhrXUO4vgPNa8C661NQg+NdJMqqRHeAl+Bx96JBqMS
         mrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467594; x=1786072394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/lM2ofDG/902k+KDKV+BqCZHBuk3CZZsCrVHXaT0OY0=;
        b=Ft6/fLT3EstONqM3cWjCVcKvDtRIFw6Q3daDx/K+3iKxhloqaHe3ZsInhajboTCBrE
         R/k6HoovaFKFz7znPMrzUuxsl6WnFpUJhH6dPeE7ppLihe5Yv/054hiGrohl6cvSoIOR
         nO8wI1xKuevJ4eDaHUQj1vpndomlFm2UpRmdYSC0NFojNXhsC07rdn4+Hv6kET8yDIrc
         eoue58RIWe7wyakmpkOXddWAREBVLbZam47Dqpot6pp73Eg30mRke7G5LROsbCGYcOJZ
         AQ7S7x1iH2l8peqBjDByoUF/1PCj5tkEHTpB1bD42H74Us2p+BzC8FMrwZnl8Je9d2Ww
         blOA==
X-Forwarded-Encrypted: i=1; AHgh+RoGhQ8cz71MuMkfpCD4ChbJ+YuasulNfWJXsIEsTjK/Wm1EL/4yFvzLlS0Z1qsrAvZYrKPCelOK8+peRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuQbbQJnDPRyN0zjO3Skci8eJYydLcMQq/zXhAyHKZi8OuuEux
	WHRrpb5Qu1I2obtXIJCfByG/XHVeXgErn1bowv6kVsW/59UYHPgYwOWD
X-Gm-Gg: AR+sD10zTYUr67qSlYofGhgOVl5QBLqW9er9TJx7RnkxhZ3NcIZQPK/vMXvgJ7qlatu
	tX6rxoSlsNd0+15oekSKDlbW6xTvrcJcRSTYDsYJdsnTDAi1W1B/U0E1o9IxtQ50CXSraWO4YLa
	vXo1GHrg+nHyH6Vpu5WOv/7bZXLgDWhR4wsLBRXzmemTAqIvFpbIxAk8TA4/wY5WXtPyWtRb0L4
	RU2paXVbZx5orIGHKMCNTGp2yNjRpKXeOrzv/GdYFCq7TR1GIbULYJh7CFi7XsGBxQCpKJ+xubZ
	ObZKUSgqA4IzTVeMzj5IFmdQRUn5YaJY+aCOmA5OoUY+E0qc+5cQHDaq3Vyl3Zdbg3pbKdAMMhl
	QE/oZLaGNmwlelb2G27hysDKdo4mDZ6U7A09UM2sYnjnR3EU1m8qVom5dkLn8lA8ManiRdw4dSk
	wmr7Qmu92fe1RGiU20rqt1kCQ1DGkRk2h3Tst4dBXAtihBSuYSc0S+x/aXsjpyPfEbhYpWHOIgc
	Yquc5EGpyraqFVZnpCXLzyUTjTpX0j2EZudor00RDJlHFS9Y98Nazwe3EDNfcGgEn957rRe3xU6
	6Ra6
X-Received: by 2002:a17:903:3c4e:b0:2ca:ed41:d33d with SMTP id d9443c01a7336-2d046ec35b5mr4341835ad.45.1785467593679;
        Thu, 30 Jul 2026 20:13:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047ae9f31sm737595ad.60.2026.07.30.20.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:13:12 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	u.kleine-koenig@baylibre.com,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Kees Cook <kees@kernel.org>,
	Chen Ni <nichen@iscas.ac.cn>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 23/26] ASoC: codecs: wm8994: Use guard() for mutex locks
Date: Fri, 31 Jul 2026 10:06:45 +0700
Message-ID: <20260731030648.8706-24-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731030648.8706-1-phucduc.bui@gmail.com>
References: <20260731030648.8706-1-phucduc.bui@gmail.com>
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

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wm8994.c | 30 ++++++++----------------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index 1d64c7c42ed1..8bf58a6a8af7 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -7,6 +7,7 @@
  * Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -766,7 +767,7 @@ static void active_reference(struct snd_soc_component *component)
 {
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&wm8994->accdet_lock);
+	guard(mutex)(&wm8994->accdet_lock);
 
 	wm8994->active_refcount++;
 
@@ -775,8 +776,6 @@ static void active_reference(struct snd_soc_component *component)
 
 	/* If we're using jack detection go into audio mode */
 	wm1811_jackdet_set_mode(component, WM1811_JACKDET_MODE_AUDIO);
-
-	mutex_unlock(&wm8994->accdet_lock);
 }
 
 static void active_dereference(struct snd_soc_component *component)
@@ -784,7 +783,7 @@ static void active_dereference(struct snd_soc_component *component)
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 	u16 mode;
 
-	mutex_lock(&wm8994->accdet_lock);
+	guard(mutex)(&wm8994->accdet_lock);
 
 	wm8994->active_refcount--;
 
@@ -800,8 +799,6 @@ static void active_dereference(struct snd_soc_component *component)
 
 		wm1811_jackdet_set_mode(component, mode);
 	}
-
-	mutex_unlock(&wm8994->accdet_lock);
 }
 
 static int clk_sys_event(struct snd_soc_dapm_widget *w,
@@ -3704,7 +3701,7 @@ static void wm8958_open_circuit_work(struct work_struct *work)
 						  open_circuit_work.work);
 	struct device *dev = wm8994->wm8994->dev;
 
-	mutex_lock(&wm8994->accdet_lock);
+	guard(mutex)(&wm8994->accdet_lock);
 
 	wm1811_micd_stop(wm8994->hubs.component);
 
@@ -3718,8 +3715,6 @@ static void wm8958_open_circuit_work(struct work_struct *work)
 	snd_soc_jack_report(wm8994->micdet[0].jack, 0,
 			    wm8994->btn_mask |
 			    SND_JACK_HEADSET);
-
-	mutex_unlock(&wm8994->accdet_lock);
 }
 
 static void wm8958_mic_id(void *data, u16 status)
@@ -3777,7 +3772,7 @@ static void wm1811_mic_work(struct work_struct *work)
 	struct snd_soc_component *component = wm8994->hubs.component;
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
-	pm_runtime_get_sync(component->dev);
+	guard(pm_runtime_active)(component->dev);
 
 	/* If required for an external cap force MICBIAS on */
 	if (control->pdata.jd_ext_cap) {
@@ -3785,7 +3780,7 @@ static void wm1811_mic_work(struct work_struct *work)
 		snd_soc_dapm_sync(dapm);
 	}
 
-	mutex_lock(&wm8994->accdet_lock);
+	guard(mutex)(&wm8994->accdet_lock);
 
 	dev_dbg(component->dev, "Starting mic detection\n");
 
@@ -3803,10 +3798,6 @@ static void wm1811_mic_work(struct work_struct *work)
 		snd_soc_component_update_bits(component, WM8958_MIC_DETECT_1,
 				    WM8958_MICD_ENA, WM8958_MICD_ENA);
 	}
-
-	mutex_unlock(&wm8994->accdet_lock);
-
-	pm_runtime_put(component->dev);
 }
 
 static irqreturn_t wm1811_jackdet_irq(int irq, void *data)
@@ -4026,15 +4017,10 @@ static void wm8958_mic_work(struct work_struct *work)
 						  mic_complete_work.work);
 	struct snd_soc_component *component = wm8994->hubs.component;
 
-	pm_runtime_get_sync(component->dev);
-
-	mutex_lock(&wm8994->accdet_lock);
+	guard(pm_runtime_active)(component->dev);
+	guard(mutex)(&wm8994->accdet_lock);
 
 	wm8994->mic_id_cb(wm8994->mic_id_cb_data, wm8994->mic_status);
-
-	mutex_unlock(&wm8994->accdet_lock);
-
-	pm_runtime_put(component->dev);
 }
 
 static irqreturn_t wm8958_mic_irq(int irq, void *data)
-- 
2.43.0

