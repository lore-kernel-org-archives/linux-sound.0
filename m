Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB021CABF
	for <linux-sound@vger.kernel.org>; Tue, 25 Jun 2024 08:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719305030; cv=none; b=HScqulV5uHq9Gj3aNoXTxwHVS24wJI2b8JFHoooSY3E3izgGj/KDiRAQ/v+byYHjS69U3KHYWr5Qo2N4u+YfCP+jPg/MqHJdOc52ERTvlZpvMOjjXBmRy3JGXCXYoupNBaOBARst+s5de/aaxonJMNrgsVLNprSQp0IxMrA43BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719305030; c=relaxed/simple;
	bh=FQFWA+Gd1u9qW6tE73vxMW13djpU/54Ne44++co65Wo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=piNr6c0j9cEzXPNjST9YfpjB90lqETOzCGzbYgQCQrQl1GV8OzIA3t+hZnoJcKs7jP4MsopquSc9LXakhtVSk+Zg3ADn3MGW2kGLsz4Ph6VCHuy1HgFGftlDAcXxlc3qB7EGB+TdnQj+BDgkvpes0rwujpr2oqqE/LKuyfXivQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 45P8h9a354146769, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 45P8h9a354146769
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Jun 2024 16:43:09 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 16:43:09 +0800
Received: from sw-server.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 25 Jun 2024 16:43:09 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, <pierre-louis.bossart@intel.com>,
        <bard.liao@intel.com>, Shuming Fan
	<shumingf@realtek.com>
Subject: [PATCH v2] ASoC: rt711-sdca: add GE selected mode control
Date: Tue, 25 Jun 2024 16:43:03 +0800
Message-ID: <20240625084303.2273911-1-shumingf@realtek.com>
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

The SDCA spec defines a 'selected_mode' control which can override
the 'detected_mode' reported by hardware.
This is useful for platform integration as well as in cases
where the hardware(e.g. 3.5mm jack cable) is not able to accurately detect the jack type.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt711-sdca.c | 72 +++++++++++++++++++++++++++++++++++
 sound/soc/codecs/rt711-sdca.h |  1 +
 2 files changed, 73 insertions(+)

diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
index 1e8dbfc3ecd9..dd6ccf17afd4 100644
--- a/sound/soc/codecs/rt711-sdca.c
+++ b/sound/soc/codecs/rt711-sdca.c
@@ -81,6 +81,24 @@ static void rt711_sdca_reset(struct rt711_sdca_priv *rt711)
 		RT711_HDA_LEGACY_RESET_CTL, 0x1, 0x1);
 }
 
