Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35AF380FE0
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 08:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116378; cv=none; b=sT84eL4BwL1OHhAbIK3D5dYTv0gk4q0LbLzEdtrgMpEPjts1+DzWyOpGMiN5Zm2LCc8GN3lyp32Rt+loAc4WhLCMPnLszxZIYep8b9PYdNo+Fn7kGIFQr6iS1Ft2rA8km4Mc4hV1o90TRwdie86gYlPljwUsUdNO7uLrxON4DMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116378; c=relaxed/simple;
	bh=ApMAydu0nmjqHbram8ed9J5O3Qh77PL++QUsRz7dS8U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uvhLALrRzx2PLYBnRVYT885DPbzosW6YQ5BCRc7oW9IB8y/zyqFj+Mci6pqGm2ceeoHdbCOyoFswiwWIZp49IvSQexqrbwT/rGii63LVnFJRhLhnYaOzjnhje0zaHMcSTGlQtMbFaR9B/FeKf2pwB8LFIrQYnYgnb6NIPd6/cy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=CUAU3TR/; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="CUAU3TR/"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 68B8jmv572265656, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1789116348; bh=1o4Tu1DG1DtT3geM5wW61xqr101lfg9fzl+bCsZS3Ew=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=CUAU3TR/ALicOAOsDADoZlcxB4hmH8bApq8I05P/bbaIB0oZsDp1VRh2unkGwDYuy
	 zw0x9h3/KVq5YRmHdjARcyyb5D0vG4KCmIj0U48fOClCK8Be+HFnasc54k7RBLXjvb
	 L6jsI6CB0ZkYGNoLpdzQp/GOaiwDZRgrGdUcf2WVSNSIj7o9ovrXdF7BlQvcMzK+QJ
	 BmsdWLc1LmnmR3rcp/Ktk11svZxJMBKdGTfkZD7u56VBWHdXM1WmV1Nz4cMh79vvo5
	 qd3ZOjPzdWTntAmj4kwICD+amN3+U53g2RjGniTcNgQK4413H5JBVauHIB1wedETVR
	 jmD47LOeOCmjQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 68B8jmv572265656
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Sep 2026 16:45:48 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 11 Sep 2026 16:45:48 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server id
 15.2.2562.49 via Frontend Transport; Fri, 11 Sep 2026 16:45:48 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
	<shumingf@realtek.com>, <jack.yu@realtek.com>, <derek.fang@realtek.com>, Oder
 Chiou <oder_chiou@realtek.com>
Subject: [PATCH] ASoC: rt721: Use the function_status check to avoid duplicate presets
Date: Fri, 11 Sep 2026 16:45:46 +0800
Message-ID: <20260911084546.1342894-1-oder_chiou@realtek.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch adds the function_status check to avoid duplicate presets. The
codec driver reinitializes when the 'FUNCTION_NEEDS_INITIALIZATION' flag
is raised.

Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
---
 sound/soc/codecs/rt721-sdca-sdw.c |  12 ++
 sound/soc/codecs/rt721-sdca.c     | 315 +++++++++++++++++-------------
 sound/soc/codecs/rt721-sdca.h     |   5 +
 3 files changed, 195 insertions(+), 137 deletions(-)

diff --git a/sound/soc/codecs/rt721-sdca-sdw.c b/sound/soc/codecs/rt721-sdca-sdw.c
index eae7d662efae..d0f3fc1978c3 100644
--- a/sound/soc/codecs/rt721-sdca-sdw.c
+++ b/sound/soc/codecs/rt721-sdca-sdw.c
@@ -25,16 +25,22 @@ static bool rt721_sdca_readable_register(struct device *dev, unsigned int reg)
 	case 0x2f50:
 	case 0x2f51:
 	case 0x2f58 ... 0x2f5d:
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT0,
+		RT721_SDCA_CTL_FUNC_STATUS, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_XUV,
 		RT721_SDCA_CTL_XUV, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_GE49,
 		RT721_SDCA_CTL_SELECTED_MODE, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_GE49,
 		RT721_SDCA_CTL_DETECTED_MODE, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT721_SDCA_ENT0,
