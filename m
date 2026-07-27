Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A0E3F8249
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 09:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145461; cv=none; b=pqrJfNrVNow7VpT0jCueNsaIlwpNcHTOZL+mG4IyOCUnBLj1A9RDGoowAoR2FyHknMhFcabTDkB/EEIugkZU1A+r4gGXW/SFKeHJ77FqMFMhfr6Q149KUC4XBqBBKaM9wBe9heJdma+vBujpyH4N+QXNhdXpyrWGYLV4rVnHoDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145461; c=relaxed/simple;
	bh=2ZQcxyuElWSG2ZM+lBRNbAim+UgXbAvs1+qEvw0iTPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BdtiwihDjZH1tNYthmvqoXLtbtinPTFvYUgqaFifySh5BVqsvheq+3GMhvDN40HEDpencJz4o34WymBmI85tLyBj/CVSPMDVH6Ho0RgwtTlWbi3lK/mX9cVe8N67h2bEOgB9F7UisBAPmbzVN+DHVEjbvFNAyz2DzBeBXWOmUSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J7DODWHw; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J7DODWHw"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84867f07d63so3012169b3a.2
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 02:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145460; x=1785750260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pRp7w3aucssFRgkLpXLJWYD4cpAPyrp4T/SLglC5YPg=;
        b=J7DODWHw7q5CKZwUshAO6TxN2MtImLjojvctaWFQqWsaMRqmHCzn/ImTs0LUt248XR
         YRACEml63Qal800tKe3dpX1wgHBSLEj3V4MKQ9Tj6msoEe4CSxpLQqhqJk9QJmJaMkxR
         pa5b5XLN164EuhYdYVY9TaQNQNbZNFwZlONprCanRcD8SmNOXm3NX9+wBIcrZICG0Ipz
         LQWMznjGrN8zP+NK5wvjFSssFW+fI4QMlDr9vsFew/rgl5KzjZ8P0xDA3j0sLgx0ESzs
         GHDfmnnMXASUGdgeBuulGGE9NZlcYPyXInawIb4RdeWaO4ns0/bSj9RbDZ5h1XJiZvL5
         iNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145460; x=1785750260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pRp7w3aucssFRgkLpXLJWYD4cpAPyrp4T/SLglC5YPg=;
        b=TKhVyEsJFdp5OZj43ueVznKMZx0M2b4huMAr+X19+5mrsNV8Xk10tYvlZAOGBrP04K
         t+Wuky+VpPtoOCKR8zJ1lk3ytDdWy7zk2yY8ky73z1ebw3RjiONMV2PcFDZ+JP5QxeFl
         F4m30Iz8ktkFspNZ4VGn1+f7Y/7RpfzbjAgbNhKe8XLS3P0yZMriMeOxdodQGsRvLXJz
         z0Ex+i+1LepEidZQBu22SUkSNLqf8cViCqFb3w7xt7N+zAA1hwHjuTEF0f9/28xfuoLC
         7QOrIDJMFDEs4UVBOgmoS+UUMs5IjbOs6gPiSybhsN3sRhWqGiEjxJXAt3MhFyJ3L1W9
         wp5Q==
X-Forwarded-Encrypted: i=1; AHgh+RqQu/xbQrc4biN/dJPdr3b+J046yPRbU6MTXI79RICYluueLYyo0ydwNuq0kR+r+CwZV2Zw20QYVtccag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8DCWSkK38WiV7pyOYxYerIJMrWtiXHxodbzhfTGw61U19FJl1
	+4b8YkufZUyJhRcVFzJXfi4Y6Zq88WnGpiXf8UcmYrVhosFfVb3pcRCC
