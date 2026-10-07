Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4A43CAE7F
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 08:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363056; cv=none; b=ND5IcsC4WsTDSplztJRew72p1eat2xvbiEwLjzfeS3eamIj78zTQOOMfySdAhb4azHyCDFEIYOCNIjA4KeUdN9MViRTIC23Y336jrXsfiE2qi2w4C92fNbau9IHgWtYBMY2mRc05LYp2WvFOxcdTSeAW3Ao0yIerqRNiSCfkayc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363056; c=relaxed/simple;
	bh=EcwompUpoAVwCSJjkaglSBDihOX0JXKx6cUn7pQFkNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JRdpxjZh57ypkAJSJf6O1NSVxKzwxEii2N67tp6Rk1vKsNpz+yNUPBTrLwR7eNQ70hl1nSjJ7BMVUYWG0gLGnUEQrT6sZj9wgmtDqrRhWB0iAeK0v8PhuLlHifyGvp9BLyWUHJdVbK+EE5qcLl2qnKO0Dd6/Q1AOD5/qK6tRXeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cAdqP0eT; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cAdqP0eT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791363056; x=1822899056;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EcwompUpoAVwCSJjkaglSBDihOX0JXKx6cUn7pQFkNA=;
  b=cAdqP0eTg9JnDFYG3m8l35U8mrwgE8TTzz1WLnK3wx71w/MDwygzrZyV
   TgU76qL9nMsP3A0+eIHngivMJzhimtvaKGaeBbHg6GyF+8VS1Js7C30US
   9DabIbkFdnQ8Y3GFI0ZKmU5SZ8ODIzz/M5BweeUlVeP5bpahWSeNCfBJD
   CYZXEnX8Rarli9B3TUrIS8s2UdyBVgL0D8sKqAJHbi1hfL4Axbss2FisU
   MKa3fcUwie/RdB7URwZMxtMQXFu4+glZcA9xdRyIFTDTD0JvVCbesdjQ7
   s4fbIzqb6GrQFVQCpeFhnrmvn1jBxubn60pn+o+a+FiLTDt+fc95d9dzo
   Q==;
X-CSE-ConnectionGUID: nsnpY6NcThi5OUPXPzrD1Q==
X-CSE-MsgGUID: NSjFW6IQSzaWkzz74jHGng==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="114084"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="114084"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:50:56 -0700
X-CSE-ConnectionGUID: KTeP5mYnRzuqvZD3IeMlgQ==
X-CSE-MsgGUID: g9IBD3dSQ4KKVTfVCit9Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="280670841"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.188])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:50:53 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com
Subject: [PATCH v5 26/28] ASoC: SOF: Intel: Kconfig: Remove redundant IPC version selects
Date: Wed,  7 Oct 2026 11:49:53 +0300
Message-ID: <20261007084955.1256-27-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007084955.1256-1-peter.ujfalusi@linux.intel.com>
References: <20261007084955.1256-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no need to select IPC3 and IPC4 along with INTEL_CNL as INTEL_CNL
selects both.

Similarly, INTEL_MTL selects IPC4, so there is no need to do that for LNL,
PTL and NVL.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/intel/Kconfig | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 915abbef398d..840d5a36b958 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -186,8 +186,6 @@ config SND_SOC_SOF_INTEL_ICL
 	tristate
 	select SND_SOC_SOF_HDA_GENERIC
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
-	select SND_SOC_SOF_IPC3
-	select SND_SOC_SOF_IPC4
 	select SND_SOC_SOF_INTEL_CNL
 
 config SND_SOC_SOF_ICELAKE
@@ -214,8 +212,6 @@ config SND_SOC_SOF_INTEL_TGL
 	tristate
 	select SND_SOC_SOF_HDA_GENERIC
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
-	select SND_SOC_SOF_IPC3
-	select SND_SOC_SOF_IPC4
 	select SND_SOC_SOF_INTEL_CNL
 
 config SND_SOC_SOF_TIGERLAKE
@@ -268,7 +264,6 @@ config SND_SOC_SOF_INTEL_LNL
 	tristate
 	select SND_SOC_SOF_HDA_GENERIC
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
-	select SND_SOC_SOF_IPC4
 	select SND_SOC_SOF_INTEL_MTL
 
 config SND_SOC_SOF_LUNARLAKE
@@ -285,7 +280,6 @@ config SND_SOC_SOF_INTEL_PTL
 	tristate
 	select SND_SOC_SOF_HDA_COMMON
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
-	select SND_SOC_SOF_IPC4
 	select SND_SOC_SOF_INTEL_LNL
 
 config SND_SOC_SOF_PANTHERLAKE
@@ -302,7 +296,6 @@ config SND_SOC_SOF_INTEL_NVL
 	tristate
 	select SND_SOC_SOF_HDA_COMMON
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
-	select SND_SOC_SOF_IPC4
 	select SND_SOC_SOF_INTEL_PTL
 
 config SND_SOC_SOF_NOVALAKE
-- 
2.56.0

