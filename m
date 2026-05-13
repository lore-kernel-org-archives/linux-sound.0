Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5052E3E9C11
	for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 10:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669430; cv=none; b=bWTBxIw+ug4AwFY8xdujeGSSf8ujNCqpm63hMbTavW3l+Bka2v7GgtcrVUba3xm9+8EDXBDccNQ4wDsnQcoR9zG4dq4C4tEQchqS6JbrVhOO7FVFFu2TXUIZ9swc/zn8XEnTHPP+4x06dRRZbVHt5zGvgP2U5gQn5ZACTMlZE5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669430; c=relaxed/simple;
	bh=PITbxzoqk9Z0GWsxXYBjlIF56iXx3q7LP7uqXiKTMNs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JxKmPF0vQceQEtB+Q2lt9DAM9Kzws6C+ZN9Lc0rH5f7td8RoLHtyM9XhuNzrt7TGwpBAgVzWsi5pW4HAwzYItmLZ/u8a7My6w3z/6tuWAEpSl/PqCjUOsO6qQTPaXMEnXMgJS7Zdm8myBzZftO54hNR7f0q53boavtlXdD6S21g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b+Xy+Hrf; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+Xy+Hrf"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-368977e33b1so1819741a91.1
        for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 03:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778669428; x=1779274228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3gq8AnA9QGLhuYSw+tICygG0pQw5Dug4NgZkZsPxWBA=;
        b=b+Xy+HrfMS9oWHBqEKRsDQt5zl/7TJT4a739+0QqnRfqFYE1Aev5B7s2Q4Eb/Ll/Dt
         HELK7qfyk9z4f38J6K9SGMYx2WlTONaEbk9WAKGA5lDQP2THMU2uCjW/LBtJxuOWrAnx
         AeGehayq/hEkiF0+8KAAo7X5oU5ENE6MyLsuaidH27vP+Q48nsq0/7+YODaJg/bXFfT7
         armeKdELqpQuJG51E3aQMtfilXqUYEG+MJqEe5s8I7brBS4CXeDsgyuODFmFbNRSPqfT
         unfutYS2rrrTpNcUPxm40DE6vLpkoYQIXJwh1bGPM09MqTecNa/DKo5bRWEJMw34//zU
         s6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778669428; x=1779274228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gq8AnA9QGLhuYSw+tICygG0pQw5Dug4NgZkZsPxWBA=;
        b=Nxl7qjmIwz+H+ictJpw5L9ekiMsW7IJb2Dus8b4EyAcv41l0zdhKhDBXbOVvFR2N0U
         h72zuD9KOL7AVZmfpX2JIjkjNuOu7r1XR0Y1I75IMha3ufa0x1h9ssiFGlz/8/ZcL4Wz
         qHsUDmxtMlnrlerdK5l2H3MlRhlfiAtHCca3KVB17UVKZ7o6utfj/WqCuxHrzPjoxxt5
         j17a3C+qYKw8ySAqbfsdJfZC//Wsd3oE6xuPyzYGlLnkTHYlFjHhAB45vy836BhSsBVi
         vnNyxcIW60PBV8pfVbpAaEIt3n2nK3A2z2c+ZBDsxihRCzCAIvImPSJ4R40X+ttc6yN9
         LwqQ==
X-Forwarded-Encrypted: i=1; AFNElJ98A0MRgIfvHwXkCf2hf3TUpUTo+29+DV60SgrE4+S0433ZAdCrt06t/zXk2MPxBNLHNGXeu+c4JiWF5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIba65ykhzbec7DJGErOFD7w5NwlWQtgrx1c4YTcQcT//udnx0
	Wl31wFYJxCHLoTJI58iJlZwphTMPjSWeIj4FR3w3ejOaAXqt8zUsC/Jm
X-Gm-Gg: Acq92OEeybt9NHhVqDpeUu9JDKtpKm4mElsIBL1MVIaW5i8mSr/QxbkveyNAI5vDqPr
	mMfNg3xZSo7oLJfqOWSnrs0QbDVxhAQ2FzlfqzFKyfLhyoIbZ+eAtjJorLKvKa+DMW74VtNzY6F
	bzj7P7nqjCUUOGeWgmVucWe5ksC+3/9vUYsTVoHrEbsYVkAjdG4NT4Ab7jGyp1VJM0lgGfDMOFw
	lOI5y8NPUXvzJblbgvGxpborluLBv3sAApfwUGejmoBppUiuOdRaOtg7Mf65t/zAXwEGYGH6tZq
	ulbJ0z4McPwp3XZXbDTwscEWNDrtgPbe647Z+g3jfY1WJ6MIczige5pQiYuYIVPqd1P+UMp47O4
	tblVynHl5FkMfRp2vjM2UsqpM52M2PYBIdM8UFJIBCwR09DJzaLA3crQJD83MZe/pHjqAvtvvnQ
	oqdWBYTKDlk4tFFP/frpPuQleYmrzTJqo/kflaygOwHISA+v4LoILIFNnupA==
X-Received: by 2002:a17:90b:54cb:b0:368:65bc:e32b with SMTP id 98e67ed59e1d1-368f3c151d8mr2923432a91.15.1778669428352;
        Wed, 13 May 2026 03:50:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368edf9b543sm2843136a91.16.2026.05.13.03.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:50:28 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Marcus Cooper <codekipper@gmail.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	linux-sound@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: sun4i-spdif: Use guard() for spin locks
Date: Wed, 13 May 2026 17:50:03 +0700
Message-ID: <20260513105003.81880-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/sunxi/sun4i-spdif.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index c2ec19437cd7..ec00779182db 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -427,10 +427,9 @@ static int sun4i_spdif_get_status(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
 	struct sun4i_spdif_dev *host = snd_soc_dai_get_drvdata(cpu_dai);
 	u8 *status = ucontrol->value.iec958.status;
-	unsigned long flags;
 	unsigned int reg;
 
-	spin_lock_irqsave(&host->lock, flags);
+	guard(spinlock_irqsave)(&host->lock);
 
 	regmap_read(host->regmap, SUN4I_SPDIF_TXCHSTA0, &reg);
 
@@ -444,8 +443,6 @@ static int sun4i_spdif_get_status(struct snd_kcontrol *kcontrol,
 	status[4] = reg & 0xff;
 	status[5] = (reg >> 8) & 0x3;
 
-	spin_unlock_irqrestore(&host->lock, flags);
-
 	return 0;
 }
 
@@ -455,11 +452,10 @@ static int sun4i_spdif_set_status(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
 	struct sun4i_spdif_dev *host = snd_soc_dai_get_drvdata(cpu_dai);
 	u8 *status = ucontrol->value.iec958.status;
-	unsigned long flags;
 	unsigned int reg;
 	bool chg0, chg1;
 
-	spin_lock_irqsave(&host->lock, flags);
+	guard(spinlock_irqsave)(&host->lock);
 
 	reg = (u32)status[3] << 24;
 	reg |= (u32)status[2] << 16;
@@ -483,8 +479,6 @@ static int sun4i_spdif_set_status(struct snd_kcontrol *kcontrol,
 			   SUN4I_SPDIF_TXCFG_CHSTMODE |
 			   SUN4I_SPDIF_TXCFG_NONAUDIO, reg);
 
-	spin_unlock_irqrestore(&host->lock, flags);
-
 	return chg0 || chg1;
 }
 
-- 
2.43.0

