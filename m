Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E8F30CD98
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 14:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756303297; cv=none; b=uUrPq3ctMpE8kU4yLrw+eX47ctK8LKmvYfiFE8Sy7jWTyF6UQH5UIEoJNonjpbHe4hfzWWLqqUvjAmqCWpgOzS8+ZQvi7HoWHahPjLqrzwBeXRH8SmKogqmey0TfoKqKe79rojNsBPgS2i5rQ7aJNgrq4neDb23QXY/J+k2gCwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756303297; c=relaxed/simple;
	bh=NsPHWq2zNoypzQK1euWLoEpBFP6OqACyHLd9q1QLRKM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=XC1M53BFsbGnbfl2vdNFkYWMMISGFjl0cccjgQQ1MLrfsNKbyMhU3vlkAgaGvb+uJ7O7QRMedFOVhJTZyB3Gn7vo2ERdEKdbWyDd6D9hBsRjjwBLoleZRNCOZqPfEgJ6wP0jOEDDNt3b/fBBpvdWrkcEm6mxR7AUEHuuKG33G0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IMBaxJ4c; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IMBaxJ4c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756303295; x=1787839295;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NsPHWq2zNoypzQK1euWLoEpBFP6OqACyHLd9q1QLRKM=;
  b=IMBaxJ4c1So1Q/4P/dYSuM4ZVee/hLDdyvXavD/Ivwftget4hM34mcJB
   4t7ndbne+KqdPmALbMdEwDqSrZiCXhrF1vpa50f0XYY0Tm5qQigGywNpg
   AenGduwnRQHNk10aUTXULBR06DdoaxDVN6rS32gDIZljemsN4PhkjGwCO
   6J4G6Te31DR3OGv8CtSxlW2QqbxKwevmi6gBFWwSd+f2UueBzZ5xuy5go
   Qmooi6eaZzf8ONOFoI16YQHScWbDj11fohrH836hyg1wF2aX6pIxrzOKN
   ZsicioSEqGgThxMuHry3My5Vqu31gW4fUcoNpBY1dl1ulAOYbPUpjw15a
   A==;
X-CSE-ConnectionGUID: YWmlCQQcQBiaIncM8NLNpQ==
X-CSE-MsgGUID: V3LuOjE3RD2Nl4OvUDUiXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58473748"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58473748"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 07:01:35 -0700
X-CSE-ConnectionGUID: vqlHkMRLR4G+K9rtgFvlMQ==
X-CSE-MsgGUID: W/yaa+jWQ8KnPSNE9bKGUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="170016764"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa008.jf.intel.com with ESMTP; 27 Aug 2025 07:01:33 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 0/5] ASoC: Intel: avs: Refactor machine-board registration
Date: Wed, 27 Aug 2025 16:22:24 +0200
Message-Id: <20250827142229.869139-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Set of patches all connected to the machine-board registration process
and the board_selection.c file. Apart from LOC reduction, allows for
multiple cards of the same 'type' e.g.: avs_rt5640, to be present
simultanetously without any workarounds or tricks. The last patch
improves debugability - helps us (the devs) deal with basic I2S-boards
issues out there without forcing the user to constantly switch between
debug-friendly and non-debug options.

--

Initially I wanted to have the first two patches (new implementation and
the follow up cleanup) to be just one patch. However, the git diff, even
with --patience does not look good, at least in my opinion. Decided to
split the changes into two separate patches to make it easy to review
and comment.

As the first two patches carry heaviest load, the summary:
- provide a unified avs_register_board() wrapper for
  platform_device_register_data(PLATFORM_DEVID_AUTO). The _AUTO is what
  makes every device name unique and prevents any naming conflicts to
  occur when matching components <-> cards in runtime

- provide avs_register_board_pdata(), a wrapper one-level above
  avs_register_board() that takes all custom parameters in its argument
  list so that the initialization of 'struct avs_mach_pdata' does not
  need to be repeated in every function like its done today

- make use of the two above to write simpler registration functions:
  1. init any interface-type-specific values e.g.: SSP port for I2S
     board
  2. call avs_register_board_pdata()
  3. register the ASoC component with avs_register_xxx_component()

In regard to the last three patches - two are simplifications, no
functional changes just LOC reduction and readability.
The last one is to improve debug-ability, especially when working in the
open field - often we, the devs, find it useful when debugging
production systems to run i2s_test (the debug board) without impacting
the 'real' board e.g.: avs_rt5640. By default i2s_test is empty so a
typical user and their scenarios are not impacted.


Cezary Rojewski (5):
  ASoC: Intel: avs: New board registration routines
  ASoC: Intel: avs: Cleanup duplicate members
  ASoC: Intel: avs: Simplify dmi_match_quirk()
  ASoC: Intel: avs: Simplify avs_get_i2s_boards()
  ASoC: Intel: avs: Allow i2s test and non-test boards to coexist

 sound/soc/intel/avs/avs.h             |   1 -
 sound/soc/intel/avs/board_selection.c | 319 ++++++++++----------------
 2 files changed, 124 insertions(+), 196 deletions(-)

-- 
2.25.1

