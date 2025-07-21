Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B51274FEB
	for <linux-sound@vger.kernel.org>; Mon, 21 Jul 2025 06:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753079449; cv=none; b=GKVpj0TyKdGrJ+V8/+19Ql3g1deVm588qEd3zJM8krJzcND96a777m0m0NE2xN2CONU9SDcEMBa2iXsioFdzabh/yxG5sMCYxi8Z25CnOx7iE4/oLjbm1EovrxBfd4cGUrkJ5wkDYzer8G9Y+GaVkBlITEgvQITaeNYv11oFxUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753079449; c=relaxed/simple;
	bh=XtIIuIU01Gjev9c8prgsNjv+Xxdr7ygyOdk21uNeSvE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=at0Gri6yRl4NFuHUgPlhQ7V1kM078sX0wHeZD5wAaBRwHNdtvKXCvctAB5LZ+LpfaS1xJPhdo2JTLkl/xFasbGW4aoc3oC3XKwwabeDA3ESIrf253qX3Eq1z+tJhT2nAVOo/rA/xA+s8vdPFjVGORajBduilXlKt6H55Hf7ibl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DIimgFYS; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DIimgFYS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753079449; x=1784615449;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XtIIuIU01Gjev9c8prgsNjv+Xxdr7ygyOdk21uNeSvE=;
  b=DIimgFYSp8ep56Mi9KZOqiVt+zaj0/4JbojVsi1Jtn9BV+f2o5QnJhqJ
   o3wQ3wvHofMFbt19Dsupd2daN8AdGA23XvYauB+LLm/rXWxQvLhLV1n9S
   UbMoi0boTtWlNkvv+qoX1Vr9WzcAr60efDJsN+UwgA3x8Amdqj6ln0nRJ
   hPM0b0Ui7SeGhUJnvQzlvJYp2gBJHaD0VitmOcfJ4QVi7WbtuvxUH3oZ0
   Xgcnc6brHqmxb+R3/0Qk1eW755kFLXPX6SoQZqd2qngpfKKMUXVrWIuag
   8gfyUUZm6FNwExZ1SSihsCNp7lE6XbYLPbjaNG23OWBKg1r53zwSqGVZL
   Q==;
X-CSE-ConnectionGUID: 7NUVt9l4TSSZmtv1AoIX6A==
X-CSE-MsgGUID: DfMbJO9RQXaYrd5GI767CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="55376954"
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="55376954"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2025 23:30:48 -0700
X-CSE-ConnectionGUID: n1srSLRHSIOJatAf02Zb1g==
X-CSE-MsgGUID: tEDIqBxhSxy/2uHKkOLAtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="164231158"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2025 23:30:46 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH] ASoC: SOF: Intel: PTL: Add the sdw_process_wakeen op
Date: Mon, 21 Jul 2025 14:30:38 +0800
Message-ID: <20250721063039.2234279-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Add the missing op in the device description to avoid issues with jack
detection.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/ptl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/intel/ptl.c b/sound/soc/sof/intel/ptl.c
index 875d18193b05..1bc1f54c470d 100644
--- a/sound/soc/sof/intel/ptl.c
+++ b/sound/soc/sof/intel/ptl.c
@@ -117,6 +117,7 @@ const struct sof_intel_dsp_desc ptl_chip_info = {
 	.read_sdw_lcount =  hda_sdw_check_lcount_ext,
 	.check_sdw_irq = lnl_dsp_check_sdw_irq,
 	.check_sdw_wakeen_irq = lnl_sdw_check_wakeen_irq,
+	.sdw_process_wakeen = hda_sdw_process_wakeen_common,
 	.check_ipc_irq = mtl_dsp_check_ipc_irq,
 	.check_mic_privacy_irq = sof_ptl_check_mic_privacy_irq,
 	.process_mic_privacy = sof_ptl_process_mic_privacy,
-- 
2.43.0

