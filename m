Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475F4242D7C
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 13:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765805367; cv=none; b=fsoYw6ZzVL4SXaHpZ1FQEzD+6Zl97kVirrJ359hcYnNhzQyo7ZyPEGOAd/mR1YRVVSn+abPIXQ4Z4KmTrO+5A7u7HRkgJf1AH19NHCuGXIhSMjwZHO62lrG56LP6XMBtI7OdAof+iwTD4DVZAx7PODIxV7E5zjrbo5ZfsORdDrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765805367; c=relaxed/simple;
	bh=tq0EdmCCLePLt4EiWmJxPzQ7DW2w2vusf+OyWgznaJI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bla5qyRazPy7Nm+Gnh9Lq36XQCWkirgn6d1cx6EM0M2qdOdicaGuxKcz5B8TP8rzwG9q9E2T6EyiX70qS2r+9bOl03lhENUGhnVy9lI6iQef+n5j76TwO1chq/I6sl8fYzIXsh2FI4yU8M2D3nQrhyFI7p+kOlN2Y5kkvSfB6jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jLJ3gJ8W; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jLJ3gJ8W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765805365; x=1797341365;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tq0EdmCCLePLt4EiWmJxPzQ7DW2w2vusf+OyWgznaJI=;
  b=jLJ3gJ8WHicbzwyZht62OstT5JtWnagGzgMEN1VF/PT9GAPS+mHdVlyx
   tqk88WyBsEJAMMP0h/fDwymtCRjCsiFGmHDBh6ReN70Ss5rU5s0TK0fwp
   E3WXCqw0ej8e8s6Ciz+gFH19W88+FHPTA5afiAWaYuuGCemaYl6irLQrc
   i6mkxkkmd3Ls/NmCINSTeWMN9lD9StuztHXhSZakwZTxiWJvvt0nbgjXg
   1FDPjKSQFev36mFJDggAWXx61eM8Cb/LDLmpJSEAb6yBBl2TuNJiNFsd4
   W2eljLZhrWKPWO5gD1DbsQIQx9AMRrZ2AX2IN6h6ZKlI29+NRRqy+476K
   w==;
X-CSE-ConnectionGUID: cwPTJLlHSDe07qzLUpfpbQ==
X-CSE-MsgGUID: zXo49ko7RQeLkdm6b4ylqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="93179457"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="93179457"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 05:29:24 -0800
X-CSE-ConnectionGUID: 1VDJlMasQXqqwY8XxE3FDw==
X-CSE-MsgGUID: DVl+hZeHRYeiT79viJzbHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="228376954"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.95])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 05:29:22 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH 0/8] ASoC: SOF: Support for on-demand DSP boot
Date: Mon, 15 Dec 2025 15:29:38 +0200
Message-ID: <20251215132946.2155-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On system suspend / resume we always power up the DSP and boot the
firmware, which is not strictly needed as right after the firmware booted
up we power the DSP down again on suspend and we also power it down after
resume after some inactivity.

Similarly, on jack insert/removal we needlesly boot up the firmware to check
the jack status, which needs no DSP/firmware communication.

The on-demand DSP boot will make sure that we boot the DSP firmware up only
when it is needed - for audio activity, in other cases the firmware will be
not booted up, which saves time.

Out of caution, add a new platform descriptor flag to enable on-demand
DSP boot since this might not work without changes to platform code on
certain platforms.

With the on-demand dsp boot enabled we will not boot the DSP and firmware
up on system or rpm resume, just enable audio subsystem since audio IPs,
like HDA and SoundWire might be needed (codecs suspend/resume operation).
Only boot up the DSP during the first hw_params() call when the DSP is
really going to be needed.

In this way we can handle the audio related use cases:
normal audio use (rpm suspend/resume)
system suspend/resume without active audio
system suspend/resume with active audio
system suspend/resume without active audio, and audio start before the rpm
suspend timeout

Add module option to force the on-demand DSP boot to allow it to be
disabled or enabled without kernel change for testing.

The on-demand boot has been tested in our CI for more than half a year
and so far no issues have been seen on supported platforms since it's
introduction to our development tree (sof-dev).

Regards,
Peter
---
Peter Ujfalusi (8):
  ASoC: SOF: ipc4-loader: Remove redundant rpm resume_and_get from
    load_library
  ASoC: SOF: control: skip rpm calls in ext_volatile_get if not
    implemented
  ASoC: SOF: Add support for on-demand DSP boot
  ASoC: SOF: sof-client: Add support for on-demand DSP boot
  ASoC: SOF: Intel: hda-sdw-bpt: Add support for on-demand DSP boot
  ASoC: SOF: Intel: pci-lnl: Set on_demand_dsp_boot for LNL
  ASoC: SOF: Intel: pci-ptl: Set on_demand_dsp_boot for PTL and WCL
  ASoC: SOF: Intel: pci-nvl: Set on_demand_dsp_boot for NVL-S

 include/sound/sof.h                           |   3 +
 sound/soc/sof/compress.c                      |   8 +
 sound/soc/sof/control.c                       |  13 +-
 sound/soc/sof/core.c                          |   1 +
 sound/soc/sof/debug.c                         |   7 +-
 sound/soc/sof/intel/hda-sdw-bpt.c             |  11 ++
 sound/soc/sof/intel/pci-lnl.c                 |   1 +
 sound/soc/sof/intel/pci-nvl.c                 |   1 +
 sound/soc/sof/intel/pci-ptl.c                 |   2 +
 sound/soc/sof/ipc3-dtrace.c                   |   7 +-
 sound/soc/sof/ipc4-loader.c                   |  19 +--
 sound/soc/sof/ipc4.c                          |  13 ++
 sound/soc/sof/pcm.c                           |  10 ++
 sound/soc/sof/pm.c                            | 149 +++++++++++-------
 sound/soc/sof/sof-client-ipc-flood-test.c     |   7 +-
 .../soc/sof/sof-client-ipc-kernel-injector.c  |   4 +-
 sound/soc/sof/sof-client-ipc-msg-injector.c   |  14 +-
 sound/soc/sof/sof-client-probes.c             |  26 ++-
 sound/soc/sof/sof-client.c                    |   6 +
 sound/soc/sof/sof-client.h                    |   3 +
 sound/soc/sof/sof-priv.h                      |   3 +
 21 files changed, 215 insertions(+), 93 deletions(-)

-- 
2.52.0

