Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401CC42E8FB
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 12:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515184; cv=none; b=kQYMvVVtyScjyIiXlz8O8annC45y8N4KovtPo2yswCdfda8PWxudQD6Iirs+VIQOlN0xhGsqvfZ/tXEMmVrdvNsSosyt2pjITcBBe3SHlBbCzdDzA7g/5lU5+krlOj5XUZpb7xv010lTeTZM2MRaCY6FUXuZEs8amFIsEMA1st8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515184; c=relaxed/simple;
	bh=myMc8cB5TZmyPAjZl2RU5Pqsd/fh0JTdU74J2r/32DI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QKwh6rAQNt1RO9HCpBzDodA5F7RFL7/Kyb+4rUvB/tPyKk2aU1yYJG3ngnNzI2pAfrfgGJ4s/6oJzTGbcOBR10WVIhFHKHs3tkFGQqwPGY+BC/oQkTjK1eAFtYziNj0zwRocpsH2oT3tgXpgq7iwm7iusk0h2mBW3FlUDkHFqHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qLo3ahRy; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qLo3ahRy"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso642192a91.3
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 05:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515182; x=1784119982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OMEdxrf5C54lrH2YSFI3RWWEKJwn7a/uRQ+uyEkXurA=;
        b=qLo3ahRyWYpm18O8MqGOqhHJ6+KrEqrG+BiCOUohHd6HZGj7dTFBtxkKwn75BYwksl
         4wagzL9ppwZ9f0QDscqdKAJ+UXpoUxQMp+mCnLRWICDUXmoCyOpZpKwKGH62gKNe6O/N
         WK13KMA4/R7GZT/Tblf7jrrW1HrDGJz7Rbzmd5wie3gMxhfoIxRz/PLez3nt3SFbBa9w
         beLwEjT4UQKeUEegEZprRYpWxJj3Ns9EyErUuz6M9JWsglfMWLLIOBBIbm4OGrLFwSuM
         oxhVvRRZb/Li86AMGtfhNkyhUS9pFvZ6/xDHtIf4ZouBLQbDaLni/cq0tY5EdJ2mg+uh
         DSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515182; x=1784119982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OMEdxrf5C54lrH2YSFI3RWWEKJwn7a/uRQ+uyEkXurA=;
        b=e3h29n8WgsiqFU2q64NEL2RqghEcI9HMvDi52H0zOkmdWmgA0B7Ee3C8Y9mIY+lf9M
         Rppbqhd8P5yQ3wo6RNgnwAm0xmKB1uUkPcmyai3shmSgxUAGI2v/lENFQlt1dkxy3rYw
         Q4bZKj5sETL8n1DaO+JJVJ1BrrCtKumV8/wm+yiv9uTzWYY2BnVOd0wvuNJ0Ip+pHWOE
         qPHUF2ZTU2GIoVuneH/B/JXB5ZyovL5lN0c9RQf2I8HDxiUiT4C/gABWGRGJEvOB78oX
         WVj73r5/x75m8m+bCoA5+Hoj6DrW/0PJZSgCK2bVjLJRD7+e9fYPmkBVZHt82kapREap
         kVlg==
X-Forwarded-Encrypted: i=1; AHgh+RrcnJ/RdE95CmNo+FyK+lndUpvBRM5QeEE4+dtgu9g5RQqh0X8DqKulsBaNnI+XutNQmJEzF8tGD5QdTw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/boXOe1GQa6gRU7KXNdoCTHp426BcBMHXP2bMwjIMshB/+USu
	8Gfyc6a0q51lLDDmGO9fCMH03dTs9a8w36wA8gLk6kJKhttDTilMlkFT
X-Gm-Gg: AfdE7cnfqNWAFxZULURDvrEm2cJMmob9D5mbj8aL/3v7pRi3V2r9Vkldfwgt5jPCSLd
	DzhHkagkb4HPoq8peQzJ/EPauto9saURU13/8KdT3R8lz6t2jvKRNLI3M3ILDfeS1mzs6J39vaJ
	DYXyDrrNU/jBxQUSPrMq9BPI3bHaPmOxNSmqNrM+cAOwlaVSCAn7rwT/haUIj+heOw7sMT8p7lE
	TilA++lkfxo/c8ztHgz7SBfkQrSevjofK5Etgjjo/d4dNUnCDgb6+TeEEcKtuvJ1wkHZTF+VBMT
	7dmKMYREddrYWn+FhSGGO/HF8d+A43FsTU1QBKnCuhjC55M4UAKXcmp9BE0iL1dIG10fnVqTFGm
	g1goNTE3nN6569uFXMHW2ihFdZ1ElzPnfXzaveUX5md0eZl7YJKj3NBnlobMal4itff+ADG3izj
	8hygxLkIvbOSJP+PBQNs/avL/85cEjnB/qEiHKZYVi6jsCh34=
X-Received: by 2002:a17:90a:da8b:b0:381:e74f:8a6a with SMTP id 98e67ed59e1d1-3894053d0b1mr2454692a91.16.1783515182657;
        Wed, 08 Jul 2026 05:53:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:53:02 -0700 (PDT)
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
Subject: [PATCH v4 20/24] ASoC: codecs: cs47l85: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:57 +0700
Message-ID: <20260708125002.202515-21-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs47l85.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l85.c b/sound/soc/codecs/cs47l85.c
index 42fafb0b392c..9ee60616c04c 100644
--- a/sound/soc/codecs/cs47l85.c
+++ b/sound/soc/codecs/cs47l85.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/device.h>
@@ -2504,9 +2505,8 @@ static int cs47l85_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -2537,9 +2537,8 @@ static void cs47l85_component_remove(struct snd_soc_component *component)
 	struct madera *madera = cs47l85->core.madera;
 	int i;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	for (i = 0; i < CS47L85_NUM_ADSP; i++)
 		wm_adsp2_component_remove(&cs47l85->core.adsp[i], component);
-- 
2.43.0

