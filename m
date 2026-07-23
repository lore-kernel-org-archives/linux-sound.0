Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23843B637F
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 04:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782613; cv=none; b=l6gjmevdBpvlTeEBsXbybh+96LfZF4/YUIGFc2+QB6v4k4yVKTTxOSZ2YxtIBaJFk7lbRCvFaCTwMUgTRlNay9JtgGR66FhUrjUrTybtPmhgpWLRd19Vp5kDnkwYkTQztgzCg/aNl8qwLz1P4wLoFeeilXX42zwlQXZTWTEi3Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782613; c=relaxed/simple;
	bh=KqAC5CfghReh2XEUZdCyPHf/60ZDneJJTZawuY4RN3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rlxchNoyzoyXVsrFeTgdMwp7aGyKhnnONgEmKeUrrXLT3bEFOX33tmg43qUbK6E3it+8Pju/PEFO6QyuJw0JQbcsE9fFzDuGm5VZ2aEWmTJZXH3G1IqDBjYCeK6y8aHjV96+FrwANJ12NuTCDAkFHx14m5WyaCjPS8Z1h3RFeko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NbS4WJkI; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NbS4WJkI"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cf50c6f235so3504485ad.0
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 21:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784782598; x=1785387398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zejrRaxeptAqKq1X1ixMpC63mc2lZ8YAiu3QcPsJINs=;
        b=NbS4WJkIdKvz0N+EbcEVlb+x1jE+nAsVZWStm283msySmAfEEG+RRhA24rp777Gpa8
         R0G80h/rCHzA/bHItQP8q7JN3dG3s4tZ5DXQp5PDpf7bQjjbTSH4P+na4igt87mzaMVA
         Wu+GixMiiQzP5rB0QcZG7IgqxJ2cRJgFfhZZX+C4DnHmsR/InxdPGEIoiPiZR+M+GWPp
         Z2MnRFCYzJNuekokcMHXZ79HrJyWZeMFvUZLmeUw9TUFz6u3Hjp7RmqyCygpVEjc40Wh
         BZV5g+tpbAn0tVU3DEQioq75XHb8AuceguWb2EMI+p/S6Fwj2lsIqlffgPKXzXJx3rR8
         U2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784782598; x=1785387398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zejrRaxeptAqKq1X1ixMpC63mc2lZ8YAiu3QcPsJINs=;
        b=FHMA9kc5G8RR0mZun62v00AKidP+XRL/pRBPpk2PKjqJenhuS0/HhFB8AswXToOJCL
         Fc9rz51CLC6oh+kAkjbXtsJ1os9/N5gVpMfPSdqY27u7fxvInC6BILap0UgkVClTIYl7
         PEnl2adPoo9kRqqx9a4BBxr2l1YpMbT8gVM0SjNfJ69kScC+xkwQfk588XNBU6u2qlBJ
         WqloQHg19P05dtugmfmByeZe2yxbl6Z6Snz0/DsUFM4zxfip/FoockR35rM+k+EfDTvE
         0Z4qv0dkHS5MszbHuPs9HQ2nb8rpmTtks0+qz8QU4m7BpZncizI6waBSmZIBEuizZkl2
         Xb0Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro4siFMgL3JJnBh8zUGRBv4XcUKr7epcJIBar1LbnBZHq9IYmFs7J4ty3dsFtccqpOP5GhpqkLdrnlKBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPMtKJy4MynfJJYf4AZkEkVGM6T1nEaAJlcp5jpc7gkmL3C8pW
	q22hl27tCLO5ed+H8wuQ0I6RjoWLRXw6E/1uDkVY71z/CQo7/FwH0KBmd4JqWw==
X-Gm-Gg: AR+sD12NfXftxm6XFBqPtSgY3oFcLRZGL8+bmN6TozLAwT6V1RTre77LDxTbVtqEobe
	FCWALfmRmt8jSPdWVjuXiWMD9WBNVJIuAD+josGb1GlMGQYt0t1SHQlpGWGh+KOQcejDzDqGK32
	pvMvMOMIR2LLa6YRabl55FRUqK+mB6C3LC/bPyfg6oUi9ZndC0R1Mp9hfY7hv8ypPqn4WKsVWlP
	fwMSobDg19tW9xyOA0NUNHDoylsF5R+4HVYWaBce/9hE3zAMplWvlDyyeFX9c4g3cUERWN4+rqP
	iI1Qj4E6sPyj+1OGZGBNTMTeDLYzfSsNVMZDesc1SOfA/FYvYLdnHrqP5uoNvlikToanlb2KKp1
	wa6GkNPoNAjFhmOsuNmHt4445yxHh/bvOZrn7/Z2JAFIpGKTKgZz01IdFk3QE+NcBTjBBVx8RsA
	3vfShtZGlCWbdb7yok7ASvzbTbK3BUg3GUj9Pm
X-Received: by 2002:a17:903:ac4:b0:2ca:2753:f3cc with SMTP id d9443c01a7336-2cfa7506cdemr20165945ad.33.1784782598017;
        Wed, 22 Jul 2026 21:56:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfa57542e0sm7258365ad.67.2026.07.22.21.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:56:37 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>
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
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 23/26] ASoC: codecs: wm8994: Use guard() for mutex locks
Date: Thu, 23 Jul 2026 11:53:24 +0700
Message-ID: <20260723045327.28260-24-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723045327.28260-1-phucduc.bui@gmail.com>
References: <20260723045327.28260-1-phucduc.bui@gmail.com>
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

