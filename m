Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734F9481B1
	for <linux-sound@vger.kernel.org>; Mon, 27 Oct 2025 10:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761561163; cv=none; b=azbhONw8R5QcuTAioVKuZipGOBt0pde1den1BMLOz3nve/vPhwxy1IAj43Ptzk/WHaHHhKBBIoKCG9Tfp7U83w2U1EKnbvFsHsDhrFyrtVb3A7CWOhJgESwELjE3OuNtb7C0IhkD/uGF5K+ABdUdAi+uZbYv4z0JB4B4ynHmGDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761561163; c=relaxed/simple;
	bh=Qmvabv3V1lJkuQff1i4xLJHfqpykGwTrf6/8Vejg9gY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Wrgpq1HsC8iudMpGSwdoG8trLUMw+4MObTwsfs0SnN6wMe/tmJ6UygjYexi/PmpPpD4BSzuQVJXhM1rjI/CvlXEDbpP/SV+eymN93LlFxTKvn0PP1guccBk3DzY3zB5RdrXpuYtE/mAk29l5DoyY0HfSJM0LKnhDqlm0GncuNi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=rVSR6N7Z; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="rVSR6N7Z"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 59RAW0F70557527, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1761561120; bh=vA3s57Z4s/MtsH7S6WHlOSMw63ibQDdESWD+kzuf1vE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=rVSR6N7ZVna+YxFacVOLaHKp8mZbYrNmJu1ffDAOUv2BjscA7zLHx41Yf6g/k277E
	 bnKqTHUAws+/YO9qnrDwm7W6mBmILEa8VPlTrYY47eveKUX+u87s+h7jyKuctLtPWz
	 i9dn1mX7p60xcsQN7G+RjgjRtWRmHfMjn1Nrjj0HQZT/rGXSNJfFJSOVKmDF13Nyke
	 VHGCIZLXXDoZUvx4E04CBIEHTjM/+kBFSYB3BzREItsPADsVujqVQnCYxwjnJtOEX0
	 A8IFQC9xQmUoSBewHFOo7rgrZWH39lLCgz0nEHKhtOgKrhe0OM7mbvhTkiyZ1JRRns
	 +iCUmEh+OPNNA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTPS id 59RAW0F70557527
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Oct 2025 18:32:00 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Mon, 27 Oct 2025 18:32:01 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Mon, 27 Oct 2025 18:32:01 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server id
 15.2.1544.27 via Frontend Transport; Mon, 27 Oct 2025 18:32:01 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, <Vijendar.Mukunda@amd.com>,
        Shuming Fan <shumingf@realtek.com>
Subject: [PATCH] ASoC: rt721: fix prepare clock stop failed
Date: Mon, 27 Oct 2025 18:33:33 +0800
Message-ID: <20251027103333.38353-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Shuming Fan <shumingf@realtek.com>

This patch adds settings to prevent the 'prepare clock stop failed' error.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt721-sdca.c | 4 ++++
 sound/soc/codecs/rt721-sdca.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/sound/soc/codecs/rt721-sdca.c b/sound/soc/codecs/rt721-sdca.c
index a4bd29d7220b..5f7b505d5414 100644
--- a/sound/soc/codecs/rt721-sdca.c
+++ b/sound/soc/codecs/rt721-sdca.c
@@ -281,6 +281,10 @@ static void rt721_sdca_jack_preset(struct rt721_sdca_priv *rt721)
 	rt_sdca_index_write(rt721->mbq_regmap, RT721_BOOST_CTRL,
 		RT721_BST_4CH_TOP_GATING_CTRL1, 0x002a);
 	regmap_write(rt721->regmap, 0x2f58, 0x07);
+
+	regmap_write(rt721->regmap, 0x2f51, 0x00);
+	rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
+		RT721_MISC_CTL, 0x0004);
 }
 
 static void rt721_sdca_jack_init(struct rt721_sdca_priv *rt721)
diff --git a/sound/soc/codecs/rt721-sdca.h b/sound/soc/codecs/rt721-sdca.h
index 71fac9cd8739..24ce188562ba 100644
--- a/sound/soc/codecs/rt721-sdca.h
+++ b/sound/soc/codecs/rt721-sdca.h
@@ -137,6 +137,7 @@ struct rt721_sdca_dmic_kctrl_priv {
 #define RT721_HDA_LEGACY_UAJ_CTL		0x02
 #define RT721_HDA_LEGACY_CTL1			0x05
 #define RT721_HDA_LEGACY_RESET_CTL		0x06
+#define RT721_MISC_CTL				0x07
 #define RT721_XU_REL_CTRL			0x0c
 #define RT721_GE_REL_CTRL1			0x0d
 #define RT721_HDA_LEGACY_GPIO_WAKE_EN_CTL	0x0e
-- 
2.51.1

