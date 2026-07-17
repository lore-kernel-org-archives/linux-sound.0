Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7571E2F8EB4;
	Fri, 17 Jul 2026 17:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784309006; cv=none; b=B5+S5V0HFQqTM6xRLDe1amrjgir+1XvJ0e9YSMaZllDoz0OjIQAGXtTJWBqmU7Ma1VhO6MxVvKXONRrB1izr8jY1P5mq2cTCzzuhIIYkU41YiO6kcUXcMZ5aX/mvmCgZ+yMUTzRNqW8sUYOWs3cm1XZE2vn57FJZzF1QMHqg+BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784309006; c=relaxed/simple;
	bh=qcANCIzb5+XEXCVj8BKC4c+Cgg4w/TXPiR6e+OAcdzk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sJcPlfU++zxuseKrKElk8iD1SjS64ReMZFVP3K5HfsQVPMWav9heSEq9JE7fxaLG4kdfwbwlV/tTlUom7OmPowk2ZuWz+PPS2GpeGWY7M2nWnfLY9B3rH6EUHbHy+l3m2EeHVAdfV+9QxoyKiek7/Q5QQPpAZw1iXTYm7Y8zVtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B3u/yOnc; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B3u/yOnc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784309005; x=1815845005;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qcANCIzb5+XEXCVj8BKC4c+Cgg4w/TXPiR6e+OAcdzk=;
  b=B3u/yOnc7oVmUmBXiYd2NtGtiw/PlfzmfKfkuQZbVt/E4hw2SqBpPIjf
   fjVGsVcFx7ByQh9qU6baWK/cRzvZncw9q/A0RIvJbr59s8i18dKdq7qn4
   UG+NzwPs5BY95CVTZohMt/A5Vh5PQpgkyf8Do8QBJBrOiYOo9CMWo9iGO
   vGoyXdM79IurSdKFTq0WS5XYS5gPshPY0yeccrcc0kpvyNeci0IaN0FmR
   PavteuCkIHAc60e+wNBQSjV8CPL4t17F9xdr+BECpHzfBf8OkCI27y6SQ
   iV2LnERQiWqYDeAd30zHEMrnRGmr8LrR+J/H8OQKxcF7TcFmH+XPJgOeD
   g==;
X-CSE-ConnectionGUID: cBMZdQXjT5+LqDKuJVXO9Q==
X-CSE-MsgGUID: ivaUPcvrT7uPjuJFvUNDRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="110536155"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="110536155"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 10:23:24 -0700
X-CSE-ConnectionGUID: Y7tYzCA+T9y7X0s3lvYJiQ==
X-CSE-MsgGUID: R2vSojvIRw+bQfvemBAOcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="256289686"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 17 Jul 2026 10:23:21 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id B343298; Fri, 17 Jul 2026 19:23:19 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] ASoC: SOF: Intel: Don't use "proxy" headers
Date: Fri, 17 Jul 2026 19:22:47 +0200
Message-ID: <20260717172318.1784073-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update header inclusions to follow IWYU (Include What You Use)
principle.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

Induced by the ongoing task to drop always included kconfig.h.

 sound/soc/sof/intel/icl.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/icl.c b/sound/soc/sof/intel/icl.c
index c1018893750c..549bb4ca73e1 100644
--- a/sound/soc/sof/intel/icl.c
+++ b/sound/soc/sof/intel/icl.c
@@ -9,10 +9,14 @@
  * Hardware interface for audio DSP on IceLake.
  */
 
-#include <linux/kernel.h>
-#include <linux/kconfig.h>
-#include <linux/export.h>
+#include <linux/array_size.h>
 #include <linux/bits.h>
+#include <linux/dev_printk.h>
+#include <linux/errno.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/types.h>
+
 #include "../ipc4-priv.h"
 #include "../ops.h"
 #include "hda.h"
-- 
2.50.1

