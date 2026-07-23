Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7519A39EB73
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 04:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782592; cv=none; b=RGAB0lzzDMTbE8kmwv/0MT8irJEmImyl8fLxVmu7VDNtEYZsOR/Hmlg+vsrqdUigE9FJY+hG5lhQ9VyDQ0uiwfatd67/wchbQzYXqHOLK4pAwC6Kgf4KXA2DA3p66aHVU1ZwD32XDqOZdVx+qOnI0NAJnos1xkfu3faH9FAKjqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782592; c=relaxed/simple;
	bh=yBK2UCUmSQSFOpEtB+8KHiI8/hJRWMYuBBrJOg0oZWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c7CFrAa6N0nhNDyhizQ/OJtLBe+/Y9TzY0No6Tg8d67JTjrB/5l2VIFRZfW4iUH6tIo2Zz57H41nXjx5gQj9FGp+WPloOZtgmZg4SyNgym/ljjKy6/a2nu+9DRO2O5XgjmOz6jWDWZAeWUl4swbdDYk7f88V9rbdjwf2W//yVGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e+/hlKr6; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e+/hlKr6"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2caed617615so2570905ad.3
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 21:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784782578; x=1785387378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Md3Lv7WH7OCFvrmgVPZDMLRQIfXY7uimwN9Zh0AdLk=;
        b=e+/hlKr6p0jKsUE4cDAUvfkDqboecn2EUu9SvT15nKcThgEfqRVlVlAAWeO/maQXyJ
         t9H3R/SLbQRwsSt5mQzN6pw/oiOE/bDmLxq2ND4YH0FFdmRaTcIL8xL6cJsYC0nVyHXZ
         frcMOQ/vs10pIZfb9bFkIZ56bOd5KmoGWy+5xQ0fYeqbOxP6WuGZpIsfYjtGkkkhw2bT
         yzZc45mMNC5ZRgV25RfyPrCDmXSY859GlQe/yl80vkL7h0pWyXgejvTBqF9kK0oLxi4O
         pjW32MrTQh767z1AH1QIeioBwWVKlM0zB0f5Qc8/dKqX1Ss021mCQXwPBH06uvK5L+uf
         TvDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784782578; x=1785387378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Md3Lv7WH7OCFvrmgVPZDMLRQIfXY7uimwN9Zh0AdLk=;
        b=Esv5FPs+38exJcUcXDfdzk/UerN2MlKDGSiuE7coFHMY1MJ/3KKVMEW+D3fw6l3rEn
         knxMNNic5Qi3FQB7iLj3DVwmgTWlxhYoI62gIjbRivHyXf5Od1AU9i5SMLD6sQFu5oqi
         5u0FUZMtQuYSQ3NspvEvZYaYVZyIUzSMWn5PbxNKmtAt9MHBezY50gP2R1NKaBpKarKQ
         1uiPjNwNIo6wtM8t24KhXoRyh5c29eSIt+Q9lxkzLHb5YSa0aqSWbj24JSlSXqnVrjrw
         6QoSC5aD1SD9bKhrgfTGKXby0uqZVVjv0dxJFkN46Zh2laJGg3dgEVsWBiWijlftbx1p
         AR6A==
X-Forwarded-Encrypted: i=1; AHgh+Rq0l6Swima4htyX1KMTpN8qysit2WQafabk91GsZmWFZq4O/aoW5/q6iyNBdxK6cidjgCO/S+SAiWOM/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc4T9za6ovz1KUzJtSaqfXs6+8lNlGrzCD7BsDf77NHeek7y40
	d5qfjRhAL02l1agmMorjoU5JPbMywqS1AOW9nV483fzBk+8AxcZ2+ZGq
X-Gm-Gg: AR+sD13LV/BafPD8c/B8C5DWd6bWHYgDZH76+WRKR24TiyIbliMeqt/J/oZNJXKNt9r
	qSeGo+J0t2D4fDvmmR457cmoKeVML75qR1ZVZtWbOdshFBcfFf/kK07sZTSBi6a6A4NplNi3xsx
	wemfjFzNqjWqoKfpVDjDniabqva5TZbvvR0gTzkO/mCHaUe6zl8Cs6Ht6w0eiVA//K1A2tfCKfn
	0ZemIwquwoMMVsG+y32RSIM91+fyf0mzNaXgMvobHEAEHhp0yFDPLAxViYG826Fiev6VR/BN638
	Xva0812gHoZJ2AK4ee2UCFrXX5LcLPj9B6hWaJT4K7kNluYG6sbFLr7aXmgu7MpEgRL/SWRo4de
	iTywle/pHm9A/rNf6a3CBcD0t8yI2BzeqZzXsNNToJtVqadeInDJ/nMZwl9dmQQeCB2sYVKoL0G
	ZKXD7Z+d8SKjC77qPojH8pKVrdRmitZPXJML1m
X-Received: by 2002:a17:902:dac7:b0:2c7:ebfb:618f with SMTP id d9443c01a7336-2cfa6b73a76mr20511265ad.14.1784782577702;
        Wed, 22 Jul 2026 21:56:17 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfa57542e0sm7258365ad.67.2026.07.22.21.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:56:17 -0700 (PDT)
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
Subject: [PATCH 20/26] ASoC: codecs: wm8903: Use guard() for mutex locks
Date: Thu, 23 Jul 2026 11:53:21 +0700
Message-ID: <20260723045327.28260-21-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wm8903.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index 320d7737699d..156e1e24a388 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
+#include <linux/cleanup.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/gpio/driver.h>
@@ -458,22 +459,20 @@ static int wm8903_put_deemph(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8903_priv *wm8903 = snd_soc_component_get_drvdata(component);
 	unsigned int deemph = ucontrol->value.integer.value[0];
-	int ret = 0;
 
 	if (deemph > 1)
 		return -EINVAL;
 
-	mutex_lock(&wm8903->lock);
+	guard(mutex)(&wm8903->lock);
 	if (wm8903->deemph != deemph) {
 		wm8903->deemph = deemph;
 
 		wm8903_set_deemph(component);
 
-		ret = 1;
+		return 1;
 	}
-	mutex_unlock(&wm8903->lock);
 
-	return ret;
+	return 0;
 }
 
 /* ALSA can only do steps of .01dB */
-- 
2.43.0

