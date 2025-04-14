Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B43619FA92
	for <linux-sound@vger.kernel.org>; Mon, 14 Apr 2025 06:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744612409; cv=none; b=WCxtXTWk3629tFPsX4eukBRdt5FzqJp+aCJxlmOs4TRaIltaLBQLzBXa/YCyxwrJxYeQgr/yJd3eflekLERlvXuSQgeLEzolcnukxm3rmtm1BpHvvx5xEL0rmKabfD9avRIrTZeeUk43qSnYVTD9xi1CjxLY+ASMq3cq892DMYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744612409; c=relaxed/simple;
	bh=/mZ/xct1ow4dvcqLq3ti+aSQS0YhxRKMzCb1BS8yvqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ewiFbPsieGsmnL30m3tkSm9XSEy2OK3X8yRygqjQBh7xux2INVm9oqIJFtbqP1j/AeEsGLTccsYw8S/VP2RMIpPJD22AEooBh8k7VwgTiMZki99TA4jABurOD4ZcMgV+UJVRmtlyJyD/jG7RbpaFyYs0telq2Pnoxcrz2HleuJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dTae6zJF; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dTae6zJF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744612407; x=1776148407;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/mZ/xct1ow4dvcqLq3ti+aSQS0YhxRKMzCb1BS8yvqk=;
  b=dTae6zJFCgMrGsqhGyYwvtmeZ7wqRkHpDNNQKDf5wHz6AHyd1eB3gktR
   BeEnejK1oK+Xurwnc5vAsbZP+urCmCK7q9aEhPS+rypOQTjq1bmKXjB5C
   ZwjtwG7bR+5y8KdDa6MIN6Bv/edKEaO4o/w6dMOyjUqovbIwYW6K0Qlzs
   6CWzGiNhY1n5nq/or9OFGg7EU+wXabkqdvxaQppsSgWZKKC5uwaxohAib
   6zYLJCL0+klhK46+beUA8PBS7Tbe1zURF+bCsMv1X43Vn3tJVgREYmrvF
   vuaQmcnFtAYpVwkH6vDV/pkir+Il6lHwbJiq/x0k7MgXxIOtWZGcdaXzX
   Q==;
X-CSE-ConnectionGUID: CNyKS0vLR8OeaC2BHh3GRQ==
X-CSE-MsgGUID: AOw5S+vTSzy5By84wQLvtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="49872629"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="49872629"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 23:33:27 -0700
X-CSE-ConnectionGUID: ZQNiitT6ReKqM2aTh1S4kw==
X-CSE-MsgGUID: P1TJdpqQQxeCB8RKEYzFbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="130275291"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.73])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 23:33:26 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 05/11] ASoC: Intel: add sof_sdw_get_tplg_files ops
Date: Mon, 14 Apr 2025 14:32:33 +0800
Message-ID: <20250414063239.85200-6-yung-chuan.liao@linux.intel.com>
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

Add sof_sdw_get_tplg_files ops to get sub-topology file names for the
sof_sdw card.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/common/Makefile               |   2 +-
 .../intel/common/sof-function-topology-lib.c  | 135 ++++++++++++++++++
 .../intel/common/sof-function-topology-lib.h  |  15 ++
 3 files changed, 151 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/intel/common/sof-function-topology-lib.c
 create mode 100644 sound/soc/intel/common/sof-function-topology-lib.h

diff --git a/sound/soc/intel/common/Makefile b/sound/soc/intel/common/Makefile
index 0afd114be9e5..7822bcae6c69 100644
--- a/sound/soc/intel/common/Makefile
+++ b/sound/soc/intel/common/Makefile
@@ -12,7 +12,7 @@ snd-soc-acpi-intel-match-y := soc-acpi-intel-byt-match.o soc-acpi-intel-cht-matc
 	soc-acpi-intel-lnl-match.o \
 	soc-acpi-intel-ptl-match.o \
 	soc-acpi-intel-hda-match.o \
-	soc-acpi-intel-sdw-mockup-match.o
+	soc-acpi-intel-sdw-mockup-match.o sof-function-topology-lib.o
 
 snd-soc-acpi-intel-match-y += soc-acpi-intel-ssp-common.o
 
