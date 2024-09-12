Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4983F19F11E
	for <linux-sound@vger.kernel.org>; Thu, 12 Sep 2024 12:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726142599; cv=none; b=jMqD1JOp8E+Z6UDCASCliobulHI+ZC107ExdEGmsPzS/wZUW/w2M6Xhb0i41knZpjlV7CO1QRe8IBFomYgIr5hRk84sjcfoUA70RSIUzCemCDeyA1NtSnVBctf9AsnBU43g3uyEHLp8t+tnNNzhImSDoTQwfbqXELxXcX5Tz0VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726142599; c=relaxed/simple;
	bh=F9LBJydjOnium7AlSIfBXPwm88n3IegLEpoiNX+Rwyg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OCiTtXmqt2LJleedWrfU/TyFl2mxkrlOxa0LgomqumTCuEeutU6VHIYlmK2PHHxVMbxILnE553Say/bSb/zVMEeECbmYB7PhIHFnBlQCHwwkClOxta0j1iirNI4DX8MaCvpWY9cA6bl6GnJ0xIYjaBNWhHl1VPcS+O6/Uz9KEN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m3KvkKdC; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m3KvkKdC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726142599; x=1757678599;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=F9LBJydjOnium7AlSIfBXPwm88n3IegLEpoiNX+Rwyg=;
  b=m3KvkKdC1ks/qgSluAgiKMERc2vCynW3JWnFyyhMqIARty71TwVeLFY4
   TxakMXrFzto0gvgo0Es05tk7cqDYJI3FpFKoPScc5WwMhSxexKMZqF7VA
   L5EM0ULO2jrEhEyMho0mJ+7zV7kl5b/b4rnf/R/h/vObsmAWZbhrp5p63
   x09BYk0AXacFiE7uOHGEAPpPAn3x/ajvwgFP9sH9gq8uo2WoVzjMy7pNr
   UmSP8USBhuxz7uW1G6+U8n2E6oxMzQPjZ9H5WhGFS2A1yKKQfuiILywAr
   xijABolH/r2cGxf2pfoA+q7TgbtbR3sN4V7nITcU7+/XXWCeE6akVsysr
   g==;
X-CSE-ConnectionGUID: rvsQkO0fToierP/6GJlZ6A==
X-CSE-MsgGUID: zA1RNz9WScWMFqbTaAURYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24812756"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; 
   d="scan'208";a="24812756"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 05:03:18 -0700
X-CSE-ConnectionGUID: qkRqt8tIS0WAKfiI5IJUBA==
X-CSE-MsgGUID: VoTdGkZASPu84vBvr06/Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; 
   d="scan'208";a="68459143"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.119.14])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 05:03:16 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 0/7] ASoC: Intel: boards: updates for 6.12 - part 2
Date: Thu, 12 Sep 2024 20:03:01 +0800
Message-ID: <20240912120308.134762-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Cleanup from Brent Lu and add HDMI-In capture supports from Balamurugan C.

Balamurugan C (2):
  ASoC: Intel: sof_rt5682: Add HDMI-In capture with rt5682 support for
    ARL.
  ASoC: Intel: ARL: Add entry for HDMI-In capture support to non-I2S
    codec boards.

Brent Lu (5):
  ASoC: Intel: board_helpers: support HDA link initialization
  ASoC: Intel: skl_hda_dsp_generic: use common module for DAI links
  ASoC: Intel: ehl_rt5660: do not check common_hdmi_codec_drv
  ASoC: Intel: sof_pcm512x: do not check common_hdmi_codec_drv
  ASoC: SOF: Intel: hda: remove common_hdmi_codec_drv

 include/sound/soc-acpi.h                      |   2 -
 sound/soc/intel/boards/Kconfig                |   1 +
 sound/soc/intel/boards/Makefile               |   2 +-
 sound/soc/intel/boards/ehl_rt5660.c           |   3 +-
 sound/soc/intel/boards/skl_hda_dsp_common.c   | 156 -----------
 sound/soc/intel/boards/skl_hda_dsp_common.h   |  38 ---
 sound/soc/intel/boards/skl_hda_dsp_generic.c  | 252 +++++-------------
 sound/soc/intel/boards/sof_board_helpers.c    | 152 +++++++++++
 sound/soc/intel/boards/sof_board_helpers.h    |   3 +
 sound/soc/intel/boards/sof_pcm512x.c          |   3 +-
 sound/soc/intel/boards/sof_rt5682.c           |   7 +
 sound/soc/intel/boards/sof_ssp_amp.c          |   6 +
 .../intel/common/soc-acpi-intel-arl-match.c   |  19 ++
 sound/soc/sof/intel/hda.c                     |   1 -
 14 files changed, 259 insertions(+), 386 deletions(-)
 delete mode 100644 sound/soc/intel/boards/skl_hda_dsp_common.c
 delete mode 100644 sound/soc/intel/boards/skl_hda_dsp_common.h

-- 
2.43.0

