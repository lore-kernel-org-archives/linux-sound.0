Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1330632AADE
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 06:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779950514; cv=none; b=HPXIk2w9HubV4Yp4ChaZOOmnpzXE0VC8SyHz68Myu9ot1qQ9tqXCxmlCbqwaKhjAulL/xGKp8j+aRO0REwlQRdp+uB2Dmhzg7qiVGaNNH39hn40Ojo1s0e7/QHuYJR/1C+GG+d2LKLaEVX7m3zkRPTjOaDUud3rdvIZbT1jEZbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779950514; c=relaxed/simple;
	bh=qKlJOVQ8CeguRlCMIV6TL5JFjOuni3FW2zUBP4TnhuE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MKprgTh19S+fdEWr6A/SZF1k5P57dEUuor8w+I2oAksGyG9hXd7ihzZ3vIWJuR6IwGut4jU8uaTq5dI3PbFoYedNMv7sDOf6xtpnSDp2ILo47GGFaeqS0LIV4WLrTKx/EoR9zNl+IoB5ErfUNOAH4hxnSwWWvpKQY5P6+fVZKeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VfH9qze1; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VfH9qze1"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c798fc1a28cso5341280a12.3
        for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 23:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779950512; x=1780555312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eyGymNqbhiXLlzQIXinZjQ2T/+xHy6TN3+8MZhwVUx4=;
        b=VfH9qze1UMaQlmwBWAQjxIPBZ8clMOgWZ35Yhz8pabY411Ak89d8IACWxlk22Bjdoj
         rZTn9xJiFmnobRhjQwgZDWjQ6Iz/GPZN4YsN6NWMjnYC6s4k4NlG4gxSKM8c7OpEJdI7
         iKFN902UgS5ZAcWAKqrRKKUqSDxwOg071DS5aiqQN3OemzZPy+0Sx8bCoWRRuMDeSugH
         WGSdJtM/q6UJcslaaZ6LEMfw+fM67sPl5EE3vgkX7yCM9TRpqQPJV3NwsudblGfe9Wc9
         2XxSi3nSaTmIgrnwa37c+ozJ3cmb+xxKABPX5XatnRBGLVJxikxIwcKK6G5LiMThQRPq
         D5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779950512; x=1780555312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eyGymNqbhiXLlzQIXinZjQ2T/+xHy6TN3+8MZhwVUx4=;
        b=N5xHdTDGngc+yonSy1zbESdNg/hTQeN8okdg7/jWBVdQSYrLxwc0/vETc+Zt8Ap4pb
         P8n8QS1USPFkB1hcLjnJ98y6Hq/I9+yYr8pYxjaOccevA+pOMRZG9+8QgUB7ReyKrUCR
         DEYQRAyjBcNOJl0xA4q1VeVuy/p15RpjmcA3I+RA56J2yvNj7fDt67VLwQz0Fs2z/BIr
         GSNKRQJJUMjSV3F0ek+Hhk6kuBgaT2R+ElVErynamt8EUltyJlCeJQMPMKQgCS1YX9ci
         QgAJuoe6ZfOFYIJOaRcly3KUJq0sVIHcPqMnju+4IXR9L4+tjJGSGbNTgOWXvaIgLsPZ
         HAVw==
X-Gm-Message-State: AOJu0Ywmu4UMQrSD9JsXiXcCOTvm5MUqcXQWZKgnK0/j+zx9jtSBzivA
	Ma/8SF3pJu3FWDc7X96hNAFsupNEcPf2BosXVs2HqF/PQ3yO6Rc0lrHK
X-Gm-Gg: Acq92OEDsC6FW8MHjcs1EKjomkgJ8KJ5yGFLc6C3oIlEOVq4DX9QoIw/JJ8m/Hqa2Dw
	cXBoVjbaLbdiOPEK3RFoJ4L6d1azB1fVwXiMTZZkd7tRcknK/2Z5vTLok6nHV7SCKNapssVlbHs
	SdueD6R6ycv3pYeI/dU7sEP96KMcRewSMo0iN0PNY2avAzqxqIZZvrKm7AmlEm5/hqg55Bs49W5
	fc45+FOhJHTRUnhB2VhbfHZnn5gGH13sEyxzUHFn+eBjywyZUhaL1vKaeaVvflO88M/XEaVZGxO
	wIn2fpDnfeYvdb99GG6s6gAIalrUOoMExaYoLiE/QAgzYOVpOgCJzyGQShWsv000oyudoNwWrlk
	sJUg5aGNv/ggGyZTAgLrt3zkaJXNo6PoJQ95qrBRwcmvwpsAE7Z3I5tWuemRbmjnMxZV3KyT4id
	u25xW+KXieg1WwCPuyr4q1oWVZO8UvPlAmtDux52uY9xAMg8ubv8+EyT/AR1j9dDp1+w==
X-Received: by 2002:a05:6a21:9d91:b0:39f:9eb3:1d09 with SMTP id adf61e73a8af0-3b328ee2e52mr27362688637.37.1779950512300;
        Wed, 27 May 2026 23:41:52 -0700 (PDT)
Received: from oslab.. (n058152075021.netvigator.com. [58.152.75.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c852056db34sm14417515a12.27.2026.05.27.23.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 23:41:51 -0700 (PDT)
From: Tuo Li <islituo@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	kuninori.morimoto.gx@renesas.com,
	ckeepax@opensource.cirrus.com,
	vulab@iscas.ac.cn
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Tuo Li <islituo@gmail.com>
Subject: [PATCH] ASoC: mediatek: mt8365-afe-pcm: fix possible NULL-pointer dereferences in mt8365_afe_suspend()
Date: Thu, 28 May 2026 14:41:06 +0800
Message-ID: <20260528064107.470824-1-islituo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mt8365_afe_suspend() allocates the register backup buffer with
devm_kcalloc(), but does not check for allocation failure before using the
returned pointer. This may lead to a NULL pointer dereference when
accessing afe->reg_back_up[i].

Add the missing NULL check and return -ENOMEM on allocation failure after
disabling the main clock.

Also propagate the return value of mt8365_afe_suspend() in
mt8365_afe_dev_runtime_suspend() so that the suspended state is not updated
when suspend fails.

Signed-off-by: Tuo Li <islituo@gmail.com>
---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
index d01793394f22..5966ca18c7c9 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
@@ -1974,10 +1974,15 @@ static int mt8365_afe_suspend(struct device *dev)
 
 	mt8365_afe_enable_main_clk(afe);
 
-	if (!afe->reg_back_up)
+	if (!afe->reg_back_up) {
 		afe->reg_back_up =
 			devm_kcalloc(dev, afe->reg_back_up_list_num,
 				     sizeof(unsigned int), GFP_KERNEL);
+		if (!afe->reg_back_up) {
+			mt8365_afe_disable_main_clk(afe);
+			return -ENOMEM;
+		}
+	}
 
 	for (i = 0; i < afe->reg_back_up_list_num; i++)
 		regmap_read(regmap, afe->reg_back_up_list[i],
@@ -2011,11 +2016,15 @@ static int mt8365_afe_resume(struct device *dev)
 static int mt8365_afe_dev_runtime_suspend(struct device *dev)
 {
 	struct mtk_base_afe *afe = dev_get_drvdata(dev);
+	int ret;
 
 	if (pm_runtime_status_suspended(dev) || afe->suspended)
 		return 0;
 
-	mt8365_afe_suspend(dev);
+	ret = mt8365_afe_suspend(dev);
+	if (ret)
+		return ret;
+
 	afe->suspended = true;
 	return 0;
 }
-- 
2.43.0

