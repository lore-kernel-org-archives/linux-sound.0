Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690821AF0C5
	for <linux-sound@vger.kernel.org>; Thu,  2 Jan 2025 12:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735821226; cv=none; b=CgXm11KzLhbPrlWzPkE6dxcHmU82po8KL+L4pxzoiRkohL3Y0sF1xL5+jgL+q93AXWY3taiPlkI/yF399+xAe64wIliDdQ1Jx001FaQPssxMokxBjGsrNN40Bgrwc9RywP0NQ5sA+0QQWoVMzqmMlv8wfxvnJP2A0AvV8uZgBdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735821226; c=relaxed/simple;
	bh=RTfekUKXu03j/qXUCx+TP8CemNgqLA645gLIzmvemYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nLUh9SS+Qag0uafsjx0ceBRLWhO8EWyP1XYM8GMsHVJ3uhLYcD1c79ZjNII5tWUG5tFpfoNUpDbsm71FbjwZf1u8w1BaVY+PrXHUnr2eHa2+tGbi8MloCnTsap8a+DEHV2MMA6dP1W2zFSboWuLlD4BfNUfkkeQTVNPgiCooysY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sg0iB9tL; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sg0iB9tL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735821225; x=1767357225;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RTfekUKXu03j/qXUCx+TP8CemNgqLA645gLIzmvemYI=;
  b=Sg0iB9tLPG6XJg/vDGk0sM6VxQFfoz7ms7Et7W/DecK0pbgEX48sjMFc
   6SRtr8qwxfFOsWYkJ1LC8wlHiDaNncqqCr6nnNXeb3kTgZzEdCkFiJfoY
   dkISVFmsF2bCllqphwooaOi27i2MAFEfwulXrdBgOwVL3cYeWyQ5Z3ElL
   XF8M1WDq30T7dtrn2iy0VRz5+RWr1IjTgNHBICCMGWSlko5mNknEmRPjf
   Tulxba5SS5E89axjOVzs0vXU/ipA4TjNhMEadFhhGHyv9GsXmK77PIno5
   Im1ohX6W5+clSW8fKDAQaI4ny0VZYC8/EvKsfRt6aPfWOvRUCqMESiwy4
   Q==;
X-CSE-ConnectionGUID: UB0wBc2PRyemT1hSpNqZfQ==
X-CSE-MsgGUID: 43vMuhFJQoCXJUh8UZOddQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="36073879"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="36073879"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 04:33:45 -0800
X-CSE-ConnectionGUID: vPFdJMKnQpyZyonzQ3c+IQ==
X-CSE-MsgGUID: 0546gn68QOOfxTctwoUMzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="101681374"
Received: from iweiny-desk3.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.231])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 04:33:43 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 1/2] ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 83LC
Date: Thu,  2 Jan 2025 20:33:34 +0800
Message-ID: <20250102123335.256698-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250102123335.256698-1-yung-chuan.liao@linux.intel.com>
References: <20250102123335.256698-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Simon Trimmer <simont@opensource.cirrus.com>

Update the DMI match for a Lenovo laptop to the new DMI identifier.

This laptop ships with a different DMI identifier to what was expected,
and also has the DMICs connected to the host rather than the cs42l43
codec.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Fixes: 83c062ae81e8 ("ASoC: Intel: sof_sdw: Add quirks for some new Lenovo laptops")
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 9f721b88e606..d054be360d28 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -620,9 +620,9 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "3832")
+			DMI_MATCH(DMI_PRODUCT_NAME, "83LC")
 		},
-		.driver_data = (void *)(SOC_SDW_SIDECAR_AMPS),
+		.driver_data = (void *)(SOC_SDW_SIDECAR_AMPS | SOC_SDW_CODEC_MIC),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
-- 
2.43.0

