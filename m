Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831453016E3
	for <linux-sound@vger.kernel.org>; Fri, 28 Nov 2025 09:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764321246; cv=none; b=rHKynIroqO83JQZIxCd8s1sTTMScz6/8LKte0Xf3wXa+rHLDT+EUCKgkPctw7Eni/7H72gtg+FzaB6cOAOsuLqKP7NatNCmg2hnrzITo4QvEk2Ja5Okwu/KNR8D5titDIypdTIWyfWjQaqUC7AMnmlDUNOVBHvJfCG6go+MTCxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764321246; c=relaxed/simple;
	bh=KqucAoKsDkUv5YJ8AFugseRzN+hy7MtHur+HelZV4+M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LKUJR2J88JS9AI/j3LpJr7a5ShJd6F9NqN7su0du7nFaFNI1Dpic4O/hANxbjrbECLNMQCALLB6Q4M3i2+UIg6oSC031TrIfQnaniQJw4QcpUuREHsm5pVaDVpyJ+QlzD9qk6/becDiUDhTC9SWCMBuuz9fOn8XFpNrnQTNnXAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cv/VK6bu; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cv/VK6bu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764321242; x=1795857242;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KqucAoKsDkUv5YJ8AFugseRzN+hy7MtHur+HelZV4+M=;
  b=Cv/VK6bu3zWLsYzGBT8OBhaJZfNxzd799o/uiMJPeYHn4J+kXbctLsbL
   BW28bwBQqdZzwOsE2Sm3iqE2W8NsBuxx2y1vQPNHCxBCwFuxR1ZsQweJS
   jyRBTk7+gxFx0lvG3SCTjNdnTU9hf8yk0kZU5eyInr8LuZHDZHulqJhqV
   97rnS81agbQtS1zVGpZ3typX3c3MuMdMw+qbIKW2RKgb6OMa0kqgjwQin
   071ouwZudMYqesb+OZ5Rh5Ew+hD69/QTbS0ArkTRKdFeKAWSUK00hbzKA
   VSahWq8Xr8cDOZxOuW4CrpqqvGW/1BQPVmheIjjtsJrrib9L5yqv6p/+p
   g==;
X-CSE-ConnectionGUID: NooeQzF9QKai0fYEygLeug==
X-CSE-MsgGUID: nIG0UyvZS36fF8j+U4pDmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66428531"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66428531"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 01:14:02 -0800
X-CSE-ConnectionGUID: ZTV+mEseSbaLHMjpBnCadw==
X-CSE-MsgGUID: 1NnliwgpSpq2BFmg88Sg7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="192681022"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa010.jf.intel.com with ESMTP; 28 Nov 2025 01:13:59 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 6/6] ASoC: Intel: catpt: Do not block the system from suspending
Date: Fri, 28 Nov 2025 10:34:12 +0100
Message-Id: <20251128093412.3949374-7-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251128093412.3949374-1-cezary.rojewski@intel.com>
References: <20251128093412.3949374-1-cezary.rojewski@intel.com>
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
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/device.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
index eed330bc82b6..d13062c8e907 100644
--- a/sound/soc/intel/catpt/device.c
+++ b/sound/soc/intel/catpt/device.c
@@ -28,7 +28,7 @@
 #define CREATE_TRACE_POINTS
 #include "trace.h"
 
-static int catpt_suspend(struct device *dev)
+static int catpt_do_suspend(struct device *dev)
 {
 	struct catpt_dev *cdev = dev_get_drvdata(dev);
 	struct dma_chan *chan;
@@ -72,6 +72,13 @@ static int catpt_suspend(struct device *dev)
 	return catpt_dsp_power_down(cdev);
 }
 
+/* Do not block the system from suspending, recover on resume() if needed. */
+static int catpt_suspend(struct device *dev)
+{
+	catpt_do_suspend(dev);
+	return 0;
+}
+
 static int catpt_resume(struct device *dev)
 {
 	struct catpt_dev *cdev = dev_get_drvdata(dev);
@@ -114,7 +121,7 @@ static int catpt_runtime_suspend(struct device *dev)
 	}
 	module_put(dev->driver->owner);
 
-	return catpt_suspend(dev);
+	return catpt_do_suspend(dev);
 }
 
 static int catpt_runtime_resume(struct device *dev)
-- 
2.25.1

