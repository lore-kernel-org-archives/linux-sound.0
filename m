Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCB7364E80
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 05:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058112; cv=none; b=lXnm/JivI7CDyBgu72XVnkd7vQ64ieMyFKlN0wHOfm6lPdCUQ/uafFs6Eu5yMV8oKekuQAcJWu3IYxaPW7K2Mne0FtcAEsNKpSLfK1ZaJZ2ZOu5PYWfJozesYLwh7B3+n4fIEtk5HjvWt0guRZlo+87d46O/Q1Bc3qrC6A/wq+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058112; c=relaxed/simple;
	bh=j0DXGRVUZGLFodFFZDuPh1GY1V1OX5hMwJceQFENsgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ws1tR0rsvdCy0og3RhKJGPu1mox+lGvuLkBpyBcilG7JBTsoAZb214WF+AFGMn2fMzvCks0DMoJ/jGpH3K6MfWq88oAEwDr+zJrGEujzNxisJFcwgq9oFazSGq4tMOvUQyT6vZavdrkzSi6CZUZncx9JIHze/HalnP1/ymF/bF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjET+slx; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjET+slx"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-845c92bc464so134990b3a.2
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 22:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058110; x=1783662910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GIImJGUCMEYSffIizPuc32WkGD23VTl/2TOsQS5Pw0s=;
        b=BjET+slxHaYz9xXQMKTy6fHzK+jVchy083/gNpPeLjavdRi4hEteEZsaKqaqyXC6Yw
         kBGw0VY4Emuargk/uQx36Jd05O12IWhIvZqdN4PMne+eRf0M4qce396nNNF6kfZhjK3v
         9NntWopPgSvvgDjZ5rBZLGY0VQFEpKR9M5Xmi59MEmBdfaZxrHffuM9koRLdTSz1fx5z
         mKpKAwEh5C0kuDn8jaWujDOUrwimUz2+XFy7KoPaTClFmxVkhzkB3ik5WYllZLjOT1bU
         gIOVs6nrYYXIkfRK8p5VjFHFUlOoV6adgVU73z1zjlv96/ZF1BaxpdHL76J+zHs0uJ4n
         MWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058110; x=1783662910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GIImJGUCMEYSffIizPuc32WkGD23VTl/2TOsQS5Pw0s=;
        b=FriA1J6EyauY0ZFiH2Bvzjd338VVqsYkL71MtxR3lwhEIw8t3+RCoxLHIr37Y7n0OT
         SNIH/QsjxJk5YOsAYllPsC/vaxzBqbJg0DRrqc77BoKNLW07d6mKLlZSCTIRO6lL3WAK
         Mk/hGtR2u6giuy1oHicLy707A63AoG0btebYVKtqNycytc+L2ApzuvcK2bnjEV2r0CBB
         UcxS5JSsC1+6jztOaONH2bpNiMSqWANl6xKSrRcRcC68UDKYpxYvNwchg3zpAOR9lu9V
         yorFknX+XRCcUIQ0KNnrqSvsRWoCbPsQiQ6Pc+T1imR3/g+FKiq8lU1RwkBsd0wipm6O
         r/ig==
X-Forwarded-Encrypted: i=1; AHgh+RrjYdaPgVPYVWQOQS1nvZb7vo2VDS2iK0YjVccLU9tk24EBrDdK9etoJTS9PhPvp28XfX/piZtB/2wpUw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw89Jgc2mNQ/JoC9fmFoJv8UMV3zGtnzgeIpD9OMeFVHHJx1nPl
	+1KbtHkzx3i0kPWS0xYKbenH6VQmy52wgL7T43O6UwQr5v+WHPyTpxW/
X-Gm-Gg: AfdE7ck8LzO++10Jf2eiflHmHEregad738OAQkaiswapxFEcYwXV9psZUnS15CbMUQK
	augXzof6peetCb8FLE/oKlBNnG5mtzPq992rCQPHZxZckiR6q2snNpIvhpQ808WL/oMkFKWUGZx
	IYvx1D6BjKRvhmeQ3TJN8Zta3slQ/RnFa+bBy1vrgOLvcsF8o77vLA15Ab6w4NHcSv48NDQ0dTX
	J7zuJwGp1EDJELX9RvlEYSiMFdim2hnUXumOvk4rgXCA/rao3uA2+eOp0Bp9Yne2oO/HdD2w/du
	j6F4DnaCiv0AXoGsHB7/9RB7d4eP2l5cnVddr0ataU7f6G5flImzz694dOq8RLsCp2zV6NkAyw4
	eI0DyBjhcAn8+Q9Vms3E+Z21W2ZiKliw993NYuZeO4sXJK83rt9BXwjnsgE4k1QguxIeRSMMu08
	2UyMk/AGIf2DmIZibur6V1NONPZ0vCnzySHp30l8LU1Nt6fOo=
X-Received: by 2002:a05:6a00:4b47:b0:845:44c7:2fdd with SMTP id d2e1a72fcca58-847c5130544mr8170118b3a.34.1783058109959;
        Thu, 02 Jul 2026 22:55:09 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:55:09 -0700 (PDT)
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
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 06/24] ASoC: codecs: aw88081: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:37 +0700
Message-ID: <20260703055355.244898-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703055355.244898-1-phucduc.bui@gmail.com>
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
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

