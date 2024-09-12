Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FC819F11E
	for <linux-sound@vger.kernel.org>; Thu, 12 Sep 2024 12:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726142602; cv=none; b=Lo1vOCEGbSYQStbuyMVkTxNz2qxmAMYbl/92kifuO5RNsWrRdPKWO6LAoK77rEb50THzI1aNHHIchNaHwG1lU661Z3fTBvxgca7uuME9LfNHFjYj7Eoyh0wrTkj1ZyhryGKPBnQ5PmMT5rCpPln84HJuGjFhkm35R5AOSjTrpvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726142602; c=relaxed/simple;
	bh=z04rk308BNPTE0LiI1962pjzJABoDnmEOEeiOwbKf+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cr30zBDTPMAQc3+NCaByAH2jH2HVCgDiaIDl52vBI1uKd6AeKVEf6ViGJ6AwoGpBAVk60Gl4Df9OTe06RfAYvxIheL4BQUw43Ac9KwyQfjN3KyguZD6QVf+Kua0TyfDIZRE/JTJHAEF0NXBCiEJ041mnMu75f1+8vKPmeg7R1R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UcgKnPrs; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UcgKnPrs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726142601; x=1757678601;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z04rk308BNPTE0LiI1962pjzJABoDnmEOEeiOwbKf+c=;
  b=UcgKnPrsGfkAmqzi2uZw6j2bqR7tYAWZyr4pRo3ZtNwKJltEMW7U/YW4
   1zHnRE0uuRbpqMMAeqj7/lVKuGOs6CnnpHrbvywBD7ZpFIDsa/XZHVL/G
   FIX3sr5OwwlU98jG1g1CMm9wE/d8oq3+8lVuNjkC5wRcRVB+3vSe6XVKG
   6+4Up41Qx7hWDcVM3MSNgw4wvJ96s0OdpZnPPf5JI/3y7+qfi5FQB+WoP
   Hrm8/viNrrB7DoG9yTXuh6pYogXPUlvjBwpoUXGGV80uHQhPux8JNsWuC
   eURqIxYtzU5uDUJMaZ6SZ8Egfu/dzmUussPmyA3NTCHaneF+AqVctFvoZ
   A==;
X-CSE-ConnectionGUID: yMUDcX4DT2GwB/uNbOSOgw==
X-CSE-MsgGUID: Uy8SZudgTBGr/J0owGEAzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24812766"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; 
   d="scan'208";a="24812766"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 05:03:21 -0700
X-CSE-ConnectionGUID: eRfQ5NX0Rzya+FLVRp40rw==
X-CSE-MsgGUID: 93geCChVS1CBYA9gcj/3Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; 
   d="scan'208";a="68459152"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.119.14])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 05:03:19 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 1/7] ASoC: Intel: board_helpers: support HDA link initialization
Date: Thu, 12 Sep 2024 20:03:02 +0800
Message-ID: <20240912120308.134762-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240912120308.134762-1-yung-chuan.liao@linux.intel.com>
References: <20240912120308.134762-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Add a helper function for machine drivers to initialize HDA external
codec DAI link.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_board_helpers.c | 152 +++++++++++++++++++++
 sound/soc/intel/boards/sof_board_helpers.h |   3 +
 2 files changed, 155 insertions(+)

diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
index 7519c545cbe2..24f716e42d6a 100644
--- a/sound/soc/intel/boards/sof_board_helpers.c
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -70,6 +70,64 @@ static int dmic_init(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
+/*
+ * HDA External Codec DAI Link
+ */
+static const struct snd_soc_dapm_widget hda_widgets[] = {
+	SND_SOC_DAPM_MIC("Analog In", NULL),
+	SND_SOC_DAPM_MIC("Digital In", NULL),
+	SND_SOC_DAPM_MIC("Alt Analog In", NULL),
+
+	SND_SOC_DAPM_HP("Analog Out", NULL),
+	SND_SOC_DAPM_SPK("Digital Out", NULL),
+	SND_SOC_DAPM_HP("Alt Analog Out", NULL),
+};
+
+static const struct snd_soc_dapm_route hda_routes[] = {
+	{ "Codec Input Pin1", NULL, "Analog In" },
+	{ "Codec Input Pin2", NULL, "Digital In" },
+	{ "Codec Input Pin3", NULL, "Alt Analog In" },
+
+	{ "Analog Out", NULL, "Codec Output Pin1" },
+	{ "Digital Out", NULL, "Codec Output Pin2" },
+	{ "Alt Analog Out", NULL, "Codec Output Pin3" },
+
+	/* CODEC BE connections */
+	{ "codec0_in", NULL, "Analog CPU Capture" },
+	{ "Analog CPU Capture", NULL, "Analog Codec Capture" },
+	{ "codec1_in", NULL, "Digital CPU Capture" },
+	{ "Digital CPU Capture", NULL, "Digital Codec Capture" },
+	{ "codec2_in", NULL, "Alt Analog CPU Capture" },
+	{ "Alt Analog CPU Capture", NULL, "Alt Analog Codec Capture" },
+
+	{ "Analog Codec Playback", NULL, "Analog CPU Playback" },
+	{ "Analog CPU Playback", NULL, "codec0_out" },
+	{ "Digital Codec Playback", NULL, "Digital CPU Playback" },
+	{ "Digital CPU Playback", NULL, "codec1_out" },
+	{ "Alt Analog Codec Playback", NULL, "Alt Analog CPU Playback" },
+	{ "Alt Analog CPU Playback", NULL, "codec2_out" },
+};
+
+static int hda_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	int ret;
+
+	ret = snd_soc_dapm_new_controls(&card->dapm, hda_widgets,
+					ARRAY_SIZE(hda_widgets));
+	if (ret) {
+		dev_err(rtd->dev, "fail to add hda widgets, ret %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, hda_routes,
+				      ARRAY_SIZE(hda_routes));
+	if (ret)
+		dev_err(rtd->dev, "fail to add hda routes, ret %d\n", ret);
+
+	return ret;
+}
+
 /*
  * DAI Link Helpers
  */
@@ -79,6 +137,11 @@ enum sof_dmic_be_type {
 	SOF_DMIC_16K,
 };
 
+enum sof_hda_be_type {
+	SOF_HDA_ANALOG,
+	SOF_HDA_DIGITAL,
+};
+
 /* DEFAULT_LINK_ORDER: the order used in sof_rt5682 */
 #define DEFAULT_LINK_ORDER	SOF_LINK_ORDER(SOF_LINK_CODEC, \
 					SOF_LINK_DMIC01,       \
@@ -95,6 +158,16 @@ static struct snd_soc_dai_link_component dmic_component[] = {
 	}
 };
 
