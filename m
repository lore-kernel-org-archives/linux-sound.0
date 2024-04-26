Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5B213EFEC
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 09:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714125411; cv=none; b=eziSZ+J8KqSvJ5njRq8XxLBFP7S2XGE9+Ch5oax9uDPtyJAfw4tLy/8waEYW/HPtK+ZAN6z5CYQlsvw7n/RMcay3Aod9hOLh7uKGuYuld6cjY7mAztkeQsevp7z2MuPRhjNsyw3U26/k5NgM8vKPfilWAyIaeEGrimnwzIob8KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714125411; c=relaxed/simple;
	bh=S0Y14cS9v8T8Hz+iw6/hHSZd+jbr1t3NSc0nj1YWyuY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G5/qCQzoiyxdMHZgeOuf8pJ3+EA4/Iaqpd50MOH1uHXux4Wq2YszesHcoc/cbaflTQe1VYJHQZQ+bPT7pokbsH1k7sjpwosx3ryQL3NqQVaxRGJRLmXaHsiQK9yvonNQqkW8DgUiknRfokdzsfOXof+wUcCSHrp3JVp9pwQSb8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qs88OeCb; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qs88OeCb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714125410; x=1745661410;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=S0Y14cS9v8T8Hz+iw6/hHSZd+jbr1t3NSc0nj1YWyuY=;
  b=Qs88OeCbw2+NT7djmPdyAAIfZLtX15w/4L/kmnTgZ1W0MoLvlVKYqCWi
   2G+dHybmev70a4z3Y1rsvZyzq3YD/seHjQaV3vdzgzf0Pn7uVl/Wi6Yk7
   28zKFGe17hiBBnIFqzskMHuhUsMf3sfszUBeey54XnMQAaO9DiitwImND
   jIq30thOZ0Bi0Oe1lWZ3NbpO9P62XBp77CY31fFb4xXN3pdJMc8ZK26nY
   u1iUny1NOLvSLVZSziVfmVdRRGAtNCUaIPWMAP5eA4NY4xh9kMPjSCh8A
   KhZEnHIyKTvOmw+UZM6K0/Cr4Km2zx5YK5lRsPmVpQstDIfaoisx4RaiY
   A==;
X-CSE-ConnectionGUID: jsD8U6ooR4aLfFgvIgI3oA==
X-CSE-MsgGUID: lSCZrC6LR/uYy7r3atVSVQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20409176"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="20409176"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 02:56:50 -0700
X-CSE-ConnectionGUID: oKRUPPqGQMO4N8oKYUN0JA==
X-CSE-MsgGUID: aJLiadZ6SDK4FcscLUKDYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="25460535"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa010.fm.intel.com with ESMTP; 26 Apr 2024 02:56:48 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 0/8] ASoC: Intel: avs: PCM code cleanup
Date: Fri, 26 Apr 2024 11:57:25 +0200
Message-Id: <20240426095733.3946951-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A set of changes that aims to improve readability of cohesiveness of the
pcm code for the avs-driver.

Start off with a change that synchronizes DAI open/close - DAIs are
started up in ascending order yet their shutdown does not follow the
scheme - it is done in the ascending order too, rather than desceding
one. This patch is a dependency for the next one in line.

To align the HDAudio DAI startup/shutdown with the non-HDAudio
equivalents, relocate the code from component to DAI. The reason above
is a dependency stems from codec driver requirements - HDAudio code
found in sound/pci/hda/ expects substream->runtime->private_data to
point to a valid stream (HOST) pointer.

With the hard part done, the follow up changes update the existing code
to reduce it is complexity - removal of duplicates, renaming of
ambiguous functions and adding new fields to DAI-data object so that the
number of local variables and casts is reduced.

Cezary Rojewski (8):
  ASoC: pcm: Reverse iterate DAIs when shutting them down
  ASoC: Intel: avs: Relocate HDA BE DAI specific operations
  ASoC: Intel: avs: Remove redundancy around DAI shutdown
  ASoC: Intel: avs: Store pointer to adev in DAI dma_data
  ASoC: Intel: avs: Remove redundancy around DAI startup
  ASoC: Intel: avs: Remove redundancy around DAI prepare
  ASoC: Intel: avs: Store pointer to link_stream in dma_data
  ASoC: Intel: avs: Clean up hw constraints initialization

 include/sound/soc.h       |   4 +
 sound/soc/intel/avs/pcm.c | 250 +++++++++++++++++---------------------
 sound/soc/soc-pcm.c       |   2 +-
 3 files changed, 117 insertions(+), 139 deletions(-)

-- 
2.25.1

