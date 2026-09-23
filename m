Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C8E49482C
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 11:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161342; cv=none; b=rkiBzAU0XZ+/o6Q9OkC9UmAXT8+KEehl9Xk/gsXPN8Cd2KBzN+PcudV4OvVqWdPCWYTWVytCJ9ViI7XGBhmAxjoWnd0Q3EYMK8J9rEeU99lp1GJf+eLpkqm+KVAXn1XKDxi/sR0xGd58YFpkrN+A27tOVM8nkn56ScyYhIlLMpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161342; c=relaxed/simple;
	bh=FO9rfCGXeleMiZQHCOXGK89fQch1UQFuOL74ihVfalM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GEXmAmdFQby/6YjYegv87Vgh/p2SlEwlVepEucghWsFQVq8QVUWUNuaI78oZw5CREQepHpyAxnNFMKuO099U+hLushrAjbI09glb2sRynYpwhn2YxHl1U+f046sU3qbA4haY8aFi6xtdof4O+PUTap2DnkTBq1AvT69hhjjbyrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=S9aBbPTY; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="S9aBbPTY"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 68NB1ky06236212, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1790161306; bh=BeoCDXiZVplvBAlJngxtgqlVQ9YNFe5MihsauYY2DVw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=S9aBbPTYVj5/D1NB71yIObigmUv2B0Zoq9pxBgJ4N3P55IdyNDTLGMEHLM2BMYivl
	 lkumX6pt+A4FCe3sCTRXS8S9hjGOY04pV6p4WbWlz3amh7nKcbXY4QuQploVfbJdlS
	 uP/XsrSFv/8jD12df0NUoJOsgHj30c7vl/HE7Ur353Xhvna5B+xTgHlpGK6nhSCAfu
	 Wqz1PlQFsCpeKUwBSA9X7X+PIizyibKmu4jfR23zJadA6FbMAaTuY4OlcOSz52lG29
	 5WZpjo7ItgzP57hVCgNyvLikTpsgyoYLBY8ACKzI0ABKAh6IzeoiAS8MIHdjsTWLPw
	 9EHikdA6NvgKQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 68NB1ky06236212
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Sep 2026 19:01:46 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 23 Sep 2026 19:01:46 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 23 Sep 2026 19:01:45 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server id
 15.2.2562.49 via Frontend Transport; Wed, 23 Sep 2026 19:01:45 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
	<oder_chiou@realtek.com>, <jack.yu@realtek.com>, <derek.fang@realtek.com>,
	Shuming Fan <shumingf@realtek.com>
Subject: [PATCH 2/3] ASoC: sdw_utils: Add rt766/rt767 support
Date: Wed, 23 Sep 2026 19:01:43 +0800
Message-ID: <20260923110143.3419718-1-shumingf@realtek.com>
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

This patch adds the codec_info and route-related settings.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c      |   6 +
 .../sdw_utils/soc_sdw_rt_sdca_jack_common.c   |   8 +
 sound/soc/sdw_utils/soc_sdw_utils.c           | 172 ++++++++++++++++++
 3 files changed, 186 insertions(+)

diff --git a/sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c b/sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c
index 5bf3627a97a0..6e5fa93b5fc2 100644
--- a/sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c
+++ b/sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c
@@ -33,6 +33,11 @@ static const struct snd_soc_dapm_route rt722_spk_map[] = {
 	{ "Speaker", NULL, "rt722 SPK" },
 };
 
