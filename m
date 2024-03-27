Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AA1130ADA
	for <linux-sound@vger.kernel.org>; Wed, 27 Mar 2024 16:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711556669; cv=none; b=gopJcwjmBH5lMZ1JK3PudlBTK4eulcgtex5lWy6HYZkQhhd4wFZ/x0rlu5VLOpt0ZGM8Moe8d2KOAdRvDNuFIOcsKPI+K5GKrnxTNAsyRrQAv1BUDxU9qasXM8YlNn7IEJrsoFtBVLE85ziNN+QMfJ9MvEWYZ5kMzY+t6LxV64w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711556669; c=relaxed/simple;
	bh=3kkrMBxxqe8gX3azfqO+74/qGoMD7vgBEGBNeX8kchM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QXesFrfjLi4KAqMk4fdPRaqaJY7cWZ4PPSZzRgJ4GE+jfTqRALbD4lXoh60RQZFgptqPDjoTNs3YQc3NEiZw5CkviG9ha2XjfefVKO1I8JLMFLS4RpsNrcJ0pyKs4AnXYSC2Wc7va+bw/xBC8xUWrkuuDG0QPwlcp/o2gFioCeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nraTdopp; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nraTdopp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711556668; x=1743092668;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3kkrMBxxqe8gX3azfqO+74/qGoMD7vgBEGBNeX8kchM=;
  b=nraTdoppicybkQ/rK6onT1TJGR7uiN08st9sobqLWqoF/Xd0qNR5ZOBB
   qdG/sD9jAfQEXeFJySsy2og8kLPi+/UAb2PrgGOUw8U83H4OoivtOrgvT
   TnsqkFrJqlihsweUhx8rQZ/FP9SmPXzJiTe2vbNn18GoJZwzHuLtYcO60
   tKzgs4qSJvnJf7sU7iEyTvBXzksUQCyBkqvHevm4DrY+hezAJeiqbAvKD
   /XNjE/scw0t0iaw9aC4LAT+zVl6BzWIsA7mQlec8iMJxT+G9BHrlwn1fJ
   hwrkfrDQsp/tCIEvB555O7yb0RnvHYTA686FAKHwcHThegW7z5dQYhyP2
   Q==;
X-CSE-ConnectionGUID: KM1mVbTvS9aRAUtdeDCKAg==
X-CSE-MsgGUID: VOWXAlETSaSmFjIDrZdZQQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17221484"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="17221484"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 09:24:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="53821251"
Received: from ssherman-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.117.1])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 09:24:27 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 02/18] ASoC: Intel: ssp-common: relocate header file
Date: Wed, 27 Mar 2024 11:23:52 -0500
Message-Id: <20240327162408.63953-3-pierre-louis.bossart@linux.intel.com>
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

Moving ssp-common header file from sound/soc/intel/common directory to
include/sound directory and rename the file. Keep file content
unchanged for tracking purpose.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../sound/soc-acpi-intel-ssp-common.h                           | 0
 sound/soc/intel/boards/sof_board_helpers.h                      | 2 +-
 sound/soc/intel/boards/sof_cirrus_common.h                      | 2 +-
 sound/soc/intel/boards/sof_maxim_common.h                       | 2 +-
 sound/soc/intel/boards/sof_nuvoton_common.h                     | 2 +-
 sound/soc/intel/boards/sof_realtek_common.h                     | 2 +-
 sound/soc/intel/common/soc-acpi-intel-ssp-common.c              | 2 +-
 7 files changed, 6 insertions(+), 6 deletions(-)
 rename sound/soc/intel/common/sof_ssp_common.h => include/sound/soc-acpi-intel-ssp-common.h (100%)

diff --git a/sound/soc/intel/common/sof_ssp_common.h b/include/sound/soc-acpi-intel-ssp-common.h
similarity index 100%
rename from sound/soc/intel/common/sof_ssp_common.h
rename to include/sound/soc-acpi-intel-ssp-common.h
diff --git a/sound/soc/intel/boards/sof_board_helpers.h b/sound/soc/intel/boards/sof_board_helpers.h
index bd5c48cd0649..34ea974c8493 100644
--- a/sound/soc/intel/boards/sof_board_helpers.h
+++ b/sound/soc/intel/boards/sof_board_helpers.h
@@ -7,8 +7,8 @@
 #define __SOF_INTEL_BOARD_HELPERS_H
 
 #include <sound/soc.h>
+#include <sound/soc-acpi-intel-ssp-common.h>
 #include "sof_hdmi_common.h"
-#include "../common/sof_ssp_common.h"
 
 /*
  * Common board quirks: from bit 8 to 31, LSB 8 bits reserved for machine
diff --git a/sound/soc/intel/boards/sof_cirrus_common.h b/sound/soc/intel/boards/sof_cirrus_common.h
index 445621466f05..1c87637b9ef7 100644
--- a/sound/soc/intel/boards/sof_cirrus_common.h
+++ b/sound/soc/intel/boards/sof_cirrus_common.h
@@ -9,7 +9,7 @@
 #define __SOF_CIRRUS_COMMON_H
 
 #include <sound/soc.h>
-#include "../common/sof_ssp_common.h"
+#include <sound/soc-acpi-intel-ssp-common.h>
 
 /*
  * Cirrus Logic CS35L41/CS35L53
diff --git a/sound/soc/intel/boards/sof_maxim_common.h b/sound/soc/intel/boards/sof_maxim_common.h
index 63054bcd287b..8886f985de68 100644
--- a/sound/soc/intel/boards/sof_maxim_common.h
+++ b/sound/soc/intel/boards/sof_maxim_common.h
@@ -11,7 +11,7 @@
 #define __SOF_MAXIM_COMMON_H
 
 #include <sound/soc.h>
-#include "../common/sof_ssp_common.h"
+#include <sound/soc-acpi-intel-ssp-common.h>
 
 /*
  * Maxim MAX98373
diff --git a/sound/soc/intel/boards/sof_nuvoton_common.h b/sound/soc/intel/boards/sof_nuvoton_common.h
index af2e58b1d393..8a0f283260e7 100644
--- a/sound/soc/intel/boards/sof_nuvoton_common.h
+++ b/sound/soc/intel/boards/sof_nuvoton_common.h
@@ -9,7 +9,7 @@
 #define __SOF_NUVOTON_COMMON_H
 
 #include <sound/soc.h>
-#include "../common/sof_ssp_common.h"
+#include <sound/soc-acpi-intel-ssp-common.h>
 
 /*
  * Nuvoton NAU8318
diff --git a/sound/soc/intel/boards/sof_realtek_common.h b/sound/soc/intel/boards/sof_realtek_common.h
index 99b23d96521a..289e85b61660 100644
--- a/sound/soc/intel/boards/sof_realtek_common.h
+++ b/sound/soc/intel/boards/sof_realtek_common.h
@@ -11,7 +11,7 @@
 #define __SOF_REALTEK_COMMON_H
 
 #include <sound/soc.h>
-#include "../common/sof_ssp_common.h"
+#include <sound/soc-acpi-intel-ssp-common.h>
 
 /*
  * Realtek ALC1011
diff --git a/sound/soc/intel/common/soc-acpi-intel-ssp-common.c b/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
index 96072790e9c0..37758f4e3f32 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
@@ -4,7 +4,7 @@
 
 #include <linux/device.h>
 #include <sound/soc-acpi.h>
-#include "sof_ssp_common.h"
+#include <sound/soc-acpi-intel-ssp-common.h>
 
 /*
  * Codec probe function
-- 
2.40.1

