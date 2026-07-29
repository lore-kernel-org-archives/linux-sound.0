Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2839E47D44E
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 10:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785322638; cv=none; b=HmAtxN1mEO7P/W/uRlkoQiJTnVIvmTGl+kSaftduu158ZOW44YEnppnpbRWKDUU0HGIoI68y/ZYd2fRvPBYv0dOcLUP27yKfWgkxV8Q+d2hnioIlrCUOEc8a4aQJjWAXnsVvxZftNK/D6Q4GYgGnWpV4/HMUPa1z8KOQ7rOeS6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785322638; c=relaxed/simple;
	bh=M3UZWr6C5Oj5mkoGd8VGU+mp1OxP8AISHHQXfqhmGVo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V9ZYNY06B1sbHUpSQRJgOarmgJv0SUt6p4EILplJJyk+MpLot/1H9+GVbPFYPWQNhLXDEYZQhQIEmIieIIGp+AFy24gJiyLF/DZxv8Zx4EhYn6dWiSrPq1H6DIaRSCMggSb6/uge1D971KKltaMk794um9iHNXi7WE9XrCnnCt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BnzUUtE3; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BnzUUtE3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785322636; x=1816858636;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M3UZWr6C5Oj5mkoGd8VGU+mp1OxP8AISHHQXfqhmGVo=;
  b=BnzUUtE31Sl/R7mILYGt/5qvNerCWqkLffxYnsa/cyhqG3igB2rkhK1w
   xsnLOOOOb5gc1E2dS2Jilq14kiloPBUOL71iwc3in9660zEAp/d+Ocpcm
   uGSHtGjkIg12utO+1H43xyMBH4cSfNz5GxcSR1Y56b709NHhkutFV9qM0
   CR+i8l+RYfeBsioE+mj5N+2aSyB0hISry25iRCELgt4/bjIFtvd32G+82
   FjQ68pAnEc018MWxuQpib82bpS+xOrPWVs/gDroSecThKV6cOXvuMtDrO
   csDYSUa1KOekZlFGFeymTzXUa4Mnpok6nm1UuDcK8YiU2btNyszo1g6rV
   A==;
X-CSE-ConnectionGUID: WNqspE0LRd+LxF/46Wmz6A==
X-CSE-MsgGUID: MMQ8HkMyTWqQHrzfQ+oRfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96583834"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="96583834"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 03:57:16 -0700
X-CSE-ConnectionGUID: Md9HB3S1QY244n7ug6nEtQ==
X-CSE-MsgGUID: mlnY5rxgR6yVMDKJH/0sYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="255675929"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa006.fm.intel.com with ESMTP; 29 Jul 2026 03:57:14 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 2/8] ASoC: Intel: catpt: Drop redundant else-if
Date: Wed, 29 Jul 2026 13:00:51 +0200
Message-Id: <20260729110057.342447-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260729110057.342447-1-cezary.rojewski@intel.com>
References: <20260729110057.342447-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the preceding if-statement ends with return,
there is no need for else-if.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/loader.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/catpt/loader.c b/sound/soc/intel/catpt/loader.c
index 880f62896997..79742dceef53 100644
--- a/sound/soc/intel/catpt/loader.c
+++ b/sound/soc/intel/catpt/loader.c
@@ -652,10 +652,10 @@ int catpt_boot_firmware(struct catpt_dev *cdev, bool restore)
 	if (!ret) {
 		dev_err(cdev->dev, "firmware ready timeout\n");
 		return -ETIMEDOUT;
+	}
 	/* Wake up does not mean FW is ready, an exception could occur. */
-	} else if (!cdev->ipc.ready) {
+	if (!cdev->ipc.ready)
 		return -EREMOTEIO;
-	}
 
 	/* update sram pg & clock once done booting */
 	catpt_dsp_update_srampge(cdev, &cdev->dram, cdev->spec->dram_mask);
-- 
2.34.1

