Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wkantdys"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94D79B8
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 05:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701092154; x=1732628154;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ylPOM8+EoXFj0fcda/iP43PmN+shQ7mww8VqSMW2wiU=;
  b=Wkantdysy0HN0GneYsdmShYN4eHumA6bCkfcDFReg3p6KJ14JJhXM74V
   sV88m1rdK1ekaFWcP8hdW+7lL6OHkUpWK+URErIAER6akLlEWvTAS/YdP
   11glc3dpkZlQ6ToGlinwJ4aSThG5Ys/AOBMPBbDVW804Mb/2/aWiz2mlU
   9jVQckJ91vrmtcQXjzB6WaWJJSiv2dgwW014mrwSeN3cs+QbkW0OljdLu
   hRn5+Sa5lEhhtaoFrTn+MvDhFGMOy7n/aNrygKWUqFRZAzljhD0ucPy7o
   QHoTfrxfWQ4/9Hw/gvH4s0KE/p+TkFEuvH9c7S6UsPhwO+W/0nymu/ztk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="391578556"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="391578556"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 05:34:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="891743770"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="891743770"
Received: from acornagl-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 05:34:28 -0800
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
Subject: [PATCH 4/7] ASoC: Intel: soc-acpi: rt713+rt1316, no sdw-dmic config
Date: Mon, 27 Nov 2023 15:34:45 +0200
Message-ID: <20231127133448.18449-5-peter.ujfalusi@linux.intel.com>
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

From: Mac Chiang <mac.chiang@intel.com>

This is additional HW board: rt713+rt1316 without rt713-dmic configuration:

SDW0: rt713 audio jack
SDW1: rt1316 spk_amp_l
SDW2: rt1316 spk_amp_r

Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-mtl-match.c   | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index af4224bff718..2035f561ca50 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -434,6 +434,25 @@ static const struct snd_soc_acpi_link_adr mtl_rt713_l0_rt1316_l12_rt1713_l3[] =
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr mtl_rt713_l0_rt1316_l12[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt713_0_single_adr),
+		.adr_d = rt713_0_single_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1316_1_group2_adr),
+		.adr_d = rt1316_1_group2_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt1316_2_group2_adr),
+		.adr_d = rt1316_2_group2_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_adr_device mx8363_2_adr[] = {
 	{
 		.adr = 0x000230019F836300ull,
@@ -519,6 +538,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-rt713-l0-rt1316-l12-rt1713-l3.tplg",
 	},
+	{
+		.link_mask = GENMASK(2, 0),
+		.links = mtl_rt713_l0_rt1316_l12,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-mtl-rt713-l0-rt1316-l12.tplg",
+	},
 	{
 		.link_mask = BIT(3) | BIT(0),
 		.links = mtl_712_only,
-- 
2.43.0

