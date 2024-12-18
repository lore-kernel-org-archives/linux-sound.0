Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EE1199EB2;
	Wed, 18 Dec 2024 08:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734508947; cv=none; b=p6qObOFl2cVSxsNr4zHfSKqoLcySw31ergDb3UaaWKogDx1pDa4bzR9GoERH72EvnXbX23V0OI6ckiRLlnvSQfbqqokVgxOuegItcloM9fHFd77weqvJalShGsqAhwofMHgUVnvpzlDDUOj6aOKjyHi6JuR9tWrn2WrVXbze1O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734508947; c=relaxed/simple;
	bh=YypEanDj3/kmNKA5muwnflpkVHeHQYcCW8/mOSi0cg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qugakrI6Gqt6rxv2J6IhxGKZ6+BIqkuJ4wKXJs8lAJvD/M0MJ8Ia4Fi7qeQbiWzxlutwnU9rvMty5FG9tWskFKzVGk91D9G659JMRQaS/YoVlK7a/OmAPCZFPeKRHznILPaAi9TrMHmxszx3dtBdNjYCyLbxFfuFVXmiToRDLBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ltwPbOA2; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ltwPbOA2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734508946; x=1766044946;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YypEanDj3/kmNKA5muwnflpkVHeHQYcCW8/mOSi0cg0=;
  b=ltwPbOA2L9+PFwj5HGt394/fQ72j15XTuSJiC28vyLmU664H/zXl/83o
   cnPXGVmepEV1h6W/osqvUHzoDmhJsCJzTHleSaGcbjb0NSFbV21ZcN1U3
   ISXE/RzbsIr8mUqnFHna7UYc71Pg+d00Cs+3pb51mBBIx1MvycufQokMo
   5XTyxSh5rK85dqLC4G2Slg98TbSSYmihwKzWQ64Bl08/0VywoR5ntaJ40
   W74yEWagSTWgyZYQmD7Ybou6moQCX2HbEQxCWEX3jxujCQ2KlScoYYjMj
   s79tmG/UbzBLluh3VX2Pl9NnvjFWnVvc59tgefsV/3Z5F2cI7QaUxbFaE
   Q==;
X-CSE-ConnectionGUID: yDg6QSmtSwu9zaZv2Qb0ow==
X-CSE-MsgGUID: nhi5MrsARHG8cJZLzOtgNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="45978622"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="45978622"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 00:02:19 -0800
X-CSE-ConnectionGUID: QAi01wIHT4awl3BeGm+8rw==
X-CSE-MsgGUID: JvuBM0vhRCSSlm84twTQRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101914709"
Received: from tfalcon-desk.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.220.206])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 00:02:18 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH v3 11/14] soundwire: generic_bandwidth_allocation: select data lane
Date: Wed, 18 Dec 2024 16:01:52 +0800
Message-ID: <20241218080155.102405-12-yung-chuan.liao@linux.intel.com>
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

If a peripheral supports multi-lane, we can use data lane x to extend
the bandwidth. The patch suggests to select data lane x where x > 0
when bandwidth is not enough on data lane 0.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 .../soundwire/generic_bandwidth_allocation.c  | 133 +++++++++++++++++-
 drivers/soundwire/stream.c                    |  20 ++-
 2 files changed, 146 insertions(+), 7 deletions(-)

diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
index d2632af9c8af..39b4d25ab19e 100644
--- a/drivers/soundwire/generic_bandwidth_allocation.c
+++ b/drivers/soundwire/generic_bandwidth_allocation.c
@@ -336,6 +336,82 @@ static bool is_clock_scaling_supported(struct sdw_bus *bus)
 	return true;
 }
 