diff --git a/sound/soc/intel/common/sof-function-topology-lib.c b/sound/soc/intel/common/sof-function-topology-lib.c
new file mode 100644
index 000000000000..90fe7aa3df1c
--- /dev/null
+++ b/sound/soc/intel/common/sof-function-topology-lib.c
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2025 Intel Corporation.
+//
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/firmware.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include "sof-function-topology-lib.h"
+
+enum tplg_device_id {
+	TPLG_DEVICE_SDCA_JACK,
+	TPLG_DEVICE_SDCA_AMP,
+	TPLG_DEVICE_SDCA_MIC,
+	TPLG_DEVICE_INTEL_PCH_DMIC,
+	TPLG_DEVICE_HDMI,
+	TPLG_DEVICE_MAX
+};
+
+#define SDCA_DEVICE_MASK (BIT(TPLG_DEVICE_SDCA_JACK) | BIT(TPLG_DEVICE_SDCA_AMP) | \
+			  BIT(TPLG_DEVICE_SDCA_MIC))
+
+#define SOF_INTEL_PLATFORM_NAME_MAX 4
+
+int sof_sdw_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_mach *mach,
+			   const char *prefix, const char ***tplg_files)
+{
+	struct snd_soc_acpi_mach_params mach_params = mach->mach_params;
+	struct snd_soc_dai_link *dai_link;
+	const struct firmware *fw;
+	char platform[SOF_INTEL_PLATFORM_NAME_MAX];
+	unsigned long tplg_mask = 0;
+	int tplg_num = 0;
+	int tplg_dev;
+	int ret;
+	int i;
+
+	ret = sscanf(mach->sof_tplg_filename, "sof-%3s-*.tplg", platform);
+	if (ret != 1) {
+		dev_err(card->dev, "Invalid platform name %s of tplg %s\n",
+			platform, mach->sof_tplg_filename);
+		return -EINVAL;
+	}
+
+	for_each_card_prelinks(card, i, dai_link) {
+		char *tplg_dev_name;
+
+		dev_dbg(card->dev, "dai_link %s id %d\n", dai_link->name, dai_link->id);
+		if (strstr(dai_link->name, "SimpleJack")) {
+			tplg_dev = TPLG_DEVICE_SDCA_JACK;
+			tplg_dev_name = "sdca-jack";
+		} else if (strstr(dai_link->name, "SmartAmp")) {
+			tplg_dev = TPLG_DEVICE_SDCA_AMP;
+			tplg_dev_name = devm_kasprintf(card->dev, GFP_KERNEL,
+						       "sdca-%damp", dai_link->num_cpus);
+			if (!tplg_dev_name)
+				return -ENOMEM;
+		} else if (strstr(dai_link->name, "SmartMic")) {
+			tplg_dev = TPLG_DEVICE_SDCA_MIC;
+			tplg_dev_name = "sdca-mic";
+		} else if (strstr(dai_link->name, "dmic")) {
+			switch (mach_params.dmic_num) {
+			case 2:
+				tplg_dev_name = "dmic-2ch";
+				break;
+			case 4:
+				tplg_dev_name = "dmic-4ch";
+				break;
+			default:
+				dev_warn(card->dev,
+					 "only -2ch and -4ch are supported for dmic\n");
+				continue;
+			}
+			tplg_dev = TPLG_DEVICE_INTEL_PCH_DMIC;
+		} else if (strstr(dai_link->name, "iDisp")) {
+			tplg_dev = TPLG_DEVICE_HDMI;
+			tplg_dev_name = "hdmi-pcm5";
+
+		} else {
+			/* The dai link is not supported by separated tplg yet */
+			dev_dbg(card->dev,
+				"dai_link %s is not supported by separated tplg yet\n",
+				dai_link->name);
+			return 0;
+		}
+		if (tplg_mask & BIT(tplg_dev))
+			continue;
+
+		tplg_mask |= BIT(tplg_dev);
+
+		/*
+		 * The tplg file naming rule is sof-<platform>-<function>-id<BE id number>.tplg
+		 * where <platform> is only required for the DMIC function as the nhlt blob
+		 * is platform dependent.
+		 */
+		switch (tplg_dev) {
+		case TPLG_DEVICE_INTEL_PCH_DMIC:
+			(*tplg_files)[tplg_num] = devm_kasprintf(card->dev, GFP_KERNEL,
+								 "%s/sof-%s-%s-id%d.tplg",
+								 prefix, platform,
+								 tplg_dev_name, dai_link->id);
+			break;
+		default:
+			(*tplg_files)[tplg_num] = devm_kasprintf(card->dev, GFP_KERNEL,
+								 "%s/sof-%s-id%d.tplg",
+								 prefix, tplg_dev_name,
+								 dai_link->id);
+			break;
+		}
+		if (!(*tplg_files)[tplg_num])
+			return -ENOMEM;
+		tplg_num++;
+	}
+
+	dev_dbg(card->dev, "tplg_mask %#lx tplg_num %d\n", tplg_mask, tplg_num);
+
+	/* Check presence of sub-topologies */
+	for (i = 0; i < tplg_num; i++) {
+		ret = firmware_request_nowarn(&fw, (*tplg_files)[i], card->dev);
+		if (!ret) {
+			release_firmware(fw);
+		} else {
+			dev_dbg(card->dev, "Failed to open topology file: %s\n", (*tplg_files)[i]);
+			return 0;
+		}
+	}
+
+	return tplg_num;
+}
+
diff --git a/sound/soc/intel/common/sof-function-topology-lib.h b/sound/soc/intel/common/sof-function-topology-lib.h
new file mode 100644
index 000000000000..e7d0c39d0788
--- /dev/null
+++ b/sound/soc/intel/common/sof-function-topology-lib.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * soc-acpi-intel-get-tplg.h - get-tplg-files ops
+ *
+ * Copyright (c) 2025, Intel Corporation.
+ *
+ */
+
+#ifndef _SND_SOC_ACPI_INTEL_GET_TPLG_H
+#define _SND_SOC_ACPI_INTEL_GET_TPLG_H
+
+int sof_sdw_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_mach *mach,
+			   const char *prefix, const char ***tplg_files);
+
+#endif
-- 
2.43.0

