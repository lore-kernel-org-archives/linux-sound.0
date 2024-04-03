Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5047A13A25C
	for <linux-sound@vger.kernel.org>; Wed,  3 Apr 2024 10:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712141539; cv=none; b=j/N7xn8WViQOPu1cg3iYotcAXkV934ogBFP9pAYWkmK9WAaS/LGsmmHosq6CNulzclBemGpzwUIYFaKj7TX0/0SPVbvfLmBajEFukIjOWautYBtWDfVil2WeH8Z3yLOOqXebPym3FHqtoMuIXVsxOpHckPhC4Unhh87s0lOHiCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712141539; c=relaxed/simple;
	bh=iXXIzp82egDjy9+TYz+ugE62ypHc3SPIS16HEE/JNN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z7Y69il3JBmR/9DReuVflrtsnKxwxPc523hY1aWy0GxeF7Cr0q1T7gSfG8hgq4W9vVg3+EZZdcLkRVzNzQra7VMrbIn4uSoZBoeXYIiUSOW7gWHvoXmzcrLK3O/2BhXcGSVRSrHWNfUa2uV6Udxga1p4VImR1P0flVg2snMvYtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EI5wUAPe; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EI5wUAPe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712141538; x=1743677538;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iXXIzp82egDjy9+TYz+ugE62ypHc3SPIS16HEE/JNN4=;
  b=EI5wUAPebkDYX60BzoGiuSPmCdUyLC3lbkm4hg2DNYOECVutWbs45A6y
   AkpWXPl94IlBKX/aFLhTJZZNLatBFzznyPeovwHrij3hhqBSZyZFef7HJ
   CbLcmluZ9DwzOHv/8fQ6VmofRjyOVjBlHjd8Bn0gG+hqK8px/RokW+Y3I
   Tu1yZ4VWHaqCpVk3avRwLRF+3PLufM40IPfcn4jch80bCVahsgBvcbHpq
   HC7cfpWVk8FnQ+z5h7LQOo8uOiby7QMH9cSp05NVRIIE9TxKYILssZZs/
   d7lmo5PwMR+9WaqICpOWB4IdeAHxiZGqacDyR9PJ3ltTDUi8FcBHnm3Pk
   Q==;
X-CSE-ConnectionGUID: CKFoBe7fQ0qS54JIt0derw==
X-CSE-MsgGUID: Nps83ajxT12Zj/hCUefIUg==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7212227"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7212227"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 03:51:53 -0700
X-CSE-ConnectionGUID: zSjQga8DQHGfWRgQfjrT+g==
X-CSE-MsgGUID: SZNEajkJRYez8N917uc81A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="49374801"
Received: from aelgham-mobl2.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.35.133])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 03:51:50 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	rander.wang@intel.com,
	liam.r.girdwood@intel.com
Subject: [PATCH 4/7] ASoC: SOF: Intel: mtl: Disable interrupts when firmware boot failed
Date: Wed,  3 Apr 2024 13:52:07 +0300
Message-ID: <20240403105210.17949-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403105210.17949-1-peter.ujfalusi@linux.intel.com>
References: <20240403105210.17949-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case of error during the firmware boot we need to disable the interrupts
which were enabled as part of the boot sequence.

Fixes: 064520e8aeaa ("ASoC: SOF: Intel: Add support for MeteorLake (MTL)")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/intel/mtl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index a27ce8debe91..3bc229957365 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -508,6 +508,7 @@ int mtl_dsp_cl_init(struct snd_sof_dev *sdev, int stream_tag, bool imr_boot)
 	dump_msg = kasprintf(GFP_KERNEL, "Boot iteration failed: %d/%d",
 			     hda->boot_iteration, HDA_FW_BOOT_ATTEMPTS);
 	snd_sof_dsp_dbg_dump(sdev, dump_msg, flags);
+	mtl_enable_interrupts(sdev, false);
 	mtl_dsp_core_power_down(sdev, SOF_DSP_PRIMARY_CORE);
 
 	kfree(dump_msg);
-- 
2.44.0

