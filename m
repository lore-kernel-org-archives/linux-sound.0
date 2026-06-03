Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471C6409617
	for <linux-sound@vger.kernel.org>; Wed,  3 Jun 2026 08:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477014; cv=none; b=mhNoDE7MXh+VL74nbmJu3sOnF4YRGqGRwTAW83D5lrOKEnmooL24gadDICHVF/pfjlbgXWSRLXK8g3rBfpJWhquBiBOObaETJNskoq6IyrU1IZfrpfES3jpDbPwGO9tHD0T0U3Za11yy1MKftomdJVU81mHC8g16dW5AwmqbDk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477014; c=relaxed/simple;
	bh=huOTDgM/ZqZ1g/cQNsSFCNys89GrIbNsktv0Df6UOlg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XtwAcilZZDonecoe8BTAjZpORptckSr83jbs1iL8lg8CovCSDZoew8XHdl98FHdZXlFERDu1HYdgJ8gRbHqgvINIsN5O6egDk0pnsINonNEA3vCnl225XpYj3vPTqk9lAG023qeb+xgS8VGxg6/VVpgK2N/YWW3I0/uTLpVgmJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D1cPoO6O; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D1cPoO6O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477013; x=1812013013;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=huOTDgM/ZqZ1g/cQNsSFCNys89GrIbNsktv0Df6UOlg=;
  b=D1cPoO6OzqNTTlzEAZwmsE4Mk/TfIg5kDsfnOnR2b3LNdUOau92QTeer
   aBPyd9SDsJ24rCVocQ2ByICGqwU2SvxqbSWKjtJPqnswSy+SuOW/jzPJm
   gPjQ6YF/H2YCJbF9I+FvutGvn6D8lloohSuimB4gNBjRCcugS1p+tQASx
   UXSVUjJtyr2ykdfYNzjOmzJIVbsr1YCt4Nb59EmeYCqAlnTTzO0Ys5/dk
   4dWbjy3JbqTjovvGqkbm2Xcbaa8Pro+xMP6Bot4qnwi5Rk9BG3QYKItIt
   eR8v6C1yEjU+qoXDsPe3WWgVZVKEjKE0ooCGOt/xRB8loCyEk8z7cBGY+
   g==;
X-CSE-ConnectionGUID: TzSxU255Q0q7aj09FHSyEw==
X-CSE-MsgGUID: Iz/omBeHQguQZD9s4LEDUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81182117"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="81182117"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 01:56:52 -0700
X-CSE-ConnectionGUID: PbIGqgXtRumQ9zNrVIMh/g==
X-CSE-MsgGUID: 1PLeSRi+RISh1xhdFM4qXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="248109307"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa003.jf.intel.com with ESMTP; 03 Jun 2026 01:56:50 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 0/7] ASoC: Intel: catpt: Code cleanup
Date: Wed,  3 Jun 2026 10:58:20 +0200
Message-Id: <20260603085827.1964796-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All of the changes found here are cleanups and from functional
perspective, have no impact - either unused code is being removed or
existing code is altered to use helpers/macros to improve readability.

Collateral of recent fixes [1].  There is one more patchset with similar
goal following this one.  Before the team managed to actually fix the
problem, a number of changes were added to make the code easier to
understand for people who are not the author (me).

[1]: https://lore.kernel.org/linux-sound/20260528083444.1439233-1-cezary.rojewski@intel.com/


Changes in v3:
- reworded commit message for 5/7 patch to avoid any ambiguity
- the mute-boolean is now declared explicitly
- spaced out the code a little
- added Andy's Reviewed-by: tag

Changes in v2:
- removed the header declaration for
  catpt_sram_init() as suggested by Mark


Cezary Rojewski (7):
  ASoC: Intel: catpt: Utilize lock-guard helper
  ASoC: Intel: catpt: Replace RAM-helpers with resource_xxx()
  ASoC: Intel: catpt: Simplify the RAM-navigation code
  ASoC: Intel: catpt: Simplify catpt_stream_find()
  ASoC: Intel: catpt: Remove unused WAVES controls
  ASoC: Intel: catpt: Drop manipulation of the obsolete direction flag
  ASoC: Intel: catpt: Cleanup components_kcontrols[]

 sound/soc/intel/catpt/core.h      |  1 -
 sound/soc/intel/catpt/device.c    |  9 ++---
 sound/soc/intel/catpt/dsp.c       | 19 ++++------
 sound/soc/intel/catpt/ipc.c       |  9 +----
 sound/soc/intel/catpt/loader.c    |  7 +---
 sound/soc/intel/catpt/pcm.c       | 63 +++++++------------------------
 sound/soc/intel/catpt/registers.h |  2 +
 7 files changed, 28 insertions(+), 82 deletions(-)

-- 
2.34.1

