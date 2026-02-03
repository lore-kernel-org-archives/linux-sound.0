Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D1C2652B6
	for <linux-sound@vger.kernel.org>; Tue,  3 Feb 2026 11:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770117358; cv=none; b=V3GRQawvHE1DI4xP+KUHBauEk4nkk9wL+PzUHoth5aLVyw8yz+jJWAuieOq7LTK9t41ncAb5xZ+S4PrOK+4PUxfyBT/GEWQ0oM+gBqPM0bAzzBSHXYCEXshs0rLK3pV1vRqLmwEgg3eQG+dGOJMfQGoSt5tAG5EW+MWZN9Kkg5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770117358; c=relaxed/simple;
	bh=emfO6iUpqilyJW+W+B4lXQTfHaXtGmW+OUPPThsE3So=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QDnTxH0e4TJ03+Q/TqVEob+/20e9dSgUk3LJNE11skMGuj0V6QsJK5PucE94IURryLewIFknrD+2e4+xLsJMc4Ny6yRNH5s404tlkMp0RAAeVJF6LHcTpl8/RDAhMqnje7djWBpaXsLRxPGte45lYDg7LlPhkrXJrJyEcsaaqVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZuS86OkL; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZuS86OkL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770117357; x=1801653357;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=emfO6iUpqilyJW+W+B4lXQTfHaXtGmW+OUPPThsE3So=;
  b=ZuS86OkL8dxxBXq4Jpl281vd8H+3FP88HLFP0iHw+Y1lzVfpsdRLaAAs
   RXII7s0AgEQCXkmAmUF3KVReZgFizM2+/pjbZrKmnYDXwfPmz542nXx2h
   OO0WWKugKHNPcUKgsvH/4+4+bc683zS2HIwYqKU0VSmYnRXINK/BxYWOQ
   TGqoyoW+h5Y92iHomczplx3Mv69Nv9cvErdYiy+1iHBrXx2BYFZpqeHym
   NpAVTBH3hXB+lEtDsxDqZj02kQXAPNopG8qf2iDpW+0LMLoIT3xBLdqt5
   kmcHw/o0uM/v+c8sQtGJFzvipqGNRqOYbxnqFLNccgL/A/Nd8Pv8J3/13
   A==;
X-CSE-ConnectionGUID: qEpuOhCtSx6yWC7i7t6PiQ==
X-CSE-MsgGUID: 2kSvuEXwQCqZHtcM3714AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="70303423"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="70303423"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 03:15:56 -0800
X-CSE-ConnectionGUID: SjdEQJjtTG6wVgUN+YFZWA==
X-CSE-MsgGUID: JFOeibJRQCC6xfVzpbhZAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="213952384"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 03:15:55 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH] ASoC: SOF: Intel: allow module parameter override BT link to 0
Date: Tue,  3 Feb 2026 19:15:45 +0800
Message-ID: <20260203111545.3742255-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The existing code test if (bt_link_mask_override) to overwrite the BT
link mask. This doesn't allow user to disable the BT link mask. User may
want to disable the BT link when it is detected by the NHLT.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index c23f50b4fcbb..c0cc7d3ce526 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -482,7 +482,7 @@ static int mclk_id_override = -1;
 module_param_named(mclk_id, mclk_id_override, int, 0444);
 MODULE_PARM_DESC(mclk_id, "SOF SSP mclk_id");
 
-static int bt_link_mask_override;
+static int bt_link_mask_override = -1;
 module_param_named(bt_link_mask, bt_link_mask_override, int, 0444);
 MODULE_PARM_DESC(bt_link_mask, "SOF BT offload link mask");
 
@@ -1537,7 +1537,7 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 		 mach->mach_params.bt_link_mask);
 
 	/* allow for module parameter override */
-	if (bt_link_mask_override) {
+	if (bt_link_mask_override != -1) {
 		dev_dbg(sdev->dev, "overriding BT link detected in NHLT tables %#x by kernel param %#x\n",
 			mach->mach_params.bt_link_mask, bt_link_mask_override);
 		mach->mach_params.bt_link_mask = bt_link_mask_override;
-- 
2.43.0

