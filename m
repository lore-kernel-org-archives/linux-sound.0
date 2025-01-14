Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CE0237A2E;
	Tue, 14 Jan 2025 06:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736835394; cv=none; b=FJaH2ug0sEHZhY8cX1CsBB8Egi11Xbh87fMDHkfMUVPLoyYAidJ6XX0yRW6xvYTtxAmiShbKoRCJBy7DYo0xesljDYLdLLrIX5rgvhJ1vMf3SgJ0DKqTl/SL6vszaagfAeO6xOC8TAb8WkwHwwFbEBeNSsmPMdCvj9tLR4j5Jac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736835394; c=relaxed/simple;
	bh=6D3qu2jFcm9JJdol9jZ39EiknhJ1ytniof8hwSRzgWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qgdbuXZC5qwC9vEQLipE9rStKzKgUCCB/cu108PMihbwoGr62TbBmyDAfU3twGH/pRnT3rsa03ZmWr0HhDY+MErFZKn3os59UCpdtvcwLgeDzdQzKnWBvT3n0nkReAmDXdFeCSfW0iEZAqMVNLOZYdM69oKJBhivmqwmxfdMcf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gWreVL4o; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gWreVL4o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736835393; x=1768371393;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6D3qu2jFcm9JJdol9jZ39EiknhJ1ytniof8hwSRzgWg=;
  b=gWreVL4o58Q8ekIq/JRdTyYJj1rl/YoR//vDqzt43mTs1VE5MPE2i7k+
   fAo25p4Gy9rBuagvC0Tnzo8ANd89MqqCYuNLNFdQYA0a0zoHu3J2kKyah
   rHJ5bPbcbpkmST6eCSI6bm+eeSh+unu3Ool14ooA8YhqafohcLoNtPPbY
   70ayyjkrZ2bBfaqxe+a7PYbR2+ynZYgxNzo5yzBPSfgDDWjqnxJ7jic69
   S/tbijdy4S0J34BxcWnBX+Xass+iqf+7Ge5DhnsDb+0d2aXfW1ZRMHTXq
   xn6Ic8IxelB0PxLZaxiK3NCOZw1nQmy3j/M1qHSqsrrn2P5FWbwukvn3+
   w==;
X-CSE-ConnectionGUID: 3QmS2Z5jRkODV6gag5jI9A==
X-CSE-MsgGUID: eD9D4uN/QAiwPfSEg2zM+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="36808061"
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; 
   d="scan'208";a="36808061"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 22:16:33 -0800
X-CSE-ConnectionGUID: YW5YdaGtSn6tkuh1hQ3aPA==
X-CSE-MsgGUID: iqAqd1xgQkiacDD43AI8Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108768292"
Received: from rfrazer-mobl3.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.150])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 22:16:31 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH v2 2/2] Revert "soundwire: intel_auxdevice: start the bus at default frequency"
Date: Tue, 14 Jan 2025 14:16:21 +0800
Message-ID: <20250114061621.110800-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250114061621.110800-1-yung-chuan.liao@linux.intel.com>
References: <20250114061621.110800-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now, we can support more than 1 soundwire bus clock frequency.

This reverts commit c326356188f1dc2d7a2c55b30dac6a8b76087bc6.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 drivers/soundwire/intel_auxdevice.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index 599954d92752..dee126f6d9d5 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -222,30 +222,9 @@ static int sdw_master_read_intel_prop(struct sdw_bus *bus)
 
 static int intel_prop_read(struct sdw_bus *bus)
 {
-	struct sdw_master_prop *prop;
-
 	/* Initialize with default handler to read all DisCo properties */
 	sdw_master_read_prop(bus);
 
-	/*
-	 * Only one bus frequency is supported so far, filter
-	 * frequencies reported in the DSDT
-	 */
-	prop = &bus->prop;
-	if (prop->clk_freq && prop->num_clk_freq > 1) {
-		unsigned int default_bus_frequency;
-
-		default_bus_frequency =
-			prop->default_frame_rate *
-			prop->default_row *
-			prop->default_col /
-			SDW_DOUBLE_RATE_FACTOR;
-
-		prop->num_clk_freq = 1;
-		prop->clk_freq[0] = default_bus_frequency;
-		prop->max_clk_freq = default_bus_frequency;
-	}
-
 	/* read Intel-specific properties */
 	sdw_master_read_intel_prop(bus);
 
-- 
2.43.0

