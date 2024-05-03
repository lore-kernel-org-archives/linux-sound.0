Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0383128F5
	for <linux-sound@vger.kernel.org>; Fri,  3 May 2024 13:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714744354; cv=none; b=pV89m/5npR6mDk3X02C2mPkhysxBSp60JUWP0oTixt61iIUHi1rRSYPorB/VbmhSdzrdsTT7AhRdyiGZmzrFIkrVSFVV5wyW2pAXh1uRK9I1JFm0rbHErE9riluLwt8F2zsmJfBfeIxcEcYhFGogiWi/fAAIPITN6DOlRtLHFwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714744354; c=relaxed/simple;
	bh=ba7469GmXgNCCk7oBXaSkrwJS7QxuRNqVCMVuKVzYAQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PHrWYggtLde/XVn2+bbYFulJ5qlqDiGMm64LKTFy+8/5Lz7ZW8Yglg2tcXFIj5j3vmtlgVUooJCfV/jz11jAkMBmp+GcqpvnvunzYdkBPVYIXzN3g4aIRRWWG03eakEuRs7iOE08A11+8jVIsWQ13bdKd7BPlK9d6x40UYC1lmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WOV1x/tZ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WOV1x/tZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714744353; x=1746280353;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ba7469GmXgNCCk7oBXaSkrwJS7QxuRNqVCMVuKVzYAQ=;
  b=WOV1x/tZFj4SlKYOGbBwgyF+nATq2mLHFbNfNrbm1CgE7OgAkI3b3Gxi
   bZ/Zt73zt9Zhzg3j7wzVvgXlt6+Q32RV+jLsyHhH3n4OaT2tbYsHmG/PO
   rDiWsScPQxPs7AE0qOnovpxl6V4ApgMpI77CImIMFHKx7amdIq/0iVJj+
   QKhxfCi48CEv9G5oLlJ78kiYB2pXsgntR2WdX9ynPndi0k96jZ8wrl226
   +iIDY3+/e2n6tBk5fKI70T7y2h93i5sSa4jXKnclgnMbQW+YXMHTrPgjn
   EFgJtAwi4ihSy3tAP90x3zPPCyaM9X70/MLcFwQLS/mTzhd9W5KL9NggL
   g==;
X-CSE-ConnectionGUID: NroGWgxCSNyxDDxTjPJ0bQ==
X-CSE-MsgGUID: udoqbRMPTdeZnfiUQ4iKMQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="28029404"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="28029404"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 06:52:32 -0700
X-CSE-ConnectionGUID: L6dKMq7DR/i2L1kgc/9XSQ==
X-CSE-MsgGUID: Yn9Wl0GjTFGNlQ3SnROLPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="27548701"
Received: from sjslinke-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.113.3])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 06:52:30 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/7] ASoC: SOF: Intel: remove circular dependency for SoundWire BPT
Date: Fri,  3 May 2024 08:52:14 -0500
Message-Id: <20240503135221.229202-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SoundWire BPT support will rely on the HDaudio DMA. This exposes a
circular dependency module dependency which has to be resolved by
splitting common parts used by HDaudio and SoundWire parts, and
'generic' parts used by HDaudio only.

This patchset does not change any functionality, it just moves code
around, exposes symbols that are used in the new module. The code has
been in use for more than one kernel cycle already so it really
shouldn't break any existing platforms.

The main issue with such code moves is that it makes backports or
fixes more complicated. That's the main reason why we held back these
patches until we were reasonably confident on the maturity of MTL and
LNL drivers.

Pierre-Louis Bossart (7):
  ASoC: SOF: Intel: hda-stream: export stream_get_position() helper
  ASoC: SOF: Intel: regroup all SoundWire/Intel functions in hda.c
  ASoC: SOF: Intel: start splitting top-level from common parts
  ASoC: SOF: Intel: move common code from hda.c
  ASoC: SOF: Intel: move tracepoint creation
  ASoC: SOF: Intel: remove circular dependency on
    hda_sdw_process_wakeen()
  ASoC: SOF: Intel: move hda.c to different module

 sound/soc/sof/intel/Kconfig          |  25 +-
 sound/soc/sof/intel/Makefile         |  23 +-
 sound/soc/sof/intel/apl.c            |   3 -
 sound/soc/sof/intel/cnl.c            |  15 +-
 sound/soc/sof/intel/hda-bus.c        |   2 +
 sound/soc/sof/intel/hda-common-ops.c |   1 +
 sound/soc/sof/intel/hda-ctrl.c       |  10 +
 sound/soc/sof/intel/hda-dai.c        |   6 +
 sound/soc/sof/intel/hda-dsp.c        | 502 ++++++++++++++++++++++
 sound/soc/sof/intel/hda-ipc.c        | 115 +++++
 sound/soc/sof/intel/hda-loader.c     |  45 +-
 sound/soc/sof/intel/hda-pcm.c        |   6 +
 sound/soc/sof/intel/hda-probes.c     |   2 +
 sound/soc/sof/intel/hda-stream.c     |  13 +
 sound/soc/sof/intel/hda-trace.c      |   3 +
 sound/soc/sof/intel/hda.c            | 605 +++------------------------
 sound/soc/sof/intel/hda.h            |  15 +
 sound/soc/sof/intel/icl.c            |   4 +-
 sound/soc/sof/intel/lnl.c            |   4 +-
 sound/soc/sof/intel/mtl.c            |  21 +-
 sound/soc/sof/intel/pci-apl.c        |   1 +
 sound/soc/sof/intel/pci-cnl.c        |   1 +
 sound/soc/sof/intel/pci-icl.c        |   2 +
 sound/soc/sof/intel/pci-lnl.c        |   3 +
 sound/soc/sof/intel/pci-mtl.c        |   1 +
 sound/soc/sof/intel/pci-skl.c        |   1 +
 sound/soc/sof/intel/pci-tgl.c        |   2 +
 sound/soc/sof/intel/shim.h           |   1 +
 sound/soc/sof/intel/telemetry.c      |   1 +
 sound/soc/sof/intel/tgl.c            |  10 +-
 sound/soc/sof/intel/tracepoints.c    |   5 +
 31 files changed, 811 insertions(+), 637 deletions(-)
 create mode 100644 sound/soc/sof/intel/tracepoints.c

-- 
2.40.1

