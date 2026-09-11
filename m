Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C705B45561B
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 11:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125816; cv=none; b=CSbF9ZOt4lXOZZ6+kc9iEHlKnkmWYDcgxRgAlHb+HjcXkr38J307R74Mkjr4syzl77k2qTnfTalgxyAWj/3NH9YPn0mmG7V0DULwWF4qcWVwtLZtN1ffNjaD4P/oco6BbQbWrKoEnpqWUtIzJhd+CtTYmOp1ye06uSukQjYL2Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125816; c=relaxed/simple;
	bh=9Jkf+IbId5pRv7cGTfxfYX43nTBcrEN5Jp+afTOTH6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EJt1qJssFyKnPeDqqBRqDofd2+j000DeRfNW2jtvaFS6skCmoHKQ/cMpQ/tLGVsYvWwYPvBOB+9/ThVGmFVKM1NB+gQKQSDuJyAW9CaKaAFC4cf256Cj/xgcDk9cqF9tbUhgnoc6AnoHh0ZUKqidwOaJLvIlxkw4IxB3hEAKPBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UijcVpVy; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UijcVpVy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789125813; x=1820661813;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9Jkf+IbId5pRv7cGTfxfYX43nTBcrEN5Jp+afTOTH6Q=;
  b=UijcVpVy0/IV2ShGhSksBRSQ6YAUlQXmMBdBjnkAjcItLwIBLtCKLOWb
   +u5jDHX76JvN0MGFA8txkbePckyW0DFwp8RnQdVaVwWn9haDw3yMDYV1V
   6TeirXjKYJK0c5r8PpA3h7POPUDN7LHagIjKp5FF6giBJpS9EVBc4thjx
   h4hvzzE2kZMiyMqV1KOIvxtZx0FZ/Uqh+AcQ4ONUUBCXtdvZolysf1Z8J
   3OcQsgNmWaOTDIVYfyCrx/1XL3moniwB0c7yGvcPfD9kV9MxP2TN4akpT
   6nsLuoJ0XyD7Izzx9qAU2efJhD68MZn5K6PRoN8AG8m2JUYOe8WK+YyvD
   g==;
X-CSE-ConnectionGUID: 3spJ96f/SjmUGjUNxUzqAQ==
X-CSE-MsgGUID: fhGSCfoeQJGC09yprjh/ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100750093"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="100750093"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:22:54 -0700
X-CSE-ConnectionGUID: Y0269zXTTCa0LsdMGmjFrw==
X-CSE-MsgGUID: HOEW/4HZRnuelAJCdGfZ8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="268213529"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.83])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:22:51 -0700
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
Subject: [PATCH v3 24/26] ASoC: SOF: Intel: Kconfig: Remove redundant IPC version selects
Date: Fri, 11 Sep 2026 14:21:50 +0300
Message-ID: <20260911112152.28528-25-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911112152.28528-1-peter.ujfalusi@linux.intel.com>
References: <20260911112152.28528-1-peter.ujfalusi@linux.intel.com>
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
2.55.0