X-Gm-Gg: AR+sD10y6UlMMbY36pK6tfApkK4UE+Md5HETIHFogD+lXRdXX0r6Mm7y+IJHLbsFXQB
	2Zne2I77gqmK0uaT8iOyV/u5UA48CnDBhJxt/xTuTkD9TplumaumoCT9vNqBxi8/JO3i21FzFGw
	RH4+XlC5V56JRXIeLeV7iY6A/SJ/U1yGlGNKYY0PIKU0BaUyP10Nmf7HMZPIzvkAByDbjaZ+yS5
	e63pktP2vIhoyF9woFKrB0izyusKFmFxVa+4hvx8A0oPU1TwXyfigjn/NbTvD0MyF3vxbxV8f9z
	T5SZ65ItLW8WsAQwSZI1PU1IxQ8f4mSQx/Sbg0ljjrGpNiAKhB+jzC0X/Xcv5ukFtC07EjTpGEN
	GgH/aGkvA2L1QQz7QXfrARCf0uRm+UwewrxAiPBw8V5SJwvbaAgWGyfkLyswlZ0qhexk/9YjyDy
	HsdGFJOw7rrqPfnfvMeRmxDtzxgEWQDxx38JfhoR6giBhDY4X/kLmA6MtSH/R24KuvbCU/ce9hO
	MubsQMhdGcwGLmFkNMjJQ==
X-Received: by 2002:a05:6a21:a49:b0:3bf:9c93:ac44 with SMTP id adf61e73a8af0-3c67dc48cd8mr6943629637.19.1785145459621;
        Mon, 27 Jul 2026 02:44:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b5ffesm2959018a12.19.2026.07.27.02.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:44:19 -0700 (PDT)
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
Subject: [PATCH v2 17/26] ASoC: codecs: wm2000: Use guard() for mutex locks
Date: Mon, 27 Jul 2026 16:40:37 +0700
Message-ID: <20260727094046.23001-18-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wm2000.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/wm2000.c b/sound/soc/codecs/wm2000.c
index 9b68ee69324b..897b0acac5f3 100644
--- a/sound/soc/codecs/wm2000.c
+++ b/sound/soc/codecs/wm2000.c
@@ -23,6 +23,7 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/firmware.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
@@ -612,20 +613,15 @@ static int wm2000_anc_mode_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm2000_priv *wm2000 = dev_get_drvdata(component->dev);
 	unsigned int anc_active = ucontrol->value.integer.value[0];
-	int ret;
 
 	if (anc_active > 1)
 		return -EINVAL;
 
-	mutex_lock(&wm2000->lock);
+	guard(mutex)(&wm2000->lock);
 
 	wm2000->anc_active = anc_active;
 
-	ret = wm2000_anc_set_mode(wm2000);
-
-	mutex_unlock(&wm2000->lock);
-
-	return ret;
+	return wm2000_anc_set_mode(wm2000);
 }
 
 static int wm2000_speaker_get(struct snd_kcontrol *kcontrol,
@@ -645,20 +641,15 @@ static int wm2000_speaker_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm2000_priv *wm2000 = dev_get_drvdata(component->dev);
 	unsigned int val = ucontrol->value.integer.value[0];
-	int ret;
 
 	if (val > 1)
 		return -EINVAL;
 
-	mutex_lock(&wm2000->lock);
+	guard(mutex)(&wm2000->lock);
 
 	wm2000->spk_ena = val;
 
-	ret = wm2000_anc_set_mode(wm2000);
-
-	mutex_unlock(&wm2000->lock);
-
-	return ret;
+	return wm2000_anc_set_mode(wm2000);
 }
 
 static const struct snd_kcontrol_new wm2000_controls[] = {
@@ -676,9 +667,8 @@ static int wm2000_anc_power_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct wm2000_priv *wm2000 = dev_get_drvdata(component->dev);
-	int ret;
 
-	mutex_lock(&wm2000->lock);
+	guard(mutex)(&wm2000->lock);
 
 	if (SND_SOC_DAPM_EVENT_ON(event))
 		wm2000->anc_eng_ena = 1;
@@ -686,11 +676,7 @@ static int wm2000_anc_power_event(struct snd_soc_dapm_widget *w,
 	if (SND_SOC_DAPM_EVENT_OFF(event))
 		wm2000->anc_eng_ena = 0;
 
-	ret = wm2000_anc_set_mode(wm2000);
-
-	mutex_unlock(&wm2000->lock);
-
-	return ret;
+	return wm2000_anc_set_mode(wm2000);
 }
 
 static const struct snd_soc_dapm_widget wm2000_dapm_widgets[] = {
-- 
2.43.0

