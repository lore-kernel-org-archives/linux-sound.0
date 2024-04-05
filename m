Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3412D1465B4
	for <linux-sound@vger.kernel.org>; Fri,  5 Apr 2024 09:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712308109; cv=none; b=PYlqBv/1nET7XEipmiwgRRu2ViQSR2IJgHif3SwB6qHaghi2piL1HhTbpzkAolhCKhBQYwilL/I2xLmd2GsWc7H6qAk0MkYfiaZ47bRaQ9RC38U5bvo8FO+YjyEvO9JAcx3hxnzPbWGQLZd3QUhiD0AaKQULmhQ/hHUXEycGN2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712308109; c=relaxed/simple;
	bh=BFKhp2p2cRaZeTDBNXe7r5uMuOf4g9Fj5CtNhBTFbc8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CMVUrUkEWLbxCfpxWhWXrmG1Wq/hNMPsE7csAvX9qVv/r5gqsQGPjeJ7iSybGNBZaRUiialPc05A5r6+GX9L9W4gB85cZNN6sdJCnmvfXk+xVXb/+RdWi8seZZMDMEj+RUE2W3clinxshRCI5ynZIi25NS2/Cz1g6Ii7LT4rUYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O7KfdJPB; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O7KfdJPB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712308109; x=1743844109;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BFKhp2p2cRaZeTDBNXe7r5uMuOf4g9Fj5CtNhBTFbc8=;
  b=O7KfdJPBR6yxGOcfsa418vQEhkDDd4yQyEMp71aTjhHkpZeooPY69/6s
   XiAHJK2Nu1761DiopoM6BgF9a4zn28TStHEBz83lR10DR2mV1c5loKqIZ
   U/2I22V1dPvT1xWrOO0YYna+/qm6fXabJgzkSMU/RkRKwHmIVjnEVrI4Y
   YH0z861jkU4z5Y7VgTBfnCmBSsvSiL8iwRAJQOCZhROBcoWo14CVozmGM
   Eox+ZDsQuwVa2A31BZajcZzQp+IobwbVM7tb9nYFQ2NnsrBhdJ1l8Icwt
   lX5JWshi+lrJpVKmxz+koJ+0mRGG9VUH5RPIh9zIiQfwL/8vvrN47y+dK
   A==;
X-CSE-ConnectionGUID: aAog7NNgSD6h1qKJrk+eBg==
X-CSE-MsgGUID: e+L1+LufTpO5DC14ZKwYig==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7787483"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7787483"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 02:08:29 -0700
X-CSE-ConnectionGUID: c8jiGaVGR6eC+hJmH3y1xA==
X-CSE-MsgGUID: 4olMcQRLTv2YzPbZfkb8cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="19042451"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa009.jf.intel.com with ESMTP; 05 Apr 2024 02:08:26 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 11/13] ASoC: Intel: avs: Init debugfs before booting firmware
Date: Fri,  5 Apr 2024 11:09:27 +0200
Message-Id: <20240405090929.1184068-12-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240405090929.1184068-1-cezary.rojewski@intel.com>
References: <20240405090929.1184068-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When bringing up setups it's vital to have access to debug functionality
even if firmware boot fails. As order of probe()ing operations is
changed, update remove() procedure accordingly.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index d7f8940099ce..76782a0f32bc 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -209,6 +209,7 @@ static void avs_hda_probe_work(struct work_struct *work)
 
 	snd_hdac_ext_bus_ppcap_enable(bus, true);
 	snd_hdac_ext_bus_ppcap_int_enable(bus, true);
+	avs_debugfs_init(adev);
 
 	ret = avs_dsp_first_boot_firmware(adev);
 	if (ret < 0)
@@ -217,7 +218,6 @@ static void avs_hda_probe_work(struct work_struct *work)
 	adev->nhlt = intel_nhlt_init(adev->dev);
 	if (!adev->nhlt)
 		dev_info(bus->dev, "platform has no NHLT\n");
-	avs_debugfs_init(adev);
 
 	avs_register_all_boards(adev);
 
@@ -548,9 +548,9 @@ static void avs_pci_remove(struct pci_dev *pci)
 
 	avs_unregister_all_boards(adev);
 
-	avs_debugfs_exit(adev);
 	if (adev->nhlt)
 		intel_nhlt_free(adev->nhlt);
+	avs_debugfs_exit(adev);
 
 	if (avs_platattr_test(adev, CLDMA))
 		hda_cldma_free(&code_loader);
-- 
2.25.1

