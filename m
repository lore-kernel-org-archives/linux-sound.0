Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984A238D
	for <linux-sound@vger.kernel.org>; Fri, 19 Apr 2024 08:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713516113; cv=none; b=ctY61DuSilZyhw4iX/wDjQ+6FcYjgP7u0X09WC+xzYD3QCIKfJFxXn20uKuquHTMNMrnKxqszFAoh4JZtfSLHdXT6S6FqC7h17YcL35OwZAZj3QruQVvSout/PU6nu1SBwowMsdSJtQT+DPm9M+VOPlxXElKL2WX4DzmVl5pWGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713516113; c=relaxed/simple;
	bh=MyupNMaIvtBD2qJkEhmX479Ymxd/FbMHKmafV5JA2lw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gY64DioDAYt6KqaoTMfqObJ2pf/SYAsfuIWAgtIBtFZysSg64vWrHzbU/hDa6YdWfY8AN6coqGG3chB+00hueyX78omNAUNKgP1GbhV+3jOm1hPZemIz1/HPrBzWNaYgBsC7njq67XbARmL6b5l/tGve5DZwB1rZBXODloX4dY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UIg7/t2E; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UIg7/t2E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713516112; x=1745052112;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MyupNMaIvtBD2qJkEhmX479Ymxd/FbMHKmafV5JA2lw=;
  b=UIg7/t2E/kL6vtDTi5xj0rv2y+0T0fYn1xcf4nVeeitX6nWt60gi7GUv
   98HdDj6x5pa2JsCTdiJru1tVVmBgLRlPKthS6OuJUufKunIoMoFv92zvH
   scheet8zdcL2i7rK22TFwpybylhro+oJ5PkzvEhkzrF3Uz0qAki57qcCW
   H5yj3nx1LmcQj/YksZr2mIzathtfdkrv5velvqOmWIIeAljO5lw4q0rcZ
   +bZ26/HrdU4OGY7ouvGpMh/lJizWjS6tIPyCTAxaGUYVihzN/aVrZAYZ1
   wT88Nh5xGUyFgkRm1g0BvCuJBzGcbsSNANbvDQIIL07uyhmGO5qH2nKIX
   w==;
X-CSE-ConnectionGUID: NrkOWKMES0GHoxob+PghFg==
X-CSE-MsgGUID: j2HheBfZQfqx2smsm/hiZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9233748"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="9233748"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 01:41:51 -0700
X-CSE-ConnectionGUID: v+3nAfGER6ui9TbUpD7lPw==
X-CSE-MsgGUID: mkV1IBbpS6mYzLJ7yi39fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="23353180"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa008.fm.intel.com with ESMTP; 19 Apr 2024 01:41:49 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	rafael@kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 2/2] ASoC: Intel: avs: Switch to ACPI NHLT
Date: Fri, 19 Apr 2024 10:43:07 +0200
Message-Id: <20240419084307.2718881-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240419084307.2718881-1-cezary.rojewski@intel.com>
References: <20240419084307.2718881-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

