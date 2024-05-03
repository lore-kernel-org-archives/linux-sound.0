Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B1C28F5
	for <linux-sound@vger.kernel.org>; Fri,  3 May 2024 13:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714744358; cv=none; b=hVDFD4oSKM7Wrmo90s0fhNhUJGSOx/zWpgPG4CbvehafAVI8npnV297P5K1bOdiVYY1FB1lPkY6RSGItf7eURZV7JuXjdRiGVUqsUwMoIdIPMN3X8UfOeAJ9SM143rnvewyZev8m04//JpjbLBDIwIkWIlL0XkILRpq3JBrBRrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714744358; c=relaxed/simple;
	bh=sIoVJ5Da2HwESOH6d+Mlq5Qfn1752f4j0Gjxy0qZU/E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MlcRw4LJtSo3utJYzPL9Fn69C+2/nOfDsQFptR5dObYbdaNu1x7b04as4qvTWpIReYa7ciiljELnluTLhr2/P0d6nuzePrYDeEl8wPbAyGVPQbTRYnDA66AzvUclVO7L6+ookFqIjdeMa8eZ3c14LMm6uIg0Fpq9zcSb6wEvyJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jCiNChXK; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jCiNChXK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714744357; x=1746280357;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sIoVJ5Da2HwESOH6d+Mlq5Qfn1752f4j0Gjxy0qZU/E=;
  b=jCiNChXK+r6rZEX22pljjAGD5DxMH2C6RrosBhFh8gnJg3/8mkuYnHaQ
   ucdIw0Q1dBx/zT4bYKKlNdDf8ij7sScjTkngoYd3flC3bsSddEgJNrfZY
   ZpEYjfqTbLytsGhh4gceF0rEbvQMcO8GBkW1ixKuHfHa4GsLi1UEsKoFW
   pj5s0q3/E4OlL7Moe7F+bEXzEqv1n+ogrHKGoRjFu0p+ObnBWRme0/C2H
   BzbcV8DaT1tF1b+misgGy14rBW2wzRnIF8ZMjNXqv4+dxeA3Qc9lJUA4a
   cqGvIQL2eWboFXzh+seMyY2Yc+Foa0dnNv2hMkt27SaaN22blCfWQWZ1r
   w==;
X-CSE-ConnectionGUID: pJhE1wM5QxiPV/skH5c6HA==
X-CSE-MsgGUID: 2fXMk+RKT7qU0/FC6igzHQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="28029425"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="28029425"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 06:52:37 -0700
X-CSE-ConnectionGUID: LJLy3QkKTa+3zIUE/u0MtQ==
X-CSE-MsgGUID: PA434yMmSuGfcJglKsYL/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="27548765"
Received: from sjslinke-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.113.3])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 06:52:36 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [PATCH 5/7] ASoC: SOF: Intel: move tracepoint creation
Date: Fri,  3 May 2024 08:52:19 -0500
Message-Id: <20240503135221.229202-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240503135221.229202-1-pierre-louis.bossart@linux.intel.com>
References: <20240503135221.229202-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CREATE_TRACEPOINTS is supposed to be used once. To avoid modpost
issues when creating modules, let's move the tracepoint creation in a
single object file.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/Makefile      | 2 +-
 sound/soc/sof/intel/hda.c         | 1 -
 sound/soc/sof/intel/tracepoints.c | 3 +++
 3 files changed, 4 insertions(+), 2 deletions(-)
 create mode 100644 sound/soc/sof/intel/tracepoints.c

diff --git a/sound/soc/sof/intel/Makefile b/sound/soc/sof/intel/Makefile
index c895bae0efdd..cf74548f87ad 100644
--- a/sound/soc/sof/intel/Makefile
+++ b/sound/soc/sof/intel/Makefile
@@ -7,7 +7,7 @@ snd-sof-intel-hda-common-objs := hda.o hda-loader.o hda-stream.o hda-trace.o \
 				 hda-dsp.o hda-ipc.o hda-ctrl.o hda-pcm.o \
 				 hda-dai.o hda-dai-ops.o hda-bus.o \
 				 hda-common-ops.o \
-				 telemetry.o
+				 telemetry.o tracepoints.o
 
 snd-sof-intel-hda-mlink-objs := hda-mlink.o
 
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index a6d16314879f..b15b1f5edcea 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -35,7 +35,6 @@
 #include "../ipc4-topology.h"
 #include "hda.h"
 
-#define CREATE_TRACE_POINTS
 #include <trace/events/sof_intel.h>
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
diff --git a/sound/soc/sof/intel/tracepoints.c b/sound/soc/sof/intel/tracepoints.c
new file mode 100644
index 000000000000..c223c96fe0e3
--- /dev/null
+++ b/sound/soc/sof/intel/tracepoints.c
@@ -0,0 +1,3 @@
+// SPDX-License-Identifier: GPL-2.0
+#define CREATE_TRACE_POINTS
+#include <trace/events/sof_intel.h>
-- 
2.40.1