+static const struct snd_soc_dapm_route rt766_spk_map[] = {
+	{ "Speaker", NULL, "rt766 SPOL" },
+	{ "Speaker", NULL, "rt766 SPOR" },
+};
+
 /* Structure to map codec names to respective route arrays and sizes */
 struct codec_route_map {
 	const char *codec_name;
@@ -45,6 +50,7 @@ static const struct codec_route_map codec_routes[] = {
 	{ "rt712", rt712_spk_map, ARRAY_SIZE(rt712_spk_map) },
 	{ "rt721", rt721_spk_map, ARRAY_SIZE(rt721_spk_map) },
 	{ "rt722", rt722_spk_map, ARRAY_SIZE(rt722_spk_map) },
+	{ "rt766", rt766_spk_map, ARRAY_SIZE(rt766_spk_map) },
 };
 
 static const struct codec_route_map *get_codec_route_map(const char *codec_name)
diff --git a/sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c b/sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c
index 2547b5b3fdd7..b4e427d55130 100644
--- a/sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c
+++ b/sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c
@@ -70,6 +70,11 @@ static const struct snd_soc_dapm_route rt722_sdca_map[] = {
 	{ "rt722 MIC2", NULL, "Headset Mic" },
 };
 
+static const struct snd_soc_dapm_route rt766_sdca_map[] = {
+	{ "Headphone", NULL, "rt766 HP" },
+	{ "rt766 MIC2", NULL, "Headset Mic" },
+};
+
 static struct snd_soc_jack_pin rt_sdca_jack_pins[] = {
 	{
 		.pin    = "Headphone",
@@ -133,6 +138,9 @@ int asoc_sdw_rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_s
 	} else if (strstr(component->name_prefix, "rt722")) {
 		ret = snd_soc_dapm_add_routes(dapm, rt722_sdca_map,
 					      ARRAY_SIZE(rt722_sdca_map));
+	} else if (strstr(component->name_prefix, "rt766")) {
+		ret = snd_soc_dapm_add_routes(dapm, rt766_sdca_map,
+					      ARRAY_SIZE(rt766_sdca_map));
 	} else {
 		dev_err(card->dev, "%s is not supported\n", component->name_prefix);
 		return -EINVAL;
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 0d7182bebcdc..d0201b238d24 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -733,6 +733,178 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		},
 		.dai_num = 3,
 	},
+	{
+		.vendor_id = 0x025d,
+		.part_id = 0x767,
+		.name_prefix = "rt766",
+		.version_id = 3,
+		.dais =	{
+			{
+				.direction = {true, true},
+				.dai_name = "rt766-sdca-aif1",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
+				.init = asoc_sdw_rt_sdca_jack_init,
+				.exit = asoc_sdw_rt_sdca_jack_exit,
+				.rtd_init = asoc_sdw_rt_sdca_jack_rtd_init,
+				.controls = generic_jack_controls,
+				.num_controls = ARRAY_SIZE(generic_jack_controls),
+				.widgets = generic_jack_widgets,
+				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
+			},
+			{
+				.direction = {true, false},
+				.dai_name = "rt766-sdca-aif2",
+				.component_name = "rt766",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
+				.init = asoc_sdw_rt_amp_init,
+				.exit = asoc_sdw_rt_amp_exit,
+				.rtd_init = asoc_sdw_rt_mf_sdca_spk_rtd_init,
+				.controls = generic_spk_controls,
+				.num_controls = ARRAY_SIZE(generic_spk_controls),
+				.widgets = generic_spk_widgets,
+				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
+			},
+			{
+				.direction = {false, true},
+				.dai_name = "rt766-sdca-aif3",
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
+				.rtd_init = asoc_sdw_rt_dmic_rtd_init,
+			},
+		},
+		.dai_num = 3,
+	},
+	{
+		.vendor_id = 0x025d,
+		.part_id = 0x767,
+		.name_prefix = "rt766",
+		.version_id = 4,
+		.dais =	{
+			{
+				.direction = {true, true},
+				.dai_name = "rt766-sdca-aif1",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
+				.init = asoc_sdw_rt_sdca_jack_init,
+				.exit = asoc_sdw_rt_sdca_jack_exit,
+				.rtd_init = asoc_sdw_rt_sdca_jack_rtd_init,
+				.controls = generic_jack_controls,
+				.num_controls = ARRAY_SIZE(generic_jack_controls),
+				.widgets = generic_jack_widgets,
+				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
+			},
+			{
+				.direction = {true, false},
+				.dai_name = "rt766-sdca-aif2",
+				.component_name = "rt766",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
+				.init = asoc_sdw_rt_amp_init,
+				.exit = asoc_sdw_rt_amp_exit,
+				.rtd_init = asoc_sdw_rt_mf_sdca_spk_rtd_init,
+				.controls = generic_spk_controls,
+				.num_controls = ARRAY_SIZE(generic_spk_controls),
+				.widgets = generic_spk_widgets,
+				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
+			},
+			{
+				.direction = {false, true},
+				.dai_name = "rt766-sdca-aif3",
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
+				.rtd_init = asoc_sdw_rt_dmic_rtd_init,
+			},
+		},
+		.dai_num = 3,
+	},
+	{
+		.vendor_id = 0x025d,
+		.part_id = 0x766,
+		.name_prefix = "rt766",
+		.version_id = 3,
+		.dais =	{
+			{
+				.direction = {true, true},
+				.dai_name = "rt766-sdca-aif1",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
+				.init = asoc_sdw_rt_sdca_jack_init,
+				.exit = asoc_sdw_rt_sdca_jack_exit,
+				.rtd_init = asoc_sdw_rt_sdca_jack_rtd_init,
+				.controls = generic_jack_controls,
+				.num_controls = ARRAY_SIZE(generic_jack_controls),
+				.widgets = generic_jack_widgets,
+				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
+			},
+			{
+				.direction = {true, false},
+				.dai_name = "rt766-sdca-aif2",
+				.component_name = "rt766",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
+				.init = asoc_sdw_rt_amp_init,
+				.exit = asoc_sdw_rt_amp_exit,
+				.rtd_init = asoc_sdw_rt_mf_sdca_spk_rtd_init,
+				.controls = generic_spk_controls,
+				.num_controls = ARRAY_SIZE(generic_spk_controls),
+				.widgets = generic_spk_widgets,
+				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
+			},
+			{
+				.direction = {false, true},
+				.dai_name = "rt766-sdca-aif3",
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
+				.rtd_init = asoc_sdw_rt_dmic_rtd_init,
+			},
+		},
+		.dai_num = 3,
+	},
+	{
+		.vendor_id = 0x025d,
+		.part_id = 0x766,
+		.name_prefix = "rt766",
+		.version_id = 4,
+		.dais =	{
+			{
+				.direction = {true, true},
+				.dai_name = "rt766-sdca-aif1",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
+				.init = asoc_sdw_rt_sdca_jack_init,
+				.exit = asoc_sdw_rt_sdca_jack_exit,
+				.rtd_init = asoc_sdw_rt_sdca_jack_rtd_init,
+				.controls = generic_jack_controls,
+				.num_controls = ARRAY_SIZE(generic_jack_controls),
+				.widgets = generic_jack_widgets,
+				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
+			},
+			{
+				.direction = {true, false},
+				.dai_name = "rt766-sdca-aif2",
+				.component_name = "rt766",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
+				.init = asoc_sdw_rt_amp_init,
+				.exit = asoc_sdw_rt_amp_exit,
+				.rtd_init = asoc_sdw_rt_mf_sdca_spk_rtd_init,
+				.controls = generic_spk_controls,
+				.num_controls = ARRAY_SIZE(generic_spk_controls),
+				.widgets = generic_spk_widgets,
+				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
+			},
+			{
+				.direction = {false, true},
+				.dai_name = "rt766-sdca-aif3",
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
+				.rtd_init = asoc_sdw_rt_dmic_rtd_init,
+			},
+		},
+		.dai_num = 3,
+	},
 	{
 		.vendor_id = 0x019f,
 		.part_id = 0x8373,
-- 
2.54.0

