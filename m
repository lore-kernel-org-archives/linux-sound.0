Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PLOVyVTC"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D161138
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 07:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099316; x=1732635316;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DnuZYLWYd8c/ZxtUMdiIWIakOzys/wENomS92f8ugsQ=;
  b=PLOVyVTC9j8FbVm1xIGYHaxMQmLlClOMjwMEzxZxNd6KsF34uAxp8Mgx
   HRgiKxShF2pMhduNjo4PRJg2jfLF4xjQodxn01rdnE7zS/kfwoQXTKidL
   /rNLsgMCOgaWOlF8Fi2Du2RtsaLQxYqaaENLM5xpQS9QO+K8IvEZj+m9Z
   sAaxT3KUob6QGhB3g26Djlw9zIEvWqmkzxGYnV9KZ7oF0fu7S61FX9hMo
   oLHFxGI1BtxlzSw4LV7ZrughRtsZ53jIHuT3GXn2ia87LZiky/Le7eXaP
   CHnt6cTXYnT95Ibqsy/xJVLjyIWnMAp1tK3+2bQ31c7G0WzA69DBut+7y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894354"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="372894354"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:26:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771956122"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="771956122"
Received: from acornagl-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:26:19 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	chao.song@linux.intel.com
Subject: [PATCH 00/27] ASoC: Intel: Link handling rework and fixes
Date: Mon, 27 Nov 2023 17:26:27 +0200
Message-ID: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

SOF board updates for 6.8 including few small fix and the majority is to add
generic helpers for codec, amp, BT offload, HDMI-In and DAI link generation
among various machine drivers.

Regards,
Peter
---
Bard Liao (2):
  ASoC: Intel: sof_maxim_common: add else between 2 if test
  ASoC: Intel: sof_maxim_common: check return value

Brent Lu (24):
  ASoC: Intel: sof_ssp_amp: remove dead code
  ASoC: Intel: ssp-common: get codec name function
  ASoC: Intel: board_helpers: support codec link initialization
  ASoC: Intel: sof_cs42l42: use common module for codec link
  ASoC: Intel: sof_nau8825: use common module for codec link
  ASoC: Intel: sof_rt5682: use common module for codec link
  ASoC: Intel: board_helpers: support amp link initialization
  ASoC: Intel: sof_cs42l42: use common module for amp link
  ASoC: Intel: sof_nau8825: use common module for amp link
  ASoC: Intel: sof_rt5682: use common module for amp link
  ASoC: Intel: sof_ssp_amp: use common module for amp link
  ASoC: Intel: sof_ssp_amp: rename function parameter
  ASoC: Intel: board_helpers: support BT offload link initialization
  ASoC: Intel: sof_cs42l42: use common module for BT offload link
  ASoC: Intel: sof_nau8825: use common module for BT offload link
  ASoC: Intel: sof_rt5682: use common module for BT offload link
  ASoC: Intel: sof_ssp_amp: use common module for BT offload link
  ASoC: Intel: sof_ssp_amp: simplify HDMI-In quirks
  ASoC: Intel: board_helpers: support HDMI-In link initialization
  ASoC: Intel: sof_rt5682: use common module for HDMI-In link
  ASoC: Intel: sof_ssp_amp: use common module for HDMI-In link
  ASoC: Intel: board_helpers: support DAI link array generation
  ASoC: Intel: sof_nau8825: use common module for DAI link generation
  ASoC: Intel: sof_rt5682: use common module for DAI link generation

Chao Song (1):
  ASoC: Intel: cht_bsw_rt5672: check return value

 sound/soc/intel/boards/cht_bsw_rt5672.c    |   8 +-
 sound/soc/intel/boards/sof_board_helpers.c | 330 +++++++++++++++++++++
 sound/soc/intel/boards/sof_board_helpers.h |  31 ++
 sound/soc/intel/boards/sof_cs42l42.c       | 229 ++++----------
 sound/soc/intel/boards/sof_maxim_common.c  |  13 +-
 sound/soc/intel/boards/sof_nau8825.c       | 224 ++++----------
 sound/soc/intel/boards/sof_rt5682.c        | 328 ++++++--------------
 sound/soc/intel/boards/sof_ssp_amp.c       | 160 ++++------
 sound/soc/intel/boards/sof_ssp_common.c    |  21 ++
 sound/soc/intel/boards/sof_ssp_common.h    |   1 +
 10 files changed, 653 insertions(+), 692 deletions(-)

-- 
2.43.0

