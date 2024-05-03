Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19544154453
	for <linux-sound@vger.kernel.org>; Fri,  3 May 2024 14:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714745065; cv=none; b=UJF4D8c6EjT811f3Bi2MJzDZAycK3Imz59n5bonvk3HgROvEvx4UE/TEzj84QQM7Zxx5saSAC9ydMGoQzFbdhcSd2cjyIrEbNwjGRtcFXYk01cwi8gkhNlMjensqKrK0HaAHvPiALqk1+Jjj6OqKJqLH4SXX7cNbWoIA2HYRLLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714745065; c=relaxed/simple;
	bh=LDpGEzq0gWRFSU8AjtQOu5pI/dAWD9OcfHw2AE7IzEg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ShA531RzacKvttrzkFRGjx4oMmGttAIBW3rK8H4Dloz2NhXXAQgzMHrZGe8FQ8U+ozMXxXhMjOnAUKqwQEFLGJjUYX6IvGEU9xGjQqJPHdwbj8GIsKO1YjFjp1913d79XwEyxuYxGj1WGCMFceRdUURx3X4myDgElg+pxiV/x5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MOr18L50; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MOr18L50"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714745063; x=1746281063;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LDpGEzq0gWRFSU8AjtQOu5pI/dAWD9OcfHw2AE7IzEg=;
  b=MOr18L50EUzr3euNk7fDBGf3+lH07TNvTMdwGoEVhq55FCh/s7xfqryS
   wQupkrJlAm6VnIhIJrkGqMRFHm3zFQtE3+35YMASBkqunYxB8zRX3XCIU
   BprCpBoo7pBWmqJVFlMrytUi2yNfOadbTrIc2GT2sp5qWvaNi8ctW6em6
   asC75UlDY3afuuL/MpvUANAAj2vGSvCN9eZxfd29F2IHHGj2apaVsBaxN
   jZqrdXxSd52PqM/r4RNL8dnrzVFtIRkSeZjnzI0Yt4HbEoNu4k/em073k
   JgDHr434lvxR959JEjiuvCqVMTZTjcZwdYuPt2jPxJLSST/t6KxbVgNMd
   Q==;
