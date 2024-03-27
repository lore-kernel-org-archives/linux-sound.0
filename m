Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD8F130A7E
	for <linux-sound@vger.kernel.org>; Wed, 27 Mar 2024 16:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711556669; cv=none; b=poyHOfHzTt0j8PN5MvmT5TvVqAYr9p4LMm3WWf/17o2qqrafG2wmRgvmN2HuoXOFLLCW/o4AB8SepZ+JMILKGnMkCIMGH+cdMChvJLIe5ryNZAfuaz9tYu1xLeckZFXyf7sdbRPLSWmesc+2rQMb9sHO8WiVCuDgHplTsXqJsLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711556669; c=relaxed/simple;
	bh=ixlpjYepMerL+sZkIlATdm9JZRvwdM7F4qct3s4El6w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lFGVZc7AiZvFtXRCi3kXbwLqImUg9DTgjzJcZa4wiWdD14N9McfQjPkO5+T86F3l4Q2fabuz98u/oCGq1JO/n5hMQBs0u4xpY2yOKzNu/kpPgcQSNRxvOjvvd61idSI0Y8vbBKRkv1Y2cR3GIeS6Ub0RGIMliWuofrsntVwsBaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V5c8CyGE; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V5c8CyGE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711556668; x=1743092668;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ixlpjYepMerL+sZkIlATdm9JZRvwdM7F4qct3s4El6w=;
  b=V5c8CyGEn7STQXhdpsILQ5KOpA6wnZhr3ek2yzoyuZMIgO5RHn8OYviV
   Toj86PBd6W3aOcNQYCI+3jTTr3HAGW0wkbPzqZ/JtGVrtPBY9Zg5B+hH0
   gn7I1HE5ga2sVlnFCuXNgq9txocHRMwDWLjU2o9Gxacl0RFjjEAkKJtcF
   CBjiwF91PMf4ZgL3ImCOHUYZ68I6CLW5VsbgC/uPgSwlrTwanIxpX0QaS
   C/kFSguAeXFQRyI8fq7bmsEnEZmCtzOrQhLKnG7S+yQCXt97+rPY1hgBh
   zQSoihPPkSsQXXZ6qliv/hizRFSlnArq3ZP8rOR91HSM0GQSXlDUD7ZzF
   g==;
X-CSE-ConnectionGUID: 5i4d4bihRQSCtIVZKxk7bA==
X-CSE-MsgGUID: dU6atmeNSTCQZRQOmDGekA==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17221480"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="17221480"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 09:24:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="53821247"
Received: from ssherman-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.117.1])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 09:24:26 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 01/18] ASoC: Intel: ssp-common: relocate source file
Date: Wed, 27 Mar 2024 11:23:51 -0500
Message-Id: <20240327162408.63953-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
References: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Moving ssp-common source and header files from sound/soc/intel/boards
directory to sound/soc/intel/common directory and rename the source
file. Keep file content unchanged for tracking purpose.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Makefile                                | 3 ---
 sound/soc/intel/boards/sof_board_helpers.h                     | 2 +-
 sound/soc/intel/boards/sof_cirrus_common.h                     | 2 +-
 sound/soc/intel/boards/sof_maxim_common.h                      | 2 +-
 sound/soc/intel/boards/sof_nuvoton_common.h                    | 2 +-
 sound/soc/intel/boards/sof_realtek_common.h                    | 2 +-
 sound/soc/intel/common/Makefile                                | 3 +++
 .../sof_ssp_common.c => common/soc-acpi-intel-ssp-common.c}    | 0
 sound/soc/intel/{boards => common}/sof_ssp_common.h            | 0
 9 files changed, 8 insertions(+), 8 deletions(-)
 rename sound/soc/intel/{boards/sof_ssp_common.c => common/soc-acpi-intel-ssp-common.c} (100%)
 rename sound/soc/intel/{boards => common}/sof_ssp_common.h (100%)

diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 8f711be46c43..a93b658ed672 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -101,8 +101,5 @@ obj-$(CONFIG_SND_SOC_INTEL_SOF_CIRRUS_COMMON) += snd-soc-intel-sof-cirrus-common
 snd-soc-intel-sof-nuvoton-common-objs += sof_nuvoton_common.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_NUVOTON_COMMON) += snd-soc-intel-sof-nuvoton-common.o
 
-snd-soc-intel-sof-ssp-common-objs += sof_ssp_common.o
-obj-$(CONFIG_SND_SOC_INTEL_SOF_SSP_COMMON) += snd-soc-intel-sof-ssp-common.o
-
 snd-soc-intel-sof-board-helpers-objs += sof_board_helpers.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_BOARD_HELPERS) += snd-soc-intel-sof-board-helpers.o
