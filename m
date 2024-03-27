Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8342C130E3C
	for <linux-sound@vger.kernel.org>; Wed, 27 Mar 2024 16:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711556671; cv=none; b=BCUJryJn0yrUsf5oCX9i4UfPxsHt87kd+ISqvN7/16CAU8Pp3AdKojSY/Ns4y39WQ8v4ibCThFsGVJDQoMfccu/w8X+x41wfWfx4DhsiWFomU29eqk5AX63am1ZyZgrCDj4qO+LYjDvig5tEHwcfI+pb2B+QeOqzfHp3zTu34o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711556671; c=relaxed/simple;
	bh=yDo56YJ3v65nLiVuWN5tkYux0pyhJETH/nfYDD7sK1k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ttAf8V1fel7lZOdpylVsxRelUv6aaIaRyVeRItn3zdAjyTC4hM/YN6m9ZQAqsn4XzZDc2MBGpxUcvCLt/VxesNJRA4ma6k1eQiH15TXKgYaTAe3l0jPVuC+4I31EliRC85/m9WGhwK4cDwZ+17ebpVPriBMyBjbKk3Y/QGDNU+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FUK7eq+D; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FUK7eq+D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711556670; x=1743092670;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yDo56YJ3v65nLiVuWN5tkYux0pyhJETH/nfYDD7sK1k=;
  b=FUK7eq+DRO81wfYFGlIr9vTeJWhHukzEfNwRp6iYdaIpf5h9IqXUOuiS
   7KrdX5gmjFvN2YObFMmv+C+FonF7+uCvSjjSZHKIuW2LJTjClD8Pr/INe
   W91GTKeS0PYEIx1pMV5qInKtfyynrm1cxeG6GNI3Iu7TroHCEkLvT+aOu
   RiR0UO9fcgf8yFdWLLBuzqx2BztIkmDmsAkrKVXeaqabCwHm5a4aH+uo9
   56h1jevQSdDXIuN3ojwj9QSzM3MgbpnB+zl8KeZx+4X2NA+d+2CLhNA/Z
   Ooh851nKB4keKx+u9LaaK6R2hZYcPoarPCI4sU2H1jIn3AkvQ+BeaQox3
   A==;
X-CSE-ConnectionGUID: 2Rrrsv5YSTmcNvrDpT6S5Q==
X-CSE-MsgGUID: drvcnkKZRg2pDb37+LZFQQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17221496"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="17221496"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 09:24:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="53821266"
Received: from ssherman-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.117.1])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 09:24:28 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 04/18] ASoC: Intel: ssp-common: module name change
Date: Wed, 27 Mar 2024 11:23:54 -0500
Message-Id: <20240327162408.63953-5-pierre-louis.bossart@linux.intel.com>
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

As we applied new naming convention to functions and structures,
changing module name as well to reflect the new naming.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/Kconfig                            |  6 ++++++
 sound/soc/intel/boards/Kconfig                     | 13 +++++--------
 sound/soc/intel/boards/sof_board_helpers.c         |  2 +-
 sound/soc/intel/common/Makefile                    |  4 ++--
 sound/soc/intel/common/soc-acpi-intel-ssp-common.c |  6 +++---
 5 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index 4b9e498e3303..e17d1a517567 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -197,6 +197,12 @@ config SND_SOC_ACPI_INTEL_MATCH
 	# this option controls the compilation of ACPI matching tables and
 	# helpers and is not meant to be selected by the user.
 
+config SND_SOC_ACPI_INTEL_SSP_COMMON
+	tristate
+	select SND_SOC_ACPI if ACPI
+	# this option provides helpers to detect codec type and is not meant
+	# to be selected by the user.
+
 endif ## SND_SOC_INTEL_SST_TOPLEVEL || SND_SOC_SOF_INTEL_TOPLEVEL
 
 config SND_SOC_INTEL_KEEMBAY
diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index b7a6ac4b6c0c..4d6ef68da130 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -41,9 +41,6 @@ config SND_SOC_INTEL_SOF_CIRRUS_COMMON
 config SND_SOC_INTEL_SOF_NUVOTON_COMMON
 	tristate
 
-config SND_SOC_INTEL_SOF_SSP_COMMON
-	tristate
-
 config SND_SOC_INTEL_SOF_BOARD_HELPERS
 	tristate
 
@@ -503,7 +500,7 @@ config SND_SOC_INTEL_SOF_RT5682_MACH
 	select SND_SOC_INTEL_SOF_BOARD_HELPERS
 	select SND_SOC_INTEL_SOF_MAXIM_COMMON
 	select SND_SOC_INTEL_SOF_REALTEK_COMMON
-	select SND_SOC_INTEL_SOF_SSP_COMMON
+	select SND_SOC_ACPI_INTEL_SSP_COMMON
 	help
 	   This adds support for ASoC machine driver for SOF platforms
 	   with rt5650 or rt5682 codec.
@@ -521,7 +518,7 @@ config SND_SOC_INTEL_SOF_CS42L42_MACH
 	select SND_SOC_INTEL_HDA_DSP_COMMON
 	select SND_SOC_INTEL_SOF_BOARD_HELPERS
 	select SND_SOC_INTEL_SOF_MAXIM_COMMON
-	select SND_SOC_INTEL_SOF_SSP_COMMON
+	select SND_SOC_ACPI_INTEL_SSP_COMMON
 	help
 	   This adds support for ASoC machine driver for SOF platforms
 	   with cs42l42 codec.
