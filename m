Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150FF42E8C8
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 05:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790141340; cv=none; b=fhjQhKjdnt6XcMtoDqGMp8XXCaT45Hjyk9EDY0oFFvEDnkFGU9+WZraS/s71phPnVlDMgIHqkW1IrZA6HR6OhAxhO09ULG2RA+MY36qRjShNgAgjTNZbuO+PmO0wrnGX3yehYv/VaUGucKHpQE3GwBNiMajAwPalsXo3zxQYltA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790141340; c=relaxed/simple;
	bh=EV2Ge0bkGe7G93vwDJRvLD//Gzh8pqnIcKCjRbNs3K4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VakrgauDvaseSyb16ehMaLt7vQ+WMhyjUVlTCIcNfMw6DCpSer075elT01NFur+T1TTpRv1uf7g/o+rfVjM1wQzaaPTeQMrqA3CPziOPA5JOpO7qsqcLR4acfqqu42+GziFT5eRJgtE71teu+vTQih+JS/yvN7Vp5/IIjtICkQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bGadFzYg; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bGadFzYg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790141339; x=1821677339;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EV2Ge0bkGe7G93vwDJRvLD//Gzh8pqnIcKCjRbNs3K4=;
  b=bGadFzYgQdo2pK936JY0Lp2OHzmLC4n5PoI/jyR4qAFxLN2bQ/Z1dXLk
   39kuKGGjr4GAvQp2U/Oh4JH8tGGNTsw1UVy8SzIAlSatW2Lixj9ZHwwGL
   2JKJotD0gvkgN1fmaMPb1c50YQtpc3IhRt82IshGsRK37a2ppYFw54KN+
   b+3AaYWQtRjyMobMrzdAUk3xFKlNBGE5JZ22SKvzPCuYVdQqooq88VZT3
   N7Lc4TB/jB0JHCn+wBKq7JtFJHzpSxHtAcinhB8dZv/nc32vWEeT7b4WT
   1mi+q/F80XcDcgX5ApCmqqnCH7nZoMQzeca0JbvJ0cXj1j6YM3Rhdy1EV
   A==;
X-CSE-ConnectionGUID: HtPVF/frSYO8viRJkYjHug==
X-CSE-MsgGUID: vI5eiH32S1aZJL8TXsSmKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90821752"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="90821752"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 22:28:59 -0700
X-CSE-ConnectionGUID: O5jvQDN5RaC7HWxEmTLL1Q==
X-CSE-MsgGUID: vRp2cOrGS4CkrlRbRtGOzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="272938569"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 22:28:57 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH v2 7/7] ASoC: soc-acpi-intel-ptl-match: I2S machines: use function topology
Date: Wed, 23 Sep 2026 13:28:32 +0800
Message-ID: <20260923052832.2392758-8-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923052832.2392758-1-yung-chuan.liao@linux.intel.com>
References: <20260923052832.2392758-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use sof_i2s_get_tplg_files() for SOF es83x6 machines.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index dd84e97836c9..0ce51c44bfe6 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -51,12 +51,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_machines[] = {
 		.drv_name = "ptl_es83x6_c1_h02",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &ptl_lt6911_hdmi,
+		.get_function_tplg_files = sof_i2s_get_tplg_files,
 		.sof_tplg_filename = "sof-ptl-es83x6-ssp1-hdmi-ssp02.tplg",
 	},
 	{
 		.comp_ids = &ptl_essx_83x6,
 		.drv_name = "sof-essx8336",
 		.sof_tplg_filename = "sof-ptl-es8336", /* the tplg suffix is added at run time */
+		.get_function_tplg_files = sof_i2s_get_tplg_files,
 		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_SSP_NUMBER |
 					SND_SOC_ACPI_TPLG_INTEL_SSP_MSB |
 					SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER,
@@ -65,6 +67,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_machines[] = {
 	{
 		.id = "INTC10B0",
 		.drv_name = "ptl_lt6911_hdmi_ssp",
+		.get_function_tplg_files = sof_i2s_get_tplg_files,
 		.sof_tplg_filename = "sof-ptl-hdmi-ssp02.tplg",
 	},
 	{},
-- 
2.43.0

