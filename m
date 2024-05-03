Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D991B154BE9
	for <linux-sound@vger.kernel.org>; Fri,  3 May 2024 14:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714745066; cv=none; b=G63UKLnf5CEjrzWKKhm6aW8RkVjIwbEbGXkph4Xa5FCgAwdKY1XD1JUhbhGCQqHdWAE/Iuevif3IALel1706JBDvAzUX7VebdMbHBLF2hMmnBIvaA9oJRaE5H9Ryv6+9kqsVg+3OcdViLP5pMxMPmdGrqw9Az7EnGnJv/Twvvzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714745066; c=relaxed/simple;
	bh=tINyua09qBx1cox+4ATVaxcq6RLl1t5EHNcJTBNtrcA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kqCYS/UsShmQi7NqYMK6KMaXvRl+qM8je4y5cJyl16QGuLe6U0xtMyryzMcxTcYDXPCTNo4fBLYcIrEbslXQfw2LpwRm6UgMzcqvpccpXQv+nHeRL6x6LhgYPsw9OF1SFoed9dSpXEH33+YDFDvk3D0bBryL6amvmmzzHmzkd2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tmy8Pa+j; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tmy8Pa+j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714745064; x=1746281064;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tINyua09qBx1cox+4ATVaxcq6RLl1t5EHNcJTBNtrcA=;
  b=Tmy8Pa+jubBhd9MDgwJor0DrzZVk/QoAyCA8CWxCzTZHSqnHjzU1XQxn
   9SYlqj0/dtni9P9NBLCcNTlQ0hLeo5PXm7RT8uhb17FpnUhoIav2/rK9q
   tNK0Tk5pGKgq8eWnzmHbLPJ8bLM9oE0CM/xgi52eA8nHGQLyM/aHfFcdx
   3z8LYfgJKubT9tAG6V2cW/6DYttbI1wcHECQr78eNljKzJOd/dPdJ4I2L
   qFZwuMNJnL+bcGzRhgakI1rfFCfGl0r20kXF0jwgJni80hifNkNGKNcYQ
   aFluK6Oeulsnbw6a0XKUm+9X1O9fiQXmOVRzTKyjt3ALanMk/SKOGkRzR
   w==;
X-CSE-ConnectionGUID: LIgWbowQSOKhQlITfxPmYw==
X-CSE-MsgGUID: 4OWMopRqTO6DkJhmYC09eA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="14369541"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="14369541"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 07:04:24 -0700
X-CSE-ConnectionGUID: MOy6SFhBSbqigSXPuTSIBg==
X-CSE-MsgGUID: 0GfeoR3hS9q7OkkapjhVPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="64908126"
Received: from sjslinke-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.113.3])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 07:04:24 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 9/9] ALSA/ASoC: include: clarify Copyright information
Date: Fri,  3 May 2024 09:03:59 -0500
Message-Id: <20240503140359.259762-10-pierre-louis.bossart@linux.intel.com>
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

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/hda-mlink.h             | 2 +-
 include/sound/soc-acpi-intel-match.h  | 2 +-
 include/sound/soc-acpi.h              | 2 +-
 include/sound/sof.h                   | 2 +-
 include/sound/sof/channel_map.h       | 2 +-
 include/sound/sof/control.h           | 2 +-
 include/sound/sof/dai-intel.h         | 2 +-
 include/sound/sof/dai.h               | 2 +-
 include/sound/sof/debug.h             | 2 +-
 include/sound/sof/ext_manifest.h      | 2 +-
 include/sound/sof/ext_manifest4.h     | 2 +-
 include/sound/sof/header.h            | 2 +-
 include/sound/sof/info.h              | 2 +-
 include/sound/sof/ipc4/header.h       | 2 +-
 include/sound/sof/pm.h                | 2 +-
 include/sound/sof/stream.h            | 2 +-
 include/sound/sof/topology.h          | 2 +-
 include/sound/sof/trace.h             | 2 +-
 include/sound/sof/xtensa.h            | 2 +-
 include/trace/events/sof.h            | 2 +-
 include/trace/events/sof_intel.h      | 2 +-
 include/uapi/sound/intel/avs/tokens.h | 2 +-
 include/uapi/sound/sof/abi.h          | 2 +-
 include/uapi/sound/sof/fw.h           | 2 +-
 include/uapi/sound/sof/header.h       | 2 +-
 include/uapi/sound/sof/tokens.h       | 2 +-
 26 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/include/sound/hda-mlink.h b/include/sound/hda-mlink.h
index d849d9b24f13..9ced94686ce3 100644
--- a/include/sound/hda-mlink.h
+++ b/include/sound/hda-mlink.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2022-2023 Intel Corporation. All rights reserved.
+ * Copyright(c) 2022-2023 Intel Corporation
  */
 
 struct hdac_bus;
diff --git a/include/sound/soc-acpi-intel-match.h b/include/sound/soc-acpi-intel-match.h
index 845e7608ac37..4843b57798f6 100644
--- a/include/sound/soc-acpi-intel-match.h
+++ b/include/sound/soc-acpi-intel-match.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0
  *
