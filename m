Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355CB3BED5F
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 08:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784189086; cv=none; b=BQrSRCG0jSfbL7yM4uUO/Gt692ZjnLn2RVIVc8ciOzrWILnNUO3SMGXsASmiU7xBgtLpJLkCjoFZZFrCllRz0gkFkiSiMvPQUlFHHLhriWnMsfCnA3D3V8CY8LCClS2DkPwA2Xk4xrrUxna/HjPD6Tt8aWXxG/s+fNNzf+AnMm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784189086; c=relaxed/simple;
	bh=DlU2zxnZriBtX4Ei5QrUL9XizaCDlZlSoZzzHGdrDWk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rgTOnufGn6Q6j6GWSuPebQ8ENAxCebZCPGFT/LL7Wo/u/ULyTD7vUGDaJpDZheNtlO+YtVSpwHaoOYmx6Z4xVWQc+nPY5QIR2Zz7MLeJh7ClJRALrsOEFnvnANtOI69fviqPhTcFoJpF6A4GZj7V+uHI9nXG41+XL8pGXs6fss8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZq7nRQB; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZq7nRQB"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2caced6038eso4598405ad.0
        for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 01:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784189084; x=1784793884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f9BS8NNAejL6wSrHiH8bKpJoXfBHJM+21C85fxNq9mc=;
        b=QZq7nRQBzh2hi6wW2icB3932zUrUIe897nPqwnq5nAexy4tZ/K1f8X/WulSJp9x+PG
         URInqSk5mKVIvSWoR5Gm7iDVqYClat0+6uL2isOYgX2iXY6aRiZsyp7RIFkZMGKm4/ec
         OcJoy/9TURDROZlKkXsy82EoUuIrq7oVLBnK45Hcfne9MDIChQtuWkaHFq/3p6V+ARHD
         ZMuK8vtY1kPKKGJorF+8g93cC+91pouMvK2ADgg9V+Jp7fMLRU8OADE1kUBlF6PyceSr
         X5i9jGzZ9EOcDLRTQwAnA4VAmfRI7x34WXpKJhuG0kDhYSM8VUZFbcngUEnanHcAy+di
         6cXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784189084; x=1784793884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f9BS8NNAejL6wSrHiH8bKpJoXfBHJM+21C85fxNq9mc=;
        b=S4JtHGlj1Jw9kdyFGbIxVlxyyYfxu1Po9M0ZhOLt8th0rEodLIShhfsgUqD3xmnyHX
         iUaA8opWbX8I9v+ogA1pGIJpVvNOMc7ZqpAIF+a3dJMWKl5YgT5rkjbRDqf94IvuFmC1
         lWC7TeWIezfv++PgxO4usOp5B+XHSTlznWg2/ikWztznUbRNRr+6OdDZEUU+YFDu3kXe
         7BgP6ZXuFRI5eRi2pHeW4YWr2bqiDDpWMNPTZWUnOx/vPUpIyWA/hVhbmmHKweSfgCjI
         vQw8ClZy/FRorDr/Ykzw75wdwFNSwHreuvmRvdhqRU0M+TiwpilRzBQnvSWUSgaSG/WF
         Er4A==
X-Forwarded-Encrypted: i=1; AHgh+Ro0UwUoXqtzSP6tvTYhpXb4K1OZfbkCCe2Ai9K+AwuMMZbDDIwBwQvjnJhmxGc2uCbBcSG61JQyLvFx/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2aq8ECGK1vx1LX9OgS1Fv7oYdoADWs4Vsw85zVzxRjpyDP2DW
	PoREDUc6c0T75rriF88W+KeZO5v91dj+pXqPlxBgZycSB8BsJaNDqoIh
X-Gm-Gg: AfdE7clAI+ofksZ5Tf68nbwmNvu6rm3TyrPuwdvKZbcIDhgrPrgTP2wdAy1MoXY9BDL
	9L81coy9wla8KXGu9a0MnNyayAf2m0tFOQacMqmRwKT8vIsiT+b2E/+IlosMn5aKG06wTxR+Sme
	Q/rGyXKCS83KkCYFwEUIJOUa4n+LVuCTxvoGbZibFAVoktywm67XIv7lHyo8sQPMwnD3myyLACk
	8aylvk1pFt0LASbxVMSc0R5/VjEeIkJetWjUcU5xOCFfNxgefasS8KS//HQyycJ++67e6f/GvXh
	ZyrklRx7chB5SVedT07IqfJJg2vDb17nT0rfDCvdXI6zDTWsvQp7iuQGBQCFUm+mZsgk2zrS0HE
	97FJMdRZtoEqBjcfNPAdaA/gm9zsz+CcxYTuWXEoKEmY8l/MXryF8xEoYWe32OkUZHSpWe7ENI7
	HDMdbxz4Rm11JUmrEq0sz3Umbjyk3+O6mA2p+3
X-Received: by 2002:a17:902:e885:b0:2ce:d958:e3b with SMTP id d9443c01a7336-2cf1f570c5amr15363875ad.25.1784189084378;
        Thu, 16 Jul 2026 01:04:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf101639a3sm15896905ad.37.2026.07.16.01.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 01:04:44 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: soc-generic-dmaengine: report DMA channel request failures more clearly
Date: Thu, 16 Jul 2026 15:04:28 +0700
Message-ID: <20260716080428.57979-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Currently any dma_request_chan() failure other than -EPROBE_DEFER is
silently ignored, since a missing channel is expected for devices that
only support one DMA direction. This makes two real problems
indistinguishable from that normal case:

1. If the channel name is actually present in "dma-names" but the
request still fails, that is a genuine error, not a missing direction
warn about it instead of staying silent.

2. If neither direction ends up with a channel, the PCM device is
entirely unusable. Unlike missing just one direction, this is never
expected, so fail probe with a clear error instead of registering a
non-functional PCM device.

No change for the still-silent, still-supported case of a device that
legitimately onlysupports one direction.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/soc-generic-dmaengine-pcm.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index 467426d2b5e4..c15c2d8248fa 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -395,6 +395,11 @@ static int dmaengine_pcm_request_chan_of(struct dmaengine_pcm *pcm,
 			 */
 			if (PTR_ERR(chan) == -EPROBE_DEFER)
 				return -EPROBE_DEFER;
+
+			if (device_property_match_string(dev, "dma-names", name) >= 0)
+				dev_warn(dev, "dma-names has '%s' but request failed (%ld)\n",
+					 name, PTR_ERR(chan));
+
 			pcm->chan[i] = NULL;
 		} else {
 			pcm->chan[i] = chan;
@@ -406,6 +411,12 @@ static int dmaengine_pcm_request_chan_of(struct dmaengine_pcm *pcm,
 	if (pcm->flags & SND_DMAENGINE_PCM_FLAG_HALF_DUPLEX)
 		pcm->chan[1] = pcm->chan[0];
 
+	if (!pcm->chan[SNDRV_PCM_STREAM_PLAYBACK] &&
+	    !pcm->chan[SNDRV_PCM_STREAM_CAPTURE]) {
+		dev_err(dev, "no DMA chanel found for either playback or capture\n");
+		return -ENODEV;
+	}
+
 	return 0;
 }
 
-- 
2.43.0

