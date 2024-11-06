Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A27418FDC2
	for <linux-sound@vger.kernel.org>; Wed,  6 Nov 2024 05:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730872746; cv=none; b=dNphLcHswSABUhxk/i+TMQlFvMyy/cOx0AMKXq44GUAdIA6+ZvIyLlLusgcYHpCYqmxU5hiEHgEoypYjbAi5AKpgGkoX8812jUcIOIi6FV9uuTQurYcCeDwrXlZ7blHSuDtBtV20CAR8tQGbKa8rV/sgvPujKHUwFEFXaexka/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730872746; c=relaxed/simple;
	bh=qn79jxUoezMUZbnGcU8C6pU9M7pGPaUdUuNIrpk9lDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m4YT2CCPR5kiSqS+KVFHOv8IJiLnrjLCGJxkmAYUn/xMWUW5UM3nNHGkZdT8NQxxje7Kg4UXwFbqrtMROYpMSQzTUsYOZYYq7h5LYEj3mit5JspklyKa99IR7pCSGXhu4XbI1Tl+HyB5J01btA4s9lC4C9zr6KYP4HVcjDW28Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h6F9sStg; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h6F9sStg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730872746; x=1762408746;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qn79jxUoezMUZbnGcU8C6pU9M7pGPaUdUuNIrpk9lDw=;
  b=h6F9sStgInAyLJpSmJfFJgv2rvD4q3d68UZUr34CF7ldbBErEyv8zaah
   3dY0N5MSQMp3Ay4SRVly6fMQuAxR0UIkdZwF906rysfjGb6D3oFZUx9oH
   QqQ7dmvYxNwgGW/lyosgkjJK3HEFCAshuyZlCR6ZRlMnPM8u/0bdlQx8v
   14JpgOD2vJcaiv89XzccI268PzsvBTui0W8bqwbeAjmGL4ixNEXNOszVz
   YL4fNjWDUV3xuXKob8gSMCKAIyDVHovdrF7dCngIn8OFlnXbtBNo2vPYC
   K+1798mzQ4moAhZcUA/NyrxIIcxL8sRGYOEPoqliT2noW70rgYTFtAMBp
   g==;
X-CSE-ConnectionGUID: P6GpD9jBTdeEZOObipIt3A==
X-CSE-MsgGUID: zNkwGO2wTWquUd6mZKFAvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30505168"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30505168"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 21:59:05 -0800
X-CSE-ConnectionGUID: mrfRZLfETzSKruhRNolTWA==
X-CSE-MsgGUID: mLuk8xc8ThijYCVCIw5dxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="89484382"
Received: from sramkris-mobl1.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.222.45])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 21:58:21 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 2/2] ASoC: Intel: Kconfig: select SND_SOC_SDCA by SND_SOC_ACPI_INTEL_SDCA_QUIRKS
Date: Wed,  6 Nov 2024 13:58:10 +0800
Message-ID: <20241106055810.10123-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241106055810.10123-1-yung-chuan.liao@linux.intel.com>
References: <20241106055810.10123-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

SND_SOC_SDCA can't be optional when SND_SOC_ACPI_INTEL_SDCA_QUIRKS is
selected. IS_REACHABLE can prevent the link error. However it is not
suitable for this case. When CONFIG_SND_SOC_ACPI_INTEL_SDCA_QUIRKS is
Y and CONFIG_SND_SOC_SDCA is M, the SDCA helpers will be empty and
return false. But we need the helpers to do their jobs whenSND_SOC_SDCA
is M.
IOW, the SDCA library is not optional for Intel platforms where the
SDCA_QUIRK is selected.
Also, make SND_SOC_SDCA invisible. SND_SOC_SDCA should be selected if
a device supports SDCA. User should not unselect it.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202411021722.DiX1Y5sf-lkp@intel.com/
Suggested-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/intel/Kconfig | 2 +-
 sound/soc/sdca/Kconfig  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index f644e9423428..46b45f390ae9 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -78,7 +78,7 @@ config SND_SOC_ACPI_INTEL_MATCH
 
 config SND_SOC_ACPI_INTEL_SDCA_QUIRKS
 	tristate
-	imply SND_SOC_SDCA
+	select SND_SOC_SDCA
 
 endif ## SND_SOC_INTEL_SST_TOPLEVEL || SND_SOC_SOF_INTEL_TOPLEVEL
 
diff --git a/sound/soc/sdca/Kconfig b/sound/soc/sdca/Kconfig
index 07f6822fa614..ee20b9914aa1 100644
--- a/sound/soc/sdca/Kconfig
+++ b/sound/soc/sdca/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 config SND_SOC_SDCA
-	tristate "ASoC SDCA library"
+	tristate
 	depends on ACPI
 	help
 	  This option enables support for the MIPI SoundWire Device
-- 
2.43.0

