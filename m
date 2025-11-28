Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D151E3009FF
	for <linux-sound@vger.kernel.org>; Fri, 28 Nov 2025 09:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764321242; cv=none; b=mvC9jBMGtTJr+TXT1LQvhgFmMWy+UqICeMHFEmX2KrUPZyxLNSGhU+ikJAZXW4sw3sMXaQRt2fq4OEMIPQYgrClZB6S8U5FtdJAU3AgG/SxwyGqCcN3NqnYfZVp+xwG/GCbBOBoUlIvfVdeYuRttJ3RR0VD0IfigsoXyDJxHMUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764321242; c=relaxed/simple;
	bh=5LuWNsTXwWnfyjEKu6PB0IwTgn2/RqMDz0rCe6g42E8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RA9P9ysG69X86RcJNm/1wgbAQxqBfluN/Y5jICNrF4sWTSSUibfLl+P+/ZULxhbB+/K6hMwFlc6TzHyNPw/5smM26XCVmatk/f1lhn8LtJd/sH9yK7QUUCoYW7KpWxWsROk8EiBO+nMGR0pHou1x9F0BR2iWyg8DUYb4aN/WzOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iXJKbkSL; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iXJKbkSL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764321239; x=1795857239;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5LuWNsTXwWnfyjEKu6PB0IwTgn2/RqMDz0rCe6g42E8=;
  b=iXJKbkSL3Wa5j5pnhKAaRKTWExgGoX1Mxelimt8heOCv2YzI+xTVhW8h
   80bm6xmOJOP26fysJPw6vBKSOcsHQeBnqDgq0tPubtQelrpnSkE0ZAZjG
   jQqPjeumucpD+Tlm2X5EdZKekwyt0YIWIgJXH1PjV2g5WfQBvHgH/fh19
   UKjSIs3C1VXyK9rnkz1nS29wgT7vU1pPIMgM/qCgcbhXDt0ecAf/Mkyh2
   /pmnjQNGq2LpSsBflo70s4XA8cpnzHsqiJsdcwq4mwvD8KqJuaRaKhVtF
   ymd79Yf9I9ao9tUnZqc4UFoncp5PUFS2fQ6oW4xbgzroiv/Ki/wYunXpW
   w==;
X-CSE-ConnectionGUID: 6NxBD28BQ7KHatvjkBKxHA==
X-CSE-MsgGUID: bA/DsB1TScyD/kVcWNBy8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66428494"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66428494"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 01:13:55 -0800
X-CSE-ConnectionGUID: TmmD3QlRQmifdQ8oCFzY5w==
X-CSE-MsgGUID: Dvb4jmC5RLyCXLGYXkkZ2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="192680938"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa010.jf.intel.com with ESMTP; 28 Nov 2025 01:13:52 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 3/6] ASoC: Intel: catpt: Fix offset checks
Date: Fri, 28 Nov 2025 10:34:09 +0100
Message-Id: <20251128093412.3949374-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251128093412.3949374-1-cezary.rojewski@intel.com>
References: <20251128093412.3949374-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Verify if the entire block is found within DRAM, not just
the start of it.

Fixes: a9aa6fb3eb6c ("ASoC: Intel: catpt: Firmware loading and context restore")
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

