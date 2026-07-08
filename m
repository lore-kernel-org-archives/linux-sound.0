Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790C6348C5E
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 12:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515111; cv=none; b=DJpxbVygT7U+Twt6rb9+cah/SJsl7WN2LduPJTmu6AEep4fOI41tn5bf0Rb5ckTZnRreF5g6zHqL08oZX1nNefhJTMV7cgxoCOgoSmesO2YkP0LL692ktN5pqiz/7TBqphpnZqCpJti1I7j9CFczWCqoX50nPqCh5WnskAao7D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515111; c=relaxed/simple;
	bh=sCVUN8gY1h9/nIWRmRiilIKO/UTVoTdwN5d1OfxbJo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DO8p6zQJNNceGoGDSpSAJY2jProjxiyG8deZBk0CH087GObeH/GiB0OkHG3cKwQCK3YovcMhdel8N/Crt/xQqbv6+stuze8jlPDusJNT0Yur0dEeaS8ZcOCqsCGMO5It/7zRXKENvEtaXb6SxU9oeGXvl39gy3nvWU3kIpz37ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ishhb7Hq; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ishhb7Hq"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-381891a9525so790019a91.3
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 05:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515110; x=1784119910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TwVA092wtCUoFLf5EkOcxNA70xG1xrrJyEkWDUrUIog=;
        b=Ishhb7HqTCbZT23nG/5M4X7S+5AwxnbA+6pRfLpjqQE+/rPAzKt4Ql0LQn6a3hc90o
         kFnWAMOvJ+dWVhHvPZ2egGy3k37KxGTx2kbNyhyXnRhUf9rrpBazrQ49YEg9l9jf4OU3
         PxlLhr7RGrM0B4obXNErrSaosUu/wr84ieNkbWNFMCV3fpRNWep+T40oG1Jek24VwYHf
         C7RItB6NotCGM1QgUZOHz2LfE9lQS9KC7C8uHCRBcmStY7ynT54eMeDzNXwJQvFFt/AT
         x9W1RuvtaALZFHpxUnRKED4FH3bi5WWIHVFteR8Zums+NIRnKiLqqFd/b9HAK+7PqmYt
         hkhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515110; x=1784119910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TwVA092wtCUoFLf5EkOcxNA70xG1xrrJyEkWDUrUIog=;
        b=efWBdfnj9Y1yF1iC/m1hkyBnuc5ZeQjtT6PtqIrOm5EwyfphA43QTe5P0MiJbPo2A2
         hMmuH6GC9RVEeYWB3IQjFj0UaJYPWqGv72FH18j6nfueb0YjdxOXBotBhJGaL8/7oO9C
         FZ4IFQy4J4W8zrqD+8LiMu6k/I1fZpFwFzf/sNSIOsQMmBUytEnWLbhtDk+8HVSuMTk+
         5upDJ8E1T+MgGQavUunhSE20fUhfUONorBOz60Q2SyMTVXS6Zk1c62Kvm7bXeeogwd33
         6Xu44t0C9nzUx1SLwW4J6O8pYYtYH0SOiCeP2LF/MFyyKwYJnzEfvvFgN4QIf2HuWxrc
         fUIQ==
X-Forwarded-Encrypted: i=1; AHgh+RprZ7dvX58IZ6eMEPrRB457onfg03gybmjvK7gnkRmK0Y94V9l2l8MVtZG+Anyd8kjjWcUjB5faYw08bg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy58S54TtS3j8Xw8DYieN9pdvteD00yeOaWXgV8Fs7uiC+WeCfw
	yPb4ArOQu5fHeQRecE1qS84khe0c/Y6py16NY+ABYrOrfRHegL8ApHwB
