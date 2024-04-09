Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A6124B4A
	for <linux-sound@vger.kernel.org>; Tue,  9 Apr 2024 08:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712651923; cv=none; b=Xp3o0xjqeYrP4P8USbb7GHI6DkYAYq9btsYNthLOPMqvpvtOk7rx5k+7K5nSKYXR7yDtBNnXBSiOzQp9OzrUi7lbP4ij7cJzea4cokt0SJWO2XsLBSpAL0rnirfIYXxuEqPuHfVF1QdNYorN0PaiGQnA3psK4R25unyUEbh+78E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712651923; c=relaxed/simple;
	bh=vt0Tzy8vHY63Rz2v7++7eqkyQc52tw5P91aLYcSlS6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UuqK9xGxB4CnPU2dLWl1mTXY7/Oc3FP3tNsQtOPnH9bl0iyXVWSD9ixjb2349lh8l/QW+OgNzrn5CLzmQ5KRWg6B+3d6EQCg7VYpJ1qghr0MafKoVNKAJ2t+rnT70pGLciwSIwl6wNtlhX3vLa7u6Z8HGTzUDuChTkWTe2s0zmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e/H3ySUj; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e/H3ySUj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712651923; x=1744187923;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vt0Tzy8vHY63Rz2v7++7eqkyQc52tw5P91aLYcSlS6E=;
  b=e/H3ySUjTGoGD0rKhhYZnltHQNHtelBmjuqzXS1Z8WynhdIYht9naapY
   s8RWl0PXTzWW1lrq6nycvh0Q3CZwvU6e3U7jFXhw/WNn55amUPAsLJejb
   o6V6awuWQguhy/4R+TbaWQTXSBn3m3uM7zp7ydHduK3Ga48AZJTE7RG34
   fHsBUvpgrYJu5AfkvQcsMF1IUrPepj6XbLO/Y/sP8z34brT5DkWAx1Mlv
   IAqFEiahr8wb3xCAP+LkprFMvY44HjC/hetH0NBiCvXSizBFpdtT316Dw
   OQLrBiEAW46QFVD4eAPoDM6QQKgNQldpgIu0era9A71U0O5L6m/yML3tw
   w==;
X-CSE-ConnectionGUID: 4Sue+DAtSMKpmDhViughig==
X-CSE-MsgGUID: ADbagRlkQvKPv4lPqdWAQw==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="19108964"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="19108964"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 01:38:36 -0700
X-CSE-ConnectionGUID: Cbd8G+XXRTuwpWMBDzYtGQ==
X-CSE-MsgGUID: U4kvkMDDT6O9NiEt4OsXkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="20189883"
Received: from dpotapen-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.59.81])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 01:38:30 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	liam.r.girdwood@intel.com,
	ranjani.sridharan@linux.intel.com,
	perex@perex.cz
Subject: [PATCH 4/5] ALSA: hda: Intel: Select AZX_DCAPS_PIO_COMMANDS for Lunar Lake
Date: Tue,  9 Apr 2024 11:38:11 +0300
Message-ID: <20240409083812.14001-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240409083812.14001-1-peter.ujfalusi@linux.intel.com>
References: <20240409083812.14001-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is recommended that on Lunar Lake the PIO (immediate command response)
is used instead of CORB/RIRB for commands/verbs.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/pci/hda/hda_intel.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 1b550c42db09..6a3022a87245 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -289,6 +289,9 @@ enum {
 
 #define AZX_DCAPS_INTEL_BROXTON		AZX_DCAPS_INTEL_SKYLAKE
 
+#define AZX_DCAPS_INTEL_LNL \
+	(AZX_DCAPS_INTEL_SKYLAKE | AZX_DCAPS_PIO_COMMANDS)
+
 /* quirks for ATI SB / AMD Hudson */
 #define AZX_DCAPS_PRESET_ATI_SB \
 	(AZX_DCAPS_NO_TCSEL | AZX_DCAPS_POSFIX_LPIB |\
@@ -2503,7 +2506,7 @@ static const struct pci_device_id azx_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, HDA_RPL_PX, AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE) },
 	{ PCI_DEVICE_DATA(INTEL, HDA_MTL, AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE) },
 	/* Lunarlake-P */
-	{ PCI_DEVICE_DATA(INTEL, HDA_LNL_P, AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_LNL_P, AZX_DRIVER_SKL | AZX_DCAPS_INTEL_LNL) },
 	/* Arrow Lake-S */
 	{ PCI_DEVICE_DATA(INTEL, HDA_ARL_S, AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE) },
 	/* Arrow Lake */
-- 
2.44.0

