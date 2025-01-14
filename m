Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF55E235BFA;
	Tue, 14 Jan 2025 06:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736835393; cv=none; b=oOme3wls2K0SpfZmLpIj+z1MHR2lIa2VK8SAwCh1mFXC/v3nCv/meWvuwjBUUJVDzQamZl7Yw6CdamaKWOqU8PlbN43/J+LUZNklKu1AATyjQlxwHBo2m1usjQqhjSA7o1HfAGXSVbIPigYCdaB2apSDRV6TgFgQdylDdVxkeZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736835393; c=relaxed/simple;
	bh=h0FzFn1p1VlEN36Kvt1vy+ChoJTjJwa1HDg8+JHMxw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o8NbeOWH4CEtPvGZiVTo9LquI5cYeOcdA3grCNwmUUTsqffGpa30KUYcl4PZZKQNxcUW+DgwfHykPhdvChr3sjSNez9tvqtKA9QAYCfO5Lm9J2rNqNZeXGpqdAcHReUBA4gZqbkMAJT2CfH4iL3u5bV8ibKC/Nrw+DyGMGBTvNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mSCHyne2; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mSCHyne2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736835392; x=1768371392;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h0FzFn1p1VlEN36Kvt1vy+ChoJTjJwa1HDg8+JHMxw8=;
  b=mSCHyne2qh/tkyozNn4LU+43vKHiwi6BFcy+1NXwzFKOXdiPiQFKmvuH
   KCyO7/FEziYNHNn0Ydr43fMlzC2y1UpD8BHEPDs1DuFIjBzh+Bx0rsTOx
   M19wxufl3NsrN/nvbfP3btpiw2TGyCDD9a2EEiQgXIxseYBMXcUGBEBkW
   EIry15sKITbPyKHhcm9IsQLH99KpQTdxgapuoTgFO9A3RUnxBEvlPffHz
   E2BmxTKVNWA8VwG12o8sZfh0UO3PUFqoS+vanE4OXLmNNFz/bKYZxEVta
   we3WErM+gENx0R9OZyPx5RcHOw1PrwsWwSBD5wWkgrZ9MlVYLj7B8ylH4
   A==;
X-CSE-ConnectionGUID: CcSXXuAwTvyAWwYzf5KdbA==
X-CSE-MsgGUID: 1Z4rWSaSQBuy+jBoqLiIDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="36808054"
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; 
   d="scan'208";a="36808054"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 22:16:32 -0800
X-CSE-ConnectionGUID: z2rkO7pOT9mL+PUl3A5K+g==
X-CSE-MsgGUID: z/DynDRBSxaZzDYEX8UzQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108768267"
Received: from rfrazer-mobl3.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.150])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 22:16:29 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH v2 1/2] soundwire: cadence_master: set frame shape and divider based on actual clk freq
Date: Tue, 14 Jan 2025 14:16:20 +0800
Message-ID: <20250114061621.110800-2-yung-chuan.liao@linux.intel.com>
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

Frame shape and curr_dr_freq could be updated by sdw_compute_bus_params().
Peripherals will set curr_dr_freq as their frequency. Managers
should do the same. Then update frame shape according to the actual
bus frequency.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index f367670ea991..68be8ff3f02b 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -1341,7 +1341,7 @@ static u32 cdns_set_initial_frame_shape(int n_rows, int n_cols)
 	return val;
 }
 
-static void cdns_init_clock_ctrl(struct sdw_cdns *cdns)
+static int cdns_init_clock_ctrl(struct sdw_cdns *cdns)
 {
 	struct sdw_bus *bus = &cdns->bus;
 	struct sdw_master_prop *prop = &bus->prop;
@@ -1355,14 +1355,25 @@ static void cdns_init_clock_ctrl(struct sdw_cdns *cdns)
 		prop->default_row,
 		prop->default_col);
 
+	if (!prop->default_frame_rate || !prop->default_row) {
+		dev_err(cdns->dev, "Default frame_rate %d or row %d is invalid\n",
+			prop->default_frame_rate, prop->default_row);
+		return -EINVAL;
+	}
+
 	/* Set clock divider */
-	divider	= (prop->mclk_freq / prop->max_clk_freq) - 1;
+	divider	= (prop->mclk_freq * SDW_DOUBLE_RATE_FACTOR /
+		bus->params.curr_dr_freq) - 1;
 
 	cdns_updatel(cdns, CDNS_MCP_CLK_CTRL0,
 		     CDNS_MCP_CLK_MCLKD_MASK, divider);
 	cdns_updatel(cdns, CDNS_MCP_CLK_CTRL1,
 		     CDNS_MCP_CLK_MCLKD_MASK, divider);
 
+	/* Set frame shape base on the actual bus frequency. */
+	prop->default_col = bus->params.curr_dr_freq /
+			    prop->default_frame_rate / prop->default_row;
+
 	/*
 	 * Frame shape changes after initialization have to be done
 	 * with the bank switch mechanism
@@ -1375,6 +1386,8 @@ static void cdns_init_clock_ctrl(struct sdw_cdns *cdns)
 	ssp_interval = prop->default_frame_rate / SDW_CADENCE_GSYNC_HZ;
 	cdns_writel(cdns, CDNS_MCP_SSP_CTRL0, ssp_interval);
 	cdns_writel(cdns, CDNS_MCP_SSP_CTRL1, ssp_interval);
+
+	return 0;
 }
 
 /**
@@ -1408,9 +1421,12 @@ EXPORT_SYMBOL(sdw_cdns_soft_reset);
  */
 int sdw_cdns_init(struct sdw_cdns *cdns)
 {
+	int ret;
 	u32 val;
 
-	cdns_init_clock_ctrl(cdns);
+	ret = cdns_init_clock_ctrl(cdns);
+	if (ret)
+		return ret;
 
 	sdw_cdns_check_self_clearing_bits(cdns, __func__, false, 0);
 
-- 
2.43.0

