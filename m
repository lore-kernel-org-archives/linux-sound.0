Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB0428C03C
	for <linux-sound@vger.kernel.org>; Tue, 29 Jul 2025 11:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753788097; cv=none; b=N8EapvZ2Ksvcvn3lUH8SLGuXGcF2D7E0/OO0Lc4I6q/ACLHFiV28b4vyUPJ+iaAUjksZ1tYhG6ZptI//5SimmszUL2/3qhBqfG71QFxlx/PKc/go5HZwJii686FTCeMM8CBM4snQ98XhnUDpehs3DebejxOx+FXsoIYEtVaYkPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753788097; c=relaxed/simple;
	bh=204U5wZJX33LpFgEO+q3v+vK/+0sgTZhRsjVsiLjBCs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lrHBU2xk1GNupY3BeCEpHNKmXdGdMQ43RjJnpUwXzDfVklgk2J4squnmbTi29bv74OH14jp0BgaKbCmnNYdtNhtJr61sLXiRIU4SLmbu2tdyWYrC9dWZrh37QYxX2WH++KniULs/JozVzC9Os48rut1YkntlRH2dVPtYabENma0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mICSCrCT; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mICSCrCT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753788097; x=1785324097;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=204U5wZJX33LpFgEO+q3v+vK/+0sgTZhRsjVsiLjBCs=;
  b=mICSCrCT6zMOCQeYoxRbgCyyiZoCzlwKoc2FLOTacgcwzH70CI7NeI1R
   j4y9aZYBZ09IaHLB7kJcnD7s9FDg9WBuef1N+VTHiAIjAd4L7COhUnxWe
   LNdjMszouDQofpVpycM0lEXoEOccIQhNtg+DIZPZDoh8Qc+SABJlc4Vw7
   VEXWPxZt8xgCSHFa9BF5ZEvdGa56rgvV2MiT19sSw7emo4zb4pxTZwPw1
   ziRvaqhY/WaE5FAo3h3gZOK9I+0RmZnCASbUMi4xBgAh0YUJ2KbpjQnmf
   8Be6F1VNjuPyZOmV1OoefFRLePbMXSIkc61/BK5OXW4kJ+Cwie4cPl9lx
   g==;
X-CSE-ConnectionGUID: qxtw1dYeQ6CgRh+xZ97GUA==
X-CSE-MsgGUID: yN1OfCVxRkKNZdKro0wh+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="67137333"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="67137333"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 04:21:36 -0700
X-CSE-ConnectionGUID: XFJcdbyHT1exahXmkRU1Kw==
X-CSE-MsgGUID: alnDf4+MRQiTRGUoUCAh6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="161945135"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa006.jf.intel.com with ESMTP; 29 Jul 2025 04:21:34 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 1/2] ASoC: Intel: avs: Synchronize happy and error paths in PCI probe
Date: Tue, 29 Jul 2025 13:42:28 +0200
Message-Id: <20250729114229.309472-2-cezary.rojewski@intel.com>
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

Error path in avs_pci_probe() does not match its happy path.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 7af324753673..5ea42b5af26f 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -505,11 +505,11 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 	return 0;
 
 err_i915_init:
-	pci_free_irq(pci, 0, adev);
-	pci_free_irq(pci, 0, bus);
-	pci_free_irq_vectors(pci);
-	pci_clear_master(pci);
 	pci_set_drvdata(pci, NULL);
+	pci_clear_master(pci);
+	pci_free_irq(pci, 0, adev);
+	pci_free_irq(pci, 0, bus);
+	pci_free_irq_vectors(pci);
 err_acquire_irq:
 	snd_hdac_bus_free_stream_pages(bus);
 	snd_hdac_ext_stream_free_all(bus);
-- 
2.25.1

