Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0453EEACE
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 09:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875148; cv=none; b=aFW3TXCuax+DJ4f75Zuxtvn0DIWfiuSL7CgyB7RAb2EaO2V2FEtnIxV0xQBCg5/pHSglFKgDg0/vOx2X4L51VDkc4e8vICetWRufeV5zhzcFF50RySbBg7qrYlpQxg/dAhkabVii3QCpBDZNZ+FONCKIvbwpdk4Zji3lBY2qLyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875148; c=relaxed/simple;
	bh=N+Ygf8kS9sunfd4QZLfrfxTaoEPNsM9ZuY5NNfVFY0Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Whbc0v8U6C08oQjUaTAX+WX1IGwxE7+SDg9gU21F2g/L9m2CWAn3zg89IrUbOzsFsqzGM65mXboKogvXQK0Fek1Ju2zvK3it56Aa5w9p7qlaL7R60lag/Q0hhXpgBsfi4M1yPaoYUW59+7VkYcLyIuXG3YhHh0QO8LQ5dVNwJcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CuD6FUXP; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CuD6FUXP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779875147; x=1811411147;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=N+Ygf8kS9sunfd4QZLfrfxTaoEPNsM9ZuY5NNfVFY0Y=;
  b=CuD6FUXPOOvZq+4rzXamtYqmgqPq2Uhee8LDU7INVB/dK732r1gKAKX/
   AYBkqH7gHRDbddxrKUCyDSmKEm0+awSkFN5ajJ529umsbcc5ln6BmQJD/
   tY36g4dHKrCkYrCfBqyeK+mvA+0BZESF1UcKxPzFXxQJ2i/znbP+8zXLQ
   1rV5sZnBBhdNsuSbHNntk5Ph14Vh5AfHV0Ym3Q8nnJULPHiveoBVwuPc0
   ShjYUMxfcRGSq0Y9kPraz9xKixjEVLG2Ghyn8t8XI0Q61+/SS2Ul9kRut
   zG901ZBEmki6+kHni3lW6GmCt0eAlagJIAT8u1jgCjf19juMMMJ9s8ZLQ
   g==;
X-CSE-ConnectionGUID: cBaApgaPTfGnGCEHov5BXQ==
X-CSE-MsgGUID: 0pqlP30QRj+G2hslVUudgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="84592681"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="84592681"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 02:45:47 -0700
X-CSE-ConnectionGUID: 0IeheZPoTqSCv9JTCDPTsA==
X-CSE-MsgGUID: CugnxPqaQDux/1RwG8eDaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="272519661"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa002.jf.intel.com with ESMTP; 27 May 2026 02:45:44 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 1/3] ASoC: Intel: catpt: Complete coredump handling
Date: Wed, 27 May 2026 11:47:05 +0200
Message-Id: <20260527094707.1432195-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260527094707.1432195-1-cezary.rojewski@intel.com>
References: <20260527094707.1432195-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An exception may occur during the firmware booting procedure.  In such
case the firmware sends COREDYMP_REQUESTS and expects the driver to dump
relevant information and finish with the COREDUMP_RELEASE write.

To distinguish such situation from generic timeout, always signal
fw_ready completion when a coredump request is received and translate
it to -EREMOTEIO in catpt_boot_firmware().

The "FW READY" print makes the success clearly visible even when
the event-traces are not enabled.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/dsp.c       |  5 +++++
 sound/soc/intel/catpt/ipc.c       |  3 +++
 sound/soc/intel/catpt/loader.c    |  3 +++
 sound/soc/intel/catpt/registers.h | 12 ++++++++++++
 4 files changed, 23 insertions(+)

diff --git a/sound/soc/intel/catpt/dsp.c b/sound/soc/intel/catpt/dsp.c
index 677f348909c8..e7c577510865 100644
--- a/sound/soc/intel/catpt/dsp.c
+++ b/sound/soc/intel/catpt/dsp.c
@@ -536,6 +536,11 @@ int catpt_coredump(struct catpt_dev *cdev)
 		pos += CATPT_DMA_REGS_SIZE;
 	}
 
