Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09011DFCE
	for <linux-sound@vger.kernel.org>; Wed,  3 Apr 2024 10:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712141525; cv=none; b=VKvH8Y7WHqjg9f/+Kp89rOZV6aeHETMOIRQO9pOqfvoRydoefJ+vu0JoURt5zv1lDo6gpBReKAO81XMr3Puk7MjSCbLcy/MrAFDwTJEprTZteBlWljI3on+uI+r28HxU9tnXQVbB/NAchnBS9nkVvWtKRdoqZ2k4hLlStsnQYl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712141525; c=relaxed/simple;
	bh=QH599F+d0NQhL1veqZOL1ORvH8Moxn9tRZmyWP2TBCA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hQY2s7+hf4AiiBo6YLzlg4uIhcasLzntW+eeMGYJA7u63La3tFSkPw6SIAMFw4DsDoJ8mDdNPUjIs+LsJpuGt4nPmGHFYMBzrhrvnJesEqXvDRGu66ldFUvf+vb9O5C93YymC2/Tbav7yrp0iLRvx2y5iGJOEwKnKPm+w30XUp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BM5wab1t; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BM5wab1t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712141524; x=1743677524;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QH599F+d0NQhL1veqZOL1ORvH8Moxn9tRZmyWP2TBCA=;
  b=BM5wab1tBdUrQD2vG1HIJyHYMsjLatZxHKYc6DHROxmVHN/BAdtM1bOw
   G+JJdulLmE+tZldZdf3MhJVWyR5tI7S7t2Sofnnm2wfTEp90JAi5OtBC5
   Un2gkUEwlB/sp04YvaURwdXWfH1+WrSINbFId8IG8RfeHyt7Emi7uzO22
   2ypzSrufCxITLn9jBSq5/I/LbcTOGG9ZirBGMiq1dKdXuiSKi1SW7w6y/
   n0o7zxdLOAgQR3BZyvT0Yq+FHjVXp2Pjw0q4zxp8lOhESbrU04J/PvSw/
   vwJLI/B5rIHjhV7Xf0lxqoDIr3kxuOskJ0NCrQcATwkeoWHjIee3cao5k
   A==;
X-CSE-ConnectionGUID: J7D0HTSKRiWxNAkiE4WXYw==
X-CSE-MsgGUID: j98FkMZLQFaQhQB4CYjvPA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7212179"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7212179"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 03:51:42 -0700
X-CSE-ConnectionGUID: aZ+TW4fkTPajPXJaRd5IDg==
X-CSE-MsgGUID: TfEyz+WCTcyTEV1YHHCJ+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="49374772"
Received: from aelgham-mobl2.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.35.133])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 03:51:39 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	rander.wang@intel.com,
	liam.r.girdwood@intel.com
Subject: [PATCH 0/7] ASoC: SOF: Intel: mtl/lnl: Improve firmware boot state handling
Date: Wed,  3 Apr 2024 13:52:03 +0300
Message-ID: <20240403105210.17949-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this series improves the firmware/boot state handling which will allow
failed IMR boot recovery and human readable boot failure decoding.

Additionally a new debugfs file is added to force a purge/clean boot
of the DSP for developers.

Regards,
Peter
---
Peter Ujfalusi (7):
  ASoC: SOF: Intel: hda: Create debugfs file to force a clean DSP boot
  ASoC: SOF: Intel: mtl: Correct rom_status_reg
  ASoC: SOF: Intel: lnl: Correct rom_status_reg
  ASoC: SOF: Intel: mtl: Disable interrupts when firmware boot failed
  ASoC: SOF: Intel: mtl: Implement firmware boot state check
  ASoC: SOF: Intel: hda-dsp/mtl: Add support for ACE ROM state codes
  ASoC: SOF: Intel: mtl: Correct the mtl_dsp_dump output

 sound/soc/sof/intel/hda-loader.c |  7 ++-
 sound/soc/sof/intel/hda.c        | 73 +++++++++++++++++++++++++++++---
 sound/soc/sof/intel/hda.h        |  2 +
 sound/soc/sof/intel/lnl.c        | 10 ++++-
 sound/soc/sof/intel/lnl.h        | 15 +++++++
 sound/soc/sof/intel/mtl.c        | 63 +++++++++++++++++++--------
 sound/soc/sof/intel/mtl.h        | 48 ++++++++++++++++++++-
 7 files changed, 189 insertions(+), 29 deletions(-)
 create mode 100644 sound/soc/sof/intel/lnl.h

-- 
2.44.0

