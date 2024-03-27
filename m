Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2217742A89
	for <linux-sound@vger.kernel.org>; Wed, 27 Mar 2024 16:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711556667; cv=none; b=uJUn9wrm3W2tscr4SBazT0Z2Oc2ZOrO3PDnWX0J1FQWPCx9nbpq64xJ7lR+ma6oa3URHwEGjHBLiYH9INZPIefdk/Cghjhk4p6dnjmY678eEdm2/kgOw2yCjNhmKIFqLu/E844RaKj0tRbnaQU0krn3xwLvEvtkSmqII1Z1etfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711556667; c=relaxed/simple;
	bh=ehVOa6dAhlhoKEdMKTbm6D7iGxqzbJC4ouF1GiS0TGw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OUJW2pHmgDdSjjtCd6cwBn53B5snCNlWrS3QY7ClKMDVvGGaPp3Vdo7RSbygoB8pTFU+J+hpCFUqEzo53WabmX1JesS/CyIzhIOmnaV8fSRfyaIP8eTNapqB/SQE9SIgJ9cZTg8zOBCnAQA/ftSPHGjyZd2EmSUSNWsm+dfJfOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RZEmasQZ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RZEmasQZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711556667; x=1743092667;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ehVOa6dAhlhoKEdMKTbm6D7iGxqzbJC4ouF1GiS0TGw=;
  b=RZEmasQZT5UyrwhIaw0zwzPENU7e8dpu27fNXE89pInBcUBGUZRqUanb
   G/rteqVn3ZI79qVUHswHkH23Zm8zCr7BRHddHWdvs++5FWWuoClccMYLY
   gByVFgUZzRR+DmtDWQX1ovZOzycrkNfwhwzXvXHSVW5yY/M/rzXXoKZsz
   /tU3suZhpzK0PfJSmW0LhySUG4c5LRKYmdJhP3NNTF8/qlBFl9IVF+woK
   RDOi3B7APalVlznXTW0ToLz5uMlsyILsFcfWSmGYI683sQ92WvQ1a94ly
   zDY/7H7mgNFUJHzzYF68bxUI1xViCQa3zruHgtQJ2E+5EGg+60EzUc53Y
   Q==;
X-CSE-ConnectionGUID: kuKAQX26RfWHuzc73yPHNQ==
X-CSE-MsgGUID: zDk53ZI7SLCb0ZxKAGBYQA==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17221476"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="17221476"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 09:24:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="53821236"
Received: from ssherman-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.117.1])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 09:24:25 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 00/18] ASoC: Intel: boards: updates for 6.10 - part3
Date: Wed, 27 Mar 2024 11:23:50 -0500
Message-Id: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This last part is the continuation of Brent Lu's cleanups. Multiple
quirks have been removed to use "default" configurations and
ACPI-based detection of codecs and selection of topology files.

This cleanup has been done in multiple steps/phases since Fall 2023,
thanks Brent for this contribution!

Brent Lu (18):
  ASoC: Intel: ssp-common: relocate source file
  ASoC: Intel: ssp-common: relocate header file
  ASoC: Intel: ssp-common: naming convention change
  ASoC: Intel: ssp-common: module name change
  ASoC: Intel: ssp-common: delete module
  ASoC: Intel: ssp-common: get codec tplg suffix function
  ASoC: SOF: Intel: support tplg suffix detection
  ASoC: Intel: sof_nau8825: mach cleanup for adl boards
  ASoC: Intel: sof_nau8825: mach cleanup for rpl boards
  ASoC: Intel: sof_nau8825: add mtl_nau8825_def for mtl boards
  ASoC: Intel: sof_rt5682: mach cleanup for tgl boards
  ASoC: Intel: sof_rt5682: mach cleanup for adl boards
  ASoC: Intel: sof_rt5682: mach cleanup for rpl boards
  ASoC: Intel: sof_rt5682: mach cleanup for mtl boards
  ASoC: Intel: sof_cs42l42: board id cleanup for adl boards
  ASoC: Intel: sof_cs42l42: mach cleanup for adl boards
  ASoC: Intel: sof_cs42l42: add rpl_cs42l42_def for rpl boards
  ASoC: Intel: sof_cs42l42: add mtl_cs42l42_def for mtl boards

 .../sound/soc-acpi-intel-ssp-common.h         |  22 ++-
 include/sound/soc-acpi.h                      |  12 ++
 sound/soc/intel/boards/Kconfig                |  13 +-
 sound/soc/intel/boards/Makefile               |   3 -
 sound/soc/intel/boards/sof_board_helpers.c    |  15 +-
 sound/soc/intel/boards/sof_board_helpers.h    |   6 +-
 sound/soc/intel/boards/sof_cirrus_common.h    |   2 +-
 sound/soc/intel/boards/sof_cs42l42.c          |  17 +-
 sound/soc/intel/boards/sof_maxim_common.h     |   2 +-
 sound/soc/intel/boards/sof_nau8825.c          |   7 +
 sound/soc/intel/boards/sof_nuvoton_common.h   |   2 +-
 sound/soc/intel/boards/sof_realtek_common.h   |   2 +-
 sound/soc/intel/boards/sof_ssp_common.c       | 122 --------------
 sound/soc/intel/common/Makefile               |   2 +
 .../intel/common/soc-acpi-intel-adl-match.c   | 139 ++++-----------
 .../intel/common/soc-acpi-intel-mtl-match.c   |  52 +++---
 .../intel/common/soc-acpi-intel-rpl-match.c   |  90 ++++------
 .../intel/common/soc-acpi-intel-ssp-common.c  | 159 ++++++++++++++++++
 .../intel/common/soc-acpi-intel-tgl-match.c   |  50 ++----
 sound/soc/sof/intel/hda.c                     |  82 +++++++++
 20 files changed, 423 insertions(+), 376 deletions(-)
 rename sound/soc/intel/boards/sof_ssp_common.h => include/sound/soc-acpi-intel-ssp-common.h (66%)
 delete mode 100644 sound/soc/intel/boards/sof_ssp_common.c
 create mode 100644 sound/soc/intel/common/soc-acpi-intel-ssp-common.c

-- 
2.40.1

