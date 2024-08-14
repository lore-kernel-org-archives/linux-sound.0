Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9773113DDBD
	for <linux-sound@vger.kernel.org>; Wed, 14 Aug 2024 08:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723624799; cv=none; b=cn5RRbfHNvnDS/1dqmvLnjE8EQWFLQ8t3e6/O/TChOONEDxiMmcr0LUwi+INHKc5r2lLLOA+agdW9iNsE1B0T6wpiQnNfp7b/GkYHk152J06T6k69FoenimV1uwDs4gPwGTvsGotpjxkw42YB87y/j6iRtOGhLHpM2RMqbLTYZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723624799; c=relaxed/simple;
	bh=dSFS4Ni1FULSXvzN+U9h9xBHT2gLjAntPAgAMJftT8s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=N78a/sZ/Uq44YWAHFR3Yjm81eeegQzpioxxLljQHd0WxTcfYPXBC52gecloukMlTVrTOOIcN6AqIVGA2ImrblfnKQGnt6VbbV4rwVb/3elq/KTcVdfRPgbMtECI3rBRldKbDsxXwJkmBB4POLY9CPEz9vcoY3PduDM9xlecg6rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OelEJLQu; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OelEJLQu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723624798; x=1755160798;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dSFS4Ni1FULSXvzN+U9h9xBHT2gLjAntPAgAMJftT8s=;
  b=OelEJLQuZBdTzcV/pT8Tx6V1BNpiqv0PB9b3JshdGZFQH0pi4Q6jAfGy
   eObVkeDjdapvtufaoAC8sQVpRpoobpstwNDy3zRQ04mU2b44N0pv4oWam
   wPX36++ykqMlCUhxzRmBjd2ikSdrg6mGol/E6UaOhIpm2Uw0bEjhdwi0I
   A7T7qeK8mWiZyU6b6+De3U6Gb/Rs8D8izj0I0A3/NTSlsa107Gpq+Ugc+
   uToGzKjpasy9youWnOYrhNjVBqJ+MhFwy1TbsVndZf5XZ/8njww+e3WY7
   m7fJ41Sah14l4t1SgBNyhXk3h/xyPaylMZj6ArU2bDIX34NNS1sWoHk8z
   w==;
X-CSE-ConnectionGUID: 3TzItnxARrqbGt4lDeUBvQ==
X-CSE-MsgGUID: N6cWpiTdTjaYC2r0+x+3gQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="24735101"
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; 
   d="scan'208";a="24735101"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 01:39:57 -0700
X-CSE-ConnectionGUID: fewIiJQIQLeO1SXBkCN8XA==
X-CSE-MsgGUID: agmeZqDyRUKXHRU+IUpUZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; 
   d="scan'208";a="63867874"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa004.jf.intel.com with ESMTP; 14 Aug 2024 01:39:53 -0700
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
Subject: [PATCH v2 00/14] ASoC: Intel: Remove skylake driver
Date: Wed, 14 Aug 2024 10:39:15 +0200
Message-Id: <20240814083929.1217319-1-cezary.rojewski@intel.com>
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


Changes in v2:
- added two new patches (leading the series)
- the first moves all device entries previously under the skylake-driver
  dependency under the avs-driver
- the second patch drops struct skl_machine_pdata usage to fix
  compilation errors as pointed out by IKP
- no further changes, retained Acked-by tags for these

[1]: https://lore.kernel.org/alsa-devel/20201006064907.16277-1-cezary.rojewski@intel.com/
[2]: https://lore.kernel.org/alsa-devel/20240403091629.647267-1-cezary.rojewski@intel.com/


Cezary Rojewski (14):
  ALSA: hda: Move SST device entries to AVS
  ASoC: Intel: Drop skl_machine_pdata usage
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

 sound/hda/intel-dsp-config.c                  |  111 +-
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
 .../intel/common/soc-acpi-intel-cnl-match.c   |    6 -
 .../intel/common/soc-acpi-intel-ehl-match.c   |    1 -
 .../intel/common/soc-acpi-intel-hda-match.c   |    6 -
 .../intel/common/soc-acpi-intel-icl-match.c   |    6 -
 .../intel/common/soc-acpi-intel-kbl-match.c   |   11 -
 .../intel/common/soc-acpi-intel-skl-match.c   |    5 -
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
 46 files changed, 59 insertions(+), 22871 deletions(-)
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

