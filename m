Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MtYZ94Mj"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24DA6D3
	for <linux-sound@vger.kernel.org>; Mon,  4 Dec 2023 13:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701726134; x=1733262134;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FT9iRxoY4H2+FoNHak023U/+YoVAXB8GFVX3qq6i5CY=;
  b=MtYZ94Mj7A0BQC6qRLT5tmTkZ7kcNq+Y3w97mtx/XoT+kEyyC32yfWXg
   X1GBsjqteKkigx7Kd4m8sXg4H7NDlSqChE44N9PGnedKqEIfGY+AX8i+Z
   QkZM0y5dzeGM6YWh/bKxIdHgmy9h5GCZdQtIl/ZfN8fkDwWs7YcmkGyGt
   LlhhsUlYrZ764oitpGZDAJNqfhBJSIzrZiLRvL+Jc0M4AHJHa7BaZ1Niq
   hTlDl6QXam0MLlYzl8Czhi+dXqEgzcpkhQgo7+pKw2gC1mhIMbD3whsFg
   jXrXbwBU0jpxaeelMrKCI+RedKWdQ6oyZHaty4WI/gn8PpU1YkjpOQXfr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="859814"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="859814"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 13:42:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="764104377"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="764104377"
Received: from akashams-mobl.amr.corp.intel.com (HELO pbossart-mobl3.lan) ([10.255.231.189])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 13:42:12 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 2/5] ASoC: Intel: sof_nau8825: board id cleanup for rpl boards
Date: Mon,  4 Dec 2023 15:41:57 -0600
Message-Id: <20231204214200.203100-3-pierre-louis.bossart@linux.intel.com>
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
removed from board quirk. Introduce "rpl_nau8825_def" board to reduce
the number of rpl board configs.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_nau8825.c           | 18 +-----------------
 .../intel/common/soc-acpi-intel-rpl-match.c    |  6 +++---
 2 files changed, 4 insertions(+), 20 deletions(-)

diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
index eb3813400593..719c2fbaf515 100644
--- a/sound/soc/intel/boards/sof_nau8825.c
+++ b/sound/soc/intel/boards/sof_nau8825.c
@@ -361,23 +361,7 @@ static const struct platform_device_id board_ids[] = {
 					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
 	{
-		.name = "rpl_max98373_8825",
-		.driver_data = (kernel_ulong_t)(SOF_NAU8825_SSP_CODEC(0) |
-					SOF_NAU8825_SSP_AMP(1) |
-					SOF_NAU8825_NUM_HDMIDEV(4) |
-					SOF_BT_OFFLOAD_SSP(2) |
-					SOF_SSP_BT_OFFLOAD_PRESENT),
-	},
-	{
-		.name = "rpl_mx98360a_8825",
-		.driver_data = (kernel_ulong_t)(SOF_NAU8825_SSP_CODEC(0) |
-					SOF_NAU8825_SSP_AMP(1) |
-					SOF_NAU8825_NUM_HDMIDEV(4) |
-					SOF_BT_OFFLOAD_SSP(2) |
-					SOF_SSP_BT_OFFLOAD_PRESENT),
-	},
-	{
-		.name = "rpl_nau8318_8825",
+		.name = "rpl_nau8825_def",
 		.driver_data = (kernel_ulong_t)(SOF_NAU8825_SSP_CODEC(0) |
 					SOF_NAU8825_SSP_AMP(1) |
 					SOF_NAU8825_NUM_HDMIDEV(4) |
diff --git a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
index 5b6f57e3a583..c0a643f4725a 100644
--- a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
@@ -402,21 +402,21 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
 	},
 	{
 		.id = "10508825",
-		.drv_name = "rpl_max98373_8825",
+		.drv_name = "rpl_nau8825_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &rpl_max98373_amp,
 		.sof_tplg_filename = "sof-rpl-max98373-nau8825.tplg",
 	},
 	{
 		.id = "10508825",
-		.drv_name = "rpl_mx98360a_8825",
+		.drv_name = "rpl_nau8825_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &rpl_max98360a_amp,
 		.sof_tplg_filename = "sof-rpl-max98360a-nau8825.tplg",
 	},
 	{
 		.id = "10508825",
-		.drv_name = "rpl_nau8318_8825",
+		.drv_name = "rpl_nau8825_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &rpl_nau8318_amp,
 		.sof_tplg_filename = "sof-rpl-nau8318-nau8825.tplg",
-- 
2.39.2

