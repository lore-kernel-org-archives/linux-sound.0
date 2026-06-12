Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3292337CD31
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 13:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270832; cv=none; b=AExW+q36yudrjVBHr+QJss0EwjM0brbaVerr511p0VWZaS1QY3VxTzD3xJVsnt4QrHHDS23ofbL+DykpGm2xLeT0pLcX7zDFWAaWzoe1a7Zdd/mESp1y/83y1zfbmexPai89wzZGcMCYJgqtiO7hCzLUdL23hRpWAXyYEM4HHW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270832; c=relaxed/simple;
	bh=8wyc3RY6uip+bGnwzBR+Cf6kRzh4sj2U9E0OtlF0qCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QhDL52Fh779wwvAocvLt7M7DbnM0yLZr7k3ASL0+vIe9nP2faECmHvp0UEZzOzhqlLlZsCM0e1mmsGtSw+yd5whGH48F3R3HSqzfZhRxhrwIy18pNTzASiG1Y/Qj2JegI6BzPdqbDkzXroEiCBa+aglCrSav0pQK5FaJeL+vDbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f1sEdkkz; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f1sEdkkz"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-304d0ac5e3cso2071412eec.0
        for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 06:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781270829; x=1781875629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6XAdGAHmWyaxfC0CIkFTqcFEJz2zy9rtxVk5mFpwGBY=;
        b=f1sEdkkzRLvoJQqABEvgrA2NuQ9XB/bQF8u9CvwyWzVd+YcZFX7LrEaNkLPwYAlZDv
         eO+PMa0u5LEPKBirruhJv0Gt2U5Qrc6hsaxCvQWHpZDcbBMsJvMGPE4HXeV0haBKVQXN
         3ThJMFhf4HA9Iu6DDq8SmzI9gwugD2p+T/hs3HNTedRKYPEzq9CFOhSh3X1BgiWoaYmq
         mzLc6S1UrnVen4WqhzteBwvBuah8qNtmdkLUYxE6rc4VTcgY0sHbeknKhdVrN+Grqmax
         ayIY1u/cq/4GACTEqhYaGL7GROo2wjBBptfeqNFES0/qAbIBKrv9bxkZ154hHaGJ5f63
         xlGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270829; x=1781875629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6XAdGAHmWyaxfC0CIkFTqcFEJz2zy9rtxVk5mFpwGBY=;
        b=d5WIComxJ9g4U3nvZcYK1JQza0oyrGnHxpQzKfFavkykbY3gFJ2ObKCkaVmAMMYMLg
         EagaDgm9nln5YWZViKPVSpD4ncFM1ZFvhvJFc6Vm7UhuCm9LuBlCJ6+moxFcxPvmBgw6
         ejGlSoRahHFlAR7n5Q5fOrz4/n0GcWYa3BYnFMEQb7GkpCl45HTbGKmX7TvQ2vFiVK4W
         +kmby8bZpwhEL1/1h4GH2gaaMNF3pNUf9nO3jhlcvio8MBGlHq37/N79GzpUnFG3AV9r
         AVm9SaIDZMm5j56MwayrZshTficCGtW6/QyvheQtPtCRIWSiedIzjRa7V2QwX81iUuAY
         zgxA==
X-Forwarded-Encrypted: i=1; AFNElJ8hRjr91grJ70LGKrz6I6RrDzHd8U+jne4A97rDsqfvcJCusKpbcP3DGkjnH6Mn0PwOyY3QjXDLNZjPYw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5mPj+1IAcLO4Cg0ZTQYIZvUaw5xn+uc5poctpB6oQ/sx6JbiM
	HI+bo2QtYbr9SLY18NsdYswFRedzx/LnyHsGGCQZqoa++8qEL1HwyYvO
X-Gm-Gg: Acq92OFfCRKH3lizg402UeQjjXABPWBXq2QO2KBvvYejdQY7a3ZL6/QeiFXqUsxW4s+
	cPdYiPLFl0WsyBhRe5q2AKNx/C++QjI7MNnv0AHQZPSgVyvdsYCCmlDeU2aLEBQoxyf3l7kHq4X
	UetUzj4nr07kMKf3f+pSr7xlrasipgiBTdkgIVb6pSull2R2KdyqlASn0fO5UJ9Kvu7ebiQN9Es
	Qs4coocRul0CrzCckj0IZQXGzeOYiOl04pmmzl2PGsYYBBWXDOpGoaYzLt5hdPuch/VM66FyA13
	tfPBQdtQJyNnXFVysP9rpl/ewTfv+k7SMl12xzurIF8eYClA22vPl0pnG+VCrp4NLxPl3h2B7OV
	GSM0jprgtNi578CGbRcIAP+sRkY3y4YPhNqk/gtl0BCvqUjcT8iG9/2o1WhWKR/IFfsScQBRL/d
	EcYout0exO5/Ni94EAuMs5X2P01ql/d3NaFuLaHdqK+c3DIJE5LXfyRxqryw==
X-Received: by 2002:a05:7301:fa0b:b0:304:2176:a871 with SMTP id 5a478bee46e88-3081fcdd9f9mr1776040eec.0.1781270829171;
        Fri, 12 Jun 2026 06:27:09 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f8b5sm3302343eec.19.2026.06.12.06.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:27:08 -0700 (PDT)
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
Subject: [PATCH 02/11] ASoC: fsl_audmix: Use guard() for spin locks
Date: Fri, 12 Jun 2026 20:26:30 +0700
Message-ID: <20260612132639.78086-3-phucduc.bui@gmail.com>
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