@@ -574,7 +571,7 @@ config SND_SOC_INTEL_SOF_NAU8825_MACH
 	select SND_SOC_INTEL_SOF_MAXIM_COMMON
 	select SND_SOC_INTEL_SOF_NUVOTON_COMMON
 	select SND_SOC_INTEL_SOF_REALTEK_COMMON
-	select SND_SOC_INTEL_SOF_SSP_COMMON
+	select SND_SOC_ACPI_INTEL_SSP_COMMON
 	help
 	   This adds support for ASoC machine driver for SOF platforms
 	   with nau8825 codec.
@@ -626,7 +623,7 @@ config SND_SOC_INTEL_SOF_DA7219_MACH
 	select SND_SOC_DMIC
 	select SND_SOC_INTEL_SOF_BOARD_HELPERS
 	select SND_SOC_INTEL_SOF_MAXIM_COMMON
-	select SND_SOC_INTEL_SOF_SSP_COMMON
+	select SND_SOC_ACPI_INTEL_SSP_COMMON
 	help
 	  This adds support for ASoC machine driver for SOF platforms
 	  with Dialog DA7219 I2S audio codec.
@@ -646,7 +643,7 @@ config SND_SOC_INTEL_SOF_SSP_AMP_MACH
 	select SND_SOC_INTEL_SOF_BOARD_HELPERS
 	select SND_SOC_INTEL_SOF_REALTEK_COMMON
 	select SND_SOC_INTEL_SOF_CIRRUS_COMMON
-	select SND_SOC_INTEL_SOF_SSP_COMMON
+	select SND_SOC_ACPI_INTEL_SSP_COMMON
 	help
 	   This adds support for ASoC machine driver for SOF platforms
 	   with RT1308/CS35L41 I2S audio codec.
diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
index 8819ab5694bf..ba5be5423626 100644
--- a/sound/soc/intel/boards/sof_board_helpers.c
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -635,4 +635,4 @@ MODULE_DESCRIPTION("ASoC Intel SOF Machine Driver Board Helpers");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
-MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_SSP_COMMON);
+MODULE_IMPORT_NS(SND_SOC_ACPI_INTEL_SSP_COMMON);
diff --git a/sound/soc/intel/common/Makefile b/sound/soc/intel/common/Makefile
index 15c8a64368c5..dcd552d815a2 100644
--- a/sound/soc/intel/common/Makefile
+++ b/sound/soc/intel/common/Makefile
@@ -18,5 +18,5 @@ snd-soc-acpi-intel-match-objs := soc-acpi-intel-byt-match.o soc-acpi-intel-cht-m
 obj-$(CONFIG_SND_SOC_INTEL_SST) += snd-soc-sst-dsp.o snd-soc-sst-ipc.o
 obj-$(CONFIG_SND_SOC_ACPI_INTEL_MATCH) += snd-soc-acpi-intel-match.o
 
-snd-soc-intel-sof-ssp-common-objs += soc-acpi-intel-ssp-common.o
-obj-$(CONFIG_SND_SOC_INTEL_SOF_SSP_COMMON) += snd-soc-intel-sof-ssp-common.o
+snd-soc-acpi-intel-ssp-common-objs += soc-acpi-intel-ssp-common.o
+obj-$(CONFIG_SND_SOC_ACPI_INTEL_SSP_COMMON) += snd-soc-acpi-intel-ssp-common.o
diff --git a/sound/soc/intel/common/soc-acpi-intel-ssp-common.c b/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
index 716243a4fc9a..40b68c20a12a 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
@@ -79,7 +79,7 @@ snd_soc_acpi_intel_detect_codec_type(struct device *dev)
 
 	return CODEC_NONE;
 }
-EXPORT_SYMBOL_NS(snd_soc_acpi_intel_detect_codec_type, SND_SOC_INTEL_SOF_SSP_COMMON);
+EXPORT_SYMBOL_NS(snd_soc_acpi_intel_detect_codec_type, SND_SOC_ACPI_INTEL_SSP_COMMON);
 
 enum snd_soc_acpi_intel_codec
 snd_soc_acpi_intel_detect_amp_type(struct device *dev)
@@ -96,7 +96,7 @@ snd_soc_acpi_intel_detect_amp_type(struct device *dev)
 
 	return CODEC_NONE;
 }
-EXPORT_SYMBOL_NS(snd_soc_acpi_intel_detect_amp_type, SND_SOC_INTEL_SOF_SSP_COMMON);
+EXPORT_SYMBOL_NS(snd_soc_acpi_intel_detect_amp_type, SND_SOC_ACPI_INTEL_SSP_COMMON);
 
 const char *
 snd_soc_acpi_intel_get_codec_name(enum snd_soc_acpi_intel_codec codec_type)
@@ -118,7 +118,7 @@ snd_soc_acpi_intel_get_codec_name(enum snd_soc_acpi_intel_codec codec_type)
 
 	return NULL;
 }
-EXPORT_SYMBOL_NS(snd_soc_acpi_intel_get_codec_name, SND_SOC_INTEL_SOF_SSP_COMMON);
+EXPORT_SYMBOL_NS(snd_soc_acpi_intel_get_codec_name, SND_SOC_ACPI_INTEL_SSP_COMMON);
 
 MODULE_DESCRIPTION("ASoC Intel SOF Common Machine Driver Helpers");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
-- 
2.40.1

