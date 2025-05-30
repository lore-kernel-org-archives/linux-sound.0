Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2CB1C683
	for <linux-sound@vger.kernel.org>; Fri, 30 May 2025 14:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613880; cv=none; b=I3OY5/BqphPodqcfjaYDqJ5jbYkzyuYK9TS+0ErGvmtFg4C4vVX6ayLczMlnKMkUtGlL6MR23S6SdZA5QiGWuRxO/HxOiZ3+1bSgo87lyvNUggbukpihfsvdFN5nEIkWTJI+cP2zR3AMwCgYZzJXYXmI2k9uDW81DrchOTmJlpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613880; c=relaxed/simple;
	bh=c64FBcGApBlkCbV5xIg9sMmxd/81c3MxxeEXSWdhiBE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AFjMuZelH/7uqEnvHUP7f2ZE4dxMzgfsexBn3kUAnqJPHZw2VoL5ALD9SxdXoIJ8I90c9G7M0cQFirYxYP10U1RAigIv8L7gq3SnRIB3xbCZ4gdPT2BWQboGhqrQrZsmobtics7PzSpfYogrRJ7p1OfClwxuZVjg5SeqqwpAvx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MzsMekbj; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MzsMekbj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748613879; x=1780149879;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=c64FBcGApBlkCbV5xIg9sMmxd/81c3MxxeEXSWdhiBE=;
  b=MzsMekbjA4STnVkY1tf3gwvHyxMmDaN52Yr6L9vODkJ+v6d8MsjZFr9S
   A0V+U0VWmzCJDeqRBAejlxHCWNnOEi7DFXVFfvuTV3WUPCso6nfuvh/zR
   54KMEe7UJpfrRj7xnqelqUpPidWj8a1QB/chgkxzc7trNJubEGj4aj6AB
   YtlXTKKraT0XQsTdadP/MB2bcp0T9T1FF4i+tbeX6zXtEdgJkmgkLq8yu
   m3Pa6Sy6id1uZFzPjU40nIg1d/8VTaTVdE8PkkrRQ+TJ6sJYQkz+JnaRQ
   0LyVheE/JNCKFvypbnH6ildnKjA5smzCXtqy75t3DePTF95SyXtcyPuoa
   Q==;
X-CSE-ConnectionGUID: odpN3C3YR9iRxvoC9e6iwQ==
X-CSE-MsgGUID: gzS8tlubR2C7GJpvQkQcBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="53336530"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="53336530"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 07:04:38 -0700
X-CSE-ConnectionGUID: q8xnekzDSQykMGmZ1Hw8UQ==
X-CSE-MsgGUID: FtMI/o/CRxWwHWNT50JCYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="144357376"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa010.fm.intel.com with ESMTP; 30 May 2025 07:04:36 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 0/3] ASoC: Intel: avs: Add rt5640 board support
Date: Fri, 30 May 2025 16:21:17 +0200
Message-Id: <20250530142120.2944095-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Small set of patches intoducing two low-impact improvements to rt5640
codec driver and then avs_rt5640 machine board driver. The board
behavior is based on existing boards such as avs_rt274.

In regard to the retry-device-verification change, there is number of
similar "fixes" found in the Realtek code in sound/soc/codecs. What I
provide here is verified with tests, the delay is not mentioned in the
spec I have access to.

Cezary Rojewski (2):
  ASoC: codecs: rt5640: Drop dummy register names
  ASoC: Intel: avs: Add rt5640 machine board

Xinxin Wan (1):
  ASoC: codecs: rt5640: Retry DEVICE_ID verification

 sound/soc/codecs/rt5640.c             |  43 ++--
 sound/soc/codecs/rt5640.h             |   6 +-
 sound/soc/intel/avs/board_selection.c |  27 +++
 sound/soc/intel/avs/boards/Kconfig    |  12 ++
 sound/soc/intel/avs/boards/Makefile   |   2 +
 sound/soc/intel/avs/boards/rt5640.c   | 270 ++++++++++++++++++++++++++
 6 files changed, 338 insertions(+), 22 deletions(-)
 create mode 100644 sound/soc/intel/avs/boards/rt5640.c

-- 
2.25.1

