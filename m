Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E549BCA4E
	for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 09:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764149715; cv=none; b=XnGIw00bPEO55Nm93S+AdJUt1R7MzvWSl3ilPxZ2RBykMo2b4ZoQlxzwtQ5m4qKw9eTNPzl0dmaTpCkmOL5PgTnBotxC/8lKJ4+OX0hFYNBEBSqeHV41wpSjX9yaNq89J88PPlu6giFXIEfZ6E9gnD3cbY+GhO+yLZo7LqbcF+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764149715; c=relaxed/simple;
	bh=QRrHAR3J9nAQ65yE9eIhXKY7PTYYTQCvGAGJVaKS8uo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Q3I4liexriOfriCsnEcMUq0NIPOaE65XH0j0cUWk4YRL0L4urYZoSYYmuD4kzRQJ7h1S+DzMpS7Y0/6txkMqpD6IHQDBk/Ibxwv5ChfjyZCvv7zXr3QGoLpvMkIkLCzlLhzYjQje2UNv24kLuWMNHvBaATloHwW8y22oy/CU1pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mzNIDUJ8; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mzNIDUJ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764149713; x=1795685713;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QRrHAR3J9nAQ65yE9eIhXKY7PTYYTQCvGAGJVaKS8uo=;
  b=mzNIDUJ8CWDtKWEqZyzR8oA6llPRFGDppzcPFIR5BYR4LIqDnP+RGQ5w
   TBXo+Db9ZCT1bQDeKlYbUZV/N/mMRZn9xaYKwGXxxOeSP2tSOZU6kHrh2
   8ViIDrluM02VJzvYcosVNPJ3qtoWKhkLCO7soK1srVsr+YPV5ShE0p6RT
   Ntmd+dEz3LrNbGGeYqyl+6jENsuP+KKnkG+R915dpJdL2/6N4mvtAPVDI
   YjjgYSODcLQJrGrsRf7EfC0+wXCOIuJXSWxaETNSSvpJ0Zyt7czXIQiw+
   D8tIpedtkdvKFlDo9SRLlA9fm19b/iN06AMlpNK6eoleiqx0D7mhgaKd4
   Q==;
X-CSE-ConnectionGUID: r1Yyj9UjSZ6w0pvOqmiXrg==
X-CSE-MsgGUID: mKa2+Qt3Rhy/nScrpK1omA==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="68769280"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="68769280"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 01:35:12 -0800
X-CSE-ConnectionGUID: S5ltK8xWQmCrHpnWCW5yDg==
X-CSE-MsgGUID: BROFKmgoQVuDwum90+6UOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="216251680"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2025 01:35:11 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 0/6] ASoC: Intel: catpt: Round of fixes and PM changes
Date: Wed, 26 Nov 2025 10:55:17 +0100
Message-Id: <20251126095523.3925364-1-cezary.rojewski@intel.com>
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

The first three patches are straight-forward, the last three relate to
the power management. The standing out PM change is removal of the
catpt-driver as a system-suspend (S3) blocker. This is a suggestion from
Andy as indeed, audio is not a critical component that should prevent
the system from going into S3. Whatever happens, the driver can recover
on a follow up resume (S3 -> S0).


Changes in v2:
  All points below suggested by Andy.
- removed the last patch from v1 "ASoC: Intel: catpt: Drop
  catpt_runtime_resume()"

- added new patch "ASoC: Intel: catpt: Switch to resource_xxx() API"
  which refactors existing code that manupulates .start, .end and size
  of resources to publicly available interface

- patches 1/6 and 3/6 have had their message justified to improve
  readability


Cezary Rojewski (6):
  ASoC: Intel: catpt: Fix offset checks
  ASoC: Intel: catpt: Switch to resource_xxx() API
  ASoC: Intel: catpt: Fix error path in hw_params()
  ASoC: Intel: catpt: Fix probing order of driver components
  ASoC: Intel: catpt: Do not ignore errors on runtime resume
  ASoC: Intel: catpt: Do not block the system from suspending

 sound/soc/intel/catpt/device.c | 26 ++++++++++++++++++--------
 sound/soc/intel/catpt/loader.c | 18 +++++++++---------
 sound/soc/intel/catpt/pcm.c    | 16 +++++++++-------
 sound/soc/intel/catpt/sysfs.c  |  2 +-
 4 files changed, 37 insertions(+), 25 deletions(-)

-- 
2.25.1

