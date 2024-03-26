Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD99713C8E1
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 16:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469120; cv=none; b=TtWEJ9DyOY/QyxaKuXbKVopJfjciM0tjkFyv431IcQL1rmm5YqZWsXU/vPa+bHZcQKp0DSUpaj/dHEdr4d6rm8T1sHQBwz8GWYfH7rFyBoh45ayxQJgtUJYcJyW7NWhe9+BiHNBtU3Nkc6cUWz6k5Evvr8s2aOEMUgswD3osV5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469120; c=relaxed/simple;
	bh=wRhfhjToHakmSR9CRlNx8W6ivELTkONsuiwLnu/7+sU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=RKnSwqBBesoO9vM452ZQy3bYCd0dKwHe1GNLhaMjOPsjDvkizvHr3dnhqP9WLJRapQg05vm0rpRQTX8BHOpRhwjD5Se1c6OWkHIpqZsq+G5Jga/OAmk6qcl6SYfW715dJ0h18Uul9Vkd0WUzDJB/XdJr1F0wHXQdnc7nuF2pibQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jZMCWh9k; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jZMCWh9k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469118; x=1743005118;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wRhfhjToHakmSR9CRlNx8W6ivELTkONsuiwLnu/7+sU=;
  b=jZMCWh9kvpgPXlDY3ztrapi/WCSkEx7Vb9fHJM/8+Ckjwpo9qetv9Duf
   E/Wk33EOXztc8YcUdNTwPZgtZ/rNurUCGVhxlunxpiTKjfc9AfFTKbmjY
   vTBHv/2fn2ep5U6DFtbEPi0WqGIy5YU/tI1I0AP+XPnCjA7LtydisdqBB
   zdzGeCl9dJVR98Ai0Q5xxpv1zeoZhlVJJ4H9/W5zkVIjMQMWrUCdZtbAh
   SF3y+Suv+E0H+DcPWGN747e6emZVgaFkCXZMdubD7bvovwiHJhCCElGcu
   11HVT6uWai1+HJsh1r+/QYA2OOANF7OChE1AGDardbwlYATNnnZy4Jc3w
   g==;
X-CSE-ConnectionGUID: n/t1bpiUR+mWaxcgPiML2Q==
X-CSE-MsgGUID: WnODvn9ZT3GMilR6hQlVlg==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260325"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="17260325"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="20482091"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:41 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 00/34]  ASoC: Intel: boards: updates for 6.10 - part2
Date: Tue, 26 Mar 2024 11:03:55 -0500
Message-Id: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This second part provides SoundWire-related cleanups and extensions
required by Realtek RT722 and Cirrus Logic codecs.

Also included is a cleanup of the RT715-sdca DAI naming and new tables
for ACPI-based board detections.

Balamurugan C (1):
  ASoC: Intel: soc-acpi-intel-arl-match: Add rt711 sdca codec support

Bard Liao (7):
  ASoC: Intel: sof_sdw: use generic rtd_init function for Realtek SDW
    DMICs
  ASoC: Intel: sof_sdw: remove unused rt dmic rtd_init
  ASoC: Intel: sof_sdw_rt722_sdca: set rtd_init in codec_info_list[]
  ASoC: Intel: sof_sdw_rt722_sdca: use rt_dmic_rtd_init
  ASoC: rt715-sdca: rename dai name with rt715-sdca prefix
  ASoC: Intel: sof_sdw: change rt715-sdca dai name
  ASoC: Intel: change cs35l56 name_prefix

