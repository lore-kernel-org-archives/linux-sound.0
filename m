Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B9F1993B7;
	Wed, 18 Dec 2024 08:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734508946; cv=none; b=J/9FYSG8f1Wh0Iu+jocxIlLVwdkqBlIwa5VDvglCal3o0v6yUcdOyU4hf+8VlfqdoWOZNHhMtWBmTxN+cPTXX7EzGHeWPY4aOsg1AEraAPpqWsk5x3QjVrMQPyn5Z4jdB0z9ewnzBW0wrpcXQco8X7coomVa9LUnon5N6rAARTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734508946; c=relaxed/simple;
	bh=HY0GNF1CvwcueXSIXst2p1u/o3/tB9VIM8vkl1ZIo70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WrxSnbuykojL+Dr/pkeLlaLmL4oZwpxdfSEdnTrlq+EMttuW94Pzfpc/gR3RGRs9feA0Bt7bgUKgRDouCtlExJjy9IQzN0p2zlus6GlM5HuWvlxf3M7InknW/KTeJr+1E4QOoN7HPiYA6PJeeTNEq1l9cxodczmEbKW4U5SlZQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dkLXX9qf; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dkLXX9qf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734508945; x=1766044945;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HY0GNF1CvwcueXSIXst2p1u/o3/tB9VIM8vkl1ZIo70=;
  b=dkLXX9qfOBA3PuwwKNUrJeCmLSJTDhboS9JXLFrG1V+pbC0BHH/h5QcX
   YDBjTmon0GOPg7uau7Z4hxSX2U839fCx1rKqsaEZR0e0CJfykjoe5663P
   qYGpyNA3NzVe2d9M79Tlm7v1yjxUnDHwYCIk6QAkGFrLpgRMCw5VoLhJ1
   fA75q6UllJFWx8D98vKUDKrxZK1JUSGZb7qjkeGBIeO7OC4i5cgeDMEKe
   2Izw2ndh26ppO+DyKkZCMyHKXgndTrrqXbd2bD7ixTzEZIlyOUdX5qzAW
   emiqfE2YhGERcb85qT/gHXjasqzaodPgnFLr81QNn+xpbkGc8WA87YCMr
   A==;
X-CSE-ConnectionGUID: 6PD0U9yfSfiuf/qMUvfSQQ==
X-CSE-MsgGUID: bvV9mJOWSEyPpzrNCRZVOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="45978614"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="45978614"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 00:02:18 -0800
X-CSE-ConnectionGUID: HCLGV7X3RgmP3i+WyFk0ag==
X-CSE-MsgGUID: 3s5jbwwLSBGimsAU7JMg3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101914706"
Received: from tfalcon-desk.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.220.206])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 00:02:17 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH v3 10/14] soundwire: generic_bandwidth_allocation: check required freq accurately
Date: Wed, 18 Dec 2024 16:01:51 +0800
Message-ID: <20241218080155.102405-11-yung-chuan.liao@linux.intel.com>
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

Currently, we check curr_dr_freq roughly by "if (curr_dr_freq <=
bus->params.bandwidth)" in sdw_compute_bus_params() and check it
accurately in sdw_select_row_col(). It works if we only support one
freq. But, we need to check it accurately in sdw_select_row_col() to
give it a chance to use a higher freq or use multi-lane.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 drivers/soundwire/generic_bandwidth_allocation.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
index 5c4dac36ad1a..d2632af9c8af 100644
--- a/drivers/soundwire/generic_bandwidth_allocation.c
+++ b/drivers/soundwire/generic_bandwidth_allocation.c
@@ -373,7 +373,8 @@ static int sdw_compute_bus_params(struct sdw_bus *bus)
 				(bus->params.max_dr_freq >>  clk_buf[i]) :
 				clk_buf[i] * SDW_DOUBLE_RATE_FACTOR;
 
-		if (curr_dr_freq <= bus->params.bandwidth)
+		if (curr_dr_freq * (mstr_prop->default_col - 1) <
+		    bus->params.bandwidth * mstr_prop->default_col)
 			continue;
 
 		break;
-- 
2.43.0

