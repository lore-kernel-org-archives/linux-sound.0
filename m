Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B644437F8DC
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 05:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401085; cv=none; b=ISQ3omIkjVR6Fq+YcOKiWeVGjv4qSrlTR0sLdDIyq/bh5FtPvHTpuZVkDtX/zO7TyrSD6C3ZTQuZAg1gAexFz1FEM9aITS59WJ0Zcm12nBrXQUxyxjtC6iJLmR80ZfMno/ZWCl8Hfv/B2W+U458yUJGNsSxP3B+Q85pA/4W6jCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401085; c=relaxed/simple;
	bh=mG5pRpfRueqPRsS1UnGChfxPg+7TVAQuLlVgN6Molhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p6YSDHTQFNJjzyEpRukT0jsgL89SlmzdL4en4ip541fKAM3ZntSqB5qXn+SIytEPGAhNbxXdgySr7K8uIzchvzlNOjC48bVNkrFjwgiCrgvJWY91dcxeD+RaiI2fuwPuhqhSJuMwCxH/CIEWbUvB1AjdcnzfusrtB+h4tnK0v8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hMNGMuUu; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hMNGMuUu"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-847a483e344so278898b3a.0
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 22:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401084; x=1784005884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7IGUH0VtQ7qJ0ccJyHWYquIdmNZndl5qSSw0oJlA6k=;
        b=hMNGMuUuMzx4wLFoPnTgZp1c0yN1vCbLKknmFgy/8aTHv320qkbqILawRLl4qfut9z
         UGXrnVAXTDdxS0YKH8SQ5qFfkQREwmKmaWRIMd6IMo5W233Tf+aBfaM1rB702X965jM4
         eHGLNX77m2GMTln6CBx3XqrxxUJeCdYkJX67peBevfW39BkksF4DcWJxScmV1xletg4X
         UNq0IQTWiruyxkQ9rXKPRGu7X/4GyDEGVOzPyfoap6YIbydeWA4cjuHu+FGYMEf9rXXr
         m2YN75ZIkspZTrWWla5+DBDWMGI5QPeBUxIMgLAnWXdx7/XjewB8LoIhUlX2SaECafDU
         Rt4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401084; x=1784005884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b7IGUH0VtQ7qJ0ccJyHWYquIdmNZndl5qSSw0oJlA6k=;
        b=WEpBFn4MueX6IYOS+a3LHtOp4z62WLnKQk8QXgQVP1eCDt7JGgR0nlaQOP173unkXn
         lDDvqmFL2lZYo4bujYP1tkpjMolQYDP1ZY9DASpt3ZMXwLsxZsbuBs3PEshjX4EguM2D
         2LPs1yuw5PRPnjeXxWkTUTY4zvLdFOeDAYv37Xf1Kc7CiicgRBPpNS8kiYlkvEQ3cjj7
         s/vNA5Xb8v+xxeASwKwuf8Y/O6MBLkd7T4gyVOW6cr3LnfXUhDScEAyxtM9eTT86UtdK
         iYY9mVWp4LFHl244zLWs0Ie9YT40OUuUCnl2yQH9Zv6l2pTuhRbLb8CcSkuVi7Q/UDlR
         6YRw==
X-Forwarded-Encrypted: i=1; AHgh+RrGtjG5xJJgAxiRDkltp4uagLzuuE/8n3nh5gQ7Gv/xjZvtmnzWrUj3k5LyYkaaN8XW8j28YypPBDAP5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNd7YErZ/Y6hyzBAB2rYjoeQsMMO9W5ka+h95V0IrqcknXhDcY
	OYY00rF1htZisdHDNHqWC5FmH1r9VA8rir54Mh0mBnbWEvQoLg795voN
