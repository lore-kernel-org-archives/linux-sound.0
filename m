Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FAB30E849
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 07:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760426050; cv=none; b=EDioXl8x2I24yB6WVRne/KgW8j3odwBZ85RjEO+fxzV7uQXA6janzLceTcRQtQDWniI/Xm/fQEwHhxW2i4Kk1zsBiSNFY/OGfandiZeMtNXWFQc4GwJ2Fmw2Z2v1nzCB0WIbxAYTpVl0gV/pLs9Osd8HLlwfwy2Y+hoz/HlO5l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760426050; c=relaxed/simple;
	bh=7qcwFRkG/c035iflB6Ax2GbbS9SEHQh4K+iK0l9jLHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AMwMPqlYndrzYRGHF8RTgJIbulWV3S8fqNNpV14Kt1x5vxwN9xUDewwqrKxGr+t0eNil4p8byHh4YJEal8XIkK8VTKl/ejIcaTWfOqkKTauyui2GMLkJ6Xt99o74YKOcwhp0apEBxI8wD2LRh2tg5kLMmdbN3ta5yWSYDjYmDp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lv6d97n9; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lv6d97n9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760426048; x=1791962048;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7qcwFRkG/c035iflB6Ax2GbbS9SEHQh4K+iK0l9jLHI=;
  b=lv6d97n9EppMmxJJgGQ1KS4Vairo+worBBfbvceC5t4vPQF0vG/wN1mq
   LYAS7T6WAxjqhnSEPlszi84rq84jAL9BT+ajpRdstZ7pOH5c0KcfhrB1Z
   EuL1KOGrUoj0B3jYcQu6pwt2Yobobj/yTS8/MIy7QOwf7h5fG4XEQnGH2
   Jzzo1DBIZ9/dhZj9lefdjbVG7mOdcuYLEZomqyHWliSqgN4DG7tbgZ5H0
   1Coi1REyM5DKYVpUyX/LDkjuxZuybNWr3z5Zc5FtA7x1aNDCncgT3/d1j
   MxKk7aSq+Jt1axC5SH6AqyYnYe08j0NlPnej8FFYegvHZtBiSTWlNsl4M
   Q==;
X-CSE-ConnectionGUID: RrKxBHmISUuKMqNwUvX1Rg==
X-CSE-MsgGUID: B8fYnbiwTqqCkbrCGXkE2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66233714"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="66233714"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 00:14:06 -0700
X-CSE-ConnectionGUID: tvhaPfT6R3qZev79H6mCgA==
X-CSE-MsgGUID: d3KjyGtrTX61lYdPFKxFJQ==
X-ExtLoop1: 1
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 00:14:04 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	niranjan.hy@ti.com,
	sbinding@opensource.cirrus.com
Subject: [PATCH v2 8/9] ASoC: SOF: Intel: use sof_sdw as default SDW machine driver
Date: Tue, 14 Oct 2025 15:13:34 +0800
Message-ID: <20251014071335.3844631-9-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014071335.3844631-1-yung-chuan.liao@linux.intel.com>
References: <20251014071335.3844631-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If there is no SoundWire machine matches the existing acpi match table,
get the required machine data from the acpi table and construct the
link adrs and endpoints. Pass the data to the default Intel SoundWire
machine driver. And we don't need to add new item to the acpi match
table in common cases.
We will construct a dummy topology name. The dummy topology is just
used to extract the platform name for function topology and should not
be used.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Simon Trimmer <simont@opensource.cirrus.com>
---
 sound/soc/sof/intel/hda.c | 205 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 203 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 52e86fa60077..00835fc8ef8d 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -26,6 +26,7 @@
 #include <sound/intel-dsp-config.h>
 #include <sound/intel-nhlt.h>
 #include <sound/soc-acpi-intel-ssp-common.h>
+#include <sound/soc_sdw_utils.h>
 #include <sound/sof.h>
 #include <sound/sof/xtensa.h>
 #include <sound/hda-mlink.h>
@@ -33,6 +34,7 @@
 #include "../sof-pci-dev.h"
 #include "../ops.h"
 #include "../ipc4-topology.h"
+#include "../../intel/common/sof-function-topology-lib.h"
 #include "hda.h"
 
 #include <trace/events/sof_intel.h>
