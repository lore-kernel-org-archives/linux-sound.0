Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OH6gL8bt"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D45F138
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 07:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099325; x=1732635325;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CsgVmzy10sUA4+sS8qVpp0cu3BZcQFs0eIDUOpL+pfs=;
  b=OH6gL8btDDE/4Avr9isIZTm6QLzBLRmmI1m588jWQ+s8cVx8++r0ewj+
   LhooCDqhxORqw1loCJEjv92ROrad/QbL30G9T/OSgkFrZLL+tdqLklrjy
   OBg0BGTOXtW/TbdOuyrCFhYHq9LN66hExawBh4gE3tx3Hcj9/VxLwK5lM
   yhOYw5e91KOHXM9BcUFCBe7CkzHCj7qJUR33526i+aIfWqahG3OYmRgWQ
   o+od7za4DBhAF7EEin1/FzkJg79h50/3JBWs0DJxo3uJiznmrjcKe/HBo
   11Mz6HZt9sYfGIP9ItuLT7v2Uv6aP1oKZjr3o1KyhVP+5Y94spQMCjTCH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894478"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="372894478"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:26:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771956586"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="771956586"
Received: from acornagl-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:26:47 -0800
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
Subject: [PATCH 10/27] ASoC: Intel: board_helpers: support amp link initialization
Date: Mon, 27 Nov 2023 17:26:37 +0200
Message-ID: <20231127152654.28204-11-peter.ujfalusi@linux.intel.com>
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

Add a helper function for machine drivers to initialize speaker
amplifier DAI link. The function will initialize common fields and let
caller to initialize codec-specific fields like codec, init, exit, and
ops fields.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_board_helpers.c | 42 ++++++++++++++++++++++
 sound/soc/intel/boards/sof_board_helpers.h |  5 +++
 2 files changed, 47 insertions(+)

diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
index 5ee53c781b37..515634db0a4d 100644
--- a/sound/soc/intel/boards/sof_board_helpers.c
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -248,6 +248,48 @@ int sof_intel_board_set_intel_hdmi_link(struct device *dev,
 }
 EXPORT_SYMBOL_NS(sof_intel_board_set_intel_hdmi_link, SND_SOC_INTEL_SOF_BOARD_HELPERS);
 
+int sof_intel_board_set_ssp_amp_link(struct device *dev,
+				     struct snd_soc_dai_link *link, int be_id,
+				     enum sof_ssp_codec amp_type, int ssp_amp)
+{
+	struct snd_soc_dai_link_component *cpus;
+
+	dev_dbg(dev, "link %d: ssp amp %s, ssp %d\n", be_id,
+		sof_ssp_get_codec_name(amp_type), ssp_amp);
+
+	/* link name */
+	link->name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec", ssp_amp);
+	if (!link->name)
+		return -ENOMEM;
+
+	/* cpus */
+	cpus = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link_component),
+			    GFP_KERNEL);
+	if (!cpus)
+		return -ENOMEM;
+
+	cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", ssp_amp);
+	if (!cpus->dai_name)
+		return -ENOMEM;
+
+	link->cpus = cpus;
+	link->num_cpus = 1;
+
+	/* codecs - caller to handle */
+
+	/* platforms */
+	link->platforms = platform_component;
+	link->num_platforms = ARRAY_SIZE(platform_component);
+
+	link->id = be_id;
+	link->no_pcm = 1;
+	link->dpcm_capture = 1; /* feedback stream or firmware-generated echo reference */
+	link->dpcm_playback = 1;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sof_intel_board_set_ssp_amp_link, SND_SOC_INTEL_SOF_BOARD_HELPERS);
+
 MODULE_DESCRIPTION("ASoC Intel SOF Machine Driver Board Helpers");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/boards/sof_board_helpers.h b/sound/soc/intel/boards/sof_board_helpers.h
index 7392d639672d..17922f3e17a5 100644
--- a/sound/soc/intel/boards/sof_board_helpers.h
+++ b/sound/soc/intel/boards/sof_board_helpers.h
@@ -31,6 +31,7 @@ struct sof_rt5682_private {
  * @dmic_be_num: number of Intel PCH DMIC BE link
  * @hdmi_num: number of Intel HDMI BE link
  * @ssp_codec: ssp port number of headphone BE link
+ * @ssp_amp: ssp port number of speaker BE link
  * @rt5682: private data for rt5682 machine driver
  */
 struct sof_card_private {
@@ -44,6 +45,7 @@ struct sof_card_private {
 	int hdmi_num;
 
 	int ssp_codec;
+	int ssp_amp;
 
 	union {
 		struct sof_rt5682_private rt5682;
@@ -66,5 +68,8 @@ int sof_intel_board_set_dmic_link(struct device *dev,
 int sof_intel_board_set_intel_hdmi_link(struct device *dev,
 					struct snd_soc_dai_link *link, int be_id,
 					int hdmi_id, bool idisp_codec);
+int sof_intel_board_set_ssp_amp_link(struct device *dev,
+				     struct snd_soc_dai_link *link, int be_id,
+				     enum sof_ssp_codec amp_type, int ssp_amp);
 
 #endif /* __SOF_INTEL_BOARD_HELPERS_H */
-- 
2.43.0