X-CSE-ConnectionGUID: oRhpNU7iTqKulARhRlcfWQ==
X-CSE-MsgGUID: D1Bbv4BWR6qGM+w/7wh/xw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="14369529"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="14369529"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 07:04:22 -0700
X-CSE-ConnectionGUID: PfUgPXtuTIWFeLFLvq3JvQ==
X-CSE-MsgGUID: E/DyFKIxRG+hszNut6GHqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="64908109"
Received: from sjslinke-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.113.3])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 07:04:22 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 6/9] ASoC: Intel: avs: clarify Copyright information
Date: Fri,  3 May 2024 09:03:56 -0500
Message-Id: <20240503140359.259762-7-pierre-louis.bossart@linux.intel.com>
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
 sound/soc/intel/avs/apl.c              | 2 +-
 sound/soc/intel/avs/avs.h              | 2 +-
 sound/soc/intel/avs/board_selection.c  | 2 +-
 sound/soc/intel/avs/boards/da7219.c    | 2 +-
 sound/soc/intel/avs/boards/dmic.c      | 2 +-
 sound/soc/intel/avs/boards/es8336.c    | 2 +-
 sound/soc/intel/avs/boards/hdaudio.c   | 2 +-
 sound/soc/intel/avs/boards/i2s_test.c  | 2 +-
 sound/soc/intel/avs/boards/max98357a.c | 2 +-
 sound/soc/intel/avs/boards/max98373.c  | 2 +-
 sound/soc/intel/avs/boards/max98927.c  | 2 +-
 sound/soc/intel/avs/boards/nau8825.c   | 2 +-
 sound/soc/intel/avs/boards/probe.c     | 2 +-
 sound/soc/intel/avs/boards/rt274.c     | 2 +-
 sound/soc/intel/avs/boards/rt286.c     | 2 +-
 sound/soc/intel/avs/boards/rt298.c     | 2 +-
 sound/soc/intel/avs/boards/rt5514.c    | 2 +-
 sound/soc/intel/avs/boards/rt5663.c    | 2 +-
 sound/soc/intel/avs/boards/rt5682.c    | 2 +-
 sound/soc/intel/avs/boards/ssm4567.c   | 2 +-
 sound/soc/intel/avs/cldma.c            | 2 +-
 sound/soc/intel/avs/cldma.h            | 2 +-
 sound/soc/intel/avs/cnl.c              | 2 +-
 sound/soc/intel/avs/control.c          | 2 +-
 sound/soc/intel/avs/control.h          | 2 +-
 sound/soc/intel/avs/core.c             | 2 +-
 sound/soc/intel/avs/debugfs.c          | 2 +-
 sound/soc/intel/avs/dsp.c              | 2 +-
 sound/soc/intel/avs/icl.c              | 2 +-
 sound/soc/intel/avs/ipc.c              | 2 +-
 sound/soc/intel/avs/loader.c           | 2 +-
 sound/soc/intel/avs/messages.c         | 2 +-
 sound/soc/intel/avs/messages.h         | 2 +-
 sound/soc/intel/avs/path.c             | 2 +-
 sound/soc/intel/avs/path.h             | 2 +-
 sound/soc/intel/avs/pcm.c              | 2 +-
 sound/soc/intel/avs/probes.c           | 2 +-
 sound/soc/intel/avs/registers.h        | 2 +-
 sound/soc/intel/avs/skl.c              | 2 +-
 sound/soc/intel/avs/sysfs.c            | 2 +-
 sound/soc/intel/avs/tgl.c              | 2 +-
 sound/soc/intel/avs/topology.c         | 2 +-
 sound/soc/intel/avs/topology.h         | 2 +-
 sound/soc/intel/avs/trace.c            | 2 +-
 sound/soc/intel/avs/utils.c            | 2 +-
 sound/soc/intel/avs/utils.h            | 2 +-
 46 files changed, 46 insertions(+), 46 deletions(-)

diff --git a/sound/soc/intel/avs/apl.c b/sound/soc/intel/avs/apl.c
index bf97e4e428a4..27516ef57185 100644
--- a/sound/soc/intel/avs/apl.c
+++ b/sound/soc/intel/avs/apl.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2021-2022 Intel Corporation
 //
 // Authors: Cezary Rojewski <cezary.rojewski@intel.com>
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 101b1902a715..eca6ec0428bb 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+ * Copyright(c) 2021-2022 Intel Corporation
  *
  * Authors: Cezary Rojewski <cezary.rojewski@intel.com>
  *          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
index 290ea314ace8..0266edeafc19 100644
--- a/sound/soc/intel/avs/board_selection.c
+++ b/sound/soc/intel/avs/board_selection.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2021-2022 Intel Corporation
 //
 // Authors: Cezary Rojewski <cezary.rojewski@intel.com>
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/boards/da7219.c b/sound/soc/intel/avs/boards/da7219.c
index fc072dc58968..80c0a1a95654 100644
--- a/sound/soc/intel/avs/boards/da7219.c
+++ b/sound/soc/intel/avs/boards/da7219.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2021-2022 Intel Corporation
 //
 // Author: Cezary Rojewski <cezary.rojewski@intel.com>
 //
