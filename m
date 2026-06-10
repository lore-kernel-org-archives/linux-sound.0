Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8653F264A9D
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 01:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781055365; cv=none; b=u+bWg1/KEBmhumGcZRiU+89ItikM/NibCTAkVDu8oqs/L2Ctt+oPm28jtFc+yeybSs88kf+G/qYdYZt/jYJZ1QBRDf9lhG/2j6NC8+pySUQf64i0mYxuA108qRSdW4OKf0m0fTOuM98U72u7Wt6jfAyZFszc5CHlGpLLCyEQfCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781055365; c=relaxed/simple;
	bh=yIG8jnwjO1ragfb5xNiBZHB1/3Bcd6VQBxhZPtWgsyM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QcR+HVLZ5kx4wrgy267D4R9UK7uzjTJL+eGLSRnpRO4DXSNJ8EbUFH4eFxSBdI271JeMwgOSttRFbJItT+qkPv52PG31mblgA0AGjJxfPPsEYvhD05ChCMPUOkkYmMGVHMORB4FPU+iWevdoG9PVYHKkgVz37nkQJIbcAW3738I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cMFgkbXU; arc=none smtp.client-ip=74.125.82.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cMFgkbXU"
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-304df7ff4c2so4209841eec.0
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 18:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781055363; x=1781660163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MQAAiHMYlO3uSh+R3O+4fd1kAqMjv9d3rR1NkImJiMk=;
        b=cMFgkbXUZYUOGfw47Lh0YxHyvHYCATwKKUG9TxlpFEvr+N/ggG7KaB0lcR5Lxhi3Ze
         426WGCqC6TFxdOdnBFGIY1OyeJMmgzUzMibfukJO7Br3ON1nVPuEQBgbl7XJXl/3JMIx
         j7AJAeKKD/9jiC2abqAtVorZHt994rGlkmGPTNaZm2fh/3Q77g1wuoMlyZjNEDV59tJz
         gDnqAJq08XPHIFtxq+XbahePtvV/MqTDapKetnbjgvQQ6EooNFmiUglahyGugxHy5FGv
         6Kj+qXD+zqj2D7nD0aT6kVUZQxeKxuP8pG+016btm+OwSx8XD7hqhIP7BawLwOFSoIxe
         C5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781055363; x=1781660163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQAAiHMYlO3uSh+R3O+4fd1kAqMjv9d3rR1NkImJiMk=;
        b=bTdalmJf3ZOQT0jC0PziRNKojd2Tly5Aprcm0H17dUdpseyeR3zu/1yBjB47su4yvY
         VriwZJSm39eLpc73JEaDjNSH63EGWMbNaSf0JnJyyGjCu8GOud7WqyhLJc/l8JbleVOK
         BJDwa16Gi/1Ruv1c02PEi/Bv4nSJD18m5WDg9d93Rn5F4PCgvGvj2a5w0yz84o76O9Wg
         JANYZxMavY7Y2vOkTXd/c8pHtS8lJ18AvrZrCf0TAsAHXCGHXp1kwjbMeN17TLm554B7
         IDSskK+fUB+mPOTilRSiXbdvd2euVX/rKmI6nXIk3q0hUS4F8VD8AIyfx7x+EOWa1uvn
         W2JQ==
X-Gm-Message-State: AOJu0Yx2gUJG6+BIP+cI676i6wF1TbBV1hx5Us0WCofEF9EQC1ZVUEoW
	F1T4lOSZwvona6mHfLvI0SafCgzV714lu/Cq4t3x6JvGVUzrjEKMI7NxdqABrfym
