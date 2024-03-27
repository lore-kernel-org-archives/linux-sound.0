Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD02130AD9
	for <linux-sound@vger.kernel.org>; Wed, 27 Mar 2024 16:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711556674; cv=none; b=E+11NEI/fxXNQ9z16g30M/pSgXtTqCYxGeIzqLymWzODYbl6XWo5f4oX132Mhv1ovQksH1tRl5yBYS016kna0oQ47Nw8IO3J9+RXBTrVri61pj2BpTdK/RWQlADOoqHevbiMP4eqGECMgURauY9ItYvf5piu9oDltN88gDB+ut8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711556674; c=relaxed/simple;
	bh=7O66xi+xRTn70v7wSDGhlnfMnYCGKr0ry+FUMCrIqcA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jVzjwMIIxl1rbOmgx/AM/0WDSoApFqRy1QooOIfkhciFyRqozBojlcdA7IWQt7ReOlrmnHt9jQQ/FxGAp3C27LkjYgZRikpzgf0Y8y7c9PYFozT8gXAEuYC65ci8nNrqnoTPnyAbA3Ne/RNkpKQ92c12ICu2vnUfZhJOpvLVEkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QmuxfjI6; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QmuxfjI6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711556673; x=1743092673;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7O66xi+xRTn70v7wSDGhlnfMnYCGKr0ry+FUMCrIqcA=;
  b=QmuxfjI6D2aSR/mhwcP+L6oYW88gpO9rNO30SpXnJz7i2xmkTUQnha7E
   q71lpU0xwhjLehZnAzxlGNiDHugOBYNSakIqRAgZYNIR+Z8lXiXLtv0j0
   yUAa3gk8S6yR1b0fINtm41WlJ6n7eYagcFAIslIprP7jRlu6eIW9lEexA
   fKYrHdO4gkWQYaMw6YjNEdG2lbZoW1ZD9zpJ4yBF5iUnyOB6JpUDwMjiJ
   93PSCZQ5qbYhs3Zf0PEgNRPnXC+8QidSRXh66nV4Qb7jlkSRysaW/cgtH
   esMYi3iv/G2I0Kx7fw2debqpAOdIYGVBoUCx8qZHQBKKZQwaX+vfdX+4q
   g==;
X-CSE-ConnectionGUID: baStUrTdRqqXlVJwp33tRQ==
X-CSE-MsgGUID: r5dP1GTYTh2dpLJ8HsR5kA==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17221523"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="17221523"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 09:24:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="53821291"
Received: from ssherman-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.117.1])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 09:24:31 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 08/18] ASoC: Intel: sof_nau8825: mach cleanup for adl boards
Date: Wed, 27 Mar 2024 11:23:58 -0500
Message-Id: <20240327162408.63953-9-pierre-louis.bossart@linux.intel.com>
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
with/without speaker amplifier. All other adl_nau8825_def entries
become redundant so get removed.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-adl-match.c   | 54 ++++---------------
 1 file changed, 11 insertions(+), 43 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index 7ce8aade07d7..f8b8864b5ec6 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -7,6 +7,7 @@
 
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
+#include <sound/soc-acpi-intel-ssp-common.h>
 
 static const struct snd_soc_acpi_codecs essx_83x6 = {
 	.num_codecs = 3,
@@ -467,11 +468,6 @@ static const struct snd_soc_acpi_codecs adl_rt5682_rt5682s_hp = {
 	.codecs = {"10EC5682", "RTL5682"},
 };
 
-static const struct snd_soc_acpi_codecs adl_rt1015p_amp = {
-	.num_codecs = 1,
-	.codecs = {"RTL1015"}
-};
-
 static const struct snd_soc_acpi_codecs adl_rt1019p_amp = {
 	.num_codecs = 1,
 	.codecs = {"RTL1019"}
@@ -487,11 +483,6 @@ static const struct snd_soc_acpi_codecs adl_lt6911_hdmi = {
 	.codecs = {"INTC10B0"}
 };
 
-static const struct snd_soc_acpi_codecs adl_nau8318_amp = {
-	.num_codecs = 1,
-	.codecs = {"NVTN2012"}
-};
-
 static struct snd_soc_acpi_codecs adl_rt5650_amp = {
 	.num_codecs = 1,
 	.codecs = {"10EC5650"}
@@ -526,20 +517,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 		.quirk_data = &adl_rt1019p_amp,
 		.sof_tplg_filename = "sof-adl-rt1019-nau8825.tplg",
 	},
-	{
-		.id = "10508825",
-		.drv_name = "adl_nau8825_def",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &adl_max98373_amp,
-		.sof_tplg_filename = "sof-adl-max98373-nau8825.tplg",
-	},
-	{
-		.id = "10508825",
-		.drv_name = "adl_nau8825_def",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &adl_max98360a_amp,
-		.sof_tplg_filename = "sof-adl-max98360a-nau8825.tplg",
-	},
 	{
 		.comp_ids = &adl_rt5682_rt5682s_hp,
 		.drv_name = "adl_rt5682_def",
@@ -547,25 +524,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 		.quirk_data = &adl_rt1019p_amp,
 		.sof_tplg_filename = "sof-adl-rt1019-rt5682.tplg",
 	},
-	{
-		.id = "10508825",
-		.drv_name = "adl_nau8825_def",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &adl_rt1015p_amp,
-		.sof_tplg_filename = "sof-adl-rt1015-nau8825.tplg",
-	},
-	{
-		.id = "10508825",
-		.drv_name = "adl_nau8825_def",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &adl_nau8318_amp,
-		.sof_tplg_filename = "sof-adl-nau8318-nau8825.tplg",
-	},
-	{
-		.id = "10508825",
-		.drv_name = "adl_nau8825_def",
-		.sof_tplg_filename = "sof-adl-nau8825.tplg",
-	},
 	{
 		.comp_ids = &adl_rt5682_rt5682s_hp,
 		.drv_name = "adl_rt5682_def",
@@ -621,6 +579,16 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 		.quirk_data = &adl_max98360a_amp,
 		.sof_tplg_filename = "sof-adl-max98360a-da7219.tplg",
 	},
+	/* place boards for each headphone codec: sof driver will complete the
+	 * tplg name and machine driver will detect the amp type
+	 */
+	{
+		.id = NAU8825_ACPI_HID,
+		.drv_name = "adl_nau8825_def",
+		.sof_tplg_filename = "sof-adl", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
+					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
+	},
 	/* place amp-only boards in the end of table */
 	{
 		.id = "CSC3541",
-- 
2.40.1

