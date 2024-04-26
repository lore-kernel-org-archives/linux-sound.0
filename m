Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A5D2E639
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714144900; cv=none; b=sBqldTaqKRl9rnAgr/NRsVrxRirWD20ASIRKjipVZecnHb+3QJJlnr7vKl+O8h+QSbKLQTwpkr3gI4amwPfOdSUwkmPVOPgtCuoeSYcCUfN6a2LR35alj+nCnyZsljHda8/tivJK8zzoZqa86ECTeoOUUapa2jlaSMENHaB5vMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714144900; c=relaxed/simple;
	bh=Bc9QP0c31IBlHyJP5tGfFWIZJj8F1WYLFIKBuzXx+B8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=jPXES4PWsM5TXf1447vWTF8pWEBh5NtWM2F7yfKju+5dZfMpZfLdoUlPoJOw1kGPeJ7bJyaQ61j3OtugpiM8nGJAF57hRzJbKk444bT5D/hEmBKwqx0+s0TpzW9AL7STxI/R58wHI68kI1ZBsL7XmRVoWvyNCWhS4J5RPxmhcCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WSDmP1dl; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WSDmP1dl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714144899; x=1745680899;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Bc9QP0c31IBlHyJP5tGfFWIZJj8F1WYLFIKBuzXx+B8=;
  b=WSDmP1dlaWSn7zd5Db1Hl3jTRJzLdPrCAyjuWEbp8Uslm1sXUF9QG3an
   k+wkoQeELEcyGCGdPsh/WHQdRo61qPTd57cPZKcjnSOqGEHzyU+U7sp4P
   YCeUNGD6KqwqDrQI+0aIvJQhuVSf5dTY5MiMGu5zq9TvyGRwLXHsMBPWi
   6u9BW+s0x9oIEgrrdfD/uIGdkcuZfXSkf0/pWLKTRegE8Xt37B1+ul8Ee
   sGPqi8vdG9XBc5XlUDkDw1OCmnXUVjwFZmu/hDjl3MkaDdF1Q8NghmxOv
   yS3dAdzsSBvG2GV1JbQrE33DKQLmT4+aiz4+PLHmWVyx/XanaRYzjZd3H
   A==;
X-CSE-ConnectionGUID: OH7b4oViSkezKZ8wPK6s8w==
X-CSE-MsgGUID: AMSuMohgS2+GFnsWNB6BsQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21290584"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="21290584"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:21:38 -0700
X-CSE-ConnectionGUID: j/FPtnQIQ7+uUjz4L6M29Q==
X-CSE-MsgGUID: EKH9C/YiS6Wenei928mHcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30259021"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:21:38 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 00/12] ASoC: Intel: updates for 6.10 - part5
Date: Fri, 26 Apr 2024 10:21:11 -0500
Message-Id: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patchset corrects a couple of mistakes corrected, improves
snd_soc_card allocation.  The new functionality is mostly for
SoundWire platforms, with new SKUs for Dell and Acer, and support for
the Cirrus Logic bridge/sidecar amplifier topology.

Bard Liao (1):
  ASoC: Intel: sof_sdw: add a space before cfg-amp in components

Charles Keepax (2):
  ASoC: Intel: sof_sdw: Delay update of the codec_conf array
  ASoC: Intel: sof_sdw: Add callbacks to register sidecar devices

Mac Chiang (1):
  ASoC: Intel: soc-acpi-intel-lnl-match: adds RT714 and RT1318 support

Maciej Strozek (1):
  ASoC: intel: sof_sdw: Add support for cs42l43-cs35l56 sidecar amps

Peter Ujfalusi (3):
  ASoC: Intel: skl_hda_dsp_generic: Allocate snd_soc_card dynamically
  ASoC: Intel: skl_hda_dsp_generic: Use devm_kasprintf for the
    components string
  ASoC: Intel: sof_sdw: Allocate snd_soc_card dynamically

Pierre-Louis Bossart (4):
  ASoC: Intel: soc-acpi: mtl: add Dell SKU 0C64 and 0CC6
  ASoC: Intel: soc-acpi: mtl: add support for Acer Swift Go 14
  ASoC: Intel: sof-sdw: don't set card long_name
  ASoC: Intel: sof-sdw: really remove FOUR_SPEAKER quirk

 sound/soc/intel/boards/Kconfig                |   1 +
 sound/soc/intel/boards/Makefile               |   1 +
 sound/soc/intel/boards/bridge_cs35l56.c       | 137 ++++++++++++++++++
 sound/soc/intel/boards/skl_hda_dsp_common.h   |   1 +
 sound/soc/intel/boards/skl_hda_dsp_generic.c  |  50 +++----
 sound/soc/intel/boards/sof_sdw.c              | 106 ++++++++------
 sound/soc/intel/boards/sof_sdw_common.h       |  27 ++++
 sound/soc/intel/boards/sof_sdw_cs42l43.c      |  14 +-
 .../intel/common/soc-acpi-intel-lnl-match.c   |  52 +++++++
 .../intel/common/soc-acpi-intel-mtl-match.c   |  83 ++++++++++-
 10 files changed, 397 insertions(+), 75 deletions(-)
 create mode 100644 sound/soc/intel/boards/bridge_cs35l56.c

-- 
2.40.1

