Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F9236B05C
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 08:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788336858; cv=none; b=I3FPiL1TjQGUD9lHLcFIZFNq39frUsos5m+YersyUWiqd0PhK8bM+OmmMEsevnog3waN7mEiVL7vCAK8sglPpgUB9lG3wMePAhjkFuYLS1x7bHGFxc6UA21RB8T/pU6VEOlH5Nm7ifqtRN5/QYIJQ85Po3Jv4qttDgNEHFFBja0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788336858; c=relaxed/simple;
	bh=YHL1Ni0JBTmHWsPuzMcqIqN7rYS7JsQEtDTC7+diTKA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pmHjnbedDYLvJfOuinz1lbRs12YLSRRyd3PJMRHxXZsuCyXI6oRETs0LUOwiYdW8gBFfskpqSaTg7N9Gcv6aPAaP/I5NfmmOSBrs+IJKyj2LYl6GxmRRgJrUA91rtipHNVhFN0KdVA3pT5q1hAwmyyhHUvCpB2nshd6KBifECZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g5XlCwJf; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g5XlCwJf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788336856; x=1819872856;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YHL1Ni0JBTmHWsPuzMcqIqN7rYS7JsQEtDTC7+diTKA=;
  b=g5XlCwJfgBy9V/9Zb79+8h7sg9+nrzEPsodAWbIym3yFirWvffF5SB5C
   irjipgkgYR45AwUa6opkk9YWGgf3366Gfc+EG8H3uBIqy5FOCA+OYbOCA
   HeeTCvsKLQf9b8o1su5roF85YdWpdYV9r1spIrXudU3S8lhTjeWu5/8DP
   UxukyfYyadkhSD3Hr+dm8sBuQs57VocwKZrXVUWGsG2+M+kNV4Hn8EZu2
   u1djalDPHOgFL5V543LSbReycGh/LunwWR/RykXqjwI+phPlsRBhHUxGS
   m2jc2khPIlFlXEtz933+fzCmQty6Jg+Ddw0Kc9soPM21OIz5xDw8B+mNS
   g==;
X-CSE-ConnectionGUID: WOf1YmMSQ0OtlTJ4vXQf8w==
X-CSE-MsgGUID: fs7AAgX8RWeHhtFjIuG8iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="99120972"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="99120972"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 01:14:09 -0700
X-CSE-ConnectionGUID: 1BEC5ociTAGp6RC2CgJciA==
X-CSE-MsgGUID: l6Z0BW7DQGeiqFaMiu88HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="266099063"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa007.fm.intel.com with ESMTP; 02 Sep 2026 01:14:08 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v4 03/10] ASoC: Intel: avs: Clean up the bus when its initialization fails
Date: Wed,  2 Sep 2026 10:18:07 +0200
Message-Id: <20260902081814.1590883-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902081814.1590883-1-cezary.rojewski@intel.com>
References: <20260902081814.1590883-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

snd_hdac_i915_init() which is part of the initialization may return
-EPROBE_DEFER what fails the procedure and the existing avs_bus_init()
and avs_pci_probe() do not clean up the bus fields with
snd_hdac_ext_bus_exit() when that happens.

Fix avs_bus_init() by rearranging the initialization blocks: allocations
first, snd_hdac_ext_bus_init() last. Such approach generates no
error-path whilst still achieving the goal of cleaning up the bus.
For avs_pci_probe() update the existing error-path instead.

Co-developed-by: Amadeusz Sławiński <amade@asmblr.net>
Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/core.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 2afe59646896..f45256ff5bac 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -383,6 +383,18 @@ static int avs_bus_init(struct avs_dev *adev, struct pci_dev *pci, const struct
 	struct device *dev = &pci->dev;
 	int ret;
 
+	ipc = devm_kzalloc(dev, sizeof(*ipc), GFP_KERNEL);
+	if (!ipc)
+		return -ENOMEM;
+
+	adev->modcfg_buf = devm_kzalloc(dev, AVS_MAILBOX_SIZE, GFP_KERNEL);
+	if (!adev->modcfg_buf)
+		return -ENOMEM;
+
+	ret = avs_ipc_init(ipc, dev);
+	if (ret < 0)
+		return ret;
+
 	ret = snd_hdac_ext_bus_init(&bus->core, dev, NULL, &soc_hda_ext_bus_ops);
 	if (ret < 0)
 		return ret;
@@ -394,17 +406,6 @@ static int avs_bus_init(struct avs_dev *adev, struct pci_dev *pci, const struct
 	bus->mixer_assigned = -1;
 	mutex_init(&bus->prepare_mutex);
 
-	ipc = devm_kzalloc(dev, sizeof(*ipc), GFP_KERNEL);
-	if (!ipc)
-		return -ENOMEM;
-	ret = avs_ipc_init(ipc, dev);
-	if (ret < 0)
-		return ret;
-
-	adev->modcfg_buf = devm_kzalloc(dev, AVS_MAILBOX_SIZE, GFP_KERNEL);
-	if (!adev->modcfg_buf)
-		return -ENOMEM;
-
 	adev->dev = dev;
 	adev->spec = (const struct avs_spec *)id->driver_data;
 	adev->ipc = ipc;
@@ -456,13 +457,14 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 
 	ret = pcim_request_all_regions(pci, "AVS HDAudio");
 	if (ret < 0)
-		return ret;
+		goto err_request_regions;
 
 	bus->addr = pci_resource_start(pci, 0);
 	bus->remap_addr = pci_ioremap_bar(pci, 0);
 	if (!bus->remap_addr) {
 		dev_err(bus->dev, "ioremap error\n");
-		return -ENXIO;
+		ret = -ENXIO;
+		goto err_request_regions;
 	}
 
 	adev->dsp_ba = pci_ioremap_bar(pci, 4);
@@ -519,6 +521,8 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 	iounmap(adev->dsp_ba);
 err_remap_bar4:
 	iounmap(bus->remap_addr);
+err_request_regions:
+	snd_hdac_ext_bus_exit(bus);
 	return ret;
 }
 
-- 
2.34.1

