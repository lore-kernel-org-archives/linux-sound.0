Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3362C14F9F9
	for <linux-sound@vger.kernel.org>; Fri,  3 May 2024 14:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714745062; cv=none; b=NGxWwzay02CLPZRkxoFQQ7HEA4Yd47cvV+FLKw3xvAzJNYWxSajRRnf5VfOzqB8if+MtabQ29YYQcIfBA9t06AnawSkbOpHsRaO3xFjSyRzH3lj5luQD1RRhELbtyAMXv9TWSDV0xIiiqc4Zvi75LJSpvI+T72hXgdBYujFzDE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714745062; c=relaxed/simple;
	bh=+HI8RYLmUHciNMVJCenuLW56C8Es8SqMQLQaU3IKZV0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BD6CaLvvVMFh7TZzVki/tUGCeYWEpgGEYTBstTPBsbt5QPbdwYwjSs+ZKC2xAbkPTBEsoEE9N0uTg6kxJ6TUFR+Y+6rB4TLcneemM8tQorO+rY0y62qYaINK9vn+NmMpjvQhXLMy9pMdEPkMDqdeaDPTR1f0JiM/1Trk977tZuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JkPOE3yi; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JkPOE3yi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714745061; x=1746281061;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+HI8RYLmUHciNMVJCenuLW56C8Es8SqMQLQaU3IKZV0=;
  b=JkPOE3yiM2Dy9Y28mSQTy/ea7fFhvcZL9bjomPdCjx7LxOpby43EhWim
   FQmLZ5tQu2m0oOMYlFp7r4cmiWc7NGq21JYiQcFuQW9pYbD1wb6GzeiUO
   T7G/gBYMxZmKJol0VXGdnHKq2tJLr7s9hSwfAUVwBn0jptA23Rf0jSuNh
   JVxAXLmmhowJcrJqBwW9VjaJvds31oqVkdVcb2nnDYK6wDH4vPWn2Kwib
   4KTMqx9icxVyavspsqIw0wGkeltO848GnuFQc3/rRngiZtS5CXur/ptiD
   PkwY5HUe+yEH9hZIfm1KrjtyaJ0068TAzVRI8dyHxD/6Zb3Y4HmnEiqbv
   w==;
X-CSE-ConnectionGUID: /xf01FzPS5S8+9KbVtZoNQ==
X-CSE-MsgGUID: YzirwcztTnuiRVFIXkSylw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="14369516"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="14369516"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 07:04:20 -0700
X-CSE-ConnectionGUID: WYfwx+c3Qe2vZBZiiU9tgQ==
X-CSE-MsgGUID: GIjuGTf6RC6qMqH9h44SXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="64908084"
Received: from sjslinke-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.113.3])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 07:04:20 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 3/9] ASoC: Intel: common: clarify Copyright information
Date: Fri,  3 May 2024 09:03:53 -0500
Message-Id: <20240503140359.259762-4-pierre-louis.bossart@linux.intel.com>
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
 sound/soc/intel/common/soc-acpi-intel-lnl-match.c | 2 +-
 sound/soc/intel/common/sst-dsp-priv.h             | 2 +-
 sound/soc/intel/common/sst-dsp.c                  | 2 +-
 sound/soc/intel/common/sst-dsp.h                  | 2 +-
 sound/soc/intel/common/sst-ipc.c                  | 2 +-
 sound/soc/intel/common/sst-ipc.h                  | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
index 0318c1a46f3c..0c08859c4773 100644
--- a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
@@ -2,7 +2,7 @@
 /*
  * soc-acpi-intel-lnl-match.c - tables and support for LNL ACPI enumeration.
  *
- * Copyright (c) 2023, Intel Corporation. All rights reserved.
+ * Copyright (c) 2023, Intel Corporation
  *
  */
 
diff --git a/sound/soc/intel/common/sst-dsp-priv.h b/sound/soc/intel/common/sst-dsp-priv.h
index de2b44568feb..de32bb9afccb 100644
--- a/sound/soc/intel/common/sst-dsp-priv.h
+++ b/sound/soc/intel/common/sst-dsp-priv.h
@@ -2,7 +2,7 @@
 /*
  * Intel Smart Sound Technology
  *
- * Copyright (C) 2013, Intel Corporation. All rights reserved.
+ * Copyright (C) 2013, Intel Corporation
  */
 
 #ifndef __SOUND_SOC_SST_DSP_PRIV_H
diff --git a/sound/soc/intel/common/sst-dsp.c b/sound/soc/intel/common/sst-dsp.c
index 229d09d61afb..cdd2f7cf50ae 100644
--- a/sound/soc/intel/common/sst-dsp.c
+++ b/sound/soc/intel/common/sst-dsp.c
@@ -2,7 +2,7 @@
 /*
  * Intel Smart Sound Technology (SST) DSP Core Driver
  *
- * Copyright (C) 2013, Intel Corporation. All rights reserved.
+ * Copyright (C) 2013, Intel Corporation
  */
 
 #include <linux/slab.h>
diff --git a/sound/soc/intel/common/sst-dsp.h b/sound/soc/intel/common/sst-dsp.h
index f111fd3f334b..998b1a052281 100644
--- a/sound/soc/intel/common/sst-dsp.h
+++ b/sound/soc/intel/common/sst-dsp.h
@@ -2,7 +2,7 @@
 /*
  * Intel Smart Sound Technology (SST) Core
  *
- * Copyright (C) 2013, Intel Corporation. All rights reserved.
+ * Copyright (C) 2013, Intel Corporation
  */
 
 #ifndef __SOUND_SOC_SST_DSP_H
diff --git a/sound/soc/intel/common/sst-ipc.c b/sound/soc/intel/common/sst-ipc.c
index 89c10724d2a3..6b2c83f9f010 100644
--- a/sound/soc/intel/common/sst-ipc.c
+++ b/sound/soc/intel/common/sst-ipc.c
@@ -2,7 +2,7 @@
 /*
  * Intel SST generic IPC Support
  *
- * Copyright (C) 2015, Intel Corporation. All rights reserved.
+ * Copyright (C) 2015, Intel Corporation
  */
 
 #include <linux/types.h>
diff --git a/sound/soc/intel/common/sst-ipc.h b/sound/soc/intel/common/sst-ipc.h
index 77d651e888f9..86d44ceadc92 100644
--- a/sound/soc/intel/common/sst-ipc.h
+++ b/sound/soc/intel/common/sst-ipc.h
@@ -2,7 +2,7 @@
 /*
  * Intel SST generic IPC Support
  *
- * Copyright (C) 2015, Intel Corporation. All rights reserved.
+ * Copyright (C) 2015, Intel Corporation
  */
 
 #ifndef __SST_GENERIC_IPC_H
-- 
2.40.1

