Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27D8154431
	for <linux-sound@vger.kernel.org>; Fri,  3 May 2024 14:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714745063; cv=none; b=bbweHpASpqiodhAvKrLgjRUGlRHCjtx+QSH84As+gKMrcqII70dT6+h4HUacGABZ6b7rGixN9iJpvf/36mn+ySoAf6jobTl878U8Jx0tfqAN8SvgLrbiP9TdfJkbntQxDpyNTBSTtsZsPbYirUNSTYq0zgtfP8cSCmZnMd8qZ2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714745063; c=relaxed/simple;
	bh=qMWnTN+SructwynBCFegp/6wrzsKpLa8rhUnYzjvDEI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZBf288B2/lau4X0CpKU4/Oen0WhulohVkmeyMihEJuV3gk5gLwesXarNt8x2060tXQElfkAT29wCcmWPwIY+uJqQWCvDinLK9gSDjBbc0S8a/ad4MqTdaTDEjcX4KgAIx4Rof97arhuIfBMnx6yzFIvq7vuKx8p32GB+kqj3b/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UW9PZnKj; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UW9PZnKj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714745061; x=1746281061;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qMWnTN+SructwynBCFegp/6wrzsKpLa8rhUnYzjvDEI=;
  b=UW9PZnKjFV0isxRVLR0qWEo3apRrZjWpSYMLUh8qXjZsrjzctuQm9la6
   AocK56x0oEt9SXhrGV84uCe02NIQPk8r5lJj4LSa0PsgCHTykP/vkN2GJ
   kE6cNazsCC9lre+wp/rC4Ckq+i4DPhS1nmWKkIZbpH4kyj34mBJxpR5/u
   VzYA1g7XceQy7rtPJ25p6Wsb4oG2R2l26j3La3hzcZUYYlgbLs+peWB9W
   lhf6i+hY7z+CwhYch9EOnpwa4srfpKVOzDGnGIPLkoKOu6MtzmehXsRHN
   zZCVt73tHzIe7bNFWIS1J8am0VC4GLyHbDEdW2OqdwF6RsbIGvnW89mTS
   g==;
X-CSE-ConnectionGUID: Si9HfRZLQDGrTUtZCCwSHQ==
X-CSE-MsgGUID: iAql09BERHevUwl70E2zUw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="14369521"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="14369521"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 07:04:20 -0700
X-CSE-ConnectionGUID: a5AG6LEJScKWilLTCmy/wQ==
X-CSE-MsgGUID: C5pOhJxtRpqoc1FnLYHSMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="64908098"
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
Subject: [PATCH 4/9] ASoC: codecs: Intel: clarify Copyright information
Date: Fri,  3 May 2024 09:03:54 -0500
Message-Id: <20240503140359.259762-5-pierre-louis.bossart@linux.intel.com>
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
 sound/soc/codecs/hda-dai.c | 2 +-
 sound/soc/codecs/hda.c     | 2 +-
 sound/soc/codecs/hda.h     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/hda-dai.c b/sound/soc/codecs/hda-dai.c
index 7bd7ddcd810f..b9caae7e4817 100644
--- a/sound/soc/codecs/hda-dai.c
+++ b/sound/soc/codecs/hda-dai.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 //
-// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2021-2022 Intel Corporation
 //
 // Author: Cezary Rojewski <cezary.rojewski@intel.com>
 //
diff --git a/sound/soc/codecs/hda.c b/sound/soc/codecs/hda.c
index 5a58723dc0e9..ddc00927313c 100644
--- a/sound/soc/codecs/hda.c
+++ b/sound/soc/codecs/hda.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 //
-// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2021-2022 Intel Corporation
 //
 // Author: Cezary Rojewski <cezary.rojewski@intel.com>
 //
diff --git a/sound/soc/codecs/hda.h b/sound/soc/codecs/hda.h
index 78a2be4945b1..59308cc6afef 100644
--- a/sound/soc/codecs/hda.h
+++ b/sound/soc/codecs/hda.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+ * Copyright(c) 2021-2022 Intel Corporation
  *
  * Author: Cezary Rojewski <cezary.rojewski@intel.com>
  */
-- 
2.40.1

