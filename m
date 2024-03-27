Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BFC1304AD
	for <linux-sound@vger.kernel.org>; Wed, 27 Mar 2024 16:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711556675; cv=none; b=ejpEWSemIMxVrOEMgxJSIp6XhAtfO1EzqllFGGT9KhA9I+K1lMM8fVMhuWidOWU4xjou18C6PaDuToCsvWUxm0MbfVeW8xhv9HjlwVbftYWd/Nkw7sBMQfozdixmFC9uxesvs6UXU/2g0cOlCb8meshlAqjKwoIW0gy5NYmOn+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711556675; c=relaxed/simple;
	bh=bqI6k1vmLPj9eqdEJ9jrqBRuXrfpW9+m6fOT7gzV0Kw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I6Ut06n+ZHk7Pxh+0GrTdYoiTQCoK67x2hs3bVqVSMGDOlR8hephWgEKM7xV+LthQU7Sa+0LzUHfIFf2msDQ4c7oGF7Eyfl4Yx2/EQYYzBdJmh7+WpgGjTUSEi1jOoB6kyfFok7rKoTCyxuLMDkZNPnNZChPZDwarJd7pnKmOLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OSfVDTJ0; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OSfVDTJ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711556675; x=1743092675;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bqI6k1vmLPj9eqdEJ9jrqBRuXrfpW9+m6fOT7gzV0Kw=;
  b=OSfVDTJ0m3ikQKysK3Cyq2jKE+Oh0qXS6qOd7Hc1LzEGZfggQgsXl9Lc
   9zZsIWpMWDTY+AsWnB6gOT/QsBVi7xY6zP1o/7+j6iB1esPiMgGMaD9V6
   GovEfOjq9ivb14vdhAwdXAP5PVBImgTdAzAOEXevaAajetkbb75UygeiY
   Tamqyak3HvYsURrfIQowF1x0JUCpsLW6aia0Kx56TjlzISGe14qwXVAKz
   PvtCD/Od66nNQoH8QSpOmJZuAQf2gnJgYftDl9bAhErkUHBQBhlC54U9T
   w0L5POCtlDcnl74XbFEPlQoHWdhiVSpi+OLBUej8RSenhPYsKP/01qYux
   g==;
X-CSE-ConnectionGUID: XNBFtohkQu++9hgDiVJRvQ==
X-CSE-MsgGUID: w1GlPZ7aRJmxFDg9nJeqOQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17221528"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="17221528"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 09:24:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="53821300"
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
Subject: [PATCH 09/18] ASoC: Intel: sof_nau8825: mach cleanup for rpl boards
Date: Wed, 27 Mar 2024 11:23:59 -0500
Message-Id: <20240327162408.63953-10-pierre-louis.bossart@linux.intel.com>
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

Add a common entry in enumeration table for all nau8825 boards
with/without speaker amplifier. All other rpl_nau8825_def entries
become redundant so get removed.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-rpl-match.c   | 43 ++++++-------------
 1 file changed, 12 insertions(+), 31 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
index 77c917897c8d..44be9077b4e0 100644
--- a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
@@ -7,6 +7,7 @@
 
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
+#include <sound/soc-acpi-intel-ssp-common.h>
 
 static const struct snd_soc_acpi_endpoint single_endpoint = {
 	.num = 0,
@@ -365,21 +366,11 @@ static const struct snd_soc_acpi_codecs rpl_max98360a_amp = {
 	.codecs = {"MX98360A"},
 };
 
-static const struct snd_soc_acpi_codecs rpl_max98373_amp = {
-	.num_codecs = 1,
-	.codecs = {"MX98373"}
-};
-
 static const struct snd_soc_acpi_codecs rpl_lt6911_hdmi = {
 	.num_codecs = 1,
 	.codecs = {"INTC10B0"}
 };
 
-static const struct snd_soc_acpi_codecs rpl_nau8318_amp = {
-	.num_codecs = 1,
-	.codecs = {"NVTN2012"}
-};
-
 static const struct snd_soc_acpi_codecs rpl_rt1019p_amp = {
 	.num_codecs = 1,
 	.codecs = {"RTL1019"}
@@ -400,27 +391,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
 		.quirk_data = &rpl_max98360a_amp,
 		.sof_tplg_filename = "sof-rpl-max98360a-rt5682.tplg",
 	},
-	{
-		.id = "10508825",
-		.drv_name = "rpl_nau8825_def",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &rpl_max98373_amp,
-		.sof_tplg_filename = "sof-rpl-max98373-nau8825.tplg",
-	},
-	{
-		.id = "10508825",
-		.drv_name = "rpl_nau8825_def",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &rpl_max98360a_amp,
-		.sof_tplg_filename = "sof-rpl-max98360a-nau8825.tplg",
-	},
-	{
-		.id = "10508825",
-		.drv_name = "rpl_nau8825_def",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &rpl_nau8318_amp,
-		.sof_tplg_filename = "sof-rpl-nau8318-nau8825.tplg",
-	},
 	{
 		.comp_ids = &rpl_rt5682_hp,
 		.drv_name = "rpl_rt5682_def",
@@ -450,6 +420,17 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
 					SND_SOC_ACPI_TPLG_INTEL_SSP_MSB |
 					SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER,
 	},
+	/* place boards for each headphone codec: sof driver will complete the
+	 * tplg name and machine driver will detect the amp type
+	 */
+	{
+		.id = NAU8825_ACPI_HID,
+		.drv_name = "rpl_nau8825_def",
+		.sof_tplg_filename = "sof-rpl", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
+					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
+	},
+	/* place amp-only boards in the end of table */
 	{
 		.id = "INTC10B0",
 		.drv_name = "rpl_lt6911_hdmi_ssp",
-- 
2.40.1

