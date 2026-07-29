Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970CA47D44E
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 10:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785322643; cv=none; b=A2oT6otxgTduUXi7zjt8jCozX4ksrsF68gRMrnXjSHq94IKkDZOrbIyxWouZzCzHbz9W1mBJHXb86kjXifP/ksiEKk+rB8yfFDhvfBy/Rhy1HFxTAP9ihjdPZEnP7sD1xABveT1Mun79EbnAngCkVC/JLE6KC6q4sH2wMdz+HDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785322643; c=relaxed/simple;
	bh=7h9brUJ/Z0ovFPkp3dZsemOjUrAdizS99ZeeW0z0x6k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e0TSw8nn90/+Q8qRpuPdJT2FFCevl3A252Gu7BZc4D4MkawMEr+tKqBDRKkvWyrwg+HeSX2DeDTycUt9jthM4++cLIMmdNMBVOzBcXHRmOPZ13lakcbNIwqNTRjUVVDDtVaZUCt8dslMvFBV5jhJdAJk4yfoyPYrdIERQGSuXGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KwneELQz; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KwneELQz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785322642; x=1816858642;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7h9brUJ/Z0ovFPkp3dZsemOjUrAdizS99ZeeW0z0x6k=;
  b=KwneELQzyECDUCzcKgUdN7KO42t1oUu2t+FOLdnIVbPHJ8Z7GAHIkmvN
   GpH0ferlxp9/iJEuuFOXkfs03v5y5KwHEv9htb0aV5vmmOW8h1EcLL7ih
   TmMmqECc6rlWNwnxdtYEZwcyKXEXfJPIUwBnPhYb4hsI/UL7mH+vgNuMi
   BRmMWBrqlRULScx/l9RSvaCvfzY5Wa0olLUwVF9IIsHoKx8fYcbXraVVt
   vDBpj3thj6jWAmq0dZ2mZefv+NJieKZyd2ChcnM4pmZ8c6Q6cTg2hU1Eo
   Medd0f6hkE+Ytm7/TqvoPUY9/yaMjc+ZCNwQMPEsh1Kw+0T6Cxf4BAVNO
   g==;
X-CSE-ConnectionGUID: u0hB3UicRoKh8DXthmQBiQ==
X-CSE-MsgGUID: V7Fv8LIoQVWjqcKfjCM1mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96583850"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="96583850"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 03:57:21 -0700
X-CSE-ConnectionGUID: wTpJc1W/TIuUoZrsylpFuw==
X-CSE-MsgGUID: 8qGYkQWQRUqRfX2MgVEysA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="255675972"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa006.fm.intel.com with ESMTP; 29 Jul 2026 03:57:19 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 5/8] ASoC: Intel: catpt: Rename firmware loading functions
Date: Wed, 29 Jul 2026 13:00:54 +0200
Message-Id: <20260729110057.342447-6-cezary.rojewski@intel.com>
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

To make the firmware loading proceduce easier to understand, especially
around restoring DRAM context, rename the following:

catpt_load_images	-> catpt_request_dma_load_firmware
catpt_load_image	-> catpt_request_load_firmware
catpt_restore_fwimage	-> catpt_restore_dram_rodata
catpt_restore_memdumps	-> catpt_restore_dram_data
catpt_store_memdumps	-> catpt_store_dram_data

For the exact same reason, update a number of comments related to the
subject.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/loader.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/soc/intel/catpt/loader.c b/sound/soc/intel/catpt/loader.c
index 06c8b043e292..274af8fb8828 100644
--- a/sound/soc/intel/catpt/loader.c
+++ b/sound/soc/intel/catpt/loader.c
@@ -138,7 +138,7 @@ static int catpt_store_module_states(struct catpt_dev *cdev, struct dma_chan *ch
 	return 0;
 }
 
