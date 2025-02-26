Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDAC1E1DEB
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 08:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740559686; cv=none; b=E4v9MfNPf+jqT7r/pzNdjQSiuY4tNoHeEgr+mC3972/7nYwU63VI2QavBRuqHuX2RD2SzqFdJddrrCQQeVYSLEFlD+xNcPFFHsoEklxE5lReT8YTc3llcDn7DjFYSRqkiEWxlx2T+q3+VMfhnfvl4A+P/BUGoZWJGk0740JCakU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740559686; c=relaxed/simple;
	bh=tUvT0/VpSkYp5wYBLGDTHPbzlta4H9O8L8peXqfUwv4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KLHjvXLTOgHI1oKP3ezagCfxcUKd2ApN6CDCgrLyJw2kEpfSL5Cz2QnLvQx4L7A8Id0FVcuvM+8a89rMM0zwniu3mfH3Gfw79SGgBM5/GJ2q0l3GfcKpoWu+xcqn2yHzrdl1LcmV5k16i0gAihBAOPAhOol6TlrWHwhkY9RybtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b=MrKRfxR3; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b="MrKRfxR3"
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 51Q8lX3C13435363, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1740559653; bh=tUvT0/VpSkYp5wYBLGDTHPbzlta4H9O8L8peXqfUwv4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=MrKRfxR38GHSr3rBbzK9tuI0R8a1JsNx7yDSZpw5+ywAwHgb8lBdz29DqrpRSV18V
	 yepB5zEZIT7lM5YjwpOHqs+/E3nuvirAIuiYY5Sgc8XkiyfzIsUalh9xs8j3QeWldo
	 Zbt8XM7KfcDXCJOEbgkW9LRAeuYijxRWXtFihv7X8t0OpKwx31G23EyTgnFsMy9vPz
	 W+/gBIydAXUekYP2C/k+DKloPy+nxYnBWVdlIRENcbPtM3FhXXrSHPYckn8/0wb7JL
	 xRnU5WD4OPSzEpWJ8fr9jatHCN09euYj0kPYqtfwBUmYt2aYg3uLKiRK+fYxWNEk0s
	 rwrgKRnt/FHCQ==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 51Q8lX3C13435363
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Feb 2025 16:47:33 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Feb 2025 16:47:34 +0800
Received: from sw-server.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 26 Feb 2025 16:47:33 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, Shuming Fan <shumingf@realtek.com>
Subject: [PATCH] ASoC: rt712-sdca: Add FU05 playback switch control
Date: Wed, 26 Feb 2025 16:47:28 +0800
Message-ID: <20250226084728.1889082-1-shumingf@realtek.com>
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

Because there is no playback switch control for rt712-sdw headphone endpoint,
it causes there is no way to control HP on and off in ALSA UCM config.

Signed-off-by: derek.fang <derek.fang@realtek.com>
Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt712-sdca.c | 80 +++++++++++++++++++++++++++--------
 sound/soc/codecs/rt712-sdca.h |  3 ++
 2 files changed, 66 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca.c b/sound/soc/codecs/rt712-sdca.c
index 78dbf9eed494..19d99b9d4ab2 100644
--- a/sound/soc/codecs/rt712-sdca.c
+++ b/sound/soc/codecs/rt712-sdca.c
@@ -652,6 +652,61 @@ static int rt712_sdca_fu0f_capture_put(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
+static int rt712_sdca_set_fu05_playback_ctl(struct rt712_sdca_priv *rt712)
+{
+	int err;
+	unsigned int ch_01, ch_02;
+
+	ch_01 = (rt712->fu05_dapm_mute || rt712->fu05_mixer_l_mute) ? 0x01 : 0x00;
+	ch_02 = (rt712->fu05_dapm_mute || rt712->fu05_mixer_r_mute) ? 0x01 : 0x00;
+
+	err = regmap_write(rt712->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU05,
+			RT712_SDCA_CTL_FU_MUTE, CH_01), ch_01);
+	if (err < 0)
+		return err;
+
+	err = regmap_write(rt712->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU05,
+			RT712_SDCA_CTL_FU_MUTE, CH_02), ch_02);
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+
+static int rt712_sdca_fu05_playback_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct rt712_sdca_priv *rt712 = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = !rt712->fu05_mixer_l_mute;
+	ucontrol->value.integer.value[1] = !rt712->fu05_mixer_r_mute;
+	return 0;
+}
+
+static int rt712_sdca_fu05_playback_put(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct rt712_sdca_priv *rt712 = snd_soc_component_get_drvdata(component);
+	int err;
+
+	if (rt712->fu05_mixer_l_mute == !ucontrol->value.integer.value[0] &&
+		rt712->fu05_mixer_r_mute == !ucontrol->value.integer.value[1])
+		return 0;
+
+	rt712->fu05_mixer_l_mute = !ucontrol->value.integer.value[0];
+	rt712->fu05_mixer_r_mute = !ucontrol->value.integer.value[1];
+
+	err = rt712_sdca_set_fu05_playback_ctl(rt712);
+	if (err < 0)
+		return err;
+
+	return 1;
+}
+
 static const DECLARE_TLV_DB_SCALE(out_vol_tlv, -6525, 75, 0);
 static const DECLARE_TLV_DB_SCALE(mic_vol_tlv, -1725, 75, 0);
 static const DECLARE_TLV_DB_SCALE(boost_vol_tlv, 0, 1000, 0);
