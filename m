Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nj7Qbtao"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87C09B6
	for <linux-sound@vger.kernel.org>; Fri, 24 Nov 2023 04:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700829601; x=1732365601;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=woKsYxqA2S88S98VVn5QxVC44in9IgDwqXqe0NroGIs=;
  b=nj7Qbtao63jZXOfp0FJRGrjQKiQ7V4kwJg5YOrH2qCQI2+mIvua1wht4
   Ito77cpN5D5VjwAimG8vet9Sv2cEmukclvmhchRgjQ+BKhaV2uWlupLrZ
   Jakmqte6omQfQ3GGkUw+9QIvCAIbSgGrXan0mKaxCx0idOW6acR+Xu+tx
   og4a9BiKSp1t3Ouf6FG73vx20mz6van2PH8GUTK7O4s7LNHugm5v55dU5
   95dXH28cLnFNCLU0JUhcVH603VREjkb7s56KpWcXDXnCH8+JLVHaEDSDZ
   hbefDGTZLpnTcaABO329dZXhqT4RkncJ3sMRziuVMxnlDtwfhcEk9B5Af
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="5572887"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="5572887"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 04:40:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="885268815"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="885268815"
Received: from barumuga-mobl1.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.182])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 04:39:58 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	cezary.rojewski@intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH] ASoC: Intel: sof_sdw: Always register the HDMI dai links
Date: Fri, 24 Nov 2023 14:40:32 +0200
Message-ID: <20231124124032.15946-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The topology files for SDW devices require HDMI dai links to be present and
this is granted under normal conditions but in case of special use cases
the display (i915) driver might not be enabled due to deny-listing,
booting with nomodeset or just not compiled at all.

This should not block the non HDMI audio to be usable so register the dai
links unconditionally. The code has been prepared for this and in case of
no HDMI audio the link is created with dummy codec.

Closes: https://github.com/thesofproject/linux/issues/4594
Closes: https://github.com/thesofproject/linux/issues/4648
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 3312ad8a563b..4e4284729773 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1546,7 +1546,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 {
 	struct device *dev = card->dev;
 	struct snd_soc_acpi_mach *mach = dev_get_platdata(card->dev);
-	int sdw_be_num = 0, ssp_num = 0, dmic_num = 0, hdmi_num = 0, bt_num = 0;
+	int sdw_be_num = 0, ssp_num = 0, dmic_num = 0, bt_num = 0;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
 	const struct snd_soc_acpi_link_adr *adr_link = mach_params->links;
@@ -1564,6 +1564,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	char *codec_name, *codec_dai_name;
 	int i, j, be_id = 0;
 	int codec_index;
+	int hdmi_num;
 	int ret;
 
 	ret = get_dailink_info(dev, adr_link, &sdw_be_num, &codec_conf_num);
@@ -1584,14 +1585,13 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		ssp_num = hweight_long(ssp_mask);
 	}
 
-	if (mach_params->codec_mask & IDISP_CODEC_MASK) {
+	if (mach_params->codec_mask & IDISP_CODEC_MASK)
 		ctx->hdmi.idisp_codec = true;
 
-		if (sof_sdw_quirk & SOF_SDW_TGL_HDMI)
-			hdmi_num = SOF_TGL_HDMI_COUNT;
-		else
-			hdmi_num = SOF_PRE_TGL_HDMI_COUNT;
-	}
+	if (sof_sdw_quirk & SOF_SDW_TGL_HDMI)
+		hdmi_num = SOF_TGL_HDMI_COUNT;
+	else
+		hdmi_num = SOF_PRE_TGL_HDMI_COUNT;
 
 	/* enable dmic01 & dmic16k */
 	if (sof_sdw_quirk & SOF_SDW_PCH_DMIC || mach_params->dmic_num)
@@ -1601,7 +1601,8 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		bt_num = 1;
 
 	dev_dbg(dev, "sdw %d, ssp %d, dmic %d, hdmi %d, bt: %d\n",
-		sdw_be_num, ssp_num, dmic_num, hdmi_num, bt_num);
+		sdw_be_num, ssp_num, dmic_num,
+		ctx->hdmi.idisp_codec ? hdmi_num : 0, bt_num);
 
 	/* allocate BE dailinks */
 	num_links = sdw_be_num + ssp_num + dmic_num + hdmi_num + bt_num;
-- 
2.42.1

