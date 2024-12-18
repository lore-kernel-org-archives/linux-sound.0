Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD3B177998;
	Wed, 18 Dec 2024 08:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734508940; cv=none; b=R+sOxrzVpjJaJoxxbhkwrLfB5OzB0+qWPffmHN8YfxMzYtL0KfoJFgrF+LD7AxemzBf1rGH51+YHR/W9yhv6exxlnrQWNDekeyjdPSqLwGVkcPG8F0cV4kCFN2AshQGx27mZBXg1J2Y0PaiJ/MtUnrGaL7I2iIoS9g8h6J6qTSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734508940; c=relaxed/simple;
	bh=TQ4OdSboku4At/d1BlZVXBl4dZD0Phors9GgAM8qEm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LqyTBUJu6/M8vQBLhwGrVoki4GSTvd7rwiagNMbofzQsmT/1sUhf72RHG5FiIPTi1SgyUOIcE1vykpn5XSedr2y6okC8opqLKoRDbkTUHxpLGCSxN7CYQo7fFj+qN130ff1i2ED+D8yC2JPWZkj/skW5ER7g+fU0xnyiPflnsFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ethk59Ai; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ethk59Ai"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734508939; x=1766044939;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TQ4OdSboku4At/d1BlZVXBl4dZD0Phors9GgAM8qEm0=;
  b=ethk59AiaFJFgkzm6XaXwX1Pck8J7gWphU3pD9H1YLu4HaOkLUQfAxAt
   TLzFCDdpgvd+16RCi2cNMKnRxUw1ymNwutX8HiD5fywMGGA8cKcOUwvu/
   E+pafyO+g8sDSyD556iZNf1SPffIDmY7D5XxYm0An31EbfcQvtP6yyX7M
   i+RfjdeoN5IHOSh3tToL7MymrDmZ5Bfng5zxm3nnlp63oQDapQ6Et79su
   ylTLqee6CZVQDNFXr3UwQDvI2B0DFRVnyk+94G5dn+MDIj9bV5PnbAEIs
   +GDNDc3dgABWnzunxOxL1Xi+VQ4WBS7/DydDgpGyxMUovBwnAGJCoHHN0
   w==;
X-CSE-ConnectionGUID: jvFb2bs9TKyd+Mblu3cSfw==
X-CSE-MsgGUID: 9al9Yn79QcywANao80OG8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="45978531"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="45978531"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 00:02:10 -0800
X-CSE-ConnectionGUID: RMqMA+CGR2+yiySN7cn0+g==
X-CSE-MsgGUID: nDmLBnZJQAOEnoiSDGFYBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101914657"
Received: from tfalcon-desk.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.220.206])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 00:02:09 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH v3 04/14] soundwire: stream: set DEPREPARED state earlier
Date: Wed, 18 Dec 2024 16:01:45 +0800
Message-ID: <20241218080155.102405-5-yung-chuan.liao@linux.intel.com>
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

The existing logic is problematic in that we deprepare all the ports,
but still take into account the stream for bit allocation by just
walking through the bus->m_rt list.

This patch sets the state earlier, so that such DEPREPARED streams can
be skipped in the bandwidth allocation (to be implemented in a
follow-up patch).

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 drivers/soundwire/stream.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 7aa4900dcf31..795017c8081a 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1643,8 +1643,15 @@ static int _sdw_deprepare_stream(struct sdw_stream_runtime *stream)
 {
 	struct sdw_master_runtime *m_rt;
 	struct sdw_bus *bus;
+	int state = stream->state;
 	int ret = 0;
 
+	/*
+	 * first mark the state as DEPREPARED so that it is not taken into account
+	 * for bit allocation
+	 */
+	stream->state = SDW_STREAM_DEPREPARED;
+
 	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
 		bus = m_rt->bus;
 		/* De-prepare port(s) */
@@ -1652,6 +1659,7 @@ static int _sdw_deprepare_stream(struct sdw_stream_runtime *stream)
 		if (ret < 0) {
 			dev_err(bus->dev,
 				"De-prepare port(s) failed: %d\n", ret);
+			stream->state = state;
 			return ret;
 		}
 
@@ -1665,6 +1673,7 @@ static int _sdw_deprepare_stream(struct sdw_stream_runtime *stream)
 			if (ret < 0) {
 				dev_err(bus->dev, "Compute params failed: %d\n",
 					ret);
+				stream->state = state;
 				return ret;
 			}
 		}
@@ -1673,11 +1682,11 @@ static int _sdw_deprepare_stream(struct sdw_stream_runtime *stream)
 		ret = sdw_program_params(bus, false);
 		if (ret < 0) {
 			dev_err(bus->dev, "%s: Program params failed: %d\n", __func__, ret);
+			stream->state = state;
 			return ret;
 		}
 	}
 
-	stream->state = SDW_STREAM_DEPREPARED;
 	return do_bank_switch(stream);
 }
 
-- 
2.43.0

