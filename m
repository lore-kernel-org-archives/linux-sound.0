Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540F7346E71
	for <linux-sound@vger.kernel.org>; Fri, 21 Nov 2025 11:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763724202; cv=none; b=Z3HwYp6R/4To8oiedpUz7LZMDwPkE0wOaX0RMKfByLv1y8MNfAsqswYJChed5f9eEbSnfiKz3EkOWqc3D5WwoJeFOm3UW9Jet9xAlYfsfxaDRcHU1hc/CY5bkNxSpqG2jhYWv/iJNllv77DNEDGyfeSW8K3b+3iUulAYRQ2B5xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763724202; c=relaxed/simple;
	bh=3Zgvp8bwAN5x17cTGinhTZ0r2mm8Ay8IrEGoUh7kK/8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eveZujAhULk7nI2dZHTeJFRW9xT2LmMx0+RrqQBrNZQy1+vezASEyiExWED8+urm1Oc/xRnj4N4bFBsbjbbNTVdlhHkz/y+bUf/4kZ0Aot2coc7bz9jmgJvtvIEt3Otl/wD1AUdUwajW4G6tHviW68PiNkxVdceFC70utB/vfsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zc+uxEDq; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zc+uxEDq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763724200; x=1795260200;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3Zgvp8bwAN5x17cTGinhTZ0r2mm8Ay8IrEGoUh7kK/8=;
  b=Zc+uxEDqhB+QovNa8ERtAlF5UfIfL0ir63UVlwjRgF1iI2Xuz1Te7z3L
   LvgbpxGOx31+cUTdCymdEEVd1cyaAmUgCFs9Jc26oPqWIyZkpkorsowg6
   wbJR5GBBjKsPuJ5nXEgm2q+bkn6VF3SfpFVkdBeQ9dbEFUX9Sl8tRTd4v
   IcDO9uo7fz6oToTbKk8WrSdKWHh+zqhy1vf1+AcX5ayJc5+kEKJeiTLXX
   sPmUltF/h06rkHAVm5VIOPEmK3WUE+ROJXcpgwcddqO3P8r8WB31cbX2K
   ZzvqFiVqXOKY+OoPTT8lrsUtzpo1zpoxNtQZFLbN/B3H6vs4tbKlSry6f
   g==;
X-CSE-ConnectionGUID: E1H0JGWvQyysIkct0vzg6g==
X-CSE-MsgGUID: 9gvSHkaISUWLU24QLs26eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65845937"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="65845937"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 03:23:20 -0800
X-CSE-ConnectionGUID: rRINSNKqQomn3FNL/4FEQw==
X-CSE-MsgGUID: rn0Y57shT4eavrsc/f9lHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="191462848"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa009.jf.intel.com with ESMTP; 21 Nov 2025 03:23:18 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 5/6] ASoC: Intel: catpt: Do not block the system from suspending
Date: Fri, 21 Nov 2025 12:43:30 +0100
Message-Id: <20251121114331.3841335-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251121114331.3841335-1-cezary.rojewski@intel.com>
References: <20251121114331.3841335-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Even if something goes wrong when performing suspend on DSP, from the
system perspective the component is not critical enough to block the
suspend operation entirely. Leaving recovery to next resume() suffices.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/device.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
index eed330bc82b6..08788b390874 100644
--- a/sound/soc/intel/catpt/device.c
+++ b/sound/soc/intel/catpt/device.c
@@ -28,7 +28,7 @@
 #define CREATE_TRACE_POINTS
 #include "trace.h"
 
-static int catpt_suspend(struct device *dev)
+static int __catpt_suspend(struct device *dev)
 {
 	struct catpt_dev *cdev = dev_get_drvdata(dev);
 	struct dma_chan *chan;
@@ -106,6 +106,13 @@ static int catpt_resume(struct device *dev)
 	return 0;
 }
 
+/* Do not block the system from suspending, recover on resume() if needed. */
+static int catpt_suspend(struct device *dev)
+{
+	__catpt_suspend(dev);
+	return 0;
+}
+
 static int catpt_runtime_suspend(struct device *dev)
 {
 	if (!try_module_get(dev->driver->owner)) {
@@ -114,7 +121,7 @@ static int catpt_runtime_suspend(struct device *dev)
 	}
 	module_put(dev->driver->owner);
 
-	return catpt_suspend(dev);
+	return __catpt_suspend(dev);
 }
 
 static int catpt_runtime_resume(struct device *dev)
-- 
2.25.1