+		RT721_SDCA_CTL_FUNC_STATUS, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_HID, RT721_SDCA_ENT_HID01,
 		RT721_SDCA_CTL_HIDTX_CURRENT_OWNER, 0) ... SDW_SDCA_CTL(FUNC_NUM_HID,
 		RT721_SDCA_ENT_HID01, RT721_SDCA_CTL_HIDTX_MESSAGE_LENGTH, 0):
 	case RT721_BUF_ADDR_HID1 ... RT721_BUF_ADDR_HID2:
+	case SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT0,
+		RT721_SDCA_CTL_FUNC_STATUS, 0):
 		return true;
 	default:
 		return false;
@@ -46,14 +52,20 @@ static bool rt721_sdca_volatile_register(struct device *dev, unsigned int reg)
 	switch (reg) {
 	case 0x2f01:
 	case 0x2f51:
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT0,
+		RT721_SDCA_CTL_FUNC_STATUS, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_GE49,
 		RT721_SDCA_CTL_DETECTED_MODE, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_XUV,
 		RT721_SDCA_CTL_XUV, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT721_SDCA_ENT0,
+		RT721_SDCA_CTL_FUNC_STATUS, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_HID, RT721_SDCA_ENT_HID01,
 		RT721_SDCA_CTL_HIDTX_CURRENT_OWNER, 0) ... SDW_SDCA_CTL(FUNC_NUM_HID,
 		RT721_SDCA_ENT_HID01, RT721_SDCA_CTL_HIDTX_MESSAGE_LENGTH, 0):
 	case RT721_BUF_ADDR_HID1 ... RT721_BUF_ADDR_HID2:
+	case SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT0,
+		RT721_SDCA_CTL_FUNC_STATUS, 0):
 		return true;
 	default:
 		return false;