X-Gm-Gg: AfdE7cmzw3y3pI/3zIYCQ2zuokRI0d5OThoEltYcV4ojMoCqAg8bvkFA3x06wslV81b
	XX5IQzGhsACT6z722t9grOHf0pmXEM3mpvjSUf7ibAAJ1v4dCBMafsHR99/AmzEsU1uhk9JWfBn
	80Q7IDwYGtAppZeFlT7/2e32mBqRh/xrmN9ehdYHNpp+RzkoYmgQmHwnM6nAbXycUKPTT/tozY2
	l1Csn3PI74/XPv6FCDgdxXIwUTbpuHw3TyZiQLE5MgfmCgwwZhUN9QXSs9S9joyCWmQm58mT/7I
	qGttZwrAdeLcxdGu2eYB1z/yjE+YAUHTxFVs/M+USHzs3mBL/yrHszc3IOxu2popuwHYT1jwyI1
	B2eDwtt9aDMxZoI6IfL37kp+sMPwsiT7Gceg/metdfWyyCGMkYCjUMUx2UM1k9fTjbCEgeMCwXj
	nfzvuXhbiRQwI36mIU5ZMshLZbSUTGkqjKmtSYkJwDiv34MbYDuiX4nG45ow==
X-Received: by 2002:a17:90b:4d88:b0:387:e0bb:57f2 with SMTP id 98e67ed59e1d1-38941bce1f9mr2462310a91.35.1783515109926;
        Wed, 08 Jul 2026 05:51:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:51:49 -0700 (PDT)
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
Subject: [PATCH v4 10/24] ASoC: codecs: aw88399: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:47 +0700
Message-ID: <20260708125002.202515-11-phucduc.bui@gmail.com>
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
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/aw88399.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/aw88399.c b/sound/soc/codecs/aw88399.c
index b2ec3503f7e2..67ea073abdb7 100644
--- a/sound/soc/codecs/aw88399.c
+++ b/sound/soc/codecs/aw88399.c
@@ -7,6 +7,7 @@
 // Author: Weidong Wang <wangweidong.a@awinic.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/crc32.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
@@ -1140,9 +1141,8 @@ static void aw88399_startup_work(struct work_struct *work)
 	struct aw88399 *aw88399 =
 		container_of(work, struct aw88399, start_work.work);
 
-	mutex_lock(&aw88399->lock);
+	guard(mutex)(&aw88399->lock);
 	aw88399_start_pa(aw88399);
-	mutex_unlock(&aw88399->lock);
 }
 
 static void aw88399_start(struct aw88399 *aw88399, bool sync_start)
@@ -1702,11 +1702,10 @@ static int aw88399_profile_set(struct snd_kcontrol *kcontrol,
 	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(codec);
 	int ret;
 
-	mutex_lock(&aw88399->lock);
+	guard(mutex)(&aw88399->lock);
 	ret = aw88399_dev_set_profile_index(aw88399->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change");
-		mutex_unlock(&aw88399->lock);
 		return 0;
 	}
 
@@ -1715,8 +1714,6 @@ static int aw88399_profile_set(struct snd_kcontrol *kcontrol,
 		aw88399_start(aw88399, AW88399_SYNC_START);
 	}
 
-	mutex_unlock(&aw88399->lock);
-
 	return 1;
 }
 
@@ -1939,12 +1936,11 @@ static int aw88399_request_firmware_file(struct aw88399 *aw88399)
 		return ret;
 	}
 
-	mutex_lock(&aw88399->lock);
+	guard(mutex)(&aw88399->lock);
 	/* aw device init */
 	ret = aw88399_dev_init(aw88399, aw88399->aw_cfg);
 	if (ret)
 		dev_err(aw88399->aw_pa->dev, "dev init failed");
-	mutex_unlock(&aw88399->lock);
 
 	return ret;
 }
@@ -1975,7 +1971,7 @@ static int aw88399_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88399->lock);
+	guard(mutex)(&aw88399->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88399_start(aw88399, AW88399_ASYNC_START);
@@ -1986,7 +1982,6 @@ static int aw88399_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88399->lock);
 
 	return 0;
 }
-- 
2.43.0

