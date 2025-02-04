Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797051E7C3A
	for <linux-sound@vger.kernel.org>; Tue,  4 Feb 2025 05:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738647598; cv=none; b=oIpFg4wwWStkrGW0yVlvJRJHiVvHfB3dVM0d/JKUaCIXMlUfYyq2KDEvg29HWZbRPiBF4qS2rUXSxZ6Y8Nu26TmH6d2uTxeZ7e3GGl54EqOtO1MaiBob+4/buLy7pQmpbpfMw+id6N+Mqvlb3Jknsah2/dL1L125sZ5kA9f8v5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738647598; c=relaxed/simple;
	bh=V68aFHKmJTEyNDmT0iG7Y2IokyW7sg28IsHKGtln5mk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T/PNzpOGo1dxnvvmU/cQ7YoLTiViQJ2fzV0UW0AvzONpYMfYPTwR5CA+qWUOTXHUMiVbiYcPCastd4BeeYvX5b4dMGNIXrX9gKEz6rh4ZVFLoXwe3Gxk4pXLZvB6MaEeW8a1CjpEVOuM7VKlDs/a97JJ7+/Jep3Sq5AYX4XWK1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VQBNM2YB; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VQBNM2YB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738647596; x=1770183596;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V68aFHKmJTEyNDmT0iG7Y2IokyW7sg28IsHKGtln5mk=;
  b=VQBNM2YBvRL3w8kWjMzdxkh/MPtXBq9EU89YRYWjQgf92x9Bg8WWk51O
   fLCJ8fnZ/JwUTH/z59P8oy5oZhOIDYi8HQ/a1yEEE9v2dQeuaA8R6iCgX
   Rb06+B6AQqQApCqhZZCcOcXs2mIq8ZPwcqN2HTHga3BEvkG7JG1gFMCCs
   V4mnPuz5spWAFSFtDa1fRQW3+mtrbUWXGp4u4b1NUOjKdApaPAUZ/8Tj6
   wBMeUBJFlmdHXwt3rFZ9Duuz3Nvf/DcmQq0Yzl2Bt1gtbvMqc7CUUL8O8
   /0baA59ufCaaZj/xp7Mjn0k+qqBSm7esrtzX3P9yF+aoZlWscmVNMWoAZ
   w==;
X-CSE-ConnectionGUID: CgHUDcy4Toq+EVC5epaAWw==
X-CSE-MsgGUID: jn4SyYrRSK6yPUMdCDREGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56590586"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="56590586"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 21:39:56 -0800
X-CSE-ConnectionGUID: ssZubloaS/isd08upbQk6Q==
X-CSE-MsgGUID: p6RDvlAVTRSLCqI9glW0Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="115492014"
Received: from iweiny-desk3.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.111])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 21:39:55 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 3/3] ASoC: Intel: sof_sdw: Add support for Fatcat board with BT offload enabled in PTL platform
Date: Tue,  4 Feb 2025 13:39:43 +0800
Message-ID: <20250204053943.93596-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204053943.93596-1-yung-chuan.liao@linux.intel.com>
References: <20250204053943.93596-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Uday M Bhat <uday.m.bhat@intel.com>

    This change adds an entry for fatcat boards in soundwire quirk table
    and also, enables BT offload for PTL RVP.

Signed-off-by: Uday M Bhat <uday.m.bhat@intel.com>
Signed-off-by: Jairaj Arava <jairaj.arava@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 683e15b459a1..203b07d4d833 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -749,6 +749,16 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(SOC_SDW_PCH_DMIC),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Fatcat"),
+		},
+		.driver_data = (void *)(SOC_SDW_PCH_DMIC |
+					SOF_BT_OFFLOAD_SSP(2) |
+					SOF_SSP_BT_OFFLOAD_PRESENT),
+	},
 	{}
 };
 
-- 
2.43.0

