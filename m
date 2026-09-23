Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE59242B32A
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 05:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790141331; cv=none; b=RtQcfn4rpIQ2e4lBJWCnU12voHOBXV2ERqmByQ+hNjy2TIkhK2b1zeIrsGMTpmgRQ6ycqJ4sTjGv1tFXvMuxBol7SyD69HLBsERrp1yH+vAtQ39NUYV9ou92JU1/pNzO6HJART9Py6VH/OOKvsMZNbnTBuSmw8DeHMeW8NZsYEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790141331; c=relaxed/simple;
	bh=KcW2r0IMKCKDIILJN8wLk5OG02AqwJtOkUTNSjd943Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nu3poypMKSvu8zw5sS5mLthgmA8aYovsqgOT7H0yw9/rRbKChSN34/sXQQpcZHVTVU5xGlgJhr6chhZA8EQDiCl2EeR/u6Knbs6wNItODfQkVUSNAsyZYBSgtmM03AhbA3xVBvEUNjum+xA2VbL03YUppC54l5JluY892W9MIzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QI6j4h2o; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QI6j4h2o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790141329; x=1821677329;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KcW2r0IMKCKDIILJN8wLk5OG02AqwJtOkUTNSjd943Y=;
  b=QI6j4h2owrMbi8ohCzovYgfyF8rU9pBfF5nNnAlaMS84VqTHX6MM7SXK
   KDz947y6KhcVhQCfVsB2qAQ/o8vkLCy6trG6SEqrFi/eEkkeVO0Om/Dr7
   z9PygJ+VcZs7rI8rkSfP4OfJOQVaziI3SgpEE5x1bvyrRYyWA6sJm+87D
   v/355g+xarh9x93Qvbe+eR/0bG/6v6oRGXwsY1Ah/JcspDVtIxFlq/8oA
   m/2L7fp2CwGdsJ8VIw6GOLnia9kUFKo+wNG3+YVoIjKF0FWF5g7gytzWY
   xSo5xwudlJcuGeyfRtf3ppB9pewdCvU5TC2X8xlcNB4fGVm9ea1lFtGk1
   w==;
X-CSE-ConnectionGUID: 5kKuLB6qT0exLi69cexzeg==
X-CSE-MsgGUID: rxCWoTmaQxmKzb95LlZP3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90821714"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="90821714"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 22:28:48 -0700
X-CSE-ConnectionGUID: vBefMaNhTWqOmedPqjjxGg==
X-CSE-MsgGUID: wjtSDaZeQNWHZAU+7q4p+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="272938502"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 22:28:47 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH v2 0/7] ALSA/ASoC: Intel: add I2S function topology support
Date: Wed, 23 Sep 2026 13:28:25 +0800
Message-ID: <20260923052832.2392758-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, function topology is only used by the SoundWire machines.
Extend the support to the I2S machines.

The only ALSA change is to lower the log level. Let's go through the
ASoC tree.

v2: change sscanf(dai_link->name, "SSP%d", &ssp_port)  to %u as ssp_port
    is unsigned int.

Bard Liao (7):
  ASoC: SOF: get nhlt from all topologies
  ALSA: intel-nhlt: lower intel_nhlt_ssp_device_type log level
  ASoC: Intel: sof-function-topology-lib: create common helpers
  ASoC: Intel: sof-function-topology-lib: skip non-exist file in
    best_effort mode
  ASoC: Intel: sof-function-topology-lib: add I2S support for
    sof_sdw_get_tplg_files
  ASoC: Intel: sof-function-topology-lib: add get_function_topology for
    I2S machines
  ASoC: soc-acpi-intel-ptl-match: I2S machines: use function topology

 sound/hda/core/intel-nhlt.c                   |   4 +-
 .../intel/common/soc-acpi-intel-ptl-match.c   |   3 +
 .../intel/common/sof-function-topology-lib.c  | 291 ++++++++++++++----
 .../intel/common/sof-function-topology-lib.h  |   3 +
 sound/soc/sof/intel/apl.c                     |   1 +
 sound/soc/sof/intel/cnl.c                     |   1 +
 sound/soc/sof/intel/hda-dai.c                 |  26 +-
 sound/soc/sof/intel/icl.c                     |   1 +
 sound/soc/sof/intel/mtl.c                     |   1 +
 sound/soc/sof/intel/skl.c                     |   1 +
 sound/soc/sof/intel/tgl.c                     |   1 +
 sound/soc/sof/ipc4-priv.h                     |  10 +-
 sound/soc/sof/ipc4-topology.c                 |  63 ++--
 13 files changed, 322 insertions(+), 84 deletions(-)

-- 
2.43.0

