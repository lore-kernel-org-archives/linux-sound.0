Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E6943B6D5
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 12:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515090; cv=none; b=el5An/zsnjsL9RxblMjQkDQAjD1Z4JsaXmUe6af/5v6AQkGr7yk2WamIs1FBE0A6Q6HhjuXxdGdRVrDwoQZY7IRYC+3CAqBV63Wep92Cna+zZ6ydikxQhYikQ+v0lMhRuNzvF7BFB5Y2lMFEZ8YHDR56ZPRmEQZHiPXoS4UhyS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515090; c=relaxed/simple;
	bh=6tATyni+4XjZvBeBIaoW6a1jvZmc4iKytcAls52Jz7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K/zRxyfdAy58Lk4hEipRGo/QAeG80x7iADBC48uodOC6zQ4hN/4Xwc+h0ZQa82Bw3TTK/eozJIWOYxV8/Q8pktxQf4i5i3Jxtt7Bl+o2rjwyHnKBH33oQBxRH6MdSQRN+41AChuUQxx5jgn14pghKN2LioP1kXSG9Lu92wOv3Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DtdDyZGm; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DtdDyZGm"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3804e42ad5fso633004a91.2
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 05:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515087; x=1784119887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tT+JnYbqvqAEcwKG451SaW3hW/30F9TBA4BNUGiC6ps=;
        b=DtdDyZGmmXAHD2hxFECI234E6nH7tTR7mazaLeBhptxCHlNtdpJRaS8hvTFOS34B3i
         NuZABMiqCeU26j19XsFIyl83KkYfB7dH6pabeQwabfUuemNdycXCtR4nk1921oFyxz6I
         TT23IKdMl4QTkMp4xqjBhMImdWyKjFJNYInK5dXhS+cE0Y4iEw8PVc6RRjC6muZ0alGy
         CXohTle+7+RgrsV/vByQj94/P1M4sln4KVk4JoGEUHudyjs1+D1h7VJC+zMvB9jrjuf7
         tubx7Z3VSApZZLX0a6McqJbtF12JAhJzHQF7WfJEQrQ+cGgjIJe6rXRiCIqwUWfF6Uc2
         THbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515087; x=1784119887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tT+JnYbqvqAEcwKG451SaW3hW/30F9TBA4BNUGiC6ps=;
        b=lhoKh/CqB/3KRf1gG1DPyTplV6iagmL/zlPvf4bUzlUeK2jSiDdFwEDf+j1avbTPkI
         JlMlCxZ1L692VTiwelrUj+PGATbgwslImE97CT3IC5tlX4AfWDTVzkwIU/g4VMawbElU
         PYOVCMk/+GUnriaZGB+46smUrQ1x3oAGapyENCej/d2ZgGaJ3T6fnyZNtGi9658AhhMA
         9M406BsbXlJgFsPTcwHwqjXtgEK734xKaUYUh3SqvUBv/PFvHdnX+ICbG/H5LHWrUFqF
         VEJPWjmXq6ye751yxLF5XjCGQBU9b9WND7IbuW02kE6v7K+MzneJFE4QTgWAbt/xgot9
         uG/Q==
X-Forwarded-Encrypted: i=1; AHgh+RopLpzmSxXGqYrhvaMeUZ++SwzPEnAstI2cSrTfckZXzA2+hOdVL4GZDozBgRvmbLKL16qHMse+Xc/V4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhdH04B3gosA+iXeH91wlEfvfMPuHNqyTujXL3gKkl7hcjI/O3
	u4rCtm5oOWTx1IAYVO9Dr2lGVihoP7cNeTWZjrrngEs5KHDhdek5fxPb5GV7+A==
