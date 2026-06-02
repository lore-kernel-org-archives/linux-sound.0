Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D6D3A8749
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 08:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387974; cv=none; b=RmXbG/08P8xtHT0x/fZIqz6ptABkTe4dtLbi6MJxWI87OXutCDpbcMd1DzPewSjGvZ8Y3cc6iRx2fiLaayz1Aw0tvgfFbgAbINxhg3+J/0ed0mZTEjGfM66mk3SgADkj3PY1sxYOOpfPe6GkUYASiUkqvnEG3pC2Fe7XG9ZlbVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387974; c=relaxed/simple;
	bh=lM6Yx912fHfQrNUHZYMrp4FcmEKI7xxH2KvAyoce6KI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G8Fo2W4v/QXw1jBEIT6rzMhFtJIOZSNrn0mvXK0JmHbaA0fDgIwrtjdIrkHNjrZECOJVpd0jsTI8s6puPFIG6u0K8T0baOumM4ADVJ/Pv/Ver1eklAhrT46Yr6tUxJUuazR/BpdSIDrDSsFXzVDn8ge7IvfTMf2Vbh0eZIU6Cjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SB1y4N2R; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SB1y4N2R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780387973; x=1811923973;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lM6Yx912fHfQrNUHZYMrp4FcmEKI7xxH2KvAyoce6KI=;
  b=SB1y4N2RP5asjpgIrcKYYW1vpo16xJpYv1lN212YYA+ZfId6OL877TbM
   SbO85Bm8IXAxFR8W/5Ei+LKQiQLJAnmnAzYtZ+DZBGsO+S83+YFMpyKzW
   /WNGlQc4/z0SVOVAhAG3KMq0skcsAIcMaBX1BSFGJJIyJ2ZsZDStwkgTa
   ZYesXw2jMpY42FvqbfSm6Y2sdnz9n3M3ybH9v2hFG3E/KFdIHvk15DWVk
   xyi8qPVJZLx46z2tWXPZY8XtkzP4tvgSwRKo6LF3LS2krRKbgAVnlaf6D
   OCGFFRKWkwGd16pVNJe27bFWgbynRNmBT62MQ33r83lieyQ7sNPrQG0Fo
   w==;
X-CSE-ConnectionGUID: NczCJH3rT2SgPkJlYTdu9Q==
X-CSE-MsgGUID: Rk5bN8KTSB+gUwoHTiK/eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="91742872"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="91742872"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 01:12:52 -0700
X-CSE-ConnectionGUID: fKXdDb9PR2CTLAaG2UtskQ==
X-CSE-MsgGUID: PFR7mELHTzatAFgAtQRFHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="243949922"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa007.jf.intel.com with ESMTP; 02 Jun 2026 01:12:51 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 0/7] ASoC: Intel: catpt: Code cleanup
Date: Tue,  2 Jun 2026 10:13:43 +0200
Message-Id: <20260602081350.1752773-1-cezary.rojewski@intel.com>
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
 sound/soc/intel/catpt/ipc.c       | 10 +----
 sound/soc/intel/catpt/loader.c    |  7 +---
 sound/soc/intel/catpt/pcm.c       | 63 ++++++-------------------------
 sound/soc/intel/catpt/registers.h |  2 +
 7 files changed, 27 insertions(+), 84 deletions(-)

-- 
2.34.1

