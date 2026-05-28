Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B1B30C15E
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 08:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779957195; cv=none; b=aiXe4A59KG4QjHbgcBKusEwFHoT9tcUzNJptJKb3pGDvgqnNEBgP9EhgOzRZ7ExnBs768HCOiniUnoz+tvkjbTLqCoUWX8DVv1r9Ka8fYn9q234mdDyXGySyAeSJC5Fq2PKmnRZNlNwZYddlRFu6IqUIzkZMewpnT9+kWhrIAsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779957195; c=relaxed/simple;
	bh=kG72HCsxMq6XWFH+YMQYEIJm0Ox0wBKjHFCcrtbVAB4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HBhBHZZztTwamrCca95Sv4LNmvYmh4Rr41/LDg35n3WGpuaFTbI/LZbZI1XDlzHYAibMqs0PhIZXLpoLKByAcD0Qc79Ueq0yb4icysm1O5rLFDwLTRUMFFu1OIH1HYRJlH5EF4ObBEw2GJj/gpi4EUGo7whGUgIVOuDYE9+vZ5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gpc9JbWL; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gpc9JbWL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779957193; x=1811493193;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kG72HCsxMq6XWFH+YMQYEIJm0Ox0wBKjHFCcrtbVAB4=;
  b=Gpc9JbWLwVz9PoJ3EHdDhHHiAZld24/8ixTVt86m+AKPwHZh7hfAWrPM
   87LHFTmMtChsXRMQWawqjyojVf7/PkphQ+1Qeb2X0NLRyQjQiDYpRb8UL
   CTgEA+xej4Z7CIOGIp4BIp04nZrbP1T/0FeAL88b2KZZhCTMKqIgCbrfx
   0hARw8t4UEU8Gfu52/uHX0B+QI68AmGT3R5lDKeRLGmKiECtMhp74lM56
   jC4pGExRhwgQMYYG1AADE/0zmuzP2/a+1oOf0HmCm5vumsTBy8TaETZoR
   CAGVZjd4yIgBL/U2mxJF4Up7prKgvwXUoQwakleXyKGZkK1KqRAahUIby
   g==;
X-CSE-ConnectionGUID: 3fOkNHhDQj2hjVeCzl00ug==
X-CSE-MsgGUID: +PeUruNVRYyXqtIbP+0SpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="79828675"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="79828675"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 01:33:13 -0700
X-CSE-ConnectionGUID: mGyy0/dYQvqlk3jP1XoNTw==
X-CSE-MsgGUID: U7CTiHjqQEKjIzbJPIKwGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="266390221"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa001.fm.intel.com with ESMTP; 28 May 2026 01:33:11 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	krzysztof.hejmowski@intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 1/3] ASoC: Intel: catpt: Complete coredump handling
Date: Thu, 28 May 2026 10:34:42 +0200
Message-Id: <20260528083444.1439233-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260528083444.1439233-1-cezary.rojewski@intel.com>
References: <20260528083444.1439233-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An exception may occur during the firmware booting procedure.  In such
case the firmware sends COREDUMP_REQUESTS and expects the driver to dump
relevant information and finish with the COREDUMP_RELEASE write.

To distinguish such situation from generic timeout, always signal
fw_ready completion when a coredump request is received and translate
it to -EREMOTEIO in catpt_boot_firmware().

The "FW READY" print makes the success clearly visible even when
the event-traces are not enabled.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/ipc.c       |  8 ++++++++
 sound/soc/intel/catpt/loader.c    |  3 +++
 sound/soc/intel/catpt/registers.h | 12 ++++++++++++
 3 files changed, 23 insertions(+)

diff --git a/sound/soc/intel/catpt/ipc.c b/sound/soc/intel/catpt/ipc.c
index 2e3b7a5cbb9b..225757e6a776 100644
--- a/sound/soc/intel/catpt/ipc.c
+++ b/sound/soc/intel/catpt/ipc.c
@@ -210,6 +210,7 @@ static void catpt_dsp_process_response(struct catpt_dev *cdev, u32 header)
 		memcpy_fromio(&config, cdev->lpe_ba + off, sizeof(config));
 		trace_catpt_ipc_payload((u8 *)&config, sizeof(config));
 
+		dev_dbg(cdev->dev, "FW READY 0x%08x\n", header);
 		catpt_ipc_arm(ipc, &config);
 		complete(&cdev->fw_ready);
 		return;
@@ -220,6 +221,13 @@ static void catpt_dsp_process_response(struct catpt_dev *cdev, u32 header)
 		dev_err(cdev->dev, "ADSP device coredump received\n");
 		ipc->ready = false;
 		catpt_coredump(cdev);
+
+		if (catpt_readl_dram(cdev, COREDUMP) == CATPT_COREDUMP_REQUEST) {
+			dev_dbg(cdev->dev, "releasing firmware from the coredump state\n");
+			catpt_writel_dram(cdev, COREDUMP, CATPT_COREDUMP_RELEASE);
+		}
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

