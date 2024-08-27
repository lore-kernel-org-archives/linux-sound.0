Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852AFC8C7
	for <linux-sound@vger.kernel.org>; Tue, 27 Aug 2024 01:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724723024; cv=none; b=Frw/uYthjtbgMQVo/VOw6pQCze/qrJzWr2WAQoj/3QWYbbwQqiYxli4Uk/SvFT3w/obS5p43wP1IQvn6jKHUDgelvPuHhhh26SQD1deEc+Pu6fnDv+Kst1Hm0grRaWB1V++wqmtj5OgZspJDJYYXWSVOTtJm9lTqYvOzbLFziec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724723024; c=relaxed/simple;
	bh=WveAYwOKAJzMYTzihbDQIr1W96doHObiMQZJ89ke9PE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EvYLgX52TgNFOG6GsdWF+AbYhCKz+jgaz4wJiaqOpWtUp6p2jVOlHjvHLiXYFbAT5IUSlAsJ/EUcIgHJgyd3cEs7YcQR3aeoNqni/AYk/WHLXykflHmJx5cru+33efba1l648shc3rsb2SrDHzd2jlmDsacZQJt0l3nMMPjzaQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FfWh1mp9; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FfWh1mp9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724723022; x=1756259022;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WveAYwOKAJzMYTzihbDQIr1W96doHObiMQZJ89ke9PE=;
  b=FfWh1mp9mjtRypInN4TDj/AIQTntMT5q5xDoVL30RHVf2+jbPUfm/tAv
   1yt/7wl76GXb5bO4VX2p3MAzv/IhEz2KmU7ybyPHxbcDDYIFmschPhWl4
   rJsMhNMqVpXZGKvrVvlWbDXvMyl1r9miIAc7vyJ9hetu53rYEEJeoD1pP
   wUtjng/LHhlKAukj7L7WAYYIeCb1upjWop/WaE2Bn7RvdQiEpaLx877+T
   vyFPUz9Z5JNb83aEBx6lp86XmAkhdBFq3trgCaM/bip1clZMvhe3TyN0u
   +Rle8KQ5ekmc7Lgc05wD9++Fg6ekwQqVd4EnBOxRVOzKyUbSuSWwWHdFS
   Q==;
X-CSE-ConnectionGUID: z7ZXqIB3SiiESQWNOXbS3g==
X-CSE-MsgGUID: 3siEni/ESsOBTDjofz1A9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="22984837"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="22984837"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 18:43:42 -0700
X-CSE-ConnectionGUID: PBe+GUtoQuSE8SgOsZMK8A==
X-CSE-MsgGUID: 3kbmLFRPQKCWlHHBvE7tCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="63427701"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.39])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 18:43:39 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 00/16] ASoC: Intel: boards: updates for 6.12
Date: Tue, 27 Aug 2024 09:43:12 +0800
Message-ID: <20240827014329.6542-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some simplifications from Brent Lu for Chromebooks, a new SoundWire codec
support from Bard Liao, new cs42l43 match entries support from
Charles Keepax, Add quirks from some new Dell laptops from Maciej
Strozek, some ACPI match entries from Balamurugan C, and few bug
fixes from Pierre-Louis Bossart.

Balamurugan C (2):
  ASoC: Intel: soc-acpi: Add entry for sof_es8336 in ARL match table.
  ASoC: Intel: soc-acpi: Add entry for HDMI_In capture support in ARL
    match table

Bard Liao (4):
  ASoC: Intel: sof_sdw: add rt1320 amp support
  ASoC: SOF: Intel: hda: refactoring topology name fixup for HDA mach
  ASoC: Intel: sof_sdw: move ignore_internal_dmic check earlier
  ASoC: Intel: sof_sdw: overwrite mach_params->dmic_num

Brent Lu (4):
  ASoC: SOF: Intel: hda: refactoring topology name fixup for SDW mach
  ASoC: Intel: skl_hda_dsp_generic: support BT audio offload
  ASoC: Intel: skl_hda_dsp_generic: remove hdac-hdmi support
  ASoC: Intel: skl_hda_dsp_generic: use sof_hdmi_private to init HDMI

Charles Keepax (3):
  ASoC: Intel: soc-acpi: arl: Add match entries for new cs42l43 laptops
  ASoC: Intel: soc-acpi: adl: Add match entries for new cs42l43 laptops
  ASoC: Intel: soc-acpi: lnl: Add match entries for new cs42l43 laptops

Maciej Strozek (1):
  ASoC: Intel: sof_sdw: Add quirks from some new Dell laptops

Pierre-Louis Bossart (2):
  ASoC: Intel: sof_sdw: make sof_sdw_quirk static
  ASoC: Intel: boards: always check the result of
    acpi_dev_get_first_match_dev()

 sound/soc/intel/boards/Kconfig                |   2 +-
 sound/soc/intel/boards/bytcht_cx2072x.c       |   4 +
 sound/soc/intel/boards/bytcht_da7213.c        |   4 +
 sound/soc/intel/boards/bytcht_es8316.c        |   2 +-
 sound/soc/intel/boards/bytcr_rt5640.c         |   2 +-
 sound/soc/intel/boards/bytcr_rt5651.c         |   2 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c       |   4 +
 sound/soc/intel/boards/cht_bsw_rt5672.c       |   4 +
 sound/soc/intel/boards/skl_hda_dsp_common.c   |  56 ++--
 sound/soc/intel/boards/skl_hda_dsp_common.h   |  39 +--
 sound/soc/intel/boards/skl_hda_dsp_generic.c  |  58 +++--
 sound/soc/intel/boards/sof_es8336.c           |  12 +-
 sound/soc/intel/boards/sof_sdw.c              |  85 +++++-
 sound/soc/intel/boards/sof_sdw_common.h       |   2 -
 sound/soc/intel/boards/sof_wm8804.c           |   4 +
 .../intel/common/soc-acpi-intel-adl-match.c   | 105 ++++++++
 .../intel/common/soc-acpi-intel-arl-match.c   | 244 +++++++++++++++++
 .../intel/common/soc-acpi-intel-hda-match.c   |  12 +-
 .../intel/common/soc-acpi-intel-lnl-match.c   | 104 ++++++++
 sound/soc/sdw_utils/soc_sdw_rt_amp.c          |  11 +-
 sound/soc/sdw_utils/soc_sdw_utils.c           |  19 ++
 sound/soc/sof/intel/hda.c                     | 246 +++++++-----------
 22 files changed, 747 insertions(+), 274 deletions(-)

-- 
2.43.0

