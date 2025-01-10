Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049E918787A
	for <linux-sound@vger.kernel.org>; Fri, 10 Jan 2025 11:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736507989; cv=none; b=Xrkn6hkwDHfLc18SJ65TdEdLu6scj2yrAWccqaG3Nr0THM6BGgbnqdGf/qnY6ep9p2zbeDoysDnB9+UrRIPqsbIpIyE991X45i3WZAw0vNv8RSultiBkihsBtdYhuWPXJnZ6/A5Xx8/m0cdJJB3QU1bSLKS9nAvcqULDZg848FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736507989; c=relaxed/simple;
	bh=eFKsXfi7Matn8sWai9eJs0Fj6+fGp9Gs4SbpJM2ZtVk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B9TY71qn0SsGqV3g2kvlY0kUUKkJ86ucf2d3ZVofk+e++ReXRHFOJ5vB927PL2ZdvKwxNlKCK/Y/KKFOt9+7d4x/C8fBZKs3GMe2fzqJeCyglqT3ab8N3evNQnNDYemQwAEg9hd8WCwN9xJIwJ9PwY7ive287DhTXDHDCWOgvVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=edia1773; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="edia1773"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736507988; x=1768043988;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eFKsXfi7Matn8sWai9eJs0Fj6+fGp9Gs4SbpJM2ZtVk=;
  b=edia177362JlKqTM+kb/QitODFitLN8E7HZVfTFiBokS/QMjGOeQ21JT
   MxZ9dfkLNFMwjdHvVt1g3VVNEmHY5EVrPH/gBys7BUJ2US1BZcvw6tOme
   xfL3lkMCM+KNAygGkUS4HGyiCZQNdTtE0OZI7Z9JdMHm9ZvdaLalxzuEE
   4umv1hsp5g+vf50nrN2Bl7i+hcBDcMas2Yg/CDD9hlSPz+ZV4np5OowAh
   itT6emoMyRx/ghXq6aqylKOZgAs0cig7VQKdFtJ2zU5FBxKLt1gF5GXzh
   hM1w5KcrN+Kzpz1lGpBx3W7fkS+AqfUkGZH6GuqEalcBUN1BJuSWxR6ce
   w==;
X-CSE-ConnectionGUID: TeZfFWFKQxqEezzV1x8T0g==
X-CSE-MsgGUID: SOAwRPZQTHiN8Gj92LY6bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="47373019"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="47373019"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 03:19:47 -0800
X-CSE-ConnectionGUID: Ms33sZhiRPW5c6JHUF3a6Q==
X-CSE-MsgGUID: CDQ/PjgYQ3++NYNqSVDLxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134609911"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by fmviesa001.fm.intel.com with ESMTP; 10 Jan 2025 03:19:45 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	broonie@kernel.org,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 1/2] ALSA: hda: Fix compilation of snd_hdac_adsp_xxx() helpers
Date: Fri, 10 Jan 2025 12:33:25 +0100
Message-Id: <20250110113326.3809897-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250110113326.3809897-1-cezary.rojewski@intel.com>
References: <20250110113326.3809897-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The snd_hdac_adsp_xxx() wrap snd_hdac_reg_xxx() helpers to simplify
register access for AudioDSP drivers e.g.: the avs-driver. Byte- and
word-variants of said helps do not expand to bare readx/writex()
operations but functions instead and, due to pointer type
incompatibility, cause compilation to fail.

