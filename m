Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3162FFF84
	for <linux-sound@vger.kernel.org>; Fri, 28 Nov 2025 09:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764321243; cv=none; b=NsNcXeeVuCOU7tUTK8HbT582Gvvmxxusz9ixC3YC10WctWDekx5OIF8LR2j9qx9pouThNYKveRBCN+ANPrjFUie4/V1JWRXU9467QbLWMPP4bM0R7SxDybYZcoquJGuZErk05CTQgxUFKOyJuz78ycvkaZaR1DlcpIAyHelSqMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764321243; c=relaxed/simple;
	bh=Mf2vdtLCeaGEOzSx2qPKXfd5SmeItw81kCGPolNHqlo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dJwhY2dfKBQzMNAqriAyN8gJM9Xgy5sVMuJzw20cB1ShRurDSt9VTa4Je73uUwtRwx1LkL2wWLwoHluIxFaEvHaayJzRAr19yR8i2P+ALLsJkd5QWGnod2mdJXzsyaKG8eSK84qg/BYOnUYKvKrqwSUK/fdm/CjOh50JdBv5hiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N8c2nmac; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N8c2nmac"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764321240; x=1795857240;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Mf2vdtLCeaGEOzSx2qPKXfd5SmeItw81kCGPolNHqlo=;
  b=N8c2nmacgid91ypCM/E4JBVRFCS/XSmazmKRFk0vOW+m+opfX9FgLtoc
   lravvRNKTCSHN3VLYBx7BJJZZ0UwE6IH/uT3YiN27Id8qeHAejYv9IdGx
   7yAEGC3z312GHfNv3sNLn21bSDosSz3iY6B8AyRpDvIXvIby3WK9K+SFw
   85mD75uONk2b8xNMxH9AdQwwv/eRoWbNLE4CXRXHKZEBP0WS0fm9oMQG0
   ic6okcqkFjafIdCGPnZPfoxF0J8mrmoGPXxZecE55wQ3OUgVTnz/BJoEo
   w2dIJqrZYkFHLMYV4fJvKZAjE605iztPyLyWwGZ/4RoZYSRPXEH8TzNEy
   w==;
X-CSE-ConnectionGUID: Hd8W/r9lQMSHKa+u5K2nDw==
X-CSE-MsgGUID: gqzfy0MKSU6HwFv8EUfn0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66428506"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66428506"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 01:13:58 -0800
X-CSE-ConnectionGUID: mFvXmFTVQY+vuVJEpyHANw==
X-CSE-MsgGUID: COxTM8QnRU65CxC/ccp0UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="192680959"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa010.jf.intel.com with ESMTP; 28 Nov 2025 01:13:55 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 4/6] ASoC: Intel: catpt: Switch to resource_xxx() API
Date: Fri, 28 Nov 2025 10:34:10 +0100
Message-Id: <20251128093412.3949374-5-cezary.rojewski@intel.com>
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

There is a number of interfaces available for manipulating instances of
struct resource. To improve readability, move away from manual editing
in favor of the common interface.

While at it, adjust spacing so that both code blocks, while found in
separate functions, looks cohesive.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/loader.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/catpt/loader.c b/sound/soc/intel/catpt/loader.c
index 5804de1d89e3..6fd1a32f3863 100644
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
@@ -239,32 +241,31 @@ static int catpt_restore_fwimage(struct catpt_dev *cdev,
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
+
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

