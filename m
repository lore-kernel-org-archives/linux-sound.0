Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KES/qGlK"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 681DD189
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 07:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099345; x=1732635345;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a83TGR9cxwTYFUmliBUOyFb+HW5wdDEx/eSq53BFAXM=;
  b=KES/qGlKO/m59uHUooK/RVvImALoDHKUOXtsNbD3taizt0XHQnCchO2U
   hpY5VlS6RoSE1ySXJ37ZXijqoH7SJlx+LvpG5e4jiV3fgCDAMtD/fEWO2
   9ZMkdxbd4yRLTaqnnX4cGEIkWXw46QjZCmFjhkrN5RaxjWBSlciR2JRsR
   WCTT6nPvC3h4qqv6A/SiK9AHlVi8CMXx5mwlt7QS+IUbw5EaYyZc2n6LF
   kV63WwL/HlEda+uS8J8oNM6+A5IwzKQvKCj07Q+YgdDz+QMTDAvRdjfE0
   DBDRpV6dXXqGEzsu6w8BkvTmfJFwN+AABfjmVRvW7p79M7PzV8w9Lw9V7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894642"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="372894642"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:27:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771957083"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="771957083"
Received: from acornagl-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:27:20 -0800
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
Subject: [PATCH 22/27] ASoC: Intel: board_helpers: support HDMI-In link initialization
Date: Mon, 27 Nov 2023 17:26:49 +0200
Message-ID: <20231127152654.28204-23-peter.ujfalusi@linux.intel.com>
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

Add a helper function for machine drivers to initialize HDMI-In DAI
link.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Balamurugan C <balamurugan.c@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_board_helpers.c | 42 ++++++++++++++++++++++
 sound/soc/intel/boards/sof_board_helpers.h |  5 +++
 2 files changed, 47 insertions(+)

diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
index 335c660561d5..a1dba1f45669 100644
--- a/sound/soc/intel/boards/sof_board_helpers.c
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -333,6 +333,48 @@ int sof_intel_board_set_bt_link(struct device *dev,
 }
 EXPORT_SYMBOL_NS(sof_intel_board_set_bt_link, SND_SOC_INTEL_SOF_BOARD_HELPERS);
 
+int sof_intel_board_set_hdmi_in_link(struct device *dev,
+				     struct snd_soc_dai_link *link, int be_id,
+				     int ssp_hdmi)
+{
+	struct snd_soc_dai_link_component *cpus;
+
+	dev_dbg(dev, "link %d: hdmi-in, ssp %d\n", be_id, ssp_hdmi);
+
+	/* link name */
+	link->name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-HDMI", ssp_hdmi);
+	if (!link->name)
+		return -ENOMEM;
+
+	/* cpus */
+	cpus = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link_component),
+			    GFP_KERNEL);
+	if (!cpus)
+		return -ENOMEM;
+
+	cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", ssp_hdmi);
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
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sof_intel_board_set_hdmi_in_link, SND_SOC_INTEL_SOF_BOARD_HELPERS);
+
 MODULE_DESCRIPTION("ASoC Intel SOF Machine Driver Board Helpers");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/boards/sof_board_helpers.h b/sound/soc/intel/boards/sof_board_helpers.h
index 49a7bfa12a6d..a4bae62a4ed5 100644
--- a/sound/soc/intel/boards/sof_board_helpers.h
+++ b/sound/soc/intel/boards/sof_board_helpers.h
@@ -33,6 +33,7 @@ struct sof_rt5682_private {
  * @ssp_codec: ssp port number of headphone BE link
  * @ssp_amp: ssp port number of speaker BE link
  * @ssp_bt: ssp port number of BT offload BE link
+ * @ssp_mask_hdmi_in: ssp port mask of HDMI-IN BE link
  * @bt_offload_present: true to create BT offload BE link
  * @rt5682: private data for rt5682 machine driver
  */
@@ -49,6 +50,7 @@ struct sof_card_private {
 	int ssp_codec;
 	int ssp_amp;
 	int ssp_bt;
+	unsigned long ssp_mask_hdmi_in;
 
 	bool bt_offload_present;
 
@@ -79,5 +81,8 @@ int sof_intel_board_set_ssp_amp_link(struct device *dev,
 int sof_intel_board_set_bt_link(struct device *dev,
 				struct snd_soc_dai_link *link, int be_id,
 				int ssp_bt);
+int sof_intel_board_set_hdmi_in_link(struct device *dev,
+				     struct snd_soc_dai_link *link, int be_id,
+				     int ssp_hdmi);
 
 #endif /* __SOF_INTEL_BOARD_HELPERS_H */
-- 
2.43.0

