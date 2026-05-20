Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276F83F7AA6
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 15:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779289597; cv=none; b=soKCwx9FoyHatcuaPjz93ZZBPoF6hdTj0VlvhObdTosRivTZ6r2ErrKxwFoawhtRT0bY0LGkXQ34QCUjapQKyfyPp410xF7cv9QZHUbkEAZCkwSlW7+8bWcuvxfGHHep9GbIqsthysdGg+ocegB+7orChP6s6elLAGo6yZJNbow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779289597; c=relaxed/simple;
	bh=QPmReqTM5dhXJqWlsjb0f+pi3iIdeADgEiikNZOBoDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KJKhVqceGhcCHUhEWGS2mK2YflucyLcgL4s4nAnb4/JsxfbttZOQsdQBjoZjvjnNMimRv1hNvrCBgRhYc2X3R4Ay6mPh2U4/n92P9bHa/MzdxhtoEKTQbXqMJua3oPY9Vh2rFpyu4DCeqWKCSOMKmfiPFzIWFVwPUCWrTGensuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JYOiRU6j; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JYOiRU6j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779289597; x=1810825597;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QPmReqTM5dhXJqWlsjb0f+pi3iIdeADgEiikNZOBoDg=;
  b=JYOiRU6jv1sekl+rxa2usdw2MT+vtiNoxyUl2YQenQ6D83bqKp5WspWQ
   1AGxBLak80M5OqjYWkr+6ygA/HcN2Mlyrc19DEDi5FInqkB/YScH/KVb7
   Vs2D/kl81pScAdiveGyRahtCWO1ZDEpZcMiSum8TGwDY/ioDWM6otKZGm
   0ZNmmLPU5tcyQXihcW6eGu9aEtt3ZAy3L+Y/DnUMIB4u6TYpbmXtE918O
   uNsw8rHjNv8GhLG1L0ks2ZucbYnXAHp7O3Citjnm84m4CsenH9JPODngu
   FMSmcIEIvnfcT3gReoDVOCfd0mvocSnJ3wo7FTTooSxrQifmkakwMS2Aw
   A==;
X-CSE-ConnectionGUID: 5XLahs5zRuuqm+HxKyJlfQ==
X-CSE-MsgGUID: /Y5U0y95TEC4o+/j+vdGoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="91296857"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="91296857"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 08:06:36 -0700
X-CSE-ConnectionGUID: jum3Yem+TDC6GVYEzeJebw==
X-CSE-MsgGUID: 678kpTtFRUuyO33+bGjhJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="245188268"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.245.85])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 08:06:33 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH 2/2] ASoC: SOF: Intel: lnl: Enable offload for UAOL link
Date: Wed, 20 May 2026 18:06:39 +0300
Message-ID: <20260520150639.25301-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520150639.25301-1-peter.ujfalusi@linux.intel.com>
References: <20260520150639.25301-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The handling of UAOL (USB Audio Offload Link) is similar to SSP and DMIC,
it is handled by the DSP firmware.
Set the offload enable for it similar to SSP and DMIC.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/lnl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/lnl.c b/sound/soc/sof/intel/lnl.c
index 19f753dca30b..83703ebc6385 100644
--- a/sound/soc/sof/intel/lnl.c
+++ b/sound/soc/sof/intel/lnl.c
@@ -20,11 +20,12 @@
 #include "lnl.h"
 #include <sound/hda-mlink.h>
 
-/* Configure DSP offload for DMIC/SSP */
+/* Configure DSP offload for DMIC/SSP/UAOL */
 static void hdac_bus_set_dsp_offload(struct hdac_bus *bus, bool enable)
 {
 	hdac_bus_eml_enable_offload(bus, true, AZX_REG_ML_LEPTR_ID_INTEL_SSP, enable);
 	hdac_bus_eml_enable_offload(bus, true, AZX_REG_ML_LEPTR_ID_INTEL_DMIC, enable);
+	hdac_bus_eml_enable_offload(bus, true, AZX_REG_ML_LEPTR_ID_INTEL_UAOL, enable);
 }
 
 static int lnl_hda_dsp_probe(struct snd_sof_dev *sdev)
-- 
2.54.0

