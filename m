Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FB119EED3
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 16:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194320; cv=none; b=UWyfGAnA3wPL0PaMK9mdwVLLTYKCzXL5Xj6T5Ky5NqxPvwpYp74cqcMfctcTtyRZwbD5xpvaFnzJXJHjddz1dMMhOh8i7c5D2QG22+6CIL9x1tQPis1ykO/ChJdEnpyxJPtiVfjGHLrLss3Z3h6A4o6KXoY6S1aM7j7mKRH5NJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194320; c=relaxed/simple;
	bh=YHL1Ni0JBTmHWsPuzMcqIqN7rYS7JsQEtDTC7+diTKA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WqJmkCI70oMyxF6FgT1DSM+jnfFJ59nTq5msKxhezVFpHKR8vhsO99qj/71K2TP9oyRyAlDdPsKAiMlfTyJ3VWSEo2RD3Q6aEq3rDsfIkcdXmqCTOiTXT/WW/yreZH2MTKOK7zfB2/6/kvwXgLG+6EOnHRiHqpqDJA+6iTQD7zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OrAGI4yn; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OrAGI4yn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788194318; x=1819730318;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YHL1Ni0JBTmHWsPuzMcqIqN7rYS7JsQEtDTC7+diTKA=;
  b=OrAGI4yn9C97eSfua7S00POAaQ1K7soTIo6e6PzowW1bOKf0O1x7Tkr9
   YZ08L1FOjhtfQjI1BfF3lHyLunilhbcolNfK1y322aSpzzQeA/vB/oWTB
   GqjFJTm+5KQnfcWSkwWOgNjIQubqryXmIYm563mz+m3ArNP0327fh2Jtf
   uGP4STp3EHZ4HsC0bJsm6pr61yE5i97IEG+jm05XHYR9KywQiTdn6QJo8
   PhcgQzRHU4q0cXUvUYl23gwDOXqF7i3RpUK2g7quYe6S4qXZX0PE57h+M
   ycwzlxA9efZ9rO0AUjCSfqJL/bmGR4T6BMXMEXKtVPt4iDtCtb8TaBkHV
   w==;
X-CSE-ConnectionGUID: bGft2ligSQC6KqDbqwxfvQ==
X-CSE-MsgGUID: 9/ljyNDlRFesn+lUWK2m6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="111379722"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="111379722"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 09:38:38 -0700
X-CSE-ConnectionGUID: 1yYGzOCjQbuQCqNSBBHu3A==
X-CSE-MsgGUID: 98dZaU/HTHOmh3uU+ydOrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="274111771"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa005.fm.intel.com with ESMTP; 31 Aug 2026 09:38:36 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 03/10] ASoC: Intel: avs: Clean up the bus when its initialization fails
Date: Mon, 31 Aug 2026 18:42:26 +0200
Message-Id: <20260831164233.1487766-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831164233.1487766-1-cezary.rojewski@intel.com>
References: <20260831164233.1487766-1-cezary.rojewski@intel.com>
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