X-Gm-Gg: AfdE7ckIJnTDDWEi5l3ge6TXWATy6JxrlFadxFzZ+NYd41LdJtUTUhsTOiuI7BaXgQ0
	C0O8XFoABFeKSFvk0Nwo9ZGU6vMYL3sAD1AIFS9JNXhw2yqsDnHoipU1MpcBBHSK+d+SX8gYenY
	6i7UAIqHRozLfa63EHVO58doj5/OCZV37jCi9p4SOud8TkDYlGXXjSSlg8r5WgNfPf8E3GhQNCb
	Jhij+L9/QZHEdvVM4RoBfkHyjprxHy/c8Cz3DpWYfzsH4xj5MgQCpud94riLRqc90qowZbj6jfB
	7/9JauMW+palnutDSDEHYZdCpxfgqkNVNwurzUkBlSUEN7sbW2LVyJhqrnWB5sdakr4c7LRPXVj
	fQRkW7PffbRf5+I+E76G4jep/wsxJyangcJmsyF121F9a4xe4+nt1Bbd6KY+ftX5bJLtVt+S3Xc
	TfQtPQrL5YulTHk2XFqvdfQeKWhIxVoYwu5FFof/TIbLp+DuE=
X-Received: by 2002:a17:90b:2d05:b0:381:29f2:481b with SMTP id 98e67ed59e1d1-38940150106mr2628890a91.11.1783515087138;
        Wed, 08 Jul 2026 05:51:27 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:51:26 -0700 (PDT)
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
Subject: [PATCH v4 07/24] ASoC: codecs: aw88166: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:44 +0700
Message-ID: <20260708125002.202515-8-phucduc.bui@gmail.com>
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
 sound/soc/codecs/aw88166.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/aw88166.c b/sound/soc/codecs/aw88166.c
index 3f15f4ac51f7..b72f87f677dd 100644
--- a/sound/soc/codecs/aw88166.c
+++ b/sound/soc/codecs/aw88166.c
@@ -7,6 +7,7 @@
 // Author: Weidong Wang <wangweidong.a@awinic.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/crc32.h>
 #include <linux/firmware.h>
 #include <linux/gpio/consumer.h>
@@ -1173,9 +1174,8 @@ static void aw88166_startup_work(struct work_struct *work)
 	struct aw88166 *aw88166 =
 		container_of(work, struct aw88166, start_work.work);
 
-	mutex_lock(&aw88166->lock);
+	guard(mutex)(&aw88166->lock);
 	aw88166_start_pa(aw88166);
-	mutex_unlock(&aw88166->lock);
 }
 
 static void aw88166_start(struct aw88166 *aw88166, bool sync_start)
@@ -1413,11 +1413,10 @@ static int aw88166_profile_set(struct snd_kcontrol *kcontrol,
 	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(codec);
 	int ret;
 
-	mutex_lock(&aw88166->lock);
+	guard(mutex)(&aw88166->lock);
 	ret = aw88166_dev_set_profile_index(aw88166->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change");
-		mutex_unlock(&aw88166->lock);
 		return 0;
 	}
 
@@ -1426,8 +1425,6 @@ static int aw88166_profile_set(struct snd_kcontrol *kcontrol,
 		aw88166_start(aw88166, AW88166_SYNC_START);
 	}
 
-	mutex_unlock(&aw88166->lock);
-
 	return 1;
 }
 
@@ -1607,12 +1604,12 @@ static int aw88166_request_firmware_file(struct aw88166 *aw88166)
 		return ret;
 	}
 
-	mutex_lock(&aw88166->lock);
-	/* aw device init */
-	ret = aw88166_dev_init(aw88166, aw88166->aw_cfg);
-	if (ret)
-		dev_err(aw88166->aw_pa->dev, "dev init failed\n");
-	mutex_unlock(&aw88166->lock);
+	scoped_guard(mutex, &aw88166->lock) {
+		/* aw device init */
+		ret = aw88166_dev_init(aw88166, aw88166->aw_cfg);
+		if (ret)
+			dev_err(aw88166->aw_pa->dev, "dev init failed\n");
+	}
 
 	return ret;
 }
@@ -1639,7 +1636,7 @@ static int aw88166_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88166->lock);
+	guard(mutex)(&aw88166->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88166_start(aw88166, AW88166_ASYNC_START);
@@ -1650,7 +1647,6 @@ static int aw88166_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88166->lock);
 
 	return 0;
 }
-- 
2.43.0

