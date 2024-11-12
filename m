Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E013323098C
	for <linux-sound@vger.kernel.org>; Tue, 12 Nov 2024 11:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731411559; cv=none; b=UkgjPv1GIWLNGCAWtFpibFATjN8/TeBUQAorMzY7xDrjPKJidhiKL7F3gB2qN+saNfYeWem0zkcxnYc6RRG2NvNzpZ5GWwOQhvRmon9lEFnCfyoHuwyxSYbObsk5Bamyh+i04tt3fWLpiRzN8ZQSovK9as7uOie8B2/M1Q7ZCGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731411559; c=relaxed/simple;
	bh=QX6B/jIjZldaT/9RYRAOtfydt+k0G/gsCl+Z5BDleLQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ebdRdTm+ECSMxFSm7PzCkEN5ignRHj/GiKGd4owpffLg3ZSTPUp5unMdvfgLBiOBCB01f0h0VFaYVvkeM5ZkII0ew0C2okjajgAaURByW00OtH1dJ9Fws5OBvvoCgcndW8s2Iayh+HxykWF2GA6WEA+7Ef1Yt9IKv8yEIenwDUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MxBBiOTT; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MxBBiOTT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731411559; x=1762947559;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QX6B/jIjZldaT/9RYRAOtfydt+k0G/gsCl+Z5BDleLQ=;
  b=MxBBiOTTVmoM7BrGpwAmvqx4K3CEJw3KYuzZqXhKFtJxr0DZJB9bUJmn
   d9SUqatZh8lYqzJ4iDdQzRA+r7bdCojZYoF2FRiGqVeGWpJ7K5cEsAmBN
   fLZeil9ks5VHdirzH6iqh575L/PFVAcYlDcE+wMrEd+MtCegb4gjDETwK
   H76ANc+XL+q46TnUnL/NLrdf4hpGTaMLd7NvvI7beD80mphK3TYQNNkRc
   NN6pSFLLlpOynTjdqXrQ/gnDFYz0X81gCxtLXd2Vr8PtEuQag7PABaWpz
   79/pRey3qf5xuYSa6YSHzjsP1qvJFXC1BHH4RcCSUviclwiRAKo7wS0uX
   A==;
X-CSE-ConnectionGUID: DKl0gcMVSwqNXd/v2fON5w==
X-CSE-MsgGUID: Tc448bUyT9S97uYpTr3YSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41802893"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41802893"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 03:39:18 -0800
X-CSE-ConnectionGUID: Yeb16pR7Ta60K7lKrx/Z9A==
X-CSE-MsgGUID: xkJOV2iiQIWK3cDIgN0IpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="118358223"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmviesa001.fm.intel.com with ESMTP; 12 Nov 2024 03:39:16 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [RFC PATCH v2 2/4] ASoC: Intel: avs: Separate path state from pipeline state
Date: Tue, 12 Nov 2024 12:40:04 +0100
Message-Id: <20241112114006.2812697-3-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112114006.2812697-1-amadeuszx.slawinski@linux.intel.com>
References: <20241112114006.2812697-1-amadeuszx.slawinski@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently path states use pipeline state defines. This is problematic if
machine state is to be used to start pipelines in special usecase
scenarios, so provide separate defines for path states and use them.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/path.c | 21 +++++++++++----------
 sound/soc/intel/avs/path.h |  8 ++++++++
 2 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index f31d5e2caa7b0..fa9ca3faec871 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -891,7 +891,7 @@ static struct avs_path *avs_path_create_unlocked(struct avs_dev *adev, u32 dma_i
 	if (ret < 0)
 		goto err;
 
-	path->state = AVS_PPL_STATE_INVALID;
+	path->state = AVS_PATH_STATE_UNKNOWN;
 	return path;
 err:
 	avs_path_free_unlocked(path);
@@ -1033,7 +1033,7 @@ int avs_path_reset(struct avs_path *path)
 	struct avs_dev *adev = path->owner;
 	int ret;
 
-	if (path->state == AVS_PPL_STATE_RESET)
+	if (path->state == AVS_PATH_STATE_RESET)
 		return 0;
 
 	list_for_each_entry(ppl, &path->ppl_list, node) {
@@ -1041,12 +1041,12 @@ int avs_path_reset(struct avs_path *path)
 						 AVS_PPL_STATE_RESET);
 		if (ret) {
 			dev_err(adev->dev, "reset path failed: %d\n", ret);
-			path->state = AVS_PPL_STATE_INVALID;
+			path->state = AVS_PATH_STATE_UNKNOWN;
 			return AVS_IPC_RET(ret);
 		}
 	}
 
-	path->state = AVS_PPL_STATE_RESET;
+	path->state = AVS_PATH_STATE_RESET;
 	return 0;
 }
 
@@ -1056,7 +1056,7 @@ int avs_path_pause(struct avs_path *path)
 	struct avs_dev *adev = path->owner;
 	int ret;
 
-	if (path->state == AVS_PPL_STATE_PAUSED)
+	if (path->state == AVS_PATH_STATE_PAUSED)
 		return 0;
 
 	list_for_each_entry_reverse(ppl, &path->ppl_list, node) {
@@ -1064,12 +1064,12 @@ int avs_path_pause(struct avs_path *path)
 						 AVS_PPL_STATE_PAUSED);
 		if (ret) {
 			dev_err(adev->dev, "pause path failed: %d\n", ret);
-			path->state = AVS_PPL_STATE_INVALID;
+			path->state = AVS_PATH_STATE_UNKNOWN;
 			return AVS_IPC_RET(ret);
 		}
 	}
 
-	path->state = AVS_PPL_STATE_PAUSED;
+	path->state = AVS_PATH_STATE_PAUSED;
 	return 0;
 }
 
@@ -1079,7 +1079,7 @@ int avs_path_run(struct avs_path *path, int trigger)
 	struct avs_dev *adev = path->owner;
 	int ret;
 
-	if (path->state == AVS_PPL_STATE_RUNNING && trigger == AVS_TPLG_TRIGGER_AUTO)
+	if (path->state == AVS_PATH_STATE_RUNNING && trigger == AVS_TPLG_TRIGGER_AUTO)
 		return 0;
 
 	list_for_each_entry(ppl, &path->ppl_list, node) {
@@ -1090,11 +1090,12 @@ int avs_path_run(struct avs_path *path, int trigger)
 						 AVS_PPL_STATE_RUNNING);
 		if (ret) {
 			dev_err(adev->dev, "run path failed: %d\n", ret);
-			path->state = AVS_PPL_STATE_INVALID;
+			path->state = AVS_PATH_STATE_UNKNOWN;
 			return AVS_IPC_RET(ret);
 		}
 	}
 
-	path->state = AVS_PPL_STATE_RUNNING;
+	path->state = AVS_PATH_STATE_RUNNING;
+
 	return 0;
 }
diff --git a/sound/soc/intel/avs/path.h b/sound/soc/intel/avs/path.h
index bfd253c9fa951..a60e6d2f4ad5c 100644
--- a/sound/soc/intel/avs/path.h
+++ b/sound/soc/intel/avs/path.h
@@ -13,6 +13,14 @@
 #include "avs.h"
 #include "topology.h"
 
+enum avs_path_state {
+	AVS_PATH_STATE_UNKNOWN = 0,
+	AVS_PATH_STATE_RESET,
+	AVS_PATH_STATE_PAUSED,
+	AVS_PATH_STATE_DETECTING,
+	AVS_PATH_STATE_RUNNING,
+};
+
 struct avs_path {
 	u32 dma_id;
 	struct list_head ppl_list;
-- 
2.34.1

