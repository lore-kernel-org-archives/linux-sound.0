Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1EC3DE44C
	for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 12:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782390500; cv=none; b=rJSUkcK2H59s51oHOBy5Kqiq26KPhYJi34WEmYp2OsIILoBYQQKStP1+vwUCfR1o7Xye/GvHYGyZTIKXk/2oGVxAl50gkuUyVitcSLRVD4RebC0IkQEg9e4LIrQnr8RMSZn9Wz8w2k+x1Dik6KV5xnW4Mvqjt38wA9MHrTU/r3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782390500; c=relaxed/simple;
	bh=KRKpkWP00bNEF4grMq3i5I7hOtSL5fvYq5mom76z2uE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Vune0n4mlWt3OjjXbtfEPnZWpuG9Lg61H7WzTFErXiulNv5BLqa+Lndp5s6NGdcdTM/ZEFXl9M4VSxHB404EvBqc7N8GfsURGweJdcywMHB3i0cWuMQSTYs7+QMvoh0Os9r1PW8uCSYM/w9ZusKkOZ30hbLdAwRAGJgyOMI0o0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PkNv0HBS; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PkNv0HBS"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so22412115e9.1
        for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 05:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782390496; x=1782995296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=acZXyqUmvZIylO1mvvipo8nK5yGrkk/MIYuMVpE7WOk=;
        b=PkNv0HBSwpivNBK1VT44w7TZXyXQRGANOqWo01nOtpXg32tG+7Keqvk/EK/mAiAk3a
         EcOA3BziJBPYE8ddeGOqUHcQ+XVZJ2JeRJ1hX7PKPoGhvu/TEhXrgcXf1fLxq+Nrsg2Z
         ww7q2FUudFFtqwoYIArbuN1GLUt9QWrLp7h0GTQX5gpAygjUYW/2YHp/0kxrBvK/A+0z
         KvOLdkjxVHvkvuIoW9oq6fVnSOqHRBSA3vTyiQ33F3N5y5BN5wy3RNQwyI/du07bz6zu
         5FLapm0CbJEfxNgPV8OAlostLWvM8WQ7lBrs3v4+196dEoEB6QXVq5P/j1IDV09YXnPd
         /s6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782390496; x=1782995296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=acZXyqUmvZIylO1mvvipo8nK5yGrkk/MIYuMVpE7WOk=;
        b=RG8mi3AwXJFdX5HimPLCooky5JAgXZIrLzCmSTpbOVGGec5V2/vjQ7enp+0utDvc68
         3jFLgDokg+atCDHflU50cRI1jhWdY85q9g6/XtUQYuoPITe6C0w79gI3w3GP7ng+BCp3
         ViCJignutG97lbKJAPdSc/IBG4wRk/U7VlJ87L/fbVsPllaNOG5e8k6qZDkJ9zQ7Wdjn
         drVZyxg690vDT3ImU6boeQo9stNam4zyWOrCrAxsuPtJjUbxnSgpTIki7Z3jyjlPDwIv
         MrAj/qmr5WqQ2GBNQbefKnDTcGb4v5pNGiRtMlikfy0Wp9EDBb3WF3Vy5DGPMjYvWb+o
         A6nA==
X-Forwarded-Encrypted: i=1; AFNElJ+48g5pEC2na0flTet9KoyKNoonyZ4GuS84hWjsdJKbjks1Fj8xlu9DDmIA/YLMndo6R5RnSztB2Frt1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFVa3AWNADWYeX4IKTJoobV8gFS0tYFn80l9OiBbQyM7DjJG83
	zL5KG5pGA5JRO1UnKTUxoGmrBk6EpP8wSecL3sNS5wZhzXY6SZ7js3UH
X-Gm-Gg: AfdE7cl9UzqHYX3m3jyFYosrCNiVZmHGSK1cSJKmgnpAGpAlaw6rB/gEuJFJwI8E6zS
	JajnacePDclxXr9ZRlgLHG/FQJebLyInE8/1nubBmHR1QQQ0tlRZU/tC3GG1Qxp6WCp48uhB8Nu
	PDg6AsccLf2KNqo+cU68Eyq+jyuE/EPWXMMlj4x2+sZ/8cDklXYFyDrvYA4DcAw4ugsAHAXeSdu
	N0e0/luCkGr9TS1SS0Qow/V/sdRTwmh9cTcdgCpWsCSCBWe5x4tKmlG99I0mm6CEt7PhZ29qSvj
	KsdZrWnVOchsYJTvmE9TEH50WvjRRjaR444c4J4uRW5UfKfLrlC+kVV7CPERn061LwtFP2SLDVH
	gWGCxz+uJ3nPP6Q19lD/lA1SCDfaMineEJlwGRzRxC71T+SdBM7A+3TWPmMEdSzFMmJ0NzZ6PFo
	Y/sZb138RpXXHQk3dp
X-Received: by 2002:a05:600c:8b03:b0:490:c2a2:e91c with SMTP id 5b1f17b1804b1-4926689ffb5mr32412945e9.34.1782390495974;
        Thu, 25 Jun 2026 05:28:15 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1e840eefsm18779181f8f.1.2026.06.25.05.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 05:28:15 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: codecs: pcm512x: only print info once on no sclk
Date: Thu, 25 Jun 2026 12:28:11 +0000
Message-ID: <20260625122811.4056274-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If sclk is not provided the driver falls back to using bclk and prints
an info message in the system log. Under normal operations the message
is repeated many times:

[   17.929576] pcm512x 0-004c: No SCLK, using BCLK: -2
[   17.949172] pcm512x 0-004c: No SCLK, using BCLK: -2
[   17.953029] pcm512x 0-004c: No SCLK, using BCLK: -2
[   17.965059] pcm512x 0-004c: No SCLK, using BCLK: -2
[   82.592980] pcm512x 0-004c: No SCLK, using BCLK: -2
[   82.866293] pcm512x 0-004c: No SCLK, using BCLK: -2

Switch from dev_info to dev_info_once to reduce log noise.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
Changes since v1:
- Remove WIP tag from subject (oops)

This was observed on an Odroid Hifi-Sheild2 board used with Kodi
which appears to reset the audio connection frequently resulting
in 100+ repeats of the message over time.

 sound/soc/codecs/pcm512x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index fdef98ce52f1..fe3b5011fa16 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -633,7 +633,7 @@ static int pcm512x_dai_startup_slave(struct snd_pcm_substream *substream,
 	struct regmap *regmap = pcm512x->regmap;
 
 	if (IS_ERR(pcm512x->sclk)) {
-		dev_info(dev, "No SCLK, using BCLK: %ld\n",
+		dev_info_once(dev, "No SCLK, using BCLK: %ld\n",
 			 PTR_ERR(pcm512x->sclk));
 
 		/* Disable reporting of missing SCLK as an error */
-- 
2.43.0

