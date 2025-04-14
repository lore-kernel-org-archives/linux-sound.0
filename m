Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2131A76D4
	for <linux-sound@vger.kernel.org>; Mon, 14 Apr 2025 06:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744612423; cv=none; b=Fpncia43PeRy5EtTsXVuT5EI+4gXZOTrqH2g/NMpm6blCu3CkZT94s69afdYxXT5zWBqYHdpuxXGNUDInmGR2D+rfEmNaGWi3NAFWEsHOYO62thsUTLBmByqenejQSnwkE53n+zVFw/aCKAK8w9Hy2zcH4QiwcJVFevWIaCPz1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744612423; c=relaxed/simple;
	bh=RxeE0M5yOtCwPGDCbPhS0aueIm3+ZMVBg5s9hCl+U6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S3AKnlUvy2SD72ZIaRoFN3bN3hCKYAVKcLMO7uQzkIYyF4aLwhqRl2XgRUHNp6oN6VyPY0fTV249mgAt+RS0mmxHz/Tdz/y9nyH2sKZZb/05xairwRp3MRgLDgmgSSDqFXP5c0R40TZ/bKgNWo83FQZFij6fGcqG8Ob5/uGEFBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YRJpQzVC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YRJpQzVC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744612422; x=1776148422;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RxeE0M5yOtCwPGDCbPhS0aueIm3+ZMVBg5s9hCl+U6E=;
  b=YRJpQzVCoLCScV9zazLIpEqcsNPUHnO3+aJ1f1pwNpCqIZNV/U7es46s
   YJ4JVXCvghbrYWjNIgEYITEILTn6mjKIyCNiZuVmXQzxlatwNTjxHZrwF
   zRKeVV9OTUf9ZLdIfgtgif1Q9sVr7fblMpSZstB0s1FSx71YPe2tTO2EM
   3xddQ92I78LtIaI/bGMS16mznIWYWYkf6nG75cuB5rYGGyse6JeywReeG
   Fi2mfKHOpSFbZmQMRMI+5HogeNjFz0P7uVSTnf+f+24LLkmJda/hu69jN
   flfSyTAD71Guq/pLurLpWEuT4ZDUXjXHaOpyGGEyPiuiSRa4wzCo9ZXgX
   Q==;
X-CSE-ConnectionGUID: SOwOwnR1Tb2lPnWvL99mog==
X-CSE-MsgGUID: ZKdJvc+MTxCfoVUiy121vA==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="49872673"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="49872673"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 23:33:41 -0700
X-CSE-ConnectionGUID: JPHVh+CESViDwRy2jbvZgg==
X-CSE-MsgGUID: 9f1GqLzEQUmBGkRw2hfARg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="130275341"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.73])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 23:33:41 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 11/11] ASoC: soc_sdw_utils: skip the endpoint that doesn't present
Date: Mon, 14 Apr 2025 14:32:39 +0800
Message-ID: <20250414063239.85200-12-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250414063239.85200-1-yung-chuan.liao@linux.intel.com>
References: <20250414063239.85200-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A codec endpoint may not be used. We could check the present SDCA
functions to know if the endpoint is used or not. Skip the endpoint
which is not used.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 137 +++++++++++++++++++++++++++-
 1 file changed, 134 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 4c5ce01eae5b..60b731673f3b 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_type.h>
