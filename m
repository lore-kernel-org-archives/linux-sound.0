Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AF23B1EE4
	for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 11:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779363441; cv=none; b=qt83fBY0wknx1v01URAUjMBP8QD1XCBFwtBm7ueaS8eAfJ5DXE+Ymy361JjlYrET/MjW+tQy/+W4WQVy6rkzS4jEMMaVlIJxSCPIDldcMPXLVV6ql1LO9QhWQTsDkTnX6IUuKlvhtzqk+qXV/iLILLz/ZEjrArYveIEPDBVdSUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779363441; c=relaxed/simple;
	bh=LgWxFixDPwbNrZmuomo2jW5rDbuQrIzIeNbv251Fgqw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qGr88AAV7I+OHnN8m84H3v2kYpGUc0r9oyuTiNGGMd5KDlkxnnpHs16Cm/TXYjnuxOeYQpeVl6KfOca9K1w6IblRIv8NZ3hxDWUq4U5HKvhMNWXlpX6rYeWXjeMGyoDomAZzeDaMimojjfwIhYVTXvYwaPUoSddtey1dGTmx6Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nYZIkzXu; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYZIkzXu"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c82471904fcso2625365a12.2
        for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 04:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779363440; x=1779968240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N4V/zI/uDaBusVGWv8CyZy9v6gpCugV+8fpO+TgRX1I=;
        b=nYZIkzXuu62bS7bcGLeDaP8g/h1uIpZZlz0o988Djc/PmouZup2vbm4Mo5mzZn2Xj8
         589+ORlpHAluGEGc6WGn5vn74wVATBX/wsYCuAh6jbIOAq37ThmSwyxZZtkF3mKCB9eR
         4a7JzpOgeE8xTAdLqSyfU43jJ3yxmjqfj/W1p8QrNDn4lYeKgN2ujscr5RkCVRkSuhkW
         RyIFtqaVUvTBeDTjqCzedTE7ZF6/MfiLiC0K+pb4orrmVNRGCts+IPIv9TrkWLCAyyYj
         TdNEORNzFLidsmlokTI8ABNzWFyeUfsy9YxXNGTp8vlk9+XkS6w5gIVK8tNtcxRbjdT4
         BW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779363440; x=1779968240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4V/zI/uDaBusVGWv8CyZy9v6gpCugV+8fpO+TgRX1I=;
        b=rfhMir5KiK3t1UdFGtqaZalJb06OILwmhcidEAEy4i8OR4+otb/U7aoi4BmcXA6nhy
         mdYRxveIlMteNDly+Lj787DXVXgqeFuM7GKO+TmPuxtJLwNOAhsUuzvOwmoaF/x2qbDz
         lfn4xydYRjsBfzkoMZaZn6laIdATYtAJYgc2jS94poUuU/cg78Ew2kodtLOug3tro4yb
         cGw88jh3O5PoX5aqTaH4mFtq9oWg6kM/lIA8Bxutmqr1SwMu2qZyiehyWvZo7PjEjBIL
         r3tqHhSIUJHif3r+MdufWRLjeJAnsPh+DYWw1fk6qjeGqVIbg0IWkNM3/NdVIZigfj1I
         ilVA==
X-Forwarded-Encrypted: i=1; AFNElJ9ynsTfBgd9w+meHHWYMlKzeQhhxSgIn4UpPSHI2Du6iSu9rTnZOEnF2lidrX9y8YmpcyXUqRLR7qHIWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxDRZboAadPJPqOSG8+D1yJC9Fb6yaaXovk215hvCZb5PlOjTu
	Ma/2vOlxzzpq52P6r7tqSRyNOv8F3Xx+kC9vqUylGT8YRKKt+16HHM/s
X-Gm-Gg: Acq92OGJlftwxVnigowejsvmLtE8qNbLTZKzJTKtOu9fLSjjCcIS8TU3PrbtnBsJJmW
	KgCN3/KsH2o7oOExyT2WameDLHYX5CDMAj4gwLhbi1Oo8RbCP1VhsxgBemINqraI7Nzq6pBiA4s
	QNojAwuioj79MF6KTIRUhzWi91eZfciEjAID+fbHhn9ExYuujJu+6xnA+GpKSlWF5I3ALPv9xqv
	lNOIldNqHUOAhptEfFplzNKan2BnHVjW7JU7or2s72M3ybWFfQJ33f+a+HVZj0AEZuadQ+4wTbd
	tQ7zIaL1zWnahfKGwMQDUgGPkiTL5ggHU5Fgs+0SaXYzzkEOH4p/b+Suy9eJ0EzrDUEncoNnt6A
	wlVaFyhWn4R2sVQdEgx3xxl4Msu+EGMvOLp52m2Fl8e80hBkvyzdMf4Lipgw+/dpI90SFH7vULq
	OPQJCuhpvSyBd4UJRHuswGy4TGo+W+9gFuYEey2KOmGaMGmukzWFYVnQ==
X-Received: by 2002:a05:6a20:9148:b0:3b2:a8cd:ef4d with SMTP id adf61e73a8af0-3b30874de2fmr3156921637.29.1779363439795;
        Thu, 21 May 2026 04:37:19 -0700 (PDT)
Received: from name2965-Precision-7820-Tower.. ([14.48.8.61])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85198f508bsm131591a12.20.2026.05.21.04.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 04:37:19 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@kernel.org,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH] ASoC: codecs: pcm512x: fix null-ptr dereference in pcm512x_overclock_xxx_put()
Date: Thu, 21 May 2026 20:37:12 +0900
Message-Id: <20260521113712.227438-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the pcm512x chipset driver, pcm512x_overclock_xxx_put() is defined as
a general mixer kcontrol instead of a DAPM kcontrol, so struct
snd_soc_dapm_context must not be accessed via
snd_soc_dapm_kcontrol_to_dapm().

This causes a NULL pointer dereference, so it must be modified to use
snd_soc_component_to_dapm().

Cc: stable@kernel.org
Closes: https://github.com/raspberrypi/linux/issues/7242
Fixes: 02dbbb7e982a ("ASoC: codecs: pcm512x: convert to snd_soc_dapm_xxx()")
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 sound/soc/codecs/pcm512x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index d4c1d8d45af3..348752722bd6 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -235,7 +235,7 @@ static int pcm512x_overclock_pll_put(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
 
 	switch (snd_soc_dapm_get_bias_level(dapm)) {
@@ -264,7 +264,7 @@ static int pcm512x_overclock_dsp_put(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
 
 	switch (snd_soc_dapm_get_bias_level(dapm)) {
@@ -293,7 +293,7 @@ static int pcm512x_overclock_dac_put(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
 
 	switch (snd_soc_dapm_get_bias_level(dapm)) {
--

