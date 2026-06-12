Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2A6282F06
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 13:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270852; cv=none; b=Tm5tgxtFWAeBwou73K41m7mw73fofLYMcj7nd6a/xYzwTzO9ArWWRoK/XgldNBrHD//LnQt62vbf95hPzt4AmrQyJ3JoKGTTJL9wcdF5R6nGysBTan1K4rLnLKRK6LTEhkQccur28o17cmIXTEzbiqVIKIjrgoxzHNKag4AxQMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270852; c=relaxed/simple;
	bh=8cF3HebG5op+ITs1XJRWMhmy9A1xc6/hcMM+4iQxiIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o+gsYMKzQ4qm8m95K1nWQNV0Yf2bZ3430nlk7VIyTP84plpd4LopjuRIo9h2E7psAaJMan+6Q8bLYL1l4GjBahPSgsp0WgvoHQoi3p6B8BRUZCjWYyCq5OrLwBP+xyIwjvSkOm30OxqyKFfm21zPtrUjxf1A1dBHTfUg8KvlFUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OxaC3eq4; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OxaC3eq4"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-306f36df4feso744896eec.0
        for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 06:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781270851; x=1781875651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpnchv9pa/fMvI5rIt88B4RF1cetJyaCH3vcYXn44rs=;
        b=OxaC3eq4jFqe2R2WwkkRrMXOZ92GxI7ZU4bNswKNdKenESCaA8txT6JKAIbOZVZPeo
         +mCx1M+mMFHEENhvwulhyu8G3c+EbuTmkp5JR+25uUL3jvOLjCWAZoLpj3R+9yl9anWK
         usp0S8q1gBQUN6bFcRtoZVr0R5ruM1rujUVSifzw3Z0mhPnxF6bGOS8KOe1Zn48rruF4
         LuX+4RVAr9zFwGgYVHgvKK/iKtIPBEX1R66uD2FOt37AN+LIvY603ITlOOkQw5DmYHuh
         vlZXAEppDJSi1Vffbk/L0L1qky4THgXPd27KOBAZvt9K9Akbfu6YkYXFqYiE1lToPDlP
         ZouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270851; x=1781875651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wpnchv9pa/fMvI5rIt88B4RF1cetJyaCH3vcYXn44rs=;
        b=CrMvNFcjgXbcVOQdkcJf3EyriJVx9SiBPRJPyVUgccyUj+yHu9EMHeUnWbli/DBh47
         XhE2Gh5nwvaFAGif5VLhe41gnTs5+VFH2i8wG38ZOOCiXw/gJaUCvIrpMj9QmtWmsUG0
         5qeWyzQfzD5AdJmrZmXmFmu99FS0HGPinqQ52lKa5CkdWlHGfA2bG8HSQxlXYXaL0w4W
         fF6XAUDqEiha7BSG+jfzacRLF0xGiShSir8F9UtUXUc3TUPwjseyAfTmkdSTU/DsrXO2
         x5CEwnNmUqF0+F3KzInsqWUb8kH2K7MCqFNdnoA0o7oJb51T3FIoAdY/TSAC7ByqfCAo
         jElw==
X-Forwarded-Encrypted: i=1; AFNElJ/g6VbkhDbSYcCIOkYcSJsbJD5YlzQka0BllqO3WxSFP5rq8gA4qIx7/tJaXQqvlNIZVyQs6wdDmcp9FA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDdVENB0i4vicJZcXkFxfy/nSOVTZTJI1COkdGYL+p7x+oh8qg
	px+dFE90B1tRiWfHs+xz9J8sSQMyTnJ17xC31X2KpSp7JspO/zazUX56
X-Gm-Gg: Acq92OFB3+gC/M+4SopiiILw3x/4rSLA72hUbp21iH4glFK7XhsXruDyUsaQlLbGevE
	EguTnOFLPr3zudBoA0NOzJo7eJ6wIo6W5QVrOfkVzMTTgqu4tjZ+F9zoTAZJ/Cuj4+YEhqw+IuP
	Lgs5L1uHkfO50kt1FLnve7rpasvAnOA2df4b19szGbY2HvMQ6JFCZxW6RqaYlmqNeZXudcexbhV
	adcJySfIE2eplJxvJCg8n+BA2lNLMln2/nfcNNuMV5YQfLlODOca1eml7jowg8vaC7ePpveCbVW
	IRGmIXCYDuWQxOfAry6rWczVczh1gws6aOBxiKhuD1tBPZ22MMw8sEffmYZdRRwvzCYU7dKqSyw
	DIn43HWQ2ixSdCHNL5Ah4nKBy6lWfWGes0eLmS8joZJkPbEfnuQMu0PXXSJAE2wqyQQT0p/aGsc
	wwpeomD4AWiAZVyOusuMsppMEdfkRchpyDwSCik4Rl6ojYFEj2DwbbeY8c/g==
X-Received: by 2002:a05:7301:9f09:b0:304:70d0:4f03 with SMTP id 5a478bee46e88-30820c2d782mr1373677eec.6.1781270850611;
        Fri, 12 Jun 2026 06:27:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f8b5sm3302343eec.19.2026.06.12.06.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:27:30 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 06/11] ASoC: fsl_ssi: Use guard() for mutex locks
Date: Fri, 12 Jun 2026 20:26:34 +0700
Message-ID: <20260612132639.78086-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612132639.78086-1-phucduc.bui@gmail.com>
References: <20260612132639.78086-1-phucduc.bui@gmail.com>
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
 sound/soc/fsl/fsl_ssi.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index b2e1da1781ae..dc022976c982 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -1218,13 +1218,13 @@ static void fsl_ssi_ac97_write(struct snd_ac97 *ac97, unsigned short reg,
 	if (reg > 0x7f)
 		return;
 
-	mutex_lock(&fsl_ac97_data->ac97_reg_lock);
+	guard(mutex)(&fsl_ac97_data->ac97_reg_lock);
 
 	ret = clk_prepare_enable(fsl_ac97_data->clk);
 	if (ret) {
 		pr_err("ac97 write clk_prepare_enable failed: %d\n",
 			ret);
-		goto ret_unlock;
+		return;
 	}
 
 	lreg = reg <<  12;
@@ -1238,9 +1238,6 @@ static void fsl_ssi_ac97_write(struct snd_ac97 *ac97, unsigned short reg,
 	udelay(100);
 
 	clk_disable_unprepare(fsl_ac97_data->clk);
-
-ret_unlock:
-	mutex_unlock(&fsl_ac97_data->ac97_reg_lock);
 }
 
 static unsigned short fsl_ssi_ac97_read(struct snd_ac97 *ac97,
@@ -1252,12 +1249,12 @@ static unsigned short fsl_ssi_ac97_read(struct snd_ac97 *ac97,
 	unsigned int lreg;
 	int ret;
 
-	mutex_lock(&fsl_ac97_data->ac97_reg_lock);
+	guard(mutex)(&fsl_ac97_data->ac97_reg_lock);
 
 	ret = clk_prepare_enable(fsl_ac97_data->clk);
 	if (ret) {
 		pr_err("ac97 read clk_prepare_enable failed: %d\n", ret);
-		goto ret_unlock;
+		return val;
 	}
 
 	lreg = (reg & 0x7f) <<  12;
@@ -1272,8 +1269,6 @@ static unsigned short fsl_ssi_ac97_read(struct snd_ac97 *ac97,
 
 	clk_disable_unprepare(fsl_ac97_data->clk);
 
-ret_unlock:
-	mutex_unlock(&fsl_ac97_data->ac97_reg_lock);
 	return val;
 }
 
-- 
2.43.0

