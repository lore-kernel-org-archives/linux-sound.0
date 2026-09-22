Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E72448BA1
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 09:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069008; cv=none; b=hHq5y4e+yKigPsZl8N1+erlV7GuSsS8YArVE3ITqtCdL9A4VdhmLWz6xea6OFDUP/F29pzZ95F6Vj0pxJH4TPHWU9VPRhcgaSj2A8INnzhBq0hNLgRvYHevrFPk1kHYawDwfl/uGLERLHC54biN96WhETV/Kyfy7s49iIplwyY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069008; c=relaxed/simple;
	bh=l3ZqAEqs9UsrQv7OPjZJjRRaoMKfljAh6iKtsNukyuc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pZtHoe2I6WdWLFgXm+iS2Ufqg23Sa2I9YP7sbcl7tEOu8eiOZY/BOoWeeZRcwnUj7rfuHuY1rJBsVbfwZ9C/arlVVOAQsnBURyxdesz+KtR9zRTfL7zzaqQ6H2LYOyz4l6fmd65PqXbgX8KaSrPzQw/MFySWtzwySudz2kAmihI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MQsk8xJo; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MQsk8xJo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790069006; x=1821605006;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=l3ZqAEqs9UsrQv7OPjZJjRRaoMKfljAh6iKtsNukyuc=;
  b=MQsk8xJobyVz2CIw3Ak0CHKmpYCR4x02AzcmBULqphSOQ8UF1Kt8bFd5
   XX/mUzl5XDfFW0Ymd8e+hME6baOK+G8AwOZ9kY2AzI11a1fzkyHt+Malz
   tfAQCa/8nIbytMS8mZQcUb76nwsWiFWm3AvynrdxFUQQUzZvVMSddLAV3
   ZpjfcEeUdB5WCWqUNtbAJ3N29COpo+HupaSRsi8UloS3BiF6b+jX6fqZO
   6/Pl1JEJlG4fDoUhZ3nHJe4fNoLqFB+gsjGXUxYV+B4DGpkPk8pSYa5Ed
   tbuQqe1bp6UZgNsbWMlKG3B80oXoNZcX+Ql9DTOi8X/LkqDND/7NqDKNr
   A==;
X-CSE-ConnectionGUID: uGccy4/jRh+KuLJnjg3w6Q==
X-CSE-MsgGUID: xuu8KL3ARq2OvIJv1Wt8MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="89576732"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="89576732"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 02:23:26 -0700
X-CSE-ConnectionGUID: IMXmvfq5RGaTxAJTy+sfhw==
X-CSE-MsgGUID: 4tH9yIM6TjynGhDkMq5h5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="277837503"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 02:23:24 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 0/7] ALSA/ASoC: Intel: add I2S function topology support
Date: Tue, 22 Sep 2026 17:23:09 +0800
Message-ID: <20260922092316.2296039-1-yung-chuan.liao@linux.intel.com>
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

