Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3150E339396
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 13:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787836281; cv=none; b=JJveryF25Z/BSt265SlyZqV+ymQ4q+OO8IF9gttzPt6tTmxWb0DhAgjWJtC+8RBLPC+nd3DM6i0krVGI09g6xnWD8hLUsy2EA8rCuCorXt9ipkhh4GI0jNZ1ywyumB/aHO/UwI33td9tfxyWBewxnr0hDRbbVWnhsfvdRwTCLsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787836281; c=relaxed/simple;
	bh=nr7osP1DXIpl5AWPoJ1wPnBT5YmUBciQfdG2k9wHVK8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=HB2utnJc3D+AUyt/ydgYGSuBKunJpLgz8opO5FoZd6HatXeHviQV1DFKf8XpUiWxPqWDyDbIBzSJCLK2EVEO8ruHQuoEpOtwjvpKWA+CIbPPOSGJhRyQ+nlArOhSUHva3d8rhh9tYfe4L+eIS9RV9sAUrQIQIWLQNq7BxSAjIAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=haoiFtJC; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="haoiFtJC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787836271; x=1819372271;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nr7osP1DXIpl5AWPoJ1wPnBT5YmUBciQfdG2k9wHVK8=;
  b=haoiFtJCEyAv3KMgt8tWhb7GF67Tirdp7wj2h5I6Ife9/oUP1besEM8g
   wDpQsNTq7bYjpRiKsVfbeN3bl8ymm5ojJgbFHtFGLlJFycwX5roq61ZiY
   m7OEoDmG58mvMOoqduRwIg2Dr5iJOhKh0zNZpuNXl02QSaiEgX5XJbwMm
   0V+iLEu4lnSa64CBX6i22RZ8LZoSzf7X4J5bqS964UZp1Mm9jiP8ottuu
   z/EBhHYUqShS/RNMou9HPvbRzdQ3YSzsLdjy6xRq1YUvpuPkVrFR1w6Gw
   3bQBwUeYZBDQnDYeqfoLrG5fdFDEabLLkvOoU1H4nB6lorVsrk/FjfaIj
   A==;
X-CSE-ConnectionGUID: khNw4vbQQ72cD+5mmIGwKA==
X-CSE-MsgGUID: n/5bkUtkSB2YVni/C0Rr0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88539034"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88539034"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 06:10:54 -0700
X-CSE-ConnectionGUID: r//Jq5i2TMyi5v20u4RKtQ==
X-CSE-MsgGUID: MFsWeWAjR5inBxVHeDYUnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="263589324"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa006.fm.intel.com with ESMTP; 27 Aug 2026 06:10:47 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 00/10] ALSA/ASoC: Intel: avs: HDAudio bus and general fixes
Date: Thu, 27 Aug 2026 15:15:00 +0200
Message-Id: <20260827131510.1014084-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The first half of the patchset concentrates on the driver initialization
procedure - a number of steps do not clean up after themselves when they
fail.  This is for both, HDAudio bus (ext) and the DSP part (avs) and
targets following procedures:

- stream initialization
- link initialization
- bus initialization

The next five are loosely related fixes.  First, split topology-loading
error handling from request-firmware one.  Currently -ENOENT coming from
topology-loading, which is a real error, is ignored.

Second, with deeper test coverage around corrupted firmware/DSP exception
handling, new issues are unearthed.  Switch to async d0ix_work
cancellation to avoid deadlock when D0IX has been scheduled just before
the recovery work.

The 09/10 patch, init_config change fixes possible out-of-bounds bug.
The fix is larger than what one could expect as instead of patching with
if-statements I've decided to refactor the parsing of init_configs.
The scenario that causes the problem no longer exists.
Note: the solution does not impose any changes on the existing topology
files (userspace).

The remaining two, IMHO are self-explanatory.

Cezary Rojewski (10):
  ALSA: hda: ext: Clean up links if their initialization fails
  ALSA: hda: ext: Clean up streams if their initialization fails
  ASoC: Intel: avs: Clean up the bus when its initialization fails
  ASoC: Intel: avs: Clean up the bus when fetching ML caps fails
  ASoC: Intel: avs: Clean up streams if their initialization fails
  ASoC: Intel: avs: Do not ignore -ENOENT when loading a topology
  ASoC: Intel: avs: Cancel d0ix_work asynchrounously during recovery
  ASoC: Intel: avs: Fix unbalanced module reference count
  ASoC: Intel: avs: Refactor and fix init_config access
  ASoC: Intel: avs: hda: Constrain MSBs on startup

 sound/hda/core/ext/controller.c      | 11 +++++-
 sound/hda/core/ext/stream.c          | 11 +++++-
 sound/soc/intel/avs/boards/hdaudio.c | 17 ++++++++
 sound/soc/intel/avs/core.c           | 59 +++++++++++++++++++---------
 sound/soc/intel/avs/debugfs.c        | 12 ++++--
 sound/soc/intel/avs/ipc.c            |  6 +--
 sound/soc/intel/avs/path.c           | 10 ++---
 sound/soc/intel/avs/pcm.c            | 34 +++++++++-------
 sound/soc/intel/avs/topology.c       | 49 +++++++++++++----------
 sound/soc/intel/avs/topology.h       |  5 ++-
 10 files changed, 144 insertions(+), 70 deletions(-)

-- 
2.34.1

