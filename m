Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52AC2566D3;
	Mon, 20 Apr 2026 01:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776647625; cv=none; b=cIfKQpY/zXdBBj4X18AYn5kOOg/nVb/bxfU34Fi/1K05oy0uncHKXJxVuOhoVrVqlFIahHTZKgbcEuKYHjkxzOabKWsCY/AhAcru7ymt5QTkiQVPL0zcZNruPoHqvEkxgALI/Sl7UrMGRlubrPBZCjqmsTOHlCMIUqbnO76jSB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776647625; c=relaxed/simple;
	bh=+un8jP2kd7lwChJqKQDeHPIf3ge6bBcA7xamU+ihRck=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZTDIR8MY6fM2gNXhFfjDkklVG9vN4PvXeimIMAM/3vlJWzwCbuKgc4Fc0Miv/rQVpsuatf0vEgerMKy4hVEXbOJjusjtAyzntceF7WIUKwi9WnyQgcKr31Lq2q7lzxNEaC+s29isn8oiwLmwLCUOhC1voUgnuMwJdPpZLlUiFyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wEdCj-000000002YR-30oZ;
	Mon, 20 Apr 2026 01:13:37 +0000
Date: Mon, 20 Apr 2026 02:13:34 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>, Cyril Chao <Cyril.Chao@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 5/9] ASoC: mediatek: mt2701: add HDMI audio memif, FE and
 BE DAIs
Message-ID: <59f911bb1a855a00c0d9dd4760f10ff0030fedb6.1776646435.git.daniel@makrotopia.org>
References: <cover.1776646435.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1776646435.git.daniel@makrotopia.org>

Extend the MT2701/MT7623N AFE driver with the HDMI playback path:

  - a new HDMI DMA memif (MT2701_MEMIF_HDMI) mapped to the
    AFE_HDMI_OUT_{CON0,BASE,CUR,END} registers;
  - a PCM_HDMI front-end DAI (S16_LE only, 44.1k/48k) which feeds
    the memif via DPCM;
  - an HDMI BE DAI wrapping the AFE_8CH_I2S_OUT_CON engine that
    serialises L/R samples towards the on-chip HDMI transmitter.

Sample-rate programming uses the empirically determined
HDMI_BCK_DIV = 45 * 48000 / rate - 1 formula in AUDIO_TOP_CON3,
which covers 44.1 kHz and 48 kHz within the 6-bit divider range.
The AFE_HDMI_CONN0 interconnect is programmed to route memif
output pairs to the serializer inputs with L/R in the right order
for hdmi-audio-codec.

The existing I2S engine helpers (mt2701_mclk_configuration,
mt2701_i2s_path_enable, mt2701_afe_i2s_path_disable) are reused
for the HDMI BE so that MCLK at 128*fs and the ASYS I2S3 FS field
are programmed and cleanly released across open/close cycles.

Only S16_LE and 44.1k/48k are exposed to userspace. Other rates
fall outside the 6-bit BCK divider range, and wider sample
formats require DMA BIT_WIDTH programming that the current memif
setup does not handle. These limits match what the MT8173 AFE
driver exposes for its HDMI path.

The HDMI-related AFE registers (AUDIO_TOP_CON3, AFE_HDMI_OUT_CON0,
AFE_HDMI_CONN0, AFE_8CH_I2S_OUT_CON) are added to the suspend
backup list so that the existing mtk_afe_suspend/resume framework
saves and restores them across system sleep cycles.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v2:
 * use named masks and explicitly set BIT_WIDTH_16 when
   programming AFE_HDMI_OUT_CON0 channel count (Mark Brown)
 * add AUDIO_TOP_CON3, AFE_HDMI_OUT_CON0, AFE_HDMI_CONN0,
   AFE_8CH_I2S_OUT_CON to suspend/resume backup list
   (Mark Brown)

 sound/soc/mediatek/mt2701/mt2701-afe-common.h |   2 +
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c    | 293 +++++++++++++++++-
 2 files changed, 294 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-common.h b/sound/soc/mediatek/mt2701/mt2701-afe-common.h
