Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA511DE891
	for <linux-sound@vger.kernel.org>; Tue, 29 Jul 2025 11:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753788099; cv=none; b=N1rEIYr4I7RzPPumbxWl5M7dvfsliy7nenpSXW2mNqUU4/KRCsGfDJgaEIDImTqjaurZAR0l7O+lJ24eBw6gb2+RbtTErslsH3GYwvLhVqC7iSl0eZWFd6t5YgTf/99sBfyqOy1bGcBiK+fRUw2dpKLaj3mQ0nYTMd8nSx8b/Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753788099; c=relaxed/simple;
	bh=40WrMcMoX7/6yvQMOz9cSdlHi7Xd1/FIuWD6KGadwZw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MgbszlVmBgv7k/FU95z7Tp671MR6Hi1mH64YuvFONIJ1UF49PhtiwzSMDxlvTpoWrfKMDX7rTonA4xlAw8jBwWJszS/Yh28KBHjSZj+qQEJjZZ+1DxcANPlI8vHbXTA/LIVc4m5s2ueFwhcV9Zooz4vvBZvqVrBImjFXJdoJI0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lB6ALFnI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lB6ALFnI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753788098; x=1785324098;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=40WrMcMoX7/6yvQMOz9cSdlHi7Xd1/FIuWD6KGadwZw=;
  b=lB6ALFnIyQihUUoA7SDMofOf1ZXCthr7B8VYPDBkvYzF8Uu6Se4Wy4xZ
   BlhMAhKQemMbUChs2oPTT+UyALLI7/D7CXt2eMjOimdDPqMyzBVwBRWKu
   WS+rC49Tp4kbxQCx3f+YPKB/vkhTV7nkZ3M0wFB7LZtJ/mMs8UToWtgrt
   MDSp87YO+iEgqY05IFS5ofyThkBEBo0CgWX4j1ZRguQLAroETsR7FKyhF
   ehxboLzR/KUc1F+wcNvqfMDjgGiqOd9icTj2cPFyh0mozDgYX38D8TIy5
   2Nju2OxZdceCncK+KAcphSVmh4YyxrKsab+1Et0v808+0FVvsj5f177lj
   A==;
X-CSE-ConnectionGUID: /p94jEU0Sg2q2yzfgzyiTA==
X-CSE-MsgGUID: gOxx9675Qj6d00rNKTW1mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="67137345"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="67137345"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 04:21:38 -0700
X-CSE-ConnectionGUID: 6EFim6aERLOoH8xPfmyjsg==
X-CSE-MsgGUID: 0pF5xHraTvyJpfyN3HdyFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="161945141"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa006.jf.intel.com with ESMTP; 29 Jul 2025 04:21:36 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 2/2] ASoC: Intel: avs: Fix uninitialized pointer error in probe()
Date: Tue, 29 Jul 2025 13:42:29 +0200
Message-Id: <20250729114229.309472-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250729114229.309472-1-cezary.rojewski@intel.com>
References: <20250729114229.309472-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If pcim_request_all_regions() fails, error path operates on
uninitialized 'bus' pointer. Found out by Coverity static analyzer.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 5ea42b5af26f..c40cdfc4ef96 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -445,6 +445,8 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 	adev = devm_kzalloc(dev, sizeof(*adev), GFP_KERNEL);
 	if (!adev)
 		return -ENOMEM;
+	bus = &adev->base.core;
+
 	ret = avs_bus_init(adev, pci, id);
 	if (ret < 0) {
 		dev_err(dev, "failed to init avs bus: %d\n", ret);
@@ -455,7 +457,6 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 	if (ret < 0)
 		return ret;
 
-	bus = &adev->base.core;
 	bus->addr = pci_resource_start(pci, 0);
 	bus->remap_addr = pci_ioremap_bar(pci, 0);
 	if (!bus->remap_addr) {
-- 
2.25.1

