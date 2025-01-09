Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15A9216E05
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 12:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736424493; cv=none; b=t/F33kVzOnY9a5ElrIyggT3puFaAL00etdoHC2rubbUOH8+h6OVXcrtkDr2cFbpQiErq8E/VcG7XyLvG+QcaplTybRmpLRpkM5UBcRHx5fDQMThxGOG0YZjoeFSxNGveM3Jc1hMYSLzGxqh8ZunemDF6jJkY9/fzMMkpGW/vU14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736424493; c=relaxed/simple;
	bh=BIagsDV+ok14hoLYPeahFrh3/F1MQyP36lKcUds186A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=OGsuUXaa/ZGrjWdVHq64QRGgy9YqwlYLjZ7QABQM4IwMnz/Rs1Sxvoqo/8Fd+hRhVOEyYIElrXKzOES6bwHTwRSNvFRIFA4IFa3/i+Aiqq8Eahxp7eyo4XPkb6psjA0GSND+ITVjBXfUWgV/gK7tWMzRoWkZW8ApvCmEba1yxjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MyK6Eeg+; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MyK6Eeg+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736424492; x=1767960492;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BIagsDV+ok14hoLYPeahFrh3/F1MQyP36lKcUds186A=;
  b=MyK6Eeg+UxV0PQ4XormszmB15SNc74BNKwDLoKEnL2LaaFobzqbeZtPr
   DCgf58RnCG3dFshc0yHLkghLYBKQf8g4eT6t0DkKjbXj5BUawbCRf7yVY
   DXKYGJ1xr/Qpuw8ahvyZQkkbgF50qh991Wx8U48C0jmeKc7R+wDQZiSnd
   XK59eCE+F8uOjJPWW0Ko8f6piozr9EErizPV91ZInrkazPX/0rwUGuhbS
   ZwEES9TBrYIU9FrexY68Z5e0bNSt/GXOeMn4+7eqqy/6AGt0qjjgPdJoB
   rTG8H9G+9RZEuW4JigzubTaVxoCK1efKkxKM04AcqSEMPrzS9GJ/njk/R
   g==;
X-CSE-ConnectionGUID: 2ViLHlMyQAeusuwpmpuQtA==
X-CSE-MsgGUID: fXeKtQxYRVOAvtR2D8/G0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="47179547"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="47179547"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 04:08:11 -0800
X-CSE-ConnectionGUID: 4BfE9mUKQKuWlK/kS3cdwg==
X-CSE-MsgGUID: 8GMa0BTlSV+98xTfsv6nGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140710254"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa001.jf.intel.com with ESMTP; 09 Jan 2025 04:08:08 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 00/13] ASoC: Intel: avs: Fixes and cleanups
Date: Thu,  9 Jan 2025 13:22:03 +0100
Message-Id: <20250109122216.3667847-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A set of loosely connected changes, fixing few outstanding issues as
well as improving readability of the existing code.

The fixes lead the series, first five patches. The goal is to make sure
proper read() is used when accessing the registers, probe() and remove()
sequences for HDAudio streaming are synced, minimal AudioDSP firmware
version points to correct values and recent additions to the topology
are parsed properly.

The only patch that points to 'new functionality' is:
  ASoC: Intel: avs: Update ASRC definition

as with the struct definition updates, one can utilize the ASRC module
in both streaming directions now (previously limited to Capture).
Everything else either improves the logging or provides comments vital
for long-term maintenance of the code.

Amadeusz Sławiński (4):
  ASoC: Intel: avs: Fix init-config parsing
  ASoC: Intel: avs: Print IPC error messages in lower layer
  ASoC: Intel: avs: Add MODULE_FIRMWARE to inform about FW
  ASoC: Intel: avs: Update ASRC definition

Cezary Rojewski (9):
  ASoC: Intel: avs: Do not readq() u32 registers
  ASoC: Intel: avs: Fix the minimum firmware version numbers
  ASoC: Intel: avs: Fix theoretical infinite loop
  ASoC: Intel: avs: Update hda component teardown sequences
  ASoC: Intel: avs: Clearly state assumptions of hw_params()
  ASoC: Intel: avs: Improve logging of firmware loading
  ASoC: Intel: avs: Adjust DSP status register names
  ASoC: Intel: avs: Adjust IPC traces
  ASoC: Intel: avs: Add missing includes

 sound/soc/intel/avs/apl.c       |  2 +-
 sound/soc/intel/avs/core.c      | 24 +++++++++++++++------
 sound/soc/intel/avs/debugfs.c   |  1 +
 sound/soc/intel/avs/ipc.c       | 25 +++++++++++++---------
 sound/soc/intel/avs/loader.c    | 36 ++++++++++++++++---------------
 sound/soc/intel/avs/messages.c  | 22 +++++++++++++------
 sound/soc/intel/avs/messages.h  |  3 +--
 sound/soc/intel/avs/pcm.c       |  5 ++++-
 sound/soc/intel/avs/registers.h |  2 +-
 sound/soc/intel/avs/topology.c  |  4 ++--
 sound/soc/intel/avs/trace.h     | 38 +++++++++++++++++----------------
 11 files changed, 97 insertions(+), 65 deletions(-)

-- 
2.25.1

