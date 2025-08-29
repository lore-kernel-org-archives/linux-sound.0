Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448FE277003
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 09:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756459785; cv=none; b=DDLJjPh6AQLw+CPtvFLtKMlIr8a7fYaIiVKL53Erxn6bWg6ciNBhqnvmNwypEYwj9XLTlCq0KtueKAWZUdYBbdQB7W7jfaNeTgG7fHV1+WNP72Ls4gHrX50PPT3foe2sll/WSkYzGgybMXuzoI52VseuVYK2u318ulJP1Xn6Jzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756459785; c=relaxed/simple;
	bh=qXrPihwtfRsy2tXS+BG01tB7gM1m4AUKn7nqEFzL/58=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U8wrc7dng/yb9xakXbEx9ZkXtH0Kp6SPDRwKI0UhAQk1hBLeQU2eUmlmYnUH2bFuziOmNUcYtJz9HLsC9ngogOxr/wjB3UtIE3s6K8jDkgs11iU2u0QuWJeW/Jhhju7tNZcfEoVReKMwmo1xWkF8v46Pr0xZ1+IquFbBLbbCayE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NLKtBXug; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NLKtBXug"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756459783; x=1787995783;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qXrPihwtfRsy2tXS+BG01tB7gM1m4AUKn7nqEFzL/58=;
  b=NLKtBXug5HZR8wWDsDYIP0NaXlbLgdYrprdiPDOmVESoDrcbI4yHbZE8
   4SA2zLgzajBPVkVoHpeqVaBp8Dq3khf+nioLIuDFCw8ZvXyHTPutNGU90
   BYutGwBGhYpQbvaQbwth+OAKaxvQOX8mJCOoVBiXYOYgyI1ViNCieNaG0
   t0WVjhmBsumSOyrNMgE/8Sal/bG4+ryK/vxgwS4p7YdD/SWTrI8rA5Edf
   iy77YTs9SFcesZ7JE448BIssubuufZTgjJumiPun88IisRrFgjeIqK9rv
   SOjsa+IGbp4oemLJkNcIpkfjM2IiiqQXJu6RyAs2Aqs8G8L6kOrzM9o/h
   w==;
X-CSE-ConnectionGUID: Zl8Hak2zSR2uFFkG6hFotw==
X-CSE-MsgGUID: pwU58Y2uTj+UMwshcIZI1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="84147876"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="84147876"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 02:29:42 -0700
X-CSE-ConnectionGUID: 85GAHQJYT1CulTAf8UgX2Q==
X-CSE-MsgGUID: 6S3LPb5WQzKLZ1dCFmoroQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="170245403"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.56])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 02:29:40 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com,
	jyri.sarha@linux.intel.com
Subject: [PATCH 0/5] ASoC: SOF: sof-client-probes-ipc4: Query available probes
Date: Fri, 29 Aug 2025 12:30:17 +0300
Message-ID: <20250829093022.32094-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series improves the IPC4 probes implementation by improving the
report quality and adds support for querying the available probes
on the firmware side. 

Regards,
Peter
---
Jyri Sarha (5):
  ASoC: SOF: sof-client-probes-ipc4: Implement ipc4_probes_points_info
  ASoC: SOF: IPC4: Add GET macros for module id and module instance id
  ASoC: SOF: sof-client: Add sof_client_ipc4_find_swidget_by_id()
  ASoC: SOF: sof-client-probes-ipc4: Human readable debugfs
    "probe_points"
  ASoC: SOF: sof-client-probes: Add available points_info(), IPC4 only

 include/sound/sof/ipc4/header.h        |   4 +
 sound/soc/sof/sof-client-probes-ipc3.c |  25 +++--
 sound/soc/sof/sof-client-probes-ipc4.c | 134 +++++++++++++++++++++++--
 sound/soc/sof/sof-client-probes.c      |  58 +++++++++--
 sound/soc/sof/sof-client-probes.h      |   9 +-
 sound/soc/sof/sof-client.c             |  13 +++
 sound/soc/sof/sof-client.h             |   2 +
 7 files changed, 220 insertions(+), 25 deletions(-)

-- 
2.50.1