+SND_SOC_DAILINK_DEF(hda_analog_cpus,
+		    DAILINK_COMP_ARRAY(COMP_CPU("Analog CPU DAI")));
+SND_SOC_DAILINK_DEF(hda_analog_codecs,
+		    DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D0", "Analog Codec DAI")));
+
+SND_SOC_DAILINK_DEF(hda_digital_cpus,
+		    DAILINK_COMP_ARRAY(COMP_CPU("Digital CPU DAI")));
+SND_SOC_DAILINK_DEF(hda_digital_codecs,
+		    DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D0", "Digital Codec DAI")));
+
 static struct snd_soc_dai_link_component platform_component[] = {
 	{
 		/* name might be overridden during probe */
@@ -380,6 +453,55 @@ static int set_hdmi_in_link(struct device *dev, struct snd_soc_dai_link *link,
 	return 0;
 }
 
+static int set_hda_codec_link(struct device *dev, struct snd_soc_dai_link *link,
+			      int be_id, enum sof_hda_be_type be_type)
+{
+	switch (be_type) {
+	case SOF_HDA_ANALOG:
+		dev_dbg(dev, "link %d: hda analog\n", be_id);
+
+		link->name = "Analog Playback and Capture";
+
+		/* cpus */
+		link->cpus = hda_analog_cpus;
+		link->num_cpus = ARRAY_SIZE(hda_analog_cpus);
+
+		/* codecs */
+		link->codecs = hda_analog_codecs;
+		link->num_codecs = ARRAY_SIZE(hda_analog_codecs);
+		break;
+	case SOF_HDA_DIGITAL:
+		dev_dbg(dev, "link %d: hda digital\n", be_id);
+
+		link->name = "Digital Playback and Capture";
+
+		/* cpus */
+		link->cpus = hda_digital_cpus;
+		link->num_cpus = ARRAY_SIZE(hda_digital_cpus);
+
+		/* codecs */
+		link->codecs = hda_digital_codecs;
+		link->num_codecs = ARRAY_SIZE(hda_digital_codecs);
+		break;
+	default:
+		dev_err(dev, "invalid be type %d\n", be_type);
+		return -EINVAL;
+	}
+
+	/* platforms */
+	link->platforms = platform_component;
+	link->num_platforms = ARRAY_SIZE(platform_component);
+
+	link->id = be_id;
+	if (be_type == SOF_HDA_ANALOG)
+		link->init = hda_init;
+	link->no_pcm = 1;
+	link->dpcm_capture = 1;
+	link->dpcm_playback = 1;
+
+	return 0;
+}
+
 static int calculate_num_links(struct sof_card_private *ctx)
 {
 	int num_links = 0;
@@ -409,6 +531,10 @@ static int calculate_num_links(struct sof_card_private *ctx)
 	/* HDMI-In */
 	num_links += hweight32(ctx->ssp_mask_hdmi_in);
 
+	/* HDA external codec */
+	if (ctx->hda_codec_present)
+		num_links += 2;
+
 	return num_links;
 }
 
@@ -566,6 +692,32 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 				be_id++;
 			}
 			break;
+		case SOF_LINK_HDA:
+			/* HDA external codec */
+			if (!ctx->hda_codec_present)
+				continue;
+
+			ret = set_hda_codec_link(dev, &links[idx], be_id,
+						 SOF_HDA_ANALOG);
+			if (ret) {
+				dev_err(dev, "fail to set hda analog link, ret %d\n",
+					ret);
+				return ret;
+			}
+
+			idx++;
+			be_id++;
+
+			ret = set_hda_codec_link(dev, &links[idx], be_id,
+						 SOF_HDA_DIGITAL);
+			if (ret) {
+				dev_err(dev, "fail to set hda digital link, ret %d\n",
+					ret);
+				return ret;
+			}
+
+			idx++;
+			break;
 		case SOF_LINK_NONE:
 			/* caught here if it's not used as terminator in macro */
 			fallthrough;
diff --git a/sound/soc/intel/boards/sof_board_helpers.h b/sound/soc/intel/boards/sof_board_helpers.h
index faba847bb7c9..33a9601b770c 100644
--- a/sound/soc/intel/boards/sof_board_helpers.h
+++ b/sound/soc/intel/boards/sof_board_helpers.h
@@ -57,6 +57,7 @@ enum {
 	SOF_LINK_AMP,
 	SOF_LINK_BT_OFFLOAD,
 	SOF_LINK_HDMI_IN,
+	SOF_LINK_HDA,
 };
 
 #define SOF_LINK_ORDER_MASK	(0xF)
@@ -121,6 +122,7 @@ struct sof_rt5682_private {
  * @ssp_bt: ssp port number of BT offload BE link
  * @ssp_mask_hdmi_in: ssp port mask of HDMI-IN BE link
  * @bt_offload_present: true to create BT offload BE link
+ * @hda_codec_present: true to create HDA codec BE links
  * @codec_link: pointer to headset codec dai link
  * @amp_link: pointer to speaker amplifier dai link
  * @link_order_overwrite: custom DAI link order
@@ -144,6 +146,7 @@ struct sof_card_private {
 	unsigned long ssp_mask_hdmi_in;
 
 	bool bt_offload_present;
+	bool hda_codec_present;
 
 	struct snd_soc_dai_link *codec_link;
 	struct snd_soc_dai_link *amp_link;
-- 
2.43.0

