Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21608198A11;
	Wed, 18 Dec 2024 08:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734508943; cv=none; b=RxVTvjORXUppAOHyqIdPAhwe3RqrKt9g6wtQrpPV9wGtpB5f3zINSWW+MGCq+51hIwK/L/Klh0YAECUTGx1YX3sDlH2R2iOTA8gmLWxBW7IPUrnONtbgsqO1qDBk0JDafkXIzHDu5QYqNPxydx/K68ScJKyhJHyClmUf6Jgkq14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734508943; c=relaxed/simple;
	bh=ApjkdRYwQ2ORFr53CDMbK49sgSkAU2vxCx5m+FcoCxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oiFKnYXuXROTVfElmpC2m7BxHpLpj8MCrM/smZjO4qgtCMUigaEDgF3LaZbQHFuafX9+sP2X/6UIWyDlJUL1V0OwNiyXEk2snTGJJt1jGzUgPxbBfDci3vwAhLbvUb3QMe0YIvQrxrA+/1DYVaqcUNQMYKfv4lKPy1NJT6fXNvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Njuk6Ppf; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Njuk6Ppf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734508942; x=1766044942;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ApjkdRYwQ2ORFr53CDMbK49sgSkAU2vxCx5m+FcoCxI=;
  b=Njuk6PpfnKT9MvnKrGZ3Md2euNaD/tE0IrJDi/pBhbbeTnLnRCGV9R6/
   tJdYcarWfEJQ4zi4aC1WpnQvytX4lWI3gSSLl2NlnfJ6KImASSuCBGISJ
   /Mb85ov9HPs60iO7X2DghxvAagef4S69hGBUnirH0J687k86rLTV+WAq4
   HZNEuTm4grQBARiDKgmJv99LdoX5o3o830K1PtGNbxBDB+7im+yMCre8e
   mRiGfXfVR1kOlQWhycOSTlZanLTKDGCTMS+4V1aqEOz7GzX140Ecn7EUx
   pPWp0/nye72NCJbGXQl3sgt/sli5NCL8dSWTGZA1lvLNYctqNEAldeZlJ
   w==;
X-CSE-ConnectionGUID: vZFLWr2bR+Cpjlz1N9vggQ==
X-CSE-MsgGUID: QACwBJKJRdCzSfme1WXDpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="45978585"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="45978585"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 00:02:15 -0800
X-CSE-ConnectionGUID: h0na5ts0Shytc7XgZJ3xZA==
X-CSE-MsgGUID: caGNMDQoTGuN+tE7N58KBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101914680"
Received: from tfalcon-desk.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.220.206])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 00:02:14 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH v3 08/14] Soundwire: generic_bandwidth_allocation: set frame shape on fly
Date: Wed, 18 Dec 2024 16:01:49 +0800
Message-ID: <20241218080155.102405-9-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241218080155.102405-1-yung-chuan.liao@linux.intel.com>
References: <20241218080155.102405-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We need to recalculate frame shape when sdw bus clock is changed.
And need to make sure all Peripherals connected to the Manager support
dynamic clock change.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 .../soundwire/generic_bandwidth_allocation.c  | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
index 2950a3d002ce..d847413141d3 100644
--- a/drivers/soundwire/generic_bandwidth_allocation.c
+++ b/drivers/soundwire/generic_bandwidth_allocation.c
@@ -327,6 +327,19 @@ static int sdw_select_row_col(struct sdw_bus *bus, int clk_freq)
 	return -EINVAL;
 }
 
+static bool is_clock_scaling_supported(struct sdw_bus *bus)
+{
+	struct sdw_master_runtime *m_rt;
+	struct sdw_slave_runtime *s_rt;
+
+	list_for_each_entry(m_rt, &bus->m_rt_list, bus_node)
+		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node)
+			if (!is_clock_scaling_supported_by_slave(s_rt->slave))
+				return false;
+
+	return true;
+}
+
 /**
  * sdw_compute_bus_params: Compute bus parameters
  *
@@ -352,6 +365,10 @@ static int sdw_compute_bus_params(struct sdw_bus *bus)
 		clk_buf = NULL;
 	}
 
+	/* If dynamic scaling is not supported, don't try higher freq */
+	if (!is_clock_scaling_supported(bus))
+		clk_values = 1;
+
 	for (i = 0; i < clk_values; i++) {
 		if (!clk_buf)
 			curr_dr_freq = bus->params.max_dr_freq;
@@ -378,6 +395,12 @@ static int sdw_compute_bus_params(struct sdw_bus *bus)
 		return -EINVAL;
 	}
 
+	if (!mstr_prop->default_frame_rate || !mstr_prop->default_row)
+		return -EINVAL;
+
+	mstr_prop->default_col = curr_dr_freq / mstr_prop->default_frame_rate /
+				 mstr_prop->default_row;
+
 	ret = sdw_select_row_col(bus, curr_dr_freq);
 	if (ret < 0) {
 		dev_err(bus->dev, "%s: could not find frame configuration for bus dr_freq %d\n",
-- 
2.43.0

