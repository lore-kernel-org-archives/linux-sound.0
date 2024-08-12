Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4F516D4FC
	for <linux-sound@vger.kernel.org>; Mon, 12 Aug 2024 09:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723455755; cv=none; b=qqx4d2Uy0uyql9O6HqGIy2aIhYuvfegntn6owxGZjLo4+s/db+2gDxHtVfdJbmMLmUlsru4vcUnw7hwU9ASwddNL5i3I9mZ/qQ8EeJPw8KqZZgUJ02W1N0V/6BRMhyZXM8iw3xA9dsSbPauVm4JvNPm9L5yVX2Iccz5/4NPMP/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723455755; c=relaxed/simple;
	bh=RArZw0Cl2wd3Zm4nJabLOCL+sTCdFJRSYapD47EjPUk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sZFhQDNFu++TOb8mcc4EUVeYwLGt0CEn8+aFPgpm8tp+79sFRUAZh0cLu/QHgqU3U0nzuKKX6lXx+Ywf1Rg0qs49Ae6lnQeaoSTz5udBJNoGYUySCIne2kYEPKljXoOkXl695V9vFJlxrmlt2yyaxqsLG3JYd13pCksIvCTfcfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FfVlqQxs; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FfVlqQxs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723455752; x=1754991752;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RArZw0Cl2wd3Zm4nJabLOCL+sTCdFJRSYapD47EjPUk=;
  b=FfVlqQxs7CgIMS6pfBvQI37R9Q/8ymTQU0pCPBZHYrQgHmf01tEtur+k
   NOaMso4Hb8Uz1O2j+5utjHM8n24g4ApYzvkUz9jLb07kZbyRwNYfx8FIl
   9YcH8HydjZpRJpaLLWLV8e/uUPdPg+6j2zTQBHpmEmTo9N5iHgRHYuEd4
   NSv4xtH2+HUEFPSRTRsXqn1oN95SVm+1XujVNud+qhhghf+/bYGEIpbZW
   nZOVJpE5YaPIVcT6Q05bevB6hFge6GXHaFzhnsGkf5NxOT1ksLE/mEBqY
   R89X3o92r9evhPTAAlm1TfdkSKs9JjzwWj5VagduZyck5OTBDLKVdfyS4
   w==;
X-CSE-ConnectionGUID: Jha2eNA8RlWSjcuFbefy4A==
X-CSE-MsgGUID: vd0CVJD3S96/p3AIrn4YIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21364804"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="21364804"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 02:42:32 -0700
X-CSE-ConnectionGUID: dwqq3qCWTiqw1ELQZeE9lA==
X-CSE-MsgGUID: S1qeHXdeQmqr9ylLCmvxvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="63056789"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa005.jf.intel.com with ESMTP; 12 Aug 2024 02:42:29 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	andriy.shevchenko@linux.intel.com,
	cujomalainey@chromium.org,
	lmajczak@google.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 00/12] ASoC: Intel: Remove skylake driver
Date: Mon, 12 Aug 2024 11:43:16 +0200
Message-Id: <20240812094328.842661-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A spiritual successor to haswell/baytrail removal series [1].

The avs-driver found in sound/soc/intel/avs is a direct replacement to
the existing skylake-driver. It covers all features supported by it and
more and aligns with the recommended flows and requirements based on
Windows driver equivalent.

The skylake-driver related UAPI has been removed with "ASoC: Drop
soc-topology ABI v4 support" [2].

For the official kernel tree the deprecation begun with v6.0. Most
skylake-drivers users moved to avs- or SOF-driver when AudioDSP
capabilities are available on the platform or to snd-hda-intel
(sound/pci/hda) when such capabilities are not.

For the supported trees the deprecation begun with v5.4 with v5.15 being
the first where the skylake-driver is disabled entirely.

All machine board drivers that consume this DSP driver have their
replacements present within sound/soc/intel/avs/boards/ directory.

[1]: https://lore.kernel.org/alsa-devel/20201006064907.16277-1-cezary.rojewski@intel.com/
[2]: https://lore.kernel.org/alsa-devel/20240403091629.647267-1-cezary.rojewski@intel.com/


