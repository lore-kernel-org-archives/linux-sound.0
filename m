Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB3A2DC322
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 13:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765805383; cv=none; b=qbQ54UK07ryADgzdbSbNOWLP1snvzHTEwoB4cKitxZDdFKZzLY9BGRP0VyvpROGe18leuP3X2IXC6xWaYua+9BWV41QHX4oXjtOieQ8FCRJojCxQvFbGa9t2FRwg46w3Pbd1+gMrs2dcD+cSnjo2I1O50ujtptcJRpLsSdRVd/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765805383; c=relaxed/simple;
	bh=4AXkeN9QE+R2R7YkY/wtqsdNBRh3fvfDWZw0W9xWNuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gEgKfViaMDBWASXZFsSZqOetPJ2W9bRVqUOTVmfPbIRJikiPxY6uI+rgv1+M93HN4C3Vm/6xGsGgWaoKTA820YPpFTtbeE+73+CLpdQ2LRcHkeJr8aggY49Win0k0qVZ3bxuxYJ3DXtKnBpj8RM9u/DJ2cXSwcX/fVJKuGznNgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZSHZM3A1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZSHZM3A1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765805382; x=1797341382;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4AXkeN9QE+R2R7YkY/wtqsdNBRh3fvfDWZw0W9xWNuo=;
  b=ZSHZM3A1Ji5w4biS7s6AizIjTM4X5Azce6XoZcqb9ZufkYZLk9U9cV4l
   MutgFNlsvtG179kMcRdr7WHJh7pK4x8sXij2WPr1MLMtRYOtKX1b7WcvF
   sP12DLNAV95glFq4jhXqqZYOztrCkPmj3Ha7UvFEnuVWiPJ8tBVM1jdFI
   nf09UVUcO+CWpXgyP5i5F0Xxr8afzRtvT1IJDkZmKitoqOJZja0CMU9Yp
   KmhymfVuqwnQyZnNnPo/SL64xFkHjddNbdXHsm2MG3pP7bJsZmcANhH3j
   jyiBp2s9yUNDx8oa7Q0YsvJ6CdxStv/8Klj4vFpuPse3XyViX6ptE3kLw
   Q==;
X-CSE-ConnectionGUID: LiCgMHL9TlWMbe+8ps5CzA==
X-CSE-MsgGUID: JpREo3BEQKm++7iOqrX0vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="93179487"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="93179487"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 05:29:41 -0800
X-CSE-ConnectionGUID: M84vPYmbQkC0I/o3DnKXSg==
X-CSE-MsgGUID: KstDm5joSqmwVBiDM91iqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="228377003"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.95])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 05:29:40 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH 6/8] ASoC: SOF: Intel: pci-lnl: Set on_demand_dsp_boot for LNL
Date: Mon, 15 Dec 2025 15:29:44 +0200
Message-ID: <20251215132946.2155-7-peter.ujfalusi@linux.intel.com>
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

LNL can be used with on-demand DSP booting, set the flag to enable it.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/intel/pci-lnl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/intel/pci-lnl.c b/sound/soc/sof/intel/pci-lnl.c
index ae379c23f008..acb4429df9ec 100644
--- a/sound/soc/sof/intel/pci-lnl.c
+++ b/sound/soc/sof/intel/pci-lnl.c
@@ -40,6 +40,7 @@ static const struct sof_dev_desc lnl_desc = {
 	.ipc_supported_mask	= BIT(SOF_IPC_TYPE_4),
 	.ipc_default		= SOF_IPC_TYPE_4,
 	.dspless_mode_supported	= true,
+	.on_demand_dsp_boot	= true,
 	.default_fw_path = {
 		[SOF_IPC_TYPE_4] = "intel/sof-ipc4/lnl",
 	},
-- 
2.52.0

