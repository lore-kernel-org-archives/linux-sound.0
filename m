Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2A923098C
	for <linux-sound@vger.kernel.org>; Tue, 12 Nov 2024 11:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731411556; cv=none; b=EZ8iLESGY7JU2P7iYuCudebYjobG6d6oleiD0D68Qn/bXhioH67g5C+90UC2ALpjaW+Db0EjeNHH6ki9YXTdnPCAskhgLG9TbrZmwM/eXP6i7rfXNX7Cv06NWhOE2ebdzJyBiQW1swOuR5YPwlvEebiWs244NE95jaFWSV2CiCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731411556; c=relaxed/simple;
	bh=6xQY6EYQibPLlAnboW3mIt9JtMqPRMXBlO1w/wBuum8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=aaKNbaGql5fNM/r3eJw+qJUwwl1hz9KNC0tWubhhMoZJ5n8ReZbLXNjyuatLaE3bZGpSirE9vSuwfZZGmlQ7e6M3WJ0JxJmCG8IdidlMRuBOtpfs7gNob2GLmzYo1An9gI8VJlMxGG85yXBhB8Fe3HocwkE/CzoxvE2vxi00Qek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X06K5dgH; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X06K5dgH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731411555; x=1762947555;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6xQY6EYQibPLlAnboW3mIt9JtMqPRMXBlO1w/wBuum8=;
  b=X06K5dgH6gqhhVlKosIi9JmuUz3DGJTKuGT97i2oDxnxKA/+kKfbZuv4
   Ux/lp2Tck//7QACCWDu6yBchiFKtR5R2xFxZcTvzoZQEtM7c0M9V6hj4L
   eM9nevNAq+Vfd3FMmdYJH+TMlN/VNyBi1JQDK6bXNilhfVfgIw89Yf6Go
   hiJ2CW8R5Pny+iwulf+hUe4gZS6yp4HBJDaW2du4Ck+iDcecPDCoRtv4Y
   H7eoH1wn2CX0BasatFaxlh96A3nYwPosGNNz6qCfdv4rsfNsd9NLJCP2p
   zg6t9lnGm06PoYiisIezqWqU1URtY9AKZ2jYQVcx82ZkROUoGDKWqlQbH
   Q==;
X-CSE-ConnectionGUID: 0S1BFAZET/uZ8mjubCnBEg==
X-CSE-MsgGUID: QLntH5pbRAqi1vI9oQkrdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41802872"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41802872"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 03:39:15 -0800
X-CSE-ConnectionGUID: XNtKesa8R+uRAK09+1kxjw==
X-CSE-MsgGUID: 9L/uJVsCQvCjMeruEEHNzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="118358213"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmviesa001.fm.intel.com with ESMTP; 12 Nov 2024 03:39:13 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [RFC PATCH v2 0/4] Add support for detection
Date: Tue, 12 Nov 2024 12:40:02 +0100
Message-Id: <20241112114006.2812697-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

continuing discussion from [1] I've redone detection code to use
snd_pcm_prepare() to configure FW. However I have some concerns and
would like to clear up if we should keep working on this solution or
perhaps after all this is not the best way to do this?

My main concern is that if we decide to go this way we should really
implement something more advanced than what is currently done in patch 4.

FW pipelines need to follow specific state transition order:
CREATE -> RESET -> PAUSE -> RUNNING -> PAUSE -> RESET -> DELETE
so if we put pipeline into running state in prepare callback, and we
want to call prepare again (which as far as I know is allowed by ALSA
API), we need to pause pipeline first before resetting, pausing and
running it again to enable detection.

Additionally our FW uses pipelines and we group them on kernel side
under "paths" - assigned to FE and BE widgets. In reality we want to
have part of path (some pipelines) active, so we shouldn't represent
whole state of underlying pipelines by only setting path state.

Patch 1 is cleanup, which I will send separately when I have
confirmation from validation team that it doesn't break anything.
Patch 2-4 add support for starting detection using snd_pcm_prepare().

[1] https://lore.kernel.org/linux-sound/0c620aa7-ddad-42ae-b82f-91c4aaf80c83@linux.intel.com/T/#t

Amadeusz Sławiński (4):
  ASoC: Intel: avs: Simplify pipeline management
  ASoC: Intel: avs: Separate path state from pipeline state
  ASoC: Intel: avs: Run detecting paths during prepare
  ASoC: Intel: avs: Pause detecting pipeline before reset

 sound/soc/intel/avs/path.c     | 29 +++++++++++------
 sound/soc/intel/avs/path.h     |  9 ++++++
 sound/soc/intel/avs/pcm.c      | 57 ++++++++++++++++------------------
 sound/soc/intel/avs/topology.h |  1 +
 4 files changed, 55 insertions(+), 41 deletions(-)

-- 
2.34.1

