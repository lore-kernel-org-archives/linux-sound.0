Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6693F23C5
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 09:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145500; cv=none; b=oPBI71VHKZfhbTpf214a0hTG1Nr6q6U2D+cStUxsApn87xxHxTVx72sgv1K60ux/BdqUsYJ0rSfdA99HzlooG08Kjhw+tV66LeoHat9ERZ1LLlPIE9yb+oPp9IkXdPyhfb1QC9RB2vkSekH+hw1kpINkJ6DEtaqK6qvCrbykXvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145500; c=relaxed/simple;
	bh=ikAUSKblCmx9vPxrD4DiGAFfE6E6PV4GiFUbCqP8Yis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u4LpGn+JzLw10lwu2g19vzpKweT666mqj2f1QWZL68ez7SBH3B8lUGgKt42u8iyLPDYkh7OQ4EYiCg8uo5JVP+mt7wJ3k/q4c861OGj42cIoiy3GyoCJwlbg5eduF2cXBiJNT4e5TF4QHOlsqS8baNAS3enCO7BTbN28DMJQlgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qd0j6mQe; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qd0j6mQe"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8484f229529so1561134b3a.2
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 02:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145494; x=1785750294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=isv33u6xMKa6TDMoSZBYo+IJ5dBBslRSk/9oncpo+oU=;
        b=qd0j6mQeBdze7RweYLyg0tWAWTkPZdSyBEfs4haMx1ed3fkLWQooz5if9mPV5ipSpF
         +AIDIIy9vgvZML/oEzrSAXH/O85LfgeN99xcfWyeOV3iXHDKK9t3h6fLSpbArU5+LKr7
         54r4S+tljwZ9YW2MvEE7jHD2M3J+bcVPn9IP93vjB+mnk1IQDynT/cdM7vcvYBcYjaZr
         Z6LMzrYG23QUOeNkEWQW7yL2268c3huzdzkkO64n5y/UnzvQBgNNmE5ERJonxQFJlHxW
         /kLCaLpCfKeX6MxxnXbsq26ACbXZar2o17LoZ9CsENN0hhLPANjF6FxvD8oSurXPqeru
         uA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145494; x=1785750294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=isv33u6xMKa6TDMoSZBYo+IJ5dBBslRSk/9oncpo+oU=;
        b=ep/qWOnjUbXE5aYuOzLijtf3EgJonycaL/7oUb6ZTYZvTwUzh7yrUC83wAZofhuPLy
         WKzTcxSEF2TZt49U/Ir6fmaZtYvUY1oyldlYG6FyslQGuMnLEqjbhqnV6+NYo+9rAKcS
         lvG+jXAaf2YpaAXcMrw5U1VWJdAlJ861qR5bch4cyRtP/3vH3Id7QuoVVG/DRzD+L9O4
         EiEVWG3nIpG1gCEv8SWJOF3qaXtZ1n+iC/GbcE3p0XL3QkbYd1NqfpqHHepkSqLC1OKi
         TTsr9E8SaPzV6XPezKYImB9Himecy4ya2jiTLNs8VsKmgnAoMBfHi6MeFCKwyXmjt/kY
         UZXA==
X-Forwarded-Encrypted: i=1; AHgh+Ro0hGBSQQp653/IbTA5txMei4iLQk4m8ejBWiGUg5nNJgTYylSurFtntral/db2ynZDdGnKgzCGwHHB1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuwYNKSL5ZlvyF+uIH0I6XrkE7aj+rmJY1KvOSOcNzGZ1EN/la
	pRzri+B+zkuQiyIXAs+zQh/1b/MCL+B6I+oCGAfD7U81rBVedlG6n7pf
X-Gm-Gg: AR+sD12leyKW+eLL6F03QUONAWp2W68bJxxkpxgtW7wy/C5mWM+GwsM3xIlSdkbU2CX
	AbZMUeWLpA9KealqN1nAZXWBGML0zOwqNLYXFFdDR65xRaeBtEuN8OSe88Fh4apIrWrh4i8Y9cm
	xCJGOtSntAEX8P33VelGfFTmf3vO/mkVVkq924OqWFmYmqG0TCfsSYTw1oZTzmIy5PpGL+POuBN
	Z+22ZqwU+tTmBgK+KeHNi3bt2NvgsTDo8ClDYxrmXSz/3vgasYMxzcPLM7g8TNhpsuSJMk2E6wb
	ytkHx3PnRqYnDCh2lzTC9I50g7fhrx7N/m+/C46DsyPcwYFXm8TJm4uvXfLDx/c5L0GCU2Pb3jK
	C/4zPth3HbZtdELonpLC0sv1kHz2jUsIcB+ZrtDC9E+S1B5hfyVzNKeVNCLD5mE+XAWGMZTEJme
	joJCalmDgg9Mg4jtCyBkVThgKE7XYTRARC5o2M5v/ik8LYHCtkCzrzVXCO8AuDEYPytgN6VJzDF
	8D9hq+Lang9Te6hpwqmCQ==
X-Received: by 2002:a05:6a21:4c03:b0:3c0:b55a:80ff with SMTP id adf61e73a8af0-3c67da78f78mr7990712637.24.1785145494540;
        Mon, 27 Jul 2026 02:44:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b5ffesm2959018a12.19.2026.07.27.02.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:44:54 -0700 (PDT)
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
Subject: [PATCH v2 22/26] ASoC: codecs: wm8962: Use guard() for mutex locks
Date: Mon, 27 Jul 2026 16:40:42 +0700
Message-ID: <20260727094046.23001-23-phucduc.bui@gmail.com>
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

 sound/soc/codecs/wm8962.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 2db822fc1de7..8a9598161b35 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
@@ -1564,11 +1565,10 @@ static int wm8962_dsp2_ena_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8962_priv *wm8962 = snd_soc_component_get_drvdata(component);
 	int old = wm8962->dsp2_ena;
-	int ret = 0;
 	int dsp2_running = snd_soc_component_read(component, WM8962_DSP2_POWER_MANAGEMENT) &
 		WM8962_DSP2_ENA;
 
-	mutex_lock(&wm8962->dsp2_ena_lock);
+	guard(mutex)(&wm8962->dsp2_ena_lock);
 
 	if (ucontrol->value.integer.value[0])
 		wm8962->dsp2_ena |= 1 << shift;
@@ -1576,9 +1576,7 @@ static int wm8962_dsp2_ena_put(struct snd_kcontrol *kcontrol,
 		wm8962->dsp2_ena &= ~(1 << shift);
 
 	if (wm8962->dsp2_ena == old)
-		goto out;
-
-	ret = 1;
+		return 0;
 
 	if (dsp2_running) {
 		if (wm8962->dsp2_ena)
@@ -1587,10 +1585,7 @@ static int wm8962_dsp2_ena_put(struct snd_kcontrol *kcontrol,
 			wm8962_dsp2_stop(component);
 	}
 
-out:
-	mutex_unlock(&wm8962->dsp2_ena_lock);
-
-	return ret;
+	return 1;
 }
 
 /* The VU bits for the headphones are in a different register to the mute
-- 
2.43.0

