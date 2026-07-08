Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0EC348C5E
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 12:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515041; cv=none; b=r8okYC06qnBvXR36KVKAvG1kgIZLaENOeN3Osom7jMSBua8w4sqYU0lOHpsSR7CxMX/R4NJrNyuLRvWksfNY+kQRCYiillS4HVMuWXtcQa717s03HQkVWXeoq/C3U45RSSUl07OmffMZTb0CYcEOsrt+8T3CeUstt0J6cw6zWJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515041; c=relaxed/simple;
	bh=MN7hjUlOeJc0FO8mu3UrzRrAKjy8hB3fiHLBiWptOh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SOCzrJQYm6QRZSuJss3cd8SVDMbXXp/A/DAmoC/aTOW12eU5HjV34aZLhN4R9IaXpnhx2f9yzL9yzCx45PpI3YDg4nAf75ewwswMK8b9BCVCMO+yIh7AahD2oBWxKNdzVPsRz1UxPUR5oMrd3RUeHDy39No5lblStCafzeV82W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hK+prp6g; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hK+prp6g"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3811074a8c5so555914a91.1
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 05:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515039; x=1784119839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=//ABcZnuHlA1g5iBkAP8i3Vry09H6XD9kKuii/9o6as=;
        b=hK+prp6gwgk8a08HrJ1QLBh90CpOnMpbBSFobfuW3f3xUFk0hOjeSIH4khfwRt7yKI
         ENESeQbZHCr6gA5wdz+ZqqAcXXdDikAM01PjYdbkmjJaPQ5PxHQqpM1J70C45boLhPI7
         wXGYkunBZAMZERcUpVhOJgMHwN5QTIZgFiPAtps5gnhwFMYOzK1A0af7+nsghTe2XZa5
         QCMFINNnURovI1w4FNovDOB9KEPzlZMcFzSeRoZxxZVwqoEbhTcSqR8iYxsjSuSYWGw5
         IRtRf4Zqv86fpM1DKy2Y+B0soI4LEx9K/+wsPmdcNmCwotKM0vJuqPIDH91lG0HjHFCT
         +7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515039; x=1784119839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=//ABcZnuHlA1g5iBkAP8i3Vry09H6XD9kKuii/9o6as=;
        b=qc/w86v8lQT5wXGoh6ssle1xUBWXxfu9ZEN2vQzqPftR41cqRLBcI15lAk79X4VJBc
         6LibcoABjlLZBDV6MzH8r+EudNkzoX1QaqcpYcgGSb9+nxZFiccdC36Dw/yP4chl6lMt
         v6NACn75l0qogZj7PEujmjBUVhjDSmGckk0DoKxUOo3z1AMW+E/mqGFWkP7i4pXax5df
         94hziOiq9bwhqeMlrURMGT9yCeE4NpLE+d/NTSPWSeLhOTS3dDkNyBy+38sZifvF6RGi
         Op29DAQ0Z5OwaQ8yWvEN35q4hPjyvb6KRbSeMeVq5nqPd0GaCzXUkrhuMUrOVrsFbv4S
         lWXg==
X-Forwarded-Encrypted: i=1; AHgh+RpwVwcQqQQ0SxqDsIEYA+Ih24cI5hL19QCYXIG/QZgIos87/9s1Uk/IgrzQ/oUkqJuwjrtH7xkvMT9GLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvIp1xVn7NwDUuvK4g9q350AMD0nvw8FMagyvDZJq+lQi5R+aH
	DuXRKcJdJWSJyN+doBVaQYTivFtUT/hQHrp2b0e2dndtL+UF68ZdmtVv
X-Gm-Gg: AfdE7ckRl3D75aYcPrG98es/4DIWeIhDuQO8x2lH95+SaHFFrvX8o0/oqQHTCq7ob5y
	71JnrU98ffjfJZdzueqdm87RDy1A9sNpbjsXC2YzZlrNf7iKa3k2L5WjWvMnir/sp7ChyG+nx7M
	769rDHhUnIOwMgIoST8WuY1yCeBcGnniBfePTVE5Nn3MjO98+Hwjy9516zBkcdVMKmFQo9LoTiV
	L7tmf57BMyRMwXoDVIszqo1MUd06uIDRkIQUUPQ6Z91Le5NuoicrjjodIIUcKCWwQHNcf53i/yN
	wfxHqcqFCtbpBgmjFWwa98O10fIRS6hs+Ew50iFzcoiUiO86lFNBF5TvYAf8DGIPK4h3XRjKWNj
	9lEVEKfFq0mx52NdzT7jBxh7hlLiErjCAItDyTakSaKoEZKswk1jBztDgVnPkWosr3jSWHba3Pc
	fczvwfYwVxHNMEGdydqt/Ow7mRZK7XMYNz1n9EKc+D9rVkQVc=
X-Received: by 2002:a17:90b:562d:b0:37d:7bb4:bffb with SMTP id 98e67ed59e1d1-3893fb6ffbbmr2457209a91.2.1783515039213;
        Wed, 08 Jul 2026 05:50:39 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:50:38 -0700 (PDT)
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
Subject: [PATCH v4 01/24] ASoC: codecs: ab8500: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:38 +0700
Message-ID: <20260708125002.202515-2-phucduc.bui@gmail.com>
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
 sound/soc/codecs/ab8500-codec.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/ab8500-codec.c b/sound/soc/codecs/ab8500-codec.c
index 6e8ef9cd1b31..2cf96cbdd294 100644
--- a/sound/soc/codecs/ab8500-codec.c
+++ b/sound/soc/codecs/ab8500-codec.c
@@ -14,6 +14,7 @@
  *         for ST-Ericsson.
  */
 
+#include <linux/cleanup.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/device.h>
@@ -989,9 +990,8 @@ static int sid_status_control_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct ab8500_codec_drvdata *drvdata = dev_get_drvdata(component->dev);
 
-	mutex_lock(&drvdata->ctrl_lock);
+	guard(mutex)(&drvdata->ctrl_lock);
 	ucontrol->value.enumerated.item[0] = drvdata->sid_status;
-	mutex_unlock(&drvdata->ctrl_lock);
 
 	return 0;
 }
@@ -1014,7 +1014,7 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 		return -EIO;
 	}
 
-	mutex_lock(&drvdata->ctrl_lock);
+	guard(mutex)(&drvdata->ctrl_lock);
 
 	sidconf = snd_soc_component_read(component, AB8500_SIDFIRCONF);
 	if (((sidconf & BIT(AB8500_SIDFIRCONF_FIRSIDBUSY)) != 0)) {
@@ -1025,7 +1025,8 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 		} else {
 			status = -EBUSY;
 		}
-		goto out;
+		dev_dbg(component->dev, "%s: Exit\n", __func__);
+		return status;
 	}
 
 	snd_soc_component_write(component, AB8500_SIDFIRADR, 0);
@@ -1043,9 +1044,6 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 
 	drvdata->sid_status = SID_FIR_CONFIGURED;
 
-out:
-	mutex_unlock(&drvdata->ctrl_lock);
-
 	dev_dbg(component->dev, "%s: Exit\n", __func__);
 
 	return status;
-- 
2.43.0

