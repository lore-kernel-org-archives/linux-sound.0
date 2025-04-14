Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B007F9
	for <linux-sound@vger.kernel.org>; Mon, 14 Apr 2025 06:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744612401; cv=none; b=m+A5m0nZnfCDDGQ1XirjnxvGz2r3gFCmxY760/JjzdidI/P8BxcUvOlrgpuy/IvOjb5mjotqWurYMHcs7lY6W98Z/xZ23arSZiOi8H94zO7HDPdqEf01phQuBm3cFTNBO1dSWcN/76DmXZTar85UnY4sKaqdV4J1T02ljI5mDfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744612401; c=relaxed/simple;
	bh=/3vtK4g0kQthNODKHIDSqLzZvJ9r+nePevlgeSRmG5g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AoLLGZByDFOKnTnWB4Q3eVRHS4uxYL/VHCLKtJxHPwkNuNugjnQE+H2CVgDfbJ1Cyjl31bi9TiecLl43zH67ONxWOsUMOf3QE8BFoUR0yyyIFULcS2CgqKZEdoNI/0OC+dYaQCmw9z6P+zBHTjDhVWKsUyqlDwh0fPL6F2Hx5FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fW/hHzSQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fW/hHzSQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744612399; x=1776148399;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/3vtK4g0kQthNODKHIDSqLzZvJ9r+nePevlgeSRmG5g=;
  b=fW/hHzSQs1rCpXR0RUnerFF06SLuXlOdcD4jZBAhjuBDN1somKMABW9D
   LgbkxBDBz+BioJXBb+DDQtAfnkporAubwFVPwfJscWlFTCTl/CPoG+05w
   R2WEKiaN190mLTAXHR0aYh2jSavVeFJ7dVhmYTC6Xlm3lyheCTslvAfaD
   lC1cLeLiXK1I/ZqAARxhbLt2bpOd3ASZ7FBoOR7cx0Asu1dQu53/1Jy3t
   ETq/Nquk1UH5aIqjEqz3slFbGy4rt8R5yd5hQ9xCIJ3sYHIUck6qJgtPd
   o2TUr/PJDXHbz10dLEpfszMbTiFiLb9tjTZkfhq5lsgZfEj53gWtbQPGk
   g==;
X-CSE-ConnectionGUID: czlRdds0SCKAc+9tB5aq3g==
X-CSE-MsgGUID: 5oYxjNVWQtuSEJBmfTj5QA==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="49872587"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="49872587"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 23:33:16 -0700
X-CSE-ConnectionGUID: o4oLd+vFTauRKTwbIWUxBg==
X-CSE-MsgGUID: QogpczO0Qt+VuHGB4NHl3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="130275256"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.73])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 23:33:15 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 00/11] ASoC: skip the endpoint that doesn't present and
Date: Mon, 14 Apr 2025 14:32:28 +0800
Message-ID: <20250414063239.85200-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A codec endpoint may not be used. We could check the present SDCA
functions to know if the endpoint is used or not. Skip the endpoint
which is not used. And load the topology dynamically for each endpoint.
With this feature, we don't need to use the quirk to determine the
existence of the optional codec DAIs.

Bard Liao (11):
  ASoC: SOF: topology: allocate string for tuples
  ASoC: SOF: topology: don't convert error code
  ASoC: soc-acpi: add get_function_tplg_files ops
  ASoC: SOF: topology: load multiple topologies
  ASoC: Intel: add sof_sdw_get_tplg_files ops
  ASoC: Intel: soc-acpi-intel-lnl-match: set get_function_tplg_files ops
  ASoC: Intel: soc-acpi-intel-arl-match: set get_function_tplg_files ops
  ASoC: Intel: soc-acpi-intel-ptl-match: add get_function_tplg_files ops
  ASoC: Intel: soc-acpi-intel-mtl-match: add get_function_tplg_files ops
  ASoC: sdw_utils: split asoc_sdw_get_codec_name
  ASoC: soc_sdw_utils: skip the endpoint that doesn't present

 include/sound/soc-acpi.h                      |  13 ++
 sound/soc/intel/common/Makefile               |   2 +-
 .../intel/common/soc-acpi-intel-arl-match.c   |   9 +
 .../intel/common/soc-acpi-intel-lnl-match.c   |   9 +-
 .../intel/common/soc-acpi-intel-mtl-match.c   |  11 +-
 .../intel/common/soc-acpi-intel-ptl-match.c   |  17 +-
 .../intel/common/sof-function-topology-lib.c  | 135 ++++++++++++++
 .../intel/common/sof-function-topology-lib.h  |  15 ++
 sound/soc/sdw_utils/soc_sdw_utils.c           | 168 ++++++++++++++++--
 sound/soc/sof/topology.c                      |  92 +++++++---
 10 files changed, 428 insertions(+), 43 deletions(-)
 create mode 100644 sound/soc/intel/common/sof-function-topology-lib.c
 create mode 100644 sound/soc/intel/common/sof-function-topology-lib.h

-- 
2.43.0

