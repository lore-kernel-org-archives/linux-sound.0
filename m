Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB181BA89A
	for <linux-sound@vger.kernel.org>; Tue, 27 Aug 2024 12:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724761951; cv=none; b=erq126DXTDPDbrv8fm/jEcitzv+1gxZXvA9LcNka/g0wWwFDtkdSeVfcP5jhNWvH/9puJkvI3TU/o8RBqNNcVvhhjBNC7HuE/5ZeXglxZtxVQ1D3QAGz/hS65qy9cudEUK6pcIQfqcTY7YcSarR4AHMo+k1Vq7NWSXBbjQetS/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724761951; c=relaxed/simple;
	bh=XZjIcrOmSJhJQXEUd9LFHWSxEKFfLpXIp8/LP0n4Lk8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=f9J+Mm+6ZD8xz8gPYlZnV2I4ERlRmea9n3VEaEPOz3pYGU/J1X7QWHaL2RKB+8Siuj5g8wivbaJjlv/NeqMNMcjClrQCe0362NeLkIP0taKJ5DTuj+i2hDd1SNqF4lKyQt93vjfQLaNrrXzzsPB02cwJkFGpRtQ/+9Hfzan87AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N/PdmIZn; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N/PdmIZn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724761949; x=1756297949;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XZjIcrOmSJhJQXEUd9LFHWSxEKFfLpXIp8/LP0n4Lk8=;
  b=N/PdmIZn9PBV8X2Qhjx4Qg0F2jlNH7nE24UlJiMBeJsXMEX865o76bJJ
   CDeb/HVDsRuWcVRe5VDW54d8IyG0MfELIx/qDJHFJItOecitW6LoFT/2V
   4ZgRhMaPX0VlGZ34If8bDPJE5U15458toWWgkvJcQLc20/JAWtWsQYL31
   gvNYHzYD1y5W98UzzZb68JDyf4eF/I0nfalMDhj2wmkAFIMrrtcispBGu
   SX94G96mX8ytavn6u8SGaokislaK1ZJcDuEYdtjehNvP+3eaeCuQbAOMF
   7U3eM4QuYCkIhDb9mv9uoNeJSwq/wQMlpSlBJy7FPZeX8p5DscSNuwfNH
   A==;
X-CSE-ConnectionGUID: SsQrSzNgQ4+NTeaNV6U2yw==
X-CSE-MsgGUID: 9UZvh231Q+Kb+p6hQkrGOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="13235481"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="13235481"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:32:29 -0700
X-CSE-ConnectionGUID: eJX+oL4WS+ScGM26GuveKg==
X-CSE-MsgGUID: LRrSPY6aRUCeC5rS7/r9dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="62676756"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.39])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:32:26 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH v2 00/17] ASoC: Intel: boards: updates for 6.12
Date: Tue, 27 Aug 2024 20:31:58 +0800
Message-ID: <20240827123215.258859-1-yung-chuan.liao@linux.intel.com>
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

v2:
 - Add "ASoC: SOF: Intel: hda: support BT link mask in mach_params"
   commit to fix the build issue in v1.


Balamurugan C (2):
  ASoC: Intel: soc-acpi: Add entry for sof_es8336 in ARL match table.
  ASoC: Intel: soc-acpi: Add entry for HDMI_In capture support in ARL
    match table

Bard Liao (4):
  ASoC: Intel: sof_sdw: add rt1320 amp support
  ASoC: SOF: Intel: hda: refactoring topology name fixup for HDA mach
  ASoC: Intel: sof_sdw: move ignore_internal_dmic check earlier
  ASoC: Intel: sof_sdw: overwrite mach_params->dmic_num

Brent Lu (5):
  ASoC: SOF: Intel: hda: refactoring topology name fixup for SDW mach
  ASoC: SOF: Intel: hda: support BT link mask in mach_params
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

 include/sound/soc-acpi.h                      |   2 +
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
 sound/soc/intel/boards/skl_hda_dsp_generic.c  |  58 ++--
 sound/soc/intel/boards/sof_es8336.c           |  12 +-
 sound/soc/intel/boards/sof_sdw.c              |  85 +++++-
 sound/soc/intel/boards/sof_sdw_common.h       |   2 -
 sound/soc/intel/boards/sof_wm8804.c           |   4 +
 .../intel/common/soc-acpi-intel-adl-match.c   | 105 +++++++
 .../intel/common/soc-acpi-intel-arl-match.c   | 244 +++++++++++++++
 .../intel/common/soc-acpi-intel-hda-match.c   |  12 +-
 .../intel/common/soc-acpi-intel-lnl-match.c   | 104 +++++++
 sound/soc/sdw_utils/soc_sdw_rt_amp.c          |  11 +-
 sound/soc/sdw_utils/soc_sdw_utils.c           |  19 ++
 sound/soc/sof/intel/hda.c                     | 281 ++++++++----------
 23 files changed, 780 insertions(+), 278 deletions(-)

-- 
2.43.0