diff --git a/sound/soc/intel/boards/sof_board_helpers.h b/sound/soc/intel/boards/sof_board_helpers.h
index b6a83ca14fa8..bd5c48cd0649 100644
--- a/sound/soc/intel/boards/sof_board_helpers.h
+++ b/sound/soc/intel/boards/sof_board_helpers.h
@@ -8,7 +8,7 @@
 
 #include <sound/soc.h>
 #include "sof_hdmi_common.h"
-#include "sof_ssp_common.h"
+#include "../common/sof_ssp_common.h"
 
 /*
  * Common board quirks: from bit 8 to 31, LSB 8 bits reserved for machine
diff --git a/sound/soc/intel/boards/sof_cirrus_common.h b/sound/soc/intel/boards/sof_cirrus_common.h
index d4ecf8d023d1..445621466f05 100644
--- a/sound/soc/intel/boards/sof_cirrus_common.h
+++ b/sound/soc/intel/boards/sof_cirrus_common.h
@@ -9,7 +9,7 @@
 #define __SOF_CIRRUS_COMMON_H
 
 #include <sound/soc.h>
-#include "sof_ssp_common.h"
+#include "../common/sof_ssp_common.h"
 
 /*
  * Cirrus Logic CS35L41/CS35L53
diff --git a/sound/soc/intel/boards/sof_maxim_common.h b/sound/soc/intel/boards/sof_maxim_common.h
index fe0212fbad8e..63054bcd287b 100644
--- a/sound/soc/intel/boards/sof_maxim_common.h
+++ b/sound/soc/intel/boards/sof_maxim_common.h
@@ -11,7 +11,7 @@
 #define __SOF_MAXIM_COMMON_H
 
 #include <sound/soc.h>
-#include "sof_ssp_common.h"
+#include "../common/sof_ssp_common.h"
 
 /*
  * Maxim MAX98373
diff --git a/sound/soc/intel/boards/sof_nuvoton_common.h b/sound/soc/intel/boards/sof_nuvoton_common.h
index 53a84f9a67c0..af2e58b1d393 100644
--- a/sound/soc/intel/boards/sof_nuvoton_common.h
+++ b/sound/soc/intel/boards/sof_nuvoton_common.h
@@ -9,7 +9,7 @@
 #define __SOF_NUVOTON_COMMON_H
 
 #include <sound/soc.h>
-#include "sof_ssp_common.h"
+#include "../common/sof_ssp_common.h"
 
 /*
  * Nuvoton NAU8318
diff --git a/sound/soc/intel/boards/sof_realtek_common.h b/sound/soc/intel/boards/sof_realtek_common.h
index e3fa2924c1c1..99b23d96521a 100644
--- a/sound/soc/intel/boards/sof_realtek_common.h
+++ b/sound/soc/intel/boards/sof_realtek_common.h
@@ -11,7 +11,7 @@
 #define __SOF_REALTEK_COMMON_H
 
 #include <sound/soc.h>
-#include "sof_ssp_common.h"
+#include "../common/sof_ssp_common.h"
 
 /*
  * Realtek ALC1011
diff --git a/sound/soc/intel/common/Makefile b/sound/soc/intel/common/Makefile
index f7370e5b4e9e..15c8a64368c5 100644
--- a/sound/soc/intel/common/Makefile
+++ b/sound/soc/intel/common/Makefile
@@ -17,3 +17,6 @@ snd-soc-acpi-intel-match-objs := soc-acpi-intel-byt-match.o soc-acpi-intel-cht-m
 
 obj-$(CONFIG_SND_SOC_INTEL_SST) += snd-soc-sst-dsp.o snd-soc-sst-ipc.o
 obj-$(CONFIG_SND_SOC_ACPI_INTEL_MATCH) += snd-soc-acpi-intel-match.o
+
+snd-soc-intel-sof-ssp-common-objs += soc-acpi-intel-ssp-common.o
+obj-$(CONFIG_SND_SOC_INTEL_SOF_SSP_COMMON) += snd-soc-intel-sof-ssp-common.o
diff --git a/sound/soc/intel/boards/sof_ssp_common.c b/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
similarity index 100%
rename from sound/soc/intel/boards/sof_ssp_common.c
rename to sound/soc/intel/common/soc-acpi-intel-ssp-common.c
diff --git a/sound/soc/intel/boards/sof_ssp_common.h b/sound/soc/intel/common/sof_ssp_common.h
similarity index 100%
rename from sound/soc/intel/boards/sof_ssp_common.h
rename to sound/soc/intel/common/sof_ssp_common.h
-- 
2.40.1

