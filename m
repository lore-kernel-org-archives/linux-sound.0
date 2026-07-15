Received: from mail-m49235.qiye.163.com (mail-m49235.qiye.163.com [45.254.49.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B875377A91;
	Wed, 15 Jul 2026 23:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784156834; cv=none; b=LWsa6V8SnPp75wold3ihzuoVsRyQgP8zXiy90COyAx0ZjFcrx4qzjAyeW0ggnaCEMOuphmeEo58aAkb7bJf2N46R0Yltj1XdKWrMxqKRigIiA5prcCc4QFAC+rTeOIUmV5MlPpV6QNLIiNBFbpa6WhD6sTYqTir3v6iUPhUG0AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784156834; c=relaxed/simple;
	bh=pym3ys4a4I/PlTQKqWWuqhExcu3Ko942hk/0hFZFKT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G2LvpWJyDNEJRxtfUXlCgIEf/e4D7rALC4Hpsxw/Q04di1slEQDNMfcAmVERAeTes3xS2CeOp13H18qjaiXFQSyUDDnUOEvc4EELJuky9AMtDUGGb1Y2d8zaVb2TofbUViopOX7VkD2EvuHqxlbYDmKznGBX6oGoQ2RWcCDcLVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=iLf7PKzk; arc=none smtp.client-ip=45.254.49.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="iLf7PKzk"
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 464e8f2f3;
	Wed, 15 Jul 2026 22:03:27 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Wed, 15 Jul 2026 22:02:53 +0800
Subject: [PATCH v2 4/6] ASoC: qcom: sc8280xp: Add per-DAI board
 configuration
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-rubikpi-next-20260605-v2-4-67601d7a8581@thundersoft.com>
References: <20260715-rubikpi-next-20260605-v2-0-67601d7a8581@thundersoft.com>
In-Reply-To: <20260715-rubikpi-next-20260605-v2-0-67601d7a8581@thundersoft.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, 
 Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Roger Shimizu <rosh@debian.org>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784124199; l=10637;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=pym3ys4a4I/PlTQKqWWuqhExcu3Ko942hk/0hFZFKT0=;
 b=tqmAX7BClXxZP/cAP9my4bkHf34eo4U7lyGfOjAP4xFP2wDRsNNlrsaWP/j+0eEyk0DQCWMWB
 yCcCy8yEk72DVtE+5h9QqGVq7IMBDNGWXB2gvSGrnhhJUVBFtsyWSWp
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9f6616f16c09d5kunm638899c2110d2
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGRpJVhgZQ0xOGkIdGExNQlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=iLf7PKzkAZLn2Lqhkt0G7ZCX5TWMNyIbsLW5FBXkJTVCf5MdiG/BNhrbqdPNi08NEVFp01pT89x5Nfhvkw3pRyGfXSN6SyZv5pZBGWv9ZhRFPsJg2fbP19uiiy60MRy0wSTDu//xOG81RbYso3LTZ9sY4+ftZZ4KiFa722guHDY=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=AjZzpRCBTCU0/iL7rxIauV+73yrP3obTwHijRJow0/I=;
	h=date:mime-version:subject:message-id:from;

The board data currently applies codec format, sysclk, MI2S clock and
jack setup policy to every backend DAI on a sound card. That works for
boards with a uniform audio topology, but it cannot describe a card
which connects codecs with different clock requirements to different
MI2S interfaces.

Introduce an optional per-DAI configuration table indexed by the CPU DAI
ID. Each entry can select the codec DAI format, override the MCLK rate,
enable CPU MCLK and BCLK programming, request codec sysclk setup and
choose the jack setup path. Use one jack setup enum instead of unrelated
boolean flags so a DAI cannot select conflicting setup methods.

Migrate the existing WCD headset cards to the new representation. All
in-tree WCD capture links handled by this driver use TX_CODEC_DMA_TX_3;
cards sharing a compatible but lacking that link simply have no matching
runtime. This preserves existing behavior while allowing mixed-codec
cards to configure each link independently.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
 sound/soc/qcom/sc8280xp.c | 138 ++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 115 insertions(+), 23 deletions(-)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 109e39b93b2d..885ec1e3e575 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -37,6 +37,26 @@ static struct snd_soc_dapm_widget sc8280xp_dapm_widgets[] = {
 	SND_SOC_DAPM_SPK("DP7 Jack", NULL),
 };
 
+enum sc8280xp_jack_setup {
+	SC8280XP_JACK_SETUP_NONE,
+	SC8280XP_JACK_SETUP_CODEC,
+	SC8280XP_JACK_SETUP_WCD,
+};
+
+struct sc8280xp_dai_data {
+	unsigned int id;
+	unsigned int codec_dai_fmt;
+	unsigned int mclk_rate;
+	bool codec_sysclk_set;
+	bool mi2s_mclk_enable;
+	bool mi2s_bclk_enable;
+	enum sc8280xp_jack_setup jack_setup;
+};
+
+#define SC8280XP_DAI_DATA(...) \
+	.dai_data = (const struct sc8280xp_dai_data[]) { __VA_ARGS__ }, \
+	.num_dai_data = ARRAY_SIZE(((const struct sc8280xp_dai_data[]) { __VA_ARGS__ }))
+
 struct snd_soc_common {
 	const char *driver_name;
 	const struct snd_soc_dapm_widget *dapm_widgets;
@@ -45,11 +65,8 @@ struct snd_soc_common {
 	int num_dapm_routes;
 	const struct snd_kcontrol_new *controls;
 	int num_controls;
-	unsigned int codec_dai_fmt;
-	bool codec_sysclk_set;
-	bool mi2s_mclk_enable;
-	bool mi2s_bclk_enable;
-	bool wcd_jack;
+	const struct sc8280xp_dai_data *dai_data;
+	size_t num_dai_data;
 };
 
 struct sc8280xp_snd_data {
@@ -61,6 +78,20 @@ struct sc8280xp_snd_data {
 	bool jack_setup;
 };
 
+static const struct sc8280xp_dai_data *sc8280xp_get_dai_data(
+				const struct snd_soc_common *common,
+				unsigned int id)
+{
+	size_t i;
+
+	for (i = 0; i < common->num_dai_data; i++) {
+		if (common->dai_data[i].id == id)
+			return &common->dai_data[i];
+	}
+
+	return NULL;
+}
+
 static inline int sc8280xp_get_mclk_freq(struct snd_pcm_hw_params *params)
 {
 	int rate = params_rate(params);
@@ -88,10 +119,14 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	const struct sc8280xp_dai_data *dai_data;
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_jack *dp_jack  = NULL;
 	int dp_pcm_id = 0;
 
+	dai_data = sc8280xp_get_dai_data(data->snd_soc_common_priv,
+					 cpu_dai->id);
+
 	switch (cpu_dai->id) {
 	case WSA_CODEC_DMA_RX_0:
 	case WSA_CODEC_DMA_RX_1:
@@ -121,10 +156,18 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 	if (dp_jack)
 		return qcom_snd_dp_jack_setup(rtd, dp_jack, dp_pcm_id);
 
-	if (data->snd_soc_common_priv->wcd_jack)
-		return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
+	if (!dai_data)
+		return 0;
 
-	return 0;
+	switch (dai_data->jack_setup) {
+	case SC8280XP_JACK_SETUP_CODEC:
+		return qcom_snd_headset_jack_setup(rtd, &data->jack,
+						   &data->jack_setup);
+	case SC8280XP_JACK_SETUP_WCD:
+		return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
+	default:
+		return 0;
+	}
 }
 
 static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
@@ -163,10 +206,17 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
-	int mclk_freq = sc8280xp_get_mclk_freq(params);
+	const struct sc8280xp_dai_data *dai_data;
+	int mclk_freq;
 	int bclk_freq = sc8280xp_get_bclk_freq(params);
 	int ret;
 
+	dai_data = sc8280xp_get_dai_data(data->snd_soc_common_priv,
+					 cpu_dai->id);
+	mclk_freq = dai_data && dai_data->mclk_rate ?
+			dai_data->mclk_rate :
+			sc8280xp_get_mclk_freq(params);
+
 	switch (cpu_dai->id) {
 	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
 	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
@@ -175,14 +225,14 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 		if (ret && ret != -EOPNOTSUPP)
 			return ret;
 
-		if (data->snd_soc_common_priv->codec_dai_fmt) {
+		if (dai_data && dai_data->codec_dai_fmt) {
 			ret = snd_soc_dai_set_fmt(codec_dai,
-						  data->snd_soc_common_priv->codec_dai_fmt);
+						  dai_data->codec_dai_fmt);
 			if (ret && ret != -EOPNOTSUPP)
 				return ret;
 		}
 
-		if (data->snd_soc_common_priv->mi2s_mclk_enable) {
+		if (dai_data && dai_data->mi2s_mclk_enable) {
 			ret = snd_soc_dai_set_sysclk(cpu_dai,
 						     LPAIF_MI2S_MCLK, mclk_freq,
 						     SND_SOC_CLOCK_OUT);
@@ -190,7 +240,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 				return ret;
 		}
 
-		if (data->snd_soc_common_priv->mi2s_bclk_enable) {
+		if (dai_data && dai_data->mi2s_bclk_enable) {
 			ret = snd_soc_dai_set_sysclk(cpu_dai,
 						     LPAIF_MI2S_BCLK, bclk_freq,
 						     SND_SOC_CLOCK_OUT);
@@ -198,7 +248,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 				return ret;
 		}
 
-		if (data->snd_soc_common_priv->codec_sysclk_set) {
+		if (dai_data && dai_data->codec_sysclk_set) {
 			ret = snd_soc_dai_set_sysclk(codec_dai,
 						     0, mclk_freq,
 						     SND_SOC_CLOCK_IN);
@@ -231,6 +281,20 @@ static int sc8280xp_snd_hw_free(struct snd_pcm_substream *substream)
 	return qcom_snd_sdw_hw_free(substream, &data->stream_prepared[cpu_dai->id]);
 }
 
+static void sc8280xp_snd_exit(struct snd_soc_pcm_runtime *rtd)
+{
+	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	const struct sc8280xp_dai_data *dai_data;
+
+	dai_data = sc8280xp_get_dai_data(data->snd_soc_common_priv,
+					 cpu_dai->id);
+	if (dai_data && dai_data->jack_setup == SC8280XP_JACK_SETUP_CODEC) {
+		qcom_snd_headset_jack_cleanup(rtd);
+		data->jack_setup = false;
+	}
+}
+
 static const struct snd_soc_ops sc8280xp_be_ops = {
 	.startup = qcom_snd_sdw_startup,
 	.shutdown = qcom_snd_sdw_shutdown,
@@ -247,6 +311,7 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *card)
 	for_each_card_prelinks(card, i, link) {
 		if (link->no_pcm == 1) {
 			link->init = sc8280xp_snd_init;
+			link->exit = sc8280xp_snd_exit;
 			link->be_hw_params_fixup = sc8280xp_be_hw_params_fixup;
 			link->ops = &sc8280xp_be_ops;
 		}
@@ -297,14 +362,20 @@ static const struct snd_soc_common eliza_priv_data = {
 	.driver_name = "eliza",
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
-	.wcd_jack = true,
+	SC8280XP_DAI_DATA({
+		.id = TX_CODEC_DMA_TX_3,
+		.jack_setup = SC8280XP_JACK_SETUP_WCD,
+	}),
 };
 
 static const struct snd_soc_common kaanapali_priv_data = {
 	.driver_name = "kaanapali",
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
-	.wcd_jack = true,
+	SC8280XP_DAI_DATA({
+		.id = TX_CODEC_DMA_TX_3,
+		.jack_setup = SC8280XP_JACK_SETUP_WCD,
+	}),
 };
 
 static const struct snd_soc_common qcs9100_priv_data = {
@@ -323,14 +394,20 @@ static const struct snd_soc_common qcm6490_priv_data = {
 	.driver_name = "qcm6490",
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
-	.wcd_jack = true,
+	SC8280XP_DAI_DATA({
+		.id = TX_CODEC_DMA_TX_3,
+		.jack_setup = SC8280XP_JACK_SETUP_WCD,
+	}),
 };
 
 static const struct snd_soc_common qcs6490_priv_data = {
 	.driver_name = "qcs6490",
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
-	.wcd_jack = true,
+	SC8280XP_DAI_DATA({
+		.id = TX_CODEC_DMA_TX_3,
+		.jack_setup = SC8280XP_JACK_SETUP_WCD,
+	}),
 };
 
 static const struct snd_soc_common qcs8275_priv_data = {
@@ -343,35 +420,50 @@ static const struct snd_soc_common sc8280xp_priv_data = {
 	.driver_name = "sc8280xp",
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
-	.wcd_jack = true,
+	SC8280XP_DAI_DATA({
+		.id = TX_CODEC_DMA_TX_3,
+		.jack_setup = SC8280XP_JACK_SETUP_WCD,
+	}),
 };
 
 static const struct snd_soc_common sm8450_priv_data = {
 	.driver_name = "sm8450",
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
-	.wcd_jack = true,
+	SC8280XP_DAI_DATA({
+		.id = TX_CODEC_DMA_TX_3,
+		.jack_setup = SC8280XP_JACK_SETUP_WCD,
+	}),
 };
 
 static const struct snd_soc_common sm8550_priv_data = {
 	.driver_name = "sm8550",
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
-	.wcd_jack = true,
+	SC8280XP_DAI_DATA({
+		.id = TX_CODEC_DMA_TX_3,
+		.jack_setup = SC8280XP_JACK_SETUP_WCD,
+	}),
 };
 
 static const struct snd_soc_common sm8650_priv_data = {
 	.driver_name = "sm8650",
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
-	.wcd_jack = true,
+	SC8280XP_DAI_DATA({
+		.id = TX_CODEC_DMA_TX_3,
+		.jack_setup = SC8280XP_JACK_SETUP_WCD,
+	}),
 };
 
 static const struct snd_soc_common sm8750_priv_data = {
 	.driver_name = "sm8750",
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
-	.wcd_jack = true,
+	SC8280XP_DAI_DATA({
+		.id = TX_CODEC_DMA_TX_3,
+		.jack_setup = SC8280XP_JACK_SETUP_WCD,
+	}),
 };
 
 static const struct of_device_id snd_sc8280xp_dt_match[] = {

-- 
2.43.0

