Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAA145198D
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 16:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194321; cv=none; b=lb6pin5/d3wqXvA0zJZa8Acsi3LLsAEDYSENkoDPTj7VZ9yrRMmWeA+B6OiY+yt9S5sZ68er8UOojswOpFoCqF2MEmAn46zUltYN9CdIgXJuRIwDWFMxozNbaShvDWRdbIwPrul45/1CtFRrv+HJMaaviMPOmyOlpeAXzqn5qJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194321; c=relaxed/simple;
	bh=CtQ6kZqYHhdakZYFpjMm08BG7u1bEbRN5FWLjQ8NooQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tb7n43kT11Zhy/XcTt+Lb/bIQSn7smzF+Gp85A6N+Ykxu3yn1JkvsJUay+wKWDbwous7e2xxnK5KPo50897Dy8GAJTbRwEOL1mLuQ6J1XobzYlY+zJrfolGOzZlldzz+zSgYCQrD6ImRXSQm0Rb4IfajJzItmChtspzM1LWEG34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NqSZUj+p; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NqSZUj+p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788194320; x=1819730320;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CtQ6kZqYHhdakZYFpjMm08BG7u1bEbRN5FWLjQ8NooQ=;
  b=NqSZUj+pfptarkOanjPGcIU0TfLUmYa/EnPccVYbyqb2/MEgfsYb7U7C
   HZskB18exJSnY0uKryCEAKXpPi4A3nVE3TY3zlF1S1wMciWyEB2vzhKSx
   jbwNsxM+AtOXNIE7n0hEoOIyQ0KwCXZhk/FJS8beU5R9yJW555Bojt9wT
   gfW+fOvboVuyyS1QNaajB0n7Qos4r+JvPfYbJyIZQ3GnyBQvGJlgRvwE0
   kmaW8yobJlPzuGbWqj+slUzOI+C/XebYDDzQ3llEMap4EFOF0p/9bzsnO
   E96UhvETXj+LF30SiKyOtvng5M1N9bkJuD3IUtWMLkSwAZZdwvItERfEs
   w==;
X-CSE-ConnectionGUID: VggzXKU7TFKx4yA2vVm1Lw==
X-CSE-MsgGUID: b7/cwibdQpKf6K3KYT52oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="111379729"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="111379729"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 09:38:39 -0700
X-CSE-ConnectionGUID: JVHyfrmbQzKuXv6gDB0ckA==
X-CSE-MsgGUID: I2Pv3RG3TlKHdnSnpM0OIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="274111787"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa005.fm.intel.com with ESMTP; 31 Aug 2026 09:38:38 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 04/10] ASoC: Intel: avs: Clean up the bus when fetching ML caps fails
Date: Mon, 31 Aug 2026 18:42:27 +0200
Message-Id: <20260831164233.1487766-5-cezary.rojewski@intel.com>
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

