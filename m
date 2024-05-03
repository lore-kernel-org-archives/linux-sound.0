Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C604153833
	for <linux-sound@vger.kernel.org>; Fri,  3 May 2024 14:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714745061; cv=none; b=HV1EcyPKGBYeKQcxbbiWJ/kyMPmZ7ljeHBlD835C3NskHKFlnp9gsIUK8cFb0P34xcDRoGooxQOnHpu+1FiEZyozwJtyxqQw4Vs91EBNpS//NYViPqu/lFe7xWdZ04r/mh2Vo+2IIxsoFAfAkPGG71Lz2VU+CGfQ7N/q/E0MBBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714745061; c=relaxed/simple;
	bh=0H2zSOR0rKxo2NoMTNKq1Y9+E//VFKuom/IJErWjXFs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bq4QGS3uFo2ufFWHovFSgy/9nD4bnIm8Zea6dL4+pDiRD4kMVXLypxwMsBDkVpefzzPk8nmsKOXZbWYLjjw+hZpfp6y5Xu5T7MuH5SxLLhdKagXwZaNAo89dF30ghPEiksXZe9eNVPIiqyPP26dz403m3MtoBbLFaxZAAcaREhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h1kKzqci; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h1kKzqci"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714745060; x=1746281060;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0H2zSOR0rKxo2NoMTNKq1Y9+E//VFKuom/IJErWjXFs=;
  b=h1kKzqci6brOlx9g9YaJy9VY2/upMHsIMGaCyQPaZT3UVhDfJArmEPEB
   V22IlKjZjEEW7CqFTihtsXl5LkK6MOPwpiANlCPkxva/W857mXTlToZEO
   jlboKFlK/BKwOn4GVxQrjLFWdyXvwm/VkX4Kwg4MPt9pJcwbpTcCFCmr8
   DobcMf1sWe4eJd07KDJkdFbiBWX7xe8BZWDgMLocHI6wWL0CozLjGGBpr
   vx8vrqy6qySsI9UjKaKtNv5qaxyconzemUxLVxPstj/PNYxxXXUXccecw
   v4ydZLel4DmfY9SGRZlbx6MGFOQP749wHGD3A8/YtADciaePOn9WOeo3H
   w==;
X-CSE-ConnectionGUID: KDgLe6ALTV+8S6cIhVbcYw==
X-CSE-MsgGUID: XPNt3q5JT3KcNmZJHb5T8w==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="14369512"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="14369512"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 07:04:19 -0700
X-CSE-ConnectionGUID: a64iTUUaQn+Rxc5lwbv9CQ==
X-CSE-MsgGUID: HiayOhVySIO++8f0Lraviw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="64908076"
Received: from sjslinke-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.113.3])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 07:04:19 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 2/9] ASoC: Intel: boards: clarify Copyright information
Date: Fri,  3 May 2024 09:03:52 -0500
Message-Id: <20240503140359.259762-3-pierre-louis.bossart@linux.intel.com>
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
 sound/soc/intel/boards/bdw_rt286.c                  | 2 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c       | 2 +-
 sound/soc/intel/boards/bxt_rt298.c                  | 2 +-
 sound/soc/intel/boards/hda_dsp_common.c             | 2 +-
 sound/soc/intel/boards/hsw_rt5640.c                 | 2 +-
 sound/soc/intel/boards/kbl_rt5663_max98927.c        | 2 +-
 sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c | 2 +-
 sound/soc/intel/boards/skl_nau88l25_max98357a.c     | 2 +-
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c       | 4 ++--
 sound/soc/intel/boards/skl_rt286.c                  | 4 ++--
 sound/soc/intel/boards/sof_board_helpers.c          | 2 +-
 sound/soc/intel/boards/sof_maxim_common.c           | 2 +-
 sound/soc/intel/boards/sof_realtek_common.c         | 2 +-
 sound/soc/intel/boards/sof_ssp_amp.c                | 2 +-
 sound/soc/intel/common/soc-acpi-intel-ssp-common.c  | 2 +-
 15 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/sound/soc/intel/boards/bdw_rt286.c b/sound/soc/intel/boards/bdw_rt286.c
