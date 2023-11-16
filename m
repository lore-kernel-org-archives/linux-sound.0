Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A74C54FB9
	for <linux-sound@archiver.kernel.org>; Thu, 16 Nov 2023 13:29:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345159AbjKPN3Y (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Thu, 16 Nov 2023 08:29:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345123AbjKPN3X (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Thu, 16 Nov 2023 08:29:23 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 248C59A
        for <linux-sound@vger.kernel.org>; Thu, 16 Nov 2023 05:29:20 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9f26ee4a6e5so116923766b.2
        for <linux-sound@vger.kernel.org>; Thu, 16 Nov 2023 05:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700141358; x=1700746158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=phasBQ66hQbV8v95EjxNAAfUnHVV0YTsbzlRXy0LVJ8=;
        b=O+rvX2SmWkjhuyWZqSos5L71ynPn0tJFNoTSNpk/pmU/4MjohPfVc7sX6ytziFHhge
         e9cB8c61O1YOeEUZQqIbcq0dlDxQ7ekmG1hxZuVplB+tyyIZMV/jyTuxFEN5zmgkbWnX
         ghpuVcv88Fjfbt2Mz+1YxlWYoEvLFeqPmyD4r4dX9ITG/qCYt+yKj3mFSKgDUXFyRXRY
         c7JEMfbM2vtt86b27+4OIwzuBorsvoasCPOnEXjhpt1WNhi4OnqZZ1JOLMAQMVj6WLfb
         /yOGR9vUXw8onLU05p24/BIMJYkg9+MQRcalJAUOuyZ2p4+VoquZF0AKCGoWKrGs4my9
         VpVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700141358; x=1700746158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=phasBQ66hQbV8v95EjxNAAfUnHVV0YTsbzlRXy0LVJ8=;
        b=IW9SeR/XyfOBPdpDazrfAQZiQycFog26+seX2XQTpakcR2+QjYtESpyzRZxV/ANb48
         DwYij6hH8fZUBaA7hHiB2GDomv5mRsOkzp3Pxg9SHK/lMLwmEuDGPVFECGiwDadNGK5t
         /eFJw9b9n3Yf+59DQ82pVyLdsOydXwKXl4vvDFgXCLZ8LNN3uiXyrAipXx0pRvCDmU8I
         sFlHJfDXRpgAD61mqvkUPEX+BK5MCLt76qqO7MPn5Vf1HKawiqE/M+pjtiBb7GxCAPVh
         4CpquT+5tt1Q0eQtiPpIVjtWF6SfjzGs05sorKvAGhCAFW6kdWUVjbgz/OExGY90LdiX
         y2xg==
X-Gm-Message-State: AOJu0YzNNQ5ydEFU+1nIL83N7DieCS/En1LVW87PyhTIdQf0gpAID5cy
        ehUxviYujVZ7JdJnIcixIZk=
X-Google-Smtp-Source: AGHT+IETQAqTtflawuPNOpNHdANLA92iBYVUDChkLW4axQQ8AlPTGr7K5HhSq87VLm7W3qwBnxwgPg==
X-Received: by 2002:a17:906:ae91:b0:9a2:28dc:4166 with SMTP id md17-20020a170906ae9100b009a228dc4166mr12113941ejb.75.1700141358357;
        Thu, 16 Nov 2023 05:29:18 -0800 (PST)
Received: from IFM10N30752.intra.ifm (87-206-74-243.dynamic.chello.pl. [87.206.74.243])
        by smtp.gmail.com with ESMTPSA id cw16-20020a170906c79000b00992e94bcfabsm8374529ejb.167.2023.11.16.05.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 05:29:18 -0800 (PST)
From:   Kamil Duljas <kamil.duljas@gmail.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
        linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>,
        Kamil Duljas <kamil.duljas@gmail.com>
Subject: [PATCH] ASoC: SOF: topology: Fix mem leak in sof_dai_load()
Date:   Thu, 16 Nov 2023 14:28:49 +0100
Message-Id: <20231116132849.1534-1-kamil.duljas@gmail.com>
X-Mailer: git-send-email 2.35.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

The function has multiple return points at which it is not released
previously allocated memory.

Signed-off-by: Kamil Duljas <kamil.duljas@gmail.com>
---
 sound/soc/sof/topology.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index a3a3af252259..ef8f8991f025 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1736,8 +1736,10 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 	/* perform pcm set op */
 	if (ipc_pcm_ops && ipc_pcm_ops->pcm_setup) {
 		ret = ipc_pcm_ops->pcm_setup(sdev, spcm);
-		if (ret < 0)
+		if (ret < 0) {
+			kfree(spcm);
 			return ret;
+		}
 	}
 
 	dai_drv->dobj.private = spcm;
@@ -1747,6 +1749,7 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 			       ARRAY_SIZE(stream_tokens), private->array,
 			       le32_to_cpu(private->size));
 	if (ret) {
+		kfree(dai_drv->dobj.private);
 		dev_err(scomp->dev, "error: parse stream tokens failed %d\n",
 			le32_to_cpu(private->size));
 		return ret;
@@ -1764,9 +1767,9 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 	ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, sdev->dev,
 				  PAGE_SIZE, &spcm->stream[stream].page_table);
 	if (ret < 0) {
+		kfree(dai_drv->dobj.private);
 		dev_err(scomp->dev, "error: can't alloc page table for %s %d\n",
 			caps->name, ret);
-
 		return ret;
 	}
 
@@ -1782,9 +1785,10 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 	stream = SNDRV_PCM_STREAM_CAPTURE;
 
 	/* do we need to allocate capture PCM DMA pages */
-	if (!spcm->pcm.capture)
+	if (!spcm->pcm.capture) {
+		kfree(dai_drv->dobj.private);
 		return ret;
-
+	}
 	caps = &spcm->pcm.caps[stream];
 
 	/* allocate capture page table buffer */
@@ -1810,7 +1814,7 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 free_playback_tables:
 	if (spcm->pcm.playback)
 		snd_dma_free_pages(&spcm->stream[SNDRV_PCM_STREAM_PLAYBACK].page_table);
-
+	kfree(dai_drv->dobj.private);
 	return ret;
 }
 
-- 
2.35.2.windows.1

