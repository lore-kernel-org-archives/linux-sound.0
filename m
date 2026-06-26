Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9613D348C
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454474; cv=none; b=fFs/XgJoHZBgWWAZFnxOjZZDdsur/FNTAHY1gUMHlbgGHrZso0GwZ4YURXDFhBglG0o+I7CyCeR2EfUqucVXMQhss5PuPa35IdJQp1mylc03iKqXJf4J2+CRo189UT5M4tqF1XF2pmSCcSk/43nUpqENikMayOAvUbL0KLiMqrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454474; c=relaxed/simple;
	bh=OqNQ0wtsuuL6+CNsnbsafgnka32swlgaGxVNsspVsn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LWINT48UBEq+gBkKzoB/rHYxnR5/eP7iUKIi/9Qipfp7dn4tMJiMLx7QETxF6hSw9ylVI+6KNHaJCAoA3/US76TgI08E0LmSGwugwW5/YWw/NdruHlo/DJEiM58pajNo/UOaBgl1KWUjFhIdrcDwbPl7UzYrhGHgI1PAoyxO5RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TzVsJyVL; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TzVsJyVL"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-37df72c9984so296535a91.3
        for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 23:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454471; x=1783059271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntmU0j7UTDsaoP65JVvadIw5ilAlCiOGjFq2v2/q4mw=;
        b=TzVsJyVLWThrzPU84RDx1lwVvtUD9cbmAeE3l2eyd9mUIX90TgOg8ZuTzrZPRrd9sX
         w8wR7xUG20c/pbr70xz9I3jhlL+86WdaWbmw3bbuF0g9DX9l0FbAiZ6Gxb3w1E7sDQUr
         J8RzFb1oKuRz3kbcJYsflneSA94Cucm0DZsnK/gCKEOSRkHGlfVBmm6x05jJc4TARt2q
         re6euV0IlSKeoWve4TP56/rnAxfGbK7KIRf7CxO+1DCuUV2mQc/LBIZiFadk6a4tgfaR
         oTmPQ3GYCQE80La8PSchzltYSy9CeMN+XBBv8bwEyh/n+AOaVWpwVpttv8bSz/FB8S3Z
         P6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454471; x=1783059271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ntmU0j7UTDsaoP65JVvadIw5ilAlCiOGjFq2v2/q4mw=;
        b=WIz3IpXiMaQoStZbGpa4zEv2ZVEaD/3X/pgpoGRLsShpTVbapsWdW58oj6S8NKE+P9
         wGyKPPs632X9V8raM+eIMvM7RTAV9gPxwPsfT3ADdXwJfBjqRfFC8vnQzQMIpfZe0eyG
         2Gt0ZWGIET31wJ74jM4P2Hbpu6XY8+4eKfXJ1wEgzHD4Ylv36rYkJCEf0JHu2ofQt20S
         AzK5gH6i+FM/elTzwDHI3DCFINthpy+2Nlst1HoT4YZkmrlvt3KsYPuq/YNYfiWHa2B4
         Lz3pOVrqe7o4QA2WWcnANGvaMzFTKcEZVjiGCojXtXC39WnBK3OwoiugZ+lL7R3v84eT
         FHZg==
X-Forwarded-Encrypted: i=1; AHgh+RqUOUEE+PIW/pKujYB7R3Rc/A3Yg9RxV70bnZdoPAcD/sNybW/S9fO8ifPgcyUc5VmQpzvpSkPvc9Q4lQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHuPYsmDYd9GT+yfr3V9h7r5hopat/g7B9GV+KpYapR7cFwCQk
	wxDKppRA0bmnJZrltewjS8OxkK9FjcAW7B81y+KQ4xYwIprW4siPZqPZ
X-Gm-Gg: AfdE7cnUyPJ2DNRvRcJTf9MEPQgeSxQ23pjDa1P4jDSID0ODMX333AGO7TWd/1YpPKA
	0nZW61b2pXGwSUQfVoGgk4V2s5Dvgd/JXsk/Z1kVjeqss6JVv3FGuEb52OhrT7OWpteDFGWj1f2
	cdiqRO+FujuYWIb90XRKUakAc+GfkIdcuLJbKcqENT0foX76dFgVCCIkPVD611yTc5hI7uIb57E
	zCeyTblsb2utruWyb6aoqHe2oOaOrNJV+YpPGO2Wd7KdnSM53f/ftiXTZoWYxbr1VmDzvoDedcA
	2XvwDnL4mPLoBY/SoDD8yKqZWe+ho863Ocso4jCmLTF2qQroA/oRpl/Uga2reMnQ/hsGN5hDWgQ
	gE5Q3dwF0uexX/455WgOjjK+RU3wQvPbpLvn9qAlNTzYavJ3JdOpz5k2Jj+2cXad/MTCmFebe+Y
	P10I94jbohQ+JQ7Z4mywTcv0FincO1TJeCjdjw26FsGxvpGWk=
X-Received: by 2002:a17:90b:56c5:b0:37c:6cd1:a157 with SMTP id 98e67ed59e1d1-37dfa1b783amr5141987a91.13.1782454471342;
        Thu, 25 Jun 2026 23:14:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:14:31 -0700 (PDT)
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
Subject: [PATCH 08/24] ASoC: codecs: aw88261: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:13 +0700
Message-ID: <20260626061329.23264-9-phucduc.bui@gmail.com>
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
 sound/soc/codecs/aw88261.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index 549783d3e75e..b931b8602566 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -8,6 +8,7 @@
 // Author: Weidong Wang <wangweidong.a@awinic.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/i2c.h>
 #include <linux/firmware.h>
 #include <linux/bitops.h>
@@ -960,11 +961,10 @@ static int aw88261_profile_set(struct snd_kcontrol *kcontrol,
 	int ret;
 
 	/* pa stop or stopping just set profile */
-	mutex_lock(&aw88261->lock);
+	guard(mutex)(&aw88261->lock);
 	ret = aw88261_dev_set_profile_index(aw88261->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change");
-		mutex_unlock(&aw88261->lock);
 		return 0;
 	}
 
@@ -973,8 +973,6 @@ static int aw88261_profile_set(struct snd_kcontrol *kcontrol,
 		aw88261_start(aw88261);
 	}
 
-	mutex_unlock(&aw88261->lock);
-
 	return 1;
 }
 
@@ -1038,7 +1036,7 @@ static int aw88261_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88261->lock);
+	guard(mutex)(&aw88261->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88261_start(aw88261);
@@ -1049,7 +1047,6 @@ static int aw88261_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88261->lock);
 
 	return 0;
 }
@@ -1188,12 +1185,12 @@ static int aw88261_request_firmware_file(struct aw88261 *aw88261)
 		return ret;
 	}
 
-	mutex_lock(&aw88261->lock);
-	/* aw device init */
-	ret = aw88261_dev_init(aw88261, aw88261->aw_cfg);
-	if (ret)
-		dev_err(aw88261->aw_pa->dev, "dev init failed");
-	mutex_unlock(&aw88261->lock);
+	scoped_guard(mutex, &aw88261->lock) {
+		/* aw device init */
+		ret = aw88261_dev_init(aw88261, aw88261->aw_cfg);
+		if (ret)
+			dev_err(aw88261->aw_pa->dev, "dev init failed");
+	}
 
 	return ret;
 }
-- 
2.43.0

