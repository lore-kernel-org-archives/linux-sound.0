Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C24143886
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145140; cv=none; b=XpzClxFz/eVCyhAzrI4lpXyW69pU/JBqq+nUygX12DRfmITkKWCke8ZuX1B8RzyUGmzz2xN5ZWA7+fWXRqX6IK5/v3vFXDZuc/MvUfeqjgE0I1xjzD9DTKnD7dMh4TYMtAqQI0ccN8D8EBwkjjgFpzmRzm2RFfHc4kcx6ueBSHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145140; c=relaxed/simple;
	bh=9KdLJGT0Jtt9BZjRlZNGYHFz7tLlvz+tfGdNnA+RmP8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dJOKJbFum08A/m+zMT8UXaPUvxfwKE13g7N2uqG9l1r1/Aqd32n+0J3IPWFVpAmTY/JBf8SRFmEIJD62UXwwzl6ZXXdDa7RYAZfKW04NbIYcbYFl97vJEOJpQCXli10GzBtVc1l1YXWR1Cvdikueur3i3jpblhqBlrRcUIZYPnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BBDm/nW+; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BBDm/nW+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145139; x=1745681139;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9KdLJGT0Jtt9BZjRlZNGYHFz7tLlvz+tfGdNnA+RmP8=;
  b=BBDm/nW+y12UN7i7LSN6Ypawo99a0DGfG2E13s5c8uhZDpo6j2B7Gv21
   Fshw1EuAC9asnw6Fob9XkqJow39z0xyx+6uhkFB1gnAxVtvaBZkcOTNDp
   SEmiLyaM/yJu7QMTNuMr8AyH49lpez6HLltoAGv3SaEF8ycbd7t4/lv6s
   iwc77qDmA/Ipn/Nuu1AR6MWqFUDNbQcxHAR26gvYLlIHBB8v1xFI/TzJ5
   oPZ2Am2VtUuZzQMlfrBDTRNBKvMfklxwc49oGff5sCPj/wlQBt+rpm7Qc
   tcKO/N9ZPoKSjLU1YpgG6/iDPsgmA4oacADq7EOxZSvmK4qbEnG8jpyos
   g==;
X-CSE-ConnectionGUID: xt/lIxrXRTiTQ0rScPkwsA==
X-CSE-MsgGUID: 9iZeStqmQj2p4ELRDFrziw==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291266"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="21291266"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:39 -0700
X-CSE-ConnectionGUID: OgZxMcjGRHq8BmpQmi32+w==
X-CSE-MsgGUID: QMKAmVIgTuOXNl8jeqoJEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30259528"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:38 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 00/23] ASoC: Intel: updates for 6.10 - part6
Date: Fri, 26 Apr 2024 10:25:06 -0500
Message-Id: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Last batch of cleanups from Brent Lu, with Chromebooks now supported
with fewer modular machine drivers.

Bard Liao (1):
  ASoC: Intel: sof_rt5682: add missing MAX98357A config

Brent Lu (22):
  ASoC: Intel: nau8825/rt5682: move speaker widget to common modules
  ASoC: Intel: sof_maxim_common: support MAX98390 on cml boards
  ASoC: Intel: sof_da7219: support MAX98390
  ASoC: Intel: sof_da7219: add cml_da7219_def for cml boards
  ASoC: Intel: sof_da7219: support MAX98390 on cml boards
  ASoC: Intel: bxt_da7219_max98357a: remove MAX98390 support
  ASoC: Intel: sof_da7219: support MAX98357A
  ASoC: Intel: sof_da7219: support MAX98357A on cml boards
  ASoC: Intel: bxt_da7219_max98357a: remove cml support
  ASoC: Intel: sof_da7219: add glk_da7219_def for glk boards
  ASoC: Intel: sof_da7219: support MAX98357A on glk boards
  ASoC: Intel: bxt_da7219_max98357a: remove glk support
  ASoC: Intel: sof_rt5682: add glk_rt5682_def for glk boards
  ASoC: Intel: sof_rt5682: support MAX98357A on glk boards
  ASoC: Intel: glk_rt5682_max98357a: delete driver
  ASoC: Intel: sof-rt5682: add mclk_en to sof_rt5682_private
  ASoC: Intel: sof-rt5682: remove SOF_RT5682_MCLK_BYTCHT_EN
  ASoC: Intel: sof_rt5682: add icl_rt5682_def for icl boards
  ASoC: Intel: sof-rt5682: add driver_data to sof_rt5682 board
  ASoC: Intel: sof-rt5682: setup pll_id only when needed
  ASoC: Intel: sof-rt5682: get bclk frequency from topology
  ASoC: Intel: sof-rt5682: support bclk as PLL source on rt5682s

 sound/soc/intel/boards/Kconfig                |  41 +-
 sound/soc/intel/boards/Makefile               |   4 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c | 179 +----
 sound/soc/intel/boards/glk_rt5682_max98357a.c | 693 ------------------
 sound/soc/intel/boards/sof_board_helpers.h    |   2 +
 sound/soc/intel/boards/sof_da7219.c           | 110 ++-
 sound/soc/intel/boards/sof_maxim_common.c     | 108 ++-
 sound/soc/intel/boards/sof_nau8825.c          |   4 -
 sound/soc/intel/boards/sof_realtek_common.c   |  93 ++-
 sound/soc/intel/boards/sof_rt5682.c           | 233 +++---
 .../intel/common/soc-acpi-intel-cml-match.c   |   4 +-
 .../intel/common/soc-acpi-intel-glk-match.c   |   4 +-
 .../intel/common/soc-acpi-intel-icl-match.c   |   2 +-
 13 files changed, 461 insertions(+), 1016 deletions(-)
 delete mode 100644 sound/soc/intel/boards/glk_rt5682_max98357a.c

-- 
2.40.1

