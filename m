Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B7B131189
	for <linux-sound@vger.kernel.org>; Wed, 27 Mar 2024 16:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711556671; cv=none; b=MXp07aOOx3qI3gDCpKWZncFHv5cx6gSoAQgKzlMzAPABxKnu7wu8vwpAZ+yEIbD12tJpA5IVyd/2NbNX/x2cqQeenirRewvhcqmLXhiBxxhV/MRi7TUBSTtyHn6oHz+N28YROo8Wxwgdy8rLh9vg1qrOQGAzng+g/Vl4iqiQ3OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711556671; c=relaxed/simple;
	bh=E/Sw6yfNhO+wiLFHbAf7k9G0lNRo/XtctqLltSqgEeQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d4DabXZ4qh8gzfxuJZ5xJ4AgHbcJian9bEXb60WqOEV9pDkazaXp8qKZTSDCxKcanLFcNGIKz4oCitoEWVLH3VpBbnSlrSxcoULOawmr6ZqCLSt+3N6aiwF5UCygbh+5bsSfXeHUjFK4FMUzPUud8ux9FFFjPRvCJScbM9Nknqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mZEtUc/K; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mZEtUc/K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711556670; x=1743092670;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E/Sw6yfNhO+wiLFHbAf7k9G0lNRo/XtctqLltSqgEeQ=;
  b=mZEtUc/K29XvXpK9vmCS5L8btuIWGLXTrcvBC+jXFn8QI7c9uOYUPKxy
   cTTxvGftnGcBeDjQxtgS3yXi7s97suQGmBsP6xZJoRaYNXrKUjVZC0tkX
   rRwVLWrJH19JQbsQxyxlh2ZaJVewFN7Eiauk99FI+6NKicZZI+w5fXUUR
   7z8k7etl7eiarVCpDeCh7VqY1X4yet5KuG59ez0b38SdsnpxFDjfBfzd9
   2/1fPNfxHOrAHcfnBXlaFYhpy2Ty86+iQDltOTQqAcgPq2RM6ZexIaOJd
   aVFch2jtG525K4qjS9guKBgbIqOFz57Cn3LO/qOjOLUAWrqTJ7QVycsOn
   Q==;
X-CSE-ConnectionGUID: 4vjLAeP5RJaz49qXpAuTzg==
X-CSE-MsgGUID: gBwUhVAbQL6tfT9LBYZqNQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17221502"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="17221502"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 09:24:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="53821271"
Received: from ssherman-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.117.1])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 09:24:29 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 05/18] ASoC: Intel: ssp-common: delete module
Date: Wed, 27 Mar 2024 11:23:55 -0500
Message-Id: <20240327162408.63953-6-pierre-louis.bossart@linux.intel.com>
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

Moving all code to snd-soc-acpi-intel-match module and remove the
snd-soc-acpi-intel-ssp-common module.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/Kconfig                            |  6 ------
 sound/soc/intel/boards/Kconfig                     | 10 +++++-----
 sound/soc/intel/boards/sof_board_helpers.c         |  2 +-
 sound/soc/intel/common/Makefile                    |  5 ++---
 sound/soc/intel/common/soc-acpi-intel-ssp-common.c |  6 +++---
 5 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index e17d1a517567..4b9e498e3303 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -197,12 +197,6 @@ config SND_SOC_ACPI_INTEL_MATCH
 	# this option controls the compilation of ACPI matching tables and
 	# helpers and is not meant to be selected by the user.
 
-config SND_SOC_ACPI_INTEL_SSP_COMMON
-	tristate
-	select SND_SOC_ACPI if ACPI
-	# this option provides helpers to detect codec type and is not meant
-	# to be selected by the user.
-
 endif ## SND_SOC_INTEL_SST_TOPLEVEL || SND_SOC_SOF_INTEL_TOPLEVEL
 
 config SND_SOC_INTEL_KEEMBAY
diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 4d6ef68da130..9f4a85513702 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -500,7 +500,7 @@ config SND_SOC_INTEL_SOF_RT5682_MACH
 	select SND_SOC_INTEL_SOF_BOARD_HELPERS
 	select SND_SOC_INTEL_SOF_MAXIM_COMMON
 	select SND_SOC_INTEL_SOF_REALTEK_COMMON
-	select SND_SOC_ACPI_INTEL_SSP_COMMON
+	select SND_SOC_ACPI_INTEL_MATCH
 	help
 	   This adds support for ASoC machine driver for SOF platforms
 	   with rt5650 or rt5682 codec.
@@ -518,7 +518,7 @@ config SND_SOC_INTEL_SOF_CS42L42_MACH
 	select SND_SOC_INTEL_HDA_DSP_COMMON
 	select SND_SOC_INTEL_SOF_BOARD_HELPERS
 	select SND_SOC_INTEL_SOF_MAXIM_COMMON
-	select SND_SOC_ACPI_INTEL_SSP_COMMON
+	select SND_SOC_ACPI_INTEL_MATCH
 	help
 	   This adds support for ASoC machine driver for SOF platforms
 	   with cs42l42 codec.
