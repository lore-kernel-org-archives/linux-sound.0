Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97AE3F4827
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 09:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145505; cv=none; b=URFPMKBjtCrNliqNMnJng1ezGXDPdNqJ3gQO6PneGfDKi5rOSA3qsKqNpW5CtAB+Udb+X1KZ6iE0WGVvO6paZxLtHG6xzyL2VRzEyHEI9BncBFJ/ikFJuZ9tcBDqCq7BlUJZ47hnYaIEg5+jXI5N1VzAO4ll+i074QtkHeqf2Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145505; c=relaxed/simple;
	bh=/Cg4xVpRL6w4laCrsJcDF+LErdrINGO0pMAAEIAje/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EYkKzIyZdx+ppFCAz2Tb5sdR0JtgYxqn70kqoAqSAORchpDIUSmI1xmXpr4oZzRRsMXvnff/XO7j3i6Cs7TmK3fuhQClWE4+DghmkQp/J8YhMa8Jhlja+Vhyzo/ruIz7M5P5Q76cDbXDpABO1SLD0cvCkBS5MAhggGoaD/6av1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JecYU42d; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JecYU42d"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c9e7391839cso2378841a12.0
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 02:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145501; x=1785750301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jmD1Fe73fhUyc5pCFw5d+S4TFcECjO79+u/TYKhF3yA=;
        b=JecYU42dORwLqzlGuV9kBqgen9Nm7YHlQZm/4QLe6ecQ8qJGpNlDy+zWhNB6NirBo6
         /GOQXMCFm9/ed2mNXd1F1BGGikG6A4/joh8qq14oWx+ko9Bj1x8RDN5mrNyG0Dg+eHJp
         HcqAkJjSwlXHY9QlnOxdTejxN9zOj7aHnMtpBU+nDn3stnxGWiegfi3lJF0eadM0Oh7t
         o1khrSUOuROV8cXUQBU2JxaZHFnrygja+DABJb/NsEeNsjeZ/2JggVGs9GEi/R/Ep2W2
         d+1te6uVJNk2HjPoc7Xl4SDm1ZC4XIiTzOAcwzh2G1j9WuVReT/V40v0ok5C3RElg8vb
         r3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145501; x=1785750301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jmD1Fe73fhUyc5pCFw5d+S4TFcECjO79+u/TYKhF3yA=;
        b=RO5N2/7dqE6BhtB+up0NZDeLRTvb2MrUztQJemWZx4Pttpk4XIDNtGOsacU+ehUBLV
         HrM8J1SdFAp5IjcmDvBSyjtaX9Euyih6T0HtzjSUNYB+juo40NInuNmdfW0dM55fK6al
         IJ/x9COgjAwMdPjY+BRIUbF6d7y2mfu8NvCIk1rYCsUnlPMRu/8pL7DdrdhkAduFN2fB
         jsJHdWzC8wHYfcj3EGw9bXpub3eqRh35+2pypvABQDmoAQtbeOG1fQ/fZeDLX7w79G4E
         BG+FsyQ72gHr/Z2g3hZ6e/D06QCglJPpMLgME8HFFCbsj2vcf+OC9PmzJb6PODG5R5ZF
         qRQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq215E7ZN+/0Wk1A2NlOJ9xRIa6B2vMvq8LqeT2U08bTkeW5pasJe//L7YCuyhEl7FEazQ89/tRRl8wkA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0eSegyOGPNpyPvAVIZ6cTwZxIfB5uRUbfj1NNEBA2u5DW81GE
	dbZOwNOO55jDXR/We/T8uHvzottUXMKKsL32CV5hJ0+SzARwgSdhHtbG
X-Gm-Gg: AR+sD11YRf/4uD7R1fwYZhLOSTogKBsLbbQ3TJD2f8Ams+C5ImKV1CXmCpfYM2haLdo
	hwxVOCq0Vlvqm9mGpQ0Pn2eisMX6gsWIO0Oaqk8KxmZHSSkuDoydI02v1GwRwIAwmkXpmu2HUh2
	vAEYPSWWKuHhqIFyxUuKKe05FTLTXGib9HjGOEP3/zSGo1Zy5IZ0Kiml4K3+owAlTKKvlnHxggh
	IWdVbj26L6/b6Paf7k+AGqsj0z/3LaemCjP3qS8p2TddHfPxx9pC6lz/Ahe0Tr0V8T+YOolTJnU
	eoCoPQTtEZDTdyqlw10LMWiU6AxCywYltLMi1c81EcR3Fzh981GaqRJeUt5MFz4e3xOPfWIQOmd
	FpFNJp/OpedYa+Iw0W9ezvn/jfi+YojnpNlHXpsbwtsUqaIEM2CW7P/a51cb/PQuLwkCtP6+oQF
	gURs3usNKA4a7smajPh20LlMLVtAp7QZQ5Msw683VJ6lsDOdSsK7BEOgEzz9UuruKrxMuY413gs
	wLgbbLihjlduJj+IfM6Y6eCci79k4y8
X-Received: by 2002:a05:6a21:329e:b0:3c4:1708:9cd8 with SMTP id adf61e73a8af0-3c67e0b9e33mr7385542637.76.1785145501502;
        Mon, 27 Jul 2026 02:45:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b5ffesm2959018a12.19.2026.07.27.02.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:45:01 -0700 (PDT)
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
Subject: [PATCH v2 23/26] ASoC: codecs: wm8994: Use guard() for mutex locks
Date: Mon, 27 Jul 2026 16:40:43 +0700
Message-ID: <20260727094046.23001-24-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727094046.23001-1-phucduc.bui@gmail.com>
References: <20260727094046.23001-1-phucduc.bui@gmail.com>
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

Changes in v2:
 - Add Reviewed-by tag from Richard Fitzgerald.

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

