Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC82E1E231D
	for <linux-sound@vger.kernel.org>; Wed,  7 May 2025 06:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746599304; cv=none; b=oZj9e1idDEA2eBjfLAxBrMvPMRNYD6YCe9TzZYtDG26CUq5kBClhifkjz28DC0UT5vkBHzwhsXK0D/4xMWwrIIghweJ+qihXj0DMBV8WYh4fWazk/J+YYZkvgQgXKbjeuS/4Gz2OsgqepI4X8rwBQsGwh56F44fcmwb4+Y66x2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746599304; c=relaxed/simple;
	bh=ensN6XrznH+Ut8fQXGbahNlXLPIo0anvrb0AE6tKQyo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=khjf+1hsv+bwrcua0nGXwEAgLk4INJ7KeBcvL4kAvJDblqDGBmcue4T51QTYLpIavYZpwL1N0+F/ASNv+piD7146MSDnWkDLleFjCYRWHKK/TD1a3oJjyvO8C+JcVy2EHLL3BUSCqE7sokpjmJoeKmqx6ZjBxI3NRifoGT5gUzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GKsnz/cJ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GKsnz/cJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746599302; x=1778135302;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ensN6XrznH+Ut8fQXGbahNlXLPIo0anvrb0AE6tKQyo=;
  b=GKsnz/cJ8dhJpKJLOfT+1AkKM+f2uoljZrIf8/ySGWk8uWpro4b0veM5
   ByV9d0iIz90h/me7HvDKE1dW8XiU0dxE0fw2h2reZpOq49Rd3COw/ABEB
   yU4po+sMYrSNSxo/pj2hTGGlD33NtJ9NU7kGRRtCwPRqsM6vUxTgcY+n5
   qrlgvEh6neuZGXwQ5v9DR/j8fDl7/iq+mwyHdaI8y2tJtP6J0Js8FdXvY
   SUZ7WT7wxjioQveT4+stLl+rm6rKxwWUu2HGZ+aIJhcaPSaMOR8LOEFS6
   7YLZFq/4keC5k5qbEHOkm/BGLcFpe7g7YBBYuOf8YhOC06cUXvWDdpQJ+
   g==;
X-CSE-ConnectionGUID: Il1MQU0AQaGyhmWv7Pku3A==
X-CSE-MsgGUID: +mP0MctvTCeqhFJWVh9TgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="47407622"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="47407622"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 23:28:20 -0700
X-CSE-ConnectionGUID: DX4JpY2LRXaSCGoX9KYxjg==
X-CSE-MsgGUID: HLx3MAFoQ2SPEomX5AMjkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="135822240"
Received: from uaeoff-desk2.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.222.52])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 23:28:19 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 0/2] ASoC: Intel: soc-acpi-intel-lnl/ptl-match: Add rt713_vb_l3_rt1320_l3 support
Date: Wed,  7 May 2025 14:28:10 +0800
Message-ID: <20250507062812.46401-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series simplify the variable name and add rt713_vb_l3_rt1320_l3
support.

Mac Chiang (2):
  ASoC: Intel: soc-acpi-intel-lnl/ptl-match: Simplify variable name
  ASoC: Intel: soc-acpi-intel-ptl-match: Add rt713_vb_l3_rt1320_l3
    support

 .../intel/common/soc-acpi-intel-lnl-match.c   |  6 +--
 .../intel/common/soc-acpi-intel-ptl-match.c   | 41 ++++++++++++++++---
 2 files changed, 39 insertions(+), 8 deletions(-)

-- 
2.43.0