diff --git a/sound/soc/intel/avs/boards/dmic.c b/sound/soc/intel/avs/boards/dmic.c
index d9e5e85f5233..a31aa471a1c2 100644
--- a/sound/soc/intel/avs/boards/dmic.c
+++ b/sound/soc/intel/avs/boards/dmic.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2021-2022 Intel Corporation
 //
 // Authors: Cezary Rojewski <cezary.rojewski@intel.com>
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/boards/es8336.c b/sound/soc/intel/avs/boards/es8336.c
index ff3bd1513269..e19ad8deed5c 100644
--- a/sound/soc/intel/avs/boards/es8336.c
+++ b/sound/soc/intel/avs/boards/es8336.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2023 Intel Corporation. All rights reserved.
+// Copyright(c) 2023 Intel Corporation
 //
 // Authors: Cezary Rojewski <cezary.rojewski@intel.com>
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/boards/hdaudio.c b/sound/soc/intel/avs/boards/hdaudio.c
index 4433175814f8..430c070a1a0e 100644
--- a/sound/soc/intel/avs/boards/hdaudio.c
+++ b/sound/soc/intel/avs/boards/hdaudio.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2021-2022 Intel Corporation
 //
 // Authors: Cezary Rojewski <cezary.rojewski@intel.com>
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/boards/i2s_test.c b/sound/soc/intel/avs/boards/i2s_test.c
index d41955685664..7e6c8d9c900b 100644
--- a/sound/soc/intel/avs/boards/i2s_test.c
+++ b/sound/soc/intel/avs/boards/i2s_test.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2021-2022 Intel Corporation
 //
 // Authors: Cezary Rojewski <cezary.rojewski@intel.com>
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/boards/max98357a.c b/sound/soc/intel/avs/boards/max98357a.c
index 1ff85e4d8e16..8d550e82b46a 100644
--- a/sound/soc/intel/avs/boards/max98357a.c
+++ b/sound/soc/intel/avs/boards/max98357a.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2021-2022 Intel Corporation
 //
 // Authors: Cezary Rojewski <cezary.rojewski@intel.com>
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/boards/max98373.c b/sound/soc/intel/avs/boards/max98373.c
index 8d31586b73ea..fdef5a008daf 100644
--- a/sound/soc/intel/avs/boards/max98373.c
+++ b/sound/soc/intel/avs/boards/max98373.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2022 Intel Corporation
 //
 // Authors: Cezary Rojewski <cezary.rojewski@intel.com>
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/boards/max98927.c b/sound/soc/intel/avs/boards/max98927.c
index 572ec58073d0..082f311d8b84 100644
--- a/sound/soc/intel/avs/boards/max98927.c
+++ b/sound/soc/intel/avs/boards/max98927.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2022 Intel Corporation
 //
 // Authors: Cezary Rojewski <cezary.rojewski@intel.com>
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/boards/nau8825.c b/sound/soc/intel/avs/boards/nau8825.c
index 3164745b1516..8dee6801fe51 100644
--- a/sound/soc/intel/avs/boards/nau8825.c
+++ b/sound/soc/intel/avs/boards/nau8825.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2021-2022 Intel Corporation
 //
 // Authors: Cezary Rojewski <cezary.rojewski@intel.com>
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/boards/probe.c b/sound/soc/intel/avs/boards/probe.c
index 8be6887bbc6e..1cdc285ab810 100644
--- a/sound/soc/intel/avs/boards/probe.c
+++ b/sound/soc/intel/avs/boards/probe.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2021-2022 Intel Corporation
 //
 // Authors: Cezary Rojewski <cezary.rojewski@intel.com>
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/boards/rt274.c b/sound/soc/intel/avs/boards/rt274.c
index e3aa28780df5..68d6fcb215bb 100644
--- a/sound/soc/intel/avs/boards/rt274.c
+++ b/sound/soc/intel/avs/boards/rt274.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2021-2022 Intel Corporation
 //
 // Authors: Cezary Rojewski <cezary.rojewski@intel.com>
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/boards/rt286.c b/sound/soc/intel/avs/boards/rt286.c
index d24316fc4db9..a3d0c5da5dfe 100644
--- a/sound/soc/intel/avs/boards/rt286.c
+++ b/sound/soc/intel/avs/boards/rt286.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2021-2022 Intel Corporation
 //
 // Authors: Cezary Rojewski <cezary.rojewski@intel.com>
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/boards/rt298.c b/sound/soc/intel/avs/boards/rt298.c
index 7fd28544f786..f819f8dd447b 100644
--- a/sound/soc/intel/avs/boards/rt298.c
+++ b/sound/soc/intel/avs/boards/rt298.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2021-2022 Intel Corporation
 //
 // Authors: Cezary Rojewski <cezary.rojewski@intel.com>
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/boards/rt5514.c b/sound/soc/intel/avs/boards/rt5514.c
index 097ae5f73241..cfa146b6cf08 100644
--- a/sound/soc/intel/avs/boards/rt5514.c
+++ b/sound/soc/intel/avs/boards/rt5514.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2021-2023 Intel Corporation. All rights reserved.
+// Copyright(c) 2021-2023 Intel Corporation
 //
 // Authors: Cezary Rojewski <cezary.rojewski@intel.com>
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/boards/rt5663.c b/sound/soc/intel/avs/boards/rt5663.c
index ba8c42d026da..44f857e90969 100644
--- a/sound/soc/intel/avs/boards/rt5663.c
+++ b/sound/soc/intel/avs/boards/rt5663.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2022-2023 Intel Corporation. All rights reserved.
+// Copyright(c) 2022-2023 Intel Corporation
 //
 // Authors: Cezary Rojewski <cezary.rojewski@intel.com>
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/boards/rt5682.c b/sound/soc/intel/avs/boards/rt5682.c
index 823f04dba2f7..0dcc6392a0cc 100644
--- a/sound/soc/intel/avs/boards/rt5682.c
+++ b/sound/soc/intel/avs/boards/rt5682.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2021-2022 Intel Corporation
 //
 // Authors: Cezary Rojewski <cezary.rojewski@intel.com>
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/boards/ssm4567.c b/sound/soc/intel/avs/boards/ssm4567.c
index 9e78a3b91208..63bbfc30f35e 100644
--- a/sound/soc/intel/avs/boards/ssm4567.c
+++ b/sound/soc/intel/avs/boards/ssm4567.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2021-2022 Intel Corporation
 //
 // Authors: Cezary Rojewski <cezary.rojewski@intel.com>
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/cldma.c b/sound/soc/intel/avs/cldma.c
index 945ea376d031..61326d7059b1 100644
--- a/sound/soc/intel/avs/cldma.c
+++ b/sound/soc/intel/avs/cldma.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2021-2022 Intel Corporation
 //
 // Author: Cezary Rojewski <cezary.rojewski@intel.com>
 //
