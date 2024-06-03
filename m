Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A79081AC7
	for <linux-sound@vger.kernel.org>; Mon,  3 Jun 2024 10:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717410459; cv=none; b=bNPb2msqZr+xkN7NjWfPtoJIXS5RU7vQriJ37PuVwYPJwrHxy22jTV6m0qgMEmP+/FetmFHiwF+nmAduNW+7YY5Hi1EJCDH8bE3D/JEhsZ1STuvOV0xAS+YdZSKh4Gis4I6E+/29Ds93+rxJBbT3/WxuDrqUUO6xBLsqypO48ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717410459; c=relaxed/simple;
	bh=zBoxYI6e7jUZhIXNajNwuL7GZWLuUWbRagMWTsGHiYw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=KdMzrAPXgNBYdz73VOEyPz9vLXL0JQlUSyhTrXlzi948J2JNVmlV3MAZg7peHqR+S+pCet5NaxhbHwo05nqo60oLPPCP7raeg3ENIaqWqYraEm/Dy+Y75BQ0MquMadbbl8qizJbrto1hk2LI7Ll7GNPXkRPYVtEqdauz0/H5hYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X86POSxq; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X86POSxq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717410458; x=1748946458;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zBoxYI6e7jUZhIXNajNwuL7GZWLuUWbRagMWTsGHiYw=;
  b=X86POSxqlRkmnK/huIk0tu1IOfN733steNWvlRTAGZmKxIjmwfiWD2B9
   2Xv8d3W+jgTEcu74Cz4LxsWYxsxijwDIJFKlzevbVJzCiKwkVZ1zfF6ro
   AEcfFxxfrg5AC07dWUC20IDWxFsMQPCU53/fn22o9a9Lf6C+If/ZPshoQ
   zsgohknyZO280Ich31D/DmP038nCXeTJb8PfPrubH7RVxsMpN7oaUsmfs
   zrfMzTnwBX9GQBlo2J0YiE2LQ/M5J8Q0VmCmKMLNdF2dsV/dVYClxHrwl
   AEJcXf3/gP7H/vG6tfWMswnneNcvTJdR+OJxsOAkAGDUtxzOpp6Vcj/m4
   g==;
X-CSE-ConnectionGUID: IRUUhZ3ZRE25RhawK05mEw==
X-CSE-MsgGUID: b2hWVh/CQDWTEZUtnqQFeA==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="14017205"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="14017205"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 03:27:38 -0700
X-CSE-ConnectionGUID: rsOKqC1QT3+FO0PRqs5TDw==
X-CSE-MsgGUID: 7quXLN8ATrm7UcgR4JiezA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="37430029"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa008.jf.intel.com with ESMTP; 03 Jun 2024 03:27:35 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	Jason Montleon <jmontleo@redhat.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 0/4] ASoC: topology: Fix route memory corruption
Date: Mon,  3 Jun 2024 12:28:14 +0200
Message-Id: <20240603102818.36165-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Originally reported here:
https://github.com/thesofproject/avs-topology-xml/issues/22#issuecomment-2127892605
There is various level of failure there, first of all when topology
loads routes, it points directly into FW file, but it may be freed after
topology load. After fixing the above, when avs driver parses topology
it should allocate its own memory, as target strings can be shorter than
needed. Also clean up soc_tplg_dapm_graph_elems_load() a bit.

Amadeusz Sławiński (4):
  ASoC: topology: Fix references to freed memory
  ASoC: Intel: avs: Fix route override
  ASoC: topology: Do not assign fields that are already set
  ASoC: topology: Clean up route loading

 sound/soc/intel/avs/topology.c | 19 ++++++++++++----
 sound/soc/soc-topology.c       | 41 ++++++++++++++++++----------------
 2 files changed, 37 insertions(+), 23 deletions(-)

-- 
2.34.1

