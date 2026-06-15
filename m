Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429773DA7CE
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 09:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781516383; cv=none; b=Iz6R1ma7FSU4XOQpH36Ig2Vzt+RdC6mqdPL4LOMLeEj1lHW7gv63VVNS20bkxSW/uGhe+ybC25AAH2OSKyb2pGrh5JdRUqaSE04gJqhmC0GAoJT0tWQp15Qnmi87uaWIhN5ami93BdBNWRwh/YB+0iBxQTM5Mw+1cLhAFuseO6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781516383; c=relaxed/simple;
	bh=8wyc3RY6uip+bGnwzBR+Cf6kRzh4sj2U9E0OtlF0qCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JlEFWoLYd8d/bg8oFUwAQhn3IpWcW8dQiHGaN3x41HeFwXEvo8r1ECIFh4eIXJj2BcxkARW0POyyBwLsHxWFyf39lcr1yRrb635eJfVSRF2aXzewZJFYZOcXVee6WiXiiODo19lpnYxioUOc863gPmUoDwEGmRoWGH3lMXHNw/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2QDQg2F; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2QDQg2F"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36ba285e98bso3082821a91.2
        for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 02:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781516382; x=1782121182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6XAdGAHmWyaxfC0CIkFTqcFEJz2zy9rtxVk5mFpwGBY=;
        b=A2QDQg2FfFl8VYC2FPTA7ANRiyu/Qr+QmhM73rINtdg0veJSxUgU1X8jnwg5PTNXwn
         hVN0FoDfwpIyLhIa0386VGyYDV6JdCVGEeRS6yY6im/dS1uz8Qixa1wMh/+93b5A6WVh
         G1UzWBWoEy/R44DqyzpSb+Wtax5w9oowJ5gxp6n32NRc8NK6L/hmBugst7tSeETESDre
         vrjkEMnBXeiAmiVh039MdpZfjKwMFtF8r0YiOgFJTEOjiCoaIWc1SW1uTjnoaXwFbY+Q
         E/3ilHOS4nDyjXsHJfepcnoXRvv/mDT3A0FXV3tGC9i6Y89OmP92WmU/HHdpTTraItZC
         A5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516382; x=1782121182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6XAdGAHmWyaxfC0CIkFTqcFEJz2zy9rtxVk5mFpwGBY=;
        b=Bstn882lq2LvJb/5yw/NpFUJwVXs6hVDTPl2Ut/YY1Brt/08v5gUnmKKby0T56vS1f
         oKWXDLroJyPFwlECCodNepBd/ypBogUzyZec+ve4XIH4Vo9VsyxAa4n2dO2j8ppzL1j/
         yHHHvIUmjhoGTsFgfjPuns2bIh7G1oA4X0kH5kGW4679r+4qP+lJiF7vwsn4rcbv4upj
         CLd/S8ATnGvnl5oJV3UUGMFk7yqttsGMdYa78sCKI4oXwBQ1KTdfsR4D9RUUZzYyp9cl
         sHbF8xSIyj3qOttfo6xLf5jgP0qD0xMkB5xqMlqfdHsDqxr/c5hk2afqMoytxYQxR3sB
         82iw==
X-Forwarded-Encrypted: i=1; AFNElJ80Ds/4keYEUpGjJhcJ3HhiA7QkBdyvXQh6KwNT+nKg/vZLAqQC4laWxBI5hjpWI5n+7pSyLLM4rpmuIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFKdH4Z1dgPu2rJ9zqw7U9hr/iXm6ivMhhYBo9cc8x5qmHffCa
	EyseyPrShnGvmE/LG1wp41xg8OjfC0dlJQR3zuzxqROiQSMSEQHYbz24
X-Gm-Gg: Acq92OGDyBqmQX4aC1nwMSB4QCfzRwLw+SXrrIlBv+mrrAmYl04+DTjBFaZp17Tf0ID
	bVScN+kquMYPWz6xKGYI5kmPT35mwpqUnaZNCVsoWEWiFo8mONC1Qr2flSJgbNDcmdjGIOARm5Y
	gCi9VSzD2v551YbRjdXJ90v7xmT7abtEU7MMebWTeGoPJLrWrYsIukc6Ts4bx0Hm8ZatlIqVpsd
	ANrS6Olsvtx7r5TmVejvEopfEEPmQcA7iPDo14PYXEmzU2BuhcxJJiSGKo+d+RYijN204T+jpaW
	Cr/FnhEppj7VpQugj9mxSEdZGIq+dBP21QqAPpeLeVWXqu9kyKs7vPzp25WNJR+rCALsCT44vIW
	bmR3uyxmnyHfEnaICcdtrNi4j7ihEvx2xHLTXQGyhkFPepD73TJxBUWQbfbRpoYeA+eFeZznyjy
	drcyOn7Q2XJNBH1Dfz8cmBWFre4m5PuDNdXdB5OpqxtV02OK3sAHpv8o7+Gw==
X-Received: by 2002:a17:90b:33ce:b0:36b:3ecd:88d2 with SMTP id 98e67ed59e1d1-37a01847928mr13640118a91.3.1781516381562;
        Mon, 15 Jun 2026 02:39:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8e9asm9936290a91.2.2026.06.15.02.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:39:40 -0700 (PDT)
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
Subject: [PATCH v2 02/11] ASoC: fsl_audmix: Use guard() for spin locks
Date: Mon, 15 Jun 2026 16:38:15 +0700
Message-ID: <20260615093824.115751-3-phucduc.bui@gmail.com>
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
 sound/soc/fsl/fsl_audmix.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
index 40a3b7432174..066239c64037 100644
--- a/sound/soc/fsl/fsl_audmix.c
+++ b/sound/soc/fsl/fsl_audmix.c
@@ -280,7 +280,6 @@ static int fsl_audmix_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 				  struct snd_soc_dai *dai)
 {
 	struct fsl_audmix *priv = snd_soc_dai_get_drvdata(dai);
-	unsigned long lock_flags;
 
 	/* Capture stream shall not be handled */
 	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
@@ -290,16 +289,14 @@ static int fsl_audmix_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		spin_lock_irqsave(&priv->lock, lock_flags);
-		priv->tdms |= BIT(dai->driver->id);
-		spin_unlock_irqrestore(&priv->lock, lock_flags);
+		scoped_guard(spinlock_irqsave, &priv->lock)
+			priv->tdms |= BIT(dai->driver->id);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		spin_lock_irqsave(&priv->lock, lock_flags);
-		priv->tdms &= ~BIT(dai->driver->id);
-		spin_unlock_irqrestore(&priv->lock, lock_flags);
+		scoped_guard(spinlock_irqsave, &priv->lock)
+			priv->tdms &= ~BIT(dai->driver->id);
 		break;
 	default:
 		return -EINVAL;
-- 
2.43.0

