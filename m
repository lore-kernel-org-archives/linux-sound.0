Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D4142981C
	for <linux-sound@vger.kernel.org>; Thu,  4 Jun 2026 12:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780577732; cv=none; b=UueQrzE9dEJzESKTDFjP9t6hCI2Fr/XTHL9BJ8Vp4vQ0F94k7pWZS+gB8CgE94Mk3szNHih4DZDjBDCS6diE5YoQALtYIljbY7idRSFWknH8LNeqdDYsRvPIj+LzeFUQnjtjy/HCb6An5ydY2QqlW5g/NHoEOGbYK6ElKO54vxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780577732; c=relaxed/simple;
	bh=n11I64gZBjjcqfTwfX86YPYIxJFDZB/LL+PUWPFj60s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pHgeQs6KrxBpISFKgGZNIGrYxn7h4PhoH4lp18HsXrVD+LNVByD2hDhqUNQ0mfQp8AlQBfJdAOvU8g3Nls2CJJg4S69aEuBVk7MP6rIUYLz/h5QWfQNXyzM7wGwiQU2FaihoKhuuzRWR2TzS4J9CSZuqieRKWvyOrILqHpKwswQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jpovDW54; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jpovDW54"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8423f420455so286078b3a.3
        for <linux-sound@vger.kernel.org>; Thu, 04 Jun 2026 05:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780577731; x=1781182531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7neDKPTR04+j9kKwXyGm7dQHLkLVmAT3GqkBDxWbPuU=;
        b=jpovDW54BT02EutkaXAml1RbMZt4pbWKjl3zPPf2zDVYK3XKpXGl9cZCkkJCrD8ahT
         5itBTHbw42xlTPitIxF9/YFXs2ZueYlGWckqcxQi6WdTxtGD7uaGV6O6JEHhXqg+ylt0
         iuzMJ+jfqxFOVXMZFbq8IygUBNqX6ak9Toezs6fqaAs1vMlGAUMftR7jc9FyFWeHUeK0
         PXeGHS1tZV4PROrXacXyQ7mde0oGECWpnvPdPGg8IQq72rybrJSv++voAhVPvCWU78bh
         VdPIJC2E3vlYLmeMkT6WzOK1pA3tUsUs5RDssiqoymKdiHLQKMft6RZfcZVn+cgthioU
         N+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780577731; x=1781182531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7neDKPTR04+j9kKwXyGm7dQHLkLVmAT3GqkBDxWbPuU=;
        b=fySvtZcKdXLdXH3zyuauOMSaVraofmWCXi2DjqS3pKo67vWgqs4OhmFWPFXurS6Qb8
         DqhIXzauRhSfXT7PEx410MVRVr731hG0jZqZumnbHriArGRTz2fL8niO1ZUGLY8TvTF/
         6PAjPJFYVcWpyHewzpibVLpzag2jtPDxABU52j1ECBDgQkF3kLimQ2fWfWh6t8FMPyJ1
         hSWonq28Tb5CAi8JR/84ZvX106ga8rEHktm9JYR8jQNCNlsSUyZPgPDrxXlnTxm5d2M/
         eh+KRLV05y7bpf7CHraavrxlfBfdoyxSeaCbktX0leBpspLw8azLQwENyeqGMLoz9FAd
         HrZw==
X-Forwarded-Encrypted: i=1; AFNElJ9VrwT/Skm3iMbymDxojWuAJAvcFaMSVQoMIflY+vYS16EqMsamJy+/D4nPxVKJzlsz2ZSGpJZBEvktuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YysjY6aHlP7km2v5l88AKWwOBV14HRGapmd1gmFEpqcNYckUfCk
	FfIxzO/1g43S7Dqa9cW9kqyikZLsCd1wiJNGi4STP6kV28yEDt0TS3GU
X-Gm-Gg: Acq92OEP7HCblvbhlzm0NMR6SeUTC1HeVT+AWEfyY+AFont22aLHkZZctaz5KKjldZd
	EK8DsJL8Fg6z+VMztwpFVCe4+kuSma2Jz53/utnKfEbnYtqkRyIl51koyA57/Rkh8xV3G3upHQW
	TTDbX4Mw0ggho8QHxAvhoJT80Ip7dibNasql1+coRsEQmIKsjH4jlgpuBKR4EZe2gDHMmpswoe/
	/RegthIJz1d2fc06WyQp9Ipk8mdiPuQIeAppaFFQdY0nmqqiQxhUlO69CC08UKrCpI57eKgd+KP
	75IiQFrxdKFydVNnQq42WEw3q4vOxEA/VMi9FwVwSEAVAWKbrjhq0OiBLljo4ZgM+1L3+JLde17
	IYkTkrgZIJtVDDhQgaDf53mDsSwi6ep1cDiJvB00Pxf1t6xpfRmOxOqHgYMI3WH5eFOzCXtNN0q
	OaisyeCeHujc+RGHYxWhmojIA=
X-Received: by 2002:a05:6a00:84b:b0:842:38c7:9925 with SMTP id d2e1a72fcca58-84284deb651mr7603656b3a.2.1780577730957;
        Thu, 04 Jun 2026 05:55:30 -0700 (PDT)
Received: from lgs.. ([118.193.33.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828821ddsm6165694b3a.35.2026.06.04.05.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 05:55:30 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jihed Chaibi <jihed.chaibi.dev@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] ASoC: adau1372: Clear PLL_EN on failed PLL lock without reset GPIO
Date: Thu,  4 Jun 2026 20:55:20 +0800
Message-ID: <20260604125520.1428905-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PLL lock failure path in adau1372_set_power() unwinds by putting
the regmap back in cache-only mode, asserting the optional power-down
GPIO and disabling mclk.

adau1372_enable_pll() enables CLK_CTRL.PLL_EN before polling the PLL
lock bit. If the lock fails on a board without a power-down GPIO, the
error path disables mclk and returns an error, but leaves PLL_EN set in
the hardware register. The normal power-off path already handles the
no-GPIO case by explicitly clearing PLL_EN.

Mirror that cleanup in the PLL lock failure path and clear PLL_EN while
the regmap is still live, before switching it back to cache-only mode.

Fixes: bfe6a264effc ("ASoC: adau1372: Fix clock leak on PLL lock failure")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 sound/soc/codecs/adau1372.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/codecs/adau1372.c b/sound/soc/codecs/adau1372.c
index d7363f9d53bb..879afeb81c42 100644
--- a/sound/soc/codecs/adau1372.c
+++ b/sound/soc/codecs/adau1372.c
@@ -813,6 +813,11 @@ static int adau1372_set_power(struct adau1372 *adau1372, bool enable)
 		if (adau1372->use_pll) {
 			ret = adau1372_enable_pll(adau1372);
 			if (ret) {
+				if (!adau1372->pd_gpio)
+					regmap_update_bits(adau1372->regmap,
+							   ADAU1372_REG_CLK_CTRL,
+							   ADAU1372_CLK_CTRL_PLL_EN,
+							   0);
 				regcache_cache_only(adau1372->regmap, true);
 				if (adau1372->pd_gpio)
 					gpiod_set_value(adau1372->pd_gpio, 1);
-- 
2.43.0

