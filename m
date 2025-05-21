Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8A74430
	for <linux-sound@vger.kernel.org>; Wed, 21 May 2025 03:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747799337; cv=none; b=F7Tq5y0QdfqguT6/U/QP4+pU0wltsjMVKHXHWAHGmIjW2URG023XT7RYFQHUCQkJEhw0cmWRB/F9FuYYnl8/FhEJ5qQgb9iHdbt7ogIKMVlz13Fy+A72ih5XkaLWT3mPa0cmnpqqYoF0r6Lwfo81p9UkqCBTtJnfoy4+btCsV8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747799337; c=relaxed/simple;
	bh=9Pp1aSLSLGWTUdOQJcp1SRmAGkoXab5YkTL4ixdPhqY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ATNR/0ohQL2si74BmCAe6tYb+ObbWuTXrF3baroPrLfoHcJfGqDIHYjy+GXZxgb6qCdTaUr9n78gC2+PbUkbunCqFWKpmBFWffW7s2G4CdYj38zXtugoyDyrnmL0xLX/oE/7xaVWOKTWchCuIFNEU/IlHMulUOBekNio3rIgR9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y2cuugkt; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y2cuugkt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747799336; x=1779335336;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9Pp1aSLSLGWTUdOQJcp1SRmAGkoXab5YkTL4ixdPhqY=;
  b=Y2cuugkt2W8XOpL0tRX4gNlxim7MM2xNBDpeFpM7g8TGa3gT2gbHTZZY
   C1kT/jgB54krnQqlJqYiSrgP1RRrBso1o1Ez732Xx/Jhpn2O2wOSw0wfq
   0j9idCRm2dvNiJKZyccXr3HaQodHx0dUZXGTRS1Lxq1fD/JK3/seWkARY
   B1r/KetqAjGt4bEAq8d0GlWOcZ2Q1mfS2DRB+gP9/21TtMFCaJTaO9+Ea
   r7GLqpmb1+vv+muwMaFFyOkuRdrCHARbcZrKy0YDqM/H5ODkZDGVNklRF
   JDVC9L32poRRMGJao/3mbePO3Es98ugKYEmVldTyIDM5E/YhkBSD92kX2
   A==;
X-CSE-ConnectionGUID: 7BM+FFK8TTCBV8ExBbYu8Q==
X-CSE-MsgGUID: SKT1uDjcSdamL4Qdh5djCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="53424279"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="53424279"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 20:48:55 -0700
X-CSE-ConnectionGUID: WmWt1/uXQ2WmIr8Y+rQBTA==
X-CSE-MsgGUID: 2M1gpuXYRxGz+ZpO9t0VXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="170902583"
Received: from bvivekan-mobl2.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.119.205])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 20:48:53 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH] ASoC: Intel: sof_sdw: Add support for wclrvp & ocelot in WCL platform
Date: Wed, 21 May 2025 11:48:40 +0800
Message-ID: <20250521034840.8083-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Naveen Manohar <naveen.m@intel.com>

Add an entry in the soundwire quirk table for Wildcat boards to support
WCL RVP

Signed-off-by: Naveen Manohar <naveen.m@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 51b29ebdf405..81a914bd7ec2 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -759,6 +759,24 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 					SOF_BT_OFFLOAD_SSP(2) |
 					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
+	/* Wildcatlake devices*/
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Intel_wclrvp"),
+		},
+		.driver_data = (void *)(SOC_SDW_PCH_DMIC),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Ocelot"),
+		},
+		.driver_data = (void *)(SOC_SDW_PCH_DMIC |
+					SOF_BT_OFFLOAD_SSP(2) |
+					SOF_SSP_BT_OFFLOAD_PRESENT),
+	},
 	{}
 };
 
-- 
2.43.0

