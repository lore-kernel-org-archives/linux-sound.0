Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979D83CCFD0
	for <linux-sound@vger.kernel.org>; Fri,  8 May 2026 10:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778236752; cv=none; b=tEVDchzuigiML9q5cl6rP/44Hx53Mob/7ZYm1p8jloF1f09NshDnbpsNtHPc3lBZPS0/x7HnO1owJcbTC9C/HdnE0kceR3oTh1E0pbrTUU8GYthsdFU6NHTrJCeuCjrV/DoPYgu0U4TRljF4OO7A1VCGVaBF4YSynwY8tG7eA28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778236752; c=relaxed/simple;
	bh=IDfulofV8L3pjBAwtb/03nHXAYUcs5a20eJyXfotbwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XyljfyfEizATOBpfPZ7NPLEz9l63XI/BzDorzPrq7OAb3ik+YajxIXbnFlUN/Rutxm8I9/Blqw6jERvuFB8zKFHdve8AI6FVahnnQOMRxlEt/Th1l3tB1xngym6e5zmbS/P1WTqEv04Hqt2QfJcb9q7UMitL1PdcBGofcEH/YcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HADUq02j; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HADUq02j"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ab077e3f32so8924935ad.3
        for <linux-sound@vger.kernel.org>; Fri, 08 May 2026 03:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778236751; x=1778841551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4zKyR5U1yAXuf2WaMek/cM/qR7vazFRcQvHEtxImguA=;
        b=HADUq02jxeyeOIveZd7w7EYwT6G1v3nrgHsV69x8oSiWWp3JiVtiokQQFF7jGH4HfN
         HLVTdYpn4UJ6nVoyXCPxG0FRcKyZRu76H6/xx23OV0Lm5WsoJbVrF5adVXji7UprChJK
         isi3VqYUkJePRvHkG9kznDKJWJQwKSC5I2P/COoy2EB3yTJOT4krTWM8zDLsGR9hkJWY
         C20HB3EPnKyDvLMaYLYhLE36BevGpLS+OabokUsgoen81CIeVPLof0cw99aLsradV/Vs
         4yw6cir6cPBP/CHbiyUpcBawdQ8eZ7lt8segjYnT9NtLDgI9NuXeWI5F9PYH+WTrDw6p
         2xIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778236751; x=1778841551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4zKyR5U1yAXuf2WaMek/cM/qR7vazFRcQvHEtxImguA=;
        b=KYrrl9zlhOtRWjGJHnVL1ZoxWzQXLQupuk8XsBuCQ26P/dzuZ+cE9kP9Q6i45VCnhC
         q/E3XEqlRhKJmrqyvI1vAUCRLRZEKxX7xTH5bB8FlfoxJEffGL3bpK/V02P0zbkw0uZ1
         gPLq3k5ROnv6KLLvkijyp/z9k7RUtPQbSEUoBhnHw8MSiwyoTqy6kR6Mkj2pKgwM6t0H
         jTwCoSDoDpGY52byvxv2FY4WIeEt/RCnTTHYd3o/wq75T+t5KO2HEMx1HYCqk9gMYXH5
         SnWm13GhOTYEpdTtGQvvWJiuEIhctHekkC9QIL/0rCu10aPDOUGhkwr+L6s6tXPskOW8
         RjSg==
X-Forwarded-Encrypted: i=1; AFNElJ814r2BsxcThsnNnIfRmTitrRPzgbeWEh2W/8ma7P9ADgYDZtuKEE+EXaFTWNnz2AMd4RNbG9ztZ+HllA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQLuZAkdX8GqGle12psCuml1Ij+SgI80Q8mGLWkNkPtV84biM2
	gyuvRkqhvykCjresY44HcA0wWTqqhLaqWWKz201ODOCUW366nuYia2bt