X-Gm-Gg: Acq92OGYQnpxtAO/NvkiLwmLX7u6NpM3QoYQL9YMydEPatrAVrt4q+l+I8tAQ1qaa7j
	Xa1nF72QnrgGpQP9ZxQkM4j4cVUzbvvtBLpUBhQ8CjQEZJdnwNdlsqolWREPJl4L9pKZDDFAO/M
	L2NQF8xjOKmOXodqekEALRYK4Y6IA2fky+0SIeDyU2Vtl/C674XHkyvRqMcSayez7idEY7PFUe/
	nCkn++EOzEe4KrXjcOTgP08YdBsj8Acsip3uU8NP4MbcwY7HY5DhRmcP8VHeSoatA4PKkiQoh6A
	rRq3KdDDiIOyY7wdbMpX0IGIn8sm7vxGJtAAclmQaiGBK3+rqIkAgtqW/+bwqxZN5VtFzwkfKeZ
	PDh3Smasp8tgyaHoSBNyOzIdZXuNJoftYBi4suI6rSIUtpt1HYuaBha9pG1ck6njjUVQy8RWbSM
	KwYfz1CRy+pVNeNJComrTYtkcVzEFncwer2nyJr0mtGfJ9rkqxdZGwxP8+tyI8usIHAC0pAonTW
	eru+7WM5cl30yDcRRQFekVInbkTf46mMhL0vVzaMoqqLW0t+yIpqY3R2MW9NYCjg/FjagS0W3ly
	VsT0YJjqE/b4vpBZGZmV9lVcwWzS
X-Received: by 2002:a05:7300:1355:b0:2ed:a58c:942 with SMTP id 5a478bee46e88-3077fe53f52mr12188355eec.8.1781055363440;
        Tue, 09 Jun 2026 18:36:03 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df48671sm24103902eec.24.2026.06.09.18.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 18:36:02 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: tas2783A: remove unused tas25xx_(de)register_misc() functions
Date: Tue,  9 Jun 2026 18:35:34 -0700
Message-ID: <20260610013534.30762-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tas2783 driver defines two functions tas25xx_register_misc and
tas25xx_deregister_misc which have stub implementations. It uses
external implementations if CONFIG_SND_SOC_TAS2783_UTIL is enabled, but
that symbol has never been present in the kernel. Therefore, these
functions are entirely unused. Remove them.

Discovered while searching for CONFIG_* symbols referenced in code but
not defined in any Kconfig file.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 sound/soc/codecs/tas2783-sdw.c | 2 --
 sound/soc/codecs/tas2783.h     | 8 --------
 2 files changed, 10 deletions(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index 90008d2d06e2..1aadb3a4c3a6 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -1011,7 +1011,6 @@ static s32 tas_component_probe(struct snd_soc_component *component)
 		snd_soc_component_get_drvdata(component);
 
 	tas_dev->component = component;
-	tas25xx_register_misc(tas_dev->sdw_peripheral);
 
 	return 0;
 }
@@ -1020,7 +1019,6 @@ static void tas_component_remove(struct snd_soc_component *codec)
 {
 	struct tas2783_prv *tas_dev =
 			snd_soc_component_get_drvdata(codec);
-	tas25xx_deregister_misc();
 	tas_dev->component = NULL;
 }
 
diff --git a/sound/soc/codecs/tas2783.h b/sound/soc/codecs/tas2783.h
index bf34319c9a9f..d5996c73526c 100644
--- a/sound/soc/codecs/tas2783.h
+++ b/sound/soc/codecs/tas2783.h
@@ -100,12 +100,4 @@
 #define TAS2783_CALIB_DATA_SZ	((TAS2783_CALIB_HDR_SZ) + TAS2783_CALIB_CRC_SZ + \
 				((TAS2783_CALIB_PARAMS) * 4 * (TAS2783_CALIB_MAX_SPK_COUNT)))
 
-#if IS_ENABLED(CONFIG_SND_SOC_TAS2783_UTIL)
-int32_t tas25xx_register_misc(struct sdw_slave *peripheral);
-int32_t tas25xx_deregister_misc(void);
-#else
-static void tas25xx_register_misc(struct sdw_slave *peripheral) {}
-static void tas25xx_deregister_misc(void) {}
-#endif
-
 #endif /*__TAS2783_H__ */
-- 
2.43.0

