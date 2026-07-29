Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD40471419
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 10:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785322646; cv=none; b=WCHHKilMwXVGeULxteIvnIKRuQ4jtbnuzQ9GoEAN/OaUYEBUXfRYLXEm/4QH6lfYWLDJBmbBDSgiqqKZzHowvoOluKSuMcQ6PxWXJmNRDgSyohLGMXozMaF4i4S0fHqUECneoUQqxuWnGcdqhRqWcGa/2xzwLcysmj6v8ff/SYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785322646; c=relaxed/simple;
	bh=947ERleHWO+uGZOBDe8q2TotUWfP95bLoKITwOnbx88=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aU0u/IwCZeiKrvIoRzuDXuaErsYb+Im0aFDvhKk1nhBkk0r6WNRt/uWWkntETMst9HxJAMYA5PzMIZAaarPhoxtYqvt/hOk9lhdgZjbn7L2IiB89WWCPN0MhNlewz4VW6nVA9MvS+WZ2OnOoVIi+c6Fik2wQnGq4P7wwsU79a2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fuCZ60m+; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fuCZ60m+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785322644; x=1816858644;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=947ERleHWO+uGZOBDe8q2TotUWfP95bLoKITwOnbx88=;
  b=fuCZ60m+d2QZzpP265ElsvikII+Go7Q5Kmvj9SKaGvdFtUOytYrSmVcV
   x9nIlEqhPKpV14k8yZFAhIJ41v23MJsVJPvORbz+bHI/gw2rjROgVGln4
   Ai0IYJMO7ybUauW2zlyHmqeV6vUBuBPWhqzO7wn3SP4DN/Nweuap/D1gc
   v2LO+paaeYJ49sZmdtCMBsQ2brTmKG/MVBsOAaL0bF3vdN3QPz+ealNAz
   GVOvMzy3PUllNmL6OguiBIRgHONzSip84KBak9AWblnp/XSVjoWAU1puC
   69yiNOifQ4i+21EZWZNWjQTUgHlYQLclblGh1ubfvLABYk/XfBrUL22Hw
   A==;
X-CSE-ConnectionGUID: O/lTrsttT06qw3v/x0S9Rw==
X-CSE-MsgGUID: dZIstVrlRLKu6ssyU2/gvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96583857"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="96583857"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 03:57:23 -0700
X-CSE-ConnectionGUID: l8q7hNd3TVaea3fnIsuQBw==
X-CSE-MsgGUID: C4USxq2VSjiVOm/k1+etrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="255675984"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa006.fm.intel.com with ESMTP; 29 Jul 2026 03:57:21 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 6/8] ASoC: Intel: catpt: Streamline wording of offset variables
Date: Wed, 29 Jul 2026 13:00:55 +0200
Message-Id: <20260729110057.342447-7-cezary.rojewski@intel.com>
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

Two words represent is currently: 'offset' and 'off'. Be cohesive and
use one instead.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/loader.c | 48 ++++++++++++++++------------------
 1 file changed, 22 insertions(+), 26 deletions(-)