@@ -674,6 +729,8 @@ static const struct snd_kcontrol_new rt712_sdca_controls[] = {
 		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_PLATFORM_FU44, RT712_SDCA_CTL_FU_CH_GAIN, CH_02),
 		8, 3, 0,
 		rt712_sdca_set_gain_get, rt712_sdca_set_gain_put, boost_vol_tlv),
+	SOC_DOUBLE_EXT("FU05 Playback Switch", SND_SOC_NOPM, 0, 1, 1, 0,
+		rt712_sdca_fu05_playback_get, rt712_sdca_fu05_playback_put),
 };
 
 static const struct snd_kcontrol_new rt712_sdca_spk_controls[] = {
@@ -766,28 +823,15 @@ static int rt712_sdca_fu05_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component =
 		snd_soc_dapm_to_component(w->dapm);
 	struct rt712_sdca_priv *rt712 = snd_soc_component_get_drvdata(component);
-	unsigned char unmute = 0x0, mute = 0x1;
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		regmap_write(rt712->regmap,
-			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU05,
-				RT712_SDCA_CTL_FU_MUTE, CH_01),
-				unmute);
-		regmap_write(rt712->regmap,
-			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU05,
-				RT712_SDCA_CTL_FU_MUTE, CH_02),
-				unmute);
+		rt712->fu05_dapm_mute = false;
+		rt712_sdca_set_fu05_playback_ctl(rt712);
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
-		regmap_write(rt712->regmap,
-			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU05,
-				RT712_SDCA_CTL_FU_MUTE, CH_01),
-				mute);
-		regmap_write(rt712->regmap,
-			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU05,
-				RT712_SDCA_CTL_FU_MUTE, CH_02),
-				mute);
+		rt712->fu05_dapm_mute = true;
+		rt712_sdca_set_fu05_playback_ctl(rt712);
 		break;
 	}
 	return 0;
@@ -1640,6 +1684,8 @@ int rt712_sdca_init(struct device *dev, struct regmap *regmap,
 	rt712->fu1e_dapm_mute = true;
 	rt712->fu1e_mixer_mute[0] = rt712->fu1e_mixer_mute[1] =
 		rt712->fu1e_mixer_mute[2] = rt712->fu1e_mixer_mute[3] = true;
+	rt712->fu05_dapm_mute = true;
+	rt712->fu05_mixer_l_mute = rt712->fu05_mixer_r_mute = false;
 
 	/* JD source uses JD1 in default */
 	rt712->jd_src = RT712_JD1;
diff --git a/sound/soc/codecs/rt712-sdca.h b/sound/soc/codecs/rt712-sdca.h
index a08491496d90..7ab7d5feb50a 100644
--- a/sound/soc/codecs/rt712-sdca.h
+++ b/sound/soc/codecs/rt712-sdca.h
@@ -42,6 +42,9 @@ struct  rt712_sdca_priv {
 	bool fu0f_mixer_r_mute;
 	bool fu1e_dapm_mute;
 	bool fu1e_mixer_mute[4];
+	bool fu05_dapm_mute;
+	bool fu05_mixer_l_mute;
+	bool fu05_mixer_r_mute;
 };
 
 struct rt712_dmic_kctrl_priv {
-- 
2.34.1

