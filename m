Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65961745F7
	for <linux-sound@vger.kernel.org>; Thu,  8 Feb 2024 10:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707387814; cv=none; b=pkceFnyIYTJkwT5ZEs2IYS2UTO0xoeZ1MAuqRj/QTGtJ+Oop2PRANIflW9laJgRfmaTcoiMYWe8BbLTlGnfplAfm1NICZuJmhPYdJ9mCs5k61PX9lIBL4GGqSL5wd9JT/mEM9xtOn4seL2xKl/4RWxK2JumJKRIQFcMxgCTh5jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707387814; c=relaxed/simple;
	bh=oZ1Q6D6eujwVlJtp/IDnun4oIAVk7Apm420O/mQN+uc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=H5Lw2mQOuc37XvlPpiFHI/9Z+J9vRTq60coh24gfEuJpGPnY6sZc0NYt5/JkBhO0YSV1z0TTtO1Zu7WcqZO7NmBYfT0jK7+Sst4lEhLxtNskGNGRJDkCiujBIfKeFj+DhnChRWkxWzBnDCJO8RrrJsywyeMq2YCp4lH8G38iXRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WRvpqB4P; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WRvpqB4P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707387812; x=1738923812;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oZ1Q6D6eujwVlJtp/IDnun4oIAVk7Apm420O/mQN+uc=;
  b=WRvpqB4PFKG2FQKtz6THgmgBFkGabNAGkiAYlVReBc4+hndMlWOIW0rL
   d0Zjhgr/hi1/ujYp9yIahJX7/h6C55dTUNyIW4HGLbuxIlHJ0oMpLScVO
   BdSeTj52R0NATUFuh8Cv6bDKoIvwrqvwZ3mRpmzcftnCx9LzksomKLpFq
   bcG04C3W0yN0aIC+Hn3tpJBe0bfZ6sq8GAAn/9nDyznLeYFKJSwoXd5FC
   mSU3TJt9R0aK1xJ2uWfoDI2728V9HYnkR9cmzp9BLbomPPrWcm94ZUkuJ
   CISgNsuG5MYEXXXnrT6B+HkhS/s0K5KHBiRwgtTsRUuZcy7S698muWd+S
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="18699100"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="18699100"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 02:23:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="1913768"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmviesa006.fm.intel.com with ESMTP; 08 Feb 2024 02:23:30 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?=C5=81ukasz=20Majczak?= <lma@chromium.org>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH v2 0/3] ASoC: Intel: avs: Add support for sending initial module config
Date: Thu,  8 Feb 2024 11:23:57 +0100
Message-Id: <20240208102400.2497791-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In some cases it may be desirable to provide default initial
configuration for FW module using payload. To facilitate such solution
extend topology to contain initial config information, parse it and then
send data to FW if present.

Amadeusz Sławiński (3):
  ASoC: Intel: avs: UAPI: Add tokens for initial config feature
  ASoC: Intel: avs: Add topology parsing support for initial config
  ASoC: Intel: avs: Send initial config to module if present

 include/uapi/sound/intel/avs/tokens.h |   9 ++
 sound/soc/intel/avs/path.c            |  33 ++++++
 sound/soc/intel/avs/topology.c        | 164 +++++++++++++++++++++++++-
 sound/soc/intel/avs/topology.h        |  13 ++
 4 files changed, 217 insertions(+), 2 deletions(-)

-- 
2.34.1

