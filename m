Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC4B64A8F
	for <linux-sound@vger.kernel.org>; Tue,  7 Oct 2025 08:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759824661; cv=none; b=m8bStsA1sc/X3svYZJYbUVmO92eoml6PmUSJeV7Vdj5cv2YoBXHq2gjeX/VKzwZdQuY2Ad4wzqD2CUThqYA4iAaaj1vqwJt6VLGaQqtuhGD4gy/AqtHg91eaD6MWfnKUJ/sLJvASJiw4c7cR3zO8Th94lT3gnD/UGeOzddN+xpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759824661; c=relaxed/simple;
	bh=zs9kP+PKpnd2hr/LqYOXj9OQk5kzB7OTPWk5+ibCg9U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YBI2a0xecQKBt5pcNH/gulFOQY/XgxOtTRbnPVTkaics+Fz3SITWEOpBCfk6/b6ATdR0hInP9YtlwemeHNS3coy6l3ZFxTyqNPsz6lV6+2JWjgduJokRbzNHZp2pWK8bsgcKHVNvVFRSrsWNcEMzLvRKqaHQ46FYHQV7rCWlf2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=dYUt/k1d; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="dYUt/k1d"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5978AXAn83748703, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1759824633; bh=yaYtKjkdUE7ltawtPuw2CBSQn0ZiYj5Sfke0M0ECV1c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=dYUt/k1dhKVmIpQky2RXFxqYj0VoiNE7YW/JB3UG0F48LoNq64aJELDbMrhsulQte
	 HLOj2AE5lWWBIBzXVGAxOV8UhwFKOAgfgLOLea47bhDSxIk7AcpHVQpp7zvS+LvBA0
	 biWtNlqjko8uds8t6tfIQM89sO5/TY2SUcEQwFge9ZaOTtsqL8MGF4PO/6YU10SNRI
	 zgZeZTVwI0FQr9oiHwYc8BCJqCBPFBzvI9m9eFhAMGqkC2lWV77Ki/KXG/c+oTFsSc
	 9UdYgpC++DjE+bxWNjQHWaIYC9UJeRSGFFwVtKYyQdGnT57KJnxqxBQN6WYjLY2dQ8
	 6lGGX2EL7RqjA==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTPS id 5978AXAn83748703
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Oct 2025 16:10:33 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Tue, 7 Oct 2025 16:10:33 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Tue, 7 Oct 2025 16:10:32 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, Shuming Fan <shumingf@realtek.com>
Subject: [PATCH] ASoC: rt722: add settings for rt722VB
Date: Tue, 7 Oct 2025 16:09:50 +0800
Message-ID: <20251007080950.1999411-1-shumingf@realtek.com>
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
 RTKEXHMBS06.realtek.com.tw (10.21.1.56)

From: Shuming Fan <shumingf@realtek.com>

This patch adds settings for RT722VB.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt722-sdca-sdw.c |  2 +-
 sound/soc/codecs/rt722-sdca.c     | 14 ++++++++++++++
 sound/soc/codecs/rt722-sdca.h     |  6 ++++++
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
index 70700bdb80a1..5ea40c1b159a 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.c
+++ b/sound/soc/codecs/rt722-sdca-sdw.c
@@ -21,7 +21,7 @@ static int rt722_sdca_mbq_size(struct device *dev, unsigned int reg)
 	switch (reg) {
 	case 0x2f01 ... 0x2f0a:
 	case 0x2f35 ... 0x2f36:
-	case 0x2f50:
+	case 0x2f50 ... 0x2f52:
 	case 0x2f54:
 	case 0x2f58 ... 0x2f5d:
 	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT0, RT722_SDCA_CTL_FUNC_STATUS, 0):
