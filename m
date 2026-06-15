Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2BA3D9680
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 09:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781516431; cv=none; b=XWDc3AyFFNBMBPZWNZZ1Ax52sYfrdcrAaXEfKn9QHLpATVaqmYBHLVuvvjo1paxZuSVP7zkwzoaelEgI6g2E7cxA73+N9lbWosYgsYNCyXY1rJk6IX5ArqoZ+qdxWRyqDgrE3gzBLh8gdQwYcBwr4LsuicKSQafJwBCeTma9Hdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781516431; c=relaxed/simple;
	bh=AZ44qVbwhbS1ciYLL9/k/0g6G9OnLSH1+z05vvyIPcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HRyQ0ZcSfN3/tMu8ONnhdWy0G5F/AI0JQ+p9vYozWXdMXXPh5an3voIlzrzHFzpx0+iEPDjB4nTb1FzkDMNcCD8BlcshjiKOXYrbqEqlwWSXsSTSZvM7WsbHIg4/ne0wOkLSvnqROMYajXma5fli2Cl2GQLihtjNa2r3L/13bdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZ/i1XWt; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZ/i1XWt"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36b9ec98144so2434986a91.1
        for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 02:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781516429; x=1782121229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOhKduHvhhi1//fmQnUUQw/ZgnpHeWjfQ6tgKhPwSdc=;
        b=TZ/i1XWtEgYuRriVSvoBudiLTfuNRSCt6QTG2d1v60RRb7g26zyk2s8pZS4wj8rz25
         FqquBiEefpu+ofOy+xn9ZGX6Rzw+nTJm7t0wDVNqQZTbTYFhU9DSkqTWadIUcurz2N1A
         osOIZDxOTBGahqDYOi6NR0MEAnVP5yetysY0/JzIMRZHhHLX+pwVmDP6xTy2jea2vSol
         +gx8lcWodJNsVp0H3zSHsbIDcJZ5e6SMgu/TNFpu51/oeSyJrMs+yVaTR1gog8lExzAU
         eB7vIj/iruNL4IoHIHfEz55lesesrx8J28fkHZlCzCwxWb83wSmbnd1F5Pjpmv6bXiuc
         whGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516429; x=1782121229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jOhKduHvhhi1//fmQnUUQw/ZgnpHeWjfQ6tgKhPwSdc=;
        b=dH4P9BlBF+jEeaX4TBrXyrFVOlyj2VHYMnM5YuQu1dF4WPIOxBu49ZFXASI/4UnJuf
         A8HWSoMikuKM4JZUmCXP/4sE/HNuHlMspON0rgefxYlN7Ify1zEcYjTS+cE0lWRwjRGI
         7M22iVfFYnEO0oyiLwkfDGLIjJGPKElck/ul7p/xv2oUNY1QXDy71dzhSge/aSog0jsS
         aBaLJLVdr619f5XzNxb+7X2OJlDG1HzLL2uku1D7aX8kS7ZOui213y5+AvxxeiWDYPQa
         /pWIkMWY0LkCi0EYcPirnwTKRsnhpXeC/OBrUj7Sq5nu/39ZvaBeEeXTp1VepQJwtvGP
         pxqw==
X-Forwarded-Encrypted: i=1; AFNElJ+akUeHdQ4OkpYjPPmm+1aJdMjLsWdkDmlWQBWfqbLH0n/4J8zxlCyuE7FBVUGK0CxH5VKuRH7it6Om7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFfYaE5fv7fHfI1NnJmShZFXYL4HUnAuoLT1FLITcFTcTmBnak
	Dyd9jrxbi7GPAbMdmfo7hvSwTko7sGuAz1jcd1/r7w6FA320zAYaTxoe
X-Gm-Gg: Acq92OGWLCW3cCYLG8tZXqAGOFRP4adbVVu/m6bdQuKxQqv4BW3CB5mLM3avETVx7P5
	iUSH/uZoD72nhNSSuBWHT8n2Hwz3U1Zm4PMVkA0CKTcQBypuVhj66aYHPNJIC2tgvCgEg6ev9hY
	7Fu45nR1Y8ZRV59r0x1JBgD8m14RJDP7b3vvYmNh1H3xlntR4ash1L9eUP0O2gEZI9GfLPFu+eP
	A4XfqPXHP883WzrIPk8l28/nZsKNvMPpqLuDQsEIDxweNfSGFRUfqeGAnMWck2Uf82D1HOn7Zqz
	bKfsosmPG1k7pctxIf4x6p6XJYaFOm6EFCmwpjanqpqaSk0Eavfnb7hZV+ux6urXdo+v8UPwoLG
	8WjLHJUtFzNqKib4aYby0QxrPBXNdGd/xZ52iPrafW9Nrlcz6+VC1AyDn8YGRVxIH4JJO7FEYfZ
	KU9ovvYrZmwRFK1i1t5zMYkqzLW0/i8r0kMvV+d4ZFmryU5C1e3nIzNWZNmw==
X-Received: by 2002:a17:90a:c890:b0:36d:b680:3029 with SMTP id 98e67ed59e1d1-37a01847858mr14328244a91.1.1781516429578;
        Mon, 15 Jun 2026 02:40:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8e9asm9936290a91.2.2026.06.15.02.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:40:28 -0700 (PDT)
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
Subject: [PATCH v2 05/11] ASoC: fsl_spdif: Use guard() for spin locks
Date: Mon, 15 Jun 2026 16:38:18 +0700
Message-ID: <20260615093824.115751-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615093824.115751-1-phucduc.bui@gmail.com>
References: <20260615093824.115751-1-phucduc.bui@gmail.com>
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
 sound/soc/fsl/fsl_spdif.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 1b9be85b34c2..ad1206ed9882 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -853,17 +853,15 @@ static int fsl_spdif_subcode_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
 	struct fsl_spdif_priv *spdif_priv = snd_soc_dai_get_drvdata(cpu_dai);
 	struct spdif_mixer_control *ctrl = &spdif_priv->fsl_spdif_control;
-	unsigned long flags;
 	int ret = -EAGAIN;
 
-	spin_lock_irqsave(&ctrl->ctl_lock, flags);
+	guard(spinlock_irqsave)(&ctrl->ctl_lock);
 	if (ctrl->ready_buf) {
 		int idx = (ctrl->ready_buf - 1) * SPDIF_UBITS_SIZE;
 		memcpy(&ucontrol->value.iec958.subcode[0],
 				&ctrl->subcode[idx], SPDIF_UBITS_SIZE);
 		ret = 0;
 	}
-	spin_unlock_irqrestore(&ctrl->ctl_lock, flags);
 
 	return ret;
 }
@@ -885,17 +883,15 @@ static int fsl_spdif_qget(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
 	struct fsl_spdif_priv *spdif_priv = snd_soc_dai_get_drvdata(cpu_dai);
 	struct spdif_mixer_control *ctrl = &spdif_priv->fsl_spdif_control;
-	unsigned long flags;
 	int ret = -EAGAIN;
 
-	spin_lock_irqsave(&ctrl->ctl_lock, flags);
+	guard(spinlock_irqsave)(&ctrl->ctl_lock);
 	if (ctrl->ready_buf) {
 		int idx = (ctrl->ready_buf - 1) * SPDIF_QSUB_SIZE;
 		memcpy(&ucontrol->value.bytes.data[0],
 				&ctrl->qsub[idx], SPDIF_QSUB_SIZE);
 		ret = 0;
 	}
-	spin_unlock_irqrestore(&ctrl->ctl_lock, flags);
 
 	return ret;
 }
-- 
2.43.0

