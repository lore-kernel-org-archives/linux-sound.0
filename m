Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341ED2475C8
	for <linux-sound@vger.kernel.org>; Wed,  5 Mar 2025 13:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741182914; cv=none; b=DGBN+kT0zXxCcHQ3YRdDQYVmCMRILT1KETLyrwrpf/BGChbPTjV68gvKGvt752ZR9IDUNv4IQ8ufaYUou1L0Dx63IszFoJCx7NIgvOqOt9srl57F9k9G3CGopwUjJF+XgDmumb1/ZfespuOheiisSPsaUeLLXhd/e2pquyLD+8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741182914; c=relaxed/simple;
	bh=Yi+lpP+jSS92DMEyKQn5/td+ZOpuY/I313Hk1xbk7r4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VrNtrqETUdSDSkgTwkbK/X8219qRj02igK5gyGrUuCZuRw5Ah6jC7F8mJo/Oo3UQNOdRIAbvyVZejvetpgZAOqdkHtawe8l+PUt04ipaBqCW9J3r2up9dtSTF1Ofq0a2xYkBDpbr3STELw2d5Qor2IKRqp4u0o/iuGfUBUEUecE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DlR6cdCa; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DlR6cdCa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741182913; x=1772718913;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Yi+lpP+jSS92DMEyKQn5/td+ZOpuY/I313Hk1xbk7r4=;
  b=DlR6cdCax5Sj/xar1TOsmp2+fYUSQnf7vnssb4Lrsg8k2HwJA26UMu6s
   D8ELDy7T8NEQmU+KUZV6Fw9Eyxiv00YwoWfYN0HkaRpDTX/pMML+qITiT
   lIjiOysITjDjSAgK3NLy0hcB2Fm752RROfAOFwE7mc4gzbGQe2DFOASrc
   zUGSzJCbSBBI57mj4AXLcoeISu+qiOCoopTndiSFgC4lRuPLjcNryYLNt
   hM0FhotPaqjabToYkNInNYgo6leiaCtv+OZWScbloNVYjx0hDLYpeYelz
   OKpTtBOs6fjaP8JSq0uCKv2bFjsXsQ2Tmpusnvp40+OZHes9wPvSD4AIf
   w==;
X-CSE-ConnectionGUID: WHu5KXlYSCm5M9TGDabNAQ==
X-CSE-MsgGUID: duVxGQ+PQhucPsHqKKIFHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59558076"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="59558076"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 05:55:12 -0800
X-CSE-ConnectionGUID: sPsp9/goTmychQzqsscK5g==
X-CSE-MsgGUID: 1LjsU3C6SkamhSdlYn4hmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="118847090"
Received: from bvivekan-mobl1.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.175.91])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 05:55:09 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 3/9] ASoC: Intel: soc-acpi-intel-ptl-match: add rt713_vb_l3_rt1320_l12 support
Date: Wed,  5 Mar 2025 21:54:37 +0800
Message-ID: <20250305135443.201884-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305135443.201884-1-yung-chuan.liao@linux.intel.com>
References: <20250305135443.201884-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Add rt713_vb on SDW link 3 and 2 rt1320 on SDW link 1 and 2 configuration
support.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-ptl-match.c   | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index 8807acb92ecf..5c1ece913a18 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -152,6 +152,15 @@ static const struct snd_soc_acpi_adr_device rt713_vb_2_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt713_vb_3_adr[] = {
+	{
+		.adr = 0x000330025D071301ull,
+		.num_endpoints = ARRAY_SIZE(jack_dmic_endpoints),
+		.endpoints = jack_dmic_endpoints,
+		.name_prefix = "rt713"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt721_3_single_adr[] = {
 	{
 		.adr = 0x000330025d072101ull,
@@ -224,6 +233,15 @@ static const struct snd_soc_acpi_adr_device rt1320_2_group1_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt1320_2_group2_adr[] = {
+	{
+		.adr = 0x000230025D132001ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "rt1320-1"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt1320_3_group2_adr[] = {
 	{
 		.adr = 0x000330025D132001ull,
@@ -288,6 +306,25 @@ static const struct snd_soc_acpi_link_adr ptl_sdw_rt713_vb_l2_rt1320_l13[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr ptl_sdw_rt713_vb_l3_rt1320_l12[] = {
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt713_vb_3_adr),
+		.adr_d = rt713_vb_3_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1320_1_group2_adr),
+		.adr_d = rt1320_1_group2_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt1320_2_group2_adr),
+		.adr_d = rt1320_2_group2_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr ptl_sdw_rt712_vb_l2_rt1320_l1[] = {
 	{
 		.mask = BIT(2),
@@ -388,6 +425,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.machine_check = snd_soc_acpi_intel_sdca_is_device_rt712_vb,
 		.sof_tplg_filename = "sof-ptl-rt713-l2-rt1320-l13.tplg"
 	},
+	{
+		.link_mask = BIT(1) | BIT(2) | BIT(3),
+		.links = ptl_sdw_rt713_vb_l3_rt1320_l12,
+		.drv_name = "sof_sdw",
+		.machine_check = snd_soc_acpi_intel_sdca_is_device_rt712_vb,
+		.sof_tplg_filename = "sof-ptl-rt713-l3-rt1320-l12.tplg"
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_ptl_sdw_machines);
-- 
2.43.0

