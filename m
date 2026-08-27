Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0799B471404
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 13:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787836307; cv=none; b=K3mpR7bKKoFFlY1W2b7kbbkNxCzd0oPAMmnoaQ1dLtDO/gNXbsSdSCvHYmrM7ngHaQI+HeAVAaokpIRLvwS2TVVeXsB0xUjQa2q/Cv+GLpbclv1eSR08ZTdVNnxYkcC+6q8/GlJ3OSKV+pqrtx1yk1yUPrPtXL17LBR99h0z8Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787836307; c=relaxed/simple;
	bh=BAVdsAVQnJ5KdyOugV+Msv43Jgls7cyem4g7psGZQto=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fediTjjiDJJoQBMI3JcHH89BXnpiJuv+rCnNIrzRyRo8OY1NXlId5pbw1mOIKXX4u+ky6qYh0uNnYtc85hJt/rPSEtLlz8grOPJxIH/UceENjMwGd+RGN9uNlbpcL3RmaB/Li9mgRdPm29udmlFV0IRxGgWUT412mJl3EiekOBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mqX7V9bW; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mqX7V9bW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787836303; x=1819372303;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BAVdsAVQnJ5KdyOugV+Msv43Jgls7cyem4g7psGZQto=;
  b=mqX7V9bWKWR7kBEVDdwt0qzQeNwMRcLe7p41on3DQl+2wtKqKUAhdwnz
   tpG89Om1qiWXSpVBD05X2E8+wFGR3LCBA+pREG4aGLfgwxT2gCGLu03DJ
   pDCgU/uRhbYpDyzQ51vfFrH9jlSQDo2sfvfHf7lIxi3TZ/VyLKHXgPSjX
   HGXBa/ZwF6DWpJ+/53wFJaIn0vowqwqWpauTRqJN2giUVmQMVUwJeb5+l
   kOKkn93sZG9tSUj6LZVLCJhgM9KdRngVNEMJ+D3oJX13FReNJxTnQUsxQ
   C/rC3IpwXZ3vMlQtpqW0GGqcigkOaDE+P5Dr7vpAX8oLpsQRZAMN7IMeA
   A==;
X-CSE-ConnectionGUID: fKFaCz1tRZuRFGAaLL+kUQ==
X-CSE-MsgGUID: 2rp7dBKnTjOalFDZuFbmlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88539081"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88539081"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 06:11:02 -0700
X-CSE-ConnectionGUID: kjL88dGXRI6duD1gFM7MoA==
X-CSE-MsgGUID: 27AgcvTFTWafexjYUw0xqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="263589365"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa006.fm.intel.com with ESMTP; 27 Aug 2026 06:11:00 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 08/10] ASoC: Intel: avs: Fix unbalanced module reference count
Date: Thu, 27 Aug 2026 15:15:08 +0200
Message-Id: <20260827131510.1014084-9-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260827131510.1014084-1-cezary.rojewski@intel.com>
References: <20260827131510.1014084-1-cezary.rojewski@intel.com>
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

