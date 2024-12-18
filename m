Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C69B194AFB;
	Wed, 18 Dec 2024 08:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734508943; cv=none; b=OZPBq4+2LQya4DJm3Byghc2AyV1GqvMEF5uM/PUdrzFfCGQtMxzoly7j+YeE4Dvo9ToMoSxjTAUE3Qng5894XP5+UuXidhP5cIAK1y4BVQkv83aM3f8QTJIg9VyzXn3/MtfJopB1yTlt/YJ/CWKzN12ypXbuxiLwhk8ytE+s7Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734508943; c=relaxed/simple;
	bh=dnLryObpY8JtPwU8tN1aNbg4eUdK73y3zC44sYI7qVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lmY0DV2/QcjiCUL3UHqVeHPwi+5MaY5asgww+1529YJkOzzh7po7rNPx8dg0kuE9o7BFbcAmKLDVmNsCj920jfWBHtcTvugmkbMW3cNgJF/zVMYsJhNJUkoggsy+VWQquR/SmeMU9QWKouXgp6D7gGVp5bahsjaHzGAXkPcIIfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RlNbBJ/K; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RlNbBJ/K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734508941; x=1766044941;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dnLryObpY8JtPwU8tN1aNbg4eUdK73y3zC44sYI7qVU=;
  b=RlNbBJ/K4wZiiS5QA6GEwlZ3Fs1d9G9/wjK2Z2tuyXhUzF7u6fG0x1Th
   ciVgstzEe7krGU7f7vhutEUpLSGZL+RV9hF/qoojEOtP4chOM6P++gAZz
   RLOCqdY2mwG/pO8Wm3LA0kkO0UYVOkJytivz2nbcfNjY/PVZuxFuNN0vQ
   wl+IDO9JvvLGEdoTrLY18UwjRnMpj5py74kIV+wT9iB6IIgI/ptgCMX0j
   JpTxI2xZ47eid/hNB0XQ8rbFJdaoCcUKn1BMrQ16sfulCAdmX4a1LI86S
   jI0w6bfHPtoSerDDyI78YlibHMM6ibzSgjcbsDdINL3rLrVujjfWyqYTf
   w==;
X-CSE-ConnectionGUID: l2Px0xfRQ963CeVBK9bs9Q==
X-CSE-MsgGUID: kZqcXM5IQ6mVddyVfvTZzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="45978565"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="45978565"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 00:02:14 -0800
X-CSE-ConnectionGUID: vRD3uqLNRbKfmlYGI4PMhw==
X-CSE-MsgGUID: +K8A/PTbRnmecl79b5s3ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101914668"
Received: from tfalcon-desk.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.220.206])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 00:02:13 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH v3 07/14] Soundwire: stream: program BUSCLOCK_SCALE
Date: Wed, 18 Dec 2024 16:01:48 +0800
Message-ID: <20241218080155.102405-8-yung-chuan.liao@linux.intel.com>
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

We need to program bus clock scale to adjust the bus clock if current
bus clock doesn't fit the bandwidth.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 drivers/soundwire/bus.c       | 10 ++++++++++
 drivers/soundwire/stream.c    | 36 +++++++++++++++++++++++++++++++++++
 include/linux/soundwire/sdw.h |  1 +
 3 files changed, 47 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 215630d602ad..9b295fc9acd5 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -813,6 +813,16 @@ void sdw_extract_slave_id(struct sdw_bus *bus,
 }
 EXPORT_SYMBOL(sdw_extract_slave_id);
 
+bool is_clock_scaling_supported_by_slave(struct sdw_slave *slave)
+{
+	/*
+	 * Dynamic scaling is a defined by SDCA. However, some devices expose the class ID but
+	 * can't support dynamic scaling. We might need a quirk to handle such devices.
+	 */
+	return slave->id.class_id;
+}
+EXPORT_SYMBOL(is_clock_scaling_supported_by_slave);
+
 static int sdw_program_device_num(struct sdw_bus *bus, bool *programmed)
 {
 	u8 buf[SDW_NUM_DEV_ID_REGISTERS] = {0};
diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 795017c8081a..bf04b941012c 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -629,8 +629,44 @@ static int sdw_notify_config(struct sdw_master_runtime *m_rt)
 static int sdw_program_params(struct sdw_bus *bus, bool prepare)
 {
 	struct sdw_master_runtime *m_rt;
+	struct sdw_slave *slave;
 	int ret = 0;
+	u32 addr1;
 
+	/* Check if all Peripherals comply with SDCA */
+	list_for_each_entry(slave, &bus->slaves, node) {
+		if (!slave->dev_num_sticky)
+			continue;
+		if (!is_clock_scaling_supported_by_slave(slave)) {
+			dev_dbg(&slave->dev, "The Peripheral doesn't comply with SDCA\n");
+			goto manager_runtime;
+		}
+	}
+
+	if (bus->params.next_bank)
+		addr1 = SDW_SCP_BUSCLOCK_SCALE_B1;
+	else
+		addr1 = SDW_SCP_BUSCLOCK_SCALE_B0;
+
+	/* Program SDW_SCP_BUSCLOCK_SCALE if all Peripherals comply with SDCA */
+	list_for_each_entry(slave, &bus->slaves, node) {
+		int scale_index;
+		u8 base;
+
+		if (!slave->dev_num_sticky)
+			continue;
+		scale_index = sdw_slave_get_scale_index(slave, &base);
+		if (scale_index < 0)
+			return scale_index;
+
+		ret = sdw_write_no_pm(slave, addr1, scale_index);
+		if (ret < 0) {
+			dev_err(&slave->dev, "SDW_SCP_BUSCLOCK_SCALE register write failed\n");
+			return ret;
+		}
+	}
+
+manager_runtime:
 	list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
 
 		/*
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 05a85e2bd96d..fc0a203c3ae0 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -1041,6 +1041,7 @@ int sdw_bus_exit_clk_stop(struct sdw_bus *bus);
 
 int sdw_compare_devid(struct sdw_slave *slave, struct sdw_slave_id id);
 void sdw_extract_slave_id(struct sdw_bus *bus, u64 addr, struct sdw_slave_id *id);
+bool is_clock_scaling_supported_by_slave(struct sdw_slave *slave);
 
 #if IS_ENABLED(CONFIG_SOUNDWIRE)
 
-- 
2.43.0

