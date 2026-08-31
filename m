Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0F93DB324
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 09:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168730; cv=none; b=oBSEUr/AsySPbNjeXXOG3SstoOf1vensuDtEIyvY4uQBy3tjsSGiZPTZxdD6/y6WJaNgWmePOFjIYXg8IWYA2u9h3wACRoYRjvVj4z1u8WUrGntxcSHNkXZTHempj5CBiZb3fubpXLpOqzzXgpvVY6+CF6WWgIAWae/m902u9/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168730; c=relaxed/simple;
	bh=BAVdsAVQnJ5KdyOugV+Msv43Jgls7cyem4g7psGZQto=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bFESVlQSVjrqS0X6ecnriVfRRNU4mNOCdcZPDlViZeuCFk/cen043I2gw9PaM3nwhN2J1xTc96mFVoQT/KcAlMaFEr6T5dDUk5KdVPW2faYzJLsf02mfKK0j9GkxlD/lTdPVUuXJodeVAHyTYvFwqrZhjN/1aFcbBIiE+PQPzeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J2mDmmbY; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J2mDmmbY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788168729; x=1819704729;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BAVdsAVQnJ5KdyOugV+Msv43Jgls7cyem4g7psGZQto=;
  b=J2mDmmbYUS6ZC4mAFJlrph3NYejsEdF7RzEwkRUywN5l0GEDwmFRBhsq
   tptlLyXXBvcLpDDfUm+yUM02OW7Ljxcf+AUJ/bzJclvfPDcJRfrQg/8fc
   +Pc45aHhJlV5L5WX3x3P5gdF8XvUQBmyca9xk/8tX9LVUaxXwUq4URxbQ
   NZaqAK8LK89vGYi67B0D2kN7cd50W0qfqvWH/HtzPJjYUBAh1Nl6UfdZ1
   OsHbsRGimEQ/85wra2N46i+JcMlOQr1hcRA8JPh6KztgfwdBKugBqBQAw
   00/magV7sLgLxKqIr9EpBkqWof5F3YLCg9vPpL2sWmPW8v0hzmztZF+3K
   w==;
X-CSE-ConnectionGUID: xFX+5yrCRqSKJpk26VEh5g==
X-CSE-MsgGUID: hrTArQtsRtavSqGJhsRDIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88333005"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88333005"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:32:08 -0700
X-CSE-ConnectionGUID: zyqIS2eHSASxzV4nxY5M6A==
X-CSE-MsgGUID: jTHt48MASEu/ZfQkUzx3Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="265508041"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa007.fm.intel.com with ESMTP; 31 Aug 2026 02:32:07 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 09/11] ASoC: Intel: avs: Fix unbalanced module reference count
Date: Mon, 31 Aug 2026 11:36:13 +0200
Message-Id: <20260831093615.1117987-10-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831093615.1117987-1-cezary.rojewski@intel.com>
References: <20260831093615.1117987-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strace_open() invokes try_module_get() which on success takes
the module reference.  If any follow up operation causes
strace_open() to fail, the refcount shall be put down.

Fixes: 0a5fb3cc28fd ("ASoC: Intel: avs: Keep module refcount up when gathering traces")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/debugfs.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/avs/debugfs.c b/sound/soc/intel/avs/debugfs.c
index 9ab503da3b75..bc02737720ab 100644
--- a/sound/soc/intel/avs/debugfs.c
+++ b/sound/soc/intel/avs/debugfs.c
@@ -9,6 +9,7 @@
 #include <linux/cleanup.h>
 #include <linux/debugfs.h>
 #include <linux/kfifo.h>
+#include <linux/module.h>
 #include <linux/wait.h>
 #include <linux/sched/signal.h>
 #include <linux/string_helpers.h>
@@ -236,15 +237,20 @@ static int strace_open(struct inode *inode, struct file *file)
 	if (!try_module_get(adev->dev->driver->owner))
 		return -ENODEV;
 
-	if (kfifo_initialized(&adev->trace_fifo))
-		return -EBUSY;
+	if (kfifo_initialized(&adev->trace_fifo)) {
+		ret = -EBUSY;
+		goto err;
+	}
 
 	ret = kfifo_alloc(&adev->trace_fifo, PAGE_SIZE, GFP_KERNEL);
 	if (ret < 0)
-		return ret;
+		goto err;
 
 	file->private_data = adev;
 	return 0;
+err:
+	module_put(adev->dev->driver->owner);
+	return ret;
 }
 
 static int strace_release(struct inode *inode, struct file *file)
-- 
2.34.1

