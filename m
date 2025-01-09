Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CBF217663
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 12:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736424497; cv=none; b=uf1X32V9N1Cy1oxFjPtCX+Ij554L5g/e1oiNtsejxrV55+XjJVfAS1GnL14XM7Sdo+aP9dlZBfKGdaUlL06+qpPvVuwDutpn+PBZFePucaBLEGzqZ65Ufn0N5t6z4RdCCOjHGWnnN4BwByyEpbDPT2Z2hdm0QbqghoQh72nTCF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736424497; c=relaxed/simple;
	bh=ruLNefVr99qv3YYFJhlKHo929NfoWA9c8LmA3OvEhHQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FX/kgkWOOe87prjyVwRE6tlcCds7Cewo2CaisCvySw7mlLwgS/Z6Czd2fV7Hf8zXWJT+OV4p/GGNIrFhCFIyinfM1y2nzLLXOF2U6aH0SDWXbZS+n8Q4JHvIDgSeS/mQcKSwJwkNnDvCZz8bnWhV9Vi/ZD/F8nF8Sv7B1SmYdQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JF2uUUIF; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JF2uUUIF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736424496; x=1767960496;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ruLNefVr99qv3YYFJhlKHo929NfoWA9c8LmA3OvEhHQ=;
  b=JF2uUUIFVZqZp0AFHayAIuagv5LBz3whKoeItYCTq5Su67DK7QPDYdi1
   aUlVQJgpEtdd2fN0C3yVNQ4I5+7miOSPq1WpGk/z5A1qOjKQaZkikMbIF
   TAtSMdOOLiMyaWkVRiec39aKTDcpW7JbDpc6lNvbi409n5ruYLD3v9+Ae
   ndAf4cu+fBht7j0cfxZZeLjGdozyh/DP+AioylZyuXN7gSMLEcx9xO1SL
   4hRJw1MU3zns+OUtpHSXpESNhjklU3btGS0aC9HOf8uDXnCfQceMb03lp
   2xhXRCmZmSf18As5Nzk7ftMvrKGe1gsWXq1L3zQFkT1B/cMPWxxjFTuDr
   Q==;
X-CSE-ConnectionGUID: mdSguAG7R+yE72HpB5OQpQ==
X-CSE-MsgGUID: diJTKJ9aSxekVbdl4XWd2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="47179564"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="47179564"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 04:08:15 -0800
X-CSE-ConnectionGUID: h4sJbkdBQh6Iz9piMk3h3A==
X-CSE-MsgGUID: hKOqNiP2QQO5q5VFMFY3mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140710290"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa001.jf.intel.com with ESMTP; 09 Jan 2025 04:08:13 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 03/13] ASoC: Intel: avs: Fix theoretical infinite loop
Date: Thu,  9 Jan 2025 13:22:06 +0100
Message-Id: <20250109122216.3667847-4-cezary.rojewski@intel.com>
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

While 'stack_dump_size' is a u32 bitfield of 16 bits, u32 has a bigger
upper bound than the type u16 of loop counter 'offset' what in theory
may lead to infinite loop condition.

Found out by Coverity static analyzer.

Fixes: c8c960c10971 ("ASoC: Intel: avs: APL-based platforms support")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/apl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/apl.c b/sound/soc/intel/avs/apl.c
index 27516ef57185..d443fe8d51ae 100644
--- a/sound/soc/intel/avs/apl.c
+++ b/sound/soc/intel/avs/apl.c
@@ -125,7 +125,7 @@ int avs_apl_coredump(struct avs_dev *adev, union avs_notify_msg *msg)
 	struct avs_apl_log_buffer_layout layout;
 	void __iomem *addr, *buf;
 	size_t dump_size;
-	u16 offset = 0;
+	u32 offset = 0;
 	u8 *dump, *pos;
 
 	dump_size = AVS_FW_REGS_SIZE + msg->ext.coredump.stack_dump_size;
-- 
2.25.1

