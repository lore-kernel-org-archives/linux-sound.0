Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8E71991BB;
	Wed, 18 Dec 2024 08:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734508945; cv=none; b=idxYsIk/wauzfVb0uvI/5ssle0vSWbPwxhaFCwZ3gaChP5RN0lATfPMWS5bRX2NtRqh5/n2nr/LRogF7ZTcfHwJ0kuoulLUGedrATKzE7jvyIE1nO6bBxP19wLRqNPK+++Nx0gNXZw1ybJNgHhTA7JVCvDZZWy0Fwl2lF4NtfWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734508945; c=relaxed/simple;
	bh=Bbir8Z6IL9F1YVRy3jwAe9p99Ugyno6+qfCPr+tqjHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S1kQaIoyQKqDITdXq+wDluWTsXlSNS/AW0fYwot1bGYLvxcPgNNVHaHnRE6W3wi9rgk+5CbQKr6g1+J8vEnIRGkODULZOzsKa3aTclyEiKebpBCPqBbQG79m76PvJ5w2QJa4SRRys+IG4370Dn3AS9sadzFpw58ocs92Ts92Gh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UwJ3hhAw; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UwJ3hhAw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734508943; x=1766044943;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Bbir8Z6IL9F1YVRy3jwAe9p99Ugyno6+qfCPr+tqjHU=;
  b=UwJ3hhAwCC6TclKm3pkWjmAQPywkUQ0wzSubTK/+gQ3tPDeQD3Krtl1Q
   dmiYdRkgyIVJydDfJSdaQWM8B9OPhNfpRaePpzl6A3zPUYP9Nb0A+RFA0
   z/jV0Njv5tccMglphFVzsG2fhns6NdQwSXgzF/Ul2EdmeTos5v7JWPvV6
   CmxKJaQTjLe7DdYElW12a/F690DbWY2Uyeqne4+PDFhW4uVw7rPntQWRx
   qYqxux5Jj9zpBb8UNoQ36W7Y9kYkjxEQfSzs4DFiEXB8FTZFjhuKAtKHy
   cR3NbtzPT3idwrgHLP1uVSdfSbzmjArWAHf8pULgnxFk4ePbUX5HGaEZj
   Q==;
X-CSE-ConnectionGUID: mGpHhRBuTM+r4VZCLNdx4Q==
X-CSE-MsgGUID: rp+9VTBSToSgjNSqJiEEjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="45978602"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="45978602"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 00:02:17 -0800
X-CSE-ConnectionGUID: r3lPbLECTM27w1UCF/+QuQ==
X-CSE-MsgGUID: AVqRuiv3TeixPmMs8iugGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101914697"
Received: from tfalcon-desk.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.220.206])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 00:02:16 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH v3 09/14] soundwire: generic_bandwidth_allocation: correct clk_freq check in sdw_select_row_col
Date: Wed, 18 Dec 2024 16:01:50 +0800
Message-ID: <20241218080155.102405-10-yung-chuan.liao@linux.intel.com>
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

The bits in Column 0 of Rows 0 to 47 are for control word and cannot be
used for audio. In practice, entire Column 0 is skipped.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 drivers/soundwire/generic_bandwidth_allocation.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
index d847413141d3..5c4dac36ad1a 100644
--- a/drivers/soundwire/generic_bandwidth_allocation.c
+++ b/drivers/soundwire/generic_bandwidth_allocation.c
@@ -302,7 +302,6 @@ static int sdw_compute_port_params(struct sdw_bus *bus)
 static int sdw_select_row_col(struct sdw_bus *bus, int clk_freq)
 {
 	struct sdw_master_prop *prop = &bus->prop;
-	int frame_int, frame_freq;
 	int r, c;
 
 	for (c = 0; c < SDW_FRAME_COLS; c++) {
@@ -311,11 +310,8 @@ static int sdw_select_row_col(struct sdw_bus *bus, int clk_freq)
 			    sdw_cols[c] != prop->default_col)
 				continue;
 
-			frame_int = sdw_rows[r] * sdw_cols[c];
-			frame_freq = clk_freq / frame_int;
-
-			if ((clk_freq - (frame_freq * SDW_FRAME_CTRL_BITS)) <
-			    bus->params.bandwidth)
+			if (clk_freq * (sdw_cols[c] - 1) <
+			    bus->params.bandwidth * sdw_cols[c])
 				continue;
 
 			bus->params.row = sdw_rows[r];
-- 
2.43.0

