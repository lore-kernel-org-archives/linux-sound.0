Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE513CA4B7;
	Wed, 25 Mar 2026 11:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438128; cv=none; b=elan0KaT+brZ4lUpq6ZjLJnhTucpi87ShfQQxZjWZqZxlSwoPTNvmmrm1jrGaq4X8iYJMk7Bm4tpywi6F4jea90BjDzy6H7VGdGY0/XW5JvxeOMIN7lHn4eFXik3k0WXeioHvPk1c4s8QXvdwHulw2f6FM1ZGC1pedpX+0zemLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438128; c=relaxed/simple;
	bh=oBRZ3CB5LwIUmfei/WMtwpiWGzc0MpCtv/voE694pXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BfHGCdzHwtHHrM4XgPYXdaRql8+z9+YAUWeiOnPJCXJphsqKCMibrnK8GLZ6BbBtSGHRg1bZlDVZOLsPx8LHZsDqmB5/jzpNjwwAaRdI3dQshu4Pez1yXNpnhiEVSjKhyl2y5PgNKz0e7Z2bLtOM50qt/wMyenqKDjuxsce7MIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jlQQ8WwF; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jlQQ8WwF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774438127; x=1805974127;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oBRZ3CB5LwIUmfei/WMtwpiWGzc0MpCtv/voE694pXo=;
  b=jlQQ8WwFOT0l0cauPcXHYpN1EOpDQlROZcawrfViT+IE6HZM31jTh7Iq
   TsSAXBEUFy5vB8wBR5rOL4IdvQr5u7uWiDq8XGuMf3jtZdw3X11ZuXyIS
   EZBjUT8IxQadcOmNVqTQZoWpXsI7tmzXFnfoSzU6L0/c2cD+XPGm6+Jx2
   /o4QbyS1LaNP9jlnJ4AyuHo35ZCfDM+2XbRjSJsJU37nSI7AmMUwxtDSp
   X6creAAduLJ7LOK1WLEH12OgrLqg//k4XzkaDWzARfhvtiJVDtMpQMrJP
   A1bOtHjmB7u6yMcBv6g9qGH+haXNJlAWKL6gVW8awA3y215WbUaxYq/55
   Q==;
X-CSE-ConnectionGUID: seo7HUIZS+eggAMTgpyh9A==
X-CSE-MsgGUID: 8hoWSZ84Rba8jXYkv/oy0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="79379026"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="79379026"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 04:28:47 -0700
X-CSE-ConnectionGUID: aCoi4LmjRxWEv/qn6QxPGQ==
X-CSE-MsgGUID: XPbct5FhTo2zAVeagzZ3xA==
X-ExtLoop1: 1
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 04:28:45 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH] soundwire: intel_ace2x: release bpt_stream when close it
Date: Wed, 25 Mar 2026 19:28:37 +0800
Message-ID: <20260325112837.1027656-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The BPT stream was allocated in intel_ace2x_bpt_open_stream(), we need
to free it in intel_ace2x_bpt_close_stream().

Fixes: 4c1ce9f37d8a8 ("soundwire: intel_ace2x: add BPT send_async/wait callbacks")

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Simon Trimmer <simont@opensource.cirrus.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
---
 drivers/soundwire/intel_ace2x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
index 20422534baf1..6cd3a8732375 100644
--- a/drivers/soundwire/intel_ace2x.c
+++ b/drivers/soundwire/intel_ace2x.c
@@ -317,6 +317,7 @@ static void intel_ace2x_bpt_close_stream(struct sdw_intel *sdw, struct sdw_slave
 		dev_err(cdns->dev, "%s: remove slave failed: %d\n",
 			__func__, ret);
 
+	sdw_release_stream(cdns->bus.bpt_stream);
 	cdns->bus.bpt_stream = NULL;
 }
 
-- 
2.43.0

