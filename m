Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7296E2DFA48
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 13:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765805388; cv=none; b=pmgCTnGF1RGcTl72MUiWaIqbl6wdfCvvo1W1XsjpqaMe3+PVD44YrUU0QTbLWuOMzQtsz4O/bQwhA7tUpDKOjNw7UbWavUSvIZqXIRO4A8GGrbKhq1hJ3NS5TMmTNqzwvDfI+qP6tNBJ+v94YExND5ayNeKieTWhbEMCizBtEfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765805388; c=relaxed/simple;
	bh=9suOuEfRjmUm8GvfIZR1+SdrEu5xOaXfed7urXueX50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gx8mNA02j9Qb8bEcKY1AcgQKIOjmvka+emFAE/MODmbmF6fPDzAQojMFthFfxaMdJtZ6l3ZJhsQmBOHlJ7cVNHL2cuTMiDEAB9PClV1eSLIPW5z5Sg1g9ZuuE6D3ZBVMUplsjU+X5WSdFQhiLZaTZRkm3uLnaOBXWI92EMjvjAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dcUkS6lP; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dcUkS6lP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765805387; x=1797341387;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9suOuEfRjmUm8GvfIZR1+SdrEu5xOaXfed7urXueX50=;
  b=dcUkS6lPGmv1sf3TrLvZhY+5tYYaI0BCxYTLbZhQzxHystFJEg95v8az
   v1cGdlQASaVzocExOEI63NPTNboPly1mBxF+o3i8bzSaBPSrATXM2mvx9
   RqoZKh56PFNZmtqBk/OFkBnsH92cxSHtCEPRL1ft76QVxX58xLUhn0VTB
   x147udDZUciOs9gf9/AMNIkbg7//hvePi488miJ75hzG/VZXqC2tkwALQ
   ekuRu8AV5Occ7pFhVmoP+VK6IiF+hOiklTv4DldmzTUwaxz+eH1ofc7pb
   K67X70H6E3nuCon0Iyv2VG1dVkMcweApQ3naWzw7CC6kOu1bs7Nhqe97X
   w==;
X-CSE-ConnectionGUID: LiykvnsHS5+txBNxTp+7yg==
X-CSE-MsgGUID: PkfbXlX1TRClznQjFcSiGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="93179499"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="93179499"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 05:29:47 -0800
X-CSE-ConnectionGUID: TL4jzFVvT9mPD8COJIrfuA==
X-CSE-MsgGUID: Yh5H/wxsR1Otz+6NLnHC6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="228377026"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.95])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 05:29:45 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH 8/8] ASoC: SOF: Intel: pci-nvl: Set on_demand_dsp_boot for NVL-S
Date: Mon, 15 Dec 2025 15:29:46 +0200
Message-ID: <20251215132946.2155-9-peter.ujfalusi@linux.intel.com>
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

NVL-S can be used with on-demand DSP booting, set the flag to enable it.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/pci-nvl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/intel/pci-nvl.c b/sound/soc/sof/intel/pci-nvl.c
index c499c14b93d5..f75aa996a5bd 100644
--- a/sound/soc/sof/intel/pci-nvl.c
+++ b/sound/soc/sof/intel/pci-nvl.c
@@ -38,6 +38,7 @@ static const struct sof_dev_desc nvl_s_desc = {
 	.ipc_supported_mask	= BIT(SOF_IPC_TYPE_4),
 	.ipc_default		= SOF_IPC_TYPE_4,
 	.dspless_mode_supported	= true,
+	.on_demand_dsp_boot	= true,
 	.default_fw_path = {
 		[SOF_IPC_TYPE_4] = "intel/sof-ipc4/nvl-s",
 	},
-- 
2.52.0

