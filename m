Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XZLMonpS"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DCCC189
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 07:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099353; x=1732635353;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HE4YdHJUUr5kqie7rfrMQNTQ7y8MzwqS7lqJ12LLsFo=;
  b=XZLMonpShriId9pz432ghLmzaCdJ7FKDjg8pqrL/kNsDmZRwTAu2moMT
   DGNSa93WvENaexj0YjrHHrTg6AR/jvQGj6AdxTQOl7cz4Bb3JXxAvS7xI
   LSNLLfS4zcP6b5ICvnIM8kyiCxvCSdgQhJAAkvxZ3O0WcTmpdpxUa/Wp7
   qhEozYiiT71TR8iWx/BisrVx+k3IBLydcml8xf9H2QySc9DBQQ0AniQO0
   0sP3mwiMnAE/D0KZWEHc8VcznWvmajskEiGAPmTqNOxoQz+Ixi6aP32dQ
   EJlrlNQ2kOQOiTl/jKhAZJvz8ryT7xLDwhMjghn9V88EdDqtkjPJQr6bT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894674"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="372894674"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:27:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771957169"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="771957169"
Received: from acornagl-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:27:28 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	chao.song@linux.intel.com
Subject: [PATCH 25/27] ASoC: Intel: board_helpers: support DAI link array generation
Date: Mon, 27 Nov 2023 17:26:52 +0200
Message-ID: <20231127152654.28204-26-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
References: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Add a helper function for machine drivers to initialize dai_link and
num_links of a snd_soc_card structure. Machine driver needs to
initialize sof_card_private structure in driver probe function then
board_helpers module will create entire DAI link array for this board.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_board_helpers.c | 152 +++++++++++++++++++++
 sound/soc/intel/boards/sof_board_helpers.h |   7 +
 2 files changed, 159 insertions(+)

diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
index a1dba1f45669..4f2cb8e52971 100644
--- a/sound/soc/intel/boards/sof_board_helpers.c
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -375,6 +375,158 @@ int sof_intel_board_set_hdmi_in_link(struct device *dev,
 }
 EXPORT_SYMBOL_NS(sof_intel_board_set_hdmi_in_link, SND_SOC_INTEL_SOF_BOARD_HELPERS);
 
