Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC258374A1A
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 08:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788336859; cv=none; b=FOz3dfz0/205zeCX32meirlzCCyZ8XLCN0L2niEmMNL/UCS6DYlATVqI/rhdL5OoZImL7BeE1S7PacmgoldA5qIHZCCz489AOg13xwvTYtrrIOmq+lGm9lC0ksrwQow8VhFSQhVPXhe2bE3OmoocJfb/ihPPaGz6ICBnFEsEFD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788336859; c=relaxed/simple;
	bh=CtQ6kZqYHhdakZYFpjMm08BG7u1bEbRN5FWLjQ8NooQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oNGAghyenEZ5unlxuRULWPGG6ZfAWpq2fBci+ygCHhTgPr4AVbt8qm/ss/qMo1L1Ej8ANDe8NxBUuLxfssa64mxggBRQPIjG65SMwCmgk65jnh2mZ9QkfgQctBbxGcQyNh9d59OPPi4BPZwcL+WeiFq7RRBnWkBH+NzRV3rrEoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OtYOaVa8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OtYOaVa8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788336857; x=1819872857;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CtQ6kZqYHhdakZYFpjMm08BG7u1bEbRN5FWLjQ8NooQ=;
  b=OtYOaVa8waTjYcbIjv0caxMymHkZvNodNB+407CTA9Z50CYLT8zm4Ace
   Rdz4b7pc9rjts0XK6HidMZjqDfwYD43B83RsvswTMFe+UQZI1sBmh2VUQ
   qUl6/o7qN74LQUhgi+Vhpow4OiQCRul1lXp7aRdTcDUzLsKq94LfAHzkb
   j8jUbX7QU45tUBi9psNIcdFYLjvhLaiu19F/M5w9RMcGtthI1pjAlrfxD
   kD0h/pSRuFmL92a21mPkaqDvKijgByBuXQWoIXr6AusSQmQ/vh+B7kjXs
   jyNh1qiza4QapgYsQ6f+OQJ8VLBoBZJqdUW33h6vMYwMShioeLu5JFbXk
   A==;
X-CSE-ConnectionGUID: AFngKcT6Ru2N4RPJ9WEX1Q==
X-CSE-MsgGUID: zbY0E5f+TVOqmkzzkTuhRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="99120984"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="99120984"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 01:14:11 -0700
X-CSE-ConnectionGUID: rkYYaBMwSc++ZbbZ7puzow==
X-CSE-MsgGUID: 0ff/ghZESCS8vewDPFLK4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="266099066"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa007.fm.intel.com with ESMTP; 02 Sep 2026 01:14:09 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v4 04/10] ASoC: Intel: avs: Clean up the bus when fetching ML caps fails
Date: Wed,  2 Sep 2026 10:18:08 +0200
Message-Id: <20260902081814.1590883-5-cezary.rojewski@intel.com>
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

