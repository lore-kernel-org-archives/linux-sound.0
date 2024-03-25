Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6836773182
	for <linux-sound@vger.kernel.org>; Mon, 25 Mar 2024 22:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711404678; cv=none; b=RFndRd9FFnYUHXKFdEm9DVEXyYBHQZ7pauKZYItU/GSn9k0wvvJV/mUj2lJjdMWlWZP1NgZ7rY8WHrqeBPFckChzpkrefLbOjYWbXn6dDH1WYKfJUqO9c5UNVte3GHTr28TF9V33Mq6SsOBk6ahmYbsXAHXTdkr1xCZg/qrV4Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711404678; c=relaxed/simple;
	bh=YZrnm+5vAt2GVw94vUjSxAEtlbSPpE5bKQUqXDSqNLk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gMkCqLpojaJodoZejwsgDJFtXbEUAcl9DIbCyea1c6UJEd0vebndDDG0uQScj6m/Z7ixWPSczMETUvU2P8ko9vmBNxLmzibGx2JlSGRziVBRfNwylJHNzy/rqKFGZYHvXLOQI5Se60sMRvA9Hr9qfRzEcX3tL0PrQNY/n6CyyxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bKmyiFnG; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bKmyiFnG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711404677; x=1742940677;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YZrnm+5vAt2GVw94vUjSxAEtlbSPpE5bKQUqXDSqNLk=;
  b=bKmyiFnGL8LrrnLx9PUxUPn5X2Ox5Z5A5mez9hwJcV+zlEGzr8fUxuwB
   fz/E/XHGu13R6FlHTZOniBNhYxOXjgvnawl7Pxrt8VFR2rEUBco9z4ecm
   noVlk9ucnvr5swybZpfC+MMIF49hUy53p9pwVqWPti0jN9wGgzsNvK9bZ
   bo8Oy7Qlr156M6pfugOQnaVhQHaHR/g1xM6KVGjjKKiFV3ZC+5aW8MveV
   BqMp1rWr8KfcOnY8AwrMVRc/m2SSIdVv66QfZpgNkUwCiw3uYgMaUER0k
   efCoHhjOC1qLnrIvW9U1NLBCqzH2Idgj+I48NI1hQI+EDWoFnn7MgfsHV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6643598"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6643598"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:11:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="15722075"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan) ([10.212.98.109])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:11:14 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 00/21] ASoC: Intel: boards: updates for 6.10 - part1
Date: Mon, 25 Mar 2024 17:10:38 -0500
Message-Id: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have quite a few machine driver patches, spread in 3 series of
about 20 patches each. This first part from Brent Lu adds common
helpers and board configurations to reduce the number of quirks.

Brent Lu (21):
  ASoC: Intel: board_helpers: support DAI link ID customization
  ASoC: Intel: sof_ssp_amp: use common module for DAI link generation
  ASoC: Intel: board_helpers: change dai link helpers to static function
  ASoC: Intel: sof_da7219: add rpl_mx98360_da7219 board config
  ASoC: Intel: sof_rt5682: support ALC5650 on RPL boards
  ASoC: Intel: sof_cs42l42: rename BT offload quirk
  ASoC: Intel: board_helpers: support sof_card_private initialization
  ASoC: Intel: sof_cs42l42: use common module for sof_card_private
    initialization
  ASoC: Intel: sof_nau8825: use common module for sof_card_private
    initialization
  ASoC: Intel: sof_rt5682: use common module for sof_card_private
    initialization
  ASoC: Intel: sof_ssp_amp: use common module for sof_card_private
    initialization
  ASoC: Intel: sof_da7219: use common module for DAI link generation
  ASoC: Intel: sof_da7219: add codec exit function
  ASoC: Intel: sof_da7219: add SOF_DA7219_MCLK_EN quirk
  ASoC: Intel: sof_da7219: board id cleanup for jsl boards
  ASoC: Intel: sof_da7219: board id cleanup for adl boards
  ASoC: Intel: sof_da7219: board id cleanup for rpl boards
  ASoC: Intel: sof_rt5682: remove unnecessary idisp HDMI quirk
  ASoC: Intel: sof_ssp_amp: remove unnecessary idisp HDMI quirk
  ASoC: Intel: sof_nau8825: remove sof_nau8825 board id
  ASoC: Intel: sof_rt5682: board id cleanup for cml boards

 sound/soc/intel/boards/Kconfig                |   1 +
 sound/soc/intel/boards/sof_board_helpers.c    | 146 ++++---
 sound/soc/intel/boards/sof_board_helpers.h    |  97 ++++-
 sound/soc/intel/boards/sof_cs42l42.c          |  72 +--
 sound/soc/intel/boards/sof_da7219.c           | 410 ++++++------------
 sound/soc/intel/boards/sof_nau8825.c          |  92 +---
 sound/soc/intel/boards/sof_rt5682.c           | 222 ++++------
 sound/soc/intel/boards/sof_ssp_amp.c          | 264 ++++-------
 .../intel/common/soc-acpi-intel-adl-match.c   |   4 +-
 .../intel/common/soc-acpi-intel-cml-match.c   |   6 +-
 .../intel/common/soc-acpi-intel-jsl-match.c   |   4 +-
 .../intel/common/soc-acpi-intel-rpl-match.c   |  12 +
 12 files changed, 518 insertions(+), 812 deletions(-)

-- 
2.40.1