As the macros are utilized by the avs-driver alone, relocate the code
introduced with commit c19bd02e9029 ("ALSA: hda: Add helper macros for
DSP capable devices") into the avs/ directory and update it to operate
on 'adev' i.e.: the avs-driver-context directly to fix the issue.

Fixes: c19bd02e9029 ("ALSA: hda: Add helper macros for DSP capable devices")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/hdaudio_ext.h     | 45 ---------------------------------
 sound/soc/intel/avs/apl.c       |  1 +
 sound/soc/intel/avs/cnl.c       |  1 +
 sound/soc/intel/avs/registers.h | 45 +++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/skl.c       |  1 +
 5 files changed, 48 insertions(+), 45 deletions(-)

diff --git a/include/sound/hdaudio_ext.h b/include/sound/hdaudio_ext.h
index 957295364a5e..4c7a40e149a5 100644
--- a/include/sound/hdaudio_ext.h
+++ b/include/sound/hdaudio_ext.h
@@ -2,8 +2,6 @@
 #ifndef __SOUND_HDAUDIO_EXT_H
 #define __SOUND_HDAUDIO_EXT_H
 
-#include <linux/io-64-nonatomic-lo-hi.h>
-#include <linux/iopoll.h>
 #include <sound/hdaudio.h>
 
 int snd_hdac_ext_bus_init(struct hdac_bus *bus, struct device *dev,
@@ -119,49 +117,6 @@ int snd_hdac_ext_bus_link_put(struct hdac_bus *bus, struct hdac_ext_link *hlink)
 
 void snd_hdac_ext_bus_link_power(struct hdac_device *codec, bool enable);
 
-#define snd_hdac_adsp_writeb(chip, reg, value) \
-	snd_hdac_reg_writeb(chip, (chip)->dsp_ba + (reg), value)
-#define snd_hdac_adsp_readb(chip, reg) \
-	snd_hdac_reg_readb(chip, (chip)->dsp_ba + (reg))
-#define snd_hdac_adsp_writew(chip, reg, value) \
-	snd_hdac_reg_writew(chip, (chip)->dsp_ba + (reg), value)
-#define snd_hdac_adsp_readw(chip, reg) \
-	snd_hdac_reg_readw(chip, (chip)->dsp_ba + (reg))
-#define snd_hdac_adsp_writel(chip, reg, value) \
-	snd_hdac_reg_writel(chip, (chip)->dsp_ba + (reg), value)
-#define snd_hdac_adsp_readl(chip, reg) \
-	snd_hdac_reg_readl(chip, (chip)->dsp_ba + (reg))
-#define snd_hdac_adsp_writeq(chip, reg, value) \
-	snd_hdac_reg_writeq(chip, (chip)->dsp_ba + (reg), value)
-#define snd_hdac_adsp_readq(chip, reg) \
-	snd_hdac_reg_readq(chip, (chip)->dsp_ba + (reg))
-
-#define snd_hdac_adsp_updateb(chip, reg, mask, val) \
-	snd_hdac_adsp_writeb(chip, reg, \
-			(snd_hdac_adsp_readb(chip, reg) & ~(mask)) | (val))
-#define snd_hdac_adsp_updatew(chip, reg, mask, val) \
-	snd_hdac_adsp_writew(chip, reg, \
-			(snd_hdac_adsp_readw(chip, reg) & ~(mask)) | (val))
-#define snd_hdac_adsp_updatel(chip, reg, mask, val) \
-	snd_hdac_adsp_writel(chip, reg, \
-			(snd_hdac_adsp_readl(chip, reg) & ~(mask)) | (val))
-#define snd_hdac_adsp_updateq(chip, reg, mask, val) \
-	snd_hdac_adsp_writeq(chip, reg, \
-			(snd_hdac_adsp_readq(chip, reg) & ~(mask)) | (val))
-
-#define snd_hdac_adsp_readb_poll(chip, reg, val, cond, delay_us, timeout_us) \
-	readb_poll_timeout((chip)->dsp_ba + (reg), val, cond, \
-			   delay_us, timeout_us)
-#define snd_hdac_adsp_readw_poll(chip, reg, val, cond, delay_us, timeout_us) \
-	readw_poll_timeout((chip)->dsp_ba + (reg), val, cond, \
-			   delay_us, timeout_us)
-#define snd_hdac_adsp_readl_poll(chip, reg, val, cond, delay_us, timeout_us) \
-	readl_poll_timeout((chip)->dsp_ba + (reg), val, cond, \
-			   delay_us, timeout_us)
-#define snd_hdac_adsp_readq_poll(chip, reg, val, cond, delay_us, timeout_us) \
-	readq_poll_timeout((chip)->dsp_ba + (reg), val, cond, \
-			   delay_us, timeout_us)
-
 struct hdac_ext_device;
 
 /* ops common to all codec drivers */
diff --git a/sound/soc/intel/avs/apl.c b/sound/soc/intel/avs/apl.c
index 27516ef57185..a48d74daf48c 100644
--- a/sound/soc/intel/avs/apl.c
+++ b/sound/soc/intel/avs/apl.c
@@ -12,6 +12,7 @@
 #include "avs.h"
 #include "messages.h"
 #include "path.h"
+#include "registers.h"
 #include "topology.h"
 
 static irqreturn_t avs_apl_dsp_interrupt(struct avs_dev *adev)
diff --git a/sound/soc/intel/avs/cnl.c b/sound/soc/intel/avs/cnl.c
index bd3c4bb8bf5a..03f8fb0dc187 100644
--- a/sound/soc/intel/avs/cnl.c
+++ b/sound/soc/intel/avs/cnl.c
@@ -9,6 +9,7 @@
 #include <sound/hdaudio_ext.h>
 #include "avs.h"
 #include "messages.h"
+#include "registers.h"
 
 static void avs_cnl_ipc_interrupt(struct avs_dev *adev)
 {
diff --git a/sound/soc/intel/avs/registers.h b/sound/soc/intel/avs/registers.h
index f76e91cff2a9..5b6d60eb3c18 100644
--- a/sound/soc/intel/avs/registers.h
+++ b/sound/soc/intel/avs/registers.h
@@ -9,6 +9,8 @@
 #ifndef __SOUND_SOC_INTEL_AVS_REGS_H
 #define __SOUND_SOC_INTEL_AVS_REGS_H
 
+#include <linux/io-64-nonatomic-lo-hi.h>
+#include <linux/iopoll.h>
 #include <linux/sizes.h>
 
 #define AZX_PCIREG_PGCTL		0x44
@@ -98,4 +100,47 @@
 #define avs_downlink_addr(adev) \
 	avs_sram_addr(adev, AVS_DOWNLINK_WINDOW)
 
+#define snd_hdac_adsp_writeb(adev, reg, value) \
+	snd_hdac_reg_writeb(&(adev)->base.core, (adev)->dsp_ba + (reg), value)
+#define snd_hdac_adsp_readb(adev, reg) \
+	snd_hdac_reg_readb(&(adev)->base.core, (adev)->dsp_ba + (reg))
+#define snd_hdac_adsp_writew(adev, reg, value) \
+	snd_hdac_reg_writew(&(adev)->base.core, (adev)->dsp_ba + (reg), value)
+#define snd_hdac_adsp_readw(adev, reg) \
+	snd_hdac_reg_readw(&(adev)->base.core, (adev)->dsp_ba + (reg))
+#define snd_hdac_adsp_writel(adev, reg, value) \
+	snd_hdac_reg_writel(&(adev)->base.core, (adev)->dsp_ba + (reg), value)
+#define snd_hdac_adsp_readl(adev, reg) \
+	snd_hdac_reg_readl(&(adev)->base.core, (adev)->dsp_ba + (reg))
+#define snd_hdac_adsp_writeq(adev, reg, value) \
+	snd_hdac_reg_writeq(&(adev)->base.core, (adev)->dsp_ba + (reg), value)
+#define snd_hdac_adsp_readq(adev, reg) \
+	snd_hdac_reg_readq(&(adev)->base.core, (adev)->dsp_ba + (reg))
+
+#define snd_hdac_adsp_updateb(adev, reg, mask, val) \
+	snd_hdac_adsp_writeb(adev, reg, \
+			(snd_hdac_adsp_readb(adev, reg) & ~(mask)) | (val))
+#define snd_hdac_adsp_updatew(adev, reg, mask, val) \
+	snd_hdac_adsp_writew(adev, reg, \
+			(snd_hdac_adsp_readw(adev, reg) & ~(mask)) | (val))
+#define snd_hdac_adsp_updatel(adev, reg, mask, val) \
+	snd_hdac_adsp_writel(adev, reg, \
+			(snd_hdac_adsp_readl(adev, reg) & ~(mask)) | (val))
+#define snd_hdac_adsp_updateq(adev, reg, mask, val) \
+	snd_hdac_adsp_writeq(adev, reg, \
+			(snd_hdac_adsp_readq(adev, reg) & ~(mask)) | (val))
+
+#define snd_hdac_adsp_readb_poll(adev, reg, val, cond, delay_us, timeout_us) \
+	readb_poll_timeout((adev)->dsp_ba + (reg), val, cond, \
+			   delay_us, timeout_us)
+#define snd_hdac_adsp_readw_poll(adev, reg, val, cond, delay_us, timeout_us) \
+	readw_poll_timeout((adev)->dsp_ba + (reg), val, cond, \
+			   delay_us, timeout_us)
+#define snd_hdac_adsp_readl_poll(adev, reg, val, cond, delay_us, timeout_us) \
+	readl_poll_timeout((adev)->dsp_ba + (reg), val, cond, \
+			   delay_us, timeout_us)
+#define snd_hdac_adsp_readq_poll(adev, reg, val, cond, delay_us, timeout_us) \
+	readq_poll_timeout((adev)->dsp_ba + (reg), val, cond, \
+			   delay_us, timeout_us)
+
 #endif /* __SOUND_SOC_INTEL_AVS_REGS_H */
diff --git a/sound/soc/intel/avs/skl.c b/sound/soc/intel/avs/skl.c
index 34f859d6e5a4..d66ef000de9e 100644
--- a/sound/soc/intel/avs/skl.c
+++ b/sound/soc/intel/avs/skl.c
@@ -12,6 +12,7 @@
 #include "avs.h"
 #include "cldma.h"
 #include "messages.h"
+#include "registers.h"
 
 void avs_skl_ipc_interrupt(struct avs_dev *adev)
 {
-- 
2.25.1