@@ -1131,14 +1133,166 @@ static void hda_generic_machine_select(struct snd_sof_dev *sdev,
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
 
+static bool is_endpoint_present(struct sdw_slave *sdw_device,
+				struct asoc_sdw_codec_info *dai_info, int dai_type)
+{
+	int i;
+
+	for (i = 0; i < sdw_device->sdca_data.num_functions; i++) {
+		if (dai_type == dai_info->dais[i].dai_type)
+			return true;
+	}
+	dev_dbg(&sdw_device->dev, "Endpoint DAI type %d not found\n", dai_type);
+	return false;
+}
+
+static struct snd_soc_acpi_adr_device *find_acpi_adr_device(struct device *dev,
+							    struct sdw_slave *sdw_device,
+							    struct snd_soc_acpi_link_adr *link,
+							    int *amp_index)
+{
+	struct snd_soc_acpi_adr_device *adr_dev;
+	const char *name_prefix = "";
+	int index = link->num_adr;
+	bool is_amp = true; /* Set it to false if the codec wiah any NON-AMP DAI type */
+	int ep_index = 0;
+	int i, j;
+
+	link->mask = BIT(sdw_device->bus->link_id);
+	/* index is 0 based, we need allocate index + 1 for the array size */
+	if (!index)
+		adr_dev = devm_kzalloc(dev, sizeof(*adr_dev), GFP_KERNEL);
+	else
+		adr_dev = devm_krealloc(dev, (struct snd_soc_acpi_adr_device *)link->adr_d,
+					(index + 1) * sizeof(*adr_dev), GFP_KERNEL);
+
+	if (!adr_dev)
+		return NULL;
+
+	for (i = 0; i < asoc_sdw_get_codec_info_list_count(); i++) {
+		struct snd_soc_acpi_endpoint *endpoints;
+		int amp_group_id = 1;
+
+		if (sdw_device->id.part_id != codec_info_list[i].part_id)
+			continue;
+
+		endpoints = devm_kcalloc(dev, codec_info_list[i].dai_num,
+					 sizeof(struct snd_soc_acpi_endpoint), GFP_KERNEL);
+		if (!endpoints)
+			return NULL;
+
+		name_prefix = codec_info_list[i].name_prefix;
+		/*
+		 * This should not happen, but add a paranoid check to avoid NULL pointer
+		 * dereference
+		 */
+		if (!name_prefix) {
+			dev_err(dev, "codec_info_list name_prefix of part id %#x is missing\n",
+				codec_info_list[i].part_id);
+			return NULL;
+		}
+		for (j = 0; j < codec_info_list[i].dai_num; j++) {
+			/* Check if the endpoint is present by the SDCA DisCo table */
+			if (!is_endpoint_present(sdw_device, &codec_info_list[i],
+						 codec_info_list[i].dais[j].dai_type))
+				continue;
+
+			endpoints[ep_index].num = ep_index;
+			if (codec_info_list[i].dais[j].dai_type == SOC_SDW_DAI_TYPE_AMP) {
+				/* Assume all amp are aggregated */
+				endpoints[ep_index].aggregated = 1;
+				endpoints[ep_index].group_id = amp_group_id;
+				endpoints[ep_index].group_position = *amp_index;
+				/* Set group id = 2 for feedback capture endpoint */
+				amp_group_id++;
+			} else {
+				endpoints[ep_index].aggregated = 0;
+				endpoints[ep_index].group_id = 0;
+				endpoints[ep_index].group_position = 0;
+				is_amp = false;
+			}
+			ep_index++;
+		}
+		adr_dev[index].endpoints = endpoints;
+		adr_dev[index].num_endpoints = ep_index;
+		break;
+	}
+
+	if (i == asoc_sdw_get_codec_info_list_count()) {
+		dev_err(dev, "part id %#x is not supported\n", sdw_device->id.part_id);
+		return NULL;
+	}
+
+	adr_dev[index].adr = ((u64)sdw_device->id.class_id & 0xFF) |
+			((u64)sdw_device->id.part_id & 0xFFFF) << 8 |
+			((u64)sdw_device->id.mfg_id & 0xFFFF) << 24 |
+			((u64)(sdw_device->id.unique_id & 0xF) << 40) |
+			((u64)(sdw_device->id.sdw_version & 0xF) << 44) |
+			((u64)(sdw_device->bus->link_id & 0xF) << 48);
+
+	if (!is_amp) {
+		/* For non-amp codecs, get name_prefix from codec_info_list[] */
+		adr_dev[index].name_prefix = devm_kasprintf(dev, GFP_KERNEL, "%s", name_prefix);
+		goto done_name_prefix;
+	}
+
+	/*
+	 * The name_prefix comes from codec_info_list which has a name_prefix per codec.
+	 * And we need to give a unique name_prefix for each amp and should be backwards
+	 * compatible to the existing acpi match tables to not break existing UCMs.
+	 * For the common name_prefix, we append the amp index to it. However, for the
+	 * "Left" name_prefix, we convert the second amp name_prefix to "Right" and
+	 * for the third and further amps, we set the name_prefix to "AMP<amp_index>".
+	 */
+	if (!strcmp(name_prefix, "Left")) {
+		switch (*amp_index) {
+		case 1:
+			adr_dev[index].name_prefix = devm_kasprintf(dev, GFP_KERNEL,
+								    "%s", "Left");
+			break;
+		case 2:
+			adr_dev[index].name_prefix = devm_kasprintf(dev, GFP_KERNEL,
+								    "%s", "Right");
+			break;
+		default:
+			/* Set the name_fix to AMP<amp_index> if there are more than 2 amps */
+			adr_dev[index].name_prefix = devm_kasprintf(dev, GFP_KERNEL, "%s%d",
+								    "AMP", *amp_index);
+			break;
+		}
+	} else {
+		adr_dev[index].name_prefix = devm_kasprintf(dev, GFP_KERNEL, "%s%d",
+							    name_prefix,
+							    *amp_index);
+	}
+	(*amp_index)++;
+
+done_name_prefix:
+	if (!adr_dev[index].name_prefix) {
+		dev_err(dev, "failed to allocate memory for name_prefix\n");
+		return NULL;
+	}
+
+	dev_dbg(dev, "adr[%d] 0x%llx link id %d name_prefix \"%s\" is found\n",
+		index, adr_dev[index].adr, sdw_device->bus->link_id, adr_dev[index].name_prefix);
+
+	link->num_adr++;
+
+	return adr_dev;
+}
+
 static struct snd_soc_acpi_mach *hda_sdw_machine_select(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_pdata *pdata = sdev->pdata;
 	const struct snd_soc_acpi_link_adr *link;
+	const struct sof_intel_dsp_desc *chip;
+	struct snd_soc_acpi_link_adr *links;
 	struct sdw_peripherals *peripherals;
 	struct snd_soc_acpi_mach *mach;
 	struct sof_intel_hda_dev *hdev;
-	u32 link_mask;
+	int link_index, link_num;
+	int amp_index = 1;
+	u32 link_mask = 0;
 	int i;
 
 	hdev = pdata->hw_pdata;
@@ -1215,7 +1369,53 @@ static struct snd_soc_acpi_mach *hda_sdw_machine_select(struct snd_sof_dev *sdev
 			 peripherals->array[i]->id.part_id,
 			 peripherals->array[i]->id.sdw_version);
 
-	return NULL;
+	chip = get_chip_info(sdev->pdata);
+
+	/* SDCA was not well supported in the BIOS before ACE2.0 */
+	if (chip->hw_ip_version < SOF_INTEL_ACE_2_0)
+		return NULL;
+
+	if (!peripherals->num_peripherals)
+		return NULL;
+
+	/* Create default SDW mach */
+	mach = devm_kzalloc(sdev->dev, sizeof(*mach), GFP_KERNEL);
+	if (!mach)
+		return NULL;
+
+	/* Get link mask and link number */
+	for (i = 0; i < peripherals->num_peripherals; i++)
+		link_mask |= BIT(peripherals->array[i]->bus->link_id);
+
+	link_num = hweight32(link_mask);
+	links = devm_kcalloc(sdev->dev, link_num, sizeof(*links), GFP_KERNEL);
+	if (!links)
+		return NULL;
+
+	/* Generate snd_soc_acpi_link_adr struct for each peripheral reported by the ACPI table */
+	for (i = 0; i < peripherals->num_peripherals; i++) {
+		/* link_index = the number of used links below the current link */
+		link_index = hweight32(link_mask & (BIT(peripherals->array[i]->bus->link_id) - 1));
+		links[link_index].adr_d = find_acpi_adr_device(sdev->dev, peripherals->array[i],
+							       &links[link_index], &amp_index);
+		if (!links[link_index].adr_d)
+			return NULL;
+	}
+
+	mach->drv_name = "sof_sdw";
+	mach->mach_params.links = links;
+	mach->mach_params.link_mask = link_mask;
+	mach->mach_params.platform = dev_name(sdev->dev);
+	mach->get_function_tplg_files = sof_sdw_get_tplg_files;
+	/*
+	 * Set mach->sof_tplg_filename as a dummy topology to avoid tplg file checking
+	 * and being used.
+	 */
+	mach->sof_tplg_filename = devm_kasprintf(sdev->dev, GFP_KERNEL,
+						 "sof-%s-dummy.tplg", chip->platform);
+
+	dev_info(sdev->dev, "Use SoundWire default machine driver with function topologies\n");
+	return mach;
 }
 #else
 static struct snd_soc_acpi_mach *hda_sdw_machine_select(struct snd_sof_dev *sdev)
@@ -1543,6 +1743,7 @@ MODULE_IMPORT_NS("SND_SOC_SOF_XTENSA");
 MODULE_IMPORT_NS("SND_INTEL_SOUNDWIRE_ACPI");
 MODULE_IMPORT_NS("SOUNDWIRE_INTEL_INIT");
 MODULE_IMPORT_NS("SOUNDWIRE_INTEL");
+MODULE_IMPORT_NS("SND_SOC_SDW_UTILS");
 MODULE_IMPORT_NS("SND_SOC_SOF_HDA_MLINK");
 MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_HDA_COMMON");
 MODULE_IMPORT_NS("SND_SOC_ACPI_INTEL_MATCH");
-- 
2.43.0

