Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608FD2FE56F;
	Fri, 20 Mar 2026 05:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773985319; cv=none; b=L8JIC2WqnmiT9rtKmI6aQSF8plpTeiCvgxP8/qNX12/sBsiP3Y6cRWX+8gqR0i4zmEbZldKYbfE2B5pGvAhn0RqbqMjQkp3GA71jATllZ2mC5/MFdfFnv+tUGuHobcDos9JIhx8uFRYu+0xF10ru77WwSfAXi5icwCkPVZb/9/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773985319; c=relaxed/simple;
	bh=ThzEOhRRT54gJqLh3zwexBjVwMng+YpBwXs9GLFsjKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I5zf7BQtd4/wyXG/VY5Rm5hFqvqgAN58oSkmNhLsSDPWZr2NL12dwwbSQLQMNsL7Bps+jUHdBqMFrNLm1yN0FlBK7NZl0brObsRCW5NaevroynV9USO7yl25lJKMDzYLCl0T5OYc3pSsHAtdGaOsTocXOQFfdvH8GkYyNfH0WEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D5CTRVjZ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D5CTRVjZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773985318; x=1805521318;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ThzEOhRRT54gJqLh3zwexBjVwMng+YpBwXs9GLFsjKk=;
  b=D5CTRVjZtKzmr0Y2i7oqE8cbCZDeR1FAzfLOOth9py/aai6wnAbR9GmI
   Md68U39/4+ULXYUgHUU1cIo7pHFSWa0nbzfojCLjizzVSpobTkHauFbyR
   zWgjVGNPAT40tZC0G/uwZNdeZJmOG9mkF0KaBjWMxH0QCiZxJq2V/Jxu6
   C2rFDLxxOLhOkWJYK1RnGFmfDLfgQsEVSNaR2w4GPX7qjxgWGJZ1o22h0
   UcBaS3W1wIvLUcTxUtAODxQHzdq72wPBCBlDws0reFl3pWWg4GnWGtzDH
   yCKt7sVPOE84DXKREtL/C0kFq1ausoPsU/1TFi0HX+ats+bKHnz26WvUk
   w==;
X-CSE-ConnectionGUID: 32lMruNkTFqdJif2u96H2w==
X-CSE-MsgGUID: 607JAVtbSI68huIAcMnFYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="62629473"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="62629473"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 22:41:58 -0700
X-CSE-ConnectionGUID: at1kntsPSgqCTSdX4RyAiA==
X-CSE-MsgGUID: YlQetWuUSvW8D5tnBEMLDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="223404426"
Received: from emr-371.sh.intel.com ([10.67.116.154])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 22:41:56 -0700
From: "Baoli.Zhang" <baoli.zhang@linux.intel.com>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: "Baoli.Zhang" <baoli.zhang@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/3] soundwire: use krealloc_array to prevent integer overflow
Date: Fri, 20 Mar 2026 13:33:24 +0800
Message-ID: <20260320053324.738100-4-baoli.zhang@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320053324.738100-1-baoli.zhang@linux.intel.com>
References: <20260320053324.738100-1-baoli.zhang@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the use of krealloc() with krealloc_array() in
sdw_add_element_group_count to mitigate the risk of integer overflow during
memory allocation size calculation.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Baoli.Zhang <baoli.zhang@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/soundwire/generic_bandwidth_allocation.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
index cd9ccbaf0e46f..3575d69ce1c50 100644
--- a/drivers/soundwire/generic_bandwidth_allocation.c
+++ b/drivers/soundwire/generic_bandwidth_allocation.c
@@ -308,17 +308,15 @@ static int sdw_add_element_group_count(struct sdw_group *group,
 		unsigned int *rates;
 		unsigned int *lanes;
 
-		rates = krealloc(group->rates,
-				 sizeof(int) * (group->max_size + 1),
-				 GFP_KERNEL);
+		rates = krealloc_array(group->rates, group->max_size + 1,
+				       sizeof(*group->rates), GFP_KERNEL);
 		if (!rates)
 			return -ENOMEM;
 
 		group->rates = rates;
 
-		lanes = krealloc(group->lanes,
-				 sizeof(int) * (group->max_size + 1),
-				 GFP_KERNEL);
+		lanes = krealloc_array(group->lanes, group->max_size + 1,
+				       sizeof(*group->lanes), GFP_KERNEL);
 		if (!lanes)
 			return -ENOMEM;
 
-- 
2.43.0