- * Copyright (C) 2017, Intel Corporation. All rights reserved.
+ * Copyright (C) 2017, Intel Corporation
  */
 
 #ifndef __LINUX_SND_SOC_ACPI_INTEL_MATCH_H
diff --git a/include/sound/soc-acpi.h b/include/sound/soc-acpi.h
index 1d8f35ca1d6f..38ccec4e3fcd 100644
--- a/include/sound/soc-acpi.h
+++ b/include/sound/soc-acpi.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only
  *
- * Copyright (C) 2013-15, Intel Corporation. All rights reserved.
+ * Copyright (C) 2013-15, Intel Corporation
  */
 
 #ifndef __LINUX_SND_SOC_ACPI_H
diff --git a/include/sound/sof.h b/include/sound/sof.h
index 780c1a755917..ec6c30d54592 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2018 Intel Corporation. All rights reserved.
+ * Copyright(c) 2018 Intel Corporation
  *
  * Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
  */
diff --git a/include/sound/sof/channel_map.h b/include/sound/sof/channel_map.h
index d363f0ca6979..2a177a1938e9 100644
--- a/include/sound/sof/channel_map.h
+++ b/include/sound/sof/channel_map.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2019 Intel Corporation. All rights reserved.
+ * Copyright(c) 2019 Intel Corporation
  */
 
 #ifndef __IPC_CHANNEL_MAP_H__
diff --git a/include/sound/sof/control.h b/include/sound/sof/control.h
index 983d374fe511..8d3300dd9d8c 100644
--- a/include/sound/sof/control.h
+++ b/include/sound/sof/control.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2018 Intel Corporation. All rights reserved.
+ * Copyright(c) 2018 Intel Corporation
  */
 
 #ifndef __INCLUDE_SOUND_SOF_CONTROL_H__
diff --git a/include/sound/sof/dai-intel.h b/include/sound/sof/dai-intel.h
index 5b93b7292f5e..e4e710b43d2d 100644
--- a/include/sound/sof/dai-intel.h
+++ b/include/sound/sof/dai-intel.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2018 Intel Corporation. All rights reserved.
+ * Copyright(c) 2018 Intel Corporation
  */
 
 #ifndef __INCLUDE_SOUND_SOF_DAI_INTEL_H__
diff --git a/include/sound/sof/dai.h b/include/sound/sof/dai.h
index 0764a80c17a9..36809f712723 100644
--- a/include/sound/sof/dai.h
+++ b/include/sound/sof/dai.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2018 Intel Corporation. All rights reserved.
+ * Copyright(c) 2018 Intel Corporation
  */
 
 #ifndef __INCLUDE_SOUND_SOF_DAI_H__
diff --git a/include/sound/sof/debug.h b/include/sound/sof/debug.h
index 38693e3fb514..8b308d7e5eee 100644
--- a/include/sound/sof/debug.h
+++ b/include/sound/sof/debug.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2020 Intel Corporation. All rights reserved.
+ * Copyright(c) 2020 Intel Corporation
  *
  * Author: Karol Trzcinski <karolx.trzcinski@linux.intel.com>
  */
diff --git a/include/sound/sof/ext_manifest.h b/include/sound/sof/ext_manifest.h
index 2a7e055584f9..fc0231d04a94 100644
--- a/include/sound/sof/ext_manifest.h
+++ b/include/sound/sof/ext_manifest.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2020 Intel Corporation. All rights reserved.
+ * Copyright(c) 2020 Intel Corporation
  */
 
 /*
diff --git a/include/sound/sof/ext_manifest4.h b/include/sound/sof/ext_manifest4.h
index ec97edcbbfc3..4e1d379d96ad 100644
--- a/include/sound/sof/ext_manifest4.h
+++ b/include/sound/sof/ext_manifest4.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2022 Intel Corporation. All rights reserved.
+ * Copyright(c) 2022 Intel Corporation
  */
 
 /*
diff --git a/include/sound/sof/header.h b/include/sound/sof/header.h
index b22e925c70e2..4e406dc22f31 100644
--- a/include/sound/sof/header.h
+++ b/include/sound/sof/header.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2018 Intel Corporation. All rights reserved.
+ * Copyright(c) 2018 Intel Corporation
  */
 
 #ifndef __INCLUDE_SOUND_SOF_HEADER_H__
diff --git a/include/sound/sof/info.h b/include/sound/sof/info.h
index 75193850ead0..08400fbe5402 100644
--- a/include/sound/sof/info.h
+++ b/include/sound/sof/info.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2018 Intel Corporation. All rights reserved.
+ * Copyright(c) 2018 Intel Corporation
  */
 
 #ifndef __INCLUDE_SOUND_SOF_INFO_H__
diff --git a/include/sound/sof/ipc4/header.h b/include/sound/sof/ipc4/header.h
index 1eb538e18236..0c0cf47946b1 100644
--- a/include/sound/sof/ipc4/header.h
+++ b/include/sound/sof/ipc4/header.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2022 Intel Corporation. All rights reserved.
+ * Copyright(c) 2022 Intel Corporation
  */
 
 #ifndef __INCLUDE_SOUND_SOF_IPC4_HEADER_H__
