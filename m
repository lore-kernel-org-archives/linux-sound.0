Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA3F44A730
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 12:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515214; cv=none; b=sPZJSGVrUDZjiYbQPNL+RwNALGvpB0orTWPntFeMIlUjSf7O0pUipA1wujY/XvjyU7Vmfm4PC46+lkTpX2UIuQ9Im1FZgNLqLCLzO5+lDIC6rUHB5bDSQL7uzbWiOgG8kjcE7m1t6WFjsmVa1rlVwzrgsZL+fA1A36jkKwHFjFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515214; c=relaxed/simple;
	bh=hGJisYIpxWO2FMmrkv7mmiemg24xqGVestMhlsmhqYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ngVWFy8h4yr7kS2KWX9tWbnMOqx2/j88XhEJQdvjytGEaG76vLwNS+Vj8b6SU1oI7Q+BXG/DKjeG25yDbAhvjNfzZB1/ik4bkmU/8+aABtqpZszMcmAG4+dJETrk/NcLR26Ci0M0Y7FJf7jErGlTNo9cSKsZGD63Om/KadBZwnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z3KV+QIh; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z3KV+QIh"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3847e8b0f3aso531782a91.3
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 05:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515213; x=1784120013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H3l5tTjQV1iS4ShC4Q6Dv1Lqn7dKOZsvCTX3q5ZLt6U=;
        b=Z3KV+QIhlv8muf4WvVukx1oiHr1H8Sz5sg7qFJFZbbGpVfMbE3EOEYrE0h4rC8fdO9
         yM2Bwg9+Eg5SAjtGKsH8kDHhisQQl/x8W2lfAjcgAReHP2zGyXQ+YItqj10fIqQbB5ye
         YaTKq3L/gENrPXtWycvPQtqnkZ5xYLqBLaqNJ/VCDduA36F7uGgCnUyl7aCtN8N+zMHS
         4qu8XoRsqdmejwoudbZeb/pG2awRLCzk6ZUG0UtOyyExlojxYrMO6RLrYOeL3Mvt9hdn
         D+TobgKlMbXL5zN5+P0xAWEVPEUB7SreblcafxElili9bRb5A6i9KwPdW6yOCAUewdfu
         bdRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515213; x=1784120013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H3l5tTjQV1iS4ShC4Q6Dv1Lqn7dKOZsvCTX3q5ZLt6U=;
        b=GMSWDfCaTTHJsXPadB9/xH5kRL8gZXk43So6L6eBq16rw1042rcQEmOGsVCBRbCRq/
         +aZRiKV+rcMEXPiY+SCKfnuOmrOh9Y5LzpBzdWQ8/zx06/in8Yg6DUnA5DbYCkQoXrur
         tKJHlg96hKjZVJ+EM1E+xcE/itIVuVYTn9xLPt1e3md7BkgjgKg5gugtwZTrd+L+IdUT
         kVBgHJOz0A1/I6nw1yIpXg5cyzRHzDxxyqtXZnAynll6DkkPj1zmZXlaKdBX3Y3C/DUT
         dDGAhj0A34FQ0Wnwkld7LSB6MuvWxTzBRsw4YgZvEyHFwGQryGGL6tb4rHmgHXjnPTzw
         rqug==
X-Forwarded-Encrypted: i=1; AHgh+RrrvT/qybvqYaJjDQ3gHQyg7xfAcyBWa5mfQyLPwnfgzI6UH6yeAkkEAVJ2YPdjhO2AzEnrllR/dxqp8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy381Izi3yzrXTQF95SEqyrAzmos7rBdOoP94Ppo11Kx9CHoEsq
	gHY1Y4QNDMNHtGMvOKE4fsy0errHj2gOi9UyPGH7TYZ3MVk7sRBcFiv2
X-Gm-Gg: AfdE7cnyygkILqsPZjJ/xtQRMFcBF0FIw6cC2RMgsB5qoB8s1s6+mDcrSFexWLADTQK
	t6NwyMI5S79LCJ4KNfM1jTveKMAryi7flBZJB1iou3pN7ha8FBwI3NZO46dN4rhUuJat3x2y65D
	tLMxNg9nN1eEQZjL+p/1+eKf2czjgaVZ7MkLbmldLht/CxiKim/+p9eeUMk5o2DnYdfITuscRRc
	l+wkK5qvQ3RhvBramHLyOtxnLzugQWBNgVoBMaZz+c0uMcTmfNtpOT8d+F0oqrreZ/y5MzLvN55
	tAhDHbyysToL3NHtHvh4C7pYkVz2Uh3mm97omRE5Na9hK8JwYSJGLMTq5s2PE2wg23hoiwpJpxu
	ukMDscZKzHAGZV8bqHfnvtip3i3QlS31OQ26OgvBBkEG3mabS4LkfxbP+0UOs5RnF31y4KaAmEV
	f8RK2c9bBFil2148OGNwTTJ78KIcuMTPR6kI3mIGr4a5vxi0A=
X-Received: by 2002:a17:90b:2e0f:b0:387:df8f:1402 with SMTP id 98e67ed59e1d1-38942b823d3mr2508534a91.35.1783515212595;
        Wed, 08 Jul 2026 05:53:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:53:32 -0700 (PDT)
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
Subject: [PATCH v4 24/24] ASoC: codecs: cx2072x: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:50:01 +0700
Message-ID: <20260708125002.202515-25-phucduc.bui@gmail.com>
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

Changes in v4:
 - Correct the patch subject from cs2072x to cx2072x.

 sound/soc/codecs/cx2072x.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
index 83c6cbd40804..908344ee5892 100644
--- a/sound/soc/codecs/cx2072x.c
+++ b/sound/soc/codecs/cx2072x.c
@@ -9,6 +9,7 @@
 //
 
 #include <linux/acpi.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio.h>
@@ -1408,7 +1409,7 @@ static int cx2072x_jack_status_check(void *data)
 	unsigned int type = 0;
 	int state = 0;
 
-	mutex_lock(&cx2072x->lock);
+	guard(mutex)(&cx2072x->lock);
 
 	regmap_read(cx2072x->regmap, CX2072X_PORTA_PIN_SENSE, &jack);
 	jack = jack >> 24;
@@ -1434,8 +1435,6 @@ static int cx2072x_jack_status_check(void *data)
 	/* clear interrupt */
 	regmap_write(cx2072x->regmap, CX2072X_UM_INTERRUPT_CRTL_E, 0x12 << 24);
 
-	mutex_unlock(&cx2072x->lock);
-
 	dev_dbg(codec->dev, "CX2072X_HSDETECT type=0x%X,Jack state = %x\n",
 		type, state);
 	return state;
-- 
2.43.0