@@ -571,7 +571,7 @@ config SND_SOC_INTEL_SOF_NAU8825_MACH
 	select SND_SOC_INTEL_SOF_MAXIM_COMMON
 	select SND_SOC_INTEL_SOF_NUVOTON_COMMON
 	select SND_SOC_INTEL_SOF_REALTEK_COMMON
-	select SND_SOC_ACPI_INTEL_SSP_COMMON
+	select SND_SOC_ACPI_INTEL_MATCH
 	help
 	   This adds support for ASoC machine driver for SOF platforms
 	   with nau8825 codec.
@@ -623,7 +623,7 @@ config SND_SOC_INTEL_SOF_DA7219_MACH
 	select SND_SOC_DMIC
 	select SND_SOC_INTEL_SOF_BOARD_HELPERS
 	select SND_SOC_INTEL_SOF_MAXIM_COMMON
-	select SND_SOC_ACPI_INTEL_SSP_COMMON
+	select SND_SOC_ACPI_INTEL_MATCH
 	help
 	  This adds support for ASoC machine driver for SOF platforms
 	  with Dialog DA7219 I2S audio codec.
@@ -643,7 +643,7 @@ config SND_SOC_INTEL_SOF_SSP_AMP_MACH
 	select SND_SOC_INTEL_SOF_BOARD_HELPERS
 	select SND_SOC_INTEL_SOF_REALTEK_COMMON
 	select SND_SOC_INTEL_SOF_CIRRUS_COMMON
-	select SND_SOC_ACPI_INTEL_SSP_COMMON
+	select SND_SOC_ACPI_INTEL_MATCH
 	help
 	   This adds support for ASoC machine driver for SOF platforms
 	   with RT1308/CS35L41 I2S audio codec.
diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
index ba5be5423626..eb140e13153f 100644
--- a/sound/soc/intel/boards/sof_board_helpers.c
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -635,4 +635,4 @@ MODULE_DESCRIPTION("ASoC Intel SOF Machine Driver Board Helpers");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
-MODULE_IMPORT_NS(SND_SOC_ACPI_INTEL_SSP_COMMON);
+MODULE_IMPORT_NS(SND_SOC_ACPI_INTEL_MATCH);
diff --git a/sound/soc/intel/common/Makefile b/sound/soc/intel/common/Makefile
index dcd552d815a2..a86457674726 100644
--- a/sound/soc/intel/common/Makefile
+++ b/sound/soc/intel/common/Makefile
@@ -15,8 +15,7 @@ snd-soc-acpi-intel-match-objs := soc-acpi-intel-byt-match.o soc-acpi-intel-cht-m
 	soc-acpi-intel-hda-match.o \
 	soc-acpi-intel-sdw-mockup-match.o
 
+snd-soc-acpi-intel-match-objs += soc-acpi-intel-ssp-common.o
+
 obj-$(CONFIG_SND_SOC_INTEL_SST) += snd-soc-sst-dsp.o snd-soc-sst-ipc.o
 obj-$(CONFIG_SND_SOC_ACPI_INTEL_MATCH) += snd-soc-acpi-intel-match.o
-
-snd-soc-acpi-intel-ssp-common-objs += soc-acpi-intel-ssp-common.o
-obj-$(CONFIG_SND_SOC_ACPI_INTEL_SSP_COMMON) += snd-soc-acpi-intel-ssp-common.o
diff --git a/sound/soc/intel/common/soc-acpi-intel-ssp-common.c b/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
index 40b68c20a12a..68da7260fb1d 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
@@ -79,7 +79,7 @@ snd_soc_acpi_intel_detect_codec_type(struct device *dev)
 
 	return CODEC_NONE;
 }
-EXPORT_SYMBOL_NS(snd_soc_acpi_intel_detect_codec_type, SND_SOC_ACPI_INTEL_SSP_COMMON);
+EXPORT_SYMBOL_NS(snd_soc_acpi_intel_detect_codec_type, SND_SOC_ACPI_INTEL_MATCH);
 
 enum snd_soc_acpi_intel_codec
 snd_soc_acpi_intel_detect_amp_type(struct device *dev)
@@ -96,7 +96,7 @@ snd_soc_acpi_intel_detect_amp_type(struct device *dev)
 
 	return CODEC_NONE;
 }
-EXPORT_SYMBOL_NS(snd_soc_acpi_intel_detect_amp_type, SND_SOC_ACPI_INTEL_SSP_COMMON);
+EXPORT_SYMBOL_NS(snd_soc_acpi_intel_detect_amp_type, SND_SOC_ACPI_INTEL_MATCH);
 
 const char *
 snd_soc_acpi_intel_get_codec_name(enum snd_soc_acpi_intel_codec codec_type)
@@ -118,7 +118,7 @@ snd_soc_acpi_intel_get_codec_name(enum snd_soc_acpi_intel_codec codec_type)
 
 	return NULL;
 }
-EXPORT_SYMBOL_NS(snd_soc_acpi_intel_get_codec_name, SND_SOC_ACPI_INTEL_SSP_COMMON);
+EXPORT_SYMBOL_NS(snd_soc_acpi_intel_get_codec_name, SND_SOC_ACPI_INTEL_MATCH);
 
 MODULE_DESCRIPTION("ASoC Intel SOF Common Machine Driver Helpers");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
-- 
2.40.1