diff --git a/sound/soc/codecs/rt721-sdca.c b/sound/soc/codecs/rt721-sdca.c
index a9479d0e4941..0a936938385c 100644
--- a/sound/soc/codecs/rt721-sdca.c
+++ b/sound/soc/codecs/rt721-sdca.c
@@ -142,151 +142,192 @@ static void rt721_sdca_btn_check_handler(struct work_struct *work)
 
 static void rt721_sdca_dmic_preset(struct rt721_sdca_priv *rt721)
 {
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_ANA_CTL,
-		RT721_MISC_POWER_CTL31, 0x8000);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_ANA_POW_PART,
-		RT721_VREF1_HV_CTRL1, 0xe000);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_ANA_CTL,
-		RT721_MISC_POWER_CTL31, 0x8007);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
-		RT721_ENT_FLOAT_CTL9, 0x2a2a);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
-		RT721_ENT_FLOAT_CTL10, 0x2a00);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
-		RT721_ENT_FLOAT_CTL6, 0x2a2a);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
-		RT721_ENT_FLOAT_CTL5, 0x2626);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
-		RT721_ENT_FLOAT_CTL8, 0x1e00);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
-		RT721_ENT_FLOAT_CTL7, 0x1515);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
-		RT721_CH_FLOAT_CTL3, 0x0304);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
-		RT721_CH_FLOAT_CTL4, 0x0304);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
-		RT721_HDA_LEGACY_CTL1, 0x0000);
-	regmap_write(rt721->regmap,
-		SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT721_SDCA_ENT_IT26,
-			RT721_SDCA_CTL_VENDOR_DEF, 0), 0x01);
-	regmap_write(rt721->mbq_regmap, 0x5910009, 0x2e01);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_RC_CALIB_CTRL,
-		RT721_RC_CALIB_CTRL0, 0x0b00);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_RC_CALIB_CTRL,
-		RT721_RC_CALIB_CTRL0, 0x0b40);
-	regmap_write(rt721->regmap, 0x2f5c, 0x25);
+	unsigned int mic_func_status;
+	struct device *dev = &rt721->slave->dev;
+
+	regmap_read(rt721->regmap,
+		SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT721_SDCA_ENT0, RT721_SDCA_CTL_FUNC_STATUS, 0),
+		&mic_func_status);
+	dev_dbg(dev, "%s mic func_status=0x%x\n", __func__, mic_func_status);
+
+	if ((mic_func_status & FUNCTION_NEEDS_INITIALIZATION) || (!rt721->first_hw_init)) {
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_ANA_CTL,
+			RT721_MISC_POWER_CTL31, 0x8000);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_ANA_POW_PART,
+			RT721_VREF1_HV_CTRL1, 0xe000);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_ANA_CTL,
+			RT721_MISC_POWER_CTL31, 0x8007);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
+			RT721_ENT_FLOAT_CTL9, 0x2a2a);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
+			RT721_ENT_FLOAT_CTL10, 0x2a00);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
+			RT721_ENT_FLOAT_CTL6, 0x2a2a);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
+			RT721_ENT_FLOAT_CTL5, 0x2626);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
+			RT721_ENT_FLOAT_CTL8, 0x1e00);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
+			RT721_ENT_FLOAT_CTL7, 0x1515);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
+			RT721_CH_FLOAT_CTL3, 0x0304);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
+			RT721_CH_FLOAT_CTL4, 0x0304);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
+			RT721_HDA_LEGACY_CTL1, 0x0000);
+		regmap_write(rt721->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT721_SDCA_ENT_IT26,
+				RT721_SDCA_CTL_VENDOR_DEF, 0), 0x01);
+		regmap_write(rt721->mbq_regmap, 0x5910009, 0x2e01);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_RC_CALIB_CTRL,
+			RT721_RC_CALIB_CTRL0, 0x0b00);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_RC_CALIB_CTRL,
+			RT721_RC_CALIB_CTRL0, 0x0b40);
+		regmap_write(rt721->regmap, 0x2f5c, 0x25);
+		/* clear flag */
+		regmap_write(rt721->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT721_SDCA_ENT0,
+			RT721_SDCA_CTL_FUNC_STATUS, 0), FUNCTION_NEEDS_INITIALIZATION);
+	}
 }
 
 static void rt721_sdca_amp_preset(struct rt721_sdca_priv *rt721)
 {
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_ANA_CTL,
-		RT721_MISC_POWER_CTL31, 0x8000);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_ANA_POW_PART,
-		RT721_VREF1_HV_CTRL1, 0xe000);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_ANA_CTL,
-		RT721_MISC_POWER_CTL31, 0x8007);
-	regmap_write(rt721->mbq_regmap, 0x5810000, 0x6420);
-	regmap_write(rt721->mbq_regmap, 0x5810000, 0x6421);
-	regmap_write(rt721->mbq_regmap, 0x5810000, 0xe421);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
-		RT721_CH_FLOAT_CTL6, 0x5561);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_REG,
-		RT721_GPIO_PAD_CTRL5, 0x8003);
-	regmap_write(rt721->regmap,
-		SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_OT23,
-			RT721_SDCA_CTL_VENDOR_DEF, 0), 0x04);
-	regmap_write(rt721->regmap,
-		SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_PDE23,
-			RT721_SDCA_CTL_FU_MUTE, CH_01), 0x00);
-	regmap_write(rt721->regmap,
-		SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_PDE23,
-			RT721_SDCA_CTL_FU_MUTE, CH_02), 0x00);
-	regmap_write(rt721->regmap,
-		SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_FU55,
-			RT721_SDCA_CTL_FU_MUTE, CH_01), 0x00);
-	regmap_write(rt721->regmap,
-		SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_FU55,
-			RT721_SDCA_CTL_FU_MUTE, CH_02), 0x00);
-	regmap_write(rt721->regmap, 0x2f5d, 0x1);
+	unsigned int amp_func_status;
+	struct device *dev = &rt721->slave->dev;
+
+	regmap_read(rt721->regmap,
+		SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT0, RT721_SDCA_CTL_FUNC_STATUS, 0),
+		&amp_func_status);
+	dev_dbg(dev, "%s amp func_status=0x%x\n", __func__, amp_func_status);
+
+	if ((amp_func_status & FUNCTION_NEEDS_INITIALIZATION) || (!rt721->first_hw_init)) {
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_ANA_CTL,
+			RT721_MISC_POWER_CTL31, 0x8000);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_ANA_POW_PART,
+			RT721_VREF1_HV_CTRL1, 0xe000);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_ANA_CTL,
+			RT721_MISC_POWER_CTL31, 0x8007);
+		regmap_write(rt721->mbq_regmap, 0x5810000, 0x6420);
+		regmap_write(rt721->mbq_regmap, 0x5810000, 0x6421);
+		regmap_write(rt721->mbq_regmap, 0x5810000, 0xe421);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
+			RT721_CH_FLOAT_CTL6, 0x5561);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_REG,
+			RT721_GPIO_PAD_CTRL5, 0x8003);
+		regmap_write(rt721->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_OT23,
+				RT721_SDCA_CTL_VENDOR_DEF, 0), 0x04);
+		regmap_write(rt721->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_PDE23,
+				RT721_SDCA_CTL_FU_MUTE, CH_01), 0x00);
+		regmap_write(rt721->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_PDE23,
+				RT721_SDCA_CTL_FU_MUTE, CH_02), 0x00);
+		regmap_write(rt721->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_FU55,
+				RT721_SDCA_CTL_FU_MUTE, CH_01), 0x00);
+		regmap_write(rt721->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_FU55,
+				RT721_SDCA_CTL_FU_MUTE, CH_02), 0x00);
+		regmap_write(rt721->regmap, 0x2f5d, 0x1);
+		/* clear flag */
+		regmap_write(rt721->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT0, RT721_SDCA_CTL_FUNC_STATUS, 0),
+			FUNCTION_NEEDS_INITIALIZATION);
+	}
 }
 
 static void rt721_sdca_jack_preset(struct rt721_sdca_priv *rt721)
 {
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_ANA_CTL,
-		RT721_MISC_POWER_CTL31, 0x8000);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_ANA_POW_PART,
-		RT721_VREF1_HV_CTRL1, 0xe000);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_ANA_CTL,
-		RT721_MISC_POWER_CTL31, 0x8007);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
-		RT721_GE_REL_CTRL1, 0x8011);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
-		RT721_UMP_HID_CTRL3, 0xcf00);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
-		RT721_UMP_HID_CTRL4, 0x000f);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
-		RT721_UMP_HID_CTRL1, 0x1100);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
-		RT721_UMP_HID_CTRL5, 0x0c12);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_JD_CTRL,
-		RT721_JD_1PIN_GAT_CTRL2, 0xc002);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_RC_CALIB_CTRL,
-		RT721_RC_CALIB_CTRL0, 0x0b00);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_RC_CALIB_CTRL,
-		RT721_RC_CALIB_CTRL0, 0x0b40);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_ANA_CTL,
-		RT721_UAJ_TOP_TCON14, 0x3333);
-	regmap_write(rt721->mbq_regmap, 0x5810035, 0x0036);
-	regmap_write(rt721->mbq_regmap, 0x5810030, 0xee00);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_CAP_PORT_CTRL,
-		RT721_HP_AMP_2CH_CAL1, 0x0140);
-	regmap_write(rt721->mbq_regmap, 0x5810000, 0x0021);
-	regmap_write(rt721->mbq_regmap, 0x5810000, 0x8021);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_CAP_PORT_CTRL,
-		RT721_HP_AMP_2CH_CAL18, 0x5522);
-	regmap_write(rt721->mbq_regmap, 0x5b10007, 0x2000);
-	regmap_write(rt721->mbq_regmap, 0x5B10017, 0x1b0f);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_CBJ_CTRL,
-		RT721_CBJ_A0_GAT_CTRL1, 0x2205);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_CAP_PORT_CTRL,
-		RT721_HP_AMP_2CH_CAL4, 0xa105);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_ANA_CTL,
-		RT721_UAJ_TOP_TCON14, 0x3b33);
-	regmap_write(rt721->mbq_regmap, 0x310400, 0x3043);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_ANA_CTL,
-		RT721_UAJ_TOP_TCON14, 0x3f33);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_ANA_CTL,
-		RT721_UAJ_TOP_TCON13, 0x6048);
-	regmap_write(rt721->mbq_regmap, 0x310401, 0x3000);
-	regmap_write(rt721->mbq_regmap, 0x310402, 0x1b00);
-	regmap_write(rt721->mbq_regmap, 0x310300, 0x000f);
-	regmap_write(rt721->mbq_regmap, 0x310301, 0x3000);
-	regmap_write(rt721->mbq_regmap, 0x310302, 0x1b00);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_ANA_CTL,
-		RT721_UAJ_TOP_TCON17, 0x0008);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_DAC_CTRL,
-		RT721_DAC_2CH_CTRL3, 0x55ff);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_DAC_CTRL,
-		RT721_DAC_2CH_CTRL4, 0xcc00);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_ANA_POW_PART,
-		RT721_MBIAS_LV_CTRL2, 0x6677);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_ANA_POW_PART,
-		RT721_VREF2_LV_CTRL1, 0x7600);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
-		RT721_ENT_FLOAT_CTL2, 0x1234);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
-		RT721_ENT_FLOAT_CTL3, 0x3512);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
-		RT721_ENT_FLOAT_CTL1, 0x4040);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
-		RT721_ENT_FLOAT_CTL4, 0x1201);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_BOOST_CTRL,
-		RT721_BST_4CH_TOP_GATING_CTRL1, 0x002a);
-	regmap_write(rt721->regmap, 0x2f58, 0x07);
-
-	regmap_write(rt721->regmap, 0x2f51, 0x00);
-	rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
-		RT721_MISC_CTL, 0x0004);
+	unsigned int jack_func_status;
+	struct device *dev = &rt721->slave->dev;
+
+	regmap_read(rt721->regmap,
+		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT0, RT721_SDCA_CTL_FUNC_STATUS, 0),
+			&jack_func_status);
+	dev_dbg(dev, "%s jack func_status=0x%x\n", __func__, jack_func_status);
+
+	if ((jack_func_status & FUNCTION_NEEDS_INITIALIZATION) || (!rt721->first_hw_init)) {
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_ANA_CTL,
+			RT721_MISC_POWER_CTL31, 0x8000);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_ANA_POW_PART,
+			RT721_VREF1_HV_CTRL1, 0xe000);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_ANA_CTL,
+			RT721_MISC_POWER_CTL31, 0x8007);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
+			RT721_GE_REL_CTRL1, 0x8011);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
+			RT721_UMP_HID_CTRL3, 0xcf00);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
+			RT721_UMP_HID_CTRL4, 0x000f);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
+			RT721_UMP_HID_CTRL1, 0x1100);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
+			RT721_UMP_HID_CTRL5, 0x0c12);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_JD_CTRL,
+			RT721_JD_1PIN_GAT_CTRL2, 0xc002);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_RC_CALIB_CTRL,
+			RT721_RC_CALIB_CTRL0, 0x0b00);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_RC_CALIB_CTRL,
+			RT721_RC_CALIB_CTRL0, 0x0b40);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_ANA_CTL,
+			RT721_UAJ_TOP_TCON14, 0x3333);
+		regmap_write(rt721->mbq_regmap, 0x5810035, 0x0036);
+		regmap_write(rt721->mbq_regmap, 0x5810030, 0xee00);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_CAP_PORT_CTRL,
+			RT721_HP_AMP_2CH_CAL1, 0x0140);
+		regmap_write(rt721->mbq_regmap, 0x5810000, 0x0021);
+		regmap_write(rt721->mbq_regmap, 0x5810000, 0x8021);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_CAP_PORT_CTRL,
+			RT721_HP_AMP_2CH_CAL18, 0x5522);
+		regmap_write(rt721->mbq_regmap, 0x5b10007, 0x2000);
+		regmap_write(rt721->mbq_regmap, 0x5B10017, 0x1b0f);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_CBJ_CTRL,
+			RT721_CBJ_A0_GAT_CTRL1, 0x2205);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_CAP_PORT_CTRL,
+			RT721_HP_AMP_2CH_CAL4, 0xa105);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_ANA_CTL,
+			RT721_UAJ_TOP_TCON14, 0x3b33);
+		regmap_write(rt721->mbq_regmap, 0x310400, 0x3043);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_ANA_CTL,
+			RT721_UAJ_TOP_TCON14, 0x3f33);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_ANA_CTL,
+			RT721_UAJ_TOP_TCON13, 0x6048);
+		regmap_write(rt721->mbq_regmap, 0x310401, 0x3000);
+		regmap_write(rt721->mbq_regmap, 0x310402, 0x1b00);
+		regmap_write(rt721->mbq_regmap, 0x310300, 0x000f);
+		regmap_write(rt721->mbq_regmap, 0x310301, 0x3000);
+		regmap_write(rt721->mbq_regmap, 0x310302, 0x1b00);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_ANA_CTL,
+			RT721_UAJ_TOP_TCON17, 0x0008);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_DAC_CTRL,
+			RT721_DAC_2CH_CTRL3, 0x55ff);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_DAC_CTRL,
+			RT721_DAC_2CH_CTRL4, 0xcc00);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_ANA_POW_PART,
+			RT721_MBIAS_LV_CTRL2, 0x6677);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_ANA_POW_PART,
+			RT721_VREF2_LV_CTRL1, 0x7600);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
+			RT721_ENT_FLOAT_CTL2, 0x1234);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
+			RT721_ENT_FLOAT_CTL3, 0x3512);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
+			RT721_ENT_FLOAT_CTL1, 0x4040);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
+			RT721_ENT_FLOAT_CTL4, 0x1201);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_BOOST_CTRL,
+			RT721_BST_4CH_TOP_GATING_CTRL1, 0x002a);
+		regmap_write(rt721->regmap, 0x2f58, 0x07);
+		regmap_write(rt721->regmap, 0x2f51, 0x00);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
+			RT721_MISC_CTL, 0x0004);
+		/* clear flag */
+		regmap_write(rt721->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT0,
+			RT721_SDCA_CTL_FUNC_STATUS, 0), FUNCTION_NEEDS_INITIALIZATION);
+	}
 }
 
 static void rt721_sdca_jack_init(struct rt721_sdca_priv *rt721)