diff --git a/sound/soc/intel/avs/cldma.h b/sound/soc/intel/avs/cldma.h
index 7d95e2747f52..7f9b2b1c566e 100644
--- a/sound/soc/intel/avs/cldma.h
+++ b/sound/soc/intel/avs/cldma.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+ * Copyright(c) 2021-2022 Intel Corporation
  *
  * Author: Cezary Rojewski <cezary.rojewski@intel.com>
  */
diff --git a/sound/soc/intel/avs/cnl.c b/sound/soc/intel/avs/cnl.c
index 0d03e1e03c11..bd3c4bb8bf5a 100644
--- a/sound/soc/intel/avs/cnl.c
+++ b/sound/soc/intel/avs/cnl.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2021-2024 Intel Corporation. All rights reserved.
+// Copyright(c) 2021-2024 Intel Corporation
 //
 // Authors: Cezary Rojewski <cezary.rojewski@intel.com>
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/control.c b/sound/soc/intel/avs/control.c
index 3dfa2e9816db..dc7dc45e0a0a 100644
--- a/sound/soc/intel/avs/control.c
+++ b/sound/soc/intel/avs/control.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2021-2022 Intel Corporation
 //
 // Authors: Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
 //          Cezary Rojewski <cezary.rojewski@intel.com>
diff --git a/sound/soc/intel/avs/control.h b/sound/soc/intel/avs/control.h
index 08631bde13c3..d9fac3569e8d 100644
--- a/sound/soc/intel/avs/control.h
+++ b/sound/soc/intel/avs/control.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+ * Copyright(c) 2021-2022 Intel Corporation
  *
  * Authors: Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
  *          Cezary Rojewski <cezary.rojewski@intel.com>
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index f56f9e19276a..d9816d0701a8 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2021-2022 Intel Corporation
 //
 // Authors: Cezary Rojewski <cezary.rojewski@intel.com>
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/debugfs.c b/sound/soc/intel/avs/debugfs.c
index 4dfbff0ce508..3fc2bbb63369 100644
--- a/sound/soc/intel/avs/debugfs.c
+++ b/sound/soc/intel/avs/debugfs.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2021-2022 Intel Corporation
 //
 // Authors: Cezary Rojewski <cezary.rojewski@intel.com>
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/dsp.c b/sound/soc/intel/avs/dsp.c
index aa03af4473e9..7b47e52c2b39 100644
--- a/sound/soc/intel/avs/dsp.c
+++ b/sound/soc/intel/avs/dsp.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2021-2022 Intel Corporation
 //
 // Authors: Cezary Rojewski <cezary.rojewski@intel.com>
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/icl.c b/sound/soc/intel/avs/icl.c
index 3a96c4304ca6..f8d327ea2656 100644
--- a/sound/soc/intel/avs/icl.c
+++ b/sound/soc/intel/avs/icl.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2021-2024 Intel Corporation. All rights reserved.
+// Copyright(c) 2021-2024 Intel Corporation
 //
 // Authors: Cezary Rojewski <cezary.rojewski@intel.com>
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/ipc.c b/sound/soc/intel/avs/ipc.c
index f9b302215c37..4fba46e77c47 100644
--- a/sound/soc/intel/avs/ipc.c
+++ b/sound/soc/intel/avs/ipc.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2021-2022 Intel Corporation
 //
 // Authors: Cezary Rojewski <cezary.rojewski@intel.com>
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/loader.c b/sound/soc/intel/avs/loader.c
index c255c898b7a8..890efd2f1fea 100644
--- a/sound/soc/intel/avs/loader.c
+++ b/sound/soc/intel/avs/loader.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2021-2022 Intel Corporation
 //
 // Authors: Cezary Rojewski <cezary.rojewski@intel.com>
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/messages.c b/sound/soc/intel/avs/messages.c
index f874e4f0d95f..ec458bd51b10 100644
--- a/sound/soc/intel/avs/messages.c
+++ b/sound/soc/intel/avs/messages.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2021-2022 Intel Corporation
 //
 // Authors: Cezary Rojewski <cezary.rojewski@intel.com>
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/messages.h b/sound/soc/intel/avs/messages.h
index 285d89607b6a..d0bdb7d9266c 100644
--- a/sound/soc/intel/avs/messages.h
+++ b/sound/soc/intel/avs/messages.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+ * Copyright(c) 2021-2022 Intel Corporation
  *
  * Authors: Cezary Rojewski <cezary.rojewski@intel.com>
  *          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index 0a34d63e262e..f31d5e2caa7b 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2021 Intel Corporation. All rights reserved.
