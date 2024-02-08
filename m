Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2983F7EF04
	for <linux-sound@vger.kernel.org>; Thu,  8 Feb 2024 16:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707411357; cv=none; b=faEkfdrUvXkRsIXy6olhLeiYWUj82k0HnmOlB0LqxazrzXVD4pqJm3eHp4CLyTdHIWHfUK9z5cOU45XEctDPLw4hcLJpN4xsX9YIhjXsjoi8eTvfP/4ruCM2+KaDQ2Ude2BZbmYdZ0apD1m2jwOR39sG8VPqk0zcaGW4E/meD6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707411357; c=relaxed/simple;
	bh=ZO04wL1tfiNFuprBXPy/8XNgAqKDMvmp5LHnk4M/5d0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=EPLyE0ugbYKXo0BArOmVE4k9nDjHFZKIcNzgxlsjHGdNTAOQhB4130FtHFeLmzbuSg7PiGuiSL0DXCakXjSq49xWAejNGPNzfKtxEEcog6r3upHQ+U3GijSDjs8pTjYxaVGHWsVTaVg1/rkYeOrg2myMsdXhRJbSGKNbzBNUxpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZsXQIG+l; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZsXQIG+l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411356; x=1738947356;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZO04wL1tfiNFuprBXPy/8XNgAqKDMvmp5LHnk4M/5d0=;
  b=ZsXQIG+laSBHY7ozXZOp9GYSSexHXhzFyayEZf1E4YSX96mojIDu4qzE
   F8oKW4NZa3EKf+7I94BSTRU81WhiTywM3XN/v5rX6Ices3a4FfgPlEo8M
   2QD1nq5/4jdJiz9EvIwh2mUypWdd7vmB/eubKZE0p02zw/NuZX9RYA1BE
   oRpr/ZMG/EkLziL37Gah2q6vMx7ujZATUwtutifMqvXQcCt7DQymFGXa5
   d+R3Z0LO5fZNGiRS7rV7CXolzAQo40vbPcn8r+z7Ueg+jy+EHBIdIavW9
   CCmSTUc01tMcMJmg7JN3gUAPj1Q8gCsOHMQxxvMWBlAhIpI0B6JlkSw/T
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675299"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="395675299"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:55:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1690132"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain) ([10.212.92.130])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:55:55 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 00/24] ASoC: Intel: Machine driver updates for 6.9
Date: Thu,  8 Feb 2024 10:55:21 -0600
Message-Id: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A fairly large update this time, with Brent Lu's continued cleanup of
Chromebook cards, and updates for new SoundWire configurations.

Bard Liao (11):
  ASoC: Intel: sof_sdw: use single rtd_init for rt_amps
  ASoC: Intel: add get_codec_dai_by_name helper function
  ASoC: Intel: sof_sdw_rt_sdca_jack_common: use helper to get codec dai
    by name
  ASoC: Intel: sof_sdw_rt711: use helper to get codec dai by name
  ASoC: Intel: sof_sdw_rt712_sdca: use helper to get codec dai by name
  ASoC: Intel: sof_sdw_rt700: use helper to get codec dai by name
  ASoC: Intel: sof_sdw_cs42l42: use helper to get codec dai by name
  ASoC: Intel: sof_sdw_rt5682: use helper to get codec dai by name
  ASoC: Intel: sof_sdw: add common sdw dai link init
  ASoC: Intel: sof_sdw: remove .init callbacks
  ASoC: Intel: sof_sdw: starts non sdw BE id with the highest sdw BE id

Brent Lu (8):
  ASoC: Intel: sof_rt5682: board id cleanup for jsl boards
  ASoC: Intel: sof_rt5682: board id cleanup for tgl boards
  ASoC: Intel: sof_rt5682: board id cleanup for adl boards
  ASoC: Intel: sof_rt5682: board id cleanup for rpl boards
  ASoC: Intel: sof_rt5682: board id cleanup for mtl boards
  ASoC: Intel: sof_rt5682: dmi quirk cleanup for mtl boards
  ASoC: Intel: board_helpers: support DAI link order customization
  ASoC: Intel: sof_cs42l42: use common module for DAI link generation

Chao Song (2):
  ASoC: Intel: soc-acpi: add RT712 support for LNL
  ASoC: Intel: soc-acpi-intel-lnl-match: Add rt722 support

Charles Keepax (2):
  ASoC: Intel: ssp-common: Add stub for sof_ssp_get_codec_name
  ASoC: Intel: sof_sdw: Remove unused function prototypes

mosomate (1):
  ASoC: Intel: common: DMI remap for rebranded Intel NUC M15 (LAPRC710)
    laptops

 drivers/soundwire/dmi-quirks.c                |   8 +
 sound/soc/intel/boards/Kconfig                |   1 +
 sound/soc/intel/boards/sof_board_helpers.c    | 225 ++++++++++++------
 sound/soc/intel/boards/sof_board_helpers.h    |  29 +++
 sound/soc/intel/boards/sof_cs42l42.c          | 224 +++++------------
 sound/soc/intel/boards/sof_rt5682.c           | 151 +-----------
 sound/soc/intel/boards/sof_sdw.c              | 106 +++++++--
 sound/soc/intel/boards/sof_sdw_common.h       |  82 ++-----
 sound/soc/intel/boards/sof_sdw_cs42l42.c      |  35 ++-
 sound/soc/intel/boards/sof_sdw_cs42l43.c      |  25 +-
 sound/soc/intel/boards/sof_sdw_cs_amp.c       |   3 +-
 sound/soc/intel/boards/sof_sdw_maxim.c        |   4 +-
 sound/soc/intel/boards/sof_sdw_rt5682.c       |  35 ++-
 sound/soc/intel/boards/sof_sdw_rt700.c        |  35 ++-
 sound/soc/intel/boards/sof_sdw_rt711.c        |  19 +-
 sound/soc/intel/boards/sof_sdw_rt712_sdca.c   |  39 ++-
 sound/soc/intel/boards/sof_sdw_rt715.c        |  12 +-
 sound/soc/intel/boards/sof_sdw_rt715_sdca.c   |  12 +-
 sound/soc/intel/boards/sof_sdw_rt_amp.c       |  53 +----
 .../boards/sof_sdw_rt_sdca_jack_common.c      |  19 +-
 sound/soc/intel/boards/sof_ssp_common.h       |   8 +
 .../intel/common/soc-acpi-intel-adl-match.c   |  12 +-
 .../intel/common/soc-acpi-intel-jsl-match.c   |  10 +-
 .../intel/common/soc-acpi-intel-lnl-match.c   | 102 ++++++++
 .../intel/common/soc-acpi-intel-mtl-match.c   |   4 +-
 .../intel/common/soc-acpi-intel-rpl-match.c   |   4 +-
 .../intel/common/soc-acpi-intel-tgl-match.c   |   6 +-
 27 files changed, 585 insertions(+), 678 deletions(-)

-- 
2.40.1