diff --git a/sound/soc/codecs/rt721-sdca.h b/sound/soc/codecs/rt721-sdca.h
index 24ce188562ba..b8873b18a648 100644
--- a/sound/soc/codecs/rt721-sdca.h
+++ b/sound/soc/codecs/rt721-sdca.h
@@ -214,6 +214,7 @@ struct rt721_sdca_dmic_kctrl_priv {
 #define RT721_SDCA_ENT_XU03			0x03
 #define RT721_SDCA_ENT_XU0D			0x0d
 #define RT721_SDCA_ENT_FU55			0x55
+#define RT721_SDCA_ENT0				0x00
 
 /* RT721 SDCA control */
 #define RT721_SDCA_CTL_SAMPLE_FREQ_INDEX		0x10
@@ -229,6 +230,7 @@ struct rt721_sdca_dmic_kctrl_priv {
 #define RT721_SDCA_CTL_VENDOR_DEF			0x30
 #define RT721_SDCA_CTL_XUV				0x34
 #define RT721_SDCA_CTL_FU_CH_GAIN			0x0b
+#define RT721_SDCA_CTL_FUNC_STATUS			0x10
 
 /* RT721 SDCA channel */
 #define CH_L	0x01
@@ -261,6 +263,9 @@ struct rt721_sdca_dmic_kctrl_priv {
 /* RT721 HID ID */
 #define RT721_SDCA_HID_ID		0x11
 
+/* Function_Status */
+#define FUNCTION_NEEDS_INITIALIZATION	BIT(5)
+
 enum {
 	RT721_AIF1, /* For headset mic and headphone */
 	RT721_AIF2, /* For speaker */
-- 
2.54.0

