Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225432E611B
	for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 09:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764149724; cv=none; b=sxiTnW8lZwqtYyuVuLbr0PkG/T4lyk2pDl7q15Tkx97G+Wf3VpmcvmQ9xmgyHyEIg2yZ+5t7wNiPJtfSfUQ/SicShEGfwu3TyG9XzLwdnJBI+8fbUl8znDMZVAufvAFq+QeaDBPbIMHf7th4Kf6E+Yg402Hjjt0glcDdgkOOR64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764149724; c=relaxed/simple;
	bh=KqucAoKsDkUv5YJ8AFugseRzN+hy7MtHur+HelZV4+M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iwTvB2JHMJPaMvyp4CIrZgeq8WwqY/ciGT+ua+VaDenfC0kF3PBNfMT2gbaAnNfhPludr6yvvixculi9fwy5o/OvLZ+BrXe3ZcdcwbW3km0cmNrWrfuKVwKGhCy4HqfUIMYQqFKJXPiCXQTZCOyArDg2WGW1qMb6WM2qZMKL3hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eeZ8CITi; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eeZ8CITi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764149723; x=1795685723;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KqucAoKsDkUv5YJ8AFugseRzN+hy7MtHur+HelZV4+M=;
  b=eeZ8CITi1Ja3QM52fBjigfarI968cH3Pj2tsoAlZuqk3MQ1xoACbYKVd
   mXO7Vb6SpSPbNS0fBHpPf5pd1uAMaCaQOR/o2wOCsvF5jqvCU36zmfRws
   VwWoPu/TELNvMrtJKGpHkg3lnXiKt4sIZN3JxQP+KGLKoCQJfG/gQYcue
   hsPh2hNMcookFCAlbEsEN3kglqE483kK5n1AnwK00sSXvti0+OiarSBVz
   XKt4AnDkTXcyN5ANbIS0+vXdYx2dIrP58qN3WWACse9WEEBOTpyxV1O1X
   DR3sJtSCcbrmCMNsFWnNzbZ1ByyuvT02apIgjxjAkbadl69+cUA5oYJ1O
   w==;
X-CSE-ConnectionGUID: fCE0QipGQ/yQtgF6phWZ0g==
X-CSE-MsgGUID: fGXyxyZWQUmMKrMKVfG6UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="68769315"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="68769315"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 01:35:22 -0800
X-CSE-ConnectionGUID: UfDUs+64SOeA8dEBSadmyA==
X-CSE-MsgGUID: S1JcPWs3TYKN0T1dgDEEqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="216251736"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2025 01:35:21 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 6/6] ASoC: Intel: catpt: Do not block the system from suspending
Date: Wed, 26 Nov 2025 10:55:23 +0100
Message-Id: <20251126095523.3925364-7-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251126095523.3925364-1-cezary.rojewski@intel.com>
References: <20251126095523.3925364-1-cezary.rojewski@intel.com>
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

