Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CBD1DFE1B
	for <linux-sound@vger.kernel.org>; Fri, 13 Dec 2024 13:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734095828; cv=none; b=DMb6p369EMqMrpO7ZeGfeF0dgk79GxPeEuaQxjrPdV9OQIWK9PvxYQ8lmZ6q+zq476FRqvP5EUSmA4dyUx+CJMlkaVezZ4D015o16aBW8XTPVDw+jMFGW3q4/9ndC3ifyKVlEqNKJGhEk92PDOHKF+2IQg13r4F7B2u/KUl1fjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734095828; c=relaxed/simple;
	bh=zSfN68ZdNXgLVPbtlmhUNbDpOXKn91KKmPJPPehx+UE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xac+nQPifk191tv+18peKOEnGjC2/EEY3dZ3RDpMqdQNd/QysErHNmUAa6IuWu0Nj9pfqozSaukwm8ymz+sy3oJlxPYWWAbiCD3DE3IKLF2Bny9sb+1WfDBWi0227tLkXfTn3fnPTwu5rhWNR/t0u/R1zvKMcFLOvMzfbr4RpBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GMQWPnx+; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GMQWPnx+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734095827; x=1765631827;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zSfN68ZdNXgLVPbtlmhUNbDpOXKn91KKmPJPPehx+UE=;
  b=GMQWPnx+YaX3zPSSsPz1fkACm254sgCYltcmPrqohkXutk5XO4JZmGu8
   frSaqIFxWTlvs5Gs1zrYEkFO1hVKZi2nuctCSydrE9ye9de55W+4t60T7
   WhyNwhE9jCl9oVqk5bu09RbgAdN74SkFDB3P+zstRPJuXip1iL22QlmDx
   9VLX+v2u1ont50niSYb4ZkJq9nZi3pCp8lovKsmCKpStIhxIIXAtV6/Qq
   U8Yy/Kk4XiDMGZtpY42wU6vuQCDwR3nACPfK6e+FbPUkA1unuo6ZfJJMk
   +Ntb1GXLd4bt93fxQumXius12ROHKlWvJLOOe2kGt3NtUwm6wdNvUwmXj
   Q==;
X-CSE-ConnectionGUID: oVcm+uctR6+nr9SaMwEGvw==
X-CSE-MsgGUID: 3GVG4v4oTgO0ECgSoPT6bQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45019945"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45019945"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 05:17:07 -0800
X-CSE-ConnectionGUID: +AJT9sK0Rs2PtFd2D7Z1ew==
X-CSE-MsgGUID: B2TyM/YyRwmdW0ecrDtUVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133908831"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.245.190])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 05:17:04 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH] ASoC: SOF: sof-priv: Remove unused SOF_DAI_STREAM() and SOF_FORMATS
Date: Fri, 13 Dec 2024 15:17:17 +0200
Message-ID: <20241213131717.24071-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following definitions have no users: SOF_DAI_STREAM() and SOF_FORMATS,
they can be dropped from the header file.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/sof-priv.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 843be3b6415d..abbb5ee7e08c 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -76,14 +76,6 @@ bool sof_debug_check_flag(int mask);
 #define SOF_IPC_DSP_REPLY		0
 #define SOF_IPC_HOST_REPLY		1
 
-/* convenience constructor for DAI driver streams */
-#define SOF_DAI_STREAM(sname, scmin, scmax, srates, sfmt) \
-	{.stream_name = sname, .channels_min = scmin, .channels_max = scmax, \
-	 .rates = srates, .formats = sfmt}
-
-#define SOF_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE | \
-	SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_FLOAT)
-
 /* So far the primary core on all DSPs has ID 0 */
 #define SOF_DSP_PRIMARY_CORE 0
 
-- 
2.47.1

