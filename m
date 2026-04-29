Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193302E7BD3
	for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 07:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777449162; cv=none; b=PhbRZv4JMTU9vdYL7xlw1c9IpaFK40gqQ/TitYau0Wv3oU13tpIC5fkkNmuB3E5qNXhiebfarW1p+MmKgxSleGRBTk0vHJcmqc/oZgZ4SCRcFAx4VtUUEf31FUvO7DByqWiNJuafqFwTycKbW2Poxc5MQsfQ2dFyudtqvL4xJT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777449162; c=relaxed/simple;
	bh=oCLGQTuEbMDQqoVmqKx4iWwM0fflms+MlVxpUpjSMcI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LwgKYReELcV4jnsT1Bq2AF/kP7UndCPhjdDIbxcuhECWFz3n2ae9F97ZnpC36EDLq1bAf3nRJISFocmhTwK5XRXbxlz/TN8STj0z943avUt8D7cjt3zelgOkzsTiun1jrtFrxZ/oDKO5s0UnqLeyeuOugmqoV0FHDg8es+5ES3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LAdPtzj2; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LAdPtzj2"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82f431c0ab6so5719215b3a.0
        for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 00:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777449160; x=1778053960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kwCsJYvKlZdZ5vZPdLNuJ1ag/PmU+0BuF1eqiF5TioQ=;
        b=LAdPtzj2MF04p/jStp9MFVrAmcUjUr0lT3PHXCnwpdnzIimzUVD/TbZ1eXNGEq3y6/
         c2JN2uGb/nhwCa9nP6vWMh+QoCQ8Fmy5tcM+PYGBnpnKl9kObEoxc3J54Y7B34Hc7oa0
         gmTcWgVZsCJrahpeyMOz1BvpTEakFEvSF/7DJC/TglCtgU5kipWGy2zjUFddfzBurcXK
         FeuOuQF0A79pElThTtj5iMMuiW116kqPt+SQpa9vTzEvcBinjG6IfEvzUGzyQ5JRcfM6
         YpXyiupId+jNgrFGMzmhZeqsATiuEZjeojVvZZAd88FAdubBQehCixAF/Mg/Nqm79VAo
         uhfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777449160; x=1778053960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwCsJYvKlZdZ5vZPdLNuJ1ag/PmU+0BuF1eqiF5TioQ=;
        b=Stgq+VsQWbNTDcQr33QN+TkxPc+fvVdUAlKhcwNWqM7NBdIX5WrYiKJL7YMGjPGFhz
         2ujx10lY6gVmTs+ISziwlI28e6YGql4xJIwZYpR/3oOBthyA5uOSQlCh37guIcS1Lbra
         5GRvyd+QHildacwTLKl8TQptmhIsbFlsSAMooRslVTNXOspWqwPQnNty6t0VA/fhDutV
         he5L6INnyP2L4V+iKeZSMS+/IwYF56MVDIwogSKMiWjgPVJW6zuIl/tknpkEFScjAC5Y
         p9RYSgHxdfE/PXb7LX27tFB+jSpxw4bg3vMxHyYrjnPYB3e+JyaKPKX+L7Lvwu2AYi2X
         uyuw==
X-Forwarded-Encrypted: i=1; AFNElJ+QwGK9zyJCEMWor6RU7VhMNc7a2YSTaV1CiB/JKGfiu2tcsTQXiHmNHD4JssUp91VfCYSg48dff8NK4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNy8AYklGa65McuLEdcffCGBnhUysITTUXXfC1Y5icFEnsXIS0
	MUqwY/HdaBphGlXT9HwEGFSa04JgGohz98NvVVXZsW08UHTUceAG7Hb+
X-Gm-Gg: AeBDieuG90yYoANvBRsv1oQBg81KOAw6n7EVsF8/8LyitHDn0rY4MlwyuBerd8aN2W6
	DAULCIn19FEtyYeSyS6LxRDc65Lv7OeDPI8p++sHgFeO+KJE7NEi38va2/VZi7MOkoR9zsJUuZm
	TSNMreGU5+LdSCjEuc9UrtrubkQsSE6CYTIBlIiFpKjGtKyVw+dBKmTv855//qrBeMmJ7XrSSjA
	GuMHRS1lcE0i5PrFeEYSlJpvZl39eqPJbmF4FEBKMgHYaICvpfsTw+6jY3iL9+wGdFLSsmKNrpi
	S5zns4/Rus/IciHcucUAmXmUMHRhGArRTiho+4XPYfCnsuGIjHEQtpViruDI1yrigh/vTgsukMf
	6LmBvsXE9tc35JcPuDgThG3/afhXblLm/p+0/0ouYuPu2LlBGfpgRs70pQmjo0olPfbCIFr+mTX
	ZdGpFYm3Lnjap+DPtanj8fV2JeSY/0f3MzeX8TbFKSGH6UA4gBu75N9d/4HEMgU+VbooOS
X-Received: by 2002:a05:6a00:440b:b0:82c:215d:5e9d with SMTP id d2e1a72fcca58-834ddc14dadmr6684766b3a.32.1777449160405;
        Wed, 29 Apr 2026 00:52:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eb783sm1213720b3a.42.2026.04.29.00.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:52:39 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: ux500: Use guard() for mutex locks
Date: Wed, 29 Apr 2026 14:52:21 +0700
Message-ID: <20260429075221.73989-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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
 sound/soc/ux500/mop500_ab8500.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/sound/soc/ux500/mop500_ab8500.c b/sound/soc/ux500/mop500_ab8500.c
index 2e6ed19a18cd..2a459267f0f9 100644
--- a/sound/soc/ux500/mop500_ab8500.c
+++ b/sound/soc/ux500/mop500_ab8500.c
@@ -234,19 +234,18 @@ static int mop500_ab8500_hw_params(struct snd_pcm_substream *substream,
 		substream->number);
 
 	/* Ensure configuration consistency between DAIs */
-	mutex_lock(&mop500_ab8500_params_lock);
-	if (mop500_ab8500_usage) {
-		if (mop500_ab8500_rate != params_rate(params) ||
-		    mop500_ab8500_channels != params_channels(params)) {
-			mutex_unlock(&mop500_ab8500_params_lock);
-			return -EBUSY;
+	scoped_guard(mutex, &mop500_ab8500_params_lock) {
+		if (mop500_ab8500_usage) {
+			if (mop500_ab8500_rate != params_rate(params) ||
+			    mop500_ab8500_channels != params_channels(params)) {
+				return -EBUSY;
+			}
+		} else {
+			mop500_ab8500_rate = params_rate(params);
+			mop500_ab8500_channels = params_channels(params);
 		}
-	} else {
-		mop500_ab8500_rate = params_rate(params);
-		mop500_ab8500_channels = params_channels(params);
+		__set_bit(cpu_dai->id, &mop500_ab8500_usage);
 	}
-	__set_bit(cpu_dai->id, &mop500_ab8500_usage);
-	mutex_unlock(&mop500_ab8500_params_lock);
 
 	channels = params_channels(params);
 
@@ -339,9 +338,8 @@ static int mop500_ab8500_hw_free(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
-	mutex_lock(&mop500_ab8500_params_lock);
+	guard(mutex)(&mop500_ab8500_params_lock);
 	__clear_bit(cpu_dai->id, &mop500_ab8500_usage);
-	mutex_unlock(&mop500_ab8500_params_lock);
 
 	return 0;
 }
-- 
2.43.0