diff --git a/sound/soc/codecs/rt722-sdca.c b/sound/soc/codecs/rt722-sdca.c
index 333611490ae3..79b8b7e70a33 100644
--- a/sound/soc/codecs/rt722-sdca.c
+++ b/sound/soc/codecs/rt722-sdca.c
@@ -1378,6 +1378,9 @@ static void rt722_sdca_dmic_preset(struct rt722_sdca_priv *rt722)
 		/* PHYtiming TDZ/TZD control */
 		regmap_write(rt722->regmap, 0x2f03, 0x06);
 
+		if (rt722->hw_vid == RT722_VB)
+			regmap_write(rt722->regmap, 0x2f52, 0x00);
+
 		/* clear flag */
 		regmap_write(rt722->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT722_SDCA_ENT0, RT722_SDCA_CTL_FUNC_STATUS, 0),
@@ -1415,6 +1418,9 @@ static void rt722_sdca_amp_preset(struct rt722_sdca_priv *rt722)
 			SDW_SDCA_CTL(FUNC_NUM_AMP, RT722_SDCA_ENT_OT23,
 				RT722_SDCA_CTL_VENDOR_DEF, CH_08), 0x04);
 
+		if (rt722->hw_vid == RT722_VB)
+			regmap_write(rt722->regmap, 0x2f54, 0x00);
+
 		/* clear flag */
 		regmap_write(rt722->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_AMP, RT722_SDCA_ENT0, RT722_SDCA_CTL_FUNC_STATUS, 0),
@@ -1506,6 +1512,9 @@ static void rt722_sdca_jack_preset(struct rt722_sdca_priv *rt722)
 		rt722_sdca_index_write(rt722, RT722_VENDOR_REG, RT722_DIGITAL_MISC_CTRL4,
 			0x0010);
 
+		if (rt722->hw_vid == RT722_VB)
+			regmap_write(rt722->regmap, 0x2f51, 0x00);
+
 		/* clear flag */
 		regmap_write(rt722->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT0, RT722_SDCA_CTL_FUNC_STATUS, 0),
@@ -1516,6 +1525,7 @@ static void rt722_sdca_jack_preset(struct rt722_sdca_priv *rt722)
 int rt722_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 {
 	struct rt722_sdca_priv *rt722 = dev_get_drvdata(dev);
+	unsigned int val;
 
 	rt722->disable_irq = false;
 
@@ -1545,6 +1555,10 @@ int rt722_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 
 	pm_runtime_get_noresume(&slave->dev);
 
+	rt722_sdca_index_read(rt722, RT722_VENDOR_REG, RT722_JD_PRODUCT_NUM, &val);
+	rt722->hw_vid = (val & 0x0f00) >> 8;
+	dev_dbg(&slave->dev, "%s hw_vid=0x%x\n", __func__, rt722->hw_vid);
+
 	rt722_sdca_dmic_preset(rt722);
 	rt722_sdca_amp_preset(rt722);
 	rt722_sdca_jack_preset(rt722);
diff --git a/sound/soc/codecs/rt722-sdca.h b/sound/soc/codecs/rt722-sdca.h
index 3c383705dd3c..823abee9ab76 100644
--- a/sound/soc/codecs/rt722-sdca.h
+++ b/sound/soc/codecs/rt722-sdca.h
@@ -39,6 +39,7 @@ struct  rt722_sdca_priv {
 	/* For DMIC */
 	bool fu1e_dapm_mute;
 	bool fu1e_mixer_mute[4];
+	int hw_vid;
 };
 
 struct rt722_sdca_dmic_kctrl_priv {
@@ -233,6 +234,11 @@ enum rt722_sdca_jd_src {
 	RT722_JD1,
 };
 
+enum rt722_sdca_version {
+	RT722_VA,
+	RT722_VB,
+};
+
 int rt722_sdca_io_init(struct device *dev, struct sdw_slave *slave);
 int rt722_sdca_init(struct device *dev, struct regmap *regmap, struct sdw_slave *slave);
 int rt722_sdca_index_write(struct rt722_sdca_priv *rt722,
-- 
2.34.1

