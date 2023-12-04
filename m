Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G4FVqrOQ"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E595DCD
	for <linux-sound@vger.kernel.org>; Mon,  4 Dec 2023 13:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701726133; x=1733262133;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=f2DY02O9PsLeKL0CkW/V97cASNLos3dpMLZGlnelJ9M=;
  b=G4FVqrOQoiBJkzrcoBc7YyB4ZFYAGjGmanWhXkVyC734Lmd6bURPyUEU
   CsXra+h+/zB/qPx8Fjckhj5hLF1/6IphrU7OwLsaMxIVLdCOcTbI/zQ7X
   Q9BlUy/Is1v7jEkRQF2ueBAc6279VMOyf9rAff+wPliaGKR/Jq7jEePZX
   22kfZV9aEraRjavpZdZcEp8PWpI0mfkx3IkSO+qfKGr7+eMNSwCf4Exgg
   sMX5LY9qD1DQg3aHeFTpb86f9qx2xT3S1isZ2CUv9qXlC7yJeV6/iI7Cj
   7Tnyn0GyymQB0YT+mwFaps6IpP6P3M6ZLLxsaYrPUrjR7HXGXMYIW3hQd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="859808"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="859808"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 13:42:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="764104366"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="764104366"
Received: from akashams-mobl.amr.corp.intel.com (HELO pbossart-mobl3.lan) ([10.255.231.189])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 13:42:10 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/5] ASoC: Intel: machine driver updates
Date: Mon,  4 Dec 2023 15:41:55 -0600
Message-Id: <20231204214200.203100-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Minor cleanups for machine drivers.

Bard Liao (2):
  ASoC: Intel: sof_sdw_rt_sdca_jack_common: ctx->headset_codec_dev =
    NULL
  ASoC: Intel: sof_sdw_rt_sdca_jack_common: check ctx->headset_codec_dev
    instead of playback

Brent Lu (3):
  ASoC: Intel: sof_nau8825: board id cleanup for adl boards
  ASoC: Intel: sof_nau8825: board id cleanup for rpl boards
  ASoC: Intel: glk_rt5682_max98357a: fix board id mismatch

 sound/soc/intel/boards/sof_nau8825.c          | 46 +------------------
 .../boards/sof_sdw_rt_sdca_jack_common.c      |  7 +--
 .../intel/common/soc-acpi-intel-adl-match.c   |  8 ++--
 .../intel/common/soc-acpi-intel-glk-match.c   | 14 +++---
 .../intel/common/soc-acpi-intel-rpl-match.c   |  6 +--
 5 files changed, 19 insertions(+), 62 deletions(-)

-- 
2.39.2

