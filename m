Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF29828E5
	for <linux-sound@vger.kernel.org>; Fri, 21 Nov 2025 11:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763724196; cv=none; b=eOYhOaFyldnpWOXgFqxE+25XlzrVakyRffCshkHepS1XXafFRuojLXEOJ+1ir/ATK7atOQ6CVU/2qr8thv2wuvydMpcrBgfd7gVQFduT1n9Nhf9/gs4C8YXRoYD8xaY3MWzFErCiPyvWg/Q6WzYi9KLjMSQ7YKxZ0jmhdOkU58M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763724196; c=relaxed/simple;
	bh=yFt474ayWIpyQ2EFXwoYISZURpey4fUODaj2EkDv7W4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l1GkDRRt8z1dhl6sjsAYchJT+rfx7BX7rl4cCy2Xfs4mlwTeHIaEgSeUOB7WeJt8v1bcTz1+J3OSO06kDeyh0pqr626nqa9h7RDeIX4WxJUxHOYidXfyT/Z5+nk2m0Hq+WWXvB/rrNADYNnWZgy6SVd9vL31RydwqFwRK6WrSK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HAWkcuz2; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HAWkcuz2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763724194; x=1795260194;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yFt474ayWIpyQ2EFXwoYISZURpey4fUODaj2EkDv7W4=;
  b=HAWkcuz2WKL4o+Gdm9XbQL7keL38ZIJuSV3MKNtu92HTtsUlsUbjXEq3
   ehYbpjEcSTowTyVqDUn/cUVHHdFaw6hry9MuRaAN7pcr3LIDJQmWMtd8A
   gY6/u5kKCudOAQdbjbxtnbg+xKFuzWd9Yro351e5qKO9oeoAeCAnFVqcz
   c0vvGl3uSugmHg3Hn7uV77g7UtYYn8D5R2bDJ6CEfoWvmzNB2KQRd+Wq6
   UKS5aiqwcM5EbVMsKDxbYoU7H0u30Ou2wwCQVrwkrclbB5peTLPwKdYag
   S/MCsqm2GAFYgdLE67xvEeCG0x8gDnjZiHsRFq5xLqHGZtqwiaJJg2DII
   w==;
X-CSE-ConnectionGUID: Y8DqnLMKTOSDV+PnNgIrRw==
X-CSE-MsgGUID: LIvPDnEtTzm5p3bqL8+66Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65845910"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="65845910"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 03:23:12 -0800
X-CSE-ConnectionGUID: udkyypUGTFGTfN1jF/2n9A==
X-CSE-MsgGUID: pBI4pZ3+RQ6BkMDLuCcrZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="191462832"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa009.jf.intel.com with ESMTP; 21 Nov 2025 03:23:11 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 1/6] ASoC: Intel: catpt: Fix offset checks
Date: Fri, 21 Nov 2025 12:43:26 +0100
Message-Id: <20251121114331.3841335-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251121114331.3841335-1-cezary.rojewski@intel.com>
References: <20251121114331.3841335-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Verify if the entire block is found within DRAM, not just the start of
it.

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

