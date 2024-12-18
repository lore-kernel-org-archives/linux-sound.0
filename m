Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333AC155756;
	Wed, 18 Dec 2024 08:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734508937; cv=none; b=GbAm/y6AhWfVzEcSsEXLA6GgCuY6kh1WqXnpBpDS3sngvYe/xJRhB4z7TM/ksTPwVzc8Lvj2lbEh3Mwsj5ZoYrjAx4JSD46/wxHAYjqNUZbhNTNtSlq6D0KZjr5R3B+MfebGH2Q/mYfL7d8KUcKOfkTHx0L04VpsmgCz/NVlj44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734508937; c=relaxed/simple;
	bh=jvAlNsj7PvV/k/Fe9dnzcN1U92u+RGexGn8RgE17u94=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Xjy2vevMBUrEPe6dk/p334hhSqDvo2z3hKLXgtHmwDVOqn0/Ni19mszypfitTOXUyA7r2tRipPei9ILdlE72kniwlmMM3MBchnSctotBLLp7rvlU01eOyv0nP6Yn9yGQcISc6YS2LHxvwAiK8ZP/H6TXg+q45aDypy3xrZRIZWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lpy1kvVr; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lpy1kvVr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734508935; x=1766044935;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jvAlNsj7PvV/k/Fe9dnzcN1U92u+RGexGn8RgE17u94=;
  b=lpy1kvVrTJnrmQcnrBfFKJcWhPL5rlho/1XXl4HoceFrHCAW26cdMCFp
   nbCKeRNX1I+Pp+iksariC+QtMaRNQM8iEHg65gOAMOFF1gP50Q+d9ryru
   ImmtDlLz+U4kXb/4tY9QHtFGsoNk5Jq/bCGe5wtycaUbpXyCYgMnPoD9L
   DD37mTfsAbvri4vZz89/GT7OIs7q6jI5Qv/JGm7rtjy5zHssiPbTu0txi
   nlp5h7c6PuBkKI4pA78Ytw9Ng+TLKw71HLCDTJFLXKb9xUfOvM2nYjPqm
   uGe3eCKqA/Hh1zmjl+SH9Tk0hboBhZme0+r+6NoH4aBPLSQDV0PLFI6KX
   g==;
X-CSE-ConnectionGUID: RAFAUs3qR6eAjRZ8uwaEAA==
X-CSE-MsgGUID: hsvCoxCqQ2urCoY+LcTHiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="45978490"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="45978490"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 00:02:06 -0800
X-CSE-ConnectionGUID: b/dkARUzRNaCxDpPWk5CBw==
X-CSE-MsgGUID: xSXgJLJAToWKtLTaWM0rlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101914640"
Received: from tfalcon-desk.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.220.206])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 00:02:03 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH v3 00/14] soundwire: add multi-lane support
Date: Wed, 18 Dec 2024 16:01:41 +0800
Message-ID: <20241218080155.102405-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds multi-lane support for SoundWire. We will get the lane
connection information from ACPI and use multiple lanes if the bandwidth
is not enough.

v2:
 - add 2 commits to fix the issue of starting streams simultaneously
v3:
 - Preventing accessing the non-exist codecs in the "program
   BUSCLOCK_SCALE" commit.

Bard Liao (12):
  soundwire: add lane field in sdw_port_runtime
  soundwire: mipi_disco: read lane mapping properties from ACPI
  soundwire: add lane_used_bandwidth in struct sdw_bus
  Soundwire: add sdw_slave_get_scale_index helper
  Soundwire: stream: program BUSCLOCK_SCALE
  Soundwire: generic_bandwidth_allocation: set frame shape on fly
  soundwire: generic_bandwidth_allocation: correct clk_freq check in
    sdw_select_row_col
  soundwire: generic_bandwidth_allocation: check required freq
    accurately
  soundwire: generic_bandwidth_allocation: select data lane
  soundwire: generic_bandwidth_allocation: add lane in sdw_group_params
  SoundWire: pass stream to compute_params()
  soundwire: generic_bandwidth_allocation: count the bandwidth of active
    streams only

Pierre-Louis Bossart (2):
  soundwire: stream: set DEPREPARED state earlier
  soundwire: generic_bandwidth_allocation: skip DEPREPARED streams

 drivers/soundwire/amd_manager.c               |   4 +-
 drivers/soundwire/bus.c                       |  65 ++--
 drivers/soundwire/bus.h                       |   3 +
 .../soundwire/generic_bandwidth_allocation.c  | 316 +++++++++++++++---
 drivers/soundwire/mipi_disco.c                |  40 ++-
 drivers/soundwire/qcom.c                      |   2 +-
 drivers/soundwire/stream.c                    |  71 +++-
 include/linux/soundwire/sdw.h                 | 192 ++++++-----
 8 files changed, 523 insertions(+), 170 deletions(-)

-- 
2.43.0