diff --git a/include/sound/sof/pm.h b/include/sound/sof/pm.h
index 366aa6ec442b..df55bfe58304 100644
--- a/include/sound/sof/pm.h
+++ b/include/sound/sof/pm.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2018 Intel Corporation. All rights reserved.
+ * Copyright(c) 2018 Intel Corporation
  */
 
 #ifndef __INCLUDE_SOUND_SOF_PM_H__
diff --git a/include/sound/sof/stream.h b/include/sound/sof/stream.h
index 9377113f13e4..1bb25487d120 100644
--- a/include/sound/sof/stream.h
+++ b/include/sound/sof/stream.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2018 Intel Corporation. All rights reserved.
+ * Copyright(c) 2018 Intel Corporation
  */
 
 #ifndef __INCLUDE_SOUND_SOF_STREAM_H__
diff --git a/include/sound/sof/topology.h b/include/sound/sof/topology.h
index b3ca886fa28f..3ba086f61983 100644
--- a/include/sound/sof/topology.h
+++ b/include/sound/sof/topology.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2018 Intel Corporation. All rights reserved.
+ * Copyright(c) 2018 Intel Corporation
  */
 
 #ifndef __INCLUDE_SOUND_SOF_TOPOLOGY_H__
diff --git a/include/sound/sof/trace.h b/include/sound/sof/trace.h
index 25ea99f62d37..ac2ebb6fb38f 100644
--- a/include/sound/sof/trace.h
+++ b/include/sound/sof/trace.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2018 Intel Corporation. All rights reserved.
+ * Copyright(c) 2018 Intel Corporation
  */
 
 #ifndef __INCLUDE_SOUND_SOF_TRACE_H__
diff --git a/include/sound/sof/xtensa.h b/include/sound/sof/xtensa.h
index 87a07e520415..ef70f8e266a2 100644
--- a/include/sound/sof/xtensa.h
+++ b/include/sound/sof/xtensa.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2018 Intel Corporation. All rights reserved.
+ * Copyright(c) 2018 Intel Corporation
  */
 
 #ifndef __INCLUDE_SOUND_SOF_XTENSA_H__
diff --git a/include/trace/events/sof.h b/include/trace/events/sof.h
index 21c2a1efb9f6..cd8e6844cca2 100644
--- a/include/trace/events/sof.h
+++ b/include/trace/events/sof.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright(c) 2022 Intel Corporation. All rights reserved.
+ * Copyright(c) 2022 Intel Corporation
  *
  * Author: Noah Klayman <noah.klayman@intel.com>
  */
diff --git a/include/trace/events/sof_intel.h b/include/trace/events/sof_intel.h
index 2a77f9d26c0b..4cac5fef99a2 100644
--- a/include/trace/events/sof_intel.h
+++ b/include/trace/events/sof_intel.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright(c) 2022 Intel Corporation. All rights reserved.
+ * Copyright(c) 2022 Intel Corporation
  *
  * Author: Noah Klayman <noah.klayman@intel.com>
  */
diff --git a/include/uapi/sound/intel/avs/tokens.h b/include/uapi/sound/intel/avs/tokens.h
index 4beca03405c0..3e3fb258dd54 100644
--- a/include/uapi/sound/intel/avs/tokens.h
+++ b/include/uapi/sound/intel/avs/tokens.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /*
- * Copyright(c) 2021 Intel Corporation. All rights reserved.
+ * Copyright(c) 2021 Intel Corporation
  *
  * Authors: Cezary Rojewski <cezary.rojewski@intel.com>
  *          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/include/uapi/sound/sof/abi.h b/include/uapi/sound/sof/abi.h
index 45c657c3919e..937ed9408c23 100644
--- a/include/uapi/sound/sof/abi.h
+++ b/include/uapi/sound/sof/abi.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2018 Intel Corporation. All rights reserved.
+ * Copyright(c) 2018 Intel Corporation
  */
 
 /**
diff --git a/include/uapi/sound/sof/fw.h b/include/uapi/sound/sof/fw.h
index e9f697467a86..fcfa71faf239 100644
--- a/include/uapi/sound/sof/fw.h
+++ b/include/uapi/sound/sof/fw.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2018 Intel Corporation. All rights reserved.
+ * Copyright(c) 2018 Intel Corporation
  */
 
 /*
diff --git a/include/uapi/sound/sof/header.h b/include/uapi/sound/sof/header.h
index cb3c1ace69e3..228d4c3eb225 100644
--- a/include/uapi/sound/sof/header.h
+++ b/include/uapi/sound/sof/header.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2018 Intel Corporation. All rights reserved.
+ * Copyright(c) 2018 Intel Corporation
  */
 
 #ifndef __INCLUDE_UAPI_SOUND_SOF_USER_HEADER_H__
diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index 6bf00c09d30d..0a246bc218d3 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2018 Intel Corporation. All rights reserved.
+ * Copyright(c) 2018 Intel Corporation
  * Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
  *         Keyon Jie <yang.jie@linux.intel.com>
  */
-- 
2.40.1

