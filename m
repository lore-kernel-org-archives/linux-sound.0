Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8034A1E
	for <linux-sound@vger.kernel.org>; Thu,  9 May 2024 16:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715272470; cv=none; b=SsPXRn0h0IB5KVClBN/Hi4aWHY4Ivr/N7RN/35gGWF8iJhIMlI6aI/fHRvfu1eelySEBrg3rK+Bo5YxTPJgmJPvg5Mwv9R0O8QDb6Mfkkijz9Bp/q8mldPXBzzgii3AUHWRIZQ5/pO1+rrYkFK3Psct1jmxtXLGG2hpQ3uZRNdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715272470; c=relaxed/simple;
	bh=2X1+p3nPIqEpE7NVJ9g7nnodLkLO3UoeD6NRAMiKBlw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Yo3WZ+NtlwM7VpyZfLuST4MkXpuCYTZvliysIsch1BNMSguM5x6MR8NStoRY1CyFoMfozy3g8VavAqjAPuL4o6y3T7U9/b10OaDbdkqrKJNtfEf6WC10pIl3PxgQqyMjLvrwnZxDwtABVlDoZOvRD2D5s/N3dolsGzLLQNDGVVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LuC+x76F; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LuC+x76F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715272469; x=1746808469;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2X1+p3nPIqEpE7NVJ9g7nnodLkLO3UoeD6NRAMiKBlw=;
  b=LuC+x76FJar7gm3xaKRkW99fQARE+665+Puv1zGg8f0tprbFol7j+qSx
   Qsvx/b80WfvWpX+fGAE/Yydf73L6HqT+PkrJWr1zsVpXLVNX1RChvmYTc
   bSex+CZJpxzJh9fqi7YSJYf7p/NlwZO8i/K8/dgxI1xFB47iXgv++Ct3p
   DgEcbKFKVcs0+1OUjB6NYsH1NHIGNmVmfAOvSU5bEoC9pu2rI05dpLJhD
   DWDptokCIfGJQvtyHihlzIRUFZOMHTty/O+rDGjDWCKuZFbOGjXmdxB9y
   VRboB9sdbP44zyzubLAYqPHy5FULdJqsiKlXCjy3J7su3HEF1aKZpMFfZ
   Q==;
X-CSE-ConnectionGUID: TQs9fleJSECMr4SN1IHCzw==
X-CSE-MsgGUID: oyrb2wMoSh6CM81waWuNug==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15017524"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="15017524"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:34:27 -0700
X-CSE-ConnectionGUID: BYIl/HQ2QoCnmYWkuJ0Qxw==
X-CSE-MsgGUID: HmB3W08MQdScw/S4/zTSKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="33760982"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.213.181.85])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:34:26 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 03/18] ASoC: Intel: sof_rt5682: board id cleanup for mtl boards
Date: Thu,  9 May 2024 11:34:03 -0500
Message-Id: <20240509163418.67746-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
References: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Since mtl chromebook is using DMI quirk for board config, changing the
SSP port config of mtl_rt5682_def to RVP to simplify mtl board id and
enumeration table.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c           | 20 +++-------------
 .../intel/common/soc-acpi-intel-mtl-match.c   | 24 -------------------
 2 files changed, 3 insertions(+), 41 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 5a189c165e2d..3dc373855a58 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -865,26 +865,12 @@ static const struct platform_device_id board_ids[] = {
 					/* SSP 0 and SSP 2 are used for HDMI IN */
 					SOF_SSP_MASK_HDMI_CAPTURE(0x5)),
 	},
-	{
-		.name = "mtl_mx98357_rt5682",
-		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_SSP_PORT_CODEC(0) |
-					SOF_SSP_PORT_AMP(1) |
-					SOF_SSP_PORT_BT_OFFLOAD(2) |
-					SOF_BT_OFFLOAD_PRESENT),
-	},
-	{
-		.name = "mtl_mx98360_rt5682",
-		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_SSP_PORT_CODEC(0) |
-					SOF_SSP_PORT_AMP(1)),
-	},
 	{
 		.name = "mtl_rt5682_def",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_SSP_PORT_CODEC(2) |
-					SOF_SSP_PORT_AMP(0) |
-					SOF_SSP_PORT_BT_OFFLOAD(1) |
+					SOF_SSP_PORT_CODEC(0) |
+					SOF_SSP_PORT_AMP(1) |
+					SOF_SSP_PORT_BT_OFFLOAD(2) |
 					SOF_BT_OFFLOAD_PRESENT),
 	},
 	{ }
diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 4eeec0bc92dc..0bff91317768 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -11,16 +11,6 @@
 #include <sound/soc-acpi-intel-ssp-common.h>
 #include "soc-acpi-intel-sdw-mockup-match.h"
 
-static const struct snd_soc_acpi_codecs mtl_max98357a_amp = {
-	.num_codecs = 1,
-	.codecs = {"MX98357A"}
-};
-
-static const struct snd_soc_acpi_codecs mtl_max98360a_amp = {
-	.num_codecs = 1,
-	.codecs = {"MX98360A"}
-};
-
 static const struct snd_soc_acpi_codecs mtl_rt5682_rt5682s_hp = {
 	.num_codecs = 2,
 	.codecs = {RT5682_ACPI_HID, RT5682S_ACPI_HID},
@@ -37,20 +27,6 @@ static const struct snd_soc_acpi_codecs mtl_lt6911_hdmi = {
 };
 
 struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_machines[] = {
-	{
-		.comp_ids = &mtl_rt5682_rt5682s_hp,
-		.drv_name = "mtl_mx98357_rt5682",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &mtl_max98357a_amp,
-		.sof_tplg_filename = "sof-mtl-max98357a-rt5682.tplg",
-	},
-	{
-		.comp_ids = &mtl_rt5682_rt5682s_hp,
-		.drv_name = "mtl_mx98360_rt5682",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &mtl_max98360a_amp,
-		.sof_tplg_filename = "sof-mtl-max98360a-rt5682.tplg",
-	},
 	{
 		.comp_ids = &mtl_essx_83x6,
 		.drv_name = "mtl_es83x6_c1_h02",
-- 
2.40.1

