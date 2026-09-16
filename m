Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5E84FC8F5
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 12:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560284; cv=none; b=DMJXUVm5Gp5wB7BMDAzgaBN2jmwYvKwOb0DOdD253Q9On6LVOEbOYSFUx87o+WQw0RdRnX6/WjmJesX8MXeZ6Y/c5RNS5OPmUycdHhJ+F/ylk8c+0n5ch2d89nqOpUsn1xQ1k2EqoivOUwcovCKJN1XpxL09SfiKSyPYhN9gVO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560284; c=relaxed/simple;
	bh=T5qTYxjdj2xdMMRtR7NyE5a0nmSxNxYopagQJ6MGXfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hsZ1e7ozJ/UpEDt6yykrYlHoKSIvikxzzNIupw45wEz3rqQ6LI3GdqXtmcrM1qX9OMQDbPUTMowm6pjl5e+vVoj7gwXeKuQXAoxmksdvfvb2KVSM0esie8LC3FDakAXJIxm+Omy7ucAsGx/v3EwzDWO/nJLX7PxIsPmxDTtQpDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gEQUVVEQ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gEQUVVEQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789560272; x=1821096272;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T5qTYxjdj2xdMMRtR7NyE5a0nmSxNxYopagQJ6MGXfw=;
  b=gEQUVVEQBcuARjtiqq+Racx7l3y5T1UnuNLA/SDBPDscaT1iBh2t8Qh8
   /C9UOpNx9Mp9DH2QuJrJa1E1pHiYMRDV0xKXODTl++QdkAV1gxclHe7XF
   Y+413L/vhxOsIG6mxAg4P/BixnLbcaOANAhb8epeLPfxfhjrTmqVMkRNt
   Uu9foaWBsiL/bHZMgdwihqC1QcMpsGTh11gySbgguYQEVWt3ARhgOjRr3
   0CCgIeyDDHYp9C9U23xqMA8XkBR/N9nSIX9wynj79FZTJTVeMMiAq6WzH
   MGbCe3f3/HOZI5knHWdAYfJMkd2UUZojr+Aeu2im4ZZQGmng9O+Kmv5Xz
   g==;
X-CSE-ConnectionGUID: 2B5leTsIR3GP/JPqmfMdcQ==
X-CSE-MsgGUID: kfCJ+CgNRDiWuJOliulnFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77496575"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77496575"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:04:26 -0700
X-CSE-ConnectionGUID: egvsDiXtQwWWBbgyeypP0g==
X-CSE-MsgGUID: La3reT74SZenRAGw9r6BWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273294097"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.100])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:04:24 -0700
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
Subject: [PATCH v4 25/26] ASoC: SOF: Intel: Kconfig: Select compress support for TGL+ platforms
Date: Wed, 16 Sep 2026 15:03:19 +0300
Message-ID: <20260916120320.18318-26-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916120320.18318-1-peter.ujfalusi@linux.intel.com>
References: <20260916120320.18318-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Select SOF_COMPRESS for TGL and newer platforms, on Intel devices the
compressed support is available with IPC4 only.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/intel/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 840d5a36b958..02b41e4ccab2 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -213,6 +213,7 @@ config SND_SOC_SOF_INTEL_TGL
 	select SND_SOC_SOF_HDA_GENERIC
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	select SND_SOC_SOF_INTEL_CNL
+	select SND_SOC_SOF_COMPRESS
 
 config SND_SOC_SOF_TIGERLAKE
 	tristate "SOF support for Tigerlake"
@@ -249,6 +250,7 @@ config SND_SOC_SOF_INTEL_MTL
 	select SND_SOC_SOF_HDA_GENERIC
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	select SND_SOC_SOF_IPC4
+	select SND_SOC_SOF_COMPRESS
 
 config SND_SOC_SOF_METEORLAKE
 	tristate "SOF support for Meteorlake"
-- 
2.55.0