diff --git a/sound/soc/intel/catpt/loader.c b/sound/soc/intel/catpt/loader.c
index 274af8fb8828..e7ba9e1e60ae 100644
--- a/sound/soc/intel/catpt/loader.c
+++ b/sound/soc/intel/catpt/loader.c
@@ -359,7 +359,7 @@ static int catpt_restore_basefw(struct catpt_dev *cdev,
 				struct dma_chan *chan, dma_addr_t paddr,
 				struct catpt_fw_module_hdr *basefw)
 {
-	u32 offset = sizeof(*basefw);
+	u32 off = sizeof(*basefw);
 	int ret, i;
 
 	print_hex_dump_debug(__func__, DUMP_PREFIX_OFFSET, 8, 4,
@@ -369,16 +369,14 @@ static int catpt_restore_basefw(struct catpt_dev *cdev,
 	for (i = 0; i < basefw->blocks; i++) {
 		struct catpt_fw_block_hdr *blk;
 
-		blk = (struct catpt_fw_block_hdr *)((u8 *)basefw + offset);
+		blk = (struct catpt_fw_block_hdr *)((u8 *)basefw + off);
 
 		switch (blk->ram_type) {
 		case CATPT_RAM_TYPE_IRAM:
-			ret = catpt_load_block(cdev, chan, paddr + offset,
-					       blk, false);
+			ret = catpt_load_block(cdev, chan, paddr + off, blk, false);
 			break;
 		default:
-			ret = catpt_restore_dram_rodata(cdev, chan, paddr + offset,
-							blk);
+			ret = catpt_restore_dram_rodata(cdev, chan, paddr + off, blk);
 			break;
 		}
 
@@ -387,7 +385,7 @@ static int catpt_restore_basefw(struct catpt_dev *cdev,
 			return ret;
 		}
 
-		offset += sizeof(*blk) + blk->size;
+		off += sizeof(*blk) + blk->size;
 	}
 
 	/* Then proceed with DRAM .data saved before D3. */
@@ -402,7 +400,7 @@ static int catpt_restore_module(struct catpt_dev *cdev,
 				struct dma_chan *chan, dma_addr_t paddr,
 				struct catpt_fw_module_hdr *mod)
 {
-	u32 offset = sizeof(*mod);
+	u32 off = sizeof(*mod);
 	int i;
 
 	print_hex_dump_debug(__func__, DUMP_PREFIX_OFFSET, 8, 4,
@@ -412,7 +410,7 @@ static int catpt_restore_module(struct catpt_dev *cdev,
 		struct catpt_fw_block_hdr *blk;
 		int ret;
 
-		blk = (struct catpt_fw_block_hdr *)((u8 *)mod + offset);
+		blk = (struct catpt_fw_block_hdr *)((u8 *)mod + off);
 
 		switch (blk->ram_type) {
 		case CATPT_RAM_TYPE_INSTANCE:
@@ -423,7 +421,7 @@ static int catpt_restore_module(struct catpt_dev *cdev,
 					ALIGN(blk->size, 4));
 			break;
 		default:
-			ret = catpt_load_block(cdev, chan, paddr + offset,
+			ret = catpt_load_block(cdev, chan, paddr + off,
 					       blk, false);
 			break;
 		}
@@ -433,7 +431,7 @@ static int catpt_restore_module(struct catpt_dev *cdev,
 			return ret;
 		}
 
-		offset += sizeof(*blk) + blk->size;
+		off += sizeof(*blk) + blk->size;
 	}
 
 	return 0;
@@ -444,7 +442,7 @@ static int catpt_load_module(struct catpt_dev *cdev,
 			     struct catpt_fw_module_hdr *mod)
 {
 	struct catpt_module_type *type;
-	u32 offset = sizeof(*mod);
+	u32 off = sizeof(*mod);
 	int i;
 
 	print_hex_dump_debug(__func__, DUMP_PREFIX_OFFSET, 8, 4,
@@ -456,9 +454,9 @@ static int catpt_load_module(struct catpt_dev *cdev,
 		struct catpt_fw_block_hdr *blk;
 		int ret;
 
-		blk = (struct catpt_fw_block_hdr *)((u8 *)mod + offset);
+		blk = (struct catpt_fw_block_hdr *)((u8 *)mod + off);
 
-		ret = catpt_load_block(cdev, chan, paddr + offset, blk, true);
+		ret = catpt_load_block(cdev, chan, paddr + off, blk, true);
 		if (ret) {
 			dev_err(cdev->dev, "load block failed: %d\n", ret);
 			return ret;
@@ -473,7 +471,7 @@ static int catpt_load_module(struct catpt_dev *cdev,
 			type->state_size = blk->size;
 		}
 
-		offset += sizeof(*blk) + blk->size;
+		off += sizeof(*blk) + blk->size;
 	}
 
 	/* init module type static info */
@@ -490,7 +488,7 @@ static int catpt_restore_firmware(struct catpt_dev *cdev,
 				  struct dma_chan *chan, dma_addr_t paddr,
 				  struct catpt_fw_hdr *fw)
 {
-	u32 offset = sizeof(*fw);
+	u32 off = sizeof(*fw);
 	int i;
 
 	print_hex_dump_debug(__func__, DUMP_PREFIX_OFFSET, 8, 4,
@@ -500,7 +498,7 @@ static int catpt_restore_firmware(struct catpt_dev *cdev,
 		struct catpt_fw_module_hdr *mod;
 		int ret;
 
-		mod = (struct catpt_fw_module_hdr *)((u8 *)fw + offset);
+		mod = (struct catpt_fw_module_hdr *)((u8 *)fw + off);
 		if (strncmp(fw->signature, mod->signature,
 			    FW_SIGNATURE_SIZE)) {
 			dev_err(cdev->dev, "module signature mismatch\n");
@@ -512,12 +510,10 @@ static int catpt_restore_firmware(struct catpt_dev *cdev,
 
 		switch (mod->module_id) {
 		case CATPT_MODID_BASE_FW:
-			ret = catpt_restore_basefw(cdev, chan, paddr + offset,
-						   mod);
+			ret = catpt_restore_basefw(cdev, chan, paddr + off, mod);
 			break;
 		default:
-			ret = catpt_restore_module(cdev, chan, paddr + offset,
-						   mod);
+			ret = catpt_restore_module(cdev, chan, paddr + off, mod);
 			break;
 		}
 
@@ -526,7 +522,7 @@ static int catpt_restore_firmware(struct catpt_dev *cdev,
 			return ret;
 		}
 
-		offset += sizeof(*mod) + mod->mod_size;
+		off += sizeof(*mod) + mod->mod_size;
 	}
 
 	return 0;
@@ -536,7 +532,7 @@ static int catpt_load_firmware(struct catpt_dev *cdev,
 			       struct dma_chan *chan, dma_addr_t paddr,
 			       struct catpt_fw_hdr *fw)
 {
-	u32 offset = sizeof(*fw);
+	u32 off = sizeof(*fw);
 	int i;
 
 	print_hex_dump_debug(__func__, DUMP_PREFIX_OFFSET, 8, 4,
@@ -546,7 +542,7 @@ static int catpt_load_firmware(struct catpt_dev *cdev,
 		struct catpt_fw_module_hdr *mod;
 		int ret;
 
-		mod = (struct catpt_fw_module_hdr *)((u8 *)fw + offset);
+		mod = (struct catpt_fw_module_hdr *)((u8 *)fw + off);
 		if (strncmp(fw->signature, mod->signature,
 			    FW_SIGNATURE_SIZE)) {
 			dev_err(cdev->dev, "module signature mismatch\n");
@@ -556,13 +552,13 @@ static int catpt_load_firmware(struct catpt_dev *cdev,
 		if (mod->module_id > CATPT_MODID_LAST)
 			return -EINVAL;
 
-		ret = catpt_load_module(cdev, chan, paddr + offset, mod);
+		ret = catpt_load_module(cdev, chan, paddr + off, mod);
 		if (ret) {
 			dev_err(cdev->dev, "load module failed: %d\n", ret);
 			return ret;
 		}
 
-		offset += sizeof(*mod) + mod->mod_size;
+		off += sizeof(*mod) + mod->mod_size;
 	}
 
 	return 0;
-- 
2.34.1

