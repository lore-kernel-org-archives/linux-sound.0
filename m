Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E79D2E413
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 09:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765875921; cv=none; b=quzV0P5TJv0lQoBFarPevokPoXOSdsM7UAIQiVrXA5nE+cRaCy5sk3SiSqC6aP2uumQiivWsgJAKNjO5tKQ5TYQfveWhSQ+lneMPNaT+4ymzb2QhDg50IJdXwjVZwqGKAdd0wY+SM1D9nghA/daj6oF8JizElOsf5lG4aMG3OPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765875921; c=relaxed/simple;
	bh=yWTVarcZvBSepBL5rFdL7O3+/lpa0gNZLvyKOaLIPLY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UiHGNoUZjXFBaHqHeL/0Vif35d65/Daaqp9y2sPxYMfiTErLPRY+uSwN1vJinyvF5VlfngM+3CtAWK9s/XcrBw3sc/GAtKoSa5+hQMVAT6/+aP2/w9HD4Ro0kRQkSoKghZi4Yvl1qkW9A1W+5h6r/xzNMtjMgyvRcCfs6OH9I5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=wsMt/xcd; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="wsMt/xcd"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5BG94v0S23635996, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1765875897; bh=4sYvm6tTOr0jk6tQSptdMgAT6Qx4CH0lajGfhyWdzRw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=wsMt/xcdGtsKu0CrVT1boVbcMB/mxoSFx9/tNiorg9PNWGSGW9GfB7dgqHVGgyZrH
	 7SE+cU6ssBSWD/YXc3DmLJZC69wXmkW3vNYjb/QzKy0a4359BQrymzYdkJq181HoD1
	 PCVbBFwrkNcIHlW5RsDLiZ95+wbQ147zPQ9K597v/jOjnt3/pIKOk98Q+InK7aY9mS
	 81cusA9hf44/djHWTdMM9bkXqlAUPN30O/a/mW/qOa1PTrZ/L/ngWQ4KhAAP4EFW0W
	 PQ2q/3zkdNu767q9eVJZLdhynRICJjOBAbZ9w6Ifgk2D2/moWH5fz151nGIuwryAV1
	 Y3vnyagPUS4Ew==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5BG94v0S23635996
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Dec 2025 17:04:57 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 16 Dec 2025 17:04:56 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Tue, 16 Dec 2025 17:04:56 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, Shuming Fan <shumingf@realtek.com>
Subject: [PATCH 3/3] ASoC: rt1320: support RAE parameters loading
Date: Tue, 16 Dec 2025 17:06:30 +0800
Message-ID: <20251216090630.3955323-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Shuming Fan <shumingf@realtek.com>

This patch supports the RAE parameters loading.
The RAE parameters is related to EQ/DRC parameters for each endpoint.
The driver could load these parameters from the binary file.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt1320-sdw.c | 188 ++++++++++++++++++++++++++++++++++
 1 file changed, 188 insertions(+)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index 1c5cb8a8c699..9447e742c672 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -1421,6 +1421,158 @@ static int rt1320_t0_load(struct rt1320_sdw_priv *rt1320, unsigned int l_t0, uns
 	return ret;
 }
 
