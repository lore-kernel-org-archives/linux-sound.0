Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE28153BC9
	for <linux-sound@vger.kernel.org>; Thu, 22 Feb 2024 17:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708621558; cv=none; b=mFp2ivs/zqU86k0NtsCgplpmz0dHXmhiHeHarSUHU+PyCObTsWkX6b8T9gsppFtciou2Caq9tVY3IdL1MIa3vCB10kHmtlZKwSZX2MIsHci7pZRS0hyElpGwg8Xx8wy/pH8q98Va4LR6Yi0N4vrkjnYkK8x6LYU38iCPFEuApS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708621558; c=relaxed/simple;
	bh=FgvZABVdcDQjiW6UTsk7+nZcUDYDiqk6G+wQrxlYAhY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VBMz3VQTB8WWlCn0b8YbIdukGcqjFbm9HntS4fnHx6BhzHtBnR+ACzRa8f+qJSAFlfIbQEyXyBvFQU9nRsYLXGgmJrEV4aFqe0vSpanoYgi1Egj5hW5FTn9Kt5ezTRC/KoEy9ae1TAmc/CCTJtYmRUkx8LLnGNOTFq0w4Z61vzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D9dQ2xmh; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D9dQ2xmh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708621557; x=1740157557;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FgvZABVdcDQjiW6UTsk7+nZcUDYDiqk6G+wQrxlYAhY=;
  b=D9dQ2xmhwYkOOLaoGW7TwX6k5WBRvNf/AmBs8VF/OpUA4kmOr+cHasN6
   XHCSYR0YcnT8hOKC+6JC1V/uM40g9qIMBg7LUjWQ17ffnab632bHm1x3X
   +5B5oECP0QqDxfTcuSIRPDlrMgb8hDQ3DZrZ2f8C5bWqetnTMJzDGIXyi
   g4Th/s4p8xA+YdizT9Vxdm4x2K4ArvYI/2930qLnPvdBX84C+AYLfXYI/
   YgJqQuOB/KNqjfwvjZVgA/Kp+7mcfVWTzSvwr/GARJQDg7vUWabcnigYb
   2nBIM4KI+XNdaJCihVl3+VHP5Di0kSfl6jiVptv3VV/3449pUlK+am3M0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="20299201"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="20299201"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 09:04:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="827575236"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="827575236"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orsmga001.jf.intel.com with ESMTP; 22 Feb 2024 09:04:53 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com,
	tvrtko.ursulin@linux.intel.com,
	intel-gfx@lists.freedesktop.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 1/4] ALSA: hda: Skip i915 initialization on CNL/LKF-based platforms
Date: Thu, 22 Feb 2024 18:06:11 +0100
Message-Id: <20240222170614.884413-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240222170614.884413-1-cezary.rojewski@intel.com>
References: <20240222170614.884413-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 78f613ba1efb ("drm/i915: finish removal of CNL") and its friends
removed support for i915 for all CNL-based platforms. HDAudio library,
however, still treats such platforms as valid candidates for i915
binding. Update query mechanism to reflect changes made in drm tree.

At the same time, i915 support for LKF-based platforms has not been
provided so remove them from valid binding candidates.

Link: https://lore.kernel.org/all/20210728215946.1573015-1-lucas.demarchi@intel.com/
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/drm/i915_pciids.h |  4 ++++
 sound/hda/hdac_i915.c     | 18 +++++++++++++++---
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/include/drm/i915_pciids.h b/include/drm/i915_pciids.h
index fcf1849aa47c..04172b541ee7 100644
--- a/include/drm/i915_pciids.h
+++ b/include/drm/i915_pciids.h
@@ -582,6 +582,10 @@
 	INTEL_VGA_DEVICE(0x8A51, info), \
 	INTEL_VGA_DEVICE(0x8A5D, info)
 
+/* LKF */
+#define INTEL_LKF_IDS(info) \
+	INTEL_VGA_DEVICE(0x9840, info)
+
 /* EHL */
 #define INTEL_EHL_IDS(info) \
 	INTEL_VGA_DEVICE(0x4541, info), \
diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
index 365c36fdf205..07861f9fc491 100644
--- a/sound/hda/hdac_i915.c
+++ b/sound/hda/hdac_i915.c
@@ -6,6 +6,7 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <drm/i915_pciids.h>
 #include <sound/core.h>
 #include <sound/hdaudio.h>
 #include <sound/hda_i915.h>
@@ -127,15 +128,26 @@ static int i915_component_master_match(struct device *dev, int subcomponent,
 /* check whether Intel graphics is present and reachable */
 static int i915_gfx_present(struct pci_dev *hdac_pci)
 {
+	/* List of known platforms with no i915 support. */
+	static struct pci_device_id denylist[] = {
+		INTEL_CNL_IDS(NULL),
+		INTEL_LKF_IDS(NULL),
+		{ 0 }
+	};
 	struct pci_dev *display_dev = NULL;
 
 	if (!gpu_bind || (gpu_bind < 0 && video_firmware_drivers_only()))
 		return false;
 
 	for_each_pci_dev(display_dev) {
-		if (display_dev->vendor == PCI_VENDOR_ID_INTEL &&
-		    (display_dev->class >> 16) == PCI_BASE_CLASS_DISPLAY &&
-		    connectivity_check(display_dev, hdac_pci)) {
+		if (display_dev->vendor != PCI_VENDOR_ID_INTEL ||
+		    (display_dev->class >> 16) != PCI_BASE_CLASS_DISPLAY)
+			continue;
+
+		if (pci_match_id(denylist, display_dev))
+			continue;
+
+		if (connectivity_check(display_dev, hdac_pci)) {
 			pci_dev_put(display_dev);
 			return true;
 		}
-- 
2.25.1

