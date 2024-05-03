Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FF615444B
	for <linux-sound@vger.kernel.org>; Fri,  3 May 2024 14:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714745064; cv=none; b=TJMsijaGJ1OXce+GG/7PxbEkoh6ju2czZa9vluBFl6FvKi2zp/ebbSwN7CEMXeTEQlRB3aP9qFjpV108rHfe3uE0USSbWJkzHVlARVo27ch3md/CcHFDldCN6ggT1wWJks/8GQ7HdhmUiV2sAgPL0FlWTUJaAzd7D2dDtHTQ0xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714745064; c=relaxed/simple;
	bh=SyV9cOmA95Y8igvfR9thOhSeKWSs9M9BdgxVcIJETLQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d/F7AWu0Ff+795MbbDhpQABCJqAK7tfzFRea40Z3A2wy+sQDLxm3TmgvyIvqjZg7nNCtoz1z8yw+BoJsUPJ1YnxWl3qlMMJW+XEvTCqQG1LA89r+KdOq7iB/Fla/Z3IUWdN4qOLA0XuZP+W8vawj/NMBOAJc0gKzYDEP0+bIywY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i5+0N98U; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i5+0N98U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714745062; x=1746281062;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SyV9cOmA95Y8igvfR9thOhSeKWSs9M9BdgxVcIJETLQ=;
  b=i5+0N98UnEPNLcykAjpigxCq8lmhYCJlyO4Xn2gXxeoxUGacGS0LE87t
   nTpmzNKfk2SBsInqfTic6X8v+CndO2Okr9PX8WgtL3eSZcBC4gDJE56bS
   XYdJC5QPQEC2NIe/qcBHc1Ln+L2fZg10Nhu6eWU36MH24BIYuHXV8I4f/
   du/+o9NT4JOVjM653cU5YtPU6AdMrPdi3BGGVyHVVOaB/lib5jmiKXbb3
   Q3851LijJsekdxYVo7VYXtSTsQj4aAYL5YmXh/MJwSopnGBNhuao+wVpr
   Lq1P8s0Q7Qf2aChYqyttC23tpKogA1/spaAqZ/ER4LLzy9ecS6hZcJ4kq
   w==;
X-CSE-ConnectionGUID: eVp6AJdyRNSh83jhtPCwPg==
X-CSE-MsgGUID: 0m8arT7OQGuN/92Dg30O5Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="14369525"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="14369525"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 07:04:21 -0700
X-CSE-ConnectionGUID: WNd/wI4sRte4EsfoCi4ojQ==
X-CSE-MsgGUID: O7BK7VsQQmmpwFoJjiAgwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="64908105"
Received: from sjslinke-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.113.3])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 07:04:21 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 5/9] ASoC: Intel: catpt: clarify Copyright information
Date: Fri,  3 May 2024 09:03:55 -0500
Message-Id: <20240503140359.259762-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240503140359.259762-1-pierre-louis.bossart@linux.intel.com>
References: <20240503140359.259762-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For some reason a number of files included the "All rights reserved"
statement. Good old copy-paste made sure this mistake proliferated.

Remove the "All rights reserved" in all Intel-copyright to align with
internal guidance.

Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/catpt/core.h      | 2 +-
 sound/soc/intel/catpt/device.c    | 2 +-
 sound/soc/intel/catpt/dsp.c       | 2 +-
 sound/soc/intel/catpt/ipc.c       | 2 +-
 sound/soc/intel/catpt/loader.c    | 2 +-
 sound/soc/intel/catpt/messages.c  | 2 +-
 sound/soc/intel/catpt/messages.h  | 2 +-
 sound/soc/intel/catpt/pcm.c       | 2 +-
 sound/soc/intel/catpt/registers.h | 2 +-
 sound/soc/intel/catpt/sysfs.c     | 2 +-
 sound/soc/intel/catpt/trace.h     | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/intel/catpt/core.h b/sound/soc/intel/catpt/core.h
index a64a0a77dcb7..c01d27e9fd88 100644
--- a/sound/soc/intel/catpt/core.h
+++ b/sound/soc/intel/catpt/core.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright(c) 2020 Intel Corporation. All rights reserved.
+ * Copyright(c) 2020 Intel Corporation
  *
  * Author: Cezary Rojewski <cezary.rojewski@intel.com>
  */
diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
index cac3dffbd0d9..2e1fa79a04d4 100644
--- a/sound/soc/intel/catpt/device.c
+++ b/sound/soc/intel/catpt/device.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2020 Intel Corporation. All rights reserved.
+// Copyright(c) 2020 Intel Corporation
 //
 // Author: Cezary Rojewski <cezary.rojewski@intel.com>
 //
diff --git a/sound/soc/intel/catpt/dsp.c b/sound/soc/intel/catpt/dsp.c
index 5454c6d9ab5b..5993819cc58a 100644
--- a/sound/soc/intel/catpt/dsp.c
+++ b/sound/soc/intel/catpt/dsp.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2020 Intel Corporation. All rights reserved.
+// Copyright(c) 2020 Intel Corporation
 //
 // Author: Cezary Rojewski <cezary.rojewski@intel.com>
 //
diff --git a/sound/soc/intel/catpt/ipc.c b/sound/soc/intel/catpt/ipc.c
index 5b718a846fda..d26863249097 100644
--- a/sound/soc/intel/catpt/ipc.c
+++ b/sound/soc/intel/catpt/ipc.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2020 Intel Corporation. All rights reserved.
+// Copyright(c) 2020 Intel Corporation
 //
 // Author: Cezary Rojewski <cezary.rojewski@intel.com>
 //
diff --git a/sound/soc/intel/catpt/loader.c b/sound/soc/intel/catpt/loader.c
index ff7b8f0d34ac..696d84314eeb 100644
--- a/sound/soc/intel/catpt/loader.c
+++ b/sound/soc/intel/catpt/loader.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2020 Intel Corporation. All rights reserved.
+// Copyright(c) 2020 Intel Corporation
 //
 // Author: Cezary Rojewski <cezary.rojewski@intel.com>
 //
diff --git a/sound/soc/intel/catpt/messages.c b/sound/soc/intel/catpt/messages.c
index a793d114afa4..30eec2de4dc1 100644
--- a/sound/soc/intel/catpt/messages.c
+++ b/sound/soc/intel/catpt/messages.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2020 Intel Corporation. All rights reserved.
+// Copyright(c) 2020 Intel Corporation
 //
 // Author: Cezary Rojewski <cezary.rojewski@intel.com>
 //
diff --git a/sound/soc/intel/catpt/messages.h b/sound/soc/intel/catpt/messages.h
index c17e948d9f52..a634943eb669 100644
--- a/sound/soc/intel/catpt/messages.h
+++ b/sound/soc/intel/catpt/messages.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright(c) 2020 Intel Corporation. All rights reserved.
+ * Copyright(c) 2020 Intel Corporation
  *
  * Author: Cezary Rojewski <cezary.rojewski@intel.com>
  */
diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index 3daf5eb37f7b..81a2f0339e05 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2020 Intel Corporation. All rights reserved.
+// Copyright(c) 2020 Intel Corporation
 //
 // Author: Cezary Rojewski <cezary.rojewski@intel.com>
 //
diff --git a/sound/soc/intel/catpt/registers.h b/sound/soc/intel/catpt/registers.h
index 47280d82842e..6c1ad28c6d69 100644
--- a/sound/soc/intel/catpt/registers.h
+++ b/sound/soc/intel/catpt/registers.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright(c) 2020 Intel Corporation. All rights reserved.
+ * Copyright(c) 2020 Intel Corporation
  *
  * Author: Cezary Rojewski <cezary.rojewski@intel.com>
  */
diff --git a/sound/soc/intel/catpt/sysfs.c b/sound/soc/intel/catpt/sysfs.c
index 9b6d2d93a2e7..936ac9d503ff 100644
--- a/sound/soc/intel/catpt/sysfs.c
+++ b/sound/soc/intel/catpt/sysfs.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2020 Intel Corporation. All rights reserved.
+// Copyright(c) 2020 Intel Corporation
 //
 // Author: Cezary Rojewski <cezary.rojewski@intel.com>
 //
diff --git a/sound/soc/intel/catpt/trace.h b/sound/soc/intel/catpt/trace.h
index bb3d627dbeaf..010f57b6a7a8 100644
--- a/sound/soc/intel/catpt/trace.h
+++ b/sound/soc/intel/catpt/trace.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright(c) 2020 Intel Corporation. All rights reserved.
+ * Copyright(c) 2020 Intel Corporation
  *
  * Author: Cezary Rojewski <cezary.rojewski@intel.com>
  */
-- 
2.40.1