+static int calculate_num_links(struct sof_card_private *ctx)
+{
+	int num_links = 0;
+
+	/* headphone codec */
+	if (ctx->codec_type != CODEC_NONE)
+		num_links++;
+
+	/* dmic01 and dmic16k */
+	if (ctx->dmic_be_num > 0)
+		num_links++;
+
+	if (ctx->dmic_be_num > 1)
+		num_links++;
+
+	/* idisp HDMI */
+	num_links += ctx->hdmi_num;
+
+	/* speaker amp */
+	if (ctx->amp_type != CODEC_NONE)
+		num_links++;
+
+	/* BT audio offload */
+	if (ctx->bt_offload_present)
+		num_links++;
+
+	/* HDMI-In */
+	num_links += hweight32(ctx->ssp_mask_hdmi_in);
+
+	return num_links;
+}
+
+int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
+				 struct sof_card_private *ctx)
+{
+	struct snd_soc_dai_link *links;
+	int num_links;
+	int i;
+	int idx = 0;
+	int ret;
+	int ssp_hdmi_in = 0;
+
+	num_links = calculate_num_links(ctx);
+
+	links = devm_kcalloc(dev, num_links, sizeof(struct snd_soc_dai_link),
+			     GFP_KERNEL);
+	if (!links)
+		return -ENOMEM;
+
+	/* headphone codec */
+	if (ctx->codec_type != CODEC_NONE) {
+		ret = sof_intel_board_set_codec_link(dev, &links[idx], idx,
+						     ctx->codec_type,
+						     ctx->ssp_codec);
+		if (ret) {
+			dev_err(dev, "fail to set codec link, ret %d\n", ret);
+			return ret;
+		}
+
+		ctx->codec_link = &links[idx];
+		idx++;
+	}
+
+	/* dmic01 and dmic16k */
+	if (ctx->dmic_be_num > 0) {
+		/* at least we have dmic01 */
+		ret = sof_intel_board_set_dmic_link(dev, &links[idx], idx,
+						    SOF_DMIC_01);
+		if (ret) {
+			dev_err(dev, "fail to set dmic01 link, ret %d\n", ret);
+			return ret;
+		}
+
+		idx++;
+	}
+
+	if (ctx->dmic_be_num > 1) {
+		/* set up 2 BE links at most */
+		ret = sof_intel_board_set_dmic_link(dev, &links[idx], idx,
+						    SOF_DMIC_16K);
+		if (ret) {
+			dev_err(dev, "fail to set dmic16k link, ret %d\n", ret);
+			return ret;
+		}
+
+		idx++;
+	}
+
+	/* idisp HDMI */
+	for (i = 1; i <= ctx->hdmi_num; i++) {
+		ret = sof_intel_board_set_intel_hdmi_link(dev, &links[idx], idx,
+							  i,
+							  ctx->hdmi.idisp_codec);
+		if (ret) {
+			dev_err(dev, "fail to set hdmi link, ret %d\n", ret);
+			return ret;
+		}
+
+		idx++;
+	}
+
+	/* speaker amp */
+	if (ctx->amp_type != CODEC_NONE) {
+		ret = sof_intel_board_set_ssp_amp_link(dev, &links[idx], idx,
+						       ctx->amp_type,
+						       ctx->ssp_amp);
+		if (ret) {
+			dev_err(dev, "fail to set amp link, ret %d\n", ret);
+			return ret;
+		}
+
+		ctx->amp_link = &links[idx];
+		idx++;
+	}
+
+	/* BT audio offload */
+	if (ctx->bt_offload_present) {
+		ret = sof_intel_board_set_bt_link(dev, &links[idx], idx,
+						  ctx->ssp_bt);
+		if (ret) {
+			dev_err(dev, "fail to set bt link, ret %d\n", ret);
+			return ret;
+		}
+
+		idx++;
+	}
+
+	/* HDMI-In */
+	for_each_set_bit(ssp_hdmi_in, &ctx->ssp_mask_hdmi_in, 32) {
+		ret = sof_intel_board_set_hdmi_in_link(dev, &links[idx], idx,
+						       ssp_hdmi_in);
+		if (ret) {
+			dev_err(dev, "fail to set hdmi-in link, ret %d\n", ret);
+			return ret;
+		}
+
+		idx++;
+	}
+
+	if (idx != num_links) {
+		dev_err(dev, "link number mismatch, idx %d, num_links %d\n", idx,
+			num_links);
+		return -EINVAL;
+	}
+
+	card->dai_link = links;
+	card->num_links = num_links;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sof_intel_board_set_dai_link, SND_SOC_INTEL_SOF_BOARD_HELPERS);
+
 MODULE_DESCRIPTION("ASoC Intel SOF Machine Driver Board Helpers");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/boards/sof_board_helpers.h b/sound/soc/intel/boards/sof_board_helpers.h
index a4bae62a4ed5..3b36058118ca 100644
--- a/sound/soc/intel/boards/sof_board_helpers.h
+++ b/sound/soc/intel/boards/sof_board_helpers.h
@@ -35,6 +35,8 @@ struct sof_rt5682_private {
  * @ssp_bt: ssp port number of BT offload BE link
  * @ssp_mask_hdmi_in: ssp port mask of HDMI-IN BE link
  * @bt_offload_present: true to create BT offload BE link
+ * @codec_link: pointer to headset codec dai link
+ * @amp_link: pointer to speaker amplifier dai link
  * @rt5682: private data for rt5682 machine driver
  */
 struct sof_card_private {
@@ -54,6 +56,9 @@ struct sof_card_private {
 
 	bool bt_offload_present;
 
+	struct snd_soc_dai_link *codec_link;
+	struct snd_soc_dai_link *amp_link;
+
 	union {
 		struct sof_rt5682_private rt5682;
 	};
@@ -65,6 +70,8 @@ enum sof_dmic_be_type {
 };
 
 int sof_intel_board_card_late_probe(struct snd_soc_card *card);
+int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
+				 struct sof_card_private *ctx);
 
 int sof_intel_board_set_codec_link(struct device *dev,
 				   struct snd_soc_dai_link *link, int be_id,
-- 
2.43.0

