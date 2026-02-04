Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB7C36AB53
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 08:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770193153; cv=none; b=IGc3bMizSlWe/k+ltVnI8EpQjy1FJuICjWu+KFcD8c8ZkCVYA/taX1uSaRO82WKGBjPZREZTU5O6ahS4S1eetAzq6GfPLCBF7HH8NzdvQVTI465ab2iEQuDEXS8NAlBCT9Jg+yN1izhNUmGnzB3zXtegjPQjL5/j3yXfJkKMBJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770193153; c=relaxed/simple;
	bh=XTOJpQxoZmfw+ttp25CYKBoDDDcAvUs1bXu6uyImMSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A9vYtuniErTdPsND1cUseiOn/ND9v7BVtgpJ799BjZxmnjt+T8YLHM1TbB+2h2rPOztDd7BVjwRfwp6iftZRmbt4SXMH17yVSMLjYcDynVEi1jzwDPUWFI+0XKzE82HAQgLyY3LJAJKOy+BWD7w2o6Be7yvsqxmMOEoeNOUmGKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FKqckjm1; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FKqckjm1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770193154; x=1801729154;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XTOJpQxoZmfw+ttp25CYKBoDDDcAvUs1bXu6uyImMSs=;
  b=FKqckjm1FlfqwWnB3JztRPRdlkahpMau3lQxKou+kJ3d+z5ybS8dsfvw
   Xn8gnjG+zB0oyIll2l2709ZPCOPhtpDr7t7JREQFKzuK6aB5qhLj0Esds
   T79zUn7q23xXMA1VA35RG700kXE8KPzZSditli5M7m7eMLvHeMC0vu01/
   he1XD5hyALOLzm2mTchJ7EulX2jmxwT+UfyBC8ax9HKs25BAjlcSjjF2U
   +g2DLQ+SJgxHKOuWGDi5nZZxYjaQuOqa8Wnt/liU+U+Fn/za/uRrAnFpf
   DF7SVtmU/zhVB7r9a4k9qXSKJNIbysRN/MehizxY/wdT1lSO9IVOh6/Zp
   A==;
X-CSE-ConnectionGUID: cqUUY/EERi2h+hjBEBNw8g==
X-CSE-MsgGUID: b9emXet5T4CfHTx9NPelpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="94028530"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="94028530"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 00:18:25 -0800
X-CSE-ConnectionGUID: HFjISK3WSLi0JF9+3eK7cw==
X-CSE-MsgGUID: oLqHYaUITLSA8zWMyw1jLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="209893386"
Received: from aotchere-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.245])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 00:18:22 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com,
	mateuszx.redzynia@intel.com
Subject: [PATCH 10/10] ASoC: SOF: Intel: hda: Add a virtual CPU DAI
Date: Wed,  4 Feb 2026 10:18:33 +0200
Message-ID: <20260204081833.16630-11-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204081833.16630-1-peter.ujfalusi@linux.intel.com>
References: <20260204081833.16630-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Add a virtual CPU DAI for loopback capture for echo reference
implementation. We can't use the snd-soc-dummy-dai because it is already
used for the bluetooth DAI link.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Mateusz Redzynia <mateuszx.redzynia@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 8 ++++++++
 sound/soc/sof/intel/hda.h     | 4 ++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 3c742d535133..15faedeec16d 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -866,6 +866,14 @@ struct snd_soc_dai_driver skl_dai[] = {
 		.channels_max = 4,
 	},
 },
+{
+	/* Virtual CPU DAI for Echo reference */
+	.name = "Loopback Virtual Pin",
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 2,
+	},
+},
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 {
 	.name = "iDisp1 Pin",
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 3be39c229c9f..6199002b0c13 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -418,10 +418,10 @@
 	(HDA_DSP_BDL_SIZE / sizeof(struct sof_intel_dsp_bdl))
 
 /* Number of DAIs */
-#define SOF_SKL_NUM_DAIS_NOCODEC	8
+#define SOF_SKL_NUM_DAIS_NOCODEC	9
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
-#define SOF_SKL_NUM_DAIS		15
+#define SOF_SKL_NUM_DAIS		16
 #else
 #define SOF_SKL_NUM_DAIS		SOF_SKL_NUM_DAIS_NOCODEC
 #endif
-- 
2.52.0