-static int catpt_store_memdumps(struct catpt_dev *cdev, struct dma_chan *chan)
+static int catpt_store_dram_data(struct catpt_dev *cdev, struct dma_chan *chan)
 {
 	int i;
 
@@ -184,7 +184,7 @@ int catpt_store_firmware_context(struct catpt_dev *cdev)
 	if (ret)
 		goto exit;
 
-	ret = catpt_store_memdumps(cdev, chan);
+	ret = catpt_store_dram_data(cdev, chan);
 	if (ret) {
 		dev_err(cdev->dev, "store memdumps failed: %d\n", ret);
 		goto exit;
@@ -232,7 +232,7 @@ catpt_restore_streams_context(struct catpt_dev *cdev, struct dma_chan *chan)
 	return 0;
 }
 
-static int catpt_restore_memdumps(struct catpt_dev *cdev, struct dma_chan *chan)
+static int catpt_restore_dram_data(struct catpt_dev *cdev, struct dma_chan *chan)
 {
 	int i;
 
@@ -267,9 +267,9 @@ static int catpt_restore_memdumps(struct catpt_dev *cdev, struct dma_chan *chan)
 	return 0;
 }
 
-static int catpt_restore_fwimage(struct catpt_dev *cdev,
-				 struct dma_chan *chan, dma_addr_t paddr,
-				 struct catpt_fw_block_hdr *blk)
+static int catpt_restore_dram_rodata(struct catpt_dev *cdev,
+				     struct dma_chan *chan, dma_addr_t paddr,
+				     struct catpt_fw_block_hdr *blk)
 {
 	struct resource r1 = {};
 	int i;
@@ -365,7 +365,7 @@ static int catpt_restore_basefw(struct catpt_dev *cdev,
 	print_hex_dump_debug(__func__, DUMP_PREFIX_OFFSET, 8, 4,
 			     basefw, sizeof(*basefw), false);
 
-	/* restore basefw image */
+	/* Restore IRAM and .rodata for DRAM based on the firmware image. */
 	for (i = 0; i < basefw->blocks; i++) {
 		struct catpt_fw_block_hdr *blk;
 
@@ -377,8 +377,8 @@ static int catpt_restore_basefw(struct catpt_dev *cdev,
 					       blk, false);
 			break;
 		default:
-			ret = catpt_restore_fwimage(cdev, chan, paddr + offset,
-						    blk);
+			ret = catpt_restore_dram_rodata(cdev, chan, paddr + offset,
+							blk);
 			break;
 		}
 
@@ -390,8 +390,8 @@ static int catpt_restore_basefw(struct catpt_dev *cdev,
 		offset += sizeof(*blk) + blk->size;
 	}
 
-	/* then proceed with memory dumps */
-	ret = catpt_restore_memdumps(cdev, chan);
+	/* Then proceed with DRAM .data saved before D3. */
+	ret = catpt_restore_dram_data(cdev, chan);
 	if (ret)
 		dev_err(cdev->dev, "restore memdumps failed: %d\n", ret);
 
@@ -568,8 +568,8 @@ static int catpt_load_firmware(struct catpt_dev *cdev,
 	return 0;
 }
 
-static int catpt_load_image(struct catpt_dev *cdev, struct dma_chan *chan,
-			    const char *name, bool restore)
+static int catpt_request_load_firmware(struct catpt_dev *cdev, struct dma_chan *chan,
+				       const char *name, bool restore)
 {
 	struct catpt_fw_hdr *fw;
 	struct firmware *img;
@@ -607,7 +607,7 @@ static int catpt_load_image(struct catpt_dev *cdev, struct dma_chan *chan,
 	return ret;
 }
 
-static int catpt_load_images(struct catpt_dev *cdev, bool restore)
+static int catpt_request_dma_load_firmware(struct catpt_dev *cdev, bool restore)
 {
 	struct dma_chan *chan;
 	int ret;
@@ -616,7 +616,7 @@ static int catpt_load_images(struct catpt_dev *cdev, bool restore)
 	if (IS_ERR(chan))
 		return PTR_ERR(chan);
 
-	ret = catpt_load_image(cdev, chan, cdev->spec->fw_name, restore);
+	ret = catpt_request_load_firmware(cdev, chan, cdev->spec->fw_name, restore);
 	if (ret)
 		goto release_dma_chan;
 
@@ -636,7 +636,7 @@ int catpt_boot_firmware(struct catpt_dev *cdev, bool restore)
 
 	catpt_dsp_stall(cdev, true);
 
-	ret = catpt_load_images(cdev, restore);
+	ret = catpt_request_dma_load_firmware(cdev, restore);
 	if (ret) {
 		dev_err(cdev->dev, "load binaries failed: %d\n", ret);
 		return ret;
-- 
2.34.1

