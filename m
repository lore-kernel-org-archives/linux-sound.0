Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDC33B3C0F
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 04:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782602; cv=none; b=Q3Hpk5WjFFGWA2EI0Xkthgz125eypFoJpVu5W2HNkj6Wq/qvLt++EG8whlxdr+iJWexMJHBdiZOE78eIC+ypLuDNn5z5xfRWD65VNoTgjWt0ocBhkXCd/8V9qq2IEbpMcUkFUmMxdPFmWPwVwra7KRtGqtjlzczZj4LPs+wa7C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782602; c=relaxed/simple;
	bh=mTFpbE7y3C+2o7mpAVBR3/EaCOyAljsg1tywzWeZ7gY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J7cnQiTfiJFkmtbS1V4T33ouslpgC0OT76YhTmlGu0rUtCXYk+fXF0W6RS4NiYGwojIg/GykLDJorEqmUVu3YyhLcwsz3Obj+Cdk1mbUmrQ9TgNOhzZLjbwGN/VZVysBxaVEkAh0QCAZufnTXKXwIFfIozpTuV0si/IMhrV3wRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a6mrd0YZ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a6mrd0YZ"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso2568985ad.2
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 21:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784782591; x=1785387391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2qqyvFlsAJpGp08mEcLtsqWSAzW5XWPBTBAzSWZnfs4=;
        b=a6mrd0YZkIHxLi4ckfh1lZoTYS87DUn2J33GMTQby2aqb09DpgtZVUWbOMQE4ekx8f
         t2SBlyOIXrY0JnEgQbBLzEG4q6+gXefqtNm6sCc91edJny2rUddhqwui6YdnQS2P1Mpa
         t+rirL31kj011rXaePXdmNSOrhZvbJ/CsQlHp+sJZqCKIH6HZSReLuYWxT87TwWOFrda
         OQPTQ6OEFKfusRwakNkCHeV5dBLvHl/WyW7z7jSD6eKYUwqXIBg5eRAvm49McdtijPIg
         35Oj58k7XiesnrRvQRm82hzOXmUfOE3JdNssTP1eyGvPer1NQpsVWh3Gg0rjg0moARx3
         aiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784782591; x=1785387391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2qqyvFlsAJpGp08mEcLtsqWSAzW5XWPBTBAzSWZnfs4=;
        b=hDpAzCtzj9P8OmeLocyv2jh4oQA3HYChXeWt9wZLndaR9j3Y1LSy7VYUNygsr7THu3
         lYbbM3GeBsLflXQOV+Vn4wXc6CiYeTm00/RqT2zzLgQ9iYnIOXemyfbqmKjdyXk0DLGo
         URmo26tY3weexmF8pzjV7eKJXWNWxtIkDuMljaYE3OzSh0HNkncgOsSoO7desG51dziH
         3dJecyod/vD4toBVPlbWV7M4GOvxeZE8xu3eZaIXBVNuY7AOyD6E7uru/PH4OkbsUXcl
         cGtFngSJl6xirepdmQkjRUr2zwNHqjABQG89HScPQu/Hkw1y3F5UDJCUicY8ATJlhMte
         ItZw==
X-Forwarded-Encrypted: i=1; AHgh+Rq3GDau31JbSB7F5biu6Y5ZRhO9DioDzJxqcxyfu/BZtIxoVg9UwzBF4R0IbFXs3auQbV8nwVnlz2kYtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxG0NSAXdce+666WQhc82DzzS6SABi069YO9GqGUl4Xn/EL/5oM
	l11KNK2+XhblTqIryCRaGq0eTemXG0u2WqUQ4SogJwlz8qTNjQ4vGiLP
X-Gm-Gg: AR+sD11/+ZboeaOFCw185O08ABAdKT+m9Trbp89pbu8xE9G1V3Bm/vp8qlSsW9YeBdd
	2ma75l4lzvVBhGk4TkB4ii6KNFA45gdyQDxkZZsO3ckdsj3+T9fw8XMa13dw6/kvqozeHOd8y70
	F6VUiOK52dHF2yYGZcUQl7oM/Yi5rgHnO+rTJ3crm1JwOvR+pkjdp5V1VjzyMjYr9JTN+2ZvnYC
	CI52G3JDnn0JU/suPbCjY902lWaxet3ScvJwh4EG9Iufjtysf0yJCpCbLYLJZM6Wlvo3PhFq65h
	NmSdxjjHKJ9JYDo+GDtfzlxgozF3ik2h3FTJtJU2iRYb00NbIMdtlTjsaUld2KtQ83OC5T3CM2n
	cEubgwGWnWXD3Ha/BAnUic6HwLHOfVnw4EDPVu52skBAMyi52OO9vuvPd+1qh+i/T6cRM6o8V4v
	hR9WaariLb7Aew125zu/y0AlYQri5jKtBbbcDq
X-Received: by 2002:a17:902:e801:b0:2c9:8f4a:90b with SMTP id d9443c01a7336-2cfa6a54e47mr20230015ad.3.1784782591028;
        Wed, 22 Jul 2026 21:56:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfa57542e0sm7258365ad.67.2026.07.22.21.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:56:30 -0700 (PDT)
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
Subject: [PATCH 22/26] ASoC: codecs: wm8962: Use guard() for mutex locks
Date: Thu, 23 Jul 2026 11:53:23 +0700
Message-ID: <20260723045327.28260-23-phucduc.bui@gmail.com>
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

