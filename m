Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B97216E24
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 12:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736424517; cv=none; b=h2jTbt4ZArXn60aAxrlwrzG8ukgZVtT12LPJSAt4vFOXnBlPE/8xuWp7iJzegiUVEJ+KZDAeMhrTB9GDK4OnxdZNLBIRA7Ki/9ih5VcnFnj8HuwbL5VtXdalgC9qcF4mlUnFCmTVIC5mfX5xsRlqoRRP6qF9TkV3X3MJe0oXuvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736424517; c=relaxed/simple;
	bh=bu5sE31AgKW1QDdWukqjzynF0QuQN68hIEkUdGRaQM4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CEJ9+kmEYu3BXY2f025GwBtH9q71Abt/VYVq2iHykMr3n5TxzuqIETndrKNyUWoozwnO0eTB6Ar5JtSUr42TBJlTbDDza8ay0T/nj2mPkPm4moX1t0HSCb7cy9PLxvfGc6Sju972PcaGr5h7GIPvmu+0xQsvneMJtoZmY1W3xC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VSOfYdxQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VSOfYdxQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736424516; x=1767960516;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bu5sE31AgKW1QDdWukqjzynF0QuQN68hIEkUdGRaQM4=;
  b=VSOfYdxQBm2RbjRupm0n8TyyVQSS/J+uhVx2BRhsHYiEdGPQre5gkHg9
   xJQitYMhoz5ayFvW5APsaXZ0y0oDlkzE3duGJbaPelsk90VKaeJ15viUr
   hfI3Q3xyuXOnRCgKX/YrdnXng20Y5k1Vk6FK/HV1tc0Rv2SbT2ZsC//w2
   t2inBeeoMj3cr5YBSWAxrY7YZQW3LZBXQJ6g7Qy+6M6P/22PKU/qp7OWZ
   Unwd5CbYW3o7O4zQXYQjvGzbZeQpTNbSLAGxhdPPB4qcaAWS+fFcTsPvq
   Zo9U/ma63+StvkMyHr+yu/rZlaYG1FHFTgBI41jnv7MqemLpWJOCZXBMs
   Q==;
X-CSE-ConnectionGUID: sgNxHR4kRzyuj4tYB4Kj6g==
X-CSE-MsgGUID: TQ1kBBpOSMypNq2hOFf/LQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="47179622"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="47179622"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 04:08:34 -0800
X-CSE-ConnectionGUID: BqsnrDsSTbCdQPL7XXd6qQ==
X-CSE-MsgGUID: GLywiKRpTsKKjHG3MeXPXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140710405"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa001.jf.intel.com with ESMTP; 09 Jan 2025 04:08:32 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 13/13] ASoC: Intel: avs: Add missing includes
Date: Thu,  9 Jan 2025 13:22:16 +0100
Message-Id: <20250109122216.3667847-14-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250109122216.3667847-1-cezary.rojewski@intel.com>
References: <20250109122216.3667847-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The debugfs file utilizes string helpers such as parse_int_array_user()
yet does not include the header.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/avs/debugfs.c b/sound/soc/intel/avs/debugfs.c
index 1767ded4d983..8c4edda97f75 100644
--- a/sound/soc/intel/avs/debugfs.c
+++ b/sound/soc/intel/avs/debugfs.c
@@ -10,6 +10,7 @@
 #include <linux/kfifo.h>
 #include <linux/wait.h>
 #include <linux/sched/signal.h>
+#include <linux/string_helpers.h>
 #include <sound/soc.h>
 #include "avs.h"
 #include "messages.h"
-- 
2.25.1

