Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748863B47FA
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 07:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788507155; cv=none; b=GWFcrx6rEFgxAkKhBcEnk9/Ar6ZJ8Qb5+7f0L5XCu9HZXFy1nQtWoa7rjMM/f2WMdRsdlJy+PvKe2oObZyrXOmgsm2wglaAAWEUtag7nRqGBw8FjkIW53PnBBshtfpSln0jsqFb68j1+aA2PHAXAjbHkeQ9hXZ4PhYONe9EiJy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788507155; c=relaxed/simple;
	bh=9Jkf+IbId5pRv7cGTfxfYX43nTBcrEN5Jp+afTOTH6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ll66iV/b9AAPtl+w8hjeTEsxugZZCMJqoMBQrMhkEOcLKePQHeO/chxB6sOeROCv5lYjNrvlHeduVVXprRyZPsK8GYkwyA+hzBWl/Myw46Tz8tU/cKTBo1ju//2FVtHvDFOBMNdSvX5c8fGtO9Upq8FJY8NhwiYMzAss5tU5v1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CSyaCIjb; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CSyaCIjb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788507153; x=1820043153;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9Jkf+IbId5pRv7cGTfxfYX43nTBcrEN5Jp+afTOTH6Q=;
  b=CSyaCIjbeHw2ZEkc7X1piDrJUatcn9S2/+CTHrftmymKLZYDZRwq1Dx4
   zFrkLtvpH03uJYj4Fa7w3A4tmRsth//msiEquPeTlqFQKIT4/GVduy3df
   Fso/piiSVPzfqVTjbubEIEl5WkNBkr3K0uAsJIw9C7UCY2rcyc/Re4vx2
   Z3Er6lpCSrOmGMAlEzyh/+THc0/4iMO7sLC/ndm0jCfO4Z9EgVjDvQr9A
   dXVLxXRdtvggA+LSNTYsO4W4aawUPF1C3W0OD4Awovb0n9pNSbhmCHyQT
   HLFCIFkLKvOQjCLGoqJCNe1Vqv5q52wt7fUfzRwXv3GD6wufff+0PGV8Y
   Q==;
X-CSE-ConnectionGUID: 0TpXypMDTHi5pmr7IP65AA==
X-CSE-MsgGUID: 4y4LHMa5RbuLbC007VOdvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="111778087"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="111778087"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 00:32:33 -0700
X-CSE-ConnectionGUID: KU3qt3s5RmSImNN5puUpdg==
X-CSE-MsgGUID: +eOInMBjTtm2+koKCPV6mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="293480709"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.213])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 00:32:30 -0700
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
	daniel.baluta@nxp.com,
	Vijendar.Mukunda@amd.com
Subject: [PATCH 21/23] ASoC: SOF: Intel: Kconfig: Remove redundant IPC version selects
Date: Fri,  4 Sep 2026 10:31:32 +0300
Message-ID: <20260904073134.29648-22-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
References: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
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

