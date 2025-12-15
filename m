Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3362DFA31
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 13:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765805386; cv=none; b=n225xIUkm8PWO7Esj6S7fKM8f+ywM0GJchcD3sWCHYSF/VVkO5OBUsg7yzowDFpB/jV/hDolF50+Z+4U8G/qBJzMJZ2S1rKOQNr0CXaK1892gyVKjz16wF1ZHQxOdFS1J5yCPwX6bCWNgz0cZddj3r0C0Q0AvP7ISJbOm7gTzYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765805386; c=relaxed/simple;
	bh=YPo/RPBzARIEyH/WnYeo3xL1pvCQ1Uf1b1IV/p/ThH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YiKG3A/9kDqfgJm0a64HQ/77q8TuAsKZJYDnKl3Do3Gtd2EVGKDQgoudgcQG9wuQTRezWTO2d8FCMVpkk+rt8P23dc3/1ZBWsFx2LJhLd1fo5nNUSjAFeFc3f3iNTZChLF1yLFU7K2PDL4JRAQE6cokZ9goNPhLBIXpE9+68X1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f7f2RdzB; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f7f2RdzB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765805384; x=1797341384;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YPo/RPBzARIEyH/WnYeo3xL1pvCQ1Uf1b1IV/p/ThH4=;
  b=f7f2RdzBMdITLoy69VERfAqb6H4al/KplMxPuaMxs8G98aK6gdllNZbr
   6IQTfn3sVbCVhvbH47YgTeg0mjvjsjql7Pq0iv54Ir0lo9/putLC6saHR
   hVu1j7oXdiEgpKo230xWdBL83HIwXNNiXbVdTLRlOxZv/uDigWox9D30S
   BA3QmaYCrMDvWv0VIS2MPnsJeDldh7iyxreMSrrpIXrZUUTo64o7NPbks
   qwvXzP/KydlRivZRX4HQBiCCnZlW12sDkEKH4rcJmTrp4UxkLWZw8apqK
   OPGpa4j3JawK0fbX7b6x2q9PyTIjFazD4nWjO/jQUq4XcuXWMBybfQJjl
   w==;
X-CSE-ConnectionGUID: YdaI/BOTRhye/P5AYqzA4Q==
X-CSE-MsgGUID: vg4oXmMfQAWnuee0GyY4rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="93179493"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="93179493"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 05:29:44 -0800
X-CSE-ConnectionGUID: o5a/CNWwRE+DqQR6Avc7Ag==
X-CSE-MsgGUID: XgJ9t+2bQRSzGXN53SRcfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="228377016"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.95])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 05:29:42 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH 7/8] ASoC: SOF: Intel: pci-ptl: Set on_demand_dsp_boot for PTL and WCL
Date: Mon, 15 Dec 2025 15:29:45 +0200
Message-ID: <20251215132946.2155-8-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215132946.2155-1-peter.ujfalusi@linux.intel.com>
References: <20251215132946.2155-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PTL and WCL can be used with on-demand DSP booting, set the flag to
enable it.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/intel/pci-ptl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sof/intel/pci-ptl.c b/sound/soc/sof/intel/pci-ptl.c
index 68f6a9841633..9cb785ef763f 100644
--- a/sound/soc/sof/intel/pci-ptl.c
+++ b/sound/soc/sof/intel/pci-ptl.c
@@ -38,6 +38,7 @@ static const struct sof_dev_desc ptl_desc = {
 	.ipc_supported_mask	= BIT(SOF_IPC_TYPE_4),
 	.ipc_default		= SOF_IPC_TYPE_4,
 	.dspless_mode_supported	= true,
+	.on_demand_dsp_boot	= true,
 	.default_fw_path = {
 		[SOF_IPC_TYPE_4] = "intel/sof-ipc4/ptl",
 	},
@@ -67,6 +68,7 @@ static const struct sof_dev_desc wcl_desc = {
 	.ipc_supported_mask	= BIT(SOF_IPC_TYPE_4),
 	.ipc_default		= SOF_IPC_TYPE_4,
 	.dspless_mode_supported	= true,
+	.on_demand_dsp_boot	= true,
 	.default_fw_path = {
 		[SOF_IPC_TYPE_4] = "intel/sof-ipc4/wcl",
 	},
-- 
2.52.0