Now that NHLT support in ACPI framework was introduced, migrate avs
driver to new API.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/Kconfig               |  1 +
 sound/soc/intel/avs/avs.h             |  1 -
 sound/soc/intel/avs/board_selection.c |  7 +++---
 sound/soc/intel/avs/core.c            | 10 ++++-----
 sound/soc/intel/avs/path.c            | 32 +++++++++++++--------------
 5 files changed, 24 insertions(+), 27 deletions(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index 4b9e498e3303..38b61dfd1487 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -214,6 +214,7 @@ config SND_SOC_INTEL_AVS
 	depends on X86 || COMPILE_TEST
 	depends on PCI
 	depends on COMMON_CLK
+	select ACPI_NHLT if ACPI
 	select SND_SOC_ACPI if ACPI
 	select SND_SOC_TOPOLOGY
 	select SND_SOC_HDA
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index f80f79415344..900786eb81e4 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -151,7 +151,6 @@ struct avs_dev {
 	struct completion fw_ready;
 	struct work_struct probe_work;
 
-	struct nhlt_acpi_table *nhlt;
 	struct list_head comp_list;
 	struct mutex comp_list_mutex;
 	struct list_head path_list;
diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
index 8360ce557401..290ea314ace8 100644
--- a/sound/soc/intel/avs/board_selection.c
+++ b/sound/soc/intel/avs/board_selection.c
@@ -10,10 +10,10 @@
 #include <linux/module.h>
 #include <linux/dmi.h>
 #include <linux/pci.h>
+#include <acpi/nhlt.h>
 #include <linux/platform_device.h>
 #include <sound/hda_codec.h>
 #include <sound/hda_register.h>
-#include <sound/intel-nhlt.h>
 #include <sound/soc-acpi.h>
 #include <sound/soc-component.h>
 #include "avs.h"
@@ -434,8 +434,7 @@ static int avs_register_dmic_board(struct avs_dev *adev)
 	struct snd_soc_acpi_mach mach = {{0}};
 	int ret;
 
-	if (!adev->nhlt ||
-	    !intel_nhlt_has_endpoint_type(adev->nhlt, NHLT_LINK_DMIC)) {
+	if (!acpi_nhlt_find_endpoint(ACPI_NHLT_LINKTYPE_PDM, -1, -1, -1)) {
 		dev_dbg(adev->dev, "no DMIC endpoints present\n");
 		return 0;
 	}
@@ -523,7 +522,7 @@ static int avs_register_i2s_boards(struct avs_dev *adev)
 	struct snd_soc_acpi_mach *mach;
 	int ret;
 
-	if (!adev->nhlt || !intel_nhlt_has_endpoint_type(adev->nhlt, NHLT_LINK_SSP)) {
+	if (!acpi_nhlt_find_endpoint(ACPI_NHLT_LINKTYPE_SSP, -1, -1, -1)) {
 		dev_dbg(adev->dev, "no I2S endpoints present\n");
 		return 0;
 	}
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index d7f8940099ce..a61ce42b426c 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -14,15 +14,16 @@
 // foundation of this driver
 //
 
+#include <linux/acpi.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <acpi/nhlt.h>
 #include <sound/hda_codec.h>
 #include <sound/hda_i915.h>
 #include <sound/hda_register.h>
 #include <sound/hdaudio.h>
 #include <sound/hdaudio_ext.h>
 #include <sound/intel-dsp-config.h>
-#include <sound/intel-nhlt.h>
 #include "../../codecs/hda.h"
 #include "avs.h"
 #include "cldma.h"
@@ -214,9 +215,7 @@ static void avs_hda_probe_work(struct work_struct *work)
 	if (ret < 0)
 		return;
 
-	adev->nhlt = intel_nhlt_init(adev->dev);
-	if (!adev->nhlt)
-		dev_info(bus->dev, "platform has no NHLT\n");
+	acpi_nhlt_get_gbl_table();
 	avs_debugfs_init(adev);
 
 	avs_register_all_boards(adev);
@@ -549,8 +548,7 @@ static void avs_pci_remove(struct pci_dev *pci)
 	avs_unregister_all_boards(adev);
 
 	avs_debugfs_exit(adev);
-	if (adev->nhlt)
-		intel_nhlt_free(adev->nhlt);
+	acpi_nhlt_put_gbl_table();
 
 	if (avs_platattr_test(adev, CLDMA))
 		hda_cldma_free(&code_loader);
diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index e785fc2a7008..531a086642be 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -6,7 +6,8 @@
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
 //
 
-#include <sound/intel-nhlt.h>
+#include <linux/acpi.h>
+#include <acpi/nhlt.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include "avs.h"
@@ -143,10 +144,10 @@ static bool avs_dma_type_is_input(u32 dma_type)
 
 static int avs_copier_create(struct avs_dev *adev, struct avs_path_module *mod)
 {
-	struct nhlt_acpi_table *nhlt = adev->nhlt;
 	struct avs_tplg_module *t = mod->template;
 	struct avs_copier_cfg *cfg;
-	struct nhlt_specific_cfg *ep_blob;
+	struct acpi_nhlt_format_config *ep_blob;
+	struct acpi_nhlt_endpoint *ep;
 	union avs_connector_node_id node_id = {0};
 	size_t cfg_size, data_size = 0;
 	void *data = NULL;
@@ -174,18 +175,18 @@ static int avs_copier_create(struct avs_dev *adev, struct avs_path_module *mod)
 		else
 			fmt = t->cfg_ext->copier.out_fmt;
 
-		ep_blob = intel_nhlt_get_endpoint_blob(adev->dev,
-			nhlt, t->cfg_ext->copier.vindex.i2s.instance,
-			NHLT_LINK_SSP, fmt->valid_bit_depth, fmt->bit_depth,
-			fmt->num_channels, fmt->sampling_freq, direction,
-			NHLT_DEVICE_I2S);
+		ep = acpi_nhlt_find_endpoint(ACPI_NHLT_LINKTYPE_SSP,
+					     ACPI_NHLT_DEVICETYPE_CODEC, direction,
+					     t->cfg_ext->copier.vindex.i2s.instance);
+		ep_blob = acpi_nhlt_endpoint_find_fmtcfg(ep, fmt->num_channels, fmt->sampling_freq,
+							 fmt->valid_bit_depth, fmt->bit_depth);
 		if (!ep_blob) {
 			dev_err(adev->dev, "no I2S ep_blob found\n");
 			return -ENOENT;
 		}
 
-		data = ep_blob->caps;
-		data_size = ep_blob->size;
+		data = ep_blob->config.capabilities;
+		data_size = ep_blob->config.capabilities_size;
 		/* I2S gateway's vindex is statically assigned in topology */
 		node_id.vindex = t->cfg_ext->copier.vindex.val;
 
@@ -199,17 +200,16 @@ static int avs_copier_create(struct avs_dev *adev, struct avs_path_module *mod)
 		else
 			fmt = t->in_fmt;
 
-		ep_blob = intel_nhlt_get_endpoint_blob(adev->dev, nhlt, 0,
-				NHLT_LINK_DMIC, fmt->valid_bit_depth,
-				fmt->bit_depth, fmt->num_channels,
-				fmt->sampling_freq, direction, NHLT_DEVICE_DMIC);
+		ep = acpi_nhlt_find_endpoint(ACPI_NHLT_LINKTYPE_PDM, -1, direction, 0);
+		ep_blob = acpi_nhlt_endpoint_find_fmtcfg(ep, fmt->num_channels, fmt->sampling_freq,
+							 fmt->valid_bit_depth, fmt->bit_depth);
 		if (!ep_blob) {
 			dev_err(adev->dev, "no DMIC ep_blob found\n");
 			return -ENOENT;
 		}
 
-		data = ep_blob->caps;
-		data_size = ep_blob->size;
+		data = ep_blob->config.capabilities;
+		data_size = ep_blob->config.capabilities_size;
 		/* DMIC gateway's vindex is statically assigned in topology */
 		node_id.vindex = t->cfg_ext->copier.vindex.val;
 
-- 
2.25.1

