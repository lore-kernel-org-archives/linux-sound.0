Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5332816DC3A
	for <linux-sound@vger.kernel.org>; Mon, 12 Aug 2024 09:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723455798; cv=none; b=RPSVh9PDZaJSgmB9a59Tmz0DsaNFKfnsddk2o3pL2y5OBekl97GbABFu//q/2bIwGstRsQ9PcMAWQe4hQaV6fWR1E5ciDu5yQJEXaP1TSpWryNqytxCUmXg2875CQIzMNhw6jfUf++4WNBUgcrFfTi4c/wjpwzctibrJjBlm1Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723455798; c=relaxed/simple;
	bh=IQNUWGHC66UR4O6UUaQ6ngebQk8RtJDKO+WWALJfVFY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LyFKm9RyaWVf5PTS5z4PanqiHUhjps7CN/aDUKBAGio7XBle+4XBqXmVNZ/R9qNN+2RV0ykfShIqGo0u1M7qsI1/aZoivFi5jCc/SXw0nO0HxlZDOlMhIDthPmtnE/ByFMB+pGzbA6RHVfGuEP90Eg8fYC+SabP2SQmyRJCNLb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DaY5FvqW; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DaY5FvqW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723455797; x=1754991797;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IQNUWGHC66UR4O6UUaQ6ngebQk8RtJDKO+WWALJfVFY=;
  b=DaY5FvqW9MueUxK64yLJyr8ofOi57M8zOzzSJgaiSxL+1ZIwrix3vFWU
   JZwhHBzr2lPnVIoRd0Qts3AVbAmXHZT8xcn2BQqOTZhvv/5E2Pod5IJ50
   qC32L5gFHt8HgWSCgAwC5UEaSV6SV4QJqV2vdl2K5g6q7T6JHg1mcXxKa
   nwcCiZu+BEOoeEumOvvwww4VFLPrKzAtc5iQtmjjM2xK8OfG8H4PcjuaN
   2Y5KeEOkl+bhei0h9ZcK2DNiaB9uPMY2DBuCa11o/5ZFmcUXiwewlyRhh
   sDjtRGGckWifHC86XwpyaDMwERft5fKbWktvenHAWv2Nv7CkK/iXmPlPl
   A==;
X-CSE-ConnectionGUID: 6R7eA0/oQuaFestcaB0AUQ==
X-CSE-MsgGUID: eoL5gFECRqONfVYjyV2zsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21364873"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="21364873"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 02:43:17 -0700
X-CSE-ConnectionGUID: Rux49i+NR+6oqFQQaRignQ==
X-CSE-MsgGUID: YWWQee5FQzGm4yhSf8w1+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="63057027"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa005.jf.intel.com with ESMTP; 12 Aug 2024 02:43:14 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	andriy.shevchenko@linux.intel.com,
	cujomalainey@chromium.org,
	lmajczak@google.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 12/12] ASoC: Intel: avs: Enable by default for all SST configurations
Date: Mon, 12 Aug 2024 11:43:28 +0200
Message-Id: <20240812094328.842661-13-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240812094328.842661-1-cezary.rojewski@intel.com>
References: <20240812094328.842661-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The skylake-driver is deprecated in favour of the avs-driver. As the
latter supports all configurations of its predecessor and more, update
the existing selection mechanism to acknowledge the SST flag.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/core.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index f2dc82a2abc7..da7bac09acb4 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -422,8 +422,14 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 	int ret;
 
 	ret = snd_intel_dsp_driver_probe(pci);
-	if (ret != SND_INTEL_DSP_DRIVER_ANY && ret != SND_INTEL_DSP_DRIVER_AVS)
+	switch (ret) {
+	case SND_INTEL_DSP_DRIVER_ANY:
+	case SND_INTEL_DSP_DRIVER_SST:
+	case SND_INTEL_DSP_DRIVER_AVS:
+		break;
+	default:
 		return -ENODEV;
+	}
 
 	ret = pcim_enable_device(pci);
 	if (ret < 0)
-- 
2.25.1

