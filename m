Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gjH/dVw8"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8E08B2
	for <linux-sound@vger.kernel.org>; Mon,  4 Dec 2023 13:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701725243; x=1733261243;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UwOEZq+FlA9f3h3brcyWqkXYcP3vJX3oLTP3mIRCyxI=;
  b=gjH/dVw8iTBLEfYySEXGqd/isRbqRlFV8D+Hh8Onq+qp+5NJfb45SEXA
   WQx8xB1Z2Fabp3pb68WmviT+e2vUyzt7JxZirHYVuV10FWNyZ7ANkpJ1j
   Bb7wV7C79zyuheP1GcHemPczFAb5WBqQzQiiqZ+BA0XqbRPLptUm8hbuX
   WOA79ma/OV5+kovz7UwfuzvsCDTWrq9kB58DOcujjSgbhRuDMIhJ+5rTF
   JUWdq0LfSeIbxXzuLzOwweN4cLVFeNFwzjD96kyZUs6xR1d6/zYcfJdSL
   wk8hXVU4zZ1yXjl2FXApuW9Xtw8QV4KKZjgsXA2YdeVWnoHaE1ThgBvxM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="479993027"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="479993027"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 13:27:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="12101158"
Received: from akashams-mobl.amr.corp.intel.com (HELO pbossart-mobl3.lan) ([10.255.231.189])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 13:27:21 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/5] PCI/ALSA/ASoC: Add IDs and definitions for ARL and ARL-S
Date: Mon,  4 Dec 2023 15:27:05 -0600
Message-Id: <20231204212710.185976-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ArrowLake (ARL) and ArrowLake-S (ARL-S) have different PCI IDs. Add
the usual slew of descriptors for those devices.

There are no additional PCI IDs planned for this kernel cycle so it might be
simpler to have Takashi handle all the patches with Mark's Acked-by tag?

Pierre-Louis Bossart (5):
  PCI: add INTEL_HDA_ARL to pci_ids.h
  ALSA: hda: Intel: add HDA_ARL PCI ID support
  ALSA: hda: intel-dspcfg: add filters for ARL-S and ARL
  ASoC: SOF: Intel: pci-mtl: fix ARL-S definitions
  ASoC: SOF: Intel: pci-mtl: add HDA_ARL PCI support

 include/linux/pci_ids.h       |  1 +
 sound/hda/intel-dsp-config.c  | 10 ++++++++++
 sound/pci/hda/hda_intel.c     |  2 ++
 sound/soc/sof/intel/hda.h     |  1 +
 sound/soc/sof/intel/mtl.c     | 28 ++++++++++++++++++++++++++++
 sound/soc/sof/intel/pci-mtl.c | 33 ++++++++++++++++++++++++++++++++-
 6 files changed, 74 insertions(+), 1 deletion(-)

-- 
2.39.2

