Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28193D3326
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454462; cv=none; b=TzdnlSV1qxHonbHjHoyIMhF11yYertjyn3kkf7w1jYxldUkoddBCl71LY+pe+Q+J1SfLiXUQ33XPlzjJjMiRtxw8JZbtbfg+NCkKo18l4D7lUX9qDhUnxcxVUqYf7zaBxzpo5n8tffeFisGL/XG7oHzNwk6ulNPSlaKw9UXZaAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454462; c=relaxed/simple;
	bh=j0DXGRVUZGLFodFFZDuPh1GY1V1OX5hMwJceQFENsgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tVIvOkzmcJzs/LUo568ZbV1CTHWhXLjG/2iuXbuPiEMiiKCHvh5YjZi0jYyRnnFllCzYjQq9lY1qkfkFhrFTz51a2X6592OeaVvSmu2XrEDVdXCiPhRm1tyU6yr9fDP1N+Ki10HncJ7LUITfvqZq1V1dq1yh6EaIKe9OVLnSsBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+w/mCjr; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+w/mCjr"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-37df0b86a82so991983a91.0
        for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 23:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454461; x=1783059261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GIImJGUCMEYSffIizPuc32WkGD23VTl/2TOsQS5Pw0s=;
        b=Y+w/mCjrf5JhvMscGe89YkrkY56/r8+MmUqHrYD4oo5ki7chMMv8k9YY/F17DHk6o8
         +1sqtVZhNaiRIVlLz3B0MsftO2RgLD8JvhVoEOQgpR+y1Gww0I2rGCkDnZrWGfodSx9t
         dxuLHszyfnASSmtWQLJoBPwG3LGvBw+UA08NpOMvFDH+z7UkuFBvKvCtalE1RITGtkYZ
         m0tcehYqJzRjlEJVg70L5gopKiU07MIDAbPbFc5IDAJyIktQjGClC2Tu5V7OUk5xDNJX
         wXTWY6H26tmNPpjSqbRklUi9ASiLJqt4Y+77ivf0S1/DaLP2PVBtgDCiYv3RrY3kX3OZ
         FzFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454461; x=1783059261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GIImJGUCMEYSffIizPuc32WkGD23VTl/2TOsQS5Pw0s=;
        b=NDAuKsKy8ziC4XEEsHpSQbJGvuFMusYHxtLvS4dkKMhzX6v1ul1YHkc7LozihgwcTU
         QzX/o6SHz3MIiqW7Td//2gI2DYKa0+bM5UF37cDa1hIjY/PxhynARqqW+josErhytadf
         C4wWMcpYJlu1qpGyqTR9cMFOge2cMOmQHNr1GARKixo0qGT3GbVb1TsyWRxSggk2L7Fz
         6MuYo4ZVf0Oe6rsjeR9c1ACRNh8mW3ZaqANY/hNVsVZjf6Lty7cu7u6XDEKumjS9NdrK
         E3tOgmI/9CJYBArwvmrRkCUxa835ioWL7aHLBYxZSl+8VTA/FqdFsuF012b6JX1B7Y9E
         jZXA==
X-Forwarded-Encrypted: i=1; AHgh+Ro8u7K6/zlqzfMABrjj4Fc1yhX69xdPE0i4oD3DMxKZfA8f/nRwWc14S9NOHtiF8H4QCmdaKeg8ybfYMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfrasqxXu38IzDcmEvJH2d1eucU07zcq6wBxZPz7/sBnTKaYtS
	1OxcFKjLo+Uea1UD0XHJ2IaWe6nW+K4KznhgJ7f7iBBcDauahV7NV/PA
X-Gm-Gg: AfdE7cno2OsJZWQBZGYjzoi0H1pA+s1oTtntwcDPOxwsbnzA1SyeUfZV+EpxR3J19AU
	NQR80od4gIxNtFi/14ksz4Kv06V2e0x9aJul2/nM+WhaFLWPbqTmu+YuYpgFFTWYTWSbu8xuchJ
	nI8+gVso1oqyM2mK+reVurOKnZJrd8j+Pp+T3XKb/VEYG0mH2AKp4cdvJB2X05u/FRrwGkY25xo
	TpeoOHj/FhCiGXd3O52tpcq9f2FulLf6eMDt7hI4xzs7g3cAtpPFDPnTeccFsRhO53f6IXsY+Yj
	zYaOpFxQSTGPkJiAs2vcJkDzF2YF+JEl5aXHpxi3D42BOKwWZJep2bRLerG6NzYb81hGK4fty6p
	SakXMKL8LZogDvETC5Yb14O23o9H/oCYSGRk4Sfp5fDpLxRMXEKmy7QmU23hZF8VxWNEj2eeX9i
	cnusF5HnAilCVV2G/pdKIMwm8mG5LgPBo87fsPE4iVa6/r2IwXM6ACLSHNeA==
X-Received: by 2002:a17:90b:1b07:b0:36a:8519:a4e9 with SMTP id 98e67ed59e1d1-37dcd792db9mr13247012a91.18.1782454460950;
        Thu, 25 Jun 2026 23:14:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:14:20 -0700 (PDT)
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
Subject: [PATCH 06/24] ASoC: codecs: aw88081: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:11 +0700
Message-ID: <20260626061329.23264-7-phucduc.bui@gmail.com>
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