+/**
+ * is_lane_connected_to_all_peripherals: Check if the given manager lane connects to all peripherals
+ * So that all peripherals can use the manager lane.
+ *
+ * @m_rt: Manager runtime
+ * @lane: Lane number
+ */
+static bool is_lane_connected_to_all_peripherals(struct sdw_master_runtime *m_rt, unsigned int lane)
+{
+	struct sdw_slave_prop *slave_prop;
+	struct sdw_slave_runtime *s_rt;
+	int i;
+
+	list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
+		slave_prop = &s_rt->slave->prop;
+		for (i = 1; i < SDW_MAX_LANES; i++) {
+			if (slave_prop->lane_maps[i] == lane) {
+				dev_dbg(&s_rt->slave->dev,
+					"M lane %d is connected to P lane %d\n",
+					lane, i);
+				break;
+			}
+		}
+		if (i == SDW_MAX_LANES) {
+			dev_dbg(&s_rt->slave->dev, "M lane %d is not connected\n", lane);
+			return false;
+		}
+	}
+	return true;
+}
+
+static int get_manager_lane(struct sdw_bus *bus, struct sdw_master_runtime *m_rt,
+			    struct sdw_slave_runtime *s_rt, unsigned int curr_dr_freq)
+{
+	struct sdw_slave_prop *slave_prop = &s_rt->slave->prop;
+	struct sdw_port_runtime *m_p_rt;
+	unsigned int required_bandwidth;
+	int m_lane;
+	int l;
+
+	for (l = 1; l < SDW_MAX_LANES; l++) {
+		if (!slave_prop->lane_maps[l])
+			continue;
+
+		required_bandwidth = 0;
+		list_for_each_entry(m_p_rt, &m_rt->port_list, port_node) {
+			required_bandwidth += m_rt->stream->params.rate *
+					      hweight32(m_p_rt->ch_mask) *
+					      m_rt->stream->params.bps;
+		}
+		if (required_bandwidth <=
+		    curr_dr_freq - bus->lane_used_bandwidth[l]) {
+			/* Check if m_lane is connected to all Peripherals */
+			if (!is_lane_connected_to_all_peripherals(m_rt,
+				slave_prop->lane_maps[l])) {
+				dev_dbg(bus->dev,
+					"Not all Peripherals are connected to M lane %d\n",
+					slave_prop->lane_maps[l]);
+				continue;
+			}
+			m_lane = slave_prop->lane_maps[l];
+			dev_dbg(&s_rt->slave->dev, "M lane %d is used\n", m_lane);
+			bus->lane_used_bandwidth[l] += required_bandwidth;
+			/*
+			 * Use non-zero manager lane, subtract the lane 0
+			 * bandwidth that is already calculated
+			 */
+			bus->params.bandwidth -= required_bandwidth;
+			return m_lane;
+		}
+	}
+
+	/* No available multi lane found, only lane 0 can be used */
+	return 0;
+}
+
 /**
  * sdw_compute_bus_params: Compute bus parameters
  *
@@ -343,10 +419,16 @@ static bool is_clock_scaling_supported(struct sdw_bus *bus)
  */
 static int sdw_compute_bus_params(struct sdw_bus *bus)
 {
-	unsigned int curr_dr_freq = 0;
 	struct sdw_master_prop *mstr_prop = &bus->prop;
-	int i, clk_values, ret;
+	struct sdw_slave_prop *slave_prop;
+	struct sdw_port_runtime *m_p_rt;
+	struct sdw_port_runtime *s_p_rt;
+	struct sdw_master_runtime *m_rt;
+	struct sdw_slave_runtime *s_rt;
+	unsigned int curr_dr_freq = 0;
+	int i, l, clk_values, ret;
 	bool is_gear = false;
+	int m_lane = 0;
 	u32 *clk_buf;
 
 	if (mstr_prop->num_clk_gears) {
@@ -373,11 +455,26 @@ static int sdw_compute_bus_params(struct sdw_bus *bus)
 				(bus->params.max_dr_freq >>  clk_buf[i]) :
 				clk_buf[i] * SDW_DOUBLE_RATE_FACTOR;
 
-		if (curr_dr_freq * (mstr_prop->default_col - 1) <
+		if (curr_dr_freq * (mstr_prop->default_col - 1) >=
 		    bus->params.bandwidth * mstr_prop->default_col)
-			continue;
+			break;
 
-		break;
+		list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
+			/*
+			 * Get the first s_rt that will be used to find the available lane that
+			 * can be used. No need to check all Peripherals because we can't use
+			 * multi-lane if we can't find any available lane for the first Peripheral.
+			 */
+			s_rt = list_first_entry(&m_rt->slave_rt_list,
+						struct sdw_slave_runtime, m_rt_node);
+
+			/*
+			 * Find the available Manager lane that connected to the first Peripheral.
+			 */
+			m_lane = get_manager_lane(bus, m_rt, s_rt, curr_dr_freq);
+			if (m_lane > 0)
+				goto out;
+		}
 
 		/*
 		 * TODO: Check all the Slave(s) port(s) audio modes and find
@@ -391,6 +488,32 @@ static int sdw_compute_bus_params(struct sdw_bus *bus)
 			__func__, bus->params.bandwidth);
 		return -EINVAL;
 	}
+out:
+	/* multilane can be used */
+	if (m_lane > 0) {
+		/* Set Peripheral lanes */
+		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
+			slave_prop = &s_rt->slave->prop;
+			for (l = 1; l < SDW_MAX_LANES; l++) {
+				if (slave_prop->lane_maps[l] == m_lane) {
+					list_for_each_entry(s_p_rt, &s_rt->port_list, port_node) {
+						s_p_rt->lane = l;
+						dev_dbg(&s_rt->slave->dev,
+							"Set P lane %d for port %d\n",
+							l, s_p_rt->num);
+					}
+					break;
+				}
+			}
+		}
+		/*
+		 * Set Manager lanes. Configure the last m_rt in bus->m_rt_list only since
+		 * we don't want to touch other m_rts that are already working.
+		 */
+		list_for_each_entry(m_p_rt, &m_rt->port_list, port_node) {
+			m_p_rt->lane = m_lane;
+		}
+	}
 
 	if (!mstr_prop->default_frame_rate || !mstr_prop->default_row)
 		return -EINVAL;
diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index bf04b941012c..892409cdb88c 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1678,6 +1678,9 @@ EXPORT_SYMBOL(sdw_disable_stream);
 static int _sdw_deprepare_stream(struct sdw_stream_runtime *stream)
 {
 	struct sdw_master_runtime *m_rt;
+	struct sdw_port_runtime *p_rt;
+	unsigned int multi_lane_bandwidth;
+	unsigned int bandwidth;
 	struct sdw_bus *bus;
 	int state = stream->state;
 	int ret = 0;
@@ -1699,9 +1702,22 @@ static int _sdw_deprepare_stream(struct sdw_stream_runtime *stream)
 			return ret;
 		}
 
+		multi_lane_bandwidth = 0;
+
+		list_for_each_entry(p_rt, &m_rt->port_list, port_node) {
+			if (!p_rt->lane)
+				continue;
+
+			bandwidth = m_rt->stream->params.rate * hweight32(p_rt->ch_mask) *
+				    m_rt->stream->params.bps;
+			multi_lane_bandwidth += bandwidth;
+			bus->lane_used_bandwidth[p_rt->lane] -= bandwidth;
+			if (!bus->lane_used_bandwidth[p_rt->lane])
+				p_rt->lane = 0;
+		}
 		/* TODO: Update this during Device-Device support */
-		bus->params.bandwidth -= m_rt->stream->params.rate *
-			m_rt->ch_count * m_rt->stream->params.bps;
+		bandwidth = m_rt->stream->params.rate * m_rt->ch_count * m_rt->stream->params.bps;
+		bus->params.bandwidth -= bandwidth - multi_lane_bandwidth;
 
 		/* Compute params */
 		if (bus->compute_params) {
-- 
2.43.0

