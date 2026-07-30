Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F1F3AFB0B
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 12:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785415868; cv=none; b=jiri/bii33pJGVbAGxfNnymJvExso26HaQ4F/J/0MZKGCp+0eyoThqkxH4v06XW4ZZASUwYURmPkmlX6e5eRm+y0n3dxOSmta/0y38F6CiDDjSRRpOVxL6Yc94WPrVt1s27WEs2BFWIhvZWg0ioAZUvk179I7p2VZn8TAq8ajsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785415868; c=relaxed/simple;
	bh=+CznYHuYlpsACqzymZnUgA5sqcpbrlcDGxhAuJ9F1QA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uo8tXqI5VaeBjzSNCQtD1YUfevAZWutSRI/R+IuQTDy+fV/R/khim4bcJ1UWCFGl7bDmzY89J3TVb4DV9tLcMrqLaS/tLU+SsS5LpxYvLtG/V+q2jTu7NyMx2O12lLWrOPYEjEfeYhY4n6SSPJ360KYBTPkPhMBAQEH79c8m0So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MqOcKlLy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MqOcKlLy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785415862; x=1816951862;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+CznYHuYlpsACqzymZnUgA5sqcpbrlcDGxhAuJ9F1QA=;
  b=MqOcKlLyM7SjVBPu0sZ95kxqr58jmJJ5PpY9YUFojkAfFUBx2QIsksen
   uWDXHAS29DVjSWTpWQtwCf9uj9R1oONmBBPgTq0dkhPycT9y3rxOimbMO
   vJD1AqJ/qUddGfHaYkG/auHsWOyk7fC72usANBhWOpsMf8B1zuU3q+IK+
   CrjrD5wn4NACxR6+dWKEwMl598H+6ZZqHqsBRH5NtdZKvtIhZEL5BnVDY
   zIcKRVri3JP7v62OKKHND8xEiBvLqtbsLEdNr8/0CpWXtDmGFclqIGB57
   BvlcH2Hb12rQjhfLEQKuBEJuIqYY5tE6l97kmkp9FrHw+ltCsGjm/m9yU
   A==;
X-CSE-ConnectionGUID: 2W1ajVlETBGSiANMPIrLYA==
X-CSE-MsgGUID: ZafRWKEzSgSC1e6fbUiHXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103439259"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="103439259"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 05:50:56 -0700
X-CSE-ConnectionGUID: YfMImIaIQDi4eUxN+IDllw==
X-CSE-MsgGUID: sdyJ66P4SRCR7bNeXDbing==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="283638666"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.79])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 05:50:53 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH 0/4] ASoC: SOF: Intel: Handle ACE2+ link DMA allocation restrictions
Date: Thu, 30 Jul 2026 15:51:26 +0300
Message-ID: <20260730125130.29887-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

We have seen cases when the delay reporting unexpectedly behaves incorrectly,
counters are not counting in hardware registers under seemingly random
conditions.
It turned out that there are few cases that the driver must handle in order
to make sure that LLP, PPLC counters are working correctly: 

- non-alt links must not be reset during probe
- Concurrent (cross-direction) hazard: when SoundWire shares a physical
  link DMA stream index with HDaudio, iDisp or UAOL across the two
  directions, the LLP and timestamp values for the affected stream are
  wrong. SSP and DMIC are not affected because every DMA request from
  those links carries one sample block.

- Sequential (playback only) hazard: once a HDaudio or iDisp link has
  used a playback stream index, that index cannot drive any non
  HDA/iDisp link in the same direction until the next controller
  reset (CRST#).

For users the impact was not visible as the link counter issue only affected
the delay reporting which already have defensive path to filter out
incorrect delays and the DSP caused delay for normal PCMs are negligible to
cause A/V sync issues for example.

Regards,
Peter
--
Peter Ujfalusi (4):
  ASoC: SOF: Intel: hda: Fold mlink enumeration into
    hda_dsp_ctrl_init_chip()
  ASoC: SOF: Intel: hda: Keep non-alt mlinks powered at probe on ACE2+
  ASoC: SOF: Intel: hda: Remove unused hda_bus_ml_put_all()
  ASoC: SOF: Intel: hda: Avoid ACE2+ link DMA stream allocation hazards

 include/sound/hda-mlink.h         | 23 +++++++++-
 sound/soc/sof/intel/hda-ctrl.c    | 19 ++++++++
 sound/soc/sof/intel/hda-dai-ops.c | 76 ++++++++++++++++++++++++++++---
 sound/soc/sof/intel/hda-dai.c     |  2 +-
 sound/soc/sof/intel/hda-mlink.c   | 35 ++++++++------
 sound/soc/sof/intel/hda.c         |  4 --
 sound/soc/sof/intel/hda.h         | 26 ++++++++++-
 7 files changed, 158 insertions(+), 27 deletions(-)

-- 
2.55.0

