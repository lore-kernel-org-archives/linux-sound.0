Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F0E3EAC8F
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 15:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779289593; cv=none; b=Qq//ptgmWeX/R40PwhXN2V7PmdlpMtzOQqOBui9mzTdxrPcX4FDtJ+tjjL1yzb9Au3mQU1CY5AQ4BoC4s5JINVwgrOt/JDyp2iKHsTS1wdKsO0WCtaSTJ4x5ydFGfLEXLtR6Jg8yngcCU7Z3xoDyWxA67+wDWBESR7GXyZqEvk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779289593; c=relaxed/simple;
	bh=jN9d0mJk7xyM1g3UgE8cm3/yhWEx4vHsGSL95W3y7s8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NyAkd0WegH6RIVhWO15ZeCCDAr0MIaNQy7rgb6OSmKMUWqjQjTOcQF4R8YntMvbmIvyy0NUtY5AVVSLigG/HE0xk7yy6guxTHK964ODSEuNaOvT+M+ag8Ggz4f8Zlz3F6L+hiMESpVaT3xKRLswaFUV6/oQuGrNFqNDS87M28cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dgox8meL; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dgox8meL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779289593; x=1810825593;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jN9d0mJk7xyM1g3UgE8cm3/yhWEx4vHsGSL95W3y7s8=;
  b=Dgox8meLFLTTaqGNAUpA8LEsqvIunX21AT5QJgpgXt/ZmtEvWvlg9ts0
   AR+y0wcOEbU3BMeJnmth6uY0Yuoa4xalO8yqxWWKVBRXJCsrm2vpqkXbL
   CzNatzGrYYmzojyvyM/J817WdwT1nElM6NXL1NkcmHcHsddUdGgsGV7db
   W/AfafXa23WU3krytNBPMnXmbmdrp/WyKf/T9Sc3S4Yj7/8A3JRKjwlXK
   Eh103/HpiaSlcBGHaaOKzxzrTBWJqkQyRI1xUZyNZd0/XdL628nHyePMx
   RhAsv5mHvT7dQHOxEUFT8N6Kr5cxWbLNDaNg5rzMM5lt4YBLUEQimDhev
   w==;
X-CSE-ConnectionGUID: x513JeMIQ3Wol+FucP64FA==
X-CSE-MsgGUID: uOsxd8t8SraBRllXJWo/MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="91296839"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="91296839"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 08:06:32 -0700
X-CSE-ConnectionGUID: GVwbgrUlQEekAR0exqqmLA==
X-CSE-MsgGUID: /QHkf/kGT+OAkn/UhGecow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="245188251"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.245.85])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 08:06:29 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH 0/2] ASoC: SOF: Intel: Enable offload for UAOL for LNL+
Date: Wed, 20 May 2026 18:06:37 +0300
Message-ID: <20260520150639.25301-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

The USB Audio Offload (UAOL) can only be used from the DSP side and
on Lunar Lake (ACE2) and newer platforms the access to it's register
space must be granted by the host, just like for SSP or DMIC.

This series enable the offload for UAOL for LNL or newer devices.

Regards,
Peter
---
Peter Ujfalusi (2):
  ASoC: SOF: Intel: hda-mlink/lnl: Convert offload enable functions to
    void
  ASoC: SOF: Intel: lnl: Enable offload for UAOL link

 include/sound/hda-mlink.h       |  5 ++---
 sound/soc/sof/intel/hda-mlink.c | 11 +++------
 sound/soc/sof/intel/lnl.c       | 40 +++++++++++++--------------------
 3 files changed, 20 insertions(+), 36 deletions(-)

-- 
2.54.0