+static int rt1320_rae_load(struct rt1320_sdw_priv *rt1320)
+{
+	struct device *dev = &rt1320->sdw_slave->dev;
+	static const char func_tag[] = "FUNC";
+	static const char xu_tag[] = "XU";
+	const struct firmware *rae_fw = NULL;
+	unsigned int fw_offset;
+	unsigned char *fw_data;
+	unsigned char *param_data;
+	unsigned int addr, size;
+	unsigned int func, value;
+	const char *dmi_vendor, *dmi_product, *dmi_sku;
+	char vendor[128], product[128], sku[128];
+	char *ptr_vendor, *ptr_product, *ptr_sku;
+	char rae_filename[128];
+	char tag[5];
+	int ret = 0;
+	int retry = 200;
+
+	dmi_vendor = dmi_get_system_info(DMI_SYS_VENDOR);
+	dmi_product = dmi_get_system_info(DMI_PRODUCT_NAME);
+	dmi_sku = dmi_get_system_info(DMI_PRODUCT_SKU);
+
+	if (dmi_vendor && dmi_product && dmi_sku) {
+		strscpy(vendor, dmi_vendor);
+		strscpy(product, dmi_product);
+		strscpy(sku, dmi_sku);
+		ptr_vendor = &vendor[0];
+		ptr_product = &product[0];
+		ptr_sku = &sku[0];
+		ptr_vendor = strsep(&ptr_vendor, " ");
+		ptr_product = strsep(&ptr_product, " ");
+		ptr_sku = strsep(&ptr_sku, " ");
+
+		dev_dbg(dev, "%s: DMI vendor=%s, product=%s, sku=%s\n", __func__,
+			vendor, product, sku);
+
+		snprintf(rae_filename, sizeof(rae_filename),
+			 "realtek/rt1320/rt1320_RAE_%s_%s_%s.dat", vendor, product, sku);
+		dev_dbg(dev, "%s: try to load RAE file %s\n", __func__, rae_filename);
+	} else {
+		dev_warn(dev, "%s: Can't find proper RAE file name\n", __func__);
+		return -EINVAL;
+	}
+
+	regmap_write(rt1320->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23,
+				RT1320_SDCA_CTL_REQ_POWER_STATE, 0), 0x00);
+	rt1320_pde_transition_delay(rt1320, FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, 0x00);
+
+	request_firmware(&rae_fw, rae_filename, dev);
+	if (rae_fw) {
+
+		/* RAE CRC clear */
+		regmap_write(rt1320->regmap, 0xe80b, 0x0f);
+
+		/* RAE stop & CRC disable */
+		regmap_update_bits(rt1320->regmap, 0xe803, 0xbc, 0x00);
+
+		while (retry--) {
+			regmap_read(rt1320->regmap, 0xe83f, &value);
+			if (value & 0x40)
+				break;
+			usleep_range(1000, 1100);
+		}
+		if (!retry && !(value & 0x40)) {
+			dev_err(dev, "%s: RAE is not ready to load\n", __func__);
+			return -ETIMEDOUT;
+		}
+
+		dev_dbg(dev, "%s, rae_fw size=0x%lx\n", __func__, rae_fw->size);
+		regcache_cache_bypass(rt1320->regmap, true);
+		for (fw_offset = 0; fw_offset < rae_fw->size;) {
+
+			dev_dbg(dev, "%s, fw_offset=0x%x\n", __func__, fw_offset);
+
+			fw_data = (unsigned char *)&rae_fw->data[fw_offset];
+
+			memcpy(tag, fw_data, 4);
+			tag[4] = '\0';
+			dev_dbg(dev, "%s, tag=%s\n", __func__, tag);
+			if (strcmp(tag, xu_tag) == 0) {
+				dev_dbg(dev, "%s: This is a XU tag", __func__);
+				memcpy(&addr, (fw_data + 4), 4);
+				memcpy(&size, (fw_data + 8), 4);
+				param_data = (unsigned char *)(fw_data + 12);
+
+				dev_dbg(dev, "%s: addr=0x%x, size=0x%x\n", __func__, addr, size);
+
+				/*
+				 * UI register ranges from 0x1000d000 to 0x1000d7ff
+				 * UI registers should be accessed by tuning tool.
+				 * So, there registers should be cached.
+				 */
+				if (addr <= 0x1000d7ff && addr >= 0x1000d000)
+					regcache_cache_bypass(rt1320->regmap, false);
+
+				rt1320_data_rw(rt1320, addr, param_data, size, RT1320_PARAM_WRITE);
+
+				regcache_cache_bypass(rt1320->regmap, true);
+
+				fw_offset += (size + 12);
+			} else if (strcmp(tag, func_tag) == 0) {
+				dev_err(dev, "%s: This is a FUNC tag", __func__);
+
+				memcpy(&func, (fw_data + 4), 4);
+				memcpy(&value, (fw_data + 8), 4);
+
+				dev_dbg(dev, "%s: func=0x%x, value=0x%x\n", __func__, func, value);
+				if (func == 1)  //DelayMs
+					msleep(value);
+
+				fw_offset += 12;
+			} else {
+				dev_err(dev, "%s: This is NOT a XU file (wrong tag)", __func__);
+				break;
+			}
+		}
+
+		regcache_cache_bypass(rt1320->regmap, false);
+		release_firmware(rae_fw);
+
+	} else {
+		dev_err(dev, "%s: Failed to load %s firmware\n", __func__, rae_filename);
+		ret = -EINVAL;
+		goto _exit_;
+	}
+
+	/* RAE CRC enable */
+	regmap_update_bits(rt1320->regmap, 0xe803, 0x0c, 0x0c);
+
+	/* RAE update */
+	regmap_update_bits(rt1320->regmap, 0xe80b, 0x80, 0x00);
+	regmap_update_bits(rt1320->regmap, 0xe80b, 0x80, 0x80);
+
+	/* RAE run */
+	regmap_update_bits(rt1320->regmap, 0xe803, 0x80, 0x80);
+
+	regmap_read(rt1320->regmap, 0xe80b, &value);
+	dev_dbg(dev, "%s: CAE run => 0xe80b reg = 0x%x\n", __func__, value);
+
+	rt1320->rae_update_done = true;
+
+_exit_:
+	regmap_write(rt1320->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23,
+				RT1320_SDCA_CTL_REQ_POWER_STATE, 0), 0x03);
+	rt1320_pde_transition_delay(rt1320, FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, 0x03);
+
+	return ret;
+}
+
 static void rt1320_dspfw_load_code(struct rt1320_sdw_priv *rt1320)
 {
 struct rt1320_imageinfo {
@@ -2318,6 +2470,40 @@ static int rt1320_dspfw_load_put(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static int rt1320_rae_update_get(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct rt1320_sdw_priv *rt1320 = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = rt1320->rae_update_done;
+	return 0;
+}
+
+static int rt1320_rae_update_put(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct rt1320_sdw_priv *rt1320 = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	if (!rt1320->hw_init)
+		return 0;
+
+	ret = pm_runtime_resume(component->dev);
+	if (ret < 0 && ret != -EACCES)
+		return ret;
+
+	if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF &&
+		ucontrol->value.integer.value[0] && rt1320->fw_load_done)
+		rt1320_rae_load(rt1320);
+
+	if (!ucontrol->value.integer.value[0])
+		rt1320->rae_update_done = false;
+
+	return 0;
+}
+
 static int rt1320_r0_temperature_get(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
@@ -2375,6 +2561,8 @@ static const struct snd_kcontrol_new rt1320_snd_controls[] = {
 		rt1320_r0_load_mode_get, rt1320_r0_load_mode_put),
 	RT1320_T0_R0_LOAD("R0 Temperature", 0xff,
 		rt1320_r0_temperature_get, rt1320_r0_temperature_put),
+	SOC_SINGLE_EXT("RAE Update", SND_SOC_NOPM, 0, 1, 0,
+		rt1320_rae_update_get, rt1320_rae_update_put),
 };
 
 static const struct snd_kcontrol_new rt1320_spk_l_dac =
-- 
2.52.0

