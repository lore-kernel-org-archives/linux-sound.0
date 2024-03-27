Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862F313118D
	for <linux-sound@vger.kernel.org>; Wed, 27 Mar 2024 16:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711556675; cv=none; b=gb6QtjiVNx3BtAz1Z21ok8CMaG/SqzCLkOuBw+UcuyjugU2Qrmljtmu9Tk7nedpuUkepRh1bM0YkU0MkRl0k5dU/Qc9LR7VDp6j7tEL0MezkGuH/vhFSXevv6UvWdXiKNTlFII5yjdviof0KiP/4/vtkJ+X1agIblzrK9R8imjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711556675; c=relaxed/simple;
	bh=pTeryrvseJcCWI/DDqcKtsUMeDVdgeOAEB5bQ3J6A6U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L5TmLnGAMZQK2I1HKOvKmkuKoUb8erkSNbFvlI6FWcFj7+45+8jQ7QmDAOo9YMa33SVTUZFv970NbCQEVnaP2meC2L/rm0FIsF9uTW+OXi26Rz7lUMF6qUBnVcxcxLUYG2ucxKE9ElgTRLxNkWYKDt7ajE304xFXN8b9Z4Y7Vj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OMt5/O4P; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OMt5/O4P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711556675; x=1743092675;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pTeryrvseJcCWI/DDqcKtsUMeDVdgeOAEB5bQ3J6A6U=;
  b=OMt5/O4PDOTawyE3GQVHSl59QEC2qPXNGx/k07gHcwUJbapCR5ew2pbX
   4dYYh/NnOe4uBFvIjszAyMpoCM9g4IXY72gSW9jSVDQ088vabFbj4w7qZ
   GjATs8ersi6ecYL2kMcwL+A/cClkHtasWggnLv22Lw6Py4Yp86uqZlC9a
   7KV63MqdYBsXgZKYvxdsF4YNk5zUfkacuq0W8OjaKY9mEFQrPG80iePeG
   ldkNWJ1PRf5bOnwYHSOY/QCpf5N4qu5xP90PXtl/3U7qEzUO72A/Ae7lq
   UkF5EqCDDhRNB6AbYO0JQSAd1yrdlrzBuNYkUsK94eC8GSBV//d8Oya0x
   Q==;
X-CSE-ConnectionGUID: f19gjUW0QQGY7iXSuKVG9g==
X-CSE-MsgGUID: z6Pf/+0STyigRTwIAZkN/Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17221534"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="17221534"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 09:24:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="53821304"
Received: from ssherman-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.117.1])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 09:24:32 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 10/18] ASoC: Intel: sof_nau8825: add mtl_nau8825_def for mtl boards
Date: Wed, 27 Mar 2024 11:24:00 -0500
Message-Id: <20240327162408.63953-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
References: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Add the board config mtl_nau8825_def to nau8825 machine driver for all
mtl boards using default SSP port allocation (headphone codec on SSP2,
speaker amplifiers on SSP0, and BT offload on SSP1).

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_nau8825.c              |  7 +++++++
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c | 11 +++++++++++
 2 files changed, 18 insertions(+)

diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
index 23fe8b4015cc..fe5f9e8dd652 100644
--- a/sound/soc/intel/boards/sof_nau8825.c
+++ b/sound/soc/intel/boards/sof_nau8825.c
@@ -319,6 +319,13 @@ static const struct platform_device_id board_ids[] = {
 					SOF_SSP_PORT_BT_OFFLOAD(2) |
 					SOF_BT_OFFLOAD_PRESENT),
 	},
+	{
+		.name = "mtl_nau8825_def",
+		.driver_data = (kernel_ulong_t)(SOF_SSP_PORT_CODEC(2) |
+					SOF_SSP_PORT_AMP(0) |
+					SOF_SSP_PORT_BT_OFFLOAD(1) |
+					SOF_BT_OFFLOAD_PRESENT),
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, board_ids);
diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 27d1313e6686..0125e81af9e1 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -8,6 +8,7 @@
 
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
+#include <sound/soc-acpi-intel-ssp-common.h>
 #include "soc-acpi-intel-sdw-mockup-match.h"
 
 static const struct snd_soc_acpi_codecs mtl_max98357a_amp = {
@@ -89,6 +90,16 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_machines[] = {
 		.quirk_data = &mtl_rt5650_amp,
 		.sof_tplg_filename = "sof-mtl-rt5650.tplg",
 	},
+	/* place boards for each headphone codec: sof driver will complete the
+	 * tplg name and machine driver will detect the amp type
+	 */
+	{
+		.id = NAU8825_ACPI_HID,
+		.drv_name = "mtl_nau8825_def",
+		.sof_tplg_filename = "sof-mtl", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
+					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
+	},
 	/* place amp-only boards in the end of table */
 	{
 		.id = "INTC10B0",
-- 
2.40.1

