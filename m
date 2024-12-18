Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E125A15990C;
	Wed, 18 Dec 2024 08:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734508938; cv=none; b=BjCpQYYWgcw4N9QfINjZM1jH/GRB//ZrUWv7Rc2N/0ef5vo2LkBE9OXdR9Rl+2aWHAyhOwHyi3U4Rw95kxaY7ZfKBHqkF2jk3HJCwpx8JvIAY+WLRtDxTXH64AE1CyWaOpOvrl6jaGDxcjewRjc6e+WFFuwzKKXRtFphUN4ScAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734508938; c=relaxed/simple;
	bh=i7szRebw6WQA5QpBUiel/GHy/A8mHrGYWbddHxs31ms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m6vWN8RTuzqxqQ5DD/CVpN6wNVwtFjVf2FRRyPU14sMSrn43jFaU4u914Mzz8cFPdv2urYF3kHwAq+8zVKgh3O9V+ylWWnB752X8ZlbXIZkrF/Z2TNuKl9vmlsFssvOJZKNMeZYkiDcOjrMTVjPsib15A3W7jssjTbj7HHT6Ilo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SUsKWH1B; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SUsKWH1B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734508937; x=1766044937;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i7szRebw6WQA5QpBUiel/GHy/A8mHrGYWbddHxs31ms=;
  b=SUsKWH1BgsiwpziHkNSzy1EcfZqmIWCK0HlXajr2kO0n7QRoDBRbdqA1
   66xO0gnBPAKX0HFeVhNtiOPsF8dT42KyQ1YHB8WAje4f8BLxxG5uMaXar
   v0+CzCmyeHYosfaAVcO7HRtSi4nRxc2BA/8II8nKR4LwWOm9MNCLPKz4e
   rdwB4ScZgRGQbW0D40sZWUiZGzkuvfCLriuGVC1ZtGO0K/jkE7C2HODzG
   mu4vfs4qZcB6bS3jCHllNsGJq1nkOsjqsVDVEhU2iswbYocuZo3zR6cvb
   i/of6DK+LiePBwGef8LY19c84QhxJCyasWhGx0n4RurnDFjLTpaFFf82o
   Q==;
X-CSE-ConnectionGUID: UrBxcpEYQ2iEmpwetSxeAw==
X-CSE-MsgGUID: qf+OqH/aTM+bcfPA+5ez9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="45978495"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="45978495"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 00:02:06 -0800
X-CSE-ConnectionGUID: CCdszRhBROmA5smKA3nCiA==
X-CSE-MsgGUID: AHKs6DyQQgOOi76oTmcryg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101914643"
Received: from tfalcon-desk.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.220.206])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 00:02:05 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH v3 01/14] soundwire: add lane field in sdw_port_runtime
Date: Wed, 18 Dec 2024 16:01:42 +0800
Message-ID: <20241218080155.102405-2-yung-chuan.liao@linux.intel.com>
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

Currently, lane_ctrl is always 0. Add a lane field in sdw_port_runtime
to indicate the data lane of the data port.
They are 0 by default.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/amd_manager.c                  | 2 +-
 drivers/soundwire/bus.h                          | 2 ++
 drivers/soundwire/generic_bandwidth_allocation.c | 4 ++--
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 5a4bfaef65fb..f47d4cd656ae 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -410,7 +410,7 @@ static int amd_sdw_compute_params(struct sdw_bus *bus)
 			sdw_fill_xport_params(&p_rt->transport_params, p_rt->num,
 					      false, SDW_BLK_GRP_CNT_1, sample_int,
 					      port_bo, port_bo >> 8, hstart, hstop,
-					      SDW_BLK_PKG_PER_PORT, 0x0);
+					      SDW_BLK_PKG_PER_PORT, p_rt->lane);
 
 			sdw_fill_port_params(&p_rt->port_params,
 					     p_rt->num, bps,
diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index fda6b24ac2da..ff03b97f1d8b 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -90,6 +90,7 @@ int sdw_find_col_index(int col);
  * @transport_params: Transport parameters
  * @port_params: Port parameters
  * @port_node: List node for Master or Slave port_list
+ * @lane: Which lane is used
  *
  * SoundWire spec has no mention of ports for Master interface but the
  * concept is logically extended.
@@ -100,6 +101,7 @@ struct sdw_port_runtime {
 	struct sdw_transport_params transport_params;
 	struct sdw_port_params port_params;
 	struct list_head port_node;
+	unsigned int lane;
 };
 
 /**
diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
index b9316207c3ab..abf9b85daa52 100644
--- a/drivers/soundwire/generic_bandwidth_allocation.c
+++ b/drivers/soundwire/generic_bandwidth_allocation.c
@@ -56,7 +56,7 @@ void sdw_compute_slave_ports(struct sdw_master_runtime *m_rt,
 					      sample_int, port_bo, port_bo >> 8,
 					      t_data->hstart,
 					      t_data->hstop,
-					      SDW_BLK_PKG_PER_PORT, 0x0);
+					      SDW_BLK_PKG_PER_PORT, p_rt->lane);
 
 			sdw_fill_port_params(&p_rt->port_params,
 					     p_rt->num, bps,
@@ -109,7 +109,7 @@ static void sdw_compute_master_ports(struct sdw_master_runtime *m_rt,
 		sdw_fill_xport_params(&p_rt->transport_params, p_rt->num,
 				      false, SDW_BLK_GRP_CNT_1, sample_int,
 				      *port_bo, (*port_bo) >> 8, hstart, hstop,
-				      SDW_BLK_PKG_PER_PORT, 0x0);
+				      SDW_BLK_PKG_PER_PORT, p_rt->lane);
 
 		sdw_fill_port_params(&p_rt->port_params,
 				     p_rt->num, bps,
-- 
2.43.0

