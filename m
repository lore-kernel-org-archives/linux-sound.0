Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427C05C60F
	for <linux-sound@vger.kernel.org>; Fri, 23 Feb 2024 11:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708688696; cv=none; b=rgLqsdN6g5vTyhF9O+rIXLcU6vqi3Lr7NIAOQ+YXJyeB6eZ0Bee9yJCLie47pJhwZhwuk/xeSO5+e7TnZvCXf6T/kvpLQE7xlJ9C5SLZFqj7HqTSWBIWfRJrbB+vPp4EOSNDjdzlAPHy3ob6PuR/+zl8WyO+b+bPBcXEij3lbTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708688696; c=relaxed/simple;
	bh=w5f6RNhBhSo4LkceK82xzJNTTn3aKecVjCjLlcA0HqI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GEWtufBEyWZrzCHeXJ0l2lMqGaAqi9hnCpBdt7qgtf5YK44XVln6NIMXx2pLyhpNeQu4Gi+etOfY+74KptJHd9GIVTtBp70RZp4bqCCY1D9S0jLOs/QNSK4oI5LsuaPWEmpf80IgptM9fcw+7x/iSLHfD9HmcKcs9qZ4Z4kxayc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mv1rQpIU; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mv1rQpIU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708688694; x=1740224694;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w5f6RNhBhSo4LkceK82xzJNTTn3aKecVjCjLlcA0HqI=;
  b=mv1rQpIUNFFcoUFPUKJrQ3TILNE0A1V2I78NcRLCH/FELj0g8nom8lOF
   cbjMLFAUkyRFEdsvBpFa4wWxh+bzP79Swkn7FActs1zcHQ457VZEjN4BZ
   6EjcDR84k2vTI/gmMMRIos63YIINdrwySUBJjTAlxL9PRIf1ajQVodXhl
   9DBPEhyT9tHml4hAS2Q9+FOFqjEQtgwpbGI4JiiklHcxyX/RZavxgDO8D
   tBMwqb27BB+1/0ZITM3Kg2QvrCBNs2jPuIRphPHqDaUHVBq5bzXgPeLB1
   vWPoibKfiZhlvx7WHR4BUPqfUSi2SvsNQ2OplPGrSVd1x/GUaPRj+rz8v
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="3504596"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="3504596"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 03:44:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="6092896"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa006.fm.intel.com with ESMTP; 23 Feb 2024 03:44:51 -0800
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
Subject: [PATCH v2 1/4] ALSA: hda: Skip i915 initialization on CNL/LKF-based platforms
Date: Fri, 23 Feb 2024 12:46:23 +0100
Message-Id: <20240223114626.1052784-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240223114626.1052784-1-cezary.rojewski@intel.com>
References: <20240223114626.1052784-1-cezary.rojewski@intel.com>
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
 sound/hda/hdac_i915.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
index 365c36fdf205..afee87bd0f2e 100644
--- a/sound/hda/hdac_i915.c
+++ b/sound/hda/hdac_i915.c
@@ -127,15 +127,41 @@ static int i915_component_master_match(struct device *dev, int subcomponent,
 /* check whether Intel graphics is present and reachable */
 static int i915_gfx_present(struct pci_dev *hdac_pci)
 {
+	/* List of known platforms with no i915 support. */
+	static struct pci_device_id denylist[] = {
+		/* CNL */
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a40), 0x030000, 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a41), 0x030000, 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a42), 0x030000, 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a44), 0x030000, 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a49), 0x030000, 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a4a), 0x030000, 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a4c), 0x030000, 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a50), 0x030000, 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a51), 0x030000, 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a52), 0x030000, 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a54), 0x030000, 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a59), 0x030000, 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a5a), 0x030000, 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a5c), 0x030000, 0xff0000 },
+		/* LKF */
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x9840), 0x030000, 0xff0000 },
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

