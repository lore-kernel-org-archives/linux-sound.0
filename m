Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EA61DF26E
	for <linux-sound@vger.kernel.org>; Mon, 22 Jun 2026 09:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782119526; cv=none; b=WZyS3LQx8djWOtaFg0zN1pWV4/PeUoVuoljzV9FQlx2pkSCs2drmyMnCGP+OUxZEWtvmJDd7kd6LZ0pBlbJd8cTCgSs3N9JAbPPiHCTl3MOCy2iClwdzDp5ymTr1y3OUCHSfZdFOtp+6MSc8u01uAcKk2pncOKXx/QM2un1x5TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782119526; c=relaxed/simple;
	bh=sMaJbNw7dQ+eOxcbPAnyK73vNbwFvjwPqy7yDWvDL0Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ni7dh9pOcO6xnlpVPi89HT8newA/lwBClIaviWiwqyI3vbEFLs5DxllZrjhuNvCK1d5zAC1qUxFqJVEKMfJQ8E+h0I7VwOd7ZWscRilWEjLU0K+orUQ7rOz06i+H6Dk2UqEUFuNxn0E7SkARjV26I/zC4bsQ94cek1QHo0jjGW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=UGExrOUo; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="UGExrOUo"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 65M9BhQ922427435, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1782119503; bh=gN2+rW/uwP8yG00UdRzflorKfmAOi1uXJE3XVCHPKRY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=UGExrOUoigX/Za+z5qpzhRK9SXYPygLu9R68lkfdEvfCFW1XfufxclTERXw4wfH08
	 JqCNTXLcb8zWPqY5aX+a5RqWYI7vngI5I5kw6AubvGj+t3YJ8hapB0aVNxhEFH+taK
	 5nQ8eARPCBz5wCcIlPhTpCeAX8xlF6x/7g7OhWjVzD8AdaviPgYJlkSPcrIdo9YEL4
	 uT+F9h5mSlT/8oZrahYr1OA3unDXYRuz6zEOLHSgbUVbgP+C1GUoeiRV/6o2XdsHbL
	 zHFK0flSMCJcIRKAzIaQDdmS4Li+IMPMi0l9eUmkWpTutcR4wQdQDoc2/vl+CuFG9o
	 Q+cUDlh3AegCw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 65M9BhQ922427435
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 22 Jun 2026 17:11:43 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Jun 2026 17:11:43 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Jun 2026 17:11:42 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server id
 15.2.2562.17 via Frontend Transport; Mon, 22 Jun 2026 17:11:42 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
	<oder_chiou@realtek.com>, <jack.yu@realtek.com>, <derek.fang@realtek.com>,
	Shuming Fan <shumingf@realtek.com>
Subject: [PATCH 1/2] ASoC: rt1321: move DSP status checking into a helper function
Date: Mon, 22 Jun 2026 17:11:39 +0800
Message-ID: <20260622091139.2183297-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Shuming Fan <shumingf@realtek.com>

This patch creates the rt1320_dspfw_status helper function to check DSP status.
The new function can be reused by other functions and supports checking the DSP status
across different amplifiers.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt1320-sdw.c | 117 ++++++++++++++--------------------
 1 file changed, 49 insertions(+), 68 deletions(-)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index 13493b85f3c9..8d6fe2e36fc7 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -893,6 +893,42 @@ static int rt1320_check_fw_ready(struct rt1320_sdw_priv *rt1320)
 	return 0;
 }
 
