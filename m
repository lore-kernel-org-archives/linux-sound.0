Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA82C59B5B
	for <linux-sound@vger.kernel.org>; Wed,  7 Feb 2024 12:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707307774; cv=none; b=pXGzJs7QwloeEJ3hqqAMqaw1By8YjnQDn4d8IF89ofC1BObnZMUgGdLKOJl2NkyvpVkguAg8/040xvhtf2/hLfpPmBrtMNr9vDhXnaYzJ8mcIk09COQt3gk5hbxY1Q8dMvHrZosVULDWVUr+WGXnykgwk7T0LiK9D4aw7SFU4kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707307774; c=relaxed/simple;
	bh=vGgUGRrdA1r6NFau95DVl0fNBdIbIr0pIl2y125jwpw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=grXEKBNw0cb5ERAm46lzUqnlg/zPt8kbWSUjG+OokH+qxUSBjzECMxt8klCoD4piHdNSHxCGsApT7uEl+AtsBkbAy5FnvGpca9na2bcPAve2U2k7/gJb/XqgTIPLJ5Z6S4PDUYb/lOhVmbIBfLOT96F9j/4dw9i7uC4fi4RF6XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UMiprK3t; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UMiprK3t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707307762; x=1738843762;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vGgUGRrdA1r6NFau95DVl0fNBdIbIr0pIl2y125jwpw=;
  b=UMiprK3tHiUWH2bKdajLDuCjjTGtc6ZnjkxVcz3QShOAMgnW/48j5q4k
   yukREHZBklxyw3bHs2yhvcMfYwhtEHugH3To9TEba8PV6mxdhsdarFio9
   rY2ikgYvMUu6uXsy4IhREV87KYKJ4QI7+DlowKkcv2pHLr23zNs+ifRon
   +jKE2YI+8r7k5c2SzCKZ4TD6msgAV6Ff5Uh4mkBMcjDNkPhCb3cgWhJnD
   B+WHTSECWacUrk5zm4nM06taLPrulm6TyS/O+pkYcZ1X3BjrfqTIuVABG
   3zY9P5/rlHcNaMIde0kal47pKVfpxb1Su/efscnzlLAh5MNpa9gQWBYoJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="4757834"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="4757834"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 04:09:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="1631795"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa007.jf.intel.com with ESMTP; 07 Feb 2024 04:09:15 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?=C5=81ukasz=20Majczak?= <lma@chromium.org>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 0/3] ASoC: Intel: avs: Add support for sending initial module config
Date: Wed,  7 Feb 2024 13:09:43 +0100
Message-Id: <20240207120946.2140480-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In some cases it may be desirable to provide default initial
configuration for FW module using payload. To facilitate such solution
extend topology to contain initial config information, parse it and then
send data to FW if present.

Amadeusz Sławiński (3):
  ASoC: Intel: avs: UAPI: Add tokens for initial config feature
  ASoC: Intel: avs: Add topology parsing support for initial config
  ASoC: Intel: avs: Send initial config to module if present

 include/uapi/sound/intel/avs/tokens.h |   9 ++
 sound/soc/intel/avs/path.c            |  33 ++++++
 sound/soc/intel/avs/topology.c        | 163 +++++++++++++++++++++++++-
 sound/soc/intel/avs/topology.h        |  13 ++
 4 files changed, 216 insertions(+), 2 deletions(-)

-- 
2.34.1