+static void rt711_sdca_ge_force_jack_type(struct rt711_sdca_priv *rt711, unsigned int det_mode)
+{
+	switch (det_mode) {
+	case 0x00:
+		rt711_sdca_index_update_bits(rt711, RT711_VENDOR_REG, RT711_COMBO_JACK_AUTO_CTL1, 0x8400, 0x0000);
+		rt711_sdca_index_update_bits(rt711, RT711_VENDOR_HDA_CTL, RT711_PUSH_BTN_INT_CTL0, 0x10, 0x00);
+		break;
+	case 0x03:
+		rt711_sdca_index_update_bits(rt711, RT711_VENDOR_REG, RT711_COMBO_JACK_AUTO_CTL1, 0x8400, 0x8000);
+		rt711_sdca_index_update_bits(rt711, RT711_VENDOR_HDA_CTL, RT711_PUSH_BTN_INT_CTL0, 0x17, 0x13);
+		break;
+	case 0x05:
+		rt711_sdca_index_update_bits(rt711, RT711_VENDOR_REG, RT711_COMBO_JACK_AUTO_CTL1, 0x8400, 0x8400);
+		rt711_sdca_index_update_bits(rt711, RT711_VENDOR_HDA_CTL, RT711_PUSH_BTN_INT_CTL0, 0x17, 0x15);
+		break;
+	}
+}
+
 static int rt711_sdca_calibration(struct rt711_sdca_priv *rt711)
 {
 	unsigned int val, loop_rc = 0, loop_dc = 0;
@@ -248,6 +266,8 @@ static int rt711_sdca_headset_detect(struct rt711_sdca_priv *rt711)
 	unsigned int det_mode;
 	int ret;
 
+	rt711_sdca_ge_force_jack_type(rt711, rt711->ge_mode_override);
+
 	/* get detected_mode */
 	ret = regmap_read(rt711->regmap,
 		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT711_SDCA_ENT_GE49, RT711_SDCA_CTL_DETECTED_MODE, 0),
@@ -790,6 +810,56 @@ static int rt711_sdca_fu0f_capture_put(struct snd_kcontrol *kcontrol,
 	return changed;
 }
 
+static int rt711_sdca_ge_select_get(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct rt711_sdca_priv *rt711 = snd_soc_component_get_drvdata(component);
+	unsigned int val, item;
+
+	val = (rt711->ge_mode_override >> e->shift_l) & e->mask;
+	item = snd_soc_enum_val_to_item(e, val);
+	ucontrol->value.enumerated.item[0] = item;
+	return 0;
+}
+
+static int rt711_sdca_ge_select_put(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	unsigned int *item = ucontrol->value.enumerated.item;
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct rt711_sdca_priv *rt711 = snd_soc_component_get_drvdata(component);
+	unsigned int val, change = 0;
+
+	if (item[0] >= e->items)
+		return -EINVAL;
+
+	val = snd_soc_enum_item_to_val(e, item[0]) << e->shift_l;
+	if (rt711->ge_mode_override != val) {
+		rt711->ge_mode_override = val;
+		change = 1;
+	}
+
+	return change;
+}
+
+static const char * const rt711_sdca_ge_select[] = {
+	"Auto",
+	"Headphone",
+	"Headset",
+};
+
+static int rt711_sdca_ge_select_values[] = {
+	0,
+	3,
+	5,
+};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(rt711_sdca_ge_mode_enum, SND_SOC_NOPM,
+	0, 0x7, rt711_sdca_ge_select, rt711_sdca_ge_select_values);
+
 static const DECLARE_TLV_DB_SCALE(out_vol_tlv, -6525, 75, 0);
 static const DECLARE_TLV_DB_SCALE(in_vol_tlv, -1725, 75, 0);
 static const DECLARE_TLV_DB_SCALE(mic_vol_tlv, 0, 1000, 0);
@@ -824,6 +894,8 @@ static const struct snd_kcontrol_new rt711_sdca_snd_controls[] = {
 		SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT711_SDCA_ENT_PLATFORM_FU15, RT711_SDCA_CTL_FU_CH_GAIN, CH_R),
 		8, 3, 0,
 		rt711_sdca_set_gain_get, rt711_sdca_set_gain_put, mic_vol_tlv),
+	SOC_ENUM_EXT("GE49 Selected Mode", rt711_sdca_ge_mode_enum,
+		rt711_sdca_ge_select_get, rt711_sdca_ge_select_put),
 };
 
 static int rt711_sdca_mux_get(struct snd_kcontrol *kcontrol,
diff --git a/sound/soc/codecs/rt711-sdca.h b/sound/soc/codecs/rt711-sdca.h
index 11d421e8ab2b..15263dcb0314 100644
--- a/sound/soc/codecs/rt711-sdca.h
+++ b/sound/soc/codecs/rt711-sdca.h
@@ -33,6 +33,7 @@ struct  rt711_sdca_priv {
 	int hw_ver;
 	bool fu0f_dapm_mute, fu0f_mixer_l_mute, fu0f_mixer_r_mute;
 	bool fu1e_dapm_mute, fu1e_mixer_l_mute, fu1e_mixer_r_mute;
+	unsigned int ge_mode_override;
 };
 
 /* NID */
-- 
2.34.1

