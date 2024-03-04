Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C0D6216C
	for <linux-sound@vger.kernel.org>; Mon,  4 Mar 2024 19:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709579066; cv=none; b=Jy6Mx33Ew7HMdCH1ISiYYMIu+EB1QAKmbSVnV4/96EIaMPBpDsWRn1NNZ+8CcGSoSjw3qdfJa6jzRAuxcR01nW1Y474byWlR9c5FErKlrzNHSUMe89+LaUp6GBfx3TjdWMkr6CNWLA54ufACOCXzhN7rt7YEy19mZsNJMqPlzag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709579066; c=relaxed/simple;
	bh=bh6rdlj0Us7k35cmgn1JlS4DKJIoK20HgpvmAhYLz6M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=RAC3R5jGqj7ypqZJ7phl+rJ5xf8N4HEns8EonaHPA6j9pSCdwpUIIWRuuK9XfGzpfFfB6wmR9wb3fZK9JqVE9BDppwFj4lRYfcs7/lkzI2pPOpm345jeeE0QbrBntOc98TFJJ/IUdEbidR18d0gI9zAbLN4SIqzyNge/N6t9mbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NbnBa0cB; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NbnBa0cB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709579065; x=1741115065;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bh6rdlj0Us7k35cmgn1JlS4DKJIoK20HgpvmAhYLz6M=;
  b=NbnBa0cB08ow9K6SMLHjwlynzVm1L0P0d68otWpEorE4tKnaF3pSgEcM
   sYSTTVspLwCWIVbe2987GTtl4rhLW1XQLrP9KYb+JgS/M1jq1qukvLFwN
   2Dq7rm7vIbawq2k/p/zlIzihyNmsNll49lNlleJ8LxBcNUVWBgBCKcJ1o
   9VQIFfkDJVZt+yuTo/M8CNHUt2kGTS0QWJmcz1IjC3LSS1jbdB+RDzm3o
   tVToh11PSo8OfQn1jIZPdsVG7l0ZuCIWlUMUYM7I3gHgB+s6KBnpubkaQ
   5awzehoQw1KrtAeXJuAQ/swYgS3lfYvPHuMtvb4q/DNj1hptBD8JYsuW2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4257254"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="4257254"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 11:04:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="13788266"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa005.jf.intel.com with ESMTP; 04 Mar 2024 11:04:21 -0800
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
Subject: [PATCH 0/5] ASoC: Harden DAPM route checks and Intel fixes
Date: Mon,  4 Mar 2024 20:05:31 +0100
Message-Id: <20240304190536.1783332-1-cezary.rojewski@intel.com>
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
 sound/soc/intel/boards/glk_rt5682_max98357a.c |  1 +
 sound/soc/intel/boards/kbl_da7219_max98357a.c |  1 +
 sound/soc/intel/boards/kbl_da7219_max98927.c  |  4 +
 sound/soc/intel/boards/kbl_rt5660.c           |  1 +
 sound/soc/intel/boards/kbl_rt5663_max98927.c  |  2 +
 .../intel/boards/kbl_rt5663_rt5514_max98927.c |  1 +
 sound/soc/intel/boards/skl_hda_dsp_generic.c  |  1 +
 .../soc/intel/boards/skl_nau88l25_max98357a.c |  1 +
 sound/soc/intel/boards/skl_rt286.c            |  1 +
 sound/soc/soc-topology.c                      |  5 +-
 14 files changed, 19 insertions(+), 85 deletions(-)

-- 
2.25.1

