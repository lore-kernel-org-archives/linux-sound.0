Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1B63FE671
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 10:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785408070; cv=none; b=Nqn/B5S7n0kFc2DdmIDTUaHMHY4xRKtyT/PF4G/RDEbb4vlwaL0BceiZ7mlTcmqsx7yON+k1txxgsl2RlKAccuIeQty6ozT6Vtx0ScF8LocDZWGxMOb4zkb9BVtoC4k6FqZGGX5WtbmduMfyrxOz+s4rGlNkM3bjAuogurq/F/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785408070; c=relaxed/simple;
	bh=065TFaH8U9Zb3B6xrkG1maywlz5xBYmS3hWsQ9agcR0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UV80jSh5UZBAQCEbicJ+G0QSJdbLd1RKHxe8ZbjPzTFXosajpwIzA0S1z7EyfQLcawfrE88/WwGjVbQLZGWhW4vEymxUdk9u+kUQ3SRgXLGl0wLq87S2Eex8nwTqE1gm6dN6p/G8Sb9X8b/QIaKQLOxR4xAIp2/qXyM+9skp6MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jOiY4IBf; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jOiY4IBf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785408068; x=1816944068;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=065TFaH8U9Zb3B6xrkG1maywlz5xBYmS3hWsQ9agcR0=;
  b=jOiY4IBfCapWrN23uRfLdu3HMrrXZPWyetAsQqi2ChQrtZgHLrduPgHj
   YzYzo4EX7XMgCURLfyjg0G5xlvtQ9IfJV9bA4egcrPWEDhIkB6wRWMOFT
   dpl0NGPCoXA2XjSjSIxiSWaW5DetN8YTMEEysCZfjxc5ekCDhC+WGDMU6
   vtf/L9jY1zLFQbDeHP9KhQWvTTm1xWr/pSR5/1ClYLYHLmstD0Cj1HFFx
   hBTW+6f8eRqJpVP042qpeXVUohxquJquvbg7/0ETgYDnlifJFB1XKD6Pl
   bMpopEaN4OxAwS6pQXXvHw9CiHCMmExazUGpRWOB47Neo0m678l9t9HiV
   w==;
X-CSE-ConnectionGUID: pWIE3OVNTWWSTW//sSwUCQ==
X-CSE-MsgGUID: cJYHbm3GTx2kr6EDiznPcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="108817749"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="108817749"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 03:41:08 -0700
X-CSE-ConnectionGUID: urnGSIjdTKO1Vdo+kcDhrg==
X-CSE-MsgGUID: BYH+yb/WRHWhA4gMxOhhSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="262221303"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.79])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 03:41:05 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	jyri.sarha@linux.intel.com
Subject: [PATCH 0/6] ASoC: SOF: ipc4-topology: Update the memory data building
Date: Thu, 30 Jul 2026 13:41:35 +0300
Message-ID: <20260730104141.14817-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series fixes some issues left to the first version
sof_ipc4_mod_init_ext_dp_memory_data payload building code. The
payload to specify memory requirements of Data Processing components,
running as independent processes in SOF firmware.

But more importantly it adds a payload of similar purpose to the
pipeline create message, e.g. sof_ipc4_glb_pipe_payload. It sums up
the memory requirements of individual Low Latency components in the
pipeline and sends the summed up values in pipeline create message.

Regards,
Peter

Jyri Sarha (6):
  ASoC: SOF: ipc4-topology: Remove dp_ from all module memory attributes
  ASoC: SOF: ipc4-topology: Fix SOF_TKN_COMP_STACK_BYTES_REQUIREMENT id
  ASoC: SOF: ipc4: Add SOF_IPC4_GLB_CREATE_PIPELINE payload macros and
    structs
  ASoC: SOF: ipc4-topology: Add payload to pipeline create messages
  ASoC: SOF: ipc4-topology: Fix sof_ipc4_mod_init_ext_dp_memory_data
    comments
  ASoC: SOF: ipc4-topology: Refactor
    sof_ipc4_widget_mod_init_msg_payload()

 include/sound/sof/ipc4/header.h |  80 +++++++++++++-
 include/uapi/sound/sof/tokens.h |   4 +-
 sound/soc/sof/ipc4-topology.c   | 179 ++++++++++++++++++++++++++------
 sound/soc/sof/sof-audio.h       |   8 +-
 4 files changed, 229 insertions(+), 42 deletions(-)

-- 
2.55.0

