Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA1F19AD48;
	Wed, 18 Dec 2024 08:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734508948; cv=none; b=fE44Q8ZtSWSZTdtBkXsfK3DalAqx8Mrjm3PiL5ykBEgq4Zph1Qnqy8IRuOzO7Utv9Ngfc3EwWADahf82tBOXxGUK+NJHS6p3xp8SVpBUSlhcXStlB7XaalUho09g+pqV4P6qgzPC3Yw6p8uiSITwUHKEhE2xLO4skKuYV62iVH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734508948; c=relaxed/simple;
	bh=UikNoJbqbwmBIC3RSEF3Y9myZ0Uh3zNXnLBlJw80wPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SYivSZXCPgaFgT29U661Sep803l5foiR949jJi7KZkrsRili09BXZDhLuBPGl6ZAqEnsd8KMUoTW+decq2YHORsK4mqWbYxJuLZukJltqMwxrasroimhuQA1PPC5qQGgqXe/VD3Oupcwanj2rvzhavDYS0H+LKi77YogCoABLKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NqttsB0L; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NqttsB0L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734508946; x=1766044946;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UikNoJbqbwmBIC3RSEF3Y9myZ0Uh3zNXnLBlJw80wPI=;
  b=NqttsB0LawDmKNfim/bndqhb0rnCX8YDYcIi0wmTbs9kzR76Ka/ktOFZ
   uo9EwnvqTnE30aNihAYidQAVM/QhnVf39oeF7x5/OY5vaThSpKu4thaxm
   bk0+MH31l6TPfi9P0LKR5p4F1bE4r1qZbyb/gxpNMwhy4EBu0MWh/rGhp
   9Dy8CohBhmfEWN8RfKk+njBidS3RtC2JuHhB+NcIQ6WXe/C5dHvd/DnF+
   ryJ9uHz0YyL95W92aVgePdfstBLbNidExiStw/wDzQVY+AU1ZJWPdWb/x
   +9DH6KJest1obixiC+KzYMecsrNyaE59gmOZjCX+Wdspy+6B7kQnR+P/b
   Q==;
X-CSE-ConnectionGUID: JSytVvhzTo6ONoHFeAbjbA==
X-CSE-MsgGUID: tR+I2nfBSDKQjz9IYFuU0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="45978635"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="45978635"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 00:02:21 -0800
X-CSE-ConnectionGUID: AAe9tp2gTnawkbv9gAN0qA==
X-CSE-MsgGUID: BwygRMpgQdK21evfGPNZSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101914714"
Received: from tfalcon-desk.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.220.206])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 00:02:20 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH v3 12/14] soundwire: generic_bandwidth_allocation: add lane in sdw_group_params
Date: Wed, 18 Dec 2024 16:01:53 +0800
Message-ID: <20241218080155.102405-13-yung-chuan.liao@linux.intel.com>
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

All active streams with the same parameters are grouped together and the
params are stored in the sdw_group struct. We compute the required
bandwidth for each group. However, each lane has individual bandwidth.
Therefore, we should separate different lanes in different params groups.
Add lane variable to separate params groups.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 drivers/soundwire/bus.h                       |   1 +
 .../soundwire/generic_bandwidth_allocation.c  | 122 +++++++++++++-----
 2 files changed, 90 insertions(+), 33 deletions(-)

diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index ff03b97f1d8b..fc990171b3f7 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -151,6 +151,7 @@ struct sdw_transport_data {
 	int hstop;
 	int block_offset;
 	int sub_block_offset;
+	unsigned int lane;
 };
 
 struct sdw_dpn_prop *sdw_get_slave_dpn_prop(struct sdw_slave *slave,
diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
index 39b4d25ab19e..faf04d82ba0a 100644
--- a/drivers/soundwire/generic_bandwidth_allocation.c
+++ b/drivers/soundwire/generic_bandwidth_allocation.c
@@ -18,6 +18,7 @@
 
 struct sdw_group_params {
 	unsigned int rate;
+	unsigned int lane;
 	int full_bw;
 	int payload_bw;
 	int hwidth;
@@ -27,6 +28,7 @@ struct sdw_group {
 	unsigned int count;
 	unsigned int max_size;
 	unsigned int *rates;
+	unsigned int *lanes;
 };
 
 void sdw_compute_slave_ports(struct sdw_master_runtime *m_rt,
@@ -48,6 +50,9 @@ void sdw_compute_slave_ports(struct sdw_master_runtime *m_rt,
 		slave_total_ch = 0;
 
 		list_for_each_entry(p_rt, &s_rt->port_list, port_node) {
+			if (p_rt->lane != t_data->lane)
+				continue;
+
 			ch = hweight32(p_rt->ch_mask);
 
 			sdw_fill_xport_params(&p_rt->transport_params,
@@ -105,6 +110,8 @@ static void sdw_compute_master_ports(struct sdw_master_runtime *m_rt,
 	t_data.hstart = hstart;
 
 	list_for_each_entry(p_rt, &m_rt->port_list, port_node) {
+		if (p_rt->lane != params->lane)
+			continue;
 
 		sdw_fill_xport_params(&p_rt->transport_params, p_rt->num,
 				      false, SDW_BLK_GRP_CNT_1, sample_int,
@@ -131,6 +138,7 @@ static void sdw_compute_master_ports(struct sdw_master_runtime *m_rt,
 		(*port_bo) += bps * ch;
 	}
 
+	t_data.lane = params->lane;
 	sdw_compute_slave_ports(m_rt, &t_data);
 }
 
@@ -138,69 +146,93 @@ static void _sdw_compute_port_params(struct sdw_bus *bus,
 				     struct sdw_group_params *params, int count)
 {
 	struct sdw_master_runtime *m_rt;
-	int hstop = bus->params.col - 1;
-	int port_bo, i;
+	int port_bo, i, l;
+	int hstop;
 
 	/* Run loop for all groups to compute transport parameters */
-	for (i = 0; i < count; i++) {
-		port_bo = 1;
+	for (l = 0; l < SDW_MAX_LANES; l++) {
+		if (l > 0 && !bus->lane_used_bandwidth[l])
+			continue;
+		/* reset hstop for each lane */
+		hstop = bus->params.col - 1;
+		for (i = 0; i < count; i++) {
+			if (params[i].lane != l)
+				continue;
+			port_bo = 1;
 
-		list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
-			sdw_compute_master_ports(m_rt, &params[i], &port_bo, hstop);
+			list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
+				sdw_compute_master_ports(m_rt, &params[i], &port_bo, hstop);
+			}
+
+			hstop = hstop - params[i].hwidth;
 		}
-
-		hstop = hstop - params[i].hwidth;
 	}
 }
 
 static int sdw_compute_group_params(struct sdw_bus *bus,
 				    struct sdw_group_params *params,
-				    int *rates, int count)
+				    struct sdw_group *group)
 {
 	struct sdw_master_runtime *m_rt;
+	struct sdw_port_runtime *p_rt;
 	int sel_col = bus->params.col;
 	unsigned int rate, bps, ch;
-	int i, column_needed = 0;
+	int i, l, column_needed;
 
 	/* Calculate bandwidth per group */
-	for (i = 0; i < count; i++) {
-		params[i].rate = rates[i];
+	for (i = 0; i < group->count; i++) {
+		params[i].rate = group->rates[i];
+		params[i].lane = group->lanes[i];
 		params[i].full_bw = bus->params.curr_dr_freq / params[i].rate;
 	}
 
 	list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
-		rate = m_rt->stream->params.rate;
-		bps = m_rt->stream->params.bps;
-		ch = m_rt->ch_count;
+		list_for_each_entry(p_rt, &m_rt->port_list, port_node) {
+			rate = m_rt->stream->params.rate;
+			bps = m_rt->stream->params.bps;
+			ch = hweight32(p_rt->ch_mask);
 
-		for (i = 0; i < count; i++) {
-			if (rate == params[i].rate)
-				params[i].payload_bw += bps * ch;
+			for (i = 0; i < group->count; i++) {
+				if (rate == params[i].rate && p_rt->lane == params[i].lane)
+					params[i].payload_bw += bps * ch;
+			}
 		}
 	}
 
-	for (i = 0; i < count; i++) {
-		params[i].hwidth = (sel_col *
-			params[i].payload_bw + params[i].full_bw - 1) /
-			params[i].full_bw;
+	for (l = 0; l < SDW_MAX_LANES; l++) {
+		if (l > 0 && !bus->lane_used_bandwidth[l])
+			continue;
+		/* reset column_needed for each lane */
+		column_needed = 0;
+		for (i = 0; i < group->count; i++) {
+			if (params[i].lane != l)
+				continue;
 
-		column_needed += params[i].hwidth;
+			params[i].hwidth = (sel_col * params[i].payload_bw +
+					    params[i].full_bw - 1) / params[i].full_bw;
+
+			column_needed += params[i].hwidth;
+			/* There is no control column for lane 1 and above */
+			if (column_needed > sel_col)
+				return -EINVAL;
+			/* Column 0 is control column on lane 0 */
+			if (params[i].lane == 0 && column_needed > sel_col - 1)
+				return -EINVAL;
+		}
 	}
 
-	if (column_needed > sel_col - 1)
-		return -EINVAL;
 
 	return 0;
 }
 
 static int sdw_add_element_group_count(struct sdw_group *group,
-				       unsigned int rate)
+				       unsigned int rate, unsigned int lane)
 {
 	int num = group->count;
 	int i;
 
 	for (i = 0; i <= num; i++) {
-		if (rate == group->rates[i])
+		if (rate == group->rates[i] && lane == group->lanes[i])
 			break;
 
 		if (i != num)
@@ -208,6 +240,7 @@ static int sdw_add_element_group_count(struct sdw_group *group,
 
 		if (group->count >= group->max_size) {
 			unsigned int *rates;
+			unsigned int *lanes;
 
 			group->max_size += 1;
 			rates = krealloc(group->rates,
@@ -215,10 +248,20 @@ static int sdw_add_element_group_count(struct sdw_group *group,
 					 GFP_KERNEL);
 			if (!rates)
 				return -ENOMEM;
+
 			group->rates = rates;
+
+			lanes = krealloc(group->lanes,
+					 (sizeof(int) * group->max_size),
+					 GFP_KERNEL);
+			if (!lanes)
+				return -ENOMEM;
+
+			group->lanes = lanes;
 		}
 
-		group->rates[group->count++] = rate;
+		group->rates[group->count] = rate;
+		group->lanes[group->count++] = lane;
 	}
 
 	return 0;
@@ -228,6 +271,7 @@ static int sdw_get_group_count(struct sdw_bus *bus,
 			       struct sdw_group *group)
 {
 	struct sdw_master_runtime *m_rt;
+	struct sdw_port_runtime *p_rt;
 	unsigned int rate;
 	int ret = 0;
 
@@ -237,6 +281,13 @@ static int sdw_get_group_count(struct sdw_bus *bus,
 	if (!group->rates)
 		return -ENOMEM;
 
+	group->lanes = kcalloc(group->max_size, sizeof(int), GFP_KERNEL);
+	if (!group->lanes) {
+		kfree(group->rates);
+		group->rates = NULL;
+		return -ENOMEM;
+	}
+
 	list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
 		if (m_rt->stream->state == SDW_STREAM_DEPREPARED)
 			continue;
@@ -246,11 +297,16 @@ static int sdw_get_group_count(struct sdw_bus *bus,
 					     struct sdw_master_runtime,
 					     bus_node)) {
 			group->rates[group->count++] = rate;
-
-		} else {
-			ret = sdw_add_element_group_count(group, rate);
+		}
+		/*
+		 * Different ports could use different lane, add group element
+		 * even if m_rt is the first entry
+		 */
+		list_for_each_entry(p_rt, &m_rt->port_list, port_node) {
+			ret = sdw_add_element_group_count(group, rate, p_rt->lane);
 			if (ret < 0) {
 				kfree(group->rates);
+				kfree(group->lanes);
 				return ret;
 			}
 		}
@@ -284,8 +340,7 @@ static int sdw_compute_port_params(struct sdw_bus *bus)
 	}
 
 	/* Compute transport parameters for grouped streams */
-	ret = sdw_compute_group_params(bus, params,
-				       &group.rates[0], group.count);
+	ret = sdw_compute_group_params(bus, params, &group);
 	if (ret < 0)
 		goto free_params;
 
@@ -295,6 +350,7 @@ static int sdw_compute_port_params(struct sdw_bus *bus)
 	kfree(params);
 out:
 	kfree(group.rates);
+	kfree(group.lanes);
 
 	return ret;
 }
-- 
2.43.0

