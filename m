Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8283016E3
	for <linux-sound@vger.kernel.org>; Fri, 28 Nov 2025 09:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764321237; cv=none; b=i4mr7040iZz1wj6AmyXja5S39BB3X4PfNMdBvqn0qsVOHYzZtLFRs8HNyVUMnwb5t/UFYE/Rus9xCLRo2YZQGCaYR9wlwa+2CYTbMPPTNFNwnc+HTxiU1ritHOYFuP6+idlx+Ni9GCdtGTqih7KE8F2SzfbbnOvdH189ldUgpVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764321237; c=relaxed/simple;
	bh=LDZC03lSfBQYQ4FurMOT4dJEIywPuKT8h6msjWbXSfU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AegbWeQW9UQzsaZiwvZNPTJhaUJHxaKV/pGWOnmbIOxtGkiBR1VE9cNJTVs4I1TkN3HG1ZtvA4ZaqmxUV+07JRzssh1XspIi6QksnVAbeuNd4UUKYg7urR6hr9CnT9W/VjSbKvrFzkioyiBuq0+eAZBPtNcCuNogs6nL/vpZliY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=npnFJaBX; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="npnFJaBX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764321234; x=1795857234;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LDZC03lSfBQYQ4FurMOT4dJEIywPuKT8h6msjWbXSfU=;
  b=npnFJaBX7b9HgT+i4k0EOmuInldG0c/0ghmciHBJSlVoQ/XdnXHM9NYI
   SXlaWhYwWPo6Cz8BJ7gvYRNmE7zh7sPHMhsJzwy1ertG4xPM8gXTf/8pV
   htExNgs7z6dFgNlrIgCxdIpr48T2sZSutFS3kc3A0E9iXcz2089Ha8YNZ
   5gzLd8Ugsyrruh7uLTwIhhQ4/wIg1pAEDECNaJx7TNuRqXgmZpl+dZtZS
   xJcghZk94a/b7vZ19QxHI6fmEP2Bva9douW959WMBujp2U92wgbm0VGlW
   uJ2/qUKRkcBhOf9RA3tRLc+HucvAjYzdM260I53LOXAJyoECMU2+Seqcx
   Q==;
X-CSE-ConnectionGUID: naY7P2mTSI6gRKe+dH7OCA==
X-CSE-MsgGUID: G/9D87vgSqKJ15p/gtYqNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66428473"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66428473"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 01:13:49 -0800
X-CSE-ConnectionGUID: a5IbK8P8TSKIipLr6UB5jw==
X-CSE-MsgGUID: WPehYoYCQnWenNlLqaHY/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="192680897"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa010.jf.intel.com with ESMTP; 28 Nov 2025 01:13:46 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 0/6] ASoC: Intel: catpt: Round of fixes and PM changes
Date: Fri, 28 Nov 2025 10:34:06 +0100
Message-Id: <20251128093412.3949374-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set of changes addressing gaps in DRAM offset checks, error paths and
PM.

Three fixes lead the way, all straight-forward. Followed up by a small
refactor to replace manual arithmetic with resource_xxx() API. The last
two relate to the power management.

The standing out PM change is removal of the catpt-driver as a
system-suspend (S3) blocker. This is a suggestion from Andy as indeed,
audio is not a critical component that should prevent the system from
going into S3. Whatever happens, the driver can recover on a follow up
resume (S3 -> S0).


All points below suggested by Andy.

Changes in v3:
- reordered the patches so that all 3 fixes are at the start of the
  patchset and added missing 'Fixes:' tag
- small spacing adjustments in patch 2/6

Changes in v2:
- removed the last patch from v1 "ASoC: Intel: catpt: Drop
  catpt_runtime_resume()"
- added new patch "ASoC: Intel: catpt: Switch to resource_xxx() API"
  which refactors existing code that manupulates .start, .end and size
  of resources to publicly available interface
- patches 1/6 and 3/6 have had their message justified to improve
  readability

Cezary Rojewski (6):
  ASoC: Intel: catpt: Fix error path in hw_params()
  ASoC: Intel: catpt: Fix probing order of driver components
  ASoC: Intel: catpt: Fix offset checks
  ASoC: Intel: catpt: Switch to resource_xxx() API
  ASoC: Intel: catpt: Do not ignore errors on runtime resume
  ASoC: Intel: catpt: Do not block the system from suspending

 sound/soc/intel/catpt/device.c | 26 ++++++++++++++++++--------
 sound/soc/intel/catpt/loader.c | 19 ++++++++++---------
 sound/soc/intel/catpt/pcm.c    | 16 +++++++++-------
 sound/soc/intel/catpt/sysfs.c  |  2 +-
 4 files changed, 38 insertions(+), 25 deletions(-)

-- 
2.25.1

