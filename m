Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D996B2066DE
	for <linux-sound@vger.kernel.org>; Sat, 28 Mar 2026 05:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774675602; cv=none; b=N2B1F/APsaL+fhlc4dZVhuIPtbVJcNRl5gjm4lI2tU3aWIwm0Iw/ly5WEY8lz42YXUWfMsDkQuEsP6+SevuLRiLC2+8gnok4wyyi2XfNFZFRH5uSjCqUPWO2t0zaghxlBOynpAWoo1wVsw/PsL0lmv9xKfjlUHuQVFslfGfHUVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774675602; c=relaxed/simple;
	bh=f+rrkJ/eFGfAceLcutWeIAOjkU73nC2yxLnBeMJdOaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iieeQc+FaiZVp0tZHZI/ISfNhIjrsWVX2G99lckc2q9pdlnnwfA//rvEUXuGtCVK8mZ9I2f0nMWjuuepRYzfpk0+hLCsrkKYnqCtyXDIcRO0gpkqTroTrnh932yo0ESB4dm6NWM/nyFCQQA0RFJFyeWnud3MDTK4dvX1viX4Axs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ktQAivQx; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ktQAivQx"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c70c112cb61so1833719a12.0
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 22:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774675600; x=1775280400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6H1z6H4hjpkn9YitKWLYuZELXb+HUGMdhzSORhOSFC0=;
        b=ktQAivQxbOZn7nJ0jc9WNcARYTVDPOEOfzLIWSOXrYf1cFVWvuw79PdIGxGNBYUrez
         V3zBdbdcztAV77rwe5FJMTyHD67g76+Hkcfwqpz3eXDceOGouuHUSOhX+PhmQ56eIU2l
         HvgrbnMtnrmHaaKBzxhHO9LAXygTDChSs3NtK1kKvDR0e/jn8cDJbLqsFuZm27lkpPmq
         TuLVWzabJlKoWqHCV5SpvNg3cyKqDIAYGUgkRbLzuJlQ69NLykYxnkqylt+kUbFZO2Ct
         iR4QXAdEdTMa6ZpiNrsVizp+EFYxMQVKWlCw0MwuTvdOXwGE44uS7ktNw1WAL+OfB8Us
         IN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774675600; x=1775280400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6H1z6H4hjpkn9YitKWLYuZELXb+HUGMdhzSORhOSFC0=;
        b=HNM7ekcVw9NaLsXXsQyUHaEWEpxOWpVGu4DX9JhXHAd8/gsWr+ubdU6BJipw0iNCnq
         pxpMlJFKIi70caBUnnHjVbxXyF37ZttRP50n4R3aK/y+LCwuS/Siq7A6Umee6vO+JPcz
         XhCETeHuzatsqYLoK1J2SpmK0HPxN8u1VmMHKJ8xdMrtkDeN0VlmctAVaf9UDFD4/f0S
         PGptqWkXrenRoFnvagmwmS8lubhrxfQPUPVYfphsAhsyC3c+9459itU+5BlsCQpSMmrN
         DT75tV2gm3JN9bJYu9ehykQhQAyvPgED0uAazO0q9u848o5osg8Ry5gUPwv/PzOaEFbT
         XO1A==
X-Forwarded-Encrypted: i=1; AJvYcCWAqfmdzi3Dsn7sZap6oJRzX8JvSxkLFtirRHox++j83OM82/oliPiRXEH2yU4g11L4qWQc1y+aFaqGrw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6UAukKGTBUW+PhZU8XPST0iuqwNhLvnNQnGqgE/Q7K1clU7dM
	UR7qiar0LcfAv9aQtE31KrYB0q4qtAcqSJ+7qEEAskRfJGnA8Rzs97Yc
X-Gm-Gg: ATEYQzzy9jNScRWrZifMlWYoFBI/W5sRWugXDNCni9SAZuAvRL9XPJwgiSajB1a0yiu
	BgKXhWH2cFwmMHQNevDQ83vlpSowXT5cx8dCkgs9GltmDjkVxzuMtSj+/EhZWVwc2IouYntZwbc
	8wakpzUvj/x7Z3xGPcz+zXDBM8XkBfP8npiy+QTJm4WU4H2vIqba1Zi14zr0Pqd0zMfjfmYGhJ+
	FkhlVJ37GTXW2O6Ws9KT60I1k2+HqGhEy4fKzIJQztWyXJfALQKP0yrpztM9FpHuLtSR5+G2P8q
	XFVcfDD7khnucVDHCKdcMCRc1Ny309u3FZgcF1Ry80fjv0//NBWTJsDtn2vZbDGvqtAZEJMSOyU
	mwV375BmZkYuSE1IlHi3pUkVdbYQrYQ9haWCX58fmyL2TEyUQSNbkU2C09X2O89VwsxrTsJIgqX
	Q7PgBwaLv/Kw5T9mq+C4B9HwVICLuWg3bHM6PuSKkA/z70zIj8Ztt4IUNKAm0=
X-Received: by 2002:a05:6a20:7d9c:b0:398:71f2:59d8 with SMTP id adf61e73a8af0-39c87b9ac04mr5625305637.56.1774675600070;
        Fri, 27 Mar 2026 22:26:40 -0700 (PDT)
Received: from debian.killsync.com ([152.58.216.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca86307a5sm923739b3a.60.2026.03.27.22.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 22:26:39 -0700 (PDT)
From: aravindanilraj0702@gmail.com
To: broonie@kernel.org,
	linux-sound@vger.kernel.org
Cc: cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	Aravind Anilraj <aravindanilraj0702@gmail.com>
Subject: [PATCH v4 2/4] ASoC: Intel: bytcr_rt5651: Fix MCLK leak on platform_clock_control error
Date: Sat, 28 Mar 2026 01:25:53 -0400
Message-ID: <20260328052556.434191-3-aravindanilraj0702@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260328052556.434191-1-aravindanilraj0702@gmail.com>
References: <20260328052556.434191-1-aravindanilraj0702@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aravind Anilraj <aravindanilraj0702@gmail.com>

If byt_rt5651_prepare_and_enable_pll1() fails, the function returns
without calling clk_disable_unprepare() on priv->mclk, which was
already enabled earlier in the same code path. Add the missing
clk_disable_unprepare() call before returning the error.

Signed-off-by: Aravind Anilraj <aravindanilraj0702@gmail.com>
---
 sound/soc/intel/boards/bytcr_rt5651.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 68cf463f1d50..65944eb4be16 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -205,7 +205,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 	if (SND_SOC_DAPM_EVENT_ON(event)) {
 		ret = clk_prepare_enable(priv->mclk);
 		if (ret < 0) {
-			dev_err(card->dev, "could not configure MCLK state");
+			dev_err(card->dev, "could not configure MCLK state\n");
 			return ret;
 		}
 		ret = byt_rt5651_prepare_and_enable_pll1(codec_dai, 48000, 50);
@@ -224,6 +224,8 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 
 	if (ret < 0) {
 		dev_err(card->dev, "can't set codec sysclk: %d\n", ret);
+		if (SND_SOC_DAPM_EVENT_ON(event))
+			clk_disable_unprepare(priv->mclk);
 		return ret;
 	}
 
-- 
2.47.3

