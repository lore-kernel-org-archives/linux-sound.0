Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22EB48095F
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 10:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629678; cv=none; b=MDDEg7zlX1LagSi9uymx2QEXPKZ/ugoQWhQDxut0ysFQDg2+61ep0n1B8uPL78eu0YsMeU4zzXpGf3JXrR9SNTTPcCo1/lLe85en5pV/Xmv3vXVjof/gXnW+LAEwPs6A0D64vtLS4CVhUrOcb9QViIRsNJiY5+zBsQvqlFTau/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629678; c=relaxed/simple;
	bh=j7IRCq6xm1VYCtZq2k62j8PjKHVyBOvTOYRKr/IN3Nw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=txsk4fDWoV7a5i2chDVMZTfd9o7wlVTvHXuZIh8agzhY3i9JL9SNHKJt7djpYXknYB+kU0jfFfuq8u6stH/wKEtsSwm87dMOzUXjcXPu5DwQUcYYDsQmgosSWNzrEtuMN097pvIOznFqAYjemtkM9aMYL1TOpsSP/ZlDeHcPFTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Inslfchp; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Inslfchp"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cad4170e8eso156530925ad.3
        for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 03:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629676; x=1785234476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gCCco9cVx1cOuMyiOEUiJ1UTQlQHfjoxsoHM/LTW3Ro=;
        b=InslfchpZf5UpXvxDYIljexmMg0s0FZz916/HyswVgMpXgD6E/29XIEuKu4Nn/qOGx
         tZ1PN9L7gGmBVijUn//N0JEM9CxZbA8P1c7yTC3poo+OI9VFxJPrlsyERwqIhVkT7x55
         4B6Z/WBzev71lo1STx5CGisVun22QP9SAn+h6cva5NjpWScsjYNt4u6mRhrw0Fa6ZXWv
         ENN+cQc6mefmFaswBF02YjmJKDzkhbGCVDPTlbOvnqDeEJqrNDxSssabsUjug1kcohbL
         F0XzKNjnWxGLexcNOwfoQDeo3FErb0VR66kyRQ/o/vhhCVvboaRnp+ne8vUpROuDOHrn
         vQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629676; x=1785234476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gCCco9cVx1cOuMyiOEUiJ1UTQlQHfjoxsoHM/LTW3Ro=;
        b=ByoNtT2c/XlLmLZHiEOJo7Qj/juewjSGDrKR7hpEYTRU8UhP67YW8c1hTEiVanKG35
         DEO8Bc2p+JBUu2h6qo528aJ9F+hQIIVwhxAN8kThLPNeww/jjW83xkFkbwZjCs+c0EKW
         +WzQxrrwX2Jnfe2f0iY8CbOHAYij0w5uReqN+B1XJauhLogCkpjFwicv27pHnJbXmrPc
         cb75CT+ghU9vJz86wioNc+aNqMIwap4lyjYGTVPxe7y23a2bU4LW/4KjbNZj6spmv/2J
         cgNzIYW96Ze9ne91LGudYYiGoeVVE0dTAIymojlFeZzWbgYaiCNf9stp+c5X5YfbQtfm
         7/vA==
X-Forwarded-Encrypted: i=1; AHgh+RpAAGp3OzFd1GVfhpZ/BWtRDMLtyMN38YAC+/+uIeA4xiEsCmsmPcXD7JXayb2kAstSVF50QQn4+YMY+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/bWsO7DPXJnY/vJm96Sn5Mf1CPz8MGSKDf9TJ6BqDocY5nakT
	u5yBkoI7vwCb+I9YpuFlgW9vR9k6u7H3xFR8Fd6223y+hxvEaj2LqpFg
X-Gm-Gg: AR+sD12dWVGmMLeDOJdbuBbolZvw6ubUWqD77ZgalsrhqpTaXW6hOpHsgP8AfttMtdh
	xswkHQWeIKrA2hrpAO6XTr4OTAYQYZHHmIwmfFKHPO5OR5AwZ0ePOVQQOKGgXuFDfP8KRPZ/VSB
	rc8ZDoFUGpdukEaxixqeEiMHe+kGFbvFa+8NlFiSSR2IXWVpuxIHOgNp6hqfpTDgvRnwPwgMhHE
	3OcINGz75wimIA6D4mAA1msMqGj6nP90aZtbOtD3Gb9r+YFvudxtNAOaBdHHdoenHGJs3UO2MmC
	jrsfA6F2mFF8uY7sgJuDEsqgrF1UOpi5vZlj5i7Uth6L/z1ki1YXzCQ9k4Kw01SETrzMVEEu44T
	88PRcNHBIYSAOyQ2nn92phXg+LXIsNWnFq46c3B34DjjEpoBBe1JKcgBkqgO0jdjnwD/2Z/C+7c
	LmHT70gpxz+g1TQ2LBFNMryKDWJGJtfysZlG+S
X-Received: by 2002:a17:902:dac6:b0:2cc:307c:51f2 with SMTP id d9443c01a7336-2cf34948943mr194104795ad.22.1784629676095;
        Tue, 21 Jul 2026 03:27:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:27:55 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 12/29] ASoC: codecs: max98095: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:43 +0700
Message-ID: <20260721102600.523199-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/max98095.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/max98095.c b/sound/soc/codecs/max98095.c
index 130b6694a634..d93436046849 100644
--- a/sound/soc/codecs/max98095.c
+++ b/sound/soc/codecs/max98095.c
@@ -5,6 +5,7 @@
  * Copyright 2011 Maxim Integrated Products
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -1532,15 +1533,17 @@ static int max98095_put_eq_enum(struct snd_kcontrol *kcontrol,
 	regsave = snd_soc_component_read(component, M98095_088_CFG_LEVEL);
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, 0);
 
-	mutex_lock(&max98095->lock);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, M98095_SEG);
-	m98095_eq_band(component, channel, 0, coef_set->band1);
-	m98095_eq_band(component, channel, 1, coef_set->band2);
-	m98095_eq_band(component, channel, 2, coef_set->band3);
-	m98095_eq_band(component, channel, 3, coef_set->band4);
-	m98095_eq_band(component, channel, 4, coef_set->band5);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, 0);
-	mutex_unlock(&max98095->lock);
+	scoped_guard(mutex, &max98095->lock) {
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, M98095_SEG);
+		m98095_eq_band(component, channel, 0, coef_set->band1);
+		m98095_eq_band(component, channel, 1, coef_set->band2);
+		m98095_eq_band(component, channel, 2, coef_set->band3);
+		m98095_eq_band(component, channel, 3, coef_set->band4);
+		m98095_eq_band(component, channel, 4, coef_set->band5);
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, 0);
+	}
 
 	/* Restore the original on/off state */
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, regsave);
@@ -1683,12 +1686,14 @@ static int max98095_put_bq_enum(struct snd_kcontrol *kcontrol,
 	regsave = snd_soc_component_read(component, M98095_088_CFG_LEVEL);
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, 0);
 
-	mutex_lock(&max98095->lock);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, M98095_SEG);
-	m98095_biquad_band(component, channel, 0, coef_set->band1);
-	m98095_biquad_band(component, channel, 1, coef_set->band2);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, 0);
-	mutex_unlock(&max98095->lock);
+	scoped_guard(mutex, &max98095->lock) {
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, M98095_SEG);
+		m98095_biquad_band(component, channel, 0, coef_set->band1);
+		m98095_biquad_band(component, channel, 1, coef_set->band2);
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, 0);
+	}
 
 	/* Restore the original on/off state */
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, regsave);
-- 
2.43.0