+	if (catpt_readl_dram(cdev, COREDUMP) == CATPT_COREDUMP_REQUEST) {
+		dev_dbg(cdev->dev, "releasing firmware from the coredump state\n");
+		catpt_writel_dram(cdev, COREDUMP, CATPT_COREDUMP_RELEASE);
+	}
+
 	dev_coredumpv(cdev->dev, dump, dump_size, GFP_KERNEL);
 
 	return 0;
diff --git a/sound/soc/intel/catpt/ipc.c b/sound/soc/intel/catpt/ipc.c
index 2e3b7a5cbb9b..21ccec55923e 100644
--- a/sound/soc/intel/catpt/ipc.c
+++ b/sound/soc/intel/catpt/ipc.c
@@ -210,6 +210,7 @@ static void catpt_dsp_process_response(struct catpt_dev *cdev, u32 header)
 		memcpy_fromio(&config, cdev->lpe_ba + off, sizeof(config));
 		trace_catpt_ipc_payload((u8 *)&config, sizeof(config));
 
+		dev_dbg(cdev->dev, "FW READY 0x%08x\n", header);
 		catpt_ipc_arm(ipc, &config);
 		complete(&cdev->fw_ready);
 		return;
@@ -220,6 +221,8 @@ static void catpt_dsp_process_response(struct catpt_dev *cdev, u32 header)
 		dev_err(cdev->dev, "ADSP device coredump received\n");
 		ipc->ready = false;
 		catpt_coredump(cdev);
+
+		complete(&cdev->fw_ready);
 		/* TODO: attempt recovery */
 		break;
 
diff --git a/sound/soc/intel/catpt/loader.c b/sound/soc/intel/catpt/loader.c
index 432cb1f0ab4e..75457187b614 100644
--- a/sound/soc/intel/catpt/loader.c
+++ b/sound/soc/intel/catpt/loader.c
@@ -624,6 +624,9 @@ int catpt_boot_firmware(struct catpt_dev *cdev, bool restore)
 	if (!ret) {
 		dev_err(cdev->dev, "firmware ready timeout\n");
 		return -ETIMEDOUT;
+	/* Wake up does not mean FW is ready, an exception could occur. */
+	} else if (!cdev->ipc.ready) {
+		return -EREMOTEIO;
 	}
 
 	/* update sram pg & clock once done booting */
diff --git a/sound/soc/intel/catpt/registers.h b/sound/soc/intel/catpt/registers.h
index 6c1ad28c6d69..64bd534a76ff 100644
--- a/sound/soc/intel/catpt/registers.h
+++ b/sound/soc/intel/catpt/registers.h
@@ -124,6 +124,11 @@
 #define CATPT_SSCR2_DEFAULT		0x0
 #define CATPT_SSPSP2_DEFAULT		0x0
 
+/* Coredump register and its states */
+#define CATPT_DRAM_COREDUMP		0x1F4
+#define CATPT_COREDUMP_REQUEST		UINT_MAX
+#define CATPT_COREDUMP_RELEASE		0
+
 /* Physically the same block, access address differs between host and dsp */
 #define CATPT_DSP_DRAM_OFFSET		0x400000
 #define catpt_to_host_offset(offset)	((offset) & ~(CATPT_DSP_DRAM_OFFSET))
@@ -137,6 +142,8 @@
 
 /* registry I/O helpers */
 
+#define catpt_dram_addr(cdev) \
+	((cdev)->lpe_ba + (cdev)->spec->host_dram_offset)
 #define catpt_shim_addr(cdev) \
 	((cdev)->lpe_ba + (cdev)->spec->host_shim_offset)
 #define catpt_dma_addr(cdev, dma) \
@@ -151,6 +158,11 @@
 #define catpt_writel_ssp(cdev, ssp, reg, val) \
 	writel(val, catpt_ssp_addr(cdev, ssp) + (reg))
 
+#define catpt_readl_dram(cdev, reg) \
+	readl(catpt_dram_addr(cdev) + CATPT_DRAM_##reg)
+#define catpt_writel_dram(cdev, reg, val) \
+	writel(val, catpt_dram_addr(cdev) + CATPT_DRAM_##reg)
+
 #define catpt_readl_shim(cdev, reg) \
 	readl(catpt_shim_addr(cdev) + CATPT_SHIM_##reg)
 #define catpt_writel_shim(cdev, reg, val) \
-- 
2.34.1

