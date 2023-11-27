Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W21s0uee"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92773B8
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 05:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701092150; x=1732628150;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LflKEMjIno/7jo4PfwXSOeNAqzM9VF4HlnWuUWJ3zJM=;
  b=W21s0ueeW2ey/YLmfV9sRfx0ErgQabPLmWBD+PLzGWqidbAfQkODKSTr
   qXAqV0V24xtDHHAI3a4VabxBCAHMd/3elxEY4Y+3auLnAqWK6KhF0UVlS
   l6awmP31CWu7Eni++5ngNRsGOiSAapXweMiFgXR7/F4QUdhTONOdzoXy+
   7x+3JWEoEd1PEzcJUVHaBQIGqxiQseKqXzygjl3YJ3sR5dpnyzIIflU+c
   d7EfvCOJN/wwHeUy8lKxnOtC5Pc8bIrsFru8bjIF3fOEsEjjLYiLRuBA2
   ac+Rc6dKpiOZPsSDlRP2G8waWTbbDjKei1FMX2Y92Di0CK+xPW/nj0kOd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="391578506"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="391578506"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 05:34:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="891743747"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="891743747"
Received: from acornagl-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 05:34:14 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	cezary.rojewski@intel.com,
	yung-chuan.liao@linux.intel.com,
	ckeepax@opensource.cirrus.com,
	yong.zhi@intel.com,
	chao.song@linux.intel.com
Subject: [PATCH 0/7] ASoC: Intel: Soundwire related board and match updates
Date: Mon, 27 Nov 2023 15:34:41 +0200
Message-ID: <20231127133448.18449-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

A small update for SDW machine support:
Small fixes for sof_sdw machine driver
Support for rt722
New TGL/MTL and LNL match for new configurations

Regards,
Peter
---
Bard Liao (1):
  ASoC: Intel: soc-acpi-intel-tgl-match: add cs42l43 and cs56l56 support

Chao Song (4):
  ASoC: Intel: sof_sdw: remove unused function declaration
  ASoC: Intel: sof_sdw: Add rt722 support
  ASoC: Intel: soc-acpi: add Gen4.1 SDCA board support for LNL RVP
  ASoC: Intel: soc-acpi-intel-mtl-match: Add rt722 support

Mac Chiang (1):
  ASoC: Intel: soc-acpi: rt713+rt1316, no sdw-dmic config

Peter Ujfalusi (1):
  ASoC: Intel: sof_sdw: Make use of dev_err_probe()

 sound/soc/intel/boards/Kconfig                |  1 +
 sound/soc/intel/boards/Makefile               |  3 +-
 sound/soc/intel/boards/sof_sdw.c              | 32 +++++-
 sound/soc/intel/boards/sof_sdw_common.h       | 18 ++--
 sound/soc/intel/boards/sof_sdw_rt722_sdca.c   | 97 +++++++++++++++++++
 .../boards/sof_sdw_rt_sdca_jack_common.c      |  8 ++
 .../intel/common/soc-acpi-intel-lnl-match.c   | 71 ++++++++++++++
 .../intel/common/soc-acpi-intel-mtl-match.c   | 74 ++++++++++++++
 .../intel/common/soc-acpi-intel-tgl-match.c   | 78 +++++++++++++++
 9 files changed, 374 insertions(+), 8 deletions(-)
 create mode 100644 sound/soc/intel/boards/sof_sdw_rt722_sdca.c

-- 
2.43.0

