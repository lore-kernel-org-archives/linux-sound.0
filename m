Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3EE471419
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 10:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785322641; cv=none; b=Nc+tOM4gHTtzdPSQDq9ad4AZ3V1MlP6IyycJVSQrOnbV+lyBYOr+UVxKqMoB2iWnC703IUdIr9qyGw0FfCMcI4BsZVD2hDY3ccT6RjqWadKMm6P91bu+L9UDc9G++EGG0W/Lp08Oit9vekblgbNwho418kgiVvb8Nah76PbVSmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785322641; c=relaxed/simple;
	bh=5N3S1ZTMiObA9ymD51hDNljX/bXPo9GeuP8vvXntXoQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U+7WBcwR+gZk9HbkXc8nAkWb4A+/lKgHcpriB8fWB4wV3+OnyEFlJyNxcXAImBi9uRUyaIA1MSzXbRJh5h5+gvMllvm1FMw19eDTnzLCjo2yTkfyGQGI4Bue3hiImo6ZDocaa/QQMjvnYhRakdm7OUFf3zX6gduwJvvJ6N1s1sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AgOpMZ6l; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AgOpMZ6l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785322640; x=1816858640;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5N3S1ZTMiObA9ymD51hDNljX/bXPo9GeuP8vvXntXoQ=;
  b=AgOpMZ6ld88JYNtwPn3fTh/Y8epjunahsHhSG/YBvAU0wspfCwR9vFBb
   VFDX8xsphcg13mHeuf4zM00nMWjtdJ+JKgwD7s7K4EFqxVzacBmLaQ768
   bnr3DmRQrsF9Z39JTACmt439Pgv1xOYKqZGqSB4eoXaf3hJnKcNkA2xQQ
   nGEm0Ro0fF9fCdKz23hTOzKhCbTtcnJlp2nl8xNw0GjZzqK057rvQp0lG
   sOUIYc0oDNWKCupw6bRQ/U/oSi847LCcu4tjddZzAKGa4pih2rocMEGn4
   senUEVw01Tt39Xa5dI9jftruxRjVnte3IN4vYGv7BHYxTxW1R7ROw1B7R
   Q==;
X-CSE-ConnectionGUID: onnYwST9SAOQgn093LJg7Q==
X-CSE-MsgGUID: APC6RkklRZKZh0dn4qpxQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96583845"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="96583845"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 03:57:19 -0700
X-CSE-ConnectionGUID: qcU3g8X1RVKnPDqXtn34dw==
X-CSE-MsgGUID: N1B7yftdQHyygkqHmaCumg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="255675960"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa006.fm.intel.com with ESMTP; 29 Jul 2026 03:57:18 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 4/8] ASoC: Intel: catpt: Rename module header struct
Date: Wed, 29 Jul 2026 13:00:53 +0200
Message-Id: <20260729110057.342447-5-cezary.rojewski@intel.com>
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

Goal is to match the name of its equivalent on the firmware side.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/loader.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/catpt/loader.c b/sound/soc/intel/catpt/loader.c
index 775781489ded..06c8b043e292 100644
--- a/sound/soc/intel/catpt/loader.c
+++ b/sound/soc/intel/catpt/loader.c
@@ -26,7 +26,7 @@ struct catpt_fw_hdr {
 	u32 reserved[4];
 } __packed;
 
-struct catpt_fw_mod_hdr {
+struct catpt_fw_module_hdr {
 	char signature[FW_SIGNATURE_SIZE];
 	u32 mod_size;
 	u32 blocks;
@@ -357,7 +357,7 @@ static int catpt_load_block(struct catpt_dev *cdev,
 
 static int catpt_restore_basefw(struct catpt_dev *cdev,
 				struct dma_chan *chan, dma_addr_t paddr,
-				struct catpt_fw_mod_hdr *basefw)
+				struct catpt_fw_module_hdr *basefw)
 {
 	u32 offset = sizeof(*basefw);
 	int ret, i;
@@ -400,7 +400,7 @@ static int catpt_restore_basefw(struct catpt_dev *cdev,
 
 static int catpt_restore_module(struct catpt_dev *cdev,
 				struct dma_chan *chan, dma_addr_t paddr,
-				struct catpt_fw_mod_hdr *mod)
+				struct catpt_fw_module_hdr *mod)
 {
 	u32 offset = sizeof(*mod);
 	int i;
@@ -441,7 +441,7 @@ static int catpt_restore_module(struct catpt_dev *cdev,
 
 static int catpt_load_module(struct catpt_dev *cdev,
 			     struct dma_chan *chan, dma_addr_t paddr,
-			     struct catpt_fw_mod_hdr *mod)
+			     struct catpt_fw_module_hdr *mod)
 {
 	struct catpt_module_type *type;
 	u32 offset = sizeof(*mod);
@@ -497,10 +497,10 @@ static int catpt_restore_firmware(struct catpt_dev *cdev,
 			     fw, sizeof(*fw), false);
 
 	for (i = 0; i < fw->modules; i++) {
-		struct catpt_fw_mod_hdr *mod;
+		struct catpt_fw_module_hdr *mod;
 		int ret;
 
-		mod = (struct catpt_fw_mod_hdr *)((u8 *)fw + offset);
+		mod = (struct catpt_fw_module_hdr *)((u8 *)fw + offset);
 		if (strncmp(fw->signature, mod->signature,
 			    FW_SIGNATURE_SIZE)) {
 			dev_err(cdev->dev, "module signature mismatch\n");
@@ -543,10 +543,10 @@ static int catpt_load_firmware(struct catpt_dev *cdev,
 			     fw, sizeof(*fw), false);
 
 	for (i = 0; i < fw->modules; i++) {
-		struct catpt_fw_mod_hdr *mod;
+		struct catpt_fw_module_hdr *mod;
 		int ret;
 
-		mod = (struct catpt_fw_mod_hdr *)((u8 *)fw + offset);
+		mod = (struct catpt_fw_module_hdr *)((u8 *)fw + offset);
 		if (strncmp(fw->signature, mod->signature,
 			    FW_SIGNATURE_SIZE)) {
 			dev_err(cdev->dev, "module signature mismatch\n");
-- 
2.34.1

