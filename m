Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KVB3x74j"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70F06C3
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 05:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701092158; x=1732628158;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BGzewobdHkUYUwtk4CbkDkwikBpcXtX0cr9sjQzOXO0=;
  b=KVB3x74jnIts4NBJOKCKr0P7EbCP/dIKMWgKODEEloFGLqWH9JRgPzBo
   X6UIv7jI01urYI4DHspSnRrCS+xpyUb0JTOjsGOFomvXQtILPlSrwm1sE
   WMcpgja6vUVe1GUPmwaot0LCnHhVua8mjfudRsKi8vZ8k8jsMXPocaZoM
   u9zxexErRjHl6yJwBAHRWRPRIiADGpNBJTCNccFUcODzcd8iXIzwbzAwr
   aNDzgsf8Dq+miJCBkIn+a3YAfiGC2PSL4duWqwi9cbPnrvMGE330Q0zl/
   nyGcXSrQLTe1xWEP0BIspqenPrUeayJNh24o5Z3wtLnlNM8BbgHPlxraW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="391578570"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="391578570"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 05:34:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="891743776"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="891743776"
Received: from acornagl-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 05:34:31 -0800
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
Subject: [PATCH 5/7] ASoC: Intel: soc-acpi: add Gen4.1 SDCA board support for LNL RVP
Date: Mon, 27 Nov 2023 15:34:46 +0200
Message-ID: <20231127133448.18449-6-peter.ujfalusi@linux.intel.com>
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

This patch adds support for LNL RVP with Realtek
Gen4.1 SDCA codec board, the codec layout is:
  SDW0: RT711 Headphone
  SDW1: RT714 DMIC
  SDW2: RT1316 Speaker
  SDW3: RT1316 Speaker

Signed-off-by: Chao Song <chao.song@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-lnl-match.c   | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
index 9f35b77deb11..5897bb6b28b8 100644
--- a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
@@ -22,6 +22,20 @@ static const struct snd_soc_acpi_endpoint single_endpoint = {
 	.group_id = 0,
 };
 
+static const struct snd_soc_acpi_endpoint spk_l_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 0,
+	.group_id = 1,
+};
+
+static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 1,
+	.group_id = 1,
+};
+
 static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 	{
 		.adr = 0x000030025D071101ull,
@@ -31,6 +45,33 @@ static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt1316_2_group1_adr[] = {
+	{
+		.adr = 0x000230025D131601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "rt1316-1"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt1316_3_group1_adr[] = {
+	{
+		.adr = 0x000331025D131601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "rt1316-2"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt714_1_adr[] = {
+	{
+		.adr = 0x000130025D071401ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt714"
+	}
+};
+
 static const struct snd_soc_acpi_link_adr lnl_rvp[] = {
 	{
 		.mask = BIT(0),
@@ -40,6 +81,30 @@ static const struct snd_soc_acpi_link_adr lnl_rvp[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr lnl_3_in_1_sdca[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt711_sdca_0_adr),
+		.adr_d = rt711_sdca_0_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt1316_2_group1_adr),
+		.adr_d = rt1316_2_group1_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt1316_3_group1_adr),
+		.adr_d = rt1316_3_group1_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt714_1_adr),
+		.adr_d = rt714_1_adr,
+	},
+	{}
+};
+
 /* this table is used when there is no I2S codec present */
 struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_sdw_machines[] = {
 	/* mockup tests need to be first */
@@ -61,6 +126,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-lnl-rt715-rt711-rt1308-mono.tplg",
 	},
+	{
+		.link_mask = GENMASK(3, 0),
+		.links = lnl_3_in_1_sdca,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-lnl-rt711-l0-rt1316-l23-rt714-l1.tplg",
+	},
 	{
 		.link_mask = BIT(0),
 		.links = lnl_rvp,
-- 
2.43.0