+// Copyright(c) 2021 Intel Corporation
 //
 // Authors: Cezary Rojewski <cezary.rojewski@intel.com>
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/path.h b/sound/soc/intel/avs/path.h
index 657f7b093e80..bfd253c9fa95 100644
--- a/sound/soc/intel/avs/path.h
+++ b/sound/soc/intel/avs/path.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright(c) 2021 Intel Corporation. All rights reserved.
+ * Copyright(c) 2021 Intel Corporation
  *
  * Authors: Cezary Rojewski <cezary.rojewski@intel.com>
  *          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 845b5ed9eb1b..88e711875004 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2021-2022 Intel Corporation
 //
 // Authors: Cezary Rojewski <cezary.rojewski@intel.com>
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/probes.c b/sound/soc/intel/avs/probes.c
index 7e781a315690..f0b010956303 100644
--- a/sound/soc/intel/avs/probes.c
+++ b/sound/soc/intel/avs/probes.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2021-2022 Intel Corporation
 //
 // Authors: Cezary Rojewski <cezary.rojewski@intel.com>
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/registers.h b/sound/soc/intel/avs/registers.h
index 6126adca500c..f76e91cff2a9 100644
--- a/sound/soc/intel/avs/registers.h
+++ b/sound/soc/intel/avs/registers.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+ * Copyright(c) 2021-2022 Intel Corporation
  *
  * Authors: Cezary Rojewski <cezary.rojewski@intel.com>
  *          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/skl.c b/sound/soc/intel/avs/skl.c
