Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E2740B360
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 13:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787836293; cv=none; b=Fgp7fOCRhNN6UskwxLcOktI/33kAqLxhy7Exo27KvqMRFv26NVx8wHbngb/3qtwANeYx9tZRc82XvGErEqGbGRmhOqw1F0/1r2bb068Yw2yDaewEMyvJiGRV9nPwqMicGZ8eZfMOL1mmFDN2N7u7n2Jz7IMnTJDHAdTFb9Tz8NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787836293; c=relaxed/simple;
	bh=CtQ6kZqYHhdakZYFpjMm08BG7u1bEbRN5FWLjQ8NooQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F3ZQ3/QkONQ9Wa1rZlpMp1fof60NBxMIKhXtP56e3tZMgOkr/UemWTLSSvxnZ0xhuVHk2ULcoQlqXfiSZkmmSJN8aZraNSaFmWT/SpglFzLAWqmixUTmaEmeszkfEA5kXkpjNhrDmX08Bha8o7gX0cc9UrNMTZxwjlQAfrSXTpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S0C1Ynv1; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S0C1Ynv1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787836289; x=1819372289;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CtQ6kZqYHhdakZYFpjMm08BG7u1bEbRN5FWLjQ8NooQ=;
  b=S0C1Ynv1QYHt+KqEMNNJfbcVpUDERffg4F9yKkwMPNtf1GcLSmx9IHWk
   WjBU5qZd+VOV1xaXcapHkEBLwh7TCUUffN8Hoxai56FDlvPPme83YCcYo
   vpscPmaEh979WTIDyfIe7eH6uOvjtvJXX0bKvHzcrVramEsDQPC0XEZAy
   l7oRGecsH14pnYJfFwW1qRwaOLEUaq98eqdyM4ISo14Ayq5y0+29SlDmK
   FZzWduOy5fwJnTmWHGOzT7YDri44NBNK6G5nJOMpTmfO40YZh4Gc1vqXO
   kThokVa+eLCjpMcW0qVMQNEAI3ktv4z698mCLEiIg+Q49EU2jMX8Ay53A
   g==;
X-CSE-ConnectionGUID: pg7/3Xj7S0OnZCGjfkiIvg==
X-CSE-MsgGUID: BVJic6hOTbSdVzqwncpDTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88539053"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88539053"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 06:11:02 -0700
X-CSE-ConnectionGUID: DrxyayWFSPqFDbkni+3U1g==
X-CSE-MsgGUID: W/XfWBaAQK2t4rh5Q05ukA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="263589343"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa006.fm.intel.com with ESMTP; 27 Aug 2026 06:10:54 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 04/10] ASoC: Intel: avs: Clean up the bus when fetching ML caps fails
Date: Thu, 27 Aug 2026 15:15:04 +0200
Message-Id: <20260827131510.1014084-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260827131510.1014084-1-cezary.rojewski@intel.com>
References: <20260827131510.1014084-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

snd_hdac_ext_bus_get_ml_capabilities() may fail and its return code
shall be checked and accounted for. Address the issue by updating the
error-path for avs_pci_probe().

At the same time, if the function in question succeeds but the next part
of avs_pci_probe() fails, the hlink list shall be cleaned up before
leaving the scope.

Fixes: 1affc44ea5dd ("ASoC: Intel: avs: PCI driver implementation")
Co-developed-by: Amadeusz Sławiński <amade@asmblr.net>
Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/core.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index f45256ff5bac..8f27a7d43718 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -475,8 +475,13 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 	}
 
 	snd_hdac_bus_parse_capabilities(bus);
-	if (bus->mlcap)
-		snd_hdac_ext_bus_get_ml_capabilities(bus);
+	if (bus->mlcap) {
+		ret = snd_hdac_ext_bus_get_ml_capabilities(bus);
+		if (ret < 0) {
+			dev_err(dev, "failed to get ml capabilities: %d\n", ret);
+			goto err_ml_cap;
+		}
+	}
 
 	if (dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64)))
 		dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
@@ -518,6 +523,8 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 	snd_hdac_bus_free_stream_pages(bus);
 	snd_hdac_ext_stream_free_all(bus);
 err_init_streams:
+	snd_hdac_ext_link_free_all(bus);
+err_ml_cap:
 	iounmap(adev->dsp_ba);
 err_remap_bar4:
 	iounmap(bus->remap_addr);
-- 
2.34.1

