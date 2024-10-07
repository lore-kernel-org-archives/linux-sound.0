Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCCB17D378
	for <linux-sound@vger.kernel.org>; Mon,  7 Oct 2024 08:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728288032; cv=none; b=FXInovrgRX9mnc6w48l6h8as6z8JkYiR4ZyRUYXNGz1LyI1VmDV1SpOB+n3ANhoEFCld+0Fl2b6U83wAJfBulcL8Wg1MNuLi2BIPGPSp4hDyID1W+kH1mGbiwMy18lzt/MWQ8lFfiRAIE9lWRishXPbqQCtP8/m44JwTk4h/GmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728288032; c=relaxed/simple;
	bh=cVq7a/ln9nxQUwzyq+7Q6X5EYrwfJhsEMN3YWuKuGWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=riUhU53Dpg56zull6QOZvLcRFgfzS/P/TTKObb9a288+LiDw3cdAKaRjTqbRh/1jftMNxA3ireYRDq8LXPme4NsPKGSH+XaV6v1CQT52ajU//h//PGUAkscmKx0os5SY2APfA1MytlNhmm9egvk20AUvHIfDoTTaumZ2MMVkW20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lEQrYegv; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lEQrYegv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728288031; x=1759824031;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cVq7a/ln9nxQUwzyq+7Q6X5EYrwfJhsEMN3YWuKuGWE=;
  b=lEQrYegvDmucpgA+UUPDkn7yTEXW02OKwmP1Qjre32ojlLYow2BuWj//
   Iy+iXv2E73fawKIbD4tNtx77Ao6FhptfUHfC+r7fvzYSdJbfrN1Ww6vra
   pmacKYNY1t8DA5z+L8EFFPYglMDNXc/jTEltq7GygjdpNHvqd88G71xmL
   umc8WKU2vLL55RWFK2nL5cVS8ByMzh68IKsKc8UyO6cyudm/sFIU2fI6o
   EYzI/qNu2vVPBlfe90L0osRgYnFOBkHA9bdVOusRcxTTZARfYSDMpkudi
   mF9ug+q473uLnx8vIdx2//D7H/qWAQxiqiEjMOSUWl5WTHblYii9wZZMJ
   g==;
X-CSE-ConnectionGUID: 3gDgEB75RaGIl9sC/tSoUw==
X-CSE-MsgGUID: /CWYujmCRV6c615QS+8Xeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="30309356"
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; 
   d="scan'208";a="30309356"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 01:00:29 -0700
X-CSE-ConnectionGUID: vwjvZ73CQ32AXeCL1FJ5vQ==
X-CSE-MsgGUID: nuJTUy65QzmydQ9LdlIUtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; 
   d="scan'208";a="80176763"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.70])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 01:00:26 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 3/3] ASoC: Intel: soc-acpi-intel-ptl-match: Add rt721 support
Date: Mon,  7 Oct 2024 15:59:55 +0800
Message-ID: <20241007075955.12575-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241007075955.12575-1-yung-chuan.liao@linux.intel.com>
References: <20241007075955.12575-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Naveen Manohar <naveen.m@intel.com>

Patch adds driver data & match table for rt721
multi-function codec on PTL-RVP at sdw link3.

