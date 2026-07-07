Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BC7382291
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 05:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401146; cv=none; b=Tvhg1dbM0iyfS2G95Qv/K5TdueCZhv/8ie/wkYY23zGdu9JM2iHDnzhn21cs9Tz8QZs/3wplslgOmbyfyXcs1HOLokA8yTRnjYR5P8cYgTC1RZ1bBE2ZBOauI+Wa/ysZcY0v3iCOXi22F6og1DvvVAut/nGPKjV4/3FS9hG1hmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401146; c=relaxed/simple;
	bh=sCVUN8gY1h9/nIWRmRiilIKO/UTVoTdwN5d1OfxbJo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EbJC9xPRIuHLr7SliHmL49kY2ARwObhr8whKoNg4PP1IpY5Gbg9PjN72wAE9XEDR3q4QfvNQ1XLOUYrA0VYUtf1T2s7V/bxGiVAY5phxwk6JbHurqUCqtRf3N8WBIHgz8klSq7TLZL3NvHmDYx2e2XLwkdjwiEhAhO9U/buUz2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pxGjjeX2; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pxGjjeX2"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84347ad88edso5058640b3a.1
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 22:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401144; x=1784005944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TwVA092wtCUoFLf5EkOcxNA70xG1xrrJyEkWDUrUIog=;
        b=pxGjjeX2nW7y+dlhZrbWmi022AXlLvU+q3cW0KZ8VEBg8C+fN4eTcFQj3Arv9ePS9f
         Q9PF/mVc0m1SbYe/F3arv6HLvyf7S5Neen0oITkBNrnoUXq9rP+DGc5494+mTjc3pISp
         hMU7NU3SR8o127KkIunmvrwoJRHau/eBpNLV30NLd+5qmowmD97hT2fuaGKZCrts+3gg
         dWrN1ORvwLM27tfkKryVIEQxjv7PtRooEjJ8EBB3cNVvpnmembXfQkB3dJL04i6krxNq
         ktrFuXbyLlTi06C0w+WghgC8AYrfkpBAPZJj1iVyxrPXkyy4kW4NIDXs//9nxXYgs5Co
         +AFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401144; x=1784005944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TwVA092wtCUoFLf5EkOcxNA70xG1xrrJyEkWDUrUIog=;
        b=Ww01tqVpGjHRsZEPB/bdmiHRNVVwaJ20Jo16GExo+2DSRSUyNUyceq49KomT69wd/u
         8Lk7Uv4l/S+1ByDbIdbHDRbvGJjSafKHdKdhjBclICSDc70j1Caq3coilLVKoSyhZRH/
         L7vSNvoVx4wZhrekIJz+p4oMrqq/euhpQD+tzrWwMxtESLCn4wA6O4uXJMWPYG5LYDA8
         70gssCz5pJibF3ZiOCB2NVWfuQW1X/PxY0Ds5RghqoEXQKRiVc7gOdO7tqIG/S2NKlFS
         JXaPaL8nnpnU+uUSnDSy4v1LsHpXJUMhgrmgMRDKaue5OLUWnHQeMCQbDbbGEu2de+sP
         NGFg==
X-Forwarded-Encrypted: i=1; AHgh+RqFDhTNGxaj/Yi/qEJJ5oLep9SZ7Cb4Bs8EgtWZI1ydPH773ooW3wkIlCSlQ1SvpfOCLx9H5mKSXCDNNA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqa9QBQJEoqDXUZkqk+YQVR6X78uZylArMR7jFbwJbS6Z6+q+N
	XvrUTEXg0vFgysq9RXwdQJY+4Saix51DPufqkCMBYFsE7Hfj4/l2EOqC
X-Gm-Gg: AfdE7cns1rqCb5EHrrV4UF+YZa7LherDUO2YsJePLy9Oj/Hrd9XTVHGmOcYT88Zax6h
	cV+HB3HSQmPfQ5AQmgoFOlBgoi3OhJWNIoRO4MVvs6mNWlTNAlpuC3HNd4Qy479pu/Bn9gIVAHd
	lmJZTay9Wv3YPkri65qhL5W/3bieQaZyKYXbJjLZq96aHuH+CUP6K/2XoWJ6cBxdDNKnYRgmMR8
	ymLJc5YaLRKBLhMDcn9/znQsNAXXJ+iFDMqr7RQgyxJ/nxsPpzn797oTEo7wtCpN17KaCzP535c
	O491ETPvDZR3x2rk6Zs9YP05Yp4NamE1yZbhT0MHjj2JCJ8/yz4KLRAL3jZw9cH/Aj/2nCEFFCY
	fQZYeRsnDxUXB2KV3BkGT9ikvURkc5lo23qKluzcRaoYN3rLxMiwDlaTYyXJraeaRDheITzKaN3
	/n7GuZ+r8zr+Ibejpk15qBgmazk2qKrcOtFJZyyu4sU0SbQOo=
X-Received: by 2002:a05:6a00:2e23:b0:845:d284:9e10 with SMTP id d2e1a72fcca58-84826e37c82mr3735337b3a.55.1783401144297;
        Mon, 06 Jul 2026 22:12:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:12:24 -0700 (PDT)
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
Subject: [PATCH v3 10/24] ASoC: codecs: aw88399: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:09:52 +0700
Message-ID: <20260707051006.20058-11-phucduc.bui@gmail.com>
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