index 7b15283d6351e..8b6f3a200048a 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-common.h
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-common.h
@@ -33,6 +33,7 @@ enum {
 	MT2701_MEMIF_UL5,
 	MT2701_MEMIF_DLBT,
 	MT2701_MEMIF_ULBT,
+	MT2701_MEMIF_HDMI,
 	MT2701_MEMIF_NUM,
 	MT2701_IO_I2S = MT2701_MEMIF_NUM,
 	MT2701_IO_2ND_I2S,
@@ -41,6 +42,7 @@ enum {
 	MT2701_IO_5TH_I2S,
 	MT2701_IO_6TH_I2S,
 	MT2701_IO_MRG,
+	MT2701_IO_HDMI,
 };
 
 enum {
diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
index fcae38135d93f..4db16132e2c07 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
@@ -13,6 +13,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
 #include <linux/pm_runtime.h>
+#include <sound/pcm_params.h>
 
 #include "mt2701-afe-common.h"
 #include "mt2701-afe-clock-ctrl.h"
@@ -60,6 +61,7 @@ static const struct mt2701_afe_rate mt2701_afe_i2s_rates[] = {
 
 static const unsigned int mt2701_afe_backup_list[] = {
 	AUDIO_TOP_CON0,
+	AUDIO_TOP_CON3,
 	AUDIO_TOP_CON4,
 	AUDIO_TOP_CON5,
 	ASYS_TOP_CON,
@@ -77,6 +79,9 @@ static const unsigned int mt2701_afe_backup_list[] = {
 	AFE_CONN22,
 	AFE_DAC_CON0,
 	AFE_MEMIF_PBUF_SIZE,
+	AFE_HDMI_OUT_CON0,
+	AFE_HDMI_CONN0,
+	AFE_8CH_I2S_OUT_CON,
 };
 
 static int mt2701_dai_num_to_i2s(struct mtk_base_afe *afe, int num)
@@ -542,6 +547,229 @@ static const struct snd_soc_dai_ops mt2701_btmrg_ops = {
 	.hw_params = mt2701_btmrg_hw_params,
 };
 
+/*
+ * HDMI BE DAI -- drives the on-SoC 8-channel I2S engine whose output
+ * feeds the HDMI transmitter audio port.
+ *
+ * The HDMI audio hardware path is:
+ *   HDMI memif DMA (AFE_HDMI_OUT_*) -> interconnect mux (AFE_HDMI_CONN0)
+ *   -> 8-channel I2S engine (AFE_8CH_I2S_OUT_CON) -> HDMI TX audio port
+ *
+ * The I2S3 clock tree provides the bit/master clocks; we set its
+ * mclk_rate to 128*fs (matching HDMI_AUD_MCLK_128FS) and let
+ * mt2701_mclk_configuration program the PLL/divider path.
+ */
+#define MT2701_HDMI_I2S_PATH	3
+
+static int mt2701_afe_hdmi_startup(struct snd_pcm_substream *substream,
+				   struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mt2701_afe_private *afe_priv = afe->platform_priv;
+	int ret;
+
+	if (!afe_priv->hadds2pll_ck || !afe_priv->audio_hdmi_ck) {
+		dev_err(afe->dev, "HDMI audio clocks not available\n");
+		return -ENODEV;
+	}
+
+	ret = clk_prepare_enable(afe_priv->hadds2pll_ck);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(afe_priv->audio_hdmi_ck);
+	if (ret)
+		goto err_hdmi;
+
+	if (afe_priv->audio_spdf_ck) {
+		ret = clk_prepare_enable(afe_priv->audio_spdf_ck);
+		if (ret)
+			goto err_spdf;
+	}
+
+	if (afe_priv->audio_apll_ck) {
+		ret = clk_prepare_enable(afe_priv->audio_apll_ck);
+		if (ret)
+			goto err_apll;
+	}
+
+	ret = mt2701_afe_enable_mclk(afe, MT2701_HDMI_I2S_PATH);
+	if (ret)
+		goto err_mclk;
+
+	return 0;
+
+err_mclk:
+	if (afe_priv->audio_apll_ck)
+		clk_disable_unprepare(afe_priv->audio_apll_ck);
+err_apll:
+	if (afe_priv->audio_spdf_ck)
+		clk_disable_unprepare(afe_priv->audio_spdf_ck);
+err_spdf:
+	clk_disable_unprepare(afe_priv->audio_hdmi_ck);
+err_hdmi:
+	clk_disable_unprepare(afe_priv->hadds2pll_ck);
+	return ret;
+}
+
+static void mt2701_afe_hdmi_shutdown(struct snd_pcm_substream *substream,
+				     struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mt2701_afe_private *afe_priv = afe->platform_priv;
+
+	mt2701_afe_disable_mclk(afe, MT2701_HDMI_I2S_PATH);
+	if (afe_priv->audio_apll_ck)
+		clk_disable_unprepare(afe_priv->audio_apll_ck);
+	if (afe_priv->audio_spdf_ck)
+		clk_disable_unprepare(afe_priv->audio_spdf_ck);
+	clk_disable_unprepare(afe_priv->audio_hdmi_ck);
+	clk_disable_unprepare(afe_priv->hadds2pll_ck);
+}
+
+static int mt2701_afe_hdmi_hw_params(struct snd_pcm_substream *substream,
+				     struct snd_pcm_hw_params *params,
+				     struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mt2701_afe_private *afe_priv = afe->platform_priv;
+	unsigned int channels = params_channels(params);
+	unsigned int rate = params_rate(params);
+	unsigned int divp1;
+	unsigned int val;
+	unsigned int i;
+	int ret;
+
+	/*
+	 * Compute AUDIO_TOP_CON3.HDMI_BCK_DIV up front. The divider
+	 * drives an internal reference for the HDMI transmitter's
+	 * audio packet engine; it must scale with the sample rate so
+	 * that the packet engine's timing matches the data flowing in
+	 * from the AFE memif/I2S3 side. Empirically, with audpll_sel
+	 * parented to hadds2pll_98m (98.304 MHz), the correct value at
+	 * 48 kHz is div = 44 (i.e. (div+1) = 45), giving 1.0923 MHz.
+	 * Scaling inversely with rate: (div + 1) = 45 * 48000 / rate.
+	 * Integer rounding introduces small (<1%) errors at 32 kHz;
+	 * 44.1 kHz is nearly exact via round-to-nearest. Reject rates
+	 * that fall outside the 6-bit divider range before touching
+	 * any hardware so no side effects are left behind on error.
+	 */
+	divp1 = (45U * 48000U + rate / 2) / rate;
+	if (divp1 == 0 || divp1 > 64)
+		return -EINVAL;
+
+	/*
+	 * Park the I2S3 clock tree at 128*fs -- this is the MCLK that
+	 * the ASYS I2S3 engine uses to derive its BCK/LRCK. The engine
+	 * outputs BCK = 64*fs (stereo, 32-bit word length).
+	 */
+	afe_priv->i2s_path[MT2701_HDMI_I2S_PATH].mclk_rate = rate * 128;
+	ret = mt2701_mclk_configuration(afe, MT2701_HDMI_I2S_PATH);
+	if (ret)
+		return ret;
+
+	/* Program and start the ASYS I2S3 engine (FS, I2S mode, enable). */
+	mt2701_i2s_path_enable(afe,
+			       &afe_priv->i2s_path[MT2701_HDMI_I2S_PATH],
+			       SNDRV_PCM_STREAM_PLAYBACK, rate);
+
+	regmap_update_bits(afe->regmap, AUDIO_TOP_CON3,
+			   AUDIO_TOP_CON3_HDMI_BCK_DIV_MASK,
+			   AUDIO_TOP_CON3_HDMI_BCK_DIV(divp1 - 1));
+
+	/*
+	 * HDMI output memif: set channel count and confirm 16-bit
+	 * sample width. Both fields must be written together so that
+	 * stale reset-default or prior-stream values in BIT_WIDTH
+	 * cannot persist.
+	 */
+	regmap_update_bits(afe->regmap, AFE_HDMI_OUT_CON0,
+			   AFE_HDMI_OUT_CON0_CH_NUM_MASK |
+			   AFE_HDMI_OUT_CON0_BIT_WIDTH_MASK,
+			   AFE_HDMI_OUT_CON0_CH_NUM(channels) |
+			   AFE_HDMI_OUT_CON0_BIT_WIDTH_16);
+
+	/*
+	 * Interconnect mux -- map DMA input slots to HDMI output slots.
+	 * Each output takes a 3-bit field at shift (i*3). Swap the first
+	 * two inputs so that the DMA's interleaved L/R pair lands on the
+	 * correct HDMI L/R output slots. Remaining slots are identity.
+	 */
+	val = (1 << 0) | (0 << 3);  /* O20 <- I21, O21 <- I20 */
+	for (i = 2; i < 8; i++)
+		val |= ((i & 0x7) << (i * 3));
+	regmap_write(afe->regmap, AFE_HDMI_CONN0, val);
+
+	/*
+	 * 8-channel I2S framing: standard I2S, 32-bit slots,
+	 * LRCK/BCK inverted. The wire protocol is fixed.
+	 */
+	regmap_update_bits(afe->regmap, AFE_8CH_I2S_OUT_CON,
+			   AFE_8CH_I2S_OUT_CON_WLEN_MASK |
+			   AFE_8CH_I2S_OUT_CON_I2S_DELAY |
+			   AFE_8CH_I2S_OUT_CON_LRCK_INV |
+			   AFE_8CH_I2S_OUT_CON_BCK_INV,
+			   AFE_8CH_I2S_OUT_CON_WLEN_32BIT |
+			   AFE_8CH_I2S_OUT_CON_I2S_DELAY |
+			   AFE_8CH_I2S_OUT_CON_LRCK_INV |
+			   AFE_8CH_I2S_OUT_CON_BCK_INV);
+	return 0;
+}
+
+static int mt2701_afe_hdmi_trigger(struct snd_pcm_substream *substream, int cmd,
+				   struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+		/* Ungate HDMI and SPDIF power islands. */
+		regmap_update_bits(afe->regmap, AUDIO_TOP_CON0,
+				   AUDIO_TOP_CON0_PDN_HDMI_CK |
+				   AUDIO_TOP_CON0_PDN_SPDIF_CK, 0);
+		/* Enable HDMI output memif. */
+		regmap_update_bits(afe->regmap, AFE_HDMI_OUT_CON0, 0x1, 0x1);
+		/* Enable 8-channel I2S engine. */
+		regmap_update_bits(afe->regmap, AFE_8CH_I2S_OUT_CON,
+				   AFE_8CH_I2S_OUT_CON_EN,
+				   AFE_8CH_I2S_OUT_CON_EN);
+		return 0;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+		regmap_update_bits(afe->regmap, AFE_8CH_I2S_OUT_CON,
+				   AFE_8CH_I2S_OUT_CON_EN, 0);
+		regmap_update_bits(afe->regmap, AFE_HDMI_OUT_CON0, 0x1, 0);
+		regmap_update_bits(afe->regmap, AUDIO_TOP_CON0,
+				   AUDIO_TOP_CON0_PDN_HDMI_CK |
+				   AUDIO_TOP_CON0_PDN_SPDIF_CK,
+				   AUDIO_TOP_CON0_PDN_HDMI_CK |
+				   AUDIO_TOP_CON0_PDN_SPDIF_CK);
+		return 0;
+	}
+	return -EINVAL;
+}
+
+static int mt2701_afe_hdmi_hw_free(struct snd_pcm_substream *substream,
+				   struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mt2701_afe_private *afe_priv = afe->platform_priv;
+
+	mt2701_afe_i2s_path_disable(afe,
+				    &afe_priv->i2s_path[MT2701_HDMI_I2S_PATH],
+				    SNDRV_PCM_STREAM_PLAYBACK);
+	return 0;
+}
+
+static const struct snd_soc_dai_ops mt2701_afe_hdmi_ops = {
+	.startup	= mt2701_afe_hdmi_startup,
+	.shutdown	= mt2701_afe_hdmi_shutdown,
+	.hw_params	= mt2701_afe_hdmi_hw_params,
+	.hw_free	= mt2701_afe_hdmi_hw_free,
+	.trigger	= mt2701_afe_hdmi_trigger,
+};
+
 static struct snd_soc_dai_driver mt2701_afe_pcm_dais[] = {
 	/* FE DAIs: memory intefaces to CPU */
 	{
@@ -628,6 +856,19 @@ static struct snd_soc_dai_driver mt2701_afe_pcm_dais[] = {
 		},
 		.ops = &mt2701_single_memif_dai_ops,
 	},
+	{
+		.name = "PCM_HDMI",
+		.id = MT2701_MEMIF_HDMI,
+		.playback = {
+			.stream_name = "HDMI Multich",
+			.channels_min = 2,
+			.channels_max = 8,
+			.rates = (SNDRV_PCM_RATE_44100 |
+				  SNDRV_PCM_RATE_48000),
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		},
+		.ops = &mt2701_single_memif_dai_ops,
+	},
 	/* BE DAIs */
 	{
 		.name = "I2S0",
@@ -748,7 +989,20 @@ static struct snd_soc_dai_driver mt2701_afe_pcm_dais[] = {
 		},
 		.ops = &mt2701_btmrg_ops,
 		.symmetric_rate = 1,
-	}
+	},
+	{
+		.name = "HDMI I2S",
+		.id = MT2701_IO_HDMI,
+		.playback = {
+			.stream_name = "HDMI 8CH I2S Playback",
+			.channels_min = 2,
+			.channels_max = 8,
+			.rates = (SNDRV_PCM_RATE_44100 |
+				  SNDRV_PCM_RATE_48000),
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		},
+		.ops = &mt2701_afe_hdmi_ops,
+	},
 };
 
 static const struct snd_kcontrol_new mt2701_afe_o00_mix[] = {
@@ -927,6 +1181,14 @@ static const struct snd_soc_dapm_route mt2701_afe_pcm_routes[] = {
 	{"I16I17", "Multich I2S2 Out Switch", "DLM"},
 	{"I18I19", "Multich I2S3 Out Switch", "DLM"},
 
+	/*
+	 * HDMI FE -> BE direct route. The HDMI memif has its own DMA
+	 * path that feeds the 8-channel internal I2S straight into the
+	 * HDMI transmitter; no mixer/interconnect selection is exposed
+	 * to the user.
+	 */
+	{"HDMI 8CH I2S Playback", NULL, "HDMI Multich"},
+
 	{ "I12", NULL, "I12I13" },
 	{ "I13", NULL, "I12I13" },
 	{ "I14", NULL, "I14I15" },
@@ -1207,6 +1469,35 @@ static const struct mtk_base_memif_data memif_data_array[MT2701_MEMIF_NUM] = {
 		.agent_disable_shift = 16,
 		.msb_reg = -1,
 	},
+	{
+		/*
+		 * HDMI memif feeds the on-SoC 8-channel internal I2S that
+		 * drives the HDMI transmitter audio port. Unlike the
+		 * standard memifs, the enable bit, channel count and bit
+		 * width all live in AFE_HDMI_OUT_CON0, so mono/fs/hd/agent
+		 * fields are left at -1 and programmed from the BE DAI ops
+		 * instead.
+		 */
+		.name = "HDMI",
+		.id = MT2701_MEMIF_HDMI,
+		.reg_ofs_base = AFE_HDMI_OUT_BASE,
+		.reg_ofs_cur = AFE_HDMI_OUT_CUR,
+		.reg_ofs_end = AFE_HDMI_OUT_END,
+		.fs_reg = -1,
+		.fs_shift = -1,
+		.fs_maskbit = 0,
+		.mono_reg = -1,
+		.mono_shift = -1,
+		.enable_reg = AFE_HDMI_OUT_CON0,
+		.enable_shift = 0,
+		.hd_reg = -1,
+		.hd_shift = -1,
+		.hd_align_reg = -1,
+		.hd_align_mshift = 0,
+		.agent_disable_reg = -1,
+		.agent_disable_shift = 0,
+		.msb_reg = -1,
+	},
 };
 
 static const struct mtk_base_irq_data irq_data[MT2701_IRQ_ASYS_END] = {
-- 
2.53.0
