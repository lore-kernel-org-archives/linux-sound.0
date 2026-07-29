Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BF6477E21
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 10:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785322636; cv=none; b=i9n6pBqpQ1yphg/yQwVud5PMnKMeKX5tQWGxY/hAgCFzm2sF9rE4D0fdo8ZUzPJCehV4HGRCu8R6uy7H2R8sLl5zzzwzSqJKPQxgNu5we5V5KqPW9WjcQFGh3kTlmAw7+k4K7Gyk6tk8fVoGKNqpzbWdB8rFXsSkP0fTtnGOmys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785322636; c=relaxed/simple;
	bh=NH+BcGev3Xw603tY76HPdLzCuEoqJ3fWlgkxx0CFbfM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iAf8r8H01o+uxspHFsAKvORIFIVgztzFzDB7FAMZdjgSzUnIcgNjysGGQC4WhklAuKPKSYNsC2ohv6Z9xkS+IGwT0TE5j/ABkupELZpDJU6XAW0GCwWo39tDoDSXVVLkKSx82rbkqj8+5w2apCBPSIv6w0HKLtIOmt3WL8cBLug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ay9hj7xf; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ay9hj7xf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785322635; x=1816858635;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NH+BcGev3Xw603tY76HPdLzCuEoqJ3fWlgkxx0CFbfM=;
  b=ay9hj7xfpEkcaDllQ5kIGukMyNUuZaj2wVb+v/tGSNEs4/CdP5Mcoa5F
   cq9XS30z7QNgyLMWNhpULR1brjZr5RagxTlFLFi0XYnGJL9bPdwkQBQFH
   4SjtXgd9YzV/IY8/9d6qn4eZDHfn++WHmvVtQL5pL4aisn72ElHpfIaXN
   2QlDba1XLuYWjEJQuTA3YEWOhF2QxL0iTL0Dqm/HNDY1O5CeN8/UM/Evr
   BiVog+p58gyCy4GWcOxpEtOYUVxdShRr7CPiXk/HYDMiA7vyizsKvkDLK
   ASd9+kKhJRXlL9jda6dUfXIjt5L0I6DYHbcAeGTuV1FOuM+YU4irDuRg+
   A==;
X-CSE-ConnectionGUID: V96KeJShR02Fq394j4WpAQ==
X-CSE-MsgGUID: 7wRSpeuNTeS728xQi71q+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96583829"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="96583829"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 03:57:14 -0700
X-CSE-ConnectionGUID: qnlluOkrSsG9OddSYDbDTA==
X-CSE-MsgGUID: y/bcK8m3Q6qGXh5cRRZjaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="255675919"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa006.fm.intel.com with ESMTP; 29 Jul 2026 03:57:12 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 1/8] ASoC: Intel: catpt: Wrap the store firmware-context procedure
Date: Wed, 29 Jul 2026 13:00:50 +0200
Message-Id: <20260729110057.342447-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260729110057.342447-1-cezary.rojewski@intel.com>
References: <20260729110057.342447-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All store/restore firmware operations are located in the loader.c file.
All except the "store firmware context" procedure which is manually
called during the runtime suspend, device.c file.

Adding a wrapper alters functional flow slightly - DMA channel is
requested after the DXSTATE IPC rather than before it but this has no
real impact on the procedure.

At the same time, such approach limits number of symbols exposed in the
core.h file and improves code cohesiveness: all catpt_dma_xxx()
definitions in dsp.c, all their usages in loader.c.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/core.h   |  4 +---
 sound/soc/intel/catpt/device.c | 33 +++-------------------------
 sound/soc/intel/catpt/loader.c | 39 +++++++++++++++++++++++++++++++---
 3 files changed, 40 insertions(+), 36 deletions(-)