Cezary Rojewski (12):
  ASoC: Intel: Remove bxt_rt298 board driver
  ASoC: Intel: Remove bxt_da7219_max98357a board driver
  ASoC: Intel: Remove kbl_rt5663_rt5514_max98927 board driver
  ASoC: Intel: Remove kbl_rt5663_max98927 board driver
  ASoC: Intel: Remove kbl_rt5660 board driver
  ASoC: Intel: Remove kbl_da7219_max98927 board driver
  ASoC: Intel: Remove kbl_da7219_max98357a board driver
  ASoC: Intel: Remove skl_rt286 board driver
  ASoC: Intel: Remove skl_nau88l25_ssm4567 board driver
  ASoC: Intel: Remove skl_nau88l25_max98357a board driver
  ASoC: Intel: Remove skylake driver
  ASoC: Intel: avs: Enable by default for all SST configurations

 sound/soc/intel/Kconfig                       |  120 -
 sound/soc/intel/Makefile                      |    1 -
 sound/soc/intel/avs/core.c                    |    8 +-
 sound/soc/intel/boards/Kconfig                |  152 +-
 sound/soc/intel/boards/Makefile               |   20 -
 sound/soc/intel/boards/bxt_da7219_max98357a.c |  720 ----
 sound/soc/intel/boards/bxt_rt298.c            |  670 ---
 sound/soc/intel/boards/kbl_da7219_max98357a.c |  688 ----
 sound/soc/intel/boards/kbl_da7219_max98927.c  | 1175 ------
 sound/soc/intel/boards/kbl_rt5660.c           |  567 ---
 sound/soc/intel/boards/kbl_rt5663_max98927.c  | 1073 -----
 .../intel/boards/kbl_rt5663_rt5514_max98927.c |  869 ----
 .../soc/intel/boards/skl_nau88l25_max98357a.c |  704 ----
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c |  751 ----
 sound/soc/intel/boards/skl_rt286.c            |  568 ---
 sound/soc/intel/skylake/Makefile              |   15 -
 sound/soc/intel/skylake/bxt-sst.c             |  629 ---
 sound/soc/intel/skylake/cnl-sst-dsp.c         |  266 --
 sound/soc/intel/skylake/cnl-sst-dsp.h         |  103 -
 sound/soc/intel/skylake/cnl-sst.c             |  508 ---
 sound/soc/intel/skylake/skl-debug.c           |  248 --
 sound/soc/intel/skylake/skl-i2s.h             |   87 -
 sound/soc/intel/skylake/skl-messages.c        | 1419 -------
 sound/soc/intel/skylake/skl-nhlt.c            |  269 --
 sound/soc/intel/skylake/skl-pcm.c             | 1507 -------
 sound/soc/intel/skylake/skl-ssp-clk.c         |  428 --
 sound/soc/intel/skylake/skl-ssp-clk.h         |  108 -
 sound/soc/intel/skylake/skl-sst-cldma.c       |  373 --
 sound/soc/intel/skylake/skl-sst-cldma.h       |  243 --
 sound/soc/intel/skylake/skl-sst-dsp.c         |  462 ---
 sound/soc/intel/skylake/skl-sst-dsp.h         |  256 --
 sound/soc/intel/skylake/skl-sst-ipc.c         | 1071 -----
 sound/soc/intel/skylake/skl-sst-ipc.h         |  169 -
 sound/soc/intel/skylake/skl-sst-utils.c       |  425 --
 sound/soc/intel/skylake/skl-sst.c             |  599 ---
 sound/soc/intel/skylake/skl-topology.c        | 3605 -----------------
 sound/soc/intel/skylake/skl-topology.h        |  524 ---
 sound/soc/intel/skylake/skl.c                 | 1177 ------
 sound/soc/intel/skylake/skl.h                 |  207 -
 39 files changed, 9 insertions(+), 22775 deletions(-)
 delete mode 100644 sound/soc/intel/boards/bxt_da7219_max98357a.c
 delete mode 100644 sound/soc/intel/boards/bxt_rt298.c
 delete mode 100644 sound/soc/intel/boards/kbl_da7219_max98357a.c
 delete mode 100644 sound/soc/intel/boards/kbl_da7219_max98927.c
 delete mode 100644 sound/soc/intel/boards/kbl_rt5660.c
 delete mode 100644 sound/soc/intel/boards/kbl_rt5663_max98927.c
 delete mode 100644 sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
 delete mode 100644 sound/soc/intel/boards/skl_nau88l25_max98357a.c
 delete mode 100644 sound/soc/intel/boards/skl_nau88l25_ssm4567.c
 delete mode 100644 sound/soc/intel/boards/skl_rt286.c
 delete mode 100644 sound/soc/intel/skylake/Makefile
 delete mode 100644 sound/soc/intel/skylake/bxt-sst.c
 delete mode 100644 sound/soc/intel/skylake/cnl-sst-dsp.c
 delete mode 100644 sound/soc/intel/skylake/cnl-sst-dsp.h
 delete mode 100644 sound/soc/intel/skylake/cnl-sst.c
 delete mode 100644 sound/soc/intel/skylake/skl-debug.c
 delete mode 100644 sound/soc/intel/skylake/skl-i2s.h
 delete mode 100644 sound/soc/intel/skylake/skl-messages.c
 delete mode 100644 sound/soc/intel/skylake/skl-nhlt.c
 delete mode 100644 sound/soc/intel/skylake/skl-pcm.c
 delete mode 100644 sound/soc/intel/skylake/skl-ssp-clk.c
 delete mode 100644 sound/soc/intel/skylake/skl-ssp-clk.h
 delete mode 100644 sound/soc/intel/skylake/skl-sst-cldma.c
 delete mode 100644 sound/soc/intel/skylake/skl-sst-cldma.h
 delete mode 100644 sound/soc/intel/skylake/skl-sst-dsp.c
 delete mode 100644 sound/soc/intel/skylake/skl-sst-dsp.h
 delete mode 100644 sound/soc/intel/skylake/skl-sst-ipc.c
 delete mode 100644 sound/soc/intel/skylake/skl-sst-ipc.h
 delete mode 100644 sound/soc/intel/skylake/skl-sst-utils.c
 delete mode 100644 sound/soc/intel/skylake/skl-sst.c
 delete mode 100644 sound/soc/intel/skylake/skl-topology.c
 delete mode 100644 sound/soc/intel/skylake/skl-topology.h
 delete mode 100644 sound/soc/intel/skylake/skl.c
 delete mode 100644 sound/soc/intel/skylake/skl.h

-- 
2.25.1

