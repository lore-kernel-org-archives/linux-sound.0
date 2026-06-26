Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D333A3D2FFC
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454468; cv=none; b=GIeWcwwlsjCL0NqG7o/qde5rVpOW2KRfa5N2sVmQVtv/JbpBOVYIn294DslrI8rIpubojwmUIRduQbw4zix4uGFT6b0j9dLt9uNcbDveMPV+jECTLXjpBjjnAqIKJj3UcVxe+UPbd4ADo0U5LxHFBX14n4N5VEljEdr0hbNaTNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454468; c=relaxed/simple;
	bh=gtrP2bW1SWH+Wdjb3rDwdmnkXnip6p0Q8/DaEBD+ccs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IrLiau8JVcgsv6OYKpHPUofWWjDm8HtLoRSk9MnBuMtnLDXGv76KiS9baDok69wupYOP15uEoCqebXmBirSUBQkqYH1Ph0QdIJfEwHth4jv3vG2GjIgMAD+tjixiKHqpnVLZoJmpPoUZD/aVvk50FwOBP/o8LmwyNUHOBq6El4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IcV1hN/f; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IcV1hN/f"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-37df0b86a82so992008a91.0
        for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 23:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454466; x=1783059266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hf6j86af5V0CMOW8UUCIPOBYEcGs8kFKB+l8jBsOWGA=;
        b=IcV1hN/f2bWHtaEzn3Ro/DSo/A3AsD7W3AIzDnE3GCYFINzkPhj/SGfDStzZpDsm4Z
         aGjBRzX7UUgfYI03OKXZT2VKAawsP39bcm0jhFgWeQxG9JXvKpBqtQUz0iqD2uidnVKD
         5pkiD6KVvRZs60uAoSdXdceo1Wl2OT3VtKbEkVvJ+lFupwRbPgF80DVXc7uZfErdtzQs
         /5T+G2/HP8jEfnSV9Oprw3aNeBqLxnShMDdhrbpeWKqkCDS4/gLZQ2g/IK+CA6jlwuqr
         Edd6bctQFKboZfWnXpLEMnRyzcxNyDi64gQ7xZJ6T+oruck1oTPEoy+KLSTFo6lVFxV2
         A2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454466; x=1783059266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hf6j86af5V0CMOW8UUCIPOBYEcGs8kFKB+l8jBsOWGA=;
        b=IkoE/UFgYcVBDGFvJ5APYLXFjYbKrC0qdhoAGolvYsJIKa7LK0IKflbJRyp9GGPBT9
         i6ifkU64mwmhh2cbol+nZtqfnVth5RKuJQPmH5+FW6lXYm0aZDFz1r8B0EvEdM4xrdXI
         VIuEwIvBogZnoqyHjEyzl8yGgdapaHJEZR3vgwmNSwzBNsicFzzvMUclob8f4COv9ENI
         rqH+rbrO1Yg3F6g2z7blXX+sjcf0bNIDe9dI1JXA8G+yYs9U0uQ4PWw0DfVmPUz82J9e
         gHi7zLefQchLld3XPVwDnhEQBnbxo3eQPTH2QnYzqGn6KbrRyNlts1cEv68OlaOiFepY
         VZYg==
X-Forwarded-Encrypted: i=1; AHgh+RrNZeR2yYVJlbsK1YvOzye8EpN9FWUFGfWvBxJFhSJzQyUvFrqdu9u5tjiNCcRd4IlFRtyjXBlLB2Cxiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWdRpiSIvTlQ3v9YsGWRAG99F7/jEcO2UHOpBgiJYp409DUJMW
	0eUVDxgvWUAw1YFYCGgQasbW5vxmJ397FmQB+XWn9rsmZFbCqU8xJfvj
X-Gm-Gg: AfdE7clpUsI6ck7tvcvpECMTAFWbcsG/OUkF1fuv5/OzeifQGFXcmUxDqoC2K8NxyV4
	FAHO21qB2FVKkbWYSmSrOoceyvBkyx8glQpD7fyyNtWVikQb395Up/hobpLEzNM1MwAAW0ybuFZ
	TuQz+NR19pxt2IE/OoUq6vtidrl/MHOn8evhkflCklMpgD+5pgRXHfJmOb99RwxY7CvK3ON2Khx
	JiLL1Rrg889WIT325ZXOY5JBVx0HewwNDELZhCaji3o2Bmuvve1xrErmADvlFbXCO+ZqL3fvopi
	IOEZnnyIapoJJf6mX7U31XDh1r3ORSBnbqnYha9MBFVLtU72BZ8XhqYe727P/DkJpF6AKVYzx/5
	wDoUEAWyrVWzJkb6GN001I1tFC+YVBwJcQnoi8NJB0dl37T6kM6ZUriyiKaeXtzgFmz2/2nUjB7
	yHWb3ApMJP1G/Swwa7SXnrho5nlsWFLNvhI3aO4uNp3iSjzz0=
X-Received: by 2002:a17:90b:1dc3:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-37dcd66b178mr13297213a91.4.1782454466074;
        Thu, 25 Jun 2026 23:14:26 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:14:25 -0700 (PDT)
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
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 07/24] ASoC: codecs: aw88166: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:12 +0700
Message-ID: <20260626061329.23264-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626061329.23264-1-phucduc.bui@gmail.com>
References: <20260626061329.23264-1-phucduc.bui@gmail.com>
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

