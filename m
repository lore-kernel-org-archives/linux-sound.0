Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC45C3EB7F1
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 07:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370987; cv=none; b=sAww+X4orqXw9z7+OFh5dTaelXOMf4Px1FfNBtSF1OAcKDmhwmZXJmASNDM2SJDw3QwqqsvmPWUvQlAZFYCsldjvW+LXxFGMx2XG/i41UYk9o2uqXk5VJfYoaEwPQR9fKZeTpJlhvMJS9yTGFUBnDhSClSsd9CxUcSB8IDku/KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370987; c=relaxed/simple;
	bh=yVHr58+jpi0ogaZaNb/vAEA+UBaGvyzAgPcg7m3FJUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QmntaViY1mrkiowZhH3VY9atL6cifExGQIlpgQc3zRWAS2PHTt58BENpAY4IxMlq/eSLGA4WMl90XU92FiEQxPM22vkzYaRdKqjlFr51e4pok5j0WyBEimSC/1QQwv6Amg4okgC5mcwXlzfZ+G/j2S8hbRPV/kmLiaF3rTh/D4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aIONortY; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aIONortY"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso4493681a91.2
        for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 00:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370985; x=1789975785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iLuGPJOul88SFkcVl5PHBDFHBc0tVdx0/BNU/eqBS78=;
        b=aIONortYejgKrJlCywY3/Bg7Ua32BwTy3UUecesz3flUVbpA30rWIUWmb5Fjv0zqgp
         pNJB11SWkcdMtrOtxjoL9RXTe7OBf3PIXc7DxkqOdIawO18TqQmZhP4bG59x8dm2nSLE
         AmuSE29p0LjYmLhaN5iT1ag7QlMUmklZ1diAeFAMLeBNta7SKIWLmcXQpL8WW/0Y5WFZ
         IBIeUxEnw56wOEegj84o5jN0l7q8TvNsnqiWnkySyNzZz2TmuiJPKEFW6EmaBluwo/0V
         v61HwiakXDNgWNkooWZHfMa7MdIMvns9d9V5hMOFWBq3yLUdLu645y1PcRYQDv7vV+M0
         Rryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370985; x=1789975785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iLuGPJOul88SFkcVl5PHBDFHBc0tVdx0/BNU/eqBS78=;
        b=PPNJHUm8FJSA8NXnxvPYPWFsGgt0X99wCsciZSHE0EY1GpF+lUHc9HKDOEOxQeWlAZ
         9kdr6AfYlfWHyh62Q1YEwXpWlmWULah1JRR9Z/8S4lVvQT5pwXRnugyTTQhS7nCkcXsW
         Fl8vBXr1u5aWAVIF6pYRtcf52Xq60BgCD3rD89p0IyFi6WL/2EqGao4dImcjkF5fv1Lk
         q/yEmbOuKLaYghcdaLth0IMoRMtmekWPD0wyGfTOA7lLm0gJ8jMaCZI/KSRukjYp72zd
         Rv48Vxunkg3aJYEhyErgiW9ZwEdNsRjrYhhiJd2cVjzsg+oXWnnV8Y25HxJSXVlD6tMX
         KdIA==
X-Forwarded-Encrypted: i=1; AKwUvBwopIt3EYGR2LxXo3lL/ycwB8SZeXCniXPkHFh//YNNE4+Q6FLC3Il99kN5yMfSO00xg6Se4WVrRy8uhQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lYE/W0K6DafZCjMLEpByefnSNgN8lHA6isn0Va/03Hl62RzHcQ
	VhGNUZsk7RZGpPk8rFPGtWQxwhqkhAbUEfGrUM40DLPa4kd/cG/I+xYM
X-Gm-Gg: AYBFou1j5bJwZrYi5jmRzkKTYJAMwbZ/UsC/4SEUka7E8dqdlAuLRfpaial23r27DID
	C6BLwqjePxcA+mqkydTXk68RY30wcn4rZQAU/QaW37SMStPc8SVHUnWx13OGujF9rBCrY6bwDkq
	/FQARpqV6WbWXxvoXrMk3jBj9ymljVOXUi075L4RsiEnoqf2noZ1JnLNb8da+veCUPIbAgqQC2I
	3uSfxlrDcBV6IpLmZCJdtI8fbjnnemcAa9eo/kHQcoVrsWPmmUuwpzqKo930b0KN7MlUSUiCAix
	qJV+lpMq5ZZXii1WyDte2kh7zA5TQEkKk66A+tq5G2Cdfde3FujGDBf09J+H7Or84cA/hjxOSRm
	CT2DGY0zdD0KYPy4vHuisadgFaa0JarZNT47Q1UpzOxVclnoWbgatxKsnRYStQS1YFYs1tHrrdK
	r+bcbDtoCV9yQBvfJl5ngzDwzCicrmOnBSGJELZpZZ2iAbiPL5150vr2hcrVEGD7F7untltQaAB
	bjR0LRn/voHibCWTQbp/czf8NnHD0t/BcGTNG9nSHMxIiJu0ALQkYAyLppwcth+Y+xiWM03i9VV
	xi8T6U0XdNVUR4TNHM/ciGcLew==
X-Received: by 2002:a17:90b:2809:b0:396:d27b:89b9 with SMTP id 98e67ed59e1d1-39debfa956bmr3527909a91.10.1789370985063;
        Mon, 14 Sep 2026 00:29:45 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:44 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 11/13] ASoC: mediatek: mt8189: Validate sysclk frequency
Date: Mon, 14 Sep 2026 14:28:40 +0700
Message-ID: <20260914072842.24420-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

A zero frequency causes a modulo-by-zero error when validating the
I2S clock frequency. Reject it before performing the validation.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Check for zero frequency since freq is unsigned. 

 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
index f20dbb410223..2202fed63fc9 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
@@ -1286,6 +1286,9 @@ static int mtk_dai_i2s_set_sysclk(struct snd_soc_dai *dai,
 	    dir != SND_SOC_CLOCK_OUT)
 		return -EINVAL;
 
+	if (!freq)
+		return -EINVAL;
+
 	i2s_priv = afe_priv->dai_priv[dai->id];
 	if (!i2s_priv)
 		return -EINVAL;
-- 
2.43.0

