Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE773DB645
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 09:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168716; cv=none; b=oJNZCQAQgCEhNZYAv4jJk8E5zDDiEnbe/GofYWApxzGugC+ehvraKzmOajpUrZSbr2DHs9okr94UYINpbz4khnya4OUTLrcJr9AJbgqQi/HE6yc0xU38BIlsr2GLGqsPZJiazJ+yGxgBAY++ZW/kgYFkEga0ae9t0qJGGDzamzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168716; c=relaxed/simple;
	bh=TRXm44305dLIrviR5QHDRsAEujGwJaHFG/wEju/Mcss=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=jVDL1pZR+ors2yOIS91+ZYpquZ/CgyhETC2PMGr4VoRyJKIp1JQjLXt67fdQ3IkMxqMsPayhupwZXESy4q9QyE30DIR0z6oDIwwCGKIXyAX9TYJSQZLBovTECe1BIKpJgCZupdTvkqbhsINZ9abSh13yJBlKb/OO4fMlv1pG7Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EcDsiSZx; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EcDsiSZx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788168715; x=1819704715;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TRXm44305dLIrviR5QHDRsAEujGwJaHFG/wEju/Mcss=;
  b=EcDsiSZxzFB2aocRTqFjjWKHoZQPfpXi9x57Zxfeiw7iloZPYZySDYVq
   wBtltz2T4XD3ND2qLQBXnCVGoknh+/uvHfmRfQVtU7H/K6YSA+ucBFCQG
   9/+B8gO6Jpn6YibEWqnInaY6XHuXv9Pm2oJ0CitQeQg38bI+IZDdpuulU
   F0ASgZAyQyfHpmNhcgKH3JMA7Qh8C3p/fOAuLBiL3lHGFtjxEWHOV6JUt
   jNHksXpAqNqE83jaEJbPuOcjZWbDhIYsSivrLRZSnAYDxFAhuBRBbqrNt
   BtGYGbCY/usg7CP1/BbJIuCNJLNW1uxIjXA7GHdyzcD78x5mLfIcoCoOX
   w==;
X-CSE-ConnectionGUID: Vc+oMBw/S4+zBEEzK4tqPg==
X-CSE-MsgGUID: iF9LFhR6RfGbw4qq/rx6+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88332698"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88332698"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:31:54 -0700
X-CSE-ConnectionGUID: 9iICT3SpTjWb/LCcyFs0Ew==
X-CSE-MsgGUID: LzrpzBKfRg6RLrjOuebR/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="265507829"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa007.fm.intel.com with ESMTP; 31 Aug 2026 02:31:52 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 00/11] ALSA/ASoC: Intel: avs: HDAudio bus and general fixes
Date: Mon, 31 Aug 2026 11:36:04 +0200
Message-Id: <20260831093615.1117987-1-cezary.rojewski@intel.com>
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


Changes in v2:
- added patch "ALSA: hda: Clean up pages when stream buffers allocation
  fails" to address Mark's review for "ASoC: Intel: avs: Clean up the
  bus when its initialization fails" and clean up pages before
  collapsing the bus initialization
- removed unused 'acomp' variable as pointed out by Mark


Cezary Rojewski (11):
  ALSA: hda: Clean up pages when stream buffers allocation fails
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

 sound/hda/core/controller.c          | 16 ++++++--
 sound/hda/core/ext/controller.c      | 11 +++++-
 sound/hda/core/ext/stream.c          | 11 +++++-
 sound/soc/intel/avs/boards/hdaudio.c | 17 ++++++++
 sound/soc/intel/avs/core.c           | 59 +++++++++++++++++++---------
 sound/soc/intel/avs/debugfs.c        | 12 ++++--
 sound/soc/intel/avs/ipc.c            |  6 +--
 sound/soc/intel/avs/path.c           | 11 ++----
 sound/soc/intel/avs/pcm.c            | 34 +++++++++-------
 sound/soc/intel/avs/topology.c       | 49 +++++++++++++----------
 sound/soc/intel/avs/topology.h       |  5 ++-
 11 files changed, 156 insertions(+), 75 deletions(-)

-- 
2.34.1

