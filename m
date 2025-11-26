Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBC82D8793
	for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 09:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764149717; cv=none; b=hoHNtJS+XFa1LUZkUtlcrPz8kgiKCmsl1gOQuHApGLcqJU655qZDU0k/LIK+eS9vR4AcA5/emUTELeZB5TwAhRvd/VDjbIVBZyJm1Gvnr8lWdhOes5wHxal3+1mNmUDi3bd4yuZamUohbAQKeda6fgr6wD0SzrZX0v6yM6jDmF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764149717; c=relaxed/simple;
	bh=ZMrQDpg8vrUuwa7OuAdkHtHQGA0PAOKCgH8dx5zXMU8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oiSSWmDydwYhQRn389o2ymzBZRbrMIOvkK76n1LkVpTjhurJkZG55iMwSF3MU9SAiGFXGNfQwKoPYdEUBvMCxAGO46dvz/my+KQVZnf7irN7AKmVeAN1YUITZRs2C+2KhZGl2WI5Eqr2P1uRqlcL6cDwDqpeGRXCfYCleB7sL1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RtyGEv2Q; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RtyGEv2Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764149715; x=1795685715;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZMrQDpg8vrUuwa7OuAdkHtHQGA0PAOKCgH8dx5zXMU8=;
  b=RtyGEv2QdDvUTuHokyXXHcGQZVztaNbStYBJ1d2YphUOgW88OxD+c6Y0
   tl9Pga0rPN64rszIFwthUAfvrgBUFC31BomZKtqSt/Gu4GBrlPhoc9G5x
   HbtZyuW74EWRWax/iSOaRyFUnXVJqrnxfgQYSoaCk8Xj4X9jmtYGQFRtz
   udeuChSoUN6nwUKDSok8CK5ZpXsRmn/kSXt3GvpgufHmvyTwajii443KY
   Gaa8ZLqjv4y7HrPiIUussW8ODGA2PWfWLMJEgY1imhKZFBAuQ34qV06nF
   cby7JuiNXvdA/O/SyfWuGXfAIwJgJSOV3ey3ALTEIcIOARA6aUhjdT+UN
   A==;
X-CSE-ConnectionGUID: Mmb67TZiSM24rsPBiiZ20g==
X-CSE-MsgGUID: S4xWhRmbRs+1iFSxmK9zyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="68769285"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="68769285"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 01:35:14 -0800
X-CSE-ConnectionGUID: 4k9zhyjVQM+H262JHd/0Qg==
X-CSE-MsgGUID: trt+NgfARvCtlh6Dhd1L1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="216251693"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2025 01:35:12 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 1/6] ASoC: Intel: catpt: Fix offset checks
Date: Wed, 26 Nov 2025 10:55:18 +0100
Message-Id: <20251126095523.3925364-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251126095523.3925364-1-cezary.rojewski@intel.com>
References: <20251126095523.3925364-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Verify if the entire block is found within DRAM, not just
the start of it.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/loader.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/catpt/loader.c b/sound/soc/intel/catpt/loader.c
index 696d84314eeb..5804de1d89e3 100644
--- a/sound/soc/intel/catpt/loader.c
+++ b/sound/soc/intel/catpt/loader.c
@@ -216,7 +216,7 @@ static int catpt_restore_memdumps(struct catpt_dev *cdev, struct dma_chan *chan)
 			continue;
 
 		off = catpt_to_host_offset(info->offset);
-		if (off < cdev->dram.start || off > cdev->dram.end)
+		if (off < cdev->dram.start || off + info->size >= cdev->dram.end)
 			continue;
 
 		dev_dbg(cdev->dev, "restoring memdump: off 0x%08x size %d\n",
@@ -261,12 +261,12 @@ static int catpt_restore_fwimage(struct catpt_dev *cdev,
 			continue;
 
 		off = catpt_to_host_offset(info->offset);
-		if (off < cdev->dram.start || off > cdev->dram.end)
-			continue;
-
 		r2.start = off;
 		r2.end = r2.start + info->size - 1;
 
+		if (r2.start < cdev->dram.start || r2.end > cdev->dram.end)
+			continue;
+
 		if (!resource_intersection(&r2, &r1, &common))
 			continue;
 		/* calculate start offset of common data area */
-- 
2.25.1

