Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BFECA4B
	for <linux-sound@vger.kernel.org>; Fri,  8 Aug 2025 05:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754632660; cv=none; b=q4F+CMWgjbYQdrnnCJ9k60+Em6JRyOklNvbvQTmLVMVIkcegU4yrLmbRbWSIbHYkyotgiDPTZhsg6Tieg2KUaPjSSynEGs9ofqE+FSFXlkRVQzhUVmFDrq2nJOJSZ8XnLQR8tadB2Uufkj39hLnq93BX/dVQ2A9M1H9uFktgVw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754632660; c=relaxed/simple;
	bh=6uQJIT7tQeiNXVy/jdeJCwXuCFAQRsiTo0NPCzrysqs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Rl3zP1N/IGqgiAyvEEBut1G3V8Pa/OI8iopvn6wh3wWIxCn330B+JOhXWSI9IkrK9Uckl2fj0+uvQBgvnX3Pqy70N9PU5ukfHxLJoR+5dzYJ7uj9GHq+VQTFfYnNm70gRI8leEVtGZeT5tdOWUXT9M9Y1bjvPRlo3YUgVqCcUh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=kz0pGylX; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="kz0pGylX"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5785vBuO52762467, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1754632631; bh=cHlQBCNFmaiAQX9+bSSghl9HNk7EKO0d94aAGziaSvU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=kz0pGylXbMEwmVsxxZhY+QHS+YkOiXS5H51dEuPzJ0NDKJSo36Lefh8BJv5mn/YZN
	 hS0rlVm4k1gdGXOq9l6pJM9XX2OoCoIzvOSDJAFhp3piYy5+05aZd7lwb+D5TTgTYK
	 uxlG8Jtxfybd7I3eKGvO37us0wifZucXw/nd5YnN6ojIeo91riR4qqL8PJC+wngjyX
	 tbA+4T5Ui0/Z4/sjQ8k22+t4iQX5uhp0MowqDMEZN1BAA1FMsOhgAFSEjJ8dKcxZTM
	 Vae/LEFdRTpytFb66AMeoMPcyU0RfkkZl76CCfVp6RFUSAtBbSUQn9Hx3u8w2gDIk2
	 6uDeHpxQ4j+eA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTPS id 5785vBuO52762467
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 Aug 2025 13:57:11 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 8 Aug 2025 13:57:11 +0800
Received: from sw-server.localdomain (172.24.54.4) by RTEXMBS01.realtek.com.tw
 (172.21.6.94) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Fri, 8 Aug
 2025 13:57:10 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, Shuming Fan <shumingf@realtek.com>
Subject: [PATCH 1/2] ASoC: rt721: fix FU33 Boost Volume control not working
Date: Fri, 8 Aug 2025 13:57:06 +0800
Message-ID: <20250808055706.1110766-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: RTEXH36505.realtek.com.tw (172.21.6.25) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

From: Shuming Fan <shumingf@realtek.com>

This patch fixed FU33 Boost Volume control not working.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt721-sdca.c | 2 ++
 sound/soc/codecs/rt721-sdca.h | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/sound/soc/codecs/rt721-sdca.c b/sound/soc/codecs/rt721-sdca.c
index f6f7c2ffde1c..a4bd29d7220b 100644
--- a/sound/soc/codecs/rt721-sdca.c
+++ b/sound/soc/codecs/rt721-sdca.c
@@ -278,6 +278,8 @@ static void rt721_sdca_jack_preset(struct rt721_sdca_priv *rt721)
 		RT721_ENT_FLOAT_CTL1, 0x4040);
 	rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
 		RT721_ENT_FLOAT_CTL4, 0x1201);
+	rt_sdca_index_write(rt721->mbq_regmap, RT721_BOOST_CTRL,
+		RT721_BST_4CH_TOP_GATING_CTRL1, 0x002a);
 	regmap_write(rt721->regmap, 0x2f58, 0x07);
 }
 
diff --git a/sound/soc/codecs/rt721-sdca.h b/sound/soc/codecs/rt721-sdca.h
index 0a82c107b19a..71fac9cd8739 100644
--- a/sound/soc/codecs/rt721-sdca.h
+++ b/sound/soc/codecs/rt721-sdca.h
@@ -56,6 +56,7 @@ struct rt721_sdca_dmic_kctrl_priv {
 #define RT721_CBJ_CTRL				0x0a
 #define RT721_CAP_PORT_CTRL			0x0c
 #define RT721_CLASD_AMP_CTRL			0x0d
+#define RT721_BOOST_CTRL			0x0f
 #define RT721_VENDOR_REG			0x20
 #define RT721_RC_CALIB_CTRL			0x40
 #define RT721_VENDOR_EQ_L			0x53
@@ -93,6 +94,9 @@ struct rt721_sdca_dmic_kctrl_priv {
 /* Index (NID:0dh) */
 #define RT721_CLASD_AMP_2CH_CAL			0x14
 
+/* Index (NID:0fh) */
+#define RT721_BST_4CH_TOP_GATING_CTRL1		0x05
+
 /* Index (NID:20h) */
 #define RT721_JD_PRODUCT_NUM			0x00
 #define RT721_ANALOG_BIAS_CTL3			0x04
-- 
2.34.1

