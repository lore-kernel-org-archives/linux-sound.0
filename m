Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gquOPqKJ"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E680FBB
	for <linux-sound@vger.kernel.org>; Mon,  4 Dec 2023 13:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701726135; x=1733262135;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sq+2OHoJgLb7vkJAp1/I3BBPlMCcQiMm/MCoDrfrAMA=;
  b=gquOPqKJOR9Mm+vjLB4Bcz5eQFu+nYLKut/1+vX1wMwwJvnaK/dykMny
   UXz8JphgFwZZPxik2cRhj/vRw7gCPLAzJYy+NsEmP3WXf608oXAz9XZO+
   /MN4Gh77ViTyP9cBfGkEskQb1P865Jrg2cseJ9IX7LO7zWgPoZFesDMmM
   hGa7j7l4H42BqBhb79vFThaPMB0E/tPDlcebjnQXh2IiB73BXqTEe2RCs
   hf7lsF4qpg/7/67sT5T4l6Q9TWtcggICh+2oGuo9o8JGVKKYn0DPkJ9tA
   h0IYvMpAnX/FEnOufLEh5GmUBYmFezCU3C6SWboqxbBBkU6NbDT600AXB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="859818"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="859818"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 13:42:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="764104381"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="764104381"
Received: from akashams-mobl.amr.corp.intel.com (HELO pbossart-mobl3.lan) ([10.255.231.189])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 13:42:13 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Curtis Malainey <cujomalainey@chromium.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 3/5] ASoC: Intel: glk_rt5682_max98357a: fix board id mismatch
Date: Mon,  4 Dec 2023 15:41:58 -0600
Message-Id: <20231204214200.203100-4-pierre-louis.bossart@linux.intel.com>
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

The drv_name in enumeration table for ALC5682I-VS codec does not match
the board id string in machine driver. Modify the entry of "10EC5682"
to enumerate "RTL5682" as well and remove invalid entry.

Fixes: 88b4d77d6035 ("ASoC: Intel: glk_rt5682_max98357a: support ALC5682I-VS codec")
Reported-by: Curtis Malainey <cujomalainey@chromium.org>
Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-glk-match.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-glk-match.c b/sound/soc/intel/common/soc-acpi-intel-glk-match.c
index 387e73100884..8911c90bbaf6 100644
--- a/sound/soc/intel/common/soc-acpi-intel-glk-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-glk-match.c
@@ -19,6 +19,11 @@ static const struct snd_soc_acpi_codecs glk_codecs = {
 	.codecs = {"MX98357A"}
 };
 
+static const struct snd_soc_acpi_codecs glk_rt5682_rt5682s_hp = {
+	.num_codecs = 2,
+	.codecs = {"10EC5682", "RTL5682"},
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_intel_glk_machines[] = {
 	{
 		.id = "INT343A",
@@ -35,20 +40,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_glk_machines[] = {
 		.sof_tplg_filename = "sof-glk-da7219.tplg",
 	},
 	{
-		.id = "10EC5682",
+		.comp_ids = &glk_rt5682_rt5682s_hp,
 		.drv_name = "glk_rt5682_mx98357a",
 		.fw_filename = "intel/dsp_fw_glk.bin",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &glk_codecs,
 		.sof_tplg_filename = "sof-glk-rt5682.tplg",
 	},
-	{
-		.id = "RTL5682",
-		.drv_name = "glk_rt5682_max98357a",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &glk_codecs,
-		.sof_tplg_filename = "sof-glk-rt5682.tplg",
-	},
 	{
 		.id = "10134242",
 		.drv_name = "glk_cs4242_mx98357a",
-- 
2.39.2

