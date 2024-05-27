Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CEE17727
	for <linux-sound@vger.kernel.org>; Mon, 27 May 2024 19:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716838571; cv=none; b=VoUYEr1ZHNeSoxXkWmM7PvgeqWhyW38H0vkt7i4xnItyEdhCh3KVUhGSpWjr9M+weLAEEMs3wjedDkFXWw3sRpix5WvZeFKMdnsMDkTwRxbG5o1wqOtIwnaRs0im2nQQrfK0K5Lki2i08jys4sYpr3nc0HHdMsnJlDZYtjYJEcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716838571; c=relaxed/simple;
	bh=uaQrVDIfhVMkQXg7HL+yPst859jXYGd0ylxWouMztp4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QLp5/Dj+O2u6v63V+C12LhbAvw+392yDny47zTFvR81jKyqE5Lws6TE/XhMczENJEnORozrGmwAVyWigGMXt69JGPGNlLv3Lo4sfw8n7/o2PXDm3LMCDlJnF3INGMpWFeKXvloE5O8xMuBUDY1ejT90bZA24Gg+8m7oB3XkQpWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b4orHesx; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b4orHesx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716838569; x=1748374569;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uaQrVDIfhVMkQXg7HL+yPst859jXYGd0ylxWouMztp4=;
  b=b4orHesxAL3Qp5nC6FvW0pWBE1oQMwHz4OVkS/te0PERhb2IVm8+CZUb
   yZj2zsjYH8UMMGNTIhF+1i8uNiKQaRE8XQ1/w6xyrKnnU9UuqlQFH/o5v
   VMv3APja4hYtBOQi3Xn9hOqdQuqiAfqwM7SJU+joiG2iopsGhxtXBadlQ
   JBgolDXHctIHGZAXpyag2CpBGirI8gOuqCghG+wyplJppj95rDC7hBUZr
   43h8n3I0n6s0JVNCRa2ZuF62wjjU427o9NEO6AZE+EWvc515mTIfe5VR0
   sMYOdgJTMfbZrDWQyEM/55AGY/Nn5Csb7y3vnr6oam0PQ33MALK7W0MDy
   A==;
X-CSE-ConnectionGUID: FKDUzJrTQVK2JPn1BLvpdg==
X-CSE-MsgGUID: f9NisFu0QOiYv4Qs65y8pA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13339307"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="13339307"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:36:09 -0700
X-CSE-ConnectionGUID: gnmBmxaFRw+IaLcP++2zDw==
X-CSE-MsgGUID: UKyQp+snRIKvpnKZvX/gHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="58029750"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:36:08 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 00/18] ASoC: Intel: boards: updates for 6.11
Date: Mon, 27 May 2024 14:35:34 -0500
Message-ID: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

More simplifications from Brent Lu for Chromebooks, Bard Liao for
SoundWire, and support for new Dell SKUs w/ Cirrus Logic codecs added
by Charles Keepax.

Bard Liao (7):
  ASoC: Intel: sof_sdw_cs42l42: use dai parameter
  ASoC: Intel: sof_sdw_rt711: use dai parameter
  ASoC: Intel: sof_sdw_rt5682: use dai parameter
  ASoC: Intel: sof_sdw_rt700: use dai parameter
  ASoC: Intel: sof_sdw_rt_dmic: use from dai parameter
  ASoC: Intel: sof_sdw_rt_sdca_jack_common: use dai parameter
  ASoC: Intel: sof_sdw: remove get_codec_dai_by_name

Brent Lu (7):
  ASoC: SOF: sof-audio: rename dai clock setting query function
  ASoC: SOF: sof-audio: add sof_dai_get_tdm_slots function
  ASoC: SOF: ipc3-topology: support tdm slot number query
  ASoC: SOF: ipc4-topology: support tdm slot number query
  ASoC: Intel: maxim-common: rewrite max_98373_hw_params function
  ASoC: Intel: sof_da7219: remove local max98373 ops
  ASoC: Intel: sof_da7219: disable max98373 speaker pins in late_probe

Charles Keepax (4):
  ASoC: Intel: sof_sdw: Add missing controls for cs42l43/cs35l56
  ASoC: Intel: soc-acpi: Add match entries for some cs42l43 laptops
  ASoC: Intel: sof_sdw: Add quirks for some new Dell laptops
  ASoC: Intel: sof_sdw: Add quirks from some new Dell laptops

 include/sound/sof.h                           |   1 +
 sound/soc/intel/boards/sof_board_helpers.h    |   2 -
 sound/soc/intel/boards/sof_da7219.c           |  57 ++------
 sound/soc/intel/boards/sof_maxim_common.c     |  84 ++++++++++--
 sound/soc/intel/boards/sof_sdw.c              | 128 +++++++++++++++---
 sound/soc/intel/boards/sof_sdw_common.h       |   4 -
 sound/soc/intel/boards/sof_sdw_cs42l42.c      |  11 +-
 sound/soc/intel/boards/sof_sdw_rt5682.c       |  11 +-
 sound/soc/intel/boards/sof_sdw_rt700.c        |  11 +-
 sound/soc/intel/boards/sof_sdw_rt711.c        |  11 +-
 sound/soc/intel/boards/sof_sdw_rt_dmic.c      |  14 +-
 .../boards/sof_sdw_rt_sdca_jack_common.c      |  11 +-
 .../intel/common/soc-acpi-intel-arl-match.c   |  50 +++++++
 .../intel/common/soc-acpi-intel-rpl-match.c   |  50 +++++++
 sound/soc/sof/ipc3-topology.c                 |  14 +-
 sound/soc/sof/ipc4-topology.c                 |  14 +-
 sound/soc/sof/sof-audio.c                     |  20 ++-
 sound/soc/sof/sof-audio.h                     |   9 +-
 18 files changed, 338 insertions(+), 164 deletions(-)

-- 
2.43.0

