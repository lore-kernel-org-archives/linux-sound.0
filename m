Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE18044DB73
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 12:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515199; cv=none; b=TzCowAL/JsDOT/h6ppyR5cXDp+VJuftilk+khJNiDO1iazkXp4Q6dk+aqTRT6y3ra1WrscSAsa1t8hYuz+BMtoBpyVnjQm8tMLnLEoJRjP8Cz4luIyZ9U/jZ/vlKqs2Ce4VViXKgXa4sclTU5ley5f/dvB7HD6X3h7RxXNd9J7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515199; c=relaxed/simple;
	bh=g5J6VJsuQEDSKj38JRXT3/2Sio6DcgOG5vApByn829c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TRcwZXU1uNJr03y3dkzhBp5/KE44LYUW/icne0xvw/xeGdgq6iqfCpsVH4R8okyEh5IbuK8XXsW1BaTDAi+RxKKy7ygIcxUhgxBTNHyeYd7SOH9cIQkGR8t70JUNXJ3B0ySapp0NKo2kCg2llbeWzVepJInoxrPgL+Pl7ouDK0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qsi1eKeO; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qsi1eKeO"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-381891a9525so792463a91.3
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 05:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515197; x=1784119997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bqq5atvkGJrMFIYTW6TJTTxqCIFFL1aCQFiDrRVj0K0=;
        b=qsi1eKeOt39TiP52CLoVA9Fk+ufvQ3EDOE28fya9KBDEWYXr82RtDm/cLQMAHjUW8X
         zY/0wytHXIjcO1dldASDcJvhZPP5TLM8+GsfGK7T7AISCBVQBu3fqDjLZXFcKd3QnnbY
         1CE+wVEb1h5x4NFbtNtWBamHtuwuTE/5+s+2uMJSQK+Z+D3O2R4mMVywa6uksKsZRSYr
         FIbhfPvKPmZnSFhkhHheE2CMi4VUfh2n6ZmQ8YlEZoGE1ppTcZmMptHUDXUOkvOYKkl6
         Qx91hNRd8XHBdc2xLusTK/ZU7a2ExPBFqtFhtunexPiQRdzU19N/C+g3XKqQkSCpHazn
         EwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515197; x=1784119997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bqq5atvkGJrMFIYTW6TJTTxqCIFFL1aCQFiDrRVj0K0=;
        b=jTVTB3AZ6i7Eu66hcHv2rDC0B2rCZVjDB8vHO17mlHeS7A/ub4VPKsiNQtn7tH5pHw
         IIhLPgQ/2GrW6uuV4qp+fNPZw+CORZhNO77rrN/IVr+qTkfQPS9PXP2ffuRboyD1/IhO
         kqcU2+F8BE8sLWCIbHdzJgMKi8cq+wd/tpC1v14gPy2Fd2TFFaRmFwBsHiMEUbkAv6gy
         cnhQD9hLWLDyWvsn/E2kMgR/r0R7jxzP0mqmWj9MfAZ0C60GDSabWBxubvNuHIQlphx7
         0tdgqMGRgKfUpCQ+cqlKIsSysd+q5RqzbrOLkSkj5Xi3Rf/lAdetPunhOJhoGPyVfsDx
         /czw==
X-Forwarded-Encrypted: i=1; AHgh+Rpt4N2Wd2GZSbzycLPGZrW5dWxebV/AeGkZexq+V6HruXIvKrh5EwcR/ZIHtxm44jLA/Keau/Zy6m2Iwg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhnzuem8knGAxGhPmOTYNFzVQQVsFIwSVEKLXMqW3XHgklqMWB
	ml9hfoUDT/psjld3y+J0YdUPLN+TxrJAyc+JQgmNP3wtPk3+3ip8p2jJ
X-Gm-Gg: AfdE7cmSNwt7M1S4ZooUkpfaAd2KxZ5A6hxQJ435Wwqh4E7ZQ3Uwt8phZPCBjUx1tuo
	rXgGyR75FJ12aRygMCUAEXH5Q5ha0G3ujmpMqnylCVvLR30fwtK8/P10wCuAWoK/YOdA4R1l3Av
	IcYVNZnzHeaRWSeOYg8CyNi2/jqGI1Ipf+vYxoQXPC9ZKYnw6iGVw5qgucbiW3mwvSm5+vQJYk7
	ewHq0OrnFP78p0qPpFlqlL0YhDR/J3FAq+gSUujvYGOYekIrl5rBlQd8Xbpm+bXBfOzfUwYBYV7
	R4H5CL70Mg9oHM4eV9vbrhE9sLLTZCme7CQi6sDQIIdWMFYaytaiBNJ0f9T1MZfQfKyN3X5vOcI
	SWBMJiQozkZ2A7BEFv1BSX5fg6iATss1oN2w3xpVyfXjbz4lz17oiP0VPRFI5M1NlSnFydz4WJy
	Khpk1bldPrIhtCZDq6ilnVOXE6O3E775LiTz4j1rjMxRX6Ab0=
X-Received: by 2002:a17:90b:3810:b0:387:e0bb:57f1 with SMTP id 98e67ed59e1d1-38941bcd911mr2524820a91.34.1783515197196;
        Wed, 08 Jul 2026 05:53:17 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:53:16 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	u.kleine-koenig@baylibre.com,
	kuninori.morimoto.gx@renesas.com,
	christian.ehrhardt@codasip.com,
	Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Chris Morgan <macromorgan@hotmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Rosen Penev <rosenp@gmail.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Teguh Sobirin <teguh@sobir.in>,
	Val Packett <val@packett.cool>,
	Luca Weiss <luca.weiss@fairphone.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 22/24] ASoC: codecs: cs47l92: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:59 +0700
Message-ID: <20260708125002.202515-23-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708125002.202515-1-phucduc.bui@gmail.com>
References: <20260708125002.202515-1-phucduc.bui@gmail.com>
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

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs47l92.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l92.c b/sound/soc/codecs/cs47l92.c
index 868237bd6d91..07bc303d9797 100644
--- a/sound/soc/codecs/cs47l92.c
+++ b/sound/soc/codecs/cs47l92.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/device.h>
@@ -1892,9 +1893,8 @@ static int cs47l92_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1922,9 +1922,8 @@ static void cs47l92_component_remove(struct snd_soc_component *component)
 	struct cs47l92 *cs47l92 = snd_soc_component_get_drvdata(component);
 	struct madera *madera = cs47l92->core.madera;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	wm_adsp2_component_remove(&cs47l92->core.adsp[0], component);
 }
-- 
2.43.0