Signed-off-by: Naveen Manohar <naveen.m@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-ptl-match.c   | 24 +++++++++++
 sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c      |  5 +++
 .../sdw_utils/soc_sdw_rt_sdca_jack_common.c   |  8 ++++
 sound/soc/sdw_utils/soc_sdw_utils.c           | 41 +++++++++++++++++++
 4 files changed, 78 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index 5ed905440e9d..f1c0d7a02cda 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -69,6 +69,24 @@ static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt721_3_single_adr[] = {
+	{
+		.adr = 0x000330025d072101ull,
+		.num_endpoints = ARRAY_SIZE(rt_mf_endpoints),
+		.endpoints = rt_mf_endpoints,
+		.name_prefix = "rt721"
+	}
+};
+
+static const struct snd_soc_acpi_link_adr ptl_rt721_l3[] = {
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt721_3_single_adr),
+		.adr_d = rt721_3_single_adr,
+	},
+	{},
+};
+
 static const struct snd_soc_acpi_adr_device rt722_0_single_adr[] = {
 	{
 		.adr = 0x000030025d072201ull,
@@ -159,6 +177,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-ptl-rt711.tplg",
 	},
+	{
+		.link_mask = BIT(3),
+		.links = ptl_rt721_l3,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-ptl-rt721.tplg",
+	},
 	{
 		.link_mask = BIT(0),
 		.links = ptl_rt722_only,
diff --git a/sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c b/sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c
index 8143d59ad10f..81e43319876e 100644
--- a/sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c
+++ b/sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c
@@ -25,6 +25,10 @@ static const struct snd_soc_dapm_route rt712_spk_map[] = {
 	{ "Speaker", NULL, "rt712 SPOR" },
 };
 
+static const struct snd_soc_dapm_route rt721_spk_map[] = {
+	{ "Speaker", NULL, "rt721 SPK" },
+};
+
 static const struct snd_soc_dapm_route rt722_spk_map[] = {
 	{ "Speaker", NULL, "rt722 SPK" },
 };
@@ -39,6 +43,7 @@ struct codec_route_map {
 /* Codec route maps array */
 static const struct codec_route_map codec_routes[] = {
 	{ "rt712", rt712_spk_map, ARRAY_SIZE(rt712_spk_map) },
+	{ "rt721", rt721_spk_map, ARRAY_SIZE(rt721_spk_map) },
 	{ "rt722", rt722_spk_map, ARRAY_SIZE(rt722_spk_map) },
 };
 
diff --git a/sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c b/sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c
index 3e6211dc1599..af43efbb8f79 100644
--- a/sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c
+++ b/sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c
@@ -60,6 +60,11 @@ static const struct snd_soc_dapm_route rt713_sdca_map[] = {
 	{ "rt713 MIC2", NULL, "Headset Mic" },
 };
 
+static const struct snd_soc_dapm_route rt721_sdca_map[] = {
+	{ "Headphone", NULL, "rt721 HP" },
+	{ "rt721 MIC2", NULL, "Headset Mic" },
+};
+
 static const struct snd_soc_dapm_route rt722_sdca_map[] = {
 	{ "Headphone", NULL, "rt722 HP" },
 	{ "rt722 MIC2", NULL, "Headset Mic" },
@@ -121,6 +126,9 @@ int asoc_sdw_rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_s
 	} else if (strstr(component->name_prefix, "rt713")) {
 		ret = snd_soc_dapm_add_routes(&card->dapm, rt713_sdca_map,
 					      ARRAY_SIZE(rt713_sdca_map));
+	} else if (strstr(component->name_prefix, "rt721")) {
+		ret = snd_soc_dapm_add_routes(&card->dapm, rt721_sdca_map,
+					      ARRAY_SIZE(rt721_sdca_map));
 	} else if (strstr(component->name_prefix, "rt722")) {
 		ret = snd_soc_dapm_add_routes(&card->dapm, rt722_sdca_map,
 					      ARRAY_SIZE(rt722_sdca_map));
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 3b1af6c81e83..a9323cb444d0 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -333,6 +333,47 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		},
 		.dai_num = 1,
 	},
+	{
+		.part_id = 0x721,
+		.version_id = 3,
+		.dais = {
+			{
+				.direction = {true, true},
+				.dai_name = "rt721-sdca-aif1",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
+				.init = asoc_sdw_rt_sdca_jack_init,
+				.exit = asoc_sdw_rt_sdca_jack_exit,
+				.rtd_init = asoc_sdw_rt_sdca_jack_rtd_init,
+				.controls = generic_jack_controls,
+				.num_controls = ARRAY_SIZE(generic_jack_controls),
+				.widgets = generic_jack_widgets,
+				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
+			},
+			{
+				.direction = {true, false},
+				.dai_name = "rt721-sdca-aif2",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				/* No feedback capability is provided by rt721-sdca codec driver*/
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
+				.init = asoc_sdw_rt_amp_init,
+				.exit = asoc_sdw_rt_amp_exit,
+				.rtd_init = asoc_sdw_rt_mf_sdca_spk_rtd_init,
+				.controls = generic_spk_controls,
+				.num_controls = ARRAY_SIZE(generic_spk_controls),
+				.widgets = generic_spk_widgets,
+				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
+			},
+			{
+				.direction = {false, true},
+				.dai_name = "rt721-sdca-aif3",
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
+				.rtd_init = asoc_sdw_rt_dmic_rtd_init,
+			},
+		},
+		.dai_num = 3,
+	},
 	{
 		.part_id = 0x722,
 		.version_id = 3,
-- 
2.43.0

