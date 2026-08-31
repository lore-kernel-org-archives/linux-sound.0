Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B583D9680
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 09:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168724; cv=none; b=G3w6Dtlv98AQ6PxIZKt6Ip6jn0BK08LJT9/1lILddSMJujG5+d0uz2aijfoXj3vOQiAxD/xAOduTTselaz5fEoDAVioWeyj6FsDeacy1P1B8EWL/SFOW8NL8Bu7tu44t2gj+k5kQgqU7T+wqCWkOjJMlLa4RS47TBxSYt4AqqoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168724; c=relaxed/simple;
	bh=CtQ6kZqYHhdakZYFpjMm08BG7u1bEbRN5FWLjQ8NooQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cOmo2uuJozIab0K/rZ3Pw147lnN5tocuRean1jRDxwcUCXQeM6DNrbjCtidec174Umf+2oVGcyzpxaVNmmHAKmQDTA4lq3n6qe+1MFnxUCoUi75CdLwiJ2hzlqptvDf6YpkhoPLx+vq4QzDa+XbTsWL+6ZOoS4jnKiEUSTBzxsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VD4wd4al; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VD4wd4al"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788168723; x=1819704723;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CtQ6kZqYHhdakZYFpjMm08BG7u1bEbRN5FWLjQ8NooQ=;
  b=VD4wd4alwYYYuAXWtg04F9b6TyPrTGEI4LOyHVCyUMoJ6KNqqKtnsSk3
   LEE5wRx+s+hxQutcbjxZfuJEzBuug4lS4/pCUuzynQv2siW3pCkMj6F7a
   RaCSRsdEXBNW6OSX8GB5otHIOqYSIxCVoCDcdvrW62ql0QAr5Tw73Z5Ss
   2fLPDxkEgwY2DOxOoUyzcBDEszzrkTGUgIpZ19/K0FRWjsBAz6zyXDqfs
   OtV899qSItRTxhPgDzwZcJllPUux3X3Rt5mRTZ8RyMz/A3MxuBwnW5/Pv
   vnB3+JNrBgYugaSNRtba4F2b1Y9W7weLOvREhiCZ43mTriVCw9Zu6AXoJ
   g==;
X-CSE-ConnectionGUID: lnJ4yCgnR0Gx99hCc0c+aQ==
X-CSE-MsgGUID: zM9c0xSpT5C/5w3sBklChA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88332882"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88332882"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:32:02 -0700
X-CSE-ConnectionGUID: Dif7VcvdS06GFSSjvYSYPg==
X-CSE-MsgGUID: CWKz9VsvTaOX2zVvnlb7cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="265507948"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa007.fm.intel.com with ESMTP; 31 Aug 2026 02:32:00 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 05/11] ASoC: Intel: avs: Clean up the bus when fetching ML caps fails
Date: Mon, 31 Aug 2026 11:36:09 +0200
Message-Id: <20260831093615.1117987-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831093615.1117987-1-cezary.rojewski@intel.com>
References: <20260831093615.1117987-1-cezary.rojewski@intel.com>
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

