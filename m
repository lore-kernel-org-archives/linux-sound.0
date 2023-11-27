Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KHUjsXyZ"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3114191
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 07:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099335; x=1732635335;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XBafYApF575mHRlnm2NvKYMhKgk9gGsTHnetRd1yj3c=;
  b=KHUjsXyZ8p/4f7moEzNbryXuJ9nppYq0XShgLSQmtvs86HA/dLM+fUv1
   2REd2GQ6o6hMAXI87OH0BbSJGqMXb9Hf/BcoWO00UPkSvGpsC8KYI71hz
   7kzFPBVUvKiIt0fcNm7FQC4Aoqn0zmngNmJJsAUSZlDohfS222MyyEA8D
   P4NuxHf65R7y/wF5Llvtesuk8n8WU1NhO1dAI39uR+P3sROS2eqz1+wYs
   1xVWa1dBYkh9B32hHZ5LdYgxZolYa48eV6SVRjBTPmVRZm3hDH7hVQsHy
   4zFkeXBSozQYoHUNaqAHrzRYiJnMjPv2pR28RnVM8TjJyPsLgqiy3eY0B
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894569"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="372894569"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:27:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771956833"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="771956833"
Received: from acornagl-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:27:03 -0800
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
Subject: [PATCH 16/27] ASoC: Intel: board_helpers: support BT offload link initialization
Date: Mon, 27 Nov 2023 17:26:43 +0200
Message-ID: <20231127152654.28204-17-peter.ujfalusi@linux.intel.com>
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

Add a helper function for machine drivers to initialize BT offload
DAI link.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_board_helpers.c | 43 ++++++++++++++++++++++
 sound/soc/intel/boards/sof_board_helpers.h |  8 ++++
 2 files changed, 51 insertions(+)

diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
index 515634db0a4d..335c660561d5 100644
--- a/sound/soc/intel/boards/sof_board_helpers.c
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -290,6 +290,49 @@ int sof_intel_board_set_ssp_amp_link(struct device *dev,
 }
 EXPORT_SYMBOL_NS(sof_intel_board_set_ssp_amp_link, SND_SOC_INTEL_SOF_BOARD_HELPERS);
 
+int sof_intel_board_set_bt_link(struct device *dev,
+				struct snd_soc_dai_link *link, int be_id,
+				int ssp_bt)
+{
+	struct snd_soc_dai_link_component *cpus;
+
+	dev_dbg(dev, "link %d: bt offload, ssp %d\n", be_id, ssp_bt);
+
+	/* link name */
+	link->name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-BT", ssp_bt);
+	if (!link->name)
+		return -ENOMEM;
+
+	/* cpus */
+	cpus = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link_component),
+			    GFP_KERNEL);
+	if (!cpus)
+		return -ENOMEM;
+
+	cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", ssp_bt);
+	if (!cpus->dai_name)
+		return -ENOMEM;
+
+	link->cpus = cpus;
+	link->num_cpus = 1;
+
+	/* codecs */
+	link->codecs = &snd_soc_dummy_dlc;
+	link->num_codecs = 1;
+
+	/* platforms */
+	link->platforms = platform_component;
+	link->num_platforms = ARRAY_SIZE(platform_component);
+
+	link->id = be_id;
+	link->no_pcm = 1;
+	link->dpcm_capture = 1;
+	link->dpcm_playback = 1;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sof_intel_board_set_bt_link, SND_SOC_INTEL_SOF_BOARD_HELPERS);
+
 MODULE_DESCRIPTION("ASoC Intel SOF Machine Driver Board Helpers");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/boards/sof_board_helpers.h b/sound/soc/intel/boards/sof_board_helpers.h
index 17922f3e17a5..49a7bfa12a6d 100644
--- a/sound/soc/intel/boards/sof_board_helpers.h
+++ b/sound/soc/intel/boards/sof_board_helpers.h
@@ -32,6 +32,8 @@ struct sof_rt5682_private {
  * @hdmi_num: number of Intel HDMI BE link
  * @ssp_codec: ssp port number of headphone BE link
  * @ssp_amp: ssp port number of speaker BE link
+ * @ssp_bt: ssp port number of BT offload BE link
+ * @bt_offload_present: true to create BT offload BE link
  * @rt5682: private data for rt5682 machine driver
  */
 struct sof_card_private {
@@ -46,6 +48,9 @@ struct sof_card_private {
 
 	int ssp_codec;
 	int ssp_amp;
+	int ssp_bt;
+
+	bool bt_offload_present;
 
 	union {
 		struct sof_rt5682_private rt5682;
@@ -71,5 +76,8 @@ int sof_intel_board_set_intel_hdmi_link(struct device *dev,
 int sof_intel_board_set_ssp_amp_link(struct device *dev,
 				     struct snd_soc_dai_link *link, int be_id,
 				     enum sof_ssp_codec amp_type, int ssp_amp);
+int sof_intel_board_set_bt_link(struct device *dev,
+				struct snd_soc_dai_link *link, int be_id,
+				int ssp_bt);
 
 #endif /* __SOF_INTEL_BOARD_HELPERS_H */
-- 
2.43.0

