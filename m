Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D99946C
	for <linux-sound@vger.kernel.org>; Thu,  6 Mar 2025 13:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741268096; cv=none; b=ky+aOjLJIitmEm30uDRJQWBHkR9z8+El8tV5lhSBlWrDUtkmBYLeC9oQY71wc5cTjCTyd4FfrxXnxLfvvPlGRn8Tqh58SM1J/7mfan5YSqhp3EzHZMP8oDotX8Lq18Sf5ivQA5oVrPdlDT0Hw01iuXKNSCId6HI5OnSIHjYA6eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741268096; c=relaxed/simple;
	bh=7ZKc9vlhQsvBxDPiadvRiyYGpBxGyRFL0PvseSHHpNA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SpBG44AkF0HrPiZbPciGmbcYOYQLS18nGvzcw9sWSd6vyBUBAC3iEslSpFzDegjDQpFHDoQMwMa+9m7X8uN1orUUrZrdYKCzq7VQoaxprhMLNVityUz5lmPnVG3u+zObBvgppDJ8sKGyFxyC3+vQzIoF0G90jg2vBf8tVNSUqOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UFayBAa2; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UFayBAa2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741268095; x=1772804095;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7ZKc9vlhQsvBxDPiadvRiyYGpBxGyRFL0PvseSHHpNA=;
  b=UFayBAa2k5hoG8ONV54+oyHZjf/QXBC+engVFa8La9fzNCUYs5+MBzyX
   ljKo1kGIb3vfPSfk1AlbpD2CSisCT5YFvtqmHfMKc59wl96EAJ1WsZlg6
   LI6WeHTs7WAGm0bBbm73mVKyw70kor77Y7LZH1JwvrRORCLmG+CQVvjQ0
   wxK9YrmNpnUrKsXFrwnGDor3NRyAxGvV+msXUjExLUHKnvloEvJs1HJyq
   3XqFIL0UkfE/wnnZ+XTwvOceC7KsIZ/+Fp2eWDGxCeyQRmHbJj/FbddUs
   Zff0ckxmsTqKHDbK4O+rK7vwzbilzLZLcT/OXiuuc3mvVQewRkO3lhJ4t
   A==;
X-CSE-ConnectionGUID: /a8C7Z02TiaxoT1GVpOsxg==
X-CSE-MsgGUID: Fj+vw5aPSjGwwMaiuPhiwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42164663"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="42164663"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 05:34:54 -0800
X-CSE-ConnectionGUID: IRVVMsMuQbiv/R0tc6YvPQ==
X-CSE-MsgGUID: aDM+4BHlSWe+VaeLHDihfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119538952"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.249.86])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 05:34:51 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH 0/8] ASoC: SOF: Intel: Add support for ACE3+ mic privacy
Date: Thu,  6 Mar 2025 15:35:19 +0200
Message-ID: <20250306133527.16722-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

ACE3 (Panther Lake) introduced support for microphone privacy feature which
can - in hardware - mute incoming audio data based on a state of a physical
switch.
The change in the privacy state is delivered through interface IP blocks
and can only be handled by the link owner.
In Intel platforms Soundwire is for example host owned, so the interrupt
can only be handled by the host.

Since the input stream is going to be muted by hardware, the host needs to
send a message to firmware about the change in privacy so it can execute a
fade out/in to enhance user experience.

The support for microphone privacy can be queried from the HW_CONFIG data
under the INTEL_MIC_PRIVACY_CAP tuple. This is Intel specific data, the
core will pass it to platform code if the intel_configure_mic_privacy()
callback is provided.

Platform code can call sof_ipc4_mic_privacy_state_change() to send the IPC
message to the firmware on state change.


Regards,
Peter
----
Peter Ujfalusi (8):
  ASoC: SOF: Intel: mtl: Split up dsp_ops setup code
  ASoC: SOF: Intel: lnl/ptl: Only set dsp_ops which differs from MTL
  ASoC: SOF: Intel: mtl: Stop exporting dsp_ops callback functions
  ASoC: SOF: Intel: Create ptl.c as placeholder for Panther Lake
    features
  ASoC: SOF: ipc4: Add support for Intel HW managed mic privacy
    messaging
  ASoC: SOF: Intel: hda-mlink: Add support for mic privacy in VS SHIM
    registers
  ASoC: SOF: hda/shim: Add callbacks to handle mic privacy change for
    sdw
  ASoC: SOF: Intel: ptl: Add support for mic privacy

 include/sound/hda-mlink.h       |  25 +++++++
 include/sound/sof/ipc4/header.h |  13 ++++
 sound/soc/sof/intel/Makefile    |   2 +-
 sound/soc/sof/intel/hda-mlink.c | 127 ++++++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.c       |  34 +++++++++
 sound/soc/sof/intel/hda.h       |   4 -
 sound/soc/sof/intel/lnl.c       | 117 ++++++-----------------------
 sound/soc/sof/intel/lnl.h       |   6 ++
 sound/soc/sof/intel/mtl.c       |  74 ++++++++-----------
 sound/soc/sof/intel/mtl.h       |  15 +---
 sound/soc/sof/intel/pci-lnl.c   |  12 ++-
 sound/soc/sof/intel/pci-mtl.c   |   8 ++
 sound/soc/sof/intel/pci-ptl.c   |  17 +++--
 sound/soc/sof/intel/ptl.c       | 106 ++++++++++++++++++++++++++
 sound/soc/sof/intel/ptl.h       |  19 +++++
 sound/soc/sof/intel/shim.h      |   2 +
 sound/soc/sof/ipc4-loader.c     |  33 +++++++++
 sound/soc/sof/ipc4-priv.h       |   5 ++
 sound/soc/sof/ipc4.c            |  18 +++++
 19 files changed, 470 insertions(+), 167 deletions(-)
 create mode 100644 sound/soc/sof/intel/ptl.c
 create mode 100644 sound/soc/sof/intel/ptl.h

-- 
2.48.1

