Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A603F823E
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 09:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784192947; cv=none; b=KHpwBg1Xz5Zu4zYDa7Gg6TU7mEnZkGGbtefupIakvMqx5DaPr5/P9ziTBB0CHYG4q6SoC9FvuXxTqfwdNRoHORpKl7DF5+50LVL0e9j8fthn3ZJGQQoqnA1Srkj5CHl+EHUxkxHUaFcmlKybann1XMfoMzGtzVEsFOzOM3UmV+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784192947; c=relaxed/simple;
	bh=CoOWwx3COYYV6QKb4PIOurNZuXUVvz9Dj5UwRk88Cfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=igVYmE3qpJCZ0tRGEiyzE1s3wyo5090sJWJWDpxq5xN7ntYqdUuscz/cY2rApXEFcOKYzP6zSzfNEhWFHANNG8dbbzrYYwni+/SpgqfgCDA95XcGLAIQj+Omb7UyGCNrPgr/LDNuoTR06c1egEDvDEJXtbW524zoYYKUFE7tzZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cn8bSOAP; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cn8bSOAP"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8484f229529so2190651b3a.2
        for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 02:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784192944; x=1784797744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8RPHamdnITVkuNj/ZkeTHvpdSQod9yZXbGMbztdv1oI=;
        b=cn8bSOAP+olGB7CpaILMFcOGxJGd0cLnhwAtKkek9rcElfDv/qxfy9HHOG5Q/vIMgt
         dTDvbyqpOwyqBTvIfS5lzpGB7HQKRSrUYiC9MWlbjFaJFwaMph3Y1M8fbbDAH2DQqk12
         qXEcc1Poq2iezhUijw18XhKtmIvtYSutDLl2JKa6zIOyUnZ52VGIJ4jwRgjcRA8m0ubu
         u7gadyiczI8a6REMh8Gt9asjTsJTe1KtyKGgCvbz82icmv9303I4J/cWp+++fDaHSqy9
         UB4wB0Vy8y1UpetRz2QpM6qHF0UR1wtm9JCd2a9xoaIaFb4HvNVDNGRAa3X8No4TJaaj
         O1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784192944; x=1784797744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8RPHamdnITVkuNj/ZkeTHvpdSQod9yZXbGMbztdv1oI=;
        b=kcVTcvSy41CH7FuhYxYxvA8m82xerY+l8dLTG/vdd23/1CfQVPgfFTvsmfSZaVLsWM
         JTSDBttP/6ILautgZBZ90v+wrJwhhvIoLSDVUyBTxqRnLbq9bX4sD6Jdz8um/Iku1KJT
         7TRoS1sBAlmfR33HaV/xcB+q27q664ZmuGf+jB+TIj9fMYWxSw2uAVuVPqdP+WzdsyFL
         YT4CV3uyhGm/OFZt/+rkVTKj+ej7O4Zr2mEZz+afQ76igcnHb9XitrZLyH0lO4+RKCFY
         oc5UeMFfIXFYZX/miEfCw8jTetCwAGrbmLLBe5XCmD+L+fcHpjEKt/qcMCgKnqO9/Z0v
         fDug==
X-Forwarded-Encrypted: i=1; AHgh+Rp/ldn63qnmuzoO88r+yQsa5Io5UOAr3CLYS9LDOSpVe0oHjvThDJSegYf66REf5lIRbZt3Hn3YRgkskA==@vger.kernel.org
X-Gm-Message-State: AOJu0YytLWext9FtglnqbN4+LeAESrNmeyntOg6xBuft4uJqrL1YV1Zg
	lEpt+I5XMAieRv0roXZnMcq15zTHdcjTS2RqTAO0o+YabU9LjIOXiXkT
X-Gm-Gg: AfdE7ck0biepVgmh8L6KIAtQjdxMpBiCf03d2iJOYz0JF8AeagBXv9H1XLyZ+d5btmk
	u38GKOwNs2nUiXVbT9WnP0pD1yhpV2me+AWZgIClLZaMoYXTRc8O8ZkJZ5pD17AAME3DjBPGriO
	wp6YPwyO4y4H4EBhH6OIm79ud3P9J/+Czi8y5giWmMzo5gsjGhRgITdnvNQDY6xdNLzllXvQqhB
	2xMq9Fkkuuz9J3alm3C35Ob45Iqj5BrQBEb6F9n7k1WrPwSoWB6p+2m4Rf8BxfcTkCeyQ9Fj+s2
	QheU8T5x3/q5e9s0+R7GW+q52nfzYD3MjWYl0PPBWUZD2llaADovFMFZRX8ymOBBF2DaWgM1Kib
	MEV+FSvOYY5yfI+LuxFCf74aA28nighNjTL1yol1uM8hc/SLlq9brX229iCscDeZAHiZ1gJrGKn
	KSlpxOaKpbTXEwOg4zptjP35ebMEO5LwhRPhjA
X-Received: by 2002:a05:6a00:3388:b0:847:7010:f3e4 with SMTP id d2e1a72fcca58-8488971543fmr20770811b3a.25.1784192944447;
        Thu, 16 Jul 2026 02:09:04 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f6bf5ecsm4511800b3a.29.2026.07.16.02.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:09:04 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 05/10] ASoC: ti: omap-abe-twl6040: Use dev_err_probe() for error handling
Date: Thu, 16 Jul 2026 16:08:24 +0700
Message-ID: <20260716090829.72082-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716090829.72082-1-phucduc.bui@gmail.com>
References: <20260716090829.72082-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Replace dev_err() with dev_err_probe() when reporting
devm_snd_soc_register_card() failures. This suppresses
unnecessary log messages for deferred probe errors.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/ti/omap-abe-twl6040.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/ti/omap-abe-twl6040.c b/sound/soc/ti/omap-abe-twl6040.c
index dfa931071d81..05239ccc1f41 100644
--- a/sound/soc/ti/omap-abe-twl6040.c
+++ b/sound/soc/ti/omap-abe-twl6040.c
@@ -296,8 +296,8 @@ static int omap_abe_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret)
-		dev_err(&pdev->dev, "devm_snd_soc_register_card() failed: %d\n",
-			ret);
+		dev_err_probe(&pdev->dev, ret,
+			      "devm_snd_soc_register_card() failed\n");
 
 	return ret;
 }
-- 
2.43.0