X-Gm-Gg: Acq92OHg/Zocbt73aaM9wTz51tgFtm1B6S4495K0X3fpeIPI/SrXCU5xyE6F6ZjCwZa
	sIhHj2R1rjD4QKa2b8gwAWyk2Axx/eHgeHcHWxs3Y0stTtwcRDNFszyVCI1v+fMxC69Y9nTyo0G
	Jy72BVJFs7uPVJVSUEjwPzLyGjQPwtwC2cpKnNG9agcaXGcjU/spuNCSl8pyVBwepc2lQXeQSom
	mhGbclF3UP5M0MOKDf1ebc/fyo6H5xvV4GUbepGZZ1qNFZNeSQxS7lVr+LtiGdUyL3Cgm7FNMwF
	chEQKLYzoMeTxV3gtOUuLppTkoRkxHCYjOEKYBXx/mZ7mojYwthWC8jbJYXNpg+GCCbNgg2aul3
	jBW2cHkeSv+v6b7lNH5ucibZjNGp7RKfXSmjfplbZ+J9dXu5zSYn+g2tzcVPncfRh+JFz/DkP3+
	1Qj5i1i/ILzBX4CzSg6ReGgzHl0PoBv2yx+jU7ffh74C7VTCCAMQVIku8UWg==
X-Received: by 2002:a17:902:e98e:b0:2b4:5e65:5d0e with SMTP id d9443c01a7336-2ba78c40260mr94019615ad.10.1778236750894;
        Fri, 08 May 2026 03:39:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d27109sm18309345ad.1.2026.05.08.03.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 03:39:10 -0700 (PDT)
From: phucduc.bui@gmail.com
To: peter.ujfalusi@gmail.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	jarkko.nikula@bitmer.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/7] ASoC: ti: omap-hdmi: Use guard() for mutex locks
Date: Fri,  8 May 2026 17:38:33 +0700
Message-ID: <20260508103837.138142-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508103837.138142-1-phucduc.bui@gmail.com>
References: <20260508103837.138142-1-phucduc.bui@gmail.com>
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
 sound/soc/ti/omap-hdmi.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/sound/soc/ti/omap-hdmi.c b/sound/soc/ti/omap-hdmi.c
index 55e7cb96858f..e60f5b483fc5 100644
--- a/sound/soc/ti/omap-hdmi.c
+++ b/sound/soc/ti/omap-hdmi.c
@@ -49,7 +49,7 @@ static void hdmi_dai_abort(struct device *dev)
 {
 	struct hdmi_audio_data *ad = dev_get_drvdata(dev);
 
-	mutex_lock(&ad->current_stream_lock);
+	guard(mutex)(&ad->current_stream_lock);
 	if (ad->current_stream && ad->current_stream->runtime &&
 	    snd_pcm_running(ad->current_stream)) {
 		dev_err(dev, "HDMI display disabled, aborting playback\n");
@@ -57,7 +57,6 @@ static void hdmi_dai_abort(struct device *dev)
 		snd_pcm_stop(ad->current_stream, SNDRV_PCM_STATE_DISCONNECTED);
 		snd_pcm_stream_unlock_irq(ad->current_stream);
 	}
-	mutex_unlock(&ad->current_stream_lock);
 }
 
 static int hdmi_dai_startup(struct snd_pcm_substream *substream,
@@ -86,16 +85,14 @@ static int hdmi_dai_startup(struct snd_pcm_substream *substream,
 
 	snd_soc_dai_set_dma_data(dai, substream, &ad->dma_data);
 
-	mutex_lock(&ad->current_stream_lock);
-	ad->current_stream = substream;
-	mutex_unlock(&ad->current_stream_lock);
+	scoped_guard(mutex, &ad->current_stream_lock)
+		ad->current_stream = substream;
 
 	ret = ad->ops->audio_startup(ad->dssdev, hdmi_dai_abort);
 
 	if (ret) {
-		mutex_lock(&ad->current_stream_lock);
-		ad->current_stream = NULL;
-		mutex_unlock(&ad->current_stream_lock);
+		scoped_guard(mutex, &ad->current_stream_lock)
+			ad->current_stream = NULL;
 	}
 
 	return ret;
@@ -261,9 +258,8 @@ static void hdmi_dai_shutdown(struct snd_pcm_substream *substream,
 
 	ad->ops->audio_shutdown(ad->dssdev);
 
-	mutex_lock(&ad->current_stream_lock);
-	ad->current_stream = NULL;
-	mutex_unlock(&ad->current_stream_lock);
+	scoped_guard(mutex, &ad->current_stream_lock)
+		ad->current_stream = NULL;
 }
 
 static const struct snd_soc_dai_ops hdmi_dai_ops = {
-- 
2.43.0