index 7f20159c23e5..58db09d9b6e1 100644
--- a/sound/soc/intel/boards/bdw_rt286.c
+++ b/sound/soc/intel/boards/bdw_rt286.c
@@ -2,7 +2,7 @@
 /*
  * Sound card driver for Intel Broadwell Wildcat Point with Realtek 286
  *
- * Copyright (C) 2013, Intel Corporation. All rights reserved.
+ * Copyright (C) 2013, Intel Corporation
  */
 
 #include <linux/module.h>
diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
index 57e75f87bea6..e1082bfe5ca9 100644
--- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
+++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
@@ -2,7 +2,7 @@
 /*
  * Intel Broxton-P I2S Machine Driver
  *
- * Copyright (C) 2016, Intel Corporation. All rights reserved.
+ * Copyright (C) 2016, Intel Corporation
  *
  * Modified from:
  *   Intel Skylake I2S Machine driver
diff --git a/sound/soc/intel/boards/bxt_rt298.c b/sound/soc/intel/boards/bxt_rt298.c
index afc499be8db2..dce6a2086f2a 100644
--- a/sound/soc/intel/boards/bxt_rt298.c
+++ b/sound/soc/intel/boards/bxt_rt298.c
@@ -2,7 +2,7 @@
 /*
  * Intel Broxton-P I2S Machine Driver
  *
- * Copyright (C) 2014-2016, Intel Corporation. All rights reserved.
+ * Copyright (C) 2014-2016, Intel Corporation
  *
  * Modified from:
  *   Intel Skylake I2S Machine driver
diff --git a/sound/soc/intel/boards/hda_dsp_common.c b/sound/soc/intel/boards/hda_dsp_common.c
index 04b7d4f7f9e2..fda5a92b0006 100644
--- a/sound/soc/intel/boards/hda_dsp_common.c
+++ b/sound/soc/intel/boards/hda_dsp_common.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2019 Intel Corporation. All rights reserved.
+// Copyright(c) 2019 Intel Corporation
 
 #include <linux/module.h>
 #include <sound/pcm.h>
diff --git a/sound/soc/intel/boards/hsw_rt5640.c b/sound/soc/intel/boards/hsw_rt5640.c
index 2a2fe27dff0e..1826a4dfd0f3 100644
--- a/sound/soc/intel/boards/hsw_rt5640.c
+++ b/sound/soc/intel/boards/hsw_rt5640.c
@@ -2,7 +2,7 @@
 /*
  * Sound card driver for Intel Haswell Lynx Point with Realtek 5640
  *
- * Copyright (C) 2013, Intel Corporation. All rights reserved.
+ * Copyright (C) 2013, Intel Corporation
  */
 
 #include <linux/module.h>
diff --git a/sound/soc/intel/boards/kbl_rt5663_max98927.c b/sound/soc/intel/boards/kbl_rt5663_max98927.c
index 646e8ff8e961..e16c42e81eca 100644
--- a/sound/soc/intel/boards/kbl_rt5663_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_max98927.c
@@ -3,7 +3,7 @@
  * Intel Kabylake I2S Machine Driver with MAXIM98927
  * and RT5663 Codecs
  *
- * Copyright (C) 2017, Intel Corporation. All rights reserved.
+ * Copyright (C) 2017, Intel Corporation
  *
  * Modified from:
  *   Intel Skylake I2S Machine driver
diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
index 924d5d1de03a..a9501cd106ff 100644
--- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
@@ -3,7 +3,7 @@
  * Intel Kabylake I2S Machine Driver with MAXIM98927
  * RT5514 and RT5663 Codecs
  *
