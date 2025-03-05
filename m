Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3100924886C
	for <linux-sound@vger.kernel.org>; Wed,  5 Mar 2025 13:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741182931; cv=none; b=SfowoK9Utgwr0EWGnYkmD2pRj4TzBm0wDosuI8M4ast1LlbMsSWMJnM7iVJxEFUekT322TkwmVR1Sf46rPvoSNK4hzi4Eoc1qcH8DNFk8NkwB2M1rv5BHbu3STVjQlYHogeorjN92oNKtSUCMIdlG1UhlS+MyGXM49BoRs073IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741182931; c=relaxed/simple;
	bh=KQmk+wAoCCW5j67MpQ94/yhMMBNKCs/QOJyafmxbH6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gFx6cVTpWBedF80iCcZKeivL091KFDw1giUyGj4srMU8jm1RTyE+DdWvrFoq0Fx2RzLMRcEZ3inLUyzghbFZVfIHb9Rx220DB7MpKl7u38yDq3d6RLk8X2lnVoTgxIwYJczGlPGYG+eEaPB6eh5gvFjEuOafN6zxjtjzkp+gmcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AfAhB5u9; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AfAhB5u9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741182930; x=1772718930;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KQmk+wAoCCW5j67MpQ94/yhMMBNKCs/QOJyafmxbH6k=;
  b=AfAhB5u9mYPDx0AWIujHtiSwrkG92QGc4wlYSDfeR+7U1LKEH7qB4Z8M
   kqnda2Ny+4pa3kykzXcRjuy5AUjZI9/LBpmKMjJPihamNxQbP7ykRTTa8
   rLPFlVMJf9x5aB9gFXwkujW3aLw48eelBef2jjKN8n2yB39wfrNcye8xE
   /OWo+pt1kbhaDHLGD5s7+uVayK0JIL5RbMmeSz/kQk5wrNHDfMnaDQjmN
   zibLku4cYv6aBot92C9b9liUfcAIVasTyniBQCX0+Nu6BWRgALdyvMiYG
   yle7HqeLBtcTljxXjQtfKkrR5xrSdv82Pdf9OW2lcN3eiJvP2AMZKbm5E
   Q==;
X-CSE-ConnectionGUID: 5i5zPycoRgWW7aJ5CgvXMQ==
X-CSE-MsgGUID: Mm+yD9iHRLK7rv4c4wR1wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59558107"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="59558107"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 05:55:30 -0800
X-CSE-ConnectionGUID: ygda4UhjQ4iOu66dOWTaUA==
X-CSE-MsgGUID: iU4fIg4sS6KdmFSo7B8QFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="118847193"
Received: from bvivekan-mobl1.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.175.91])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 05:55:26 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 7/9] ASoC: Intel: soc-acpi-intel-ptl-match: add sdw multi function mockup codec
Date: Wed,  5 Mar 2025 21:54:41 +0800
Message-ID: <20250305135443.201884-8-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305135443.201884-1-yung-chuan.liao@linux.intel.com>
References: <20250305135443.201884-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a SoundWire multi function mockup codec support.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index 5c1ece913a18..28ee768efd57 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -374,6 +374,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-ptl-rt715-rt711-rt1308-mono.tplg",
 	},
+	{
+		.link_mask = BIT(0),
+		.links = sdw_mockup_multi_func,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-ptl-rt722.tplg", /* Reuse the existing tplg file */
+	},
 	{
 		.link_mask = BIT(0),
 		.links = ptl_rvp,
-- 
2.43.0

