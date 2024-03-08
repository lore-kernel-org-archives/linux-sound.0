Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D8322626
	for <linux-sound@vger.kernel.org>; Fri,  8 Mar 2024 09:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709888605; cv=none; b=MbT0OzCRTildSBJ1baPjnlftYdB6kNP9CpO/CnYxSBkmVCgdqHh1j6DY4Uq/R7ReIPoV85X8KeWzOpfemAKA2oqrx8xtY0PJZ4HJEDzXYRs/o3YXJ9DCSrbX/aeuWsjUoTkivT6fejWWmcpa6r2RMTgiDPxe2QAWK0NzybsSLbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709888605; c=relaxed/simple;
	bh=60Mwhx3nnlEAz6uV5d5w6IxQadSN0bJCde0NZHBkIZ0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=hIDQdwZ8dflpWL1q7/4BYvdBCRtn2mEruUuAy9HUiP7aNdM7rUVhmTo+KwcM4EYqUoL1cbTuCFl5v7zzvAIymvPKHtW5oyZSNgHXSDvnJoJXgu3gSsj7+EHXv6EVaQKLfOiTQtGaiACbA/xufKbP6BYmszjQlksYSZziF919GCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RJaL/VRt; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RJaL/VRt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709888604; x=1741424604;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=60Mwhx3nnlEAz6uV5d5w6IxQadSN0bJCde0NZHBkIZ0=;
  b=RJaL/VRtWEM3eeDI2kOttiViuKRN9VqhpmpNpzU3nco0XxIOfp22y/Z2
   LoeJ7OA67ZREvirdrTpIQq23+Po9t1pfvisbcjxZllKrwsUX0AqkCZA2j
   C83qmkrsyZOB/I+qJq6O1m3V4/ugbNDf1YQH5GXt4frN56BKOXEYFy+RL
   aL2HYP2Z8c/nQN2lqlI7mbRZ4+TDpoV3nH4TYhFIao4MSpICFw1Wjt4uR
   YSuI4SFyM2qbVCH9KdMP25geaBJMiLAo2D+oxFijwJB91VkpIVZozAdVU
   QHHt8WPqkg6sEcY4a4G2WvWaH1nuTyExF3dM5CAVrSfOM2UxrbPMicv0u
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15246983"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="15246983"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 01:03:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="10419237"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa010.jf.intel.com with ESMTP; 08 Mar 2024 01:03:21 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 0/5] ASoC: Harden DAPM route checks and Intel fixes
Date: Fri,  8 Mar 2024 10:04:57 +0100
Message-Id: <20240308090502.2136760-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Set of loosely connected patches. Most impactful change is dropping any
permisiveness when snd_soc_dapm_add_routes() fails in soc-topology.c To
do it safely, disable route checks for all skylake-driver boards.

Relevant background:

Since commit daa480bde6b3 ("ASoC: soc-core: tidyup for
snd_soc_dapm_add_routes()") route checks are no longer permissive. Probe
failures for Intel boards have been partially addressed by commit
a22ae72b86a4 ("ASoC: soc-core: isable route checks for legacy devices")
and its follow up but only skl_nau88l25_ssm4567.c is patched. The rest
of the boards still need fixing.

After that, removal of copy-pastas found in ssm4567.c and redundant code
in i2s_test.c for avs-boards.

Changes in v2:
- glk_rt5682_max98357a.c and skl_hda_dsp_generic.c now disable route
  checks only for the skylake-drvier
- asoc now logs failures of snd_soc_dapm_add_routes() in soc-topology.c

Amadeusz Sławiński (1):
  ASoC: Intel: avs: i2s_test: Remove redundant dapm routes

Cezary Rojewski (4):
  ASoC: Intel: Disable route checks for Skylake boards
  ASoC: topology: Do not ignore route checks when parsing graphs
  ASoC: Intel: avs: ssm4567: Do not ignore route checks
  ASoC: Intel: avs: ssm4567: Board cleanup

 sound/soc/intel/avs/boards/i2s_test.c         | 79 -------------------
 sound/soc/intel/avs/boards/ssm4567.c          |  5 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c |  1 +
 sound/soc/intel/boards/bxt_rt298.c            |  1 +
 sound/soc/intel/boards/glk_rt5682_max98357a.c |  2 +
 sound/soc/intel/boards/kbl_da7219_max98357a.c |  1 +
 sound/soc/intel/boards/kbl_da7219_max98927.c  |  4 +
 sound/soc/intel/boards/kbl_rt5660.c           |  1 +
 sound/soc/intel/boards/kbl_rt5663_max98927.c  |  2 +
 .../intel/boards/kbl_rt5663_rt5514_max98927.c |  1 +
 sound/soc/intel/boards/skl_hda_dsp_generic.c  |  2 +
 .../soc/intel/boards/skl_nau88l25_max98357a.c |  1 +
 sound/soc/intel/boards/skl_rt286.c            |  1 +
 sound/soc/soc-topology.c                      | 11 ++-
 14 files changed, 27 insertions(+), 85 deletions(-)

-- 
2.25.1

