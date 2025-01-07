Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092A586321;
	Tue,  7 Jan 2025 01:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736215116; cv=none; b=jLwy0MD4N1j5hcfIKn23Iu/lPFFf4OmvzUs88ec8md9Um+i4nDL5PVUXnxuygWuXeMxQnZrKu8srSb2rZm62XlmbJ90ORORqBfxRXcciZo4cAXfaoFY20Fg3Qw1RX813vczWkKXYiJzsH/zzS8Y2rq/NR9Rzymn7sVv8Xra2yb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736215116; c=relaxed/simple;
	bh=fyTuj6Hj+uJBQJeo9L3cZ4RIREVWX9F3lkW8b7FC+ik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lWxmHcxpcjs9pzLh6GEWxDfcQsFs5ff777dqm7qHAnJTO2gQ4Ts4zJ4uCc97kq/St7F04/x9EF4LBREOtnBPQCtldcdfJWjshDP2MGU0+IO/5CLu1DPJmoZNrNlr1e3UBHJe8vRX5Pstfrqc94KwG87ku00eKkp/aohLPYnEZ30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fLmYePxY; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fLmYePxY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736215115; x=1767751115;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fyTuj6Hj+uJBQJeo9L3cZ4RIREVWX9F3lkW8b7FC+ik=;
  b=fLmYePxYqoNNGOX6m4rCERxAPrWZWU322OBZeJwuuwdxW/o4lNZqhO18
   txB5xCGP6R8WGujqy3OCdzN17yKHkljpHfHVe33g7KcQ5StxMpblkywoW
   ZSiihNR+7g/1yZIVzTcmNrpz+qXpPUWgJxHBOHZsbCLVLAo4I7JLG6KiY
   GChZ+1X/164nOMnOVBdHMFmrU54qunCx+FG023ltH/4NDmrxNbHIhuopD
   4njEC4Z627z5kRYEko+pVkY8uBbeXNTFc7RFHF/OqhBdKXtQCWJFSp4G8
   VyTWD/AYL+BrI7BaWq/BI5lZau9cOGpbgvKkuSSsceKa+58QDWwyUpHP8
   w==;
X-CSE-ConnectionGUID: XNG++eucT5uGM653FwBI7w==
X-CSE-MsgGUID: EEOBjYrXSJS1oyrsAa1hOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36396897"
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="36396897"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 17:58:34 -0800
X-CSE-ConnectionGUID: 3prc3bTHTXSm734mjiK7vA==
X-CSE-MsgGUID: cz3RkN1UTT26YSiOt39u5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="102798808"
Received: from daliomra-mobl3.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.221.46])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 17:58:32 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 1/2] soundwire: cadence_master: set frame shape and divider based on actual clk freq
Date: Tue,  7 Jan 2025 09:58:23 +0800
Message-ID: <20250107015824.5046-2-yung-chuan.liao@linux.intel.com>
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

Frame shape and curr_dr_freq could be updated by sdw_compute_bus_params().
Peripherals will set curr_dr_freq as their frequency. Managers
should do the same. Then update frame shape according to the actual
bus frequency.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index f367670ea991..a49d4e521a8f 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -1341,13 +1341,14 @@ static u32 cdns_set_initial_frame_shape(int n_rows, int n_cols)
 	return val;
 }
 
-static void cdns_init_clock_ctrl(struct sdw_cdns *cdns)
+static int cdns_init_clock_ctrl(struct sdw_cdns *cdns)
 {
 	struct sdw_bus *bus = &cdns->bus;
 	struct sdw_master_prop *prop = &bus->prop;
 	u32 val;
 	u32 ssp_interval;
 	int divider;
+	int freq;
 
 	dev_dbg(cdns->dev, "mclk %d max %d row %d col %d\n",
 		prop->mclk_freq,
@@ -1356,13 +1357,25 @@ static void cdns_init_clock_ctrl(struct sdw_cdns *cdns)
 		prop->default_col);
 
 	/* Set clock divider */
-	divider	= (prop->mclk_freq / prop->max_clk_freq) - 1;
+	divider	= (prop->mclk_freq * SDW_DOUBLE_RATE_FACTOR /
+		bus->params.curr_dr_freq) - 1;
+	freq = bus->params.curr_dr_freq >> 1;
 
 	cdns_updatel(cdns, CDNS_MCP_CLK_CTRL0,
 		     CDNS_MCP_CLK_MCLKD_MASK, divider);
 	cdns_updatel(cdns, CDNS_MCP_CLK_CTRL1,
 		     CDNS_MCP_CLK_MCLKD_MASK, divider);
 
+	/* Set frame shape base on the actual bus frequency. */
+	if (!prop->default_frame_rate || !prop->default_row) {
+		dev_err(cdns->dev, "Default frame_rate %d or row %d is invalid\n",
+			prop->default_frame_rate, prop->default_row);
+		return -EINVAL;
+	}
+
+	prop->default_col = freq * SDW_DOUBLE_RATE_FACTOR /
+			    prop->default_frame_rate / prop->default_row;
+
 	/*
 	 * Frame shape changes after initialization have to be done
 	 * with the bank switch mechanism
@@ -1375,6 +1388,8 @@ static void cdns_init_clock_ctrl(struct sdw_cdns *cdns)
 	ssp_interval = prop->default_frame_rate / SDW_CADENCE_GSYNC_HZ;
 	cdns_writel(cdns, CDNS_MCP_SSP_CTRL0, ssp_interval);
 	cdns_writel(cdns, CDNS_MCP_SSP_CTRL1, ssp_interval);
+
+	return 0;
 }
 
 /**
@@ -1408,9 +1423,12 @@ EXPORT_SYMBOL(sdw_cdns_soft_reset);
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