X-Gm-Gg: AfdE7ckWON4CYjMwnig8MMuwzOoKI5PxdLT5qo8CVSV8TSejiCYgDOyJ6am+3diH0nQ
	AMzaB6FWikSAM2u7r2XipfJbF11fGNISjp7QAhUG9AmMFKdBL4tENLkV5IMsM0104ZEiG+kcBsP
	H5eZETdlTY0rKiZ9113RnXYclk7QHPhlee8m5R0PXAQg5ybj1gqYbw3kVkIop9AGLblf0dMUJXl
	jJ2gQUbeQ89fizVxQ9WG02V/A9hgW3j1YYv+b3fHkK+FjZ7qa/a+Mpjo9pmcZRvfNaqv0TmVUkY
	71c+WOAvMw+Op5GLMm3QHtqBJp+jXDZY8TcCOcvdAsDPMcnwnpmPgwNNOiDry71JDF+/jUPb/34
	C4GIyhngp6LfX8IPi4aE3h3Cjf2uwYmaWF8IVSrYAsQCMujD9LZ8aCjgW9LA54j8UfVsAYEyO5O
	mLY7do7eTm3rZPtDu4hCOUh5a9VLQLQU6Gh7Kpxc7dwLuBHXZ6OIhaeelwXw==
X-Received: by 2002:a05:6a00:f8d:b0:842:6259:5e2b with SMTP id d2e1a72fcca58-8482f5305a8mr1211855b3a.33.1783401084160;
        Mon, 06 Jul 2026 22:11:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:11:23 -0700 (PDT)
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
Subject: [PATCH v3 06/24] ASoC: codecs: aw88081: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:09:48 +0700
Message-ID: <20260707051006.20058-7-phucduc.bui@gmail.com>
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
 sound/soc/codecs/aw88081.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/aw88081.c b/sound/soc/codecs/aw88081.c
index d5e886a8f106..a3cc027de606 100644
--- a/sound/soc/codecs/aw88081.c
+++ b/sound/soc/codecs/aw88081.c
@@ -7,6 +7,7 @@
 // Author: Weidong Wang <wangweidong.a@awinic.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/firmware.h>
 #include <linux/i2c.h>
 #include <linux/regmap.h>
@@ -763,9 +764,8 @@ static void aw88081_startup_work(struct work_struct *work)
 	struct aw88081 *aw88081 =
 		container_of(work, struct aw88081, start_work.work);
 
-	mutex_lock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 	aw88081_start_pa(aw88081);
-	mutex_unlock(&aw88081->lock);
 }
 
 static void aw88081_start(struct aw88081 *aw88081, bool sync_start)
@@ -942,11 +942,10 @@ static int aw88081_profile_set(struct snd_kcontrol *kcontrol,
 	int ret;
 
 	/* pa stop or stopping just set profile */
-	mutex_lock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 	ret = aw88081_dev_set_profile_index(aw88081->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change");
-		mutex_unlock(&aw88081->lock);
 		return 0;
 	}
 
@@ -955,8 +954,6 @@ static int aw88081_profile_set(struct snd_kcontrol *kcontrol,
 		aw88081_start(aw88081, AW88081_SYNC_START);
 	}
 
-	mutex_unlock(&aw88081->lock);
-
 	return 1;
 }
 
@@ -1165,11 +1162,9 @@ static int aw88081_request_firmware_file(struct aw88081 *aw88081)
 	if (ret)
 		return ret;
 
-	mutex_lock(&aw88081->lock);
-	ret = aw88081_dev_init(aw88081, aw88081->aw_cfg);
-	mutex_unlock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 
-	return ret;
+	return aw88081_dev_init(aw88081, aw88081->aw_cfg);
 }
 
 static int aw88081_playback_event(struct snd_soc_dapm_widget *w,
@@ -1178,7 +1173,7 @@ static int aw88081_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88081 *aw88081 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88081_start(aw88081, AW88081_ASYNC_START);
@@ -1189,7 +1184,6 @@ static int aw88081_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88081->lock);
 
 	return 0;
 }
-- 
2.43.0