index fceed353449a..34f859d6e5a4 100644
--- a/sound/soc/intel/avs/skl.c
+++ b/sound/soc/intel/avs/skl.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2021-2022 Intel Corporation
 //
 // Authors: Cezary Rojewski <cezary.rojewski@intel.com>
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/sysfs.c b/sound/soc/intel/avs/sysfs.c
index cce21636fbc0..74b2e6f38d76 100644
--- a/sound/soc/intel/avs/sysfs.c
+++ b/sound/soc/intel/avs/sysfs.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2021-2024 Intel Corporation. All rights reserved.
+// Copyright(c) 2021-2024 Intel Corporation
 //
 // Authors: Cezary Rojewski <cezary.rojewski@intel.com>
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/tgl.c b/sound/soc/intel/avs/tgl.c
index b985a8299b72..a9019ff5e3af 100644
--- a/sound/soc/intel/avs/tgl.c
+++ b/sound/soc/intel/avs/tgl.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2021-2024 Intel Corporation. All rights reserved.
+// Copyright(c) 2021-2024 Intel Corporation
 //
 // Authors: Cezary Rojewski <cezary.rojewski@intel.com>
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index 42b42903ae9d..02bae207f6ec 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2021 Intel Corporation. All rights reserved.
+// Copyright(c) 2021 Intel Corporation
 //
 // Authors: Cezary Rojewski <cezary.rojewski@intel.com>
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/topology.h b/sound/soc/intel/avs/topology.h
index 6a59dd766603..7892e3797f63 100644
--- a/sound/soc/intel/avs/topology.h
+++ b/sound/soc/intel/avs/topology.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright(c) 2021 Intel Corporation. All rights reserved.
+ * Copyright(c) 2021 Intel Corporation
  *
  * Authors: Cezary Rojewski <cezary.rojewski@intel.com>
  *          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/trace.c b/sound/soc/intel/avs/trace.c
index c63eea909b5e..a98da521db0f 100644
--- a/sound/soc/intel/avs/trace.c
+++ b/sound/soc/intel/avs/trace.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2021-2022 Intel Corporation
 //
 // Author: Cezary Rojewski <cezary.rojewski@intel.com>
 //         Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/utils.c b/sound/soc/intel/avs/utils.c
index 8100c2fa0a7e..81f9b67d8e29 100644
--- a/sound/soc/intel/avs/utils.c
+++ b/sound/soc/intel/avs/utils.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2021-2022 Intel Corporation
 //
 // Authors: Cezary Rojewski <cezary.rojewski@intel.com>
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
diff --git a/sound/soc/intel/avs/utils.h b/sound/soc/intel/avs/utils.h
index 0b82a98ed024..5ee569c39380 100644
--- a/sound/soc/intel/avs/utils.h
+++ b/sound/soc/intel/avs/utils.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright(c) 2023 Intel Corporation. All rights reserved.
+ * Copyright(c) 2023 Intel Corporation
  *
  * Authors: Cezary Rojewski <cezary.rojewski@intel.com>
  *          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
-- 
2.40.1