diff --git a/sound/soc/intel/catpt/core.h b/sound/soc/intel/catpt/core.h
index 3881164422b8..f68807c454c9 100644
--- a/sound/soc/intel/catpt/core.h
+++ b/sound/soc/intel/catpt/core.h
@@ -139,9 +139,7 @@ int catpt_dsp_send_msg(struct catpt_dev *cdev, struct catpt_ipc_msg request,
 
 int catpt_first_boot_firmware(struct catpt_dev *cdev);
 int catpt_boot_firmware(struct catpt_dev *cdev, bool restore);
-int catpt_store_streams_context(struct catpt_dev *cdev, struct dma_chan *chan);
-int catpt_store_module_states(struct catpt_dev *cdev, struct dma_chan *chan);
-int catpt_store_memdumps(struct catpt_dev *cdev, struct dma_chan *chan);
+int catpt_store_firmware_context(struct catpt_dev *cdev);
 int catpt_coredump(struct catpt_dev *cdev);
 
 #include <sound/memalloc.h>
diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
index b176aebea9d5..e36eea8b5408 100644
--- a/sound/soc/intel/catpt/device.c
+++ b/sound/soc/intel/catpt/device.c
@@ -28,44 +28,17 @@
 static int catpt_do_suspend(struct device *dev)
 {
 	struct catpt_dev *cdev = dev_get_drvdata(dev);
-	struct dma_chan *chan;
 	int ret;
 
-	chan = catpt_dma_request_config_chan(cdev);
-	if (IS_ERR(chan))
-		return PTR_ERR(chan);
-
 	memset(&cdev->dx_ctx, 0, sizeof(cdev->dx_ctx));
 	ret = catpt_ipc_enter_dxstate(cdev, CATPT_DX_STATE_D3, &cdev->dx_ctx);
-	if (ret) {
-		ret = CATPT_IPC_RET(ret);
-		goto release_dma_chan;
-	}
-
-	ret = catpt_dsp_stall(cdev, true);
-	if (ret)
-		goto release_dma_chan;
-
-	ret = catpt_store_memdumps(cdev, chan);
-	if (ret) {
-		dev_err(cdev->dev, "store memdumps failed: %d\n", ret);
-		goto release_dma_chan;
-	}
-
-	ret = catpt_store_module_states(cdev, chan);
-	if (ret) {
-		dev_err(cdev->dev, "store module states failed: %d\n", ret);
-		goto release_dma_chan;
-	}
-
-	ret = catpt_store_streams_context(cdev, chan);
 	if (ret)
-		dev_err(cdev->dev, "store streams ctx failed: %d\n", ret);
+		return CATPT_IPC_RET(ret);
 
-release_dma_chan:
-	dma_release_channel(chan);
+	ret = catpt_store_firmware_context(cdev);
 	if (ret)
 		return ret;
+
 	return catpt_dsp_power_down(cdev);
 }
 
diff --git a/sound/soc/intel/catpt/loader.c b/sound/soc/intel/catpt/loader.c
index c577f2e17ddf..880f62896997 100644
--- a/sound/soc/intel/catpt/loader.c
+++ b/sound/soc/intel/catpt/loader.c
@@ -81,7 +81,7 @@ catpt_request_region(struct resource *root, resource_size_t size)
 	return __request_region(root, addr, size, NULL, 0);
 }
 
-int catpt_store_streams_context(struct catpt_dev *cdev, struct dma_chan *chan)
+static int catpt_store_streams_context(struct catpt_dev *cdev, struct dma_chan *chan)
 {
 	struct catpt_stream_runtime *stream;
 
@@ -108,7 +108,7 @@ int catpt_store_streams_context(struct catpt_dev *cdev, struct dma_chan *chan)
 	return 0;
 }
 
-int catpt_store_module_states(struct catpt_dev *cdev, struct dma_chan *chan)
+static int catpt_store_module_states(struct catpt_dev *cdev, struct dma_chan *chan)
 {
 	int i;
 
@@ -138,7 +138,7 @@ int catpt_store_module_states(struct catpt_dev *cdev, struct dma_chan *chan)
 	return 0;
 }
 
-int catpt_store_memdumps(struct catpt_dev *cdev, struct dma_chan *chan)
+static int catpt_store_memdumps(struct catpt_dev *cdev, struct dma_chan *chan)
 {
 	int i;
 
@@ -171,6 +171,39 @@ int catpt_store_memdumps(struct catpt_dev *cdev, struct dma_chan *chan)
 	return 0;
 }
 
+int catpt_store_firmware_context(struct catpt_dev *cdev)
+{
+	struct dma_chan *chan;
+	int ret;
+
+	chan = catpt_dma_request_config_chan(cdev);
+	if (IS_ERR(chan))
+		return PTR_ERR(chan);
+
+	ret = catpt_dsp_stall(cdev, true);
+	if (ret)
+		goto exit;
+
+	ret = catpt_store_memdumps(cdev, chan);
+	if (ret) {
+		dev_err(cdev->dev, "store memdumps failed: %d\n", ret);
+		goto exit;
+	}
+
+	ret = catpt_store_module_states(cdev, chan);
+	if (ret) {
+		dev_err(cdev->dev, "store module states failed: %d\n", ret);
+		goto exit;
+	}
+
+	ret = catpt_store_streams_context(cdev, chan);
+	if (ret)
+		dev_err(cdev->dev, "store streams ctx failed: %d\n", ret);
+exit:
+	dma_release_channel(chan);
+	return ret;
+}
+
 static int
 catpt_restore_streams_context(struct catpt_dev *cdev, struct dma_chan *chan)
 {
-- 
2.34.1