+#include <sound/sdca_function.h>
 #include <sound/soc_sdw_utils.h>
 
 static const struct snd_soc_dapm_widget generic_dmic_widgets[] = {
@@ -1131,6 +1132,106 @@ struct asoc_sdw_dailink *asoc_sdw_find_dailink(struct asoc_sdw_dailink *dailinks
 }
 EXPORT_SYMBOL_NS(asoc_sdw_find_dailink, "SND_SOC_SDW_UTILS");
 
+static int asoc_sdw_get_dai_type(u32 type)
+{
+	switch (type) {
+	case SDCA_FUNCTION_TYPE_SMART_AMP:
+	case SDCA_FUNCTION_TYPE_SIMPLE_AMP:
+		return SOC_SDW_DAI_TYPE_AMP;
+	case SDCA_FUNCTION_TYPE_SMART_MIC:
+	case SDCA_FUNCTION_TYPE_SIMPLE_MIC:
+	case SDCA_FUNCTION_TYPE_SPEAKER_MIC:
+		return SOC_SDW_DAI_TYPE_MIC;
+	case SDCA_FUNCTION_TYPE_UAJ:
+	case SDCA_FUNCTION_TYPE_RJ:
+	case SDCA_FUNCTION_TYPE_SIMPLE_JACK:
+		return SOC_SDW_DAI_TYPE_JACK;
+	default:
+		return -EINVAL;
+	}
+}
+
+/*
+ * Check if the SDCA endpoint is present by the SDW peripheral
+ *
+ * @dev: Device pointer
+ * @codec_info: Codec info pointer
+ * @adr_link: ACPI link address
+ * @adr_index: Index of the ACPI link address
+ * @end_index: Index of the endpoint
+ *
+ * Return: 1 if the endpoint is present,
+ *	   0 if the endpoint is not present,
+ *	   negative error code.
+ */
+
+static int is_sdca_endpoint_present(struct device *dev,
+				    struct asoc_sdw_codec_info *codec_info,
+				    const struct snd_soc_acpi_link_adr *adr_link,
+				    int adr_index, int end_index)
+{
+	const struct snd_soc_acpi_adr_device *adr_dev = &adr_link->adr_d[adr_index];
+	const struct snd_soc_acpi_endpoint *adr_end;
+	const struct asoc_sdw_dai_info *dai_info;
+	struct snd_soc_dai_link_component *dlc;
+	struct snd_soc_dai *codec_dai;
+	struct sdw_slave *slave;
+	struct device *sdw_dev;
+	const char *sdw_codec_name;
+	int i;
+
+	dlc = kzalloc(sizeof(*dlc), GFP_KERNEL);
+
+	adr_end = &adr_dev->endpoints[end_index];
+	dai_info = &codec_info->dais[adr_end->num];
+
+	dlc->dai_name = dai_info->dai_name;
+	codec_dai = snd_soc_find_dai_with_mutex(dlc);
+	if (!codec_dai) {
+		dev_warn(dev, "codec dai %s not registered yet\n", dlc->dai_name);
+		kfree(dlc);
+		return -EPROBE_DEFER;
+	}
+	kfree(dlc);
+
+	sdw_codec_name = _asoc_sdw_get_codec_name(dev, codec_info,
+						  adr_link, adr_index);
+	if (!sdw_codec_name)
+		return -ENOMEM;
+
+	sdw_dev = bus_find_device_by_name(&sdw_bus_type, NULL, sdw_codec_name);
+	if (!sdw_dev) {
+		dev_err(dev, "codec %s not found\n", sdw_codec_name);
+		return -EINVAL;
+	}
+
+	slave = dev_to_sdw_dev(sdw_dev);
+	if (!slave)
+		return -EINVAL;
+
+	/* Make sure BIOS provides SDCA properties */
+	if (!slave->sdca_data.interface_revision) {
+		dev_warn(&slave->dev, "SDCA properties not found in the BIOS\n");
+		return 1;
+	}
+
+	for (i = 0; i < slave->sdca_data.num_functions; i++) {
+		int dai_type = asoc_sdw_get_dai_type(slave->sdca_data.function[i].type);
+
+		if (dai_type == dai_info->dai_type) {
+			dev_dbg(&slave->dev, "DAI type %d sdca function %s found\n",
+				dai_type, slave->sdca_data.function[i].name);
+			return 1;
+		}
+	}
+
+	dev_dbg(&slave->dev,
+		"SDCA device function for DAI type %d not supported, skip endpoint\n",
+		dai_info->dai_type);
+
+	return 0;
+}
+
 int asoc_sdw_parse_sdw_endpoints(struct snd_soc_card *card,
 				 struct asoc_sdw_dailink *soc_dais,
 				 struct asoc_sdw_endpoint *soc_ends,
@@ -1159,6 +1260,7 @@ int asoc_sdw_parse_sdw_endpoints(struct snd_soc_card *card,
 			const struct snd_soc_acpi_adr_device *adr_dev = &adr_link->adr_d[i];
 			struct asoc_sdw_codec_info *codec_info;
 			const char *codec_name;
+			bool check_sdca = false;
 
 			if (!adr_dev->name_prefix) {
 				dev_err(dev, "codec 0x%llx does not have a name prefix\n",
@@ -1189,6 +1291,9 @@ int asoc_sdw_parse_sdw_endpoints(struct snd_soc_card *card,
 				soc_end->include_sidecar = true;
 			}
 
+			if (SDW_CLASS_ID(adr_dev->adr) && adr_dev->num_endpoints > 1)
+				check_sdca = true;
+
 			for (j = 0; j < adr_dev->num_endpoints; j++) {
 				const struct snd_soc_acpi_endpoint *adr_end;
 				const struct asoc_sdw_dai_info *dai_info;
@@ -1199,9 +1304,35 @@ int asoc_sdw_parse_sdw_endpoints(struct snd_soc_card *card,
 				dai_info = &codec_info->dais[adr_end->num];
 				soc_dai = asoc_sdw_find_dailink(soc_dais, adr_end);
 
-				if (dai_info->quirk &&
-				    !(dai_info->quirk_exclude ^ !!(dai_info->quirk & ctx->mc_quirk)))
-					continue;
+				/*
+				 * quirk should have higher priority than the sdca properties
+				 * in the BIOS. We can't always check the DAI quirk because we
+				 * will set the mc_quirk when the BIOS doesn't provide the right
+				 * information. The endpoint will be skipped if the dai_info->
+				 * quirk_exclude and mc_quirk are both not set if we always skip
+				 * the endpoint according to the quirk information. We need to
+				 * keep the endpoint if it is present in the BIOS. So, only
+				 * check the DAI quirk when the mc_quirk is set or SDCA endpoint
+				 * present check is not needed.
+				 */
+				if (dai_info->quirk & ctx->mc_quirk || !check_sdca) {
+					/*
+					 * Check the endpoint if a matching quirk is set or SDCA
+					 * endpoint check is not necessary
+					 */
+					if (dai_info->quirk &&
+					    !(dai_info->quirk_exclude ^ !!(dai_info->quirk & ctx->mc_quirk)))
+						continue;
+				} else {
+					/* Check SDCA codec endpoint if there is no matching quirk */
+					ret = is_sdca_endpoint_present(dev, codec_info, adr_link, i, j);
+					if (ret < 0)
+						return ret;
+
+					/* The endpoint is not present, skip */
+					if (!ret)
+						continue;
+				}
 
 				dev_dbg(dev,
 					"Add dev: %d, 0x%llx end: %d, dai: %d, %c/%c to %s: %d\n",
-- 
2.43.0

