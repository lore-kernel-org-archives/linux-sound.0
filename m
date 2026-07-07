Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F51D3822A2
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 05:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401215; cv=none; b=peDrdKXNjEgaZc7MDLiChMX1s85BpUv8hQ80uNE/N8t+ogZVXAvJohI91ZN5tWOvEtYALxbLgKjKVu6QfovtluiFYHnxcKd9xDurcPDgCSmRLTBGwUhgVMTCC9A/bZPZE19YHkpbA3Z+XgJ+ATYIxZb4KSjNXaCXEW7U7lOfV94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401215; c=relaxed/simple;
	bh=U8XvbxSxSkTA8/Iu4yHaWeEwL/aIo8CQltei/BWFXwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m2qkbmNI0LqIspJeCAmLJp6e6AdcwGpABtUZ8uMu6ZvpKlqYO0s2ULrwWcyDtR5Ply9jpZ2YXxkvx1HEiaZz/DJA4i8L4OY2Eq4U2ls4RuxS4dqfRVMQVvO/MwyC/WKB4w9JYduEyJMEHseBkYEbWUyfsWCTbwO0MH3MVF0mNWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A40I9swO; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A40I9swO"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso3751319b3a.2
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 22:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401213; x=1784006013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ov7owr1xn+j7m+V91q4r4G+6t07sw41en2G6nbW7Mjg=;
        b=A40I9swOz6C97q0B+rc7KpCgYctiDcW+ItlM8eF1t57szztHSJf75yy/MV6AN6z4Dh
         0Eufpqv6dZl9874Q+Tc0B1tf059mLXai73pXqwrvHF0tNcTys4SSbq7CItgtkGR0iHnU
         1XkvCNpcgf8anZ/gRqXtWcnoazylk/Xw53Wxt5oLA1YJWj/KrYHt3UkAphUNG3l9ERBf
         hDqFSDDqsuPI4bBubMpYfNVYh0N51x2Epm4T6rkvw2fZK6+qZZk1iSfF2J7nfGO4BeEH
         WxJtm8o9gjAt/6PaE0Xi/N8L64a5rBFH7/aCeMPdlS8HiMx9yqIA09NWM74kk/GdHARa
         rsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401213; x=1784006013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ov7owr1xn+j7m+V91q4r4G+6t07sw41en2G6nbW7Mjg=;
        b=BQ7RUyNsxa9uN5ZE/lgJBMNhd6spgeuV7EOxv87N5D5lTl163eLqWvCJ6eQJXMbKz1
         pBm4+07kTIsa7qlIqh1KsYgDsJg93A1lXcVFZdpiOFQO56jFUE8zlGBpk9QZ8nCQn9cN
         R0MdmQCGHcNsgaGrzajSH3TFxzmYPTumBeo4onm9o1Ur3SthGTUdUjsiRlQxMtkJdlFx
         2WoER3pg+7vhGKacrsgH2Avf4pGafB3st5p4Et1K9xzx/kDGOYS31gP467AlH+IuWBvM
         U7jIyAGI2qzyhaTLhyyNXppkpUCpCeTPfN8XzjWj8xCD8wYfWiMSyneWy7yhNeTJscRm
         dpOA==
X-Forwarded-Encrypted: i=1; AHgh+RpJWytV4pcIlYotamdWOJoHHclbkdw7DHW+8CxRdu2JDLKU1mB7EfEZjq+bDzE58K8fATeOsR6cIBOHTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YysVAplqCLZK72BWssJ9QwRUD8E1da0SUSF1NnlZ7q1/KQyckXV
	rFo4GOIf3zltmdW+p2m7qR+ako1Pf1MM2B3uyCcW/0O8Sc+oaPfNpkI8
X-Gm-Gg: AfdE7clXxYudJeVauDqBivB3RmR47MQau/Z7wOyZ1U1HgHXmm/KFJQkiPUnsaeqmDof
	ENDBvDAKhhC9a2pcdLyyPuTcaoNS4lYRQPR1xgzYyeYxpyzO3JNiNLaTiqGzYAD3O7mT/6s6H7k
	5X5Ye/PJobHO3Tlc7IxaQU0vmEXp7KtN8KR8goboJz00wnS+xDZZzELq8J+0q6gErCDnZtKoMEX
	EugNzfYXoRg7YGzP6AfCpUuBEWrrsEoHKanoTzU3YeYItdnihLrPs6NpoSWp55iNfibq+Xj1xjf
	xcjAZXmxH+j9Fer0fkR3BbQl6li5CPxudKBp1yoZb5tOTRrFsBTn8dez1nw21cqxB5cvNvSpZNG
	sjt6lg9p95JDgWkLeymausMcO1suX4xw85Ugx3H7w6xsQ7aN9fmRiwNzwqoe5FQcov+ZUURwt8C
	Ihrxkyq9am3ZrX4AOUKe1DxzpR6PW5MaiNKj+UzT46QRafvLI=
X-Received: by 2002:a05:6a00:3cd2:b0:848:2f84:f428 with SMTP id d2e1a72fcca58-8482f8504c4mr1181064b3a.65.1783401212749;
        Mon, 06 Jul 2026 22:13:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:13:32 -0700 (PDT)
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
Subject: [PATCH v3 18/24] ASoC: codecs: cs47l15: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:10:00 +0700
Message-ID: <20260707051006.20058-19-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707051006.20058-1-phucduc.bui@gmail.com>
References: <20260707051006.20058-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs47l15.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l15.c b/sound/soc/codecs/cs47l15.c
index da64e0a1db28..2f30dd834709 100644
--- a/sound/soc/codecs/cs47l15.c
+++ b/sound/soc/codecs/cs47l15.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/device.h>
@@ -1285,9 +1286,8 @@ static int cs47l15_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1317,9 +1317,8 @@ static void cs47l15_component_remove(struct snd_soc_component *component)
 	struct cs47l15 *cs47l15 = snd_soc_component_get_drvdata(component);
 	struct madera *madera = cs47l15->core.madera;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	wm_adsp2_component_remove(&cs47l15->core.adsp[0], component);
 }
-- 
2.43.0

