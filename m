Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A5B4963CC
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 09:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945047; cv=none; b=FbMFLhky/CKsVdz5Kscw6rE+8f/FhE/EKq8LLhEDekXyGDcy/xWbBawHD+5jvbn2PEDxgQ7Z+0lg2XdLgO17lJvo/lqOU0b7DtDQfV5UOtavx8R9O1MzBNelFF340GSTU6lsO4uWo2xvFSQIznB+c/RP3lQV77C9QnoemZ5j3xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945047; c=relaxed/simple;
	bh=9Jkf+IbId5pRv7cGTfxfYX43nTBcrEN5Jp+afTOTH6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oXypOIUB2KdpiSXy3YMULSCtgDU3ydPbhaJy5uDQX30FGFXhaVjaMcraQbLHeCjHKzZcCc5GBJnHCLlTfls/COHevnhp8MhjNZeiWNN6y3GTdSvtT8pUgAoEu49np8plzxv37gOf8A7/FzjRzDJIUHzxFJr9QoKy8GdVbCbHoqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jVDwZsnF; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jVDwZsnF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788945046; x=1820481046;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9Jkf+IbId5pRv7cGTfxfYX43nTBcrEN5Jp+afTOTH6Q=;
  b=jVDwZsnFvkuH0DerFHbuuHagd8WfPbBQbwcG8DytOF1bjz/90gLFwhdX
   JHwlEVbIsqbmDZSfwuVGY3hnTAY1ALJZRyjXVFhDwjNBDe9BHSAmUjPNV
   4hzaqllJo4vrx7qQWR0OxiBU/qrmCTiTCT6Wz9MspZsuxe5RenLsTq9wx
   Mlrbo3u3z0PKHIcJDQpKyeaVfQDhPAAFRY6aiZQle4D0w4hNWtKq2vQkj
   jhbiK2p2A8Dglp82eP1WNPSt8DYmXLUZkG9+o8vO2cuCzgc6blrJLmgLY
   Y0e+sK7hw7A3a5/XhJTRcgJ0y/2nYJJanm7wU7Y4TIjSWOZodxKHT5vZE
   w==;
X-CSE-ConnectionGUID: GAt6pwGTQZGBD7FJyx0EfQ==
X-CSE-MsgGUID: 88Dz82kBR3WJvoEflZf0Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89200906"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89200906"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:10:45 -0700
X-CSE-ConnectionGUID: 9VghGwwITXWdVBEXyMZ+UQ==
X-CSE-MsgGUID: dKB5NLDnRS+CUJZJ3CzzFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="266973410"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.252])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:10:41 -0700
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
Subject: [PATCH v2 22/24] ASoC: SOF: Intel: Kconfig: Remove redundant IPC version selects
Date: Wed,  9 Sep 2026 12:09:47 +0300
Message-ID: <20260909090949.7503-23-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
References: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
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

