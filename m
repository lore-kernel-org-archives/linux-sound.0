Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505D418660C;
	Wed, 18 Dec 2024 08:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734508940; cv=none; b=OjkV2p4zEjibNrE7tzpgr7L+PCLP80Jne6CGKWgU3BYSmV4NljIzhFNI4ZtFNWC9wbADhNFQ/PcZK0d4dYp/0HRG0A+/Fo+5xNpGjNwtcGZoqZBKO75TR814pMxp4sHf3xXP8Z474JdIEEY6X3o5wkuvaoXf4sUPl93AM65NERQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734508940; c=relaxed/simple;
	bh=6u7PhUAlKier/PDcu4sZdIS2Gaci7mkLuxFA68/A7yc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dUh0+x6LtCP3PEqyU6plUEw3pM0EC1pPkjTdtjGospOp4WUk0Vg3465xzFjrAKkS6dqSXNluznyJRBb7z0bN/YRcY0Cbl/0+hXhsShA+IXFfKNJR4zS1c6qfSrlAQO9VABxCHZeVWj3+/RmYy+2USptDgInHPclp2zl2N7720B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OJrMP9dp; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OJrMP9dp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734508939; x=1766044939;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6u7PhUAlKier/PDcu4sZdIS2Gaci7mkLuxFA68/A7yc=;
  b=OJrMP9dpOkvvEdYerxcVTpCHZSqggVWAHGdGhYubc9+ZgAPQ4bAkWy1d
   pLzRWaKlKb3szqTf2qj8G67e/sWAOA3WKzUnXwOkXsqyoTOKAvTeyAGyW
   VZ+cnf9RkIQocxd4OYnSQxNEmwhNgkPsoNchwlU3Y/pGcrMj3b826Ya6i
   bqHfwAk7vboiqfM2rM6eLIN7biN8YfmWBuaiXYzU7HWk6Qbh5QH32aFJ8
   dOF3RJkug1yaHpaOmehQUxwpnhW2iSBgpYdWO+F7UGF6dWsEbVwN0o2Gy
   3vhRTKQMZ/N7krZhOT6+oCiBEDp1+Ziaann/+p9hvT6BKKu6T4hVtg7o5
   Q==;
X-CSE-ConnectionGUID: ZI0zZY3zSbqsbov+L61W+A==
X-CSE-MsgGUID: 1UtnK4CMRtGACS3rRx/vuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="45978540"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="45978540"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 00:02:12 -0800
X-CSE-ConnectionGUID: u/eFJT/CQUi/Q6gXCI+xlg==
X-CSE-MsgGUID: opaiiBmvRRW1QGqjnaFoAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101914661"
Received: from tfalcon-desk.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.220.206])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 00:02:10 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH v3 05/14] soundwire: generic_bandwidth_allocation: skip DEPREPARED streams
Date: Wed, 18 Dec 2024 16:01:46 +0800
Message-ID: <20241218080155.102405-6-yung-chuan.liao@linux.intel.com>
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

We should not blindly walk through all the m_rt list, since it will
have the side effect of accounting for deprepared streams.

This behavior is the result of the split implementation where the
dailink hw_free() handles the stream state change and the bit
allocation, and the dai hw_free() modifies the m_rt list. The bit
allocation ends-up using m_rt entries in zombie state, no longer
relevant but still used.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 drivers/soundwire/generic_bandwidth_allocation.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
index abf9b85daa52..2950a3d002ce 100644
--- a/drivers/soundwire/generic_bandwidth_allocation.c
+++ b/drivers/soundwire/generic_bandwidth_allocation.c
@@ -238,6 +238,9 @@ static int sdw_get_group_count(struct sdw_bus *bus,
 		return -ENOMEM;
 
 	list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
+		if (m_rt->stream->state == SDW_STREAM_DEPREPARED)
+			continue;
+
 		rate = m_rt->stream->params.rate;
 		if (m_rt == list_first_entry(&bus->m_rt_list,
 					     struct sdw_master_runtime,
-- 
2.43.0

