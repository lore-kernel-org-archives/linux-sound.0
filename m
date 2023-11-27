Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mS0jW7/d"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB498D0
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 05:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701092160; x=1732628160;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mJesEuzPrGuDLW8lzbIbz3ZHGfHLQu0+NnuIRJyxKts=;
  b=mS0jW7/d0ypp47lDnbsaTyAuf8bgFmucPUrVVivocpPTelmxbqaQxgKu
   BS9jqbZboxNhK+XlyYBtKYPSt4UyivFdjoonPFPJMVykhirlDAeQjsoOe
   qCUjxQ0eugOtGJ2QL5VG2/n09K4fO3JQgIuiNpTTw0JIgKx4cqYufx8lk
   K+ytn8ZeCpNl89t480cr9NAVb9D0Ldw1ja0ZlHs4+L1XGwLSM8UybjcS2
   n+/uRXQno9Fo6lINqEj5L/nrRXM7hm9kstFXnvi5Z2BsA0Le8KJusRAIn
   9wIZYYthC7hIjvSM5xc1hp3OlmI/5IX8QEirJyfhY+8yCBIYGPuf6lHa0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="391578597"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="391578597"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 05:34:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="891743786"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="891743786"
Received: from acornagl-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 05:34:39 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	cezary.rojewski@intel.com,
	yung-chuan.liao@linux.intel.com,
	ckeepax@opensource.cirrus.com,
	yong.zhi@intel.com,
	chao.song@linux.intel.com
Subject: [PATCH 7/7] ASoC: Intel: soc-acpi-intel-mtl-match: Add rt722 support
Date: Mon, 27 Nov 2023 15:34:48 +0200
Message-ID: <20231127133448.18449-8-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127133448.18449-1-peter.ujfalusi@linux.intel.com>
References: <20231127133448.18449-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chao Song <chao.song@linux.intel.com>

This patch adds match table for rt722 codec on link 0.

RT722 is a multi-function codec, three endpoints are
created for its headset, amp and dmic functions.

Signed-off-by: Chao Song <chao.song@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-mtl-match.c   | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 2035f561ca50..f2c17cee1a5d 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -135,6 +135,31 @@ static const struct snd_soc_acpi_endpoint rt712_endpoints[] = {
 	},
 };
 
+/*
+ * RT722 is a multi-function codec, three endpoints are created for
+ * its headset, amp and dmic functions.
+ */
+static const struct snd_soc_acpi_endpoint rt722_endpoints[] = {
+	{
+		.num = 0,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{
+		.num = 1,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{
+		.num = 2,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
 static const struct snd_soc_acpi_endpoint spk_2_endpoint = {
 	.num = 0,
 	.aggregated = 1,
@@ -176,6 +201,15 @@ static const struct snd_soc_acpi_adr_device rt1712_3_single_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt722_0_single_adr[] = {
+	{
+		.adr = 0x000030025d072201ull,
+		.num_endpoints = ARRAY_SIZE(rt722_endpoints),
+		.endpoints = rt722_endpoints,
+		.name_prefix = "rt722"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt713_0_single_adr[] = {
 	{
 		.adr = 0x000031025D071301ull,
@@ -367,6 +401,15 @@ static const struct snd_soc_acpi_link_adr mtl_rvp[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr mtl_rt722_only[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt722_0_single_adr),
+		.adr_d = rt722_0_single_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr mtl_3_in_1_sdca[] = {
 	{
 		.mask = BIT(0),
@@ -568,6 +611,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-rt711-l0-rt1316-l23-rt714-l1.tplg",
 	},
+	{
+		.link_mask = BIT(0),
+		.links = mtl_rt722_only,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-mtl-rt722-l0.tplg",
+	},
 	{
 		.link_mask = BIT(0),
 		.links = mtl_rvp,
-- 
2.43.0

