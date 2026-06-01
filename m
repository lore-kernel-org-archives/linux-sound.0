Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D561D9A66
	for <linux-sound@vger.kernel.org>; Mon,  1 Jun 2026 14:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780322935; cv=none; b=KuWSdEFeS0UBTEntFJN+0saHfFyHVI1JJcy7LcK1tFubavgqnZBfk/R03BHEsThLOPBLg/ott2VPCiT7rr4MH7EoCAmcCK62LSswW8MAkUpyFOxEq/y8+4Rq0j+EXhO7AWuH40NGrhIVJfndrJ9QfI86QGgj7DdoUBnVxcVRQyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780322935; c=relaxed/simple;
	bh=Siiy1MlF6DkkzVjRdrvdo6H6VPAy2O3lULG9HgC0Mz8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ehMsJEpNSfW4eIsjI+glpqeDjifNgpGvD/moy0pnTaTZCQM+AR1Kxr/0lAEAm+hUAamKQIC/EnQuaqTAU72zx/u5Sx/zYn8l7CLeiNDcNbkEYcE1HN5FnOcQT98a2c7BLZVmjoqpQPr0PEp6bhE4RrbqNO5rotoX+C/79ujVmdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MUtitIL3; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MUtitIL3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780322935; x=1811858935;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Siiy1MlF6DkkzVjRdrvdo6H6VPAy2O3lULG9HgC0Mz8=;
  b=MUtitIL3ThrDxGmDQgHG0+xNsfQn1zMeZlCuF6ow5SeoHWRkUVXnDyV8
   cacD8q6Hh+azApyNdo0W/Y6aKZIOs0yQwZOdi1qgADNwTDigalAB7RWYm
   wYDajA3SMmYSMTYvE4v7ukh4KfXDkyX+IwZqXuOaQGheW1SE7thSECZYa
   /lss87snrZYjjPNtwZ0MEl2kytKWnSpAcrQt4abOQHnvC0mhoAG3Dejxh
   saIG6HMvQMjj8nm9uw0HUmiSxydKJjFShWq4bcbWdR1WFKADO9Sccig/o
   H9hURqgD+9v1Mblx+9NgcgdfV9M/bwzBbW9709hEFgpXNnA2IBU+fqlhK
   w==;
X-CSE-ConnectionGUID: r+r1cZRTSouIlA5rzW6P+w==
X-CSE-MsgGUID: 3Wa+KMiARlWcT+QqSpB3pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81140236"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="81140236"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 07:08:55 -0700
X-CSE-ConnectionGUID: d3jaQI5iSmKaLkFNfQKTAw==
X-CSE-MsgGUID: Mi6JqJCHR66XH3+lOAEJFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="243704883"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa007.jf.intel.com with ESMTP; 01 Jun 2026 07:08:53 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 0/7] ASoC: Intel: catpt: Code cleanup
Date: Mon,  1 Jun 2026 16:10:24 +0200
Message-Id: <20260601141031.1606847-1-cezary.rojewski@intel.com>
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


Cezary Rojewski (7):
  ASoC: Intel: catpt: Utilize lock-guard helper
  ASoC: Intel: catpt: Replace RAM-helpers with resource_xxx()
  ASoC: Intel: catpt: Simplify the RAM-navigation code
  ASoC: Intel: catpt: Simplify catpt_stream_find()
  ASoC: Intel: catpt: Remove unused WAVES controls
  ASoC: Intel: catpt: Drop manipulation of the obsolete direction flag
  ASoC: Intel: catpt: Cleanup components_kcontrols[]

 sound/soc/intel/catpt/device.c    |  9 ++---
 sound/soc/intel/catpt/dsp.c       | 19 ++++------
 sound/soc/intel/catpt/ipc.c       | 10 +----
 sound/soc/intel/catpt/loader.c    |  7 +---
 sound/soc/intel/catpt/pcm.c       | 63 ++++++-------------------------
 sound/soc/intel/catpt/registers.h |  2 +
 6 files changed, 27 insertions(+), 83 deletions(-)

-- 
2.34.1

