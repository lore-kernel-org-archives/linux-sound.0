Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F50345EBF
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 03:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467539; cv=none; b=egJrqN8XamHgmWJAbfjJmTBNXfLL1qqMPuHyfpXHcYWkDFsLwzbK5xGmOM4j2omzUj/nNSbpzCCsHXz4SUv4i/6IWwfykrJArniWsGioi33gdQedbTwGewcmqT/4N81gUhzmpqR9173ULaC5W75TOGfwH8AUHdX8iNPARTErFZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467539; c=relaxed/simple;
	bh=2ZQcxyuElWSG2ZM+lBRNbAim+UgXbAvs1+qEvw0iTPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XOR4pwAn/lvyInpB3LpTEy02qgXvrPNgaQzBJh5gwalmHBEh3FWWvzUb7nhp6okCDU5g9ChYSJn4T8WL/SMLmIamKN/G5RzxmUdmgYqQ32eRBw0F6h0Jpk45JVVnAID4XGtQ36sx6rCKVATt6A8xGWcWBcNZJ+d2eH7Q2g2Nzv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M2uLYN1p; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M2uLYN1p"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso4115725ad.3
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 20:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467538; x=1786072338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pRp7w3aucssFRgkLpXLJWYD4cpAPyrp4T/SLglC5YPg=;
        b=M2uLYN1pdRjLcD+vYyS8eCCjuJAP0hKC1YSMpSM9dqZf0qAydJ7gyg0rc9XHuQ68JR
         Ql5rGlYC+PFYS7DTmpUopB+2YeIlh5Xs0Y8onBEa45xWSSexTelVfQUZ6OAsxXwDakEJ
         hVi39ae7JDyq8CyxiuM53cJIe/ss4MC80+Xo3IoEh6+HWkBfAbLFrqknq39wkhhD4LhU
         z4dxDvAGP0IaNkWS3/3NXnGQiRzuKDAEQabGo0oUIUIi4Nx4wCAe1c9dSakigxND1kSN
         SCZ+hk1F3hNxb9ORtZADC+m8DMMO4Y+M6lxfnMLmiLar+BQ8Hv8bq/Z2b/Zwpdp43j2V
         sIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467538; x=1786072338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pRp7w3aucssFRgkLpXLJWYD4cpAPyrp4T/SLglC5YPg=;
        b=C4XSN+ZtxfMioawaew60nqy0vRag64ogenWnmtjbyyLNcRKu5ymSOCouWoIbgdE6hq
         g/g9zuFq296pebiQfTmSBIT5mBgpyRH0S85fF/f4ekmn/wT8wFNzRj0ezV/PuwDpm00A
         jJiinhfLIggA+ZfIxT+uZpwvJPeDxJRrV1ylWIjQoE+m8HYdn3iEFmb4XzmJ9JSH/y1g
         Q70taK2vBsKslMfWxrBwku4IVee06Jyx7Sz3XpSWk+tIa8b+pvsBTalBkd2xMXm9bmWe
         iFQEOAA0pLYEAAn9huX4MYthEj12PtxDEnBLGLcEjJRicltWKoN4vamiK/v3VyocBBdO
         WOwg==
X-Forwarded-Encrypted: i=1; AHgh+RodtCU9T/qFM6ymv0onSngLppm5yQ2WQSGT8j1itQ01sreh9+/wDTCsmwrXhmTb4OQEYbaLxxFezVxWQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQOPzlHZMzj8e/7JQ5PvFw3FLm3Ij7u6bGz390UilV5qJ1TEU5
	BEZOuJWubYJZKB9xaRTI1x7qy1yB6+x8D+fBeZcYOemLNBzRzemMQr7R
X-Gm-Gg: AR+sD12nFSZ8+F1XvEvPHvnyd7JRH/fCutKRRfc8WHr8v4D+ysyEqE1ac/m46BD2D6w
	RmAQPwLZ06E7bI99Jo6mlXOUTHCTvyYqOLQiLS/ElfPePvzy2PW3+gV+J3FWLY/e6Ajw6Yjzny7
	WGqcYu1+vQRpJFENUb4uZk32XTnr4MaEkqakpq1OVRKuxbmT5Nk0QInjhgrYCDH5hXuxYy2hegU
	mYQILnIe8MFvjEtNRb7XL2cuGs1+b42RZlDn9VKk8if/WnxZZTUbaxZL/pF52xTILYLkp367S40
	i0wnvgKykf8O72m8+gkRauLUZL/OOBwk9FlRabcKs3BYw0ynt1E2vFTyMmdTrObb21/yScSTcRG
	J2SArEEv2nnSkMM/Uce3vDmaXvUBBWujoYd24Xxs9wsafC4rw5UPp6EuoaDUPkPfAkl4fE6xuKz
	Mq2vCu4LUt0JLLzWhWvFG+xRIsmwyORhpz+SD0i5DpodLy+4MsMhKtdX+XuEDO/z/uawjk7upI/
	rlhqX/0rTwIs/BNy34phWdSrIGOWNwMo6xaDYGbK2FLQ1A9k/NgkRoScCT5aS+Rye3Z4faeWEIC
	Auah
X-Received: by 2002:a17:902:d2c8:b0:2cc:dacc:fe27 with SMTP id d9443c01a7336-2d046e70aecmr4504055ad.30.1785467537989;
        Thu, 30 Jul 2026 20:12:17 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047ae9f31sm737595ad.60.2026.07.30.20.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:12:17 -0700 (PDT)
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
Subject: [PATCH v3 17/26] ASoC: codecs: wm2000: Use guard() for mutex locks
Date: Fri, 31 Jul 2026 10:06:39 +0700
Message-ID: <20260731030648.8706-18-phucduc.bui@gmail.com>
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

