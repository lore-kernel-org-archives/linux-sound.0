Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482DF17C6C
	for <linux-sound@vger.kernel.org>; Fri,  4 Oct 2024 03:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728010914; cv=none; b=vB+7hXYdlBp9a+tjVBvdoivnOI8oY1G3Co1+2pEHNkbLREgCmKEm+t6oept0cZWBv/P2YZwCv78F5Y9plDFJiGH67rS+t2lmARoGC+y95HWEH0ls6JamhvJf5h/YDutZ0MAnCfZM520ulHJorxqbES5r7X6iK1CZx6/902MBHwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728010914; c=relaxed/simple;
	bh=DPygbvwyUVgc/NPIv0teUIyxhD75m1j8xCle0vu9m6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oG70N5WVo8ma3E3uFLF0cNVaai2XRDotSoRm+MiRMGd42pgrkNxTEHG/1+4rvTi84qDRszZkgl4L1lcZ7lRRWTODWzi51IenOJD2gXSQd4s81nc+S3EpHLFPbdaZAuGT01cBOO5fqMLCC3+sEzUdQ7T6ctSbBB+3nIGLCJY+o4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EaeLredW; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EaeLredW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728010912; x=1759546912;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DPygbvwyUVgc/NPIv0teUIyxhD75m1j8xCle0vu9m6E=;
  b=EaeLredWT1eP9q0wi8XKhpNRCvxaOjCqAeM3H6PaPNyliiCnYiJIwHik
   t2H5Wn/jrZnVGKo3O9/0rXmdxGDY0Suo+DyZ1CLW+uqNgHI1gEEANUQRU
   NKIARjN9ptD46FrPHTFNbitof6ncB122mAYOI8l+8anTeYwwwtkeval01
   UnS9QMKobT5XQZTYCPEPhl/MUSj3ZJkKvdarK91yFGMmgsDmNAW3IiESA
   2Yym1vXpSAWGjl88CjVSoBrYjhONZvljqISe9cBcShwlHzVoS+K+r7XO9
   k/C7QzVeTOcxX0V4q/GbZBlEQX9NmzngGffi8maOOS879GVpE8SFgzNe9
   A==;
X-CSE-ConnectionGUID: lsg0E639RAacKS/ZOTtLZA==
X-CSE-MsgGUID: YBRE80FBT4OID70PY5FORA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27376715"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="27376715"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 20:01:52 -0700
X-CSE-ConnectionGUID: uBo/KNQGQAypeQegVAb/yg==
X-CSE-MsgGUID: lzRe5OW7S2SCkMSVOOfhRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="74400713"
Received: from bvivekan-mobl2.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.16])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 20:01:49 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 1/2] ASoC: Intel: sof_rt5682: Add HDMI-In capture with rt5682 support for MTL.
Date: Fri,  4 Oct 2024 11:01:33 +0800
Message-ID: <20241004030135.67968-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004030135.67968-1-yung-chuan.liao@linux.intel.com>
References: <20241004030135.67968-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Balamurugan C <balamurugan.c@intel.com>

Added match table entry on mtl machines to support HDMI-In capture
with rt5682 I2S audio codec. also added the respective quirk
configuration in rt5682 machine driver.

Signed-off-by: Balamurugan C <balamurugan.c@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c               | 7 +++++++
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index bc581fea0e3a..866589fece7a 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -870,6 +870,13 @@ static const struct platform_device_id board_ids[] = {
 					SOF_SSP_PORT_BT_OFFLOAD(2) |
 					SOF_BT_OFFLOAD_PRESENT),
 	},
+	{
+		.name = "mtl_rt5682_c1_h02",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_SSP_PORT_CODEC(1) |
+					/* SSP 0 and SSP 2 are used for HDMI IN */
+					SOF_SSP_MASK_HDMI_CAPTURE(0x5)),
+	},
 	{
 		.name = "arl_rt5682_c1_h02",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index d4435a34a3a3..fd02c864e25e 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -42,6 +42,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_machines[] = {
 					SND_SOC_ACPI_TPLG_INTEL_SSP_MSB |
 					SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER,
 	},
+	{
+		.comp_ids = &mtl_rt5682_rt5682s_hp,
+		.drv_name = "mtl_rt5682_c1_h02",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &mtl_lt6911_hdmi,
+		.sof_tplg_filename = "sof-mtl-rt5682-ssp1-hdmi-ssp02.tplg",
+	},
 	/* place boards for each headphone codec: sof driver will complete the
 	 * tplg name and machine driver will detect the amp type
 	 */
-- 
2.43.0

