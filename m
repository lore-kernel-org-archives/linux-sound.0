Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8716415445D
	for <linux-sound@vger.kernel.org>; Fri,  3 May 2024 14:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714745064; cv=none; b=eP+MkB78TE02QhZY2kfrBv8d69bHbx9LAg690zARNmuHwh3NtIUUSPuSxhE1wlhlRwHkzZCsCjr6kqf3AVlEA5e+lOcAF85YD+4sFym3dOArUztKzvnIJY6mOo9/MH7lrSGPDzy3j72ODH+ptHENrTXwc9lzhuxLI9fr2iRq6Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714745064; c=relaxed/simple;
	bh=NmmnMJQdA3MzA4mxXa0y5BDRdNBbJ9xUXNe5fJ3MO1I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cgYq1Gp08HFPnpKS0H/d7Duk1KeIUXV+suWo+dPYpyhmgwgf+QP5mlWbllpJ7xDFygz8WfddIzt7BuFlW7m1B6S7R8mnabZJ5ykzNsgxWB/hB0IU6chpZAC9mv+LgsaeAHtI7MeImSfc9ZF9Ajy3hTHG9I7wL4h9T4jvaZYN3Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c/RoVP4I; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c/RoVP4I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714745063; x=1746281063;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NmmnMJQdA3MzA4mxXa0y5BDRdNBbJ9xUXNe5fJ3MO1I=;
  b=c/RoVP4INSqNAhvfNpjhMej5HMgwlQL3WVUuymi0LcOh5pEyOwh61Sp8
   no8BM/ciIde8ntar7qZ8EJyCyZWTsDhW0omk8Y/2J2sYiLwIz98Uzhnvi
   lXCb7+ggRSXe+WKxZFOpPdDPpskpBU/WQYPI2ZsKdt0o3Az46TlSgaGHF
   oimHly5KtDXiDQogTMANyDISuBObo1fvzyNMS3I9TfvQlVNact4oqI8L6
   /lokHCTT95fBZAyUAAUf4+FDx9jKCT8Zi7VZMxexbOL1q6eFqITT7dScn
   jKkf8IuDTs2A6u35N2mqZGZNYwNHQZfb9PrdhEOVAH5WfLtjKdIW2OEsV
   w==;
X-CSE-ConnectionGUID: T2jeOPI8Qr6vB7wFu2fK0w==
X-CSE-MsgGUID: pVHR41GYQ7yJgPEDrdyssA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="14369533"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="14369533"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 07:04:22 -0700
X-CSE-ConnectionGUID: BwPhQY/YSauoP9lJPawxng==
X-CSE-MsgGUID: KuU5QnNNT8ajGFaEUPzdsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="64908114"
Received: from sjslinke-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.113.3])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 07:04:23 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 7/9] ASoC: soc-topology-test: clarify Copyright information
Date: Fri,  3 May 2024 09:03:57 -0500
Message-Id: <20240503140359.259762-8-pierre-louis.bossart@linux.intel.com>
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
 sound/soc/soc-topology-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-topology-test.c b/sound/soc/soc-topology-test.c
index 70cbccc42a42..02aa2448f0e6 100644
--- a/sound/soc/soc-topology-test.c
+++ b/sound/soc/soc-topology-test.c
@@ -2,7 +2,7 @@
 /*
  * soc-topology-test.c  --  ALSA SoC Topology Kernel Unit Tests
  *
- * Copyright(c) 2021 Intel Corporation. All rights reserved.
+ * Copyright(c) 2021 Intel Corporation.
  */
 
 #include <linux/firmware.h>
-- 
2.40.1