- * Copyright (C) 2017, Intel Corporation. All rights reserved.
+ * Copyright (C) 2017, Intel Corporation
  *
  * Modified from:
  *   Intel Kabylake I2S Machine driver supporting MAXIM98927 and
diff --git a/sound/soc/intel/boards/skl_nau88l25_max98357a.c b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
index e4630c33176e..91fe9834aab4 100644
--- a/sound/soc/intel/boards/skl_nau88l25_max98357a.c
+++ b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
@@ -3,7 +3,7 @@
  * Intel Skylake I2S Machine Driver with MAXIM98357A
  * and NAU88L25
  *
- * Copyright (C) 2015, Intel Corporation. All rights reserved.
+ * Copyright (C) 2015, Intel Corporation
  */
 
 #include <linux/module.h>
diff --git a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
index fadc25a536b4..d53bf3516c0d 100644
--- a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
+++ b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
@@ -2,12 +2,12 @@
 /*
  * Intel Skylake I2S Machine Driver for NAU88L25+SSM4567
  *
- * Copyright (C) 2015, Intel Corporation. All rights reserved.
+ * Copyright (C) 2015, Intel Corporation
  *
  * Modified from:
  *   Intel Skylake I2S Machine Driver for NAU88L25 and SSM4567
  *
- *   Copyright (C) 2015, Intel Corporation. All rights reserved.
+ *   Copyright (C) 2015, Intel Corporation
  */
 
 #include <linux/module.h>
diff --git a/sound/soc/intel/boards/skl_rt286.c b/sound/soc/intel/boards/skl_rt286.c
index 9a8044274908..3ea03f814403 100644
--- a/sound/soc/intel/boards/skl_rt286.c
+++ b/sound/soc/intel/boards/skl_rt286.c
@@ -2,12 +2,12 @@
 /*
  * Intel Skylake I2S Machine Driver
  *
- * Copyright (C) 2014-2015, Intel Corporation. All rights reserved.
+ * Copyright (C) 2014-2015, Intel Corporation
  *
  * Modified from:
  *   Intel Broadwell Wildcatpoint SST Audio
  *
- *   Copyright (C) 2013, Intel Corporation. All rights reserved.
+ *   Copyright (C) 2013, Intel Corporation
  */
 
 #include <linux/module.h>
diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
index eb140e13153f..7519c545cbe2 100644
--- a/sound/soc/intel/boards/sof_board_helpers.c
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2023 Intel Corporation. All rights reserved.
+// Copyright(c) 2023 Intel Corporation
 
 #include <sound/soc.h>
 #include "../common/soc-intel-quirks.h"
diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
index bb12aab15ad5..7e1f485dce7a 100644
--- a/sound/soc/intel/boards/sof_maxim_common.c
+++ b/sound/soc/intel/boards/sof_maxim_common.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2020 Intel Corporation. All rights reserved.
+// Copyright(c) 2020 Intel Corporation
 #include <linux/module.h>
 #include <linux/string.h>
 #include <sound/pcm.h>
diff --git a/sound/soc/intel/boards/sof_realtek_common.c b/sound/soc/intel/boards/sof_realtek_common.c
index 1476daa96a95..dda346e0f737 100644
--- a/sound/soc/intel/boards/sof_realtek_common.c
+++ b/sound/soc/intel/boards/sof_realtek_common.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2020 Intel Corporation. All rights reserved.
+// Copyright(c) 2020 Intel Corporation
 
 #include <linux/device.h>
 #include <linux/kernel.h>
diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index 206c9b723805..f51f1008e016 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2022 Intel Corporation
 
 /*
  * sof_ssp_amp.c - ASoc Machine driver for Intel platforms
diff --git a/sound/soc/intel/common/soc-acpi-intel-ssp-common.c b/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
index a887f019afe2..75d0b931d895 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2023 Intel Corporation. All rights reserved.
+// Copyright(c) 2023 Intel Corporation
 
 #include <linux/device.h>
 #include <sound/soc-acpi.h>
-- 
2.40.1

