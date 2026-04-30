Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECA92868B5
	for <linux-sound@vger.kernel.org>; Thu, 30 Apr 2026 12:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777551065; cv=none; b=iOskCuW+bFgs9UwBQQR/199fCicOFxxFJc1EPgv58POKZ8fR3SoZntsR0QuolYDJlJr/uYPl78uJYnUi/ZTaSY+EP4Ylo67+WtAQkZcrKwAOuuNmbfViNcAmIuLmNovwQhyZXjp/Vj5Mou3NyEUga/u+kdHz2LYfDLB8rTlSq2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777551065; c=relaxed/simple;
	bh=siXxICERYXvFASDVI9XkiSguYLIhSlF+r6SW3WAPYSs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bD5OSk3LTajLzBahqvbMQyE6JRTRjM9gnR1EG0SuC22eEn7AaX/ZRoJwt/zn0D8iaNxSPH9zg76BlaMVq0gyh3g9biqzu7yOGEXl/ikNSCAPR7h2dl6vw1fkkt1QO3junR+44Vvdh/qT+ghweyQownj0vD4y/69B677nG8sIuJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j+87ZH3k; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j+87ZH3k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777551064; x=1809087064;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=siXxICERYXvFASDVI9XkiSguYLIhSlF+r6SW3WAPYSs=;
  b=j+87ZH3kb6WarfcYpzeM3OTzaWKfntVveq1tk0hxEmNhpxB8JFWcMxvA
   J/K2/66wErUQ1QpNrOYrkeZCbIVF1+OC49/5CmeKNvOYTk0TXadLuvhR5
   5cXspKObIArwIYvIwTgcukYt9Dm02i120op1xKmz7ZvB7YdlYympjuIBQ
   B1fhqBdaIIcJvHC7mPe4ihGshsBQKUaCnZ28v15bs/cFd4LLqNaYXdCzY
   EOoh7LXrKkHw0pKw3VJFsAWcRg1JsbbU/uebmx48NE0oSupEBfn36syl5
   HURMWzaHyKyas9C4s1HPAxzdfkwQONN8AxWGaf3SgRQmDIBkJDdlvqhGK
   g==;
X-CSE-ConnectionGUID: Gsc0tkpwQRqmUaVUj04Itw==
X-CSE-MsgGUID: lcRb2xKXSoua72i7YmJuvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78365443"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="78365443"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 05:10:58 -0700
X-CSE-ConnectionGUID: mHvXKOMGQe23bp8/1oAsXQ==
X-CSE-MsgGUID: WQAStNzuRY2yZ+MwEptiug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="264934474"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 05:10:55 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	flove@realtek.com,
	derek.fang@realtek.com
Subject: [PATCH] ASoC: sdw_utils: avoid the SDCA companion function not supported failure
Date: Thu, 30 Apr 2026 20:10:43 +0800
Message-ID: <20260430121043.552241-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Derek Fang <derek.fang@realtek.com>

Treat the companion amp as generic AMP until full support for companion
amp is added.

Signed-off-by: Derek Fang <derek.fang@realtek.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 1637cc3f3d59..849ae876d7a4 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -1608,6 +1608,7 @@ int asoc_sdw_get_dai_type(u32 type)
 	switch (type) {
 	case SDCA_FUNCTION_TYPE_SMART_AMP:
 	case SDCA_FUNCTION_TYPE_SIMPLE_AMP:
+	case SDCA_FUNCTION_TYPE_COMPANION_AMP:
 		return SOC_SDW_DAI_TYPE_AMP;
 	case SDCA_FUNCTION_TYPE_SMART_MIC:
 	case SDCA_FUNCTION_TYPE_SIMPLE_MIC:
-- 
2.43.0

