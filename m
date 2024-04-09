Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF939130AF5
	for <linux-sound@vger.kernel.org>; Tue,  9 Apr 2024 11:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712662436; cv=none; b=fza4eT61WqPGzLvs/33G5oKMAWyUiv9DzOhm2mA2OxN1qb1PJEk9UTtUHIcLMFT2oUWXlSyLMJH0W3vNba2gLdA4mDDM058bkeJLhShjfa2jqnir6DnwPVZOtKPUp8mh0XDpTL4sLyFcCilwqCOatrI9ZxFboDMm/IZgCBv5rqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712662436; c=relaxed/simple;
	bh=Vl5tiIXZBrINfUp5wVrB5StyA3VNRqvvCj04G2ghCwI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IM3B9aqouy8kchN6ajSpP9Ag/Ht0IBsSiSjH1jydQmyxknhupW+Tithwl2WdinN5UW4uQL/IEIiqcnuGb7UDjkIQiYwbC2KX/Cepg4KBBhqJ5nRynOz3M0AEMEvjEpnuVOD/YF20ldvkhuScm5tKE/2F6PuUKyxl/Q8YOVd2SMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aaxu82HW; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aaxu82HW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712662435; x=1744198435;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Vl5tiIXZBrINfUp5wVrB5StyA3VNRqvvCj04G2ghCwI=;
  b=aaxu82HWswz+TdWX9D5tig/A5euAS8ZOwytkWGFq66sxd1zWS4KHfXBv
   fJWqU28AYc36jqkVJxuHjgaRHWrIjznMkg2SozytfPZgowrO86w4BHkLJ
   7fmrQ1JNMAqXMwszWprpuWMoMdUHtAMoC/drU5FJ1M5XAa2sdFskzfxRw
   Obi5M+0gNy1tSHdsEEg2TNHqEeIt9b9fGMO0cnxLmPz7yytc04yddApWi
   vtaXenS4W68mCyvaINZAwAK7wwRAm3bQy79UX7Z9RoL/sbyyAHiq8nBY5
   kAHTkZViU/XbCLaTkZIdi1vM4G1DmArCkM1HlDxEP1k/fU3WL+dcfgjSy
   w==;
X-CSE-ConnectionGUID: /oOFsAFZQQiGFFp+nNAzJw==
X-CSE-MsgGUID: bGBMDLZhR1OXn9L+DQ5brg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="18687786"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="18687786"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 04:33:54 -0700
X-CSE-ConnectionGUID: enV52UF3R2SlIAFmw3tWbA==
X-CSE-MsgGUID: JHpEypZwSiux3kO2PSnULg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="20241672"
Received: from dpotapen-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.59.81])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 04:33:52 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 0/3] ASoC: SOF: Intel: Add fw_regs area to debugfs map for IPC4
Date: Tue,  9 Apr 2024 14:33:46 +0300
Message-ID: <20240409113349.21623-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

The beginning of the first SRAM window contains various fw registers and
additional information which can be very beneficial to read to gather
information on the current states to debug issues.

Regards,
Peter
---
Peter Ujfalusi (3):
  ASoC: SOF: Intel: tgl: Add fw_regs area to debugfs map for IPC4
  ASoC: SOF: Intel: mtl: Add fw_regs area to debugfs map
  ASoC: SOF: Intel: lnl: Add fw_regs area to debugfs map

 sound/soc/sof/intel/lnl.c |  1 +
 sound/soc/sof/intel/mtl.c |  1 +
 sound/soc/sof/intel/tgl.c | 15 +++++++++++----
 3 files changed, 13 insertions(+), 4 deletions(-)

-- 
2.44.0

