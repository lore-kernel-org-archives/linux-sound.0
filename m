Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4671C1A2C0A
	for <linux-sound@vger.kernel.org>; Thu,  9 May 2024 16:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715272468; cv=none; b=h7s8txb4kbvsbvQ/R7b34C6FEqHdYkoEP7n14IKRyQQ8ivhvlm1zUfOAekVsvlD2DTjHGbdTLXFxHNUzb727LRXROV0X796GXWxrmxEkEcIpybDTZ2mi35OPU5+qHn8Jtsskchs20NFnS2nFQu6RLyKWDWWZWeQZn9rTfZB0iyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715272468; c=relaxed/simple;
	bh=ncJGnKIOu5ywsCE8rC5Q/lv0W1aGj7Ux6Y8BGe223Ac=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=LTkU9WobaS/FLUIZlaQ8wfKqSyU1kOmwEiBlD3D76WyIJjqN+IJk89DA2q/PnKPMPVHlhZT+veYonlyiYmiGkypT3Jnb6+3N9Hcy2FyiN01cEOpg+Aus3s6r+018HZZ37omxlBoMXIlepYHqt668kxjugrVJIHP7qIVUtlsF7hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zq6BV/lc; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zq6BV/lc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715272466; x=1746808466;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ncJGnKIOu5ywsCE8rC5Q/lv0W1aGj7Ux6Y8BGe223Ac=;
  b=Zq6BV/lcTdN+1q7W3X0KMjDrXlLDe+QQReLz29hqnXK9dpCRLWoO0n2L
   feWv3GMiLklSCgScjJ5hsEO2hVbatx8k2dpDU5BJ4ZHh4dnxGhZbcATR0
   0uyGdC+n7raOdio1BQjyDKb2KHmAXqDqhaKppV10bY5+6N9PbdpBNZ67D
   Fp4D82AruHV2mNJnFrwrwKfBShWWeq4bp0B5928/mSLO+c+zufZVMwBkt
   KUjbLwHdnHTXiwKdeMiVJyxWjB+RDortiiEUv43uwDzBfv2Pfrxxscsqw
   DYNpFB2j7c/re+BWdM3cMaYlvrha1S0ScbVmMrOYVQ2Ml8YiFDwB6i9yT
   w==;
X-CSE-ConnectionGUID: MsPbUklgSF2rOBiWQWUqfw==
X-CSE-MsgGUID: RWDs1QJuRgykrmuod/+NFA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15017505"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="15017505"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:34:25 -0700
X-CSE-ConnectionGUID: +a3/sZKxSWmNtjuIgJ/Keg==
X-CSE-MsgGUID: bDF2b9gBQ+yX4bam6B5hqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="33760963"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.213.181.85])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:34:25 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 00/18] ASoC: Intel: updates for 6.10 - part7
Date: Thu,  9 May 2024 11:34:00 -0500
Message-Id: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patchset should be the last batch for this kernel cycle!

Brent Lu continued his cleanups to refactor and use fewer machine
drivers on Chrmebooks.

Bard Liao updated the sof-sdw machine driver to deal with UCM support
of the RT712 configuration. Note that this sof-sdw driver will be
refactored in the next kernel cycle to allow AMD and others to reuse
common SoundWire parts that are not Intel-specific. Initial changes
are described here: https://github.com/thesofproject/linux/pull/4967

Bard Liao (9):
  ASoC: Intel: sof_sdw_rt_sdca_jack_common: remove -sdca for new codecs
  ASoC: Intel: soc-acpi-intel-mtl-match: add cs42l43 only support
  ASoC: Intel: soc-acpi-intel-lnl-match: add cs42l43 only support
  ASoC: Intel: sof_sdw_cs_amp: rename Speakers to Speaker
  ASoC: Intel: sof_sdw: use generic name for controls/widgets
  ASoC: Intel: sof_sdw: add controls and dapm widgets in codec_info
  ASoC: Intel: sof_sdw: use .controls/.widgets to add controls/widgets
  ASoC: Intel: sof_sdw: add dai parameter to rtd_init callback
  ASoC: Intel: sof_sdw_rt_amp: use dai parameter

Brent Lu (9):
  ASoC: Intel: sof-rt5682: remove DMI quirk for hatch
  ASoC: Intel: sof_rt5682: board id cleanup for mtl boards
  ASoC: Intel: realtek-common: remove 2-spk rt1015p config
  ASoC: Intel: maxim-common: add max_98373_dai_link function
  ASoC: Intel: sof_da7219: use max_98373_dai_link function
  ASoC: Intel: sof_nau8825: use max_98373_dai_link function
  ASoC: Intel: sof_rt5682: use max_98373_dai_link function
  ASoC: Intel: sof_sdw: add max98373 dapm routes
  ASoC: Intel: maxim-common: change max98373 data to static

 sound/soc/intel/boards/Kconfig                |   1 -
 sound/soc/intel/boards/sof_da7219.c           |   5 +-
 sound/soc/intel/boards/sof_maxim_common.c     |  27 ++--
 sound/soc/intel/boards/sof_maxim_common.h     |   7 +-
 sound/soc/intel/boards/sof_nau8825.c          |   5 +-
 sound/soc/intel/boards/sof_realtek_common.c   |  57 +------
 sound/soc/intel/boards/sof_realtek_common.h   |   1 -
 sound/soc/intel/boards/sof_rt5682.c           |  34 +---
 sound/soc/intel/boards/sof_sdw.c              | 146 +++++++++++++++++-
 sound/soc/intel/boards/sof_sdw_common.h       |  34 ++--
 sound/soc/intel/boards/sof_sdw_cs42l42.c      |  26 +---
 sound/soc/intel/boards/sof_sdw_cs42l43.c      |  40 +----
 sound/soc/intel/boards/sof_sdw_cs_amp.c       |  15 +-
 sound/soc/intel/boards/sof_sdw_maxim.c        |  28 +---
 sound/soc/intel/boards/sof_sdw_rt5682.c       |  26 +---
 sound/soc/intel/boards/sof_sdw_rt700.c        |  28 +---
 sound/soc/intel/boards/sof_sdw_rt711.c        |  26 +---
 sound/soc/intel/boards/sof_sdw_rt712_sdca.c   |  24 +--
 sound/soc/intel/boards/sof_sdw_rt722_sdca.c   |  24 +--
 sound/soc/intel/boards/sof_sdw_rt_amp.c       |  42 +----
 sound/soc/intel/boards/sof_sdw_rt_dmic.c      |   2 +-
 .../boards/sof_sdw_rt_sdca_jack_common.c      |  45 +++---
 .../intel/common/soc-acpi-intel-lnl-match.c   |  50 ++++++
 .../intel/common/soc-acpi-intel-mtl-match.c   |  38 ++---
 24 files changed, 302 insertions(+), 429 deletions(-)

-- 
2.40.1

