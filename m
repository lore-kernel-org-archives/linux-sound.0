Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D8033E1
	for <linux-sound@vger.kernel.org>; Mon, 10 Feb 2025 03:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739157607; cv=none; b=KeXTv8NzvHzsTvl6TlH6CpR8oMq5Z35k3zdiX7l4nZVBJklFNoa+o4dfHXMOiQMJ0r4Qk5NZt4P9f7ns+3D3Dfinlr4SqDO0sZ1ODUd7Hr0CZ1/BJ3sm4VEYsqFC+dUGgDIV6WtfAHyLXOIzWTDj35tajo/iltCx3yprQEED4bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739157607; c=relaxed/simple;
	bh=76PcZgssK/Lv0TO58+llcjwrS/G+MOyIqE0jxxhjbJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I69UT0BB4gU2NTMihYBJXCKJJvcIzQA/6t8t17dLUaOmvobj2V5xBnIPWVAQTW0Kv8thvToQz0fYxcJTA+kgjihe0RSMIe+JesYgCLiFhaycnoWo0zVb0ZdpiH1ZB13mjOaOLTfFKa3VR2Gk2CbicSkkKyRjRwHnoQXRX93am1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VkVOcJKK; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VkVOcJKK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739157606; x=1770693606;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=76PcZgssK/Lv0TO58+llcjwrS/G+MOyIqE0jxxhjbJY=;
  b=VkVOcJKKDe6eTfSxYgP8b4zc+9LsVi4poF28RPZNgbIl3yJ8AZOBSDZQ
   6Zm0vAleZToutIuj/gZxRgNSRV1ipIFjGBzteUt+0ouJQfqvRS1s0XP28
   51pRjtLYwcKZGZMs2QBiIjbpwd7SEhcC21gs9Y9L14Y9+D5pWCVcELg5G
   EQLlmVpLuYIzxnXr6vrAn7ai0xxrQe4uj1gN54H92jGWX6XycqjfDAN0N
   ISdSeDHZT8J2pvMKeUhIj9G57lH9XYKu45pUDXQiIbP0K057YvMehbFWi
   Us/GY4ere2SgxbwufgkRVBi6MNLRmTaJueAT8nLcvV4GpJxZYFOPmnG1Z
   w==;
X-CSE-ConnectionGUID: H1vv0WNOR+uCiAJSiEljQg==
X-CSE-MsgGUID: y5fRLBnPRry76JNvLZtjqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="43488603"
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="43488603"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 19:20:06 -0800
X-CSE-ConnectionGUID: NaRX+U0sTGKZyap+zVva+g==
X-CSE-MsgGUID: 7ZLYnsGGSka5/ZGAW4krCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="142945817"
Received: from unknown (HELO yungchua-desk.intel.com) ([10.124.221.148])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 19:20:04 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH v2 2/2] ASoC: Intel: soc-acpi-intel-ptl-match: revise typo of rt713_vb_l2_rt1320_l13
Date: Mon, 10 Feb 2025 11:19:54 +0800
Message-ID: <20250210031954.6287-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250210031954.6287-1-yung-chuan.liao@linux.intel.com>
References: <20250210031954.6287-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

s/lnl/ptl

Fixes: a7ebb0255188 ("ASoC: Intel: soc-acpi-intel-ptl-match: add rt713_vb_l2_rt1320_l13 support")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index e487c4e1c034..dd7993b76dee 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -251,7 +251,7 @@ static const struct snd_soc_acpi_link_adr ptl_rvp[] = {
 	{}
 };
 
-static const struct snd_soc_acpi_link_adr lnl_sdw_rt713_vb_l2_rt1320_l13[] = {
+static const struct snd_soc_acpi_link_adr ptl_sdw_rt713_vb_l2_rt1320_l13[] = {
 	{
 		.mask = BIT(2),
 		.num_adr = ARRAY_SIZE(rt713_vb_2_adr),
@@ -344,10 +344,10 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 	},
 	{
 		.link_mask = BIT(1) | BIT(2) | BIT(3),
-		.links = lnl_sdw_rt713_vb_l2_rt1320_l13,
+		.links = ptl_sdw_rt713_vb_l2_rt1320_l13,
 		.drv_name = "sof_sdw",
 		.machine_check = snd_soc_acpi_intel_sdca_is_device_rt712_vb,
-		.sof_tplg_filename = "sof-lnl-rt713-l2-rt1320-l13.tplg"
+		.sof_tplg_filename = "sof-ptl-rt713-l2-rt1320-l13.tplg"
 	},
 	{},
 };
-- 
2.43.0

