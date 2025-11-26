Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8CDCA4E
	for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 09:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764149717; cv=none; b=RjD65XWG9ifv/48fIeXl1rp+skzsd6ujnJZnt3FvZUvvQBwycxkmo5tJjWnY3dZ7rBPUx91j6Cb5EwAZvIq52NoDVgUU4wgIHLgD9nP2tw3x6KXmfi3n4exOqkBXbjl57egUPUO7OmLH3jrLlJxCKZOLnVTRisDBfThwqFdu7Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764149717; c=relaxed/simple;
	bh=zptKmAmGcbarKeTpimax7qcMiDQO6W7cRYo7mNvg0J8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nm2w6I+X6gkJ2RRst6Km6rpp5LyTsU5yinlpIjG0eg8yC5SwNYTmb5SNGPNDIPd27nx3JnUguaUzGMLbqCDaSIG1OOE2pzfXWkuQzrIGWYTVlRhORP5xdTts6Qx9+7YqbKfPzhakJeWuAeyFbVlibMzqajnHBW1ZYI2BDi46+KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=InUbT76n; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="InUbT76n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764149716; x=1795685716;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zptKmAmGcbarKeTpimax7qcMiDQO6W7cRYo7mNvg0J8=;
  b=InUbT76neg+mr9MY5is4U4mIzslTX8gJRZN/SgPMhbd3XVI1vLGx9uIB
   pUdvNunSVwyjogY0qKDbc4iqPlgwxHZ1mmQnCYEFX91ID129g6Tbn7+Ll
   SV6YpekHgtOWKEijqxoQJzZQ7y2AVpj810WoCG7nwDWD9XW5EZ1LmDu5M
   rUw4g48Ifc6iQp/DXfnqD8SFB6J/dLmkiwkB9zD7kkk0HzbSXXonInnT7
   PN3sTbTsEudP0PUD6lFvCxJTw0Pt/v0o/9esNE+FdwpFtBdy30nrEUESz
   1rUwhjh/If0Bc04Z1P5fk6wqTZkviL/US7Ldu6qNOWO1CREq/u/tc6WAc
   w==;
X-CSE-ConnectionGUID: WIIvDuOlSr+i7BbNuylxbQ==
X-CSE-MsgGUID: tanH+oL2Q16oPDdMMkcgvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="68769291"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="68769291"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 01:35:15 -0800
X-CSE-ConnectionGUID: MMR/ITuHRmWJ2WSMSzaxVw==
X-CSE-MsgGUID: lJNhfsXLRw2w/Xb6MHAd8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="216251702"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2025 01:35:14 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 2/6] ASoC: Intel: catpt: Switch to resource_xxx() API
Date: Wed, 26 Nov 2025 10:55:19 +0100
Message-Id: <20251126095523.3925364-3-cezary.rojewski@intel.com>
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

There is a number of interfaces available for manipulating instances of
struct resource. To improve readability, move away from manual editing
in favor of the common interface.

While at it, adjust spacing so that both code blocks, while found in
separate functions, looks cohesive.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/loader.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/catpt/loader.c b/sound/soc/intel/catpt/loader.c
index 5804de1d89e3..f5705cd2c1e1 100644
--- a/sound/soc/intel/catpt/loader.c
+++ b/sound/soc/intel/catpt/loader.c
@@ -208,6 +208,7 @@ static int catpt_restore_memdumps(struct catpt_dev *cdev, struct dma_chan *chan)
 
 	for (i = 0; i < cdev->dx_ctx.num_meminfo; i++) {
 		struct catpt_save_meminfo *info;
+		struct resource r = {};
 		u32 off;
 		int ret;
 
@@ -216,7 +217,8 @@ static int catpt_restore_memdumps(struct catpt_dev *cdev, struct dma_chan *chan)
 			continue;
 
 		off = catpt_to_host_offset(info->offset);
-		if (off < cdev->dram.start || off + info->size >= cdev->dram.end)
+		resource_set_range(&r, off, info->size);
+		if (!resource_contains(&cdev->dram, &r))
 			continue;
 
 		dev_dbg(cdev->dev, "restoring memdump: off 0x%08x size %d\n",
@@ -239,32 +241,30 @@ static int catpt_restore_fwimage(struct catpt_dev *cdev,
 				 struct dma_chan *chan, dma_addr_t paddr,
 				 struct catpt_fw_block_hdr *blk)
 {
-	struct resource r1, r2, common;
+	struct resource r1 = {};
 	int i;
 
 	print_hex_dump_debug(__func__, DUMP_PREFIX_OFFSET, 8, 4,
 			     blk, sizeof(*blk), false);
 
-	r1.start = cdev->dram.start + blk->ram_offset;
-	r1.end = r1.start + blk->size - 1;
+	resource_set_range(&r1, cdev->dram.start + blk->ram_offset, blk->size);
 	/* advance to data area */
 	paddr += sizeof(*blk);
 
 	for (i = 0; i < cdev->dx_ctx.num_meminfo; i++) {
 		struct catpt_save_meminfo *info;
+		struct resource common = {};
+		struct resource r2 = {};
 		u32 off;
 		int ret;
 
 		info = &cdev->dx_ctx.meminfo[i];
-
 		if (info->source != CATPT_DX_TYPE_FW_IMAGE)
 			continue;
 
 		off = catpt_to_host_offset(info->offset);
-		r2.start = off;
-		r2.end = r2.start + info->size - 1;
-
-		if (r2.start < cdev->dram.start || r2.end > cdev->dram.end)
+		resource_set_range(&r2, off, info->size);
+		if (!resource_contains(&cdev->dram, &r2))
 			continue;
 
 		if (!resource_intersection(&r2, &r1, &common))
-- 
2.25.1

