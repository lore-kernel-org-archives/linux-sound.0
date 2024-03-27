Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E5C130E3C
	for <linux-sound@vger.kernel.org>; Wed, 27 Mar 2024 16:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711556676; cv=none; b=J7k52KTzlZf/fl3LZ1XBXx4b/4YWbu7TEHu7+JsGgK+2PaaREedwrBtrMievAU8R7uK2mWfrrjRqKEDoYvjM+A7LosNl3C6oloZAg8AL5ohT+z7wtSrXClHuFp66iZJi/ymgOEGijWb1QbHIjFqlZKPaicxsDFPURq6NfJIs6SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711556676; c=relaxed/simple;
	bh=9NGDWNO1OYr4eGh4Ij3kYUinuMCScDfWokDYzAgk5RI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m8wyWw2BNTaLNM+umDY+VIvgCil5xHcfPe3zjT8N6qmFxj6zAH/ei2zttK6CRMeSxnzzp0xZoYo9yaJqvDoVsXwIksVQKjkuc8hX0+hGHqoczH0GV6VLETWd56vQh9loMKWBZk20O9XQA9VkqquNAXVw22urXuyYVmGk2owf/iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iO3Xvc+Y; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iO3Xvc+Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711556676; x=1743092676;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9NGDWNO1OYr4eGh4Ij3kYUinuMCScDfWokDYzAgk5RI=;
  b=iO3Xvc+YbTmzuMUbvOnlXIxlzbpZe8jcI0Ozw+TFZAd0JPP4n1n8uKYS
   8ZIun17CaRdxJ7eW6yaOfaYdnxZ7sKU1fRMuiubSGUogmo6Dm3D0Gn/wz
   xI6XG8W6NKuNXaX9/MO42oVBYeQ50Xur0UpoEW2dyFwYaF5lXSbzjMEIY
   Bgxx9O/7IZoEmxbsnymG/2OnvD/8eSjWR+OrYlmbCd+oxHJbEyVMNaz4w
   cwpQVCikW5yxhCcQLcLEva0+eGzk4q6WTrAdo5xc20AH/Dx2SyHPxlFdg
   dAGgWckqVlfepXBsSzYztacnkH39FLDHxKzJ8DbxSp9+1oJRA9t0+MP5X
   g==;
X-CSE-ConnectionGUID: G7xWs66XQuemimg9F3xMag==
X-CSE-MsgGUID: nYNpoygJQvimgIZVY5I7QA==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17221538"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="17221538"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 09:24:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="53821309"
Received: from ssherman-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.117.1])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 09:24:33 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 11/18] ASoC: Intel: sof_rt5682: mach cleanup for tgl boards
Date: Wed, 27 Mar 2024 11:24:01 -0500
Message-Id: <20240327162408.63953-12-pierre-louis.bossart@linux.intel.com>
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

Add a common entry in enumeration table for all rt5682 boards
with/without speaker amplifier. All other tgl_rt5682_def entries
become redundant so get removed.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-tgl-match.c   | 50 +++++--------------
 1 file changed, 13 insertions(+), 37 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index 77226d1eb1cf..161ba532d270 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -8,6 +8,7 @@
 
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
+#include <sound/soc-acpi-intel-ssp-common.h>
 #include "soc-acpi-intel-sdw-mockup-match.h"
 
 static const struct snd_soc_acpi_codecs essx_83x6 = {
@@ -15,11 +16,6 @@ static const struct snd_soc_acpi_codecs essx_83x6 = {
 	.codecs = { "ESSX8316", "ESSX8326", "ESSX8336"},
 };
 
-static const struct snd_soc_acpi_codecs tgl_codecs = {
-	.num_codecs = 1,
-	.codecs = {"MX98357A"}
-};
-
 static const struct snd_soc_acpi_endpoint single_endpoint = {
 	.num = 0,
 	.aggregated = 0,
@@ -499,19 +495,9 @@ static const struct snd_soc_acpi_link_adr tgl_cs42l43_cs35l56[] = {
 	{}
 };
 
-static const struct snd_soc_acpi_codecs tgl_max98373_amp = {
-	.num_codecs = 1,
-	.codecs = {"MX98373"}
-};
-
-static const struct snd_soc_acpi_codecs tgl_rt1011_amp = {
-	.num_codecs = 1,
-	.codecs = {"10EC1011"}
-};
-
 static const struct snd_soc_acpi_codecs tgl_rt5682_rt5682s_hp = {
 	.num_codecs = 2,
-	.codecs = {"10EC5682", "RTL5682"},
+	.codecs = {RT5682_ACPI_HID, RT5682S_ACPI_HID},
 };
 
 static const struct snd_soc_acpi_codecs tgl_lt6911_hdmi = {
@@ -520,27 +506,6 @@ static const struct snd_soc_acpi_codecs tgl_lt6911_hdmi = {
 };
 
 struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_machines[] = {
-	{
-		.comp_ids = &tgl_rt5682_rt5682s_hp,
-		.drv_name = "tgl_rt5682_def",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &tgl_codecs,
-		.sof_tplg_filename = "sof-tgl-max98357a-rt5682.tplg",
-	},
-	{
-		.comp_ids = &tgl_rt5682_rt5682s_hp,
-		.drv_name = "tgl_rt5682_def",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &tgl_max98373_amp,
-		.sof_tplg_filename = "sof-tgl-max98373-rt5682.tplg",
-	},
-	{
-		.comp_ids = &tgl_rt5682_rt5682s_hp,
-		.drv_name = "tgl_rt5682_def",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &tgl_rt1011_amp,
-		.sof_tplg_filename = "sof-tgl-rt1011-rt5682.tplg",
-	},
 	{
 		.comp_ids = &essx_83x6,
 		.drv_name = "sof-essx8336",
@@ -549,6 +514,17 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_machines[] = {
 					SND_SOC_ACPI_TPLG_INTEL_SSP_MSB |
 					SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER,
 	},
+	/* place boards for each headphone codec: sof driver will complete the
+	 * tplg name and machine driver will detect the amp type
+	 */
+	{
+		.comp_ids = &tgl_rt5682_rt5682s_hp,
+		.drv_name = "tgl_rt5682_def",
+		.sof_tplg_filename = "sof-tgl", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
+					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
+	},
+	/* place amp-only boards in the end of table */
 	{
 		.id = "10EC1308",
 		.drv_name = "tgl_rt1308_hdmi_ssp",
-- 
2.40.1

