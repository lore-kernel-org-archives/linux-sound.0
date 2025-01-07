Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E816082890;
	Tue,  7 Jan 2025 01:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736215116; cv=none; b=XoafzPNwE51VgANgHRSsryEfD+U+HmClx7xh3lWKH+X0ySJe5Ana5zGvD5QaR9tGRhhcYiWQbPh6lDAF+5Poe/66eqgChyB+BFLrxEIh1xqhxsgtgUdvc7+hkloXsX3c6uh1x74SgY1QBlROvzATjA5ZIXmMfa4BKn6JsYq/d8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736215116; c=relaxed/simple;
	bh=6D3qu2jFcm9JJdol9jZ39EiknhJ1ytniof8hwSRzgWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DyKxm1lMZlutc1e/SGfWmi7tLdn7Ux/i9k88dOtv0NynEUkt1XEGQrRqOSImZ3VjAv8t8LCEC6HCi2sWaVTdW5ZQlrjf96bDbhXvsopN8nUIvuaPvuhZypXnBGHiRmZcsinrpQ+/8zGme1dFhy1PR9k05iTTtOJ5nBB0wa1DljQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xy2FxxMs; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xy2FxxMs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736215115; x=1767751115;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6D3qu2jFcm9JJdol9jZ39EiknhJ1ytniof8hwSRzgWg=;
  b=Xy2FxxMs4QwPA8Lte4uRztK0emK33KgHU4MkDma7xjGArta3rWooHCGZ
   Pq1EhgRXAm4i+n8jQzNBTu4d0gTrI1AjVOLHLlq5ZNOPYV0EHbFXIVcNl
   S82f4SMZAI1DYL/w7VO+TX7PKxe9N2OjcwxrBLBNwSjQ1qOGz+e3uQE2c
   7bPE/O9zO5mDL4VjjmXs1T6RzmIfUy2ax9HxYPYEPN9ck/SHlpy8K9SJH
   KM8bA2heQ6BhC3wJ65/lGBEHtCkUwK6OIXT9bJXEMksAHZliVFLlE1KN2
   9wEiUhFsaY15/4D55lyJZW3HosVgdXF4Lv5wbri4+kiJ7TZlOBLr7UjZ+
   g==;
X-CSE-ConnectionGUID: Er/eaqyxR+Kb0ouawq4jFw==
X-CSE-MsgGUID: qChqadonQoeM/BxVQf7S6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36396904"
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="36396904"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 17:58:35 -0800
X-CSE-ConnectionGUID: oDfx9cOiQkCim5VZ1ILTew==
X-CSE-MsgGUID: tu3L2eQAQhu/b+K7nw7g1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="102798818"
Received: from daliomra-mobl3.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.221.46])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 17:58:34 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 2/2] Revert "soundwire: intel_auxdevice: start the bus at default frequency"
Date: Tue,  7 Jan 2025 09:58:24 +0800
Message-ID: <20250107015824.5046-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107015824.5046-1-yung-chuan.liao@linux.intel.com>
References: <20250107015824.5046-1-yung-chuan.liao@linux.intel.com>
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

