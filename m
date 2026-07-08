Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBFA426ECA
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 12:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515081; cv=none; b=LA0jP6DIXqhKuTEynvfN4XQzRbY8/9Q62PF5JKB5werR7EJg0XqkiL6YTl0fB9uW2d1s1hC1NsLVPCT1Acu/nuWRLzX7F2d5JJhWcYd3OQBjFEC+/w65eEYzZ4licrKMyJwqizuRmZ1vpEHQC/L2ii4zyaXACOyutzu1Uimd4v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515081; c=relaxed/simple;
	bh=mG5pRpfRueqPRsS1UnGChfxPg+7TVAQuLlVgN6Molhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l23uQw/aJJUWedgK7ib4s71fD4jp6CRt8yEVf+eoSkVR8pBgHCklo08kFXeJ4Q2OEVz9luoBudQU3xloFC04wg6beMO94rPfihCKJ0w0O09XFI/4AbCK8qHY0vBteNdueKoPHVPSgm2/ZogoO59JhACAXzXvmhY56k1MZB6w1mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kwrK/VYG; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kwrK/VYG"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so518511a91.2
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 05:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515079; x=1784119879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b7IGUH0VtQ7qJ0ccJyHWYquIdmNZndl5qSSw0oJlA6k=;
        b=kwrK/VYGFKx7uLlPGbK1kXLayGkkze2taSXm7MzMHKorwvVn5WAWo/wB+8amE7TZv1
         mUHoG5Qyp0X8uPLy4OJZpWPNzjgakNFh2AbxbYJ8Qk86ObGnVk+O56lNTSP4cuKPvGb9
         iLBdItUE/Y6MO1fF3VrqW3ArwQzwau2mpssLoqBvK50ZkA0urc9hJ6BXcsZSS3b0gDmA
         l0UWUUuGD2PLgcr9L40bLfr5rNj58lWnfIhKRqml2BYqTyGluuDB2fOTCxS+hBBJgolz
         IrtVw1+waWHHLQYye1oliLTgRpyU3THZ8XcXQ5RQ8n4PuAZgu28AB460t99UFsRV2tue
         kAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515079; x=1784119879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b7IGUH0VtQ7qJ0ccJyHWYquIdmNZndl5qSSw0oJlA6k=;
        b=sGKeg/ekMUavaWEc5gjrxNbTOj5HjyqrO8CRI58PuoenNPz10PhKfQ44KcGljDR6oi
         lLlHkPdjE4bbQB+b0MXXbs0/4fx4usijPPg4WdgSZ94GGCyMz3yrBZmqoXmro9O0eTb9
         uBCO2MFRHO23C4TEuf0PjfutTY4D90yPP2kLMhzyngJ5t6TUHyT9TRW4O/UmgRX6I23r
         Gv7eX6MygFP24S+rzRoWJBDf533RUnqP55EFscU6TP8kWDw1jJ1uCvU/1heNB+U2Mhhb
         m8LdXpn2RVtS0KiO3NYHmcoASiN3PIp53U68Mw+gJWxt5+QyRsW8+dpwxJQ49eTN6A0h
         IO7g==
X-Forwarded-Encrypted: i=1; AHgh+RrVPoywp3fNgm8e8EK1YlJ4OMxLszz0ZyT5HdaP3/1SNwC/WRvcxLmmSh9tFipfYZ+oILvVHSEncnv0mA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzfP5RAiuXzDxRY9wo0rEgIHx2YvgLrWoMd0FFyVRT6GJWkfp1
	NzYYOH99Vanqf3Rp5emxvu8JxP3IZOyATVzr/l0xW1rxEN1ODcRnc9Qu
X-Gm-Gg: AfdE7clbCvTXibJmiPzNDVXS3tt9vBPr2YEKbjjgiNwSbE8Fx+LtPra1fYyK1dhuWZn
	CS4Qp8AJlNyTwU1sppRzfEcmZXhJ3SbNksFVNqI36PXbkbBh11/L5hnOB4kH91yLRflAiw+iSws
	sG6L0mgTOS3+Kl1fFjF6KnXTMo1R26U/JUfW0h26HtmlC55TJi8KsoamV1K+Mvsnv9KmuEC3+Xq
	HWLUQEk7lptwURCg01ub6+Ktr8KE8OvyuJxIhEoodSs0u+6cdlWD7DuEY4upqCSeRZE3ZXhSF6P
	YRyWO26GaeY/IRxGW4dCI29iJMPGgg8DIcLg0//Rc6TTFpGEyXsy67Gz3b4jR/aC/GQkaZZZLZD
	1mxojuqh8NgdQFoWEH+WBumeQ7Z/RIKgjHGUD1JQVoB+5m96UW5+AJcarrrAjk4axdaz3xaibRn
	9MFX0m6o1OQysLJKUmv3k/z0eGJDnNX7gFujbTyYGVyQMt3Uw=
X-Received: by 2002:a17:90b:5605:b0:381:aff5:aa0a with SMTP id 98e67ed59e1d1-389417e5213mr2326476a91.23.1783515079058;
        Wed, 08 Jul 2026 05:51:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:51:18 -0700 (PDT)
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
Subject: [PATCH v4 06/24] ASoC: codecs: aw88081: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:43 +0700
Message-ID: <20260708125002.202515-7-phucduc.bui@gmail.com>
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