+static int rt1320_dspfw_status(struct rt1320_sdw_priv *rt1320)
+{
+	struct device *dev = &rt1320->sdw_slave->dev;
+	unsigned int fw_status_addr, fw_ready;
+	unsigned int dspfw_run;
+
+	switch (rt1320->dev_id) {
+	case RT1320_DEV_ID:
+		fw_status_addr = RT1320_DSPFW_STATUS_ADDR;
+		break;
+	case RT1321_DEV_ID:
+		fw_status_addr = RT1321_DSPFW_STATUS_ADDR;
+		break;
+	default:
+		dev_err(dev, "%s: Unknown device ID %d\n", __func__, rt1320->dev_id);
+		return -EINVAL;
+	}
+
+	regmap_read(rt1320->regmap, fw_status_addr, &fw_ready);
+	fw_ready &= 0x1;
+
+	if (rt1320->dev_id == RT1321_DEV_ID) {
+		regmap_read(rt1320->regmap, 0xf01e, &dspfw_run);
+		dspfw_run &= 0x1;
+		fw_ready = (!dspfw_run && fw_ready);
+	}
+
+	if (fw_ready) {
+		dev_dbg(dev, "%s, DSP FW was already\n", __func__);
+		return 1;
+	}
+
+	dev_dbg(dev, "%s, DSP FW is NOT ready. Please load DSP FW first\n", __func__);
+	return 0;
+}
+
 static int rt1320_check_power_state_ready(struct rt1320_sdw_priv *rt1320, enum rt1320_power_state ps)
 {
 	struct device *dev = &rt1320->sdw_slave->dev;
@@ -1126,30 +1162,18 @@ static void rt1320_calibrate(struct rt1320_sdw_priv *rt1320)
 	struct device *dev = &rt1320->sdw_slave->dev;
 	struct rt1320_datafixpoint audfixpoint[2];
 	unsigned int reg_c5fb, reg_c570, reg_cd00;
-	unsigned int vol_reg[4], fw_ready;
+	unsigned int vol_reg[4];
 	unsigned long long l_meanr0, r_meanr0;
-	unsigned int fw_status_addr;
 	int l_re[5], r_re[5];
 	int ret, tmp;
 	unsigned long long factor = (1 << 27);
 	unsigned short l_advancegain, r_advancegain;
 	unsigned int delay_s = 7; /* delay seconds for the calibration */
+	int dspfw_status;
 
 	if (!rt1320->component)
 		return;
 
-	switch (rt1320->dev_id) {
-	case RT1320_DEV_ID:
-		fw_status_addr = RT1320_DSPFW_STATUS_ADDR;
-		break;
-	case RT1321_DEV_ID:
-		fw_status_addr = RT1321_DSPFW_STATUS_ADDR;
-		break;
-	default:
-		dev_err(dev, "%s: Unknown device ID %d\n", __func__, rt1320->dev_id);
-		return;
-	}
-
 	/* set volume 0dB */
 	regmap_read(rt1320->regmap, 0xdd0b, &vol_reg[3]);
 	regmap_read(rt1320->regmap, 0xdd0a, &vol_reg[2]);
@@ -1172,9 +1196,8 @@ static void rt1320_calibrate(struct rt1320_sdw_priv *rt1320)
 		goto _finish_;
 	}
 
