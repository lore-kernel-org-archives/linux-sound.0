Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC84835C188
	for <linux-sound@vger.kernel.org>; Fri,  8 May 2026 09:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778233683; cv=none; b=paX86RxGrCRltwZj2IjV4SQMawjjfoU8vDBHBDGmu/85Fx0PSuiCTrF9eJg3WfAkjolCXKmg/JRd9gRNTPkYersPJsm35s/R3093f0w3URx1nQo5Pxl+j7HkjjrHZGDZqFOsrsVHCPdXKYAvZ7F1rrIYvgnLsa7Pm8ZtLPj9hi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778233683; c=relaxed/simple;
	bh=d43rd7us/5U7TXCd+PU642Cb4liEavrYLLs2tdZeSRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U+Hi9gq9fJuFj5owoV0qcYM4sTWYDQhhuxdyKSC7OU3fal1eGCG1zvnO4cONYrGo6JYxQWeJmHbmD5M/vl0cIjVTA50URNHDIIG+HltvwXA/yIY8OWDhrVKC0JSUq8VK1+fhGm5VPItJ5tGxDsKJnLucd5iuKS3HWBIkLKq41s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ehMWxHLv; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ehMWxHLv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778233682; x=1809769682;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=d43rd7us/5U7TXCd+PU642Cb4liEavrYLLs2tdZeSRc=;
  b=ehMWxHLv4cIgWHVR0AJGF1K9qN3CHGsYB5Vy1wEjwEnBT9qjL701RcRG
   vAcd7FcOnDbuCKVHkokQYLwrehnREA2S2copnKkyS3Jasw/92MAanLLfW
   YnSihHEFMGfY48tMjVqYvYXhBpZ7Khl1FOtfHt1t/zog1CmGscSV8pUl0
   ESNCFTwGQ4So914lQMg4FyFwQM0Kf1JjLeZ4bkPt6LkniAkaqo1V7QMIa
   38BxoD9mRi9bZJH1AdLxwfMlkO+ACR30/K5Ql6WdkybhJdehzO/oViKzO
   8/zGuKbyQOmz5SnM8TpAqLfPe7mnA1mdD+d1u3QxFPeRUzh6Am8kk5Gc0
   g==;
X-CSE-ConnectionGUID: IiA4yMlhSfm6JYUH1v8bhg==
X-CSE-MsgGUID: HXAC4zrQTceQhaDF1v19qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="78221311"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="78221311"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 02:48:01 -0700
X-CSE-ConnectionGUID: Z7Es02vHS2qTx1OCz2K6GQ==
X-CSE-MsgGUID: 9Jpkr8cLRTy+2msut3KRbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="232380706"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 02:48:00 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 1/2] ASoC: soc_sdw_utils: skip aux device if it is not present
Date: Fri,  8 May 2026 17:47:49 +0800
Message-ID: <20260508094750.1246796-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508094750.1246796-1-yung-chuan.liao@linux.intel.com>
References: <20260508094750.1246796-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maciej Strozek <mstrozek@opensource.cirrus.com>

Similarly to codec endpoints that may not be used [1], aux devices (like
HID) also may not be used. Hence skip aux devices which are not present.

[1] https://lore.kernel.org/all/20250414063239.85200-12-yung-chuan.liao@linux.intel.com/

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 76 ++++++++++++++++++++++++++++-
 1 file changed, 74 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index ede41c532c52..da626969a657 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -1708,6 +1708,63 @@ int asoc_sdw_init_simple_dai_link(struct device *dev, struct snd_soc_dai_link *d
 }
 EXPORT_SYMBOL_NS(asoc_sdw_init_simple_dai_link, "SND_SOC_SDW_UTILS");
 
+/**
+ * is_sdca_aux_dev_present - Check if an SDCA aux device is present on the SDW peripheral
+ * @dev: Device pointer
+ * @aux_codec_name: Aux codec name from the codec info (e.g. "snd_soc_sdca.HID.2")
+ * @adr_link: ACPI link address
+ * @adr_index: Index of the ACPI link address
+ *
+ * Return: 1 if the aux is present, 0 if the aux is not present, or negative error code.
+ */
+static int is_sdca_aux_dev_present(struct device *dev,
+				   const char *aux_codec_name,
+				   const struct snd_soc_acpi_link_adr *adr_link,
+				   int adr_index)
+{
+	struct sdw_slave *slave;
+	struct device *sdw_dev;
+	const char *sdw_codec_name;
+	int ret = 0;
+	int i;
+
+	if (!aux_codec_name)
+		return 0;
+
+	sdw_codec_name = _asoc_sdw_get_codec_name(dev, adr_link, adr_index);
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
+
+	if (!slave->sdca_data.interface_revision) {
+		dev_warn(dev, "No SDCA properties, assuming aux '%s' present\n", aux_codec_name);
+		ret = 1;
+		goto put_dev;
+	}
+
+	for (i = 0; i < slave->sdca_data.num_functions; i++) {
+		const char *fname = slave->sdca_data.function[i].name;
+
+		if (fname && strstr(aux_codec_name, fname)) {
+			ret = 1;
+			goto put_dev;
+		}
+	}
+
+	dev_dbg(dev, "SDCA function for aux '%s' NOT FOUND on slave, skipping\n", aux_codec_name);
+
+put_dev:
+	put_device(sdw_dev);
+	return ret;
+}
+
 int asoc_sdw_count_sdw_endpoints(struct snd_soc_card *card,
 				 int *num_devs, int *num_ends, int *num_aux)
 {
@@ -1715,7 +1772,7 @@ int asoc_sdw_count_sdw_endpoints(struct snd_soc_card *card,
 	struct snd_soc_acpi_mach *mach = dev_get_platdata(dev);
 	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
 	const struct snd_soc_acpi_link_adr *adr_link;
-	int i;
+	int i, j, ret;
 
 	for (adr_link = mach_params->links; adr_link->num_adr; adr_link++) {
 		*num_devs += adr_link->num_adr;
@@ -1730,7 +1787,14 @@ int asoc_sdw_count_sdw_endpoints(struct snd_soc_card *card,
 			if (!codec_info)
 				return -EINVAL;
 
-			*num_aux += codec_info->aux_num;
+			for (j = 0; j < codec_info->aux_num; j++) {
+				ret = is_sdca_aux_dev_present(dev, codec_info->auxs[j].codec_name,
+							      adr_link, i);
+				if (ret < 0)
+					return ret;
+				if (ret)
+					(*num_aux)++;
+			}
 		}
 	}
 
@@ -1894,6 +1958,14 @@ int asoc_sdw_parse_sdw_endpoints(struct snd_soc_card *card,
 			for (j = 0; j < codec_info->aux_num; j++) {
 				struct snd_soc_component *component;
 
+				ret = is_sdca_aux_dev_present(dev, codec_info->auxs[j].codec_name,
+							      adr_link, i);
+				if (ret < 0)
+					return ret;
+
+				if (ret == 0)
+					continue;
+
 				component = snd_soc_lookup_component_by_name(codec_info->auxs[j].codec_name);
 				if (component) {
 					dev_dbg(dev, "%s found component %s for aux name %s\n",
-- 
2.43.0

