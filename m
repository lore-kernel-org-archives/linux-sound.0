Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75DE35DA47
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 05:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058120; cv=none; b=XbOx3vrAAKa460yo7EBPAxApLpQavd1XI331CrpoqunyQnH83aIVfiGJ49tukLwijoRJjJt7se6xGE9XEg7L9JXPC5auEydoButNpkIfr05fZqogXW0Tmm8J7EvbuC/B4NW6Vt2WtWRiB9cdfbES/aNiUUy3wHDsqhgwyEI/F0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058120; c=relaxed/simple;
	bh=gtrP2bW1SWH+Wdjb3rDwdmnkXnip6p0Q8/DaEBD+ccs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c5xLcR09/mUEE3gwqkcrDCW+nlmrJ3uyZ7GYR3rVjHvhhGE48vOqhqvLoKOT4E0OzZwuWoyAPRLfcPQ4vrJxGJdsZeRsnw9Xom35kMR/mnk/6dwe3MHN5ppTG9883A+pyqeLryn4KDNzA7iDmjz5dl1USiuvXjqHh+vGm/byc/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DouVHL9T; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DouVHL9T"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8478cc93299so178809b3a.2
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 22:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058119; x=1783662919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hf6j86af5V0CMOW8UUCIPOBYEcGs8kFKB+l8jBsOWGA=;
        b=DouVHL9TNESySGCjZj7e65zYjDSqU4yth4bwbq/bOzc4UkX6UrUiwej2Gq70z4BpbO
         LSULjB9jBzukN4G//NyGbPzVfrTk9nxXUH5Ktx5oNKapxvO9UyqpKTCxvOpBIf7UuftP
         CoGCseS9c4YKhHEKJlfn6nhOus4A0WuxQXgQXy7h55LcaIGiVfQKSwyFmnblSU096l31
         dQrf3LFsAvc8UpErDHvy6PESTNDJhLSqVbgBXt5P8OJNp5FXNPJAs9nEstkBUS1+GPFO
         gYDpbxJkN+1Yvl0PzlA3g91CUCn842Ue8pzPCb7JEvBu7bXFyKUNm3jJIcmMmrsMJvAA
         UvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058119; x=1783662919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hf6j86af5V0CMOW8UUCIPOBYEcGs8kFKB+l8jBsOWGA=;
        b=FXitT0SLtQT2yQsD8R8Hvik9+7HmBvi/jqery31Wsr921rNcWJVWJVq+mD09iDGEfD
         dqat9AD20VmVuQ+fdwIH2bKGXKFEbT5FMa0HJXrMzIs/k8bh3EyRC5nEmu84YEjv9nsE
         FQUksSd8vEa762ClU+oklPztvE3ErNwI/2440+PRmZOHj+/jT4n/EcWN6uq+kr6N2bpv
         MPnIDVPi+aetVwLy/UQ1mTi15fnKThlrmzsK2rfIM3KpF3mnIqH3JbO3Hdr12W9z91u7
         9NULh3AND68GKZ9/5xaAn3JTNz4HpkZ793dXNDi4M7GgfWKoxG2UcFsZOag8IsOYOXjP
         l69g==
X-Forwarded-Encrypted: i=1; AFNElJ/Upl2bLlv67UKa5EizHY0SmC4U9KMYL00sXkYfuIpy9/KVZ5Ha7GdzYOdWAXCKCCwHLAq52tz76TSDjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPqTzXdxN0fDroeHseVOda+KDL+Wtx1GPebRR6asU+hdSo3i0D
	PtTVwGaWYXYZc/g/1F757kEbSZbLjcHY9OdSVxqlWjRJFX7yYK+M6noz
X-Gm-Gg: AfdE7ckujqCarGFbZcFpGpU4EZc0J4lsFVmo65axdML6yP9V1DY4Bcl+ZtsTCOlPpjx
	Ln8ZyumeP1m1V6HHdW/OLomBluxmC+WsMxqcZ8aQCDiGeoiBVE3+GsGIwOZoVB7Ho+EvKmt1Q9H
	szQr2o2BZYN1iBuPC1QMuhlVLK6mocWEb1t7QJ3XKmHCUzclUsz+F2e4X++DzaKyDXppZnS33Zx
	DoG0zRoPIq8/HNBgBc8jyuf+Dxds5nrfmxpH69Df5yJRkoF7Jb7r6iwrX9TUEcwatxKOCCDcx7A
	Bpr4v+d6dw0C1U4wV68CnYe3oiX6bTnGcNvFeBu4RPrywGshhxJDrT2Jhth476efoGR5NYo8Fqm
	m7Lw6HNWrvoAUnOYNfzFbYCIlrA2Eu80OedR+7cROCcBCicadbeQlEXP/EpZDocdGIRBFfHW18k
	pHv79y5qHecJW2jv1EPgTxZHENy2Fk3xJQysaWIAqCsxe/H+w=
X-Received: by 2002:a05:6a00:992:b0:835:405a:7e72 with SMTP id d2e1a72fcca58-847c0690f7dmr9121802b3a.11.1783058118814;
        Thu, 02 Jul 2026 22:55:18 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:55:18 -0700 (PDT)
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
Subject: [PATCH v2 07/24] ASoC: codecs: aw88166: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:38 +0700
Message-ID: <20260703055355.244898-8-phucduc.bui@gmail.com>
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

