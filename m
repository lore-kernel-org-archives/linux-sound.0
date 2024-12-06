Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD711DE2B1
	for <linux-sound@vger.kernel.org>; Fri,  6 Dec 2024 07:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733471956; cv=none; b=L2lW5nWaZq/fDuu4jJmgvln/7CgTAapXtx6utESFxRxHyKiRbEAvV9/TMTTgHMfh690P+cSFeekXmj6ZS+AqoQnInV2L75XBYDQafGtc/DiHZPE5Vhr5y4xYpqheuVqFxVIWLaNBFDjJANAl1rnq4V5E0nT6ee7P8JDTOo7FZjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733471956; c=relaxed/simple;
	bh=cTY5BqZovdXrEpWaq04ige/W7mSCjNxsuPa8V90kGDM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gtGhpumJPQtTqKqw/JyQk6t3PFCrYRDZxeM1DqDeFJq+SXMBLtAiyXzjLVklZg6y/Mcp9C8Wfsb8Ex8z+w4qZLvJRzAlvleSiXABgyW8MMDa6kf2AUqWYL+AYZcXGvFNxrw7IDIbg7rM0nkf0KxMOltUIFNm32C401pX9x0eai8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bixTMoQU; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bixTMoQU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733471955; x=1765007955;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cTY5BqZovdXrEpWaq04ige/W7mSCjNxsuPa8V90kGDM=;
  b=bixTMoQUCmlk2U797q8ATAryEl5KyAbwzXkxKjpfgW/pdABrPM6jEKin
   GRibkwAOWzNONS3ANeHS0Ly39xippJrgLn3RSn4alnLWgjMwmjuU/tC3E
   ToCdmErr9hmijd+EI05dv8N3NfwRAYrYv8/Q94h7hHGpnzp0dfxs7u58S
   BAYghRnvsnGjdIGLFHNuRbvz/VkkUfZahwAuh+Fq6TN4dFVfil4YrxU6F
   UNV4PyW9Wvc14V1TrHcHSRm51VW4gs42c1Dyk7G9QYGOsZAViBpna4fc2
   CqLoK6WZMGy3xiWSXkjcFGibO63ifRsKU+dGLbOpiUihEIaHECd27I/lB
   g==;
X-CSE-ConnectionGUID: 6wG0b/gsRMOLgWRS8KbzaA==
X-CSE-MsgGUID: h2YpnO7oRyirc49+GwMLAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="45192765"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="45192765"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 23:59:14 -0800
X-CSE-ConnectionGUID: E9WLJ808Tbe1h5mLIb4QRQ==
X-CSE-MsgGUID: 2Cly4PSvR/Ghrefiy39CMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="94144357"
Received: from ssimmeri-mobl2.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.220.179])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 23:59:13 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 00/10] ASoC: Intel: boards: updates for 6.14
Date: Fri,  6 Dec 2024 15:58:53 +0800
Message-ID: <20241206075903.195730-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

1. Fix the incorrect cfg-mics value in card->components string.
2. New codec match entries supports.

Bard Liao (6):
  ASoC: Intel: sof_sdw: correct mach_params->dmic_num
  ASoC: Intel: sof_sdw: reduce log level for not using internal dmic
  ASoC: Intel: sof_sdw: improve the log of DAI link numbers
  ASoC: Intel: soc-acpi-intel-ptl-match: add rt712_vb + rt1320 support
  ASoC: Intel: soc-acpi-intel-lnl-match: add rt713_vb_l2_rt1320_l13
    support
  ASoC: Intel: soc-acpi-intel-ptl-match: add rt713_vb_l2_rt1320_l13
    support

Simon Trimmer (4):
  ASoC: Intel: sof_sdw: Correct quirk for Lenovo Yoga Slim 7
  ASoC: Intel: sof_sdw: Add a dev_dbg message for the SOC_SDW_CODEC_MIC
    quirk
  ASoC: Intel: soc-acpi: arl: Correct naming of a cs35l56 address struct
  ASoC: Intel: soc-acpi: arl: Add match entries for new cs42l43 laptops

 sound/soc/intel/boards/sof_sdw.c              |  33 ++--
 .../intel/common/soc-acpi-intel-arl-match.c   |  45 +++++-
 .../intel/common/soc-acpi-intel-lnl-match.c   |  70 +++++++++
 .../intel/common/soc-acpi-intel-ptl-match.c   | 148 ++++++++++++++++++
 4 files changed, 282 insertions(+), 14 deletions(-)

-- 
2.43.0

