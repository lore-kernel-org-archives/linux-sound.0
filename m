Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252BD42B31E
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 12:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515074; cv=none; b=umufwJTXRl0FToTfLZ5vOlaeep/BNGGXggFF/i78Eb7Oe1sb8/J9EXtqTkBSF1cLt9Nn04M/ucrqFEghVjzucvM6uy7urfgCgwlObUsCF9d/gM4e4VfAA8386O2Iute21bKVl/JiAN+ADlaMINBumd3+EwnU3+IVd5mlb8XIQqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515074; c=relaxed/simple;
	bh=yfnMNacLdodpfRhW2bQZbE7pm8s0ri1caS058dgJKWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lvqPZ4bBtn1oZ2SLIGYN4Hz/GDXwMeGEtuh/CTljregR1lR/QKncmMBRJ6ZMFCTcjgbKNtPRnaQdFTRDfoKe/CMAVa+rPgLWXHYN5b0GDHTFRYaQ3utgIRQ/SLOX91l28FPCxviqv+TKHNnDxgRESn4bq44DUfCnIcA1dxRJJB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YwNR5opj; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YwNR5opj"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-383cb94f742so530652a91.3
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 05:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515071; x=1784119871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sq5Iddla3Hd0Zh5qEYq/9fp7CsXU6/7TUOr0ybGJuLs=;
        b=YwNR5opjep2ObfPM2EOUm9hy+FHvvyWntYYs6VLjEeu0hinbcwyETRAU9MHQ+nCV96
         TGp7lzFjAZVEzAVIsF5G7ffo9/nKXpVQU75fU+12IChaB6ysgYOswIiKu3SdxtMJPevG
         VQS3bHdfrinCcggDL7T5STgRJIhPCndWpYDbZC5njz4nG+xZWdkeAtGQnGFh/UJPYaCp
         B/IwCB1MuRD75zq/9VRn67+ZphSwBu7syGsxZpuwN9BFIRTasQu6mOEmgbf5pk/+Lgdt
         VpCVbvFJJBQGTMhibULG4i5GBeA395XWCEuwAeWW/9eo0qacrFGxSt7Whr6mMsTllSAI
         dzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515071; x=1784119871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sq5Iddla3Hd0Zh5qEYq/9fp7CsXU6/7TUOr0ybGJuLs=;
        b=aTVi2X0bzE6whYDCKA1OclyowJeSQdOZ2YB6z53r/syPAcayOTOWeoEYMgJpF7Cr8J
         jKt4v1jHdx9I2a4bV/jImfvD3lWnUyVwqhth8n/Qz7CxW+8683EeQV9dEeCy3MCZul0y
         TBT0U+mSG7LIeO7arC9veJoE1Ay+pMMrvG+ZpDfKCiRI1rFNoFzlf/JQmTHLuyfK9h4v
         PMKIg4r5twZEz5k+G2B8e7sWBu234ya0kO8cS0PzopEObB9PRwNjIOHnXYPAwMym8t6Y
         Zrn2l5GUPOETaxD5MThxiPKe5dmj1t4NRXcN8wnxVOlb7gHVxmyuwES7NGmvKdKOfO3c
         +9iQ==
X-Forwarded-Encrypted: i=1; AHgh+RpaMCTRYSzCr4daLIGsdJvih+aWs6wlMH7ToPrK588Tr/1g6QZlCGC1Xv3dMysamObLPufjDkeTpCOj+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9CXiCa6ucgISaWpT9HIr52+PhQU2wnxOVBzULkZs8HkCXT2/w
	g3FbIZgywxxsuO9vkSO+azGU8H2P2dLdV37cxTzHED7umIwjFiQe1ALz
X-Gm-Gg: AfdE7ckzNOu+Kx7lR1kPLc0Bm340Z7ovoWZgRsPeJI0/mKNXPa21xym5JjSjadBVufC
	jb8rloIdZVSnMSlWmchvYYKha9IU9il34HMYZGMPLIrsIYiuygjNbkiwErvOW/li6Zf1rLla8Gs
	xfCsjJUukF8MyJ+iS6zCx6rgXPVAYPN8ijSW2eZuiQWNvWTuUxMWQwkfKqBxDApGuLtAb7hqWoY
	irhg4ExeKItuPK3bWAoJsI8yteFn0A5oB9+xh4Mf81V5/8FH2cXtGzbaFBC2PCaOLLx+V7JEEzO
	Sbw0ev4RRIQagsTtKjdijMRB4MF9/8UJON9YmXUjv/+lVU5RtGHm+VNO9tK7dDDnHJnSXmVfHzk
	Hjgjn5NPPdvJRF+jdlbxC1KEh3YV00xE5nUThqD46NcEeTfLVq7uUWvUBYKUpwm1CjhKmIW0zia
	Q6DV2L6pyegGCIQQ42wv5MzgZQokOHF/on3245lZ7yn6KfUgE=
X-Received: by 2002:a17:90a:e705:b0:387:e0bb:57ff with SMTP id 98e67ed59e1d1-389426976f8mr2543047a91.38.1783515071231;
        Wed, 08 Jul 2026 05:51:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:51:10 -0700 (PDT)
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
Subject: [PATCH v4 05/24] ASoC: codecs: aw87390: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:42 +0700
Message-ID: <20260708125002.202515-6-phucduc.bui@gmail.com>
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
 sound/soc/codecs/aw87390.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/aw87390.c b/sound/soc/codecs/aw87390.c
index 020213e0ca4b..8150670fde2d 100644
--- a/sound/soc/codecs/aw87390.c
+++ b/sound/soc/codecs/aw87390.c
@@ -7,6 +7,7 @@
 // Author: Weidong Wang <wangweidong.a@awinic.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/i2c.h>
 #include <linux/firmware.h>
 #include <linux/regmap.h>
@@ -225,11 +226,10 @@ static int aw87390_profile_set(struct snd_kcontrol *kcontrol,
 	struct aw87390 *aw87390 = snd_soc_component_get_drvdata(codec);
 	int ret;
 
-	mutex_lock(&aw87390->lock);
+	guard(mutex)(&aw87390->lock);
 	ret = aw87390_dev_set_profile_index(aw87390->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change\n");
-		mutex_unlock(&aw87390->lock);
 		return 0;
 	}
 
@@ -238,8 +238,6 @@ static int aw87390_profile_set(struct snd_kcontrol *kcontrol,
 		aw87390_power_on(aw87390->aw_pa);
 	}
 
-	mutex_unlock(&aw87390->lock);
-
 	return 1;
 }
 
@@ -280,14 +278,12 @@ static int aw87390_request_firmware_file(struct aw87390 *aw87390)
 		return ret;
 	}
 
-	mutex_lock(&aw87390->lock);
+	guard(mutex)(&aw87390->lock);
 
 	ret = aw88395_dev_cfg_load(aw87390->aw_pa, aw87390->aw_cfg);
 	if (ret)
 		dev_err(aw87390->aw_pa->dev, "aw_dev acf parse failed\n");
 
-	mutex_unlock(&aw87390->lock);
-
 	return ret;
 }
 
-- 
2.43.0

