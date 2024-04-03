Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3E91DFCE
	for <linux-sound@vger.kernel.org>; Wed,  3 Apr 2024 10:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712141533; cv=none; b=NbCzFxXtayrBzlIcKBWFutxWaA4opbb5wPIEaSM9HgF11+Zqfe2VwJktR/l4w/NupEQ+yJqjwL882Sst7GtIiSOT//Ow9WVcC+zx/cazmma9wCrhUY+XjgVKk5hthuI4rsnAS9HpF5Z+iyqnk9t4kSlV2av7mXW/+4WAZgu/czA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712141533; c=relaxed/simple;
	bh=JgBGywn8Ood9Qxe66QtWQESca6MK6CqQhC52M+NypNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kkCrqQ+0bEZi71NtiZDqsUmCPt+VSC3iJctlxeHt+TzZh3K7eUyFs9q1rP46W4WztaBQAzYwAb7c1LEgL68DlhEcdQUaq1xH8c7KdPzXisvNvJOimVCswNH15riSCginmKVZ733btOIE+swCvrSgk2+IEW/nlGUnKU746qoLVCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DMIf9T5o; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DMIf9T5o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712141532; x=1743677532;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JgBGywn8Ood9Qxe66QtWQESca6MK6CqQhC52M+NypNY=;
  b=DMIf9T5oaOwpcNxg7hCVS3vZtUUNwIFTShMV7PujWx7O0OEePjb3woxj
   Pr7bHspg2Avl+/k7Ig3hadeUFunt19LN5DZA6jfv2Kj3DbOySxkwQQ+cY
   hUMkO6GCUNslFITIQBJLRLJFdHnANYptdrpwFwHYtCZLBXDRXWcbdGQNv
   AOu7Hvg8inEUdnHpnt0HwHPICxA2z7hqGIZ83gF21ckuWi5k4Muw87x2N
   e4QSEmgJvPkmXb7cAJ1mRENBcMqn+oZyVfsI4Ka2CIInNa6QBcRcbh7L/
   6t7D9d+GLi5jVeq3rJVVSDuPFPTcZiFLolFLdR4ap40HvwzlZNa5KiMxc
   g==;
X-CSE-ConnectionGUID: j4HXfimUTZG85QzSGHcDzg==
X-CSE-MsgGUID: q984L8AnRM+JyidpCZr07A==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7212214"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7212214"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 03:51:50 -0700
X-CSE-ConnectionGUID: RKaVbFhjSw2a1C+Mdq8ntA==
X-CSE-MsgGUID: gh9+Nhc0S8GBdD/B80Lruw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="49374795"
Received: from aelgham-mobl2.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.35.133])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 03:51:47 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	rander.wang@intel.com,
	liam.r.girdwood@intel.com
Subject: [PATCH 3/7] ASoC: SOF: Intel: lnl: Correct rom_status_reg
Date: Wed,  3 Apr 2024 13:52:06 +0300
Message-ID: <20240403105210.17949-4-peter.ujfalusi@linux.intel.com>
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

ACE2 architecture changed the place where the ROM updates the status code
from the shared SRAM window (and HFFLGP1QW0 in ACE1) to HFDSC register for
the status and HFDEC (HFDSC + 4) for the error code.

The rom_status_reg is not used on LNL because it was wrongly assigned based
on older platform convention (SRAM window) and it was giving inconsistent
readings.

Add new header file for lnl specific register definitions.

Fixes: 64a63d9914a5 ("ASoC: SOF: Intel: LNL: Add support for Lunarlake platform")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/intel/lnl.c |  3 ++-
 sound/soc/sof/intel/lnl.h | 15 +++++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/sof/intel/lnl.h

diff --git a/sound/soc/sof/intel/lnl.c b/sound/soc/sof/intel/lnl.c
index 5114411f1e36..8e7193344341 100644
--- a/sound/soc/sof/intel/lnl.c
+++ b/sound/soc/sof/intel/lnl.c
@@ -17,6 +17,7 @@
 #include "hda-ipc.h"
 #include "../sof-audio.h"
 #include "mtl.h"
+#include "lnl.h"
 #include <sound/hda-mlink.h>
 
 /* LunarLake ops */
@@ -197,7 +198,7 @@ const struct sof_intel_dsp_desc lnl_chip_info = {
 	.ipc_ack = MTL_DSP_REG_HFIPCXIDA,
 	.ipc_ack_mask = MTL_DSP_REG_HFIPCXIDA_DONE,
 	.ipc_ctl = MTL_DSP_REG_HFIPCXCTL,
-	.rom_status_reg = MTL_DSP_ROM_STS,
+	.rom_status_reg = LNL_DSP_REG_HFDSC,
 	.rom_init_timeout = 300,
 	.ssp_count = MTL_SSP_COUNT,
 	.d0i3_offset = MTL_HDA_VS_D0I3C,
diff --git a/sound/soc/sof/intel/lnl.h b/sound/soc/sof/intel/lnl.h
new file mode 100644
index 000000000000..4f4734fe7e08
--- /dev/null
+++ b/sound/soc/sof/intel/lnl.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2024 Intel Corporation. All rights reserved.
+ */
+
+#ifndef __SOF_INTEL_LNL_H
+#define __SOF_INTEL_LNL_H
+
+#define LNL_DSP_REG_HFDSC		0x160200 /* DSP core0 status */
+#define LNL_DSP_REG_HFDEC		0x160204 /* DSP core0 error */
+
+#endif /* __SOF_INTEL_LNL_H */
-- 
2.44.0

