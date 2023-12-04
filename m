Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mHF/zEnG"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC1B1C0
	for <linux-sound@vger.kernel.org>; Mon,  4 Dec 2023 13:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701726134; x=1733262134;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=18hu0EBPhTcqo5ALQXuPs9CkYpm0C0n1RB+um6aIs6Q=;
  b=mHF/zEnG82saTu5ftnO0EODp5ueGOBxNqsNcfQSEq2/s6HYcaksqV3PI
   7nI9/XYTxFCqnA2URDvvdMY5gG+u4oOEuI3IkzpfQ6zMCFNR2GFcGxStN
   7GSXsCBrgYH8MIP6rwcs2bc4aHfNHWyrW+GUD1fVOBhK4QCy/Ys8XKfEl
   IG8PXsIHgfgckKEoTxz3ieuIzsfH0D+L+zx20LNE+rNWkCESmNGYnE/It
   LIXe2CFEUl6nZVU8i7X9b/YpJQedBzIT0wGsfR4mNzbCKrd0h69230EV6
   fMP1u/raJ/+ZWiI6+mQgDdcVs4YNhx5SkCZpZQrLFcFVGn2fGMdtWE+wI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="859811"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="859811"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 13:42:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="764104371"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="764104371"
Received: from akashams-mobl.amr.corp.intel.com (HELO pbossart-mobl3.lan) ([10.255.231.189])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 13:42:11 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 1/5] ASoC: Intel: sof_nau8825: board id cleanup for adl boards
Date: Mon,  4 Dec 2023 15:41:56 -0600
Message-Id: <20231204214200.203100-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204214200.203100-1-pierre-louis.bossart@linux.intel.com>
References: <20231204214200.203100-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Many board configs are duplicated since codec and amplifier type are
removed from board quirk. Introduce "adl_nau8825_def" board to reduce
the number of adl board configs.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_nau8825.c          | 28 +------------------
 .../intel/common/soc-acpi-intel-adl-match.c   |  8 +++---
 2 files changed, 5 insertions(+), 31 deletions(-)

diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
index 15ea6732ff94..eb3813400593 100644
--- a/sound/soc/intel/boards/sof_nau8825.c
+++ b/sound/soc/intel/boards/sof_nau8825.c
@@ -353,33 +353,7 @@ static const struct platform_device_id board_ids[] = {
 					SOF_NAU8825_NUM_HDMIDEV(4)),
 	},
 	{
-		.name = "adl_max98373_8825",
-		.driver_data = (kernel_ulong_t)(SOF_NAU8825_SSP_CODEC(0) |
-					SOF_NAU8825_SSP_AMP(1) |
-					SOF_NAU8825_NUM_HDMIDEV(4) |
-					SOF_BT_OFFLOAD_SSP(2) |
-					SOF_SSP_BT_OFFLOAD_PRESENT),
-	},
-	{
-		/* The limitation of length of char array, shorten the name */
-		.name = "adl_mx98360a_8825",
-		.driver_data = (kernel_ulong_t)(SOF_NAU8825_SSP_CODEC(0) |
-					SOF_NAU8825_SSP_AMP(1) |
-					SOF_NAU8825_NUM_HDMIDEV(4) |
-					SOF_BT_OFFLOAD_SSP(2) |
-					SOF_SSP_BT_OFFLOAD_PRESENT),
-
-	},
-	{
-		.name = "adl_rt1015p_8825",
-		.driver_data = (kernel_ulong_t)(SOF_NAU8825_SSP_CODEC(0) |
-					SOF_NAU8825_SSP_AMP(1) |
-					SOF_NAU8825_NUM_HDMIDEV(4) |
-					SOF_BT_OFFLOAD_SSP(2) |
-					SOF_SSP_BT_OFFLOAD_PRESENT),
-	},
-	{
-		.name = "adl_nau8318_8825",
+		.name = "adl_nau8825_def",
 		.driver_data = (kernel_ulong_t)(SOF_NAU8825_SSP_CODEC(0) |
 					SOF_NAU8825_SSP_AMP(1) |
 					SOF_NAU8825_NUM_HDMIDEV(4) |
diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index 6e712ad954c8..d3d913458c60 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -528,14 +528,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 	},
 	{
 		.id = "10508825",
-		.drv_name = "adl_max98373_8825",
+		.drv_name = "adl_nau8825_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &adl_max98373_amp,
 		.sof_tplg_filename = "sof-adl-max98373-nau8825.tplg",
 	},
 	{
 		.id = "10508825",
-		.drv_name = "adl_mx98360a_8825",
+		.drv_name = "adl_nau8825_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &adl_max98360a_amp,
 		.sof_tplg_filename = "sof-adl-max98360a-nau8825.tplg",
@@ -549,14 +549,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 	},
 	{
 		.id = "10508825",
-		.drv_name = "adl_rt1015p_8825",
+		.drv_name = "adl_nau8825_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &adl_rt1015p_amp,
 		.sof_tplg_filename = "sof-adl-rt1015-nau8825.tplg",
 	},
 	{
 		.id = "10508825",
-		.drv_name = "adl_nau8318_8825",
+		.drv_name = "adl_nau8825_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &adl_nau8318_amp,
 		.sof_tplg_filename = "sof-adl-nau8318-nau8825.tplg",
-- 
2.39.2

