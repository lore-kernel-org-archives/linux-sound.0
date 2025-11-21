Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E3A33ADAA
	for <linux-sound@vger.kernel.org>; Fri, 21 Nov 2025 11:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763724194; cv=none; b=Pg2x7A1wFgq19XKZD9F0sYOfrXFKCWNRlKKwTwST/XYdGtB6ugpSwzKIPdSVbO4EcvsQU8SEAw3Z4mEHebYdIzi10dZrCB8kXCGrnXGZNBscaEulHyulrUQEL8KDKnXKm908gYwQoE9CM//uAJOtfzlAzN2EqwaxzWFVQNrO8II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763724194; c=relaxed/simple;
	bh=sT5mrJJuA8X4G5jVUVfT8xthEtYEyDD6unmYDXq50J0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=shCpvcaPV9NjfzV8ylfROwbtWyuCR9Cs2I6kAewqfgS3iPIGucJ24E8sZGIZYSy8gmnVevzzRFa1xnpu3z9tMqbabUJaG/P+vT5IIeii02t2mHusVaJx1/4Jpb2LdRGgvlVXn2RRrBJ7ISMK/QaAXW3oP3Sn/JuwrCyf27VfoSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U2GWOXSC; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U2GWOXSC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763724192; x=1795260192;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sT5mrJJuA8X4G5jVUVfT8xthEtYEyDD6unmYDXq50J0=;
  b=U2GWOXSCJ5EtmbxH63OAt9xl/q1QdkrPez/BFVGGP04ovZSPxwwlPRBY
   s4Gw4WRc/Amxa1yxdW5OmPIcgo3U9UYh4Ooc+/neTipivQ2y//p1bEF6i
   DJUrYtlFj8iVlZviFiJgQ274wKB1+PCLCKOcM1W3riZiKgOtqpv70qNzC
   IwSaPxmSZoe7BDS9FOxO1DY6+JNPT2fFDrBsLogqs9dS1pQZC0osPoU5y
   GgYY708Rt9P1O+2aLG43poRPPTZdhUGROV+VGeD6h0PmQ0qXmEAphMc/S
   HTKXN6redbAny5TOq/ORCXMKfX81s6WvSuHVVV7BlU2/J9SAXQeQDfx+L
   w==;
X-CSE-ConnectionGUID: YBWqY2w2TSek0b4bM7u5QQ==
X-CSE-MsgGUID: Cq4t8v96SmiAiVZBbbxFlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65845906"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="65845906"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 03:23:10 -0800
X-CSE-ConnectionGUID: wl/k2oD6QBa0LsOIaZ2WiA==
X-CSE-MsgGUID: usk3a3JHRhObaMSY6PE4pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="191462823"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa009.jf.intel.com with ESMTP; 21 Nov 2025 03:23:09 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 0/6] ASoC: Intel: catpt: Round of fixes and PM changes
Date: Fri, 21 Nov 2025 12:43:25 +0100
Message-Id: <20251121114331.3841335-1-cezary.rojewski@intel.com>
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

The first two patches are straight-forward, the last four relate to the
power management. The standing out PM change is removal of the
catpt-driver as a system-suspend (S3) blocker. This is a suggestion from
Andy as indeed, audio is not a critical component that should prevent
the system from going into S3. Whatever happens, the driver can recover
on a follow up resume (S3 -> S0).


Cezary Rojewski (6):
  ASoC: Intel: catpt: Fix offset checks
  ASoC: Intel: catpt: Fix error path in hw_params()
  ASoC: Intel: catpt: Fix probing order of driver components
  ASoC: Intel: catpt: Do not ignore errors on runtime resume
  ASoC: Intel: catpt: Do not block the system from suspending
  ASoC: Intel: catpt: Drop catpt_runtime_resume()

 sound/soc/intel/catpt/device.c | 33 +++++++++++++++++++--------------
 sound/soc/intel/catpt/loader.c |  8 ++++----
 sound/soc/intel/catpt/pcm.c    | 16 +++++++++-------
 sound/soc/intel/catpt/sysfs.c  |  2 +-
 4 files changed, 33 insertions(+), 26 deletions(-)

-- 
2.25.1

