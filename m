Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y3xlCaIC"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AE2A95
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 04:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701262374; x=1732798374;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4o5AIX3Twokl6RYeB9uWoR89mwtqIoon/yV/+kRQe3w=;
  b=Y3xlCaIC9ah9oYrjGtltEXvz2GB55HHkrJ3IKKJOcKPobAm8j+EfbZAL
   hVizkXM4HZgi4LOEwDAK4GMa65p59dYj76d8dN6ywT/6CvPEg474t3OQX
   DXUnyXUhVaE3dlqoqunpBW1St/REVJ41EWShNLpbImAwdq9IWlDwQH44V
   4LDKAwGguKTXwtDcKL5KnFzA5R5nBF7UCfC3LtMpBsUFN4UxxXd1VLJFp
   lmgkqQGgUfW1gy3SDmkdsK50pVByoRMz3zdqisbga9eEhsVOviHCemHvY
   1xqqTTieFXpJcNjEgFWXDKLK7feH64sL+wn8jca4LCBlU4s+u34Ns2LEX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="392022858"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="392022858"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 04:52:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="17174584"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.44.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 04:52:51 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 00/13] ASoC: SOF: IPC path handling and fallback support
Date: Wed, 29 Nov 2023 14:53:14 +0200
Message-ID: <20231129125327.23708-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

The main aim of the series is to provide a mechanism to fallback to 'older' IPC
versions in case the desired one is missing either a firmware or topology file.
It is going to make the life of users and distributions if we are going to
start transition existing IPC3 platforms to IPC4 (CAVS2.5) and we might have
missed some topology file to convert for example.
In that case the kernel will fallback to IPC3 without audio regression.

To be able to support this we needed to change the probe sequence to know the
topology filename earlier and check if it is present in the filesystem.

No functional changes for now, the default IPC versions have not been changed.

Regards,
Peter
---
Peter Ujfalusi (13):
  ASoC: SOF: Move sof_of_machine_select() to sof-of-dev.c from
    sof-audio.c
  ASoC: SOF: Move sof_machine_* functions from sof-audio.c to core.c
  ASoC: SOF: Add placeholder for platform IPC type and path overrides
  ASoC: SOF: sof-acpi-dev: Save the default IPC type and path overrides
  ASoC: SOF: sof-of-dev: Save the default IPC type and path overrides
  ASoC: SOF: sof-pci-dev: Save the default IPC type and path overrides
  ASoC: SOF: core: Implement firmware, topology path setup in core
  ASoC: SOF: sof-acpi-dev: Rely on core to create the file paths
  ASoC: SOF: sof-of-dev: Rely on core to create the file paths
  ASoC: SOF: sof-pci-dev: Rely on core to create the file paths
  ASoC: SOF: core: Add helper for initialization of paths, ops
  ASoC: SOF: Intel: Do not use resource managed allocation for ipc4_data
  ASoC: SOF: core: Implement IPC version fallback if firmware files are
    missing

 include/sound/sof.h             |  15 ++
 sound/soc/sof/Kconfig           |  11 ++
 sound/soc/sof/Makefile          |   3 +-
 sound/soc/sof/core.c            | 289 +++++++++++++++++++++++-----
 sound/soc/sof/fw-file-profile.c | 322 ++++++++++++++++++++++++++++++++
 sound/soc/sof/intel/apl.c       |   2 +-
 sound/soc/sof/intel/cnl.c       |   2 +-
 sound/soc/sof/intel/hda-dai.c   |   3 +
 sound/soc/sof/intel/icl.c       |   2 +-
 sound/soc/sof/intel/lnl.c       |   2 +-
 sound/soc/sof/intel/mtl.c       |   2 +-
 sound/soc/sof/intel/skl.c       |   2 +-
 sound/soc/sof/intel/tgl.c       |   2 +-
 sound/soc/sof/sof-acpi-dev.c    |  16 +-
 sound/soc/sof/sof-audio.c       | 120 ------------
 sound/soc/sof/sof-of-dev.c      |  36 +++-
 sound/soc/sof/sof-of-dev.h      |   9 +
 sound/soc/sof/sof-pci-dev.c     | 102 ++--------
 sound/soc/sof/sof-priv.h        |   9 +-
 19 files changed, 671 insertions(+), 278 deletions(-)
 create mode 100644 sound/soc/sof/fw-file-profile.c

-- 
2.43.0

