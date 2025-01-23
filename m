Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98D4212D86
	for <linux-sound@vger.kernel.org>; Thu, 23 Jan 2025 16:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737649406; cv=none; b=o71FLnIV5UaWjDzZSQBgMSmzfEsQE3eaG65E6FTG8Vmc79sndxPGCK5pTLy+ZX1bK6vNlHPQdKMvMZtlgJyaO+1ZbNu6pDsXfOcNFBnrvnfc6WQRAT0kGV/4Y3YvEl4/zNv/M0vLW85bPBPG1saHcHgwMM4rIyGuaT+nnauBbVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737649406; c=relaxed/simple;
	bh=CtcjxbxSMe9+UWegxhwcaOmTq/vY0kvzO1AvhGKXPgk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P4FOfI2y/Ff4zRs7VnBkp2ZRH1Qzff06/KRW7tqo5L3ee2avpBZf3JPIl9muZjb60E+B8oeJskmyCcWCjzTRlu/ZOwMWB9cjoH+CnGB0BLbDK02B8TWt9kC61BTJk13j85IE78z7m8rUgeM5Bq+90U2fWbpBPrgotosTHBTW+vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hCYCmOxa; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hCYCmOxa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737649405; x=1769185405;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CtcjxbxSMe9+UWegxhwcaOmTq/vY0kvzO1AvhGKXPgk=;
  b=hCYCmOxauxW+r5zPot06ZZ/cdyDxRDV6pnDTD2/T0wPvR0ztTL4vsXBV
   YwTxFoLt/T7SW2UmX4yL7K0NwzgMZDdGfyvEu7EGMO8ES5MrlxUFKsSZc
   jddfGZf6VJQj4XPimUaEz4TLpespMPeGEp6xj4sCk6z79RL4Wep2VNjuJ
   jLf9RED6EirQ4VFpk2ijF9ghwbESbM9khBpJM+lri8TyHxJV63SFpM0nN
   No23Faophraf8ChiLvpAef9II6ZEms2YOnK6cKRsb8LUiATwCzv3cp06k
   s5eJ4KSQQgLgmWHmXc/BbiXVc9A3WCVUkps5CNaDvoJ2I8n6ADpuyDkl2
   w==;
X-CSE-ConnectionGUID: 8dT6LCHuRryrYsaY7YcwiA==
X-CSE-MsgGUID: IAT02yblSzmcsJiQY6BAEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="55572586"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="55572586"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 08:23:25 -0800
X-CSE-ConnectionGUID: paFjBUZGS8SL/bAZvsX/SQ==
X-CSE-MsgGUID: 9lydH2isSNibEGiNJJThzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107346846"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa010.jf.intel.com with ESMTP; 23 Jan 2025 08:23:22 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 11/11] ALSA: hda: Select avs-driver by default on MBL
Date: Thu, 23 Jan 2025 17:36:34 +0100
Message-Id: <20250123163634.1451237-12-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250123163634.1451237-1-cezary.rojewski@intel.com>
References: <20250123163634.1451237-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The avs-driver is the recommended solution for MalibouLake (MBL, also
known as RPL-M) platform.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/hda/intel-dsp-config.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index f564ec7af194..9a8ead75be17 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -108,6 +108,10 @@ static const struct config_entry config_table[] = {
 			{}
 		}
 	},
+	{
+		.flags = FLAG_SST,
+		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_M,
+	},
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
 	{
-- 
2.25.1

