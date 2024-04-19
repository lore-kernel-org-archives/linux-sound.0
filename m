Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097B977F11
	for <linux-sound@vger.kernel.org>; Fri, 19 Apr 2024 08:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713516440; cv=none; b=W0gEwlU8np0DTdW4t4PUHsoIShhiGkShopCX06GxxRjOvuvagaAnGmQuHXSjQFO3+m7AitYFgsLCuJrxd536/gEpsPBku/k+FP+cKjvDfm3UaG5S4AiWCB7ejrTU2Sywb9XTnnR/TsdPIU45rLwbChRh8aQ0+T1FNuMCw2jOiBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713516440; c=relaxed/simple;
	bh=ojVZrBBLkQUiA+8w8ZReZUeAU4aBcYejjyFtUBkDAaY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lfB4BcpO84neD3kYfSffN3jTgCmjdx4vPGGF1eKNhRATE0LI9Qopt6LHrFxYsK1oFalvvDGh8z7wM0936sBqAPSdqoFb6WfMX5ARQiZGVqQQM4vX3siqIqa/5VUCE+sGacHkxzhgpA7fBcabDlbo/s57PE0GNrAZGnfW6WOeAt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iym2PMyb; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iym2PMyb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713516439; x=1745052439;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ojVZrBBLkQUiA+8w8ZReZUeAU4aBcYejjyFtUBkDAaY=;
  b=iym2PMybbrBak/kL9fEUQMNQjKeFf2IyiQqbjAH11xdcVII7ijqat4+v
   m7MWiOklj0U7b2NhduSHnkOEaz8qYQ4GH3snyuouwTCExdqlxes9p+RvI
   gQP/zsV6/YvIXi5+zhf7jA+EEyxPeKkERxzmqaG+TzQiTa/jqmcYtkyG6
   3NiJLTuXzXJwnsjpwDZq/u1yIzzDIF6Dtf7yjO5mgMkAparM3zfo7g3cy
   iwL11WPLRSSNpuQ9fzOHivNOw+JDVn8HpqUehBVLZcocEbwM2glJ7Ls9t
   sGW7FV+723d4MD0MQ98zowiKwVgWMuwaKfvJ3IrHx0CcXZKJk4yD5YbBk
   w==;
X-CSE-ConnectionGUID: ARt1FbyiTNOiQXlLR1g2BA==
X-CSE-MsgGUID: mTONmGX6SlC+LsfOPN3qxQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="12941964"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="12941964"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 01:47:19 -0700
X-CSE-ConnectionGUID: jQ0m5LCPSBqotRGCA+/r9g==
X-CSE-MsgGUID: +2+E6CDwSheR+Hp3Oc417g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="46551798"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa002.fm.intel.com with ESMTP; 19 Apr 2024 01:47:16 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 0/2] ASoC: Intel: avs: Refactor IRQ handling
Date: Fri, 19 Apr 2024 10:48:55 +0200
Message-Id: <20240419084857.2719593-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing code can be both improved and simplified. To make this
change easier to manage, first add new implementation and then remove
deadcode in a separate patch.

Simplification achieved with:

- reduce the amount of resources requested by the driver i.e.: IPC and
  CLDMA request_irq() merged into one
- reduce the number of DSP ops from 2 to 1:
  irq_handler/thread() vs dsp_interrupt()
- drop ambiguity around CLDMA interrupt, let skl.c handle that
  explicitly as it is the only user

With that done, switch to the new implementation and remove unused
members. While the change is non-trivial, from functional perspective
status quo is achieved.

Cezary Rojewski (2):
  ASoC: Intel: avs: New IRQ handling implementation
  ASoC: Intel: avs: Remove unused IRQ-related code

 sound/soc/intel/avs/apl.c   | 20 +++++++-
 sound/soc/intel/avs/avs.h   |  8 ++--
 sound/soc/intel/avs/cldma.c | 42 ++++-------------
 sound/soc/intel/avs/cldma.h |  1 +
 sound/soc/intel/avs/cnl.c   | 91 ++++++++++++++++++++++++-------------
 sound/soc/intel/avs/core.c  | 85 ++++++++++++++++------------------
 sound/soc/intel/avs/icl.c   |  3 +-
 sound/soc/intel/avs/ipc.c   | 48 -------------------
 sound/soc/intel/avs/skl.c   | 73 +++++++++++++++++++++--------
 sound/soc/intel/avs/tgl.c   |  3 +-
 10 files changed, 186 insertions(+), 188 deletions(-)

-- 
2.25.1

