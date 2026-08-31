Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1469119EED3
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 16:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194327; cv=none; b=BWo4vXSFyJveyEMNEwY2RJszMNi1KCdfFkBBiJFvglVAELe2T5A6W7Wvj73WTYHkeq4LiYKc9YepGEo3OVFvv+dOrsPNRqgNs/7t7ZbLuck6LNyB2uZ3RNE6yJ0jbTsgkFWcnYq0IDvT6lvTbcWJgf38b6pu1MKyRkLYNNjmq8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194327; c=relaxed/simple;
	bh=BAVdsAVQnJ5KdyOugV+Msv43Jgls7cyem4g7psGZQto=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QK73DW+trS/F4MGBOtseZ5qZE0rk/tfxqvJqq6PFRp9nRIfXBNLTxs9pHdkX2UlMy6MbwI9ygpr3k8q1OmcT1GynHC7tfd9H5z1NjYK80rc7iBYt9Y0uzp2gHwIx18EZQsjBX/9KvT1rM5/RZPtTlD84OMB1w3Cy0hyFOIdIit4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FBFBCS83; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FBFBCS83"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788194326; x=1819730326;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BAVdsAVQnJ5KdyOugV+Msv43Jgls7cyem4g7psGZQto=;
  b=FBFBCS83b+vqzI6YE4YuUc8aBTrmhIQIOBLA/kiyS4nsBgbl0yi2IjW1
   PYRD4VX8fRhkZozztoMKhDEX6vPNSREbKitGTMEc1uABBfG8EsFLsFYki
   H0+NEAOah8YrWRxsVqiCKdlaoqvX+KhL//IsyfsI//+6mdKNHSMR2cFQz
   PHwM7CW4Lv/t5sgi1+HMm7xtJWeeG+IfirClOwoO7Yv03s/TB+Y8LqhMl
   Xw0/FQcAAE20stQXpIKc0BCZVWHtxM0YfJdEwXjF4GyOrdniKNwu3DWTG
   M4+17UJoXUYCBckBY2V7ba4mLmf6LalzaAV4Kvfa6nR9uNmilP3cK0LKK
   Q==;
X-CSE-ConnectionGUID: ZjmZv+weSuOjRPHzsn6haw==
X-CSE-MsgGUID: 4Myy2AUJQ/imdS3/kdzgXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="111379759"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="111379759"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 09:38:46 -0700
X-CSE-ConnectionGUID: 6lRl3hFRSlu32rld1lOfIg==
X-CSE-MsgGUID: P0nS/r3wQCK8xXGiVe/MrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="274111881"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa005.fm.intel.com with ESMTP; 31 Aug 2026 09:38:44 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 08/10] ASoC: Intel: avs: Fix unbalanced module reference count
Date: Mon, 31 Aug 2026 18:42:31 +0200
Message-Id: <20260831164233.1487766-9-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831164233.1487766-1-cezary.rojewski@intel.com>
References: <20260831164233.1487766-1-cezary.rojewski@intel.com>
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