Charles Keepax (26):
  ASoC: intel: sof_sdw: Make find_codec_info_part() return a pointer
  ASoC: intel: sof_sdw: Make find_codec_info_acpi() return a pointer
  ASoC: intel: sof_sdw: Make find_codec_info_dai() return a pointer
  ASoC: intel: sof_sdw: Only pass codec_conf pointer around
  ASoC: intel: sof_sdw: Set channel map directly from endpoints
  ASoC: Intel: sof_sdw: Move get_codec_dai_by_name() into sof_sdw itself
  ASoC: Intel: sof_sdw: Move flags to private struct
  ASoC: Intel: sof_sdw: Only pass dai_link pointer around
  ASoC: Intel: sof_sdw: Use for_each_set_bit
  ASoC: Intel: sof_sdw: Factor out SSP DAI creation
  ASoC: Intel: sof_sdw: Factor out DMIC DAI creation.
  ASoC: Intel: sof_sdw: Factor out HDMI DAI creation
  ASoC: Intel: sof_sdw: Factor out BlueTooth DAI creation
  ASoC: Intel: sof_sdw: Factor out codec name generation
  ASoC: Intel: sof_sdw: Remove no longer supported quirk
  ASoC: intel: soc-acpi: Add missing cs42l43 endpoints
  ASoC: Intel: sof-sdw: Add new code for parsing the snd_soc_acpi
    structs
  ASoC: Intel: sof_sdw: Move counting and codec_conf to new parsing
  ASoC: Intel: sof_sdw: Move ignore_pch_dmic to new parsing
  ASoC: Intel: sof_sdw: Move append_dai_type to new parsing
  ASoC: Intel: sof_sdw: Move generation of DAI links to new parsing
  ASoC: intel: sof_sdw: Factor out SoundWire DAI creation
  ASoC: Intel: sof_sdw: Don't pass acpi_link_adr to init functions
  ASoC: Intel: sof_sdw: Remove redundant initialisations
  ASoC: Intel: sof_sdw: Add quirk for optional codec speakers
  ASoC: Intel: sof_sdw: Add support for cs42l43 optional speaker output

 sound/soc/codecs/rt715-sdca.c                 |    4 +-
 sound/soc/intel/boards/Kconfig                |    1 -
 sound/soc/intel/boards/Makefile               |    4 +-
 sound/soc/intel/boards/sof_board_helpers.c    |   18 -
 sound/soc/intel/boards/sof_board_helpers.h    |    3 -
 sound/soc/intel/boards/sof_sdw.c              | 1118 ++++++++---------
 sound/soc/intel/boards/sof_sdw_common.h       |   42 +-
 sound/soc/intel/boards/sof_sdw_cs42l42.c      |    1 -
 sound/soc/intel/boards/sof_sdw_cs42l43.c      |   50 +
 sound/soc/intel/boards/sof_sdw_cs_amp.c       |    1 -
 sound/soc/intel/boards/sof_sdw_maxim.c        |    1 -
 sound/soc/intel/boards/sof_sdw_rt5682.c       |    1 -
 sound/soc/intel/boards/sof_sdw_rt700.c        |    1 -
 sound/soc/intel/boards/sof_sdw_rt711.c        |    2 -
 sound/soc/intel/boards/sof_sdw_rt712_sdca.c   |   25 -
 sound/soc/intel/boards/sof_sdw_rt715.c        |   26 -
 sound/soc/intel/boards/sof_sdw_rt715_sdca.c   |   26 -
 sound/soc/intel/boards/sof_sdw_rt722_sdca.c   |   38 +-
 sound/soc/intel/boards/sof_sdw_rt_amp.c       |    1 -
 sound/soc/intel/boards/sof_sdw_rt_dmic.c      |   54 +
 .../boards/sof_sdw_rt_sdca_jack_common.c      |    4 +-
 sound/soc/intel/boards/sof_ssp_common.h       |    7 -
 .../intel/common/soc-acpi-intel-arl-match.c   |   24 +
 .../intel/common/soc-acpi-intel-mtl-match.c   |   35 +-
 .../intel/common/soc-acpi-intel-tgl-match.c   |   35 +-
 25 files changed, 753 insertions(+), 769 deletions(-)
 delete mode 100644 sound/soc/intel/boards/sof_sdw_rt715.c
 delete mode 100644 sound/soc/intel/boards/sof_sdw_rt715_sdca.c
 create mode 100644 sound/soc/intel/boards/sof_sdw_rt_dmic.c

-- 
2.40.1

