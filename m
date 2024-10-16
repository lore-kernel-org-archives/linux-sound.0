Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B631C2325
	for <linux-sound@vger.kernel.org>; Wed, 16 Oct 2024 13:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729083703; cv=none; b=EOdYDNitF+cwISUhPolHqUHZkxAwKYTzu0rgpiNGoxD+bNnlGO8pNgFiaB0CKdHizvcOb2Wb/JB+CuP7R3ki7Ao83jgwG9pQR/W8vP6cNNq6yzXsETbdQGd6FRzBvGm6MoVrMpI1TpIxWry6qpWO8ERGZDA+5S8Th2pA/M7iRuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729083703; c=relaxed/simple;
	bh=N2+a783MRltUXkLZTtZXpmMt4hAR4FD5MIK4M3iHbuw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=rK+ODVonSBuNJgHd13aIT9PhHaFT0yI1voNBns86lYe8moLroL9zzpG1+tmDeUYUBGDfCYnk9LG6aiwHPSAFgE683Mc5/YUpL0Ia1BZLdFNfftegtbJA6Wbx8+TujO894tyMU7Xa4Z+s77WeMyuJqPzSIbDrzUK6UD5djWH3c7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gaX9GwjM; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gaX9GwjM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729083702; x=1760619702;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=N2+a783MRltUXkLZTtZXpmMt4hAR4FD5MIK4M3iHbuw=;
  b=gaX9GwjMlV/upFuEjOXE/pbWObbs/A6Faf3n1JJZgHBoE2K4J1SbZmRP
   TP9dXKfyVNQDG/qHLOg5ZwFx8qAXoYYACDWTFvh6S5/i0neT6bj1cC32C
   A3Jh6xJBZO5RwVC8BrPcUd5q6CyihDkZEdICRxqVfBSMJrKJlGgjnfnaa
   OamHtUyagB91bJQP3Qpmc1uFSGiziiFvqQjJ5hWNwTDevpYBokKyVwp5D
   v3RspKVSplmLoo+a37aHYdqLLmaVq/UDHSf8LlECjIqRGP1qUGADQYLTm
   Vs4LN4KPdKBu3jsGx0sar4L9QfWY6pscDWr/B1RkJ6/cjY5EralH7BbWn
   A==;
X-CSE-ConnectionGUID: MmDObnHWRD2QmyHt98mIQQ==
X-CSE-MsgGUID: U1kpQaBJQ5Skt90OgHSltQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="32450292"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="32450292"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 06:01:41 -0700
X-CSE-ConnectionGUID: BHoLuhtPSN+rSwwa6UiZtw==
X-CSE-MsgGUID: PmfNo5dfQYKfl6IrfyeV7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="78566069"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by fmviesa010.fm.intel.com with ESMTP; 16 Oct 2024 06:01:39 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [RFC PATCH 0/4] Add support for detection
Date: Wed, 16 Oct 2024 15:02:24 +0200
Message-Id: <20241016130228.1013227-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are some scenarios when using DSP where one may want to have
partially active stream and fully enable it after some event occurs.

Following patchset adds new "detect" state to ALSA state machine to
allow waiting for condition to occur before fully starting a stream. In
further patches the state is propagated through ASoC components to allow
them to handling the state as necessary.

Main goal of this patchset is to allow handling scenarios like keyphrase
detection - where DSP analyses incoming signal and wakes userspace to
consume stream only when keyphrase is detected.

I'm sending this as RFC so we can discuss if this is the way to go or if
there is perhaps another preferred way of adding such interface.
Userspace part of implementation is available at
https://github.com/amadeuszslawinski-intel/alsa-lib/tree/rfc_detect

Amadeusz Sławiński (4):
  ALSA: core: Add support for running detect on capture stream
  ALSA: core: Allow polling for detection
  ASoC: pcm: Add support for running detect on capture stream
  ASoC: Propagate DETECT trigger

 include/sound/pcm.h         |  6 +++
 include/sound/soc-dpcm.h    |  2 +
 include/uapi/sound/asound.h |  4 +-
 sound/core/pcm_native.c     | 89 ++++++++++++++++++++++++++++++++++++-
 sound/soc/soc-component.c   |  2 +
 sound/soc/soc-dai.c         |  2 +
 sound/soc/soc-link.c        |  2 +
 sound/soc/soc-pcm.c         | 56 +++++++++++++++++++++++
 8 files changed, 160 insertions(+), 3 deletions(-)

-- 
2.34.1