-	regmap_read(rt1320->regmap, fw_status_addr, &fw_ready);
-	fw_ready &= 0x1;
-	if (!fw_ready) {
+	dspfw_status = rt1320_dspfw_status(rt1320);
+	if (dspfw_status <= 0) {
 		dev_dbg(dev, "%s, DSP FW is NOT ready. Please load DSP FW first\n", __func__);
 		goto _finish_;
 	}
@@ -1383,30 +1406,17 @@ static void rt1320_vab_preset(struct rt1320_sdw_priv *rt1320)
 static void rt1320_t0_load(struct rt1320_sdw_priv *rt1320, unsigned int l_t0, unsigned int r_t0)
 {
 	struct device *dev = &rt1320->sdw_slave->dev;
-	unsigned int factor = (1 << 22), fw_ready;
+	unsigned int factor = (1 << 22);
 	int l_t0_data[38], r_t0_data[38];
-	unsigned int fw_status_addr;
-
-	switch (rt1320->dev_id) {
-	case RT1320_DEV_ID:
-		fw_status_addr = RT1320_DSPFW_STATUS_ADDR;
-		break;
-	case RT1321_DEV_ID:
-		fw_status_addr = RT1321_DSPFW_STATUS_ADDR;
-		break;
-	default:
-		dev_err(dev, "%s: Unknown device ID %d\n", __func__, rt1320->dev_id);
-		return;
-	}
+	int dspfw_status;
 
 	regmap_write(rt1320->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23,
 				RT1320_SDCA_CTL_REQ_POWER_STATE, 0), 0x00);
 	rt1320_pde_transition_delay(rt1320, FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, 0x00);
 
-	regmap_read(rt1320->regmap, fw_status_addr, &fw_ready);
-	fw_ready &= 0x1;
-	if (!fw_ready) {
+	dspfw_status = rt1320_dspfw_status(rt1320);
+	if (dspfw_status <= 0) {
 		dev_warn(dev, "%s, DSP FW is NOT ready\n", __func__);
 		goto _exit_;
 	}
@@ -1599,8 +1609,7 @@ struct rt1320_dspfwheader {
 
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(rt1320->component);
 	struct device *dev = &rt1320->sdw_slave->dev;
-	unsigned int val, i, fw_offset, fw_ready;
-	unsigned int fw_status_addr;
+	unsigned int val, i, fw_offset;
 	struct rt1320_dspfwheader *fwheader;
 	struct rt1320_imageinfo *ptr_img;
 	struct sdw_bpt_section sec[10];
@@ -1613,18 +1622,6 @@ struct rt1320_dspfwheader {
 	int len_vendor, len_product, len_sku;
 	char filename[512];
 
-	switch (rt1320->dev_id) {
-	case RT1320_DEV_ID:
-		fw_status_addr = RT1320_DSPFW_STATUS_ADDR;
-		break;
-	case RT1321_DEV_ID:
-		fw_status_addr = RT1321_DSPFW_STATUS_ADDR;
-		break;
-	default:
-		dev_err(dev, "%s: Unknown device ID %d\n", __func__, rt1320->dev_id);
-		return;
-	}
-
 	dmi_vendor = dmi_get_system_info(DMI_SYS_VENDOR);
 	dmi_product = dmi_get_system_info(DMI_PRODUCT_NAME);
 	dmi_sku = dmi_get_system_info(DMI_PRODUCT_SKU);
@@ -1654,9 +1651,7 @@ struct rt1320_dspfwheader {
 				RT1320_SDCA_CTL_REQ_POWER_STATE, 0), 0x00);
 	rt1320_pde_transition_delay(rt1320, FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, 0x00);
 
-	regmap_read(rt1320->regmap, fw_status_addr, &fw_ready);
-	fw_ready &= 0x1;
-	if (fw_ready) {
+	if (rt1320_dspfw_status(rt1320)) {
 		dev_dbg(dev, "%s, DSP FW was already\n", __func__);
 		rt1320->fw_load_done = true;
 		goto _exit_;
@@ -2327,25 +2322,12 @@ static const DECLARE_TLV_DB_SCALE(in_vol_tlv, -1725, 75, 0);
 static int rt1320_r0_load(struct rt1320_sdw_priv *rt1320)
 {
 	struct device *dev = regmap_get_device(rt1320->regmap);
-	unsigned int fw_status_addr;
-	unsigned int fw_ready;
+	int dspfw_status;
 	int ret = 0;
 
 	if (!rt1320->r0_l_reg || !rt1320->r0_r_reg)
 		return -EINVAL;
 
-	switch (rt1320->dev_id) {
-	case RT1320_DEV_ID:
-		fw_status_addr = RT1320_DSPFW_STATUS_ADDR;
-		break;
-	case RT1321_DEV_ID:
-		fw_status_addr = RT1321_DSPFW_STATUS_ADDR;
-		break;
-	default:
-		dev_err(dev, "%s: Unknown device ID %d\n", __func__, rt1320->dev_id);
-		return -EINVAL;
-	}
-
 	regmap_write(rt1320->regmap,
 		SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, RT1320_SDCA_CTL_REQ_POWER_STATE, 0), 0x00);
 	ret = rt1320_pde_transition_delay(rt1320, FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, 0x00);
@@ -2354,9 +2336,8 @@ static int rt1320_r0_load(struct rt1320_sdw_priv *rt1320)
 		goto _timeout_;
 	}
 
-	regmap_read(rt1320->regmap, fw_status_addr, &fw_ready);
-	fw_ready &= 0x1;
-	if (!fw_ready) {
+	dspfw_status = rt1320_dspfw_status(rt1320);
+	if (dspfw_status <= 0) {
 		dev_dbg(dev, "%s, DSP FW is NOT ready\n", __func__);
 		goto _timeout_;
 	}
-- 
2.54.0

