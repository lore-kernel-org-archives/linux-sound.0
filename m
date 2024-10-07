Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916761292CE
	for <linux-sound@vger.kernel.org>; Mon,  7 Oct 2024 08:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728288028; cv=none; b=Y3n9F21rE9TymLNktMP66HG4jpuQYkwxiKum1+zfAviXiCHdVKX2APQorgLSA//fNuF+wcwEpgFy2P5bTQmQYfQoalqXI4ZaCHsdsOEW1yocmD7OtiJVaFlFFz7UGEkYvXlsfoG+5BCKr4qbvQ+R+fvYeD6F1EHT8I0P8Xj0SDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728288028; c=relaxed/simple;
	bh=4CQXgSzKOKupR/TXFm3Hu5bdUsUy5SY2WDHY97exDak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kfHdaSmBAAUU7GhFQ8HtLSpd+qxFcr4A9o8f3+1Wv4gAHUwTyDmHYAXwlZ90sH2kGdk4NufX7bs8PuXgoPFE4yHiyHTnRnONZYznL+3B8R6EN7dlkAq4m5F9aR08N9XykAdjQjnhz8tKKH7NnLVreZ2G2CU8ojn3lOmxSHSoLdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SRMKBmre; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SRMKBmre"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728288027; x=1759824027;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4CQXgSzKOKupR/TXFm3Hu5bdUsUy5SY2WDHY97exDak=;
  b=SRMKBmreQ0w0BkgxlZvbTY4bfZ47GSQo811YpX5TsAwnOCj4ZeJ94tgs
   DHtavoMHbDxlk6cRMH5tPLPVuU/DsKXB589DjXHGFpTieD+SJMl1c4Wbk
   bifr4ACnx/NJQ22e6s1oVafcauGVCGjgBft5a1bmm0pVVsJqhSb4s2BFl
   RHE+4NtDcDs9Fql8iPZuYWM0BW1JO97sB7pC2qJTyHfAVJvvMvogKX3dy
   g5GfE2oidYTUfCV9lowdIkX7W43jf32Ay6moGJYsId2vJwwi5f/RdtEWD
   yso5bjsP+LIb5iMlFW0RZ0DBKtzV/RlyX4oZw8d8zE9vsopsL1NcVRU/j
   A==;
X-CSE-ConnectionGUID: qWhyFzK8Qu+q5TYaXC4eZQ==
X-CSE-MsgGUID: ZDpbWZKyT4aFHLQCTRe3aQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="30309323"
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; 
   d="scan'208";a="30309323"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 01:00:20 -0700
X-CSE-ConnectionGUID: iIZGj71vQ3Ge0KMnXJXQTg==
X-CSE-MsgGUID: Be6fZ44KSLKiCIExIdnEYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; 
   d="scan'208";a="80176630"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.70])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 01:00:17 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 0/3] ASoC: Intel: add rt722/rt721 support for PTL platform
Date: Mon,  7 Oct 2024 15:59:52 +0800
Message-ID: <20241007075955.12575-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rt722, rt721 and rt712 codecs are quite similar. Refactor the existing
spk_rtd_init() to support Realtek common multifunction SDCA codecs.

Dharageswari R (1):
  ASoC: intel: sof_sdw: add RT722 SDCA card for PTL platform

Naveen Manohar (2):
  ASoC: intel/sdw_utils: refactor RT multifunction sdca speaker codecs
  ASoC: Intel: soc-acpi-intel-ptl-match: Add rt721 support

 include/sound/soc_sdw_utils.h                 |  3 +-
 sound/soc/intel/boards/sof_sdw.c              |  8 ++
 .../intel/common/soc-acpi-intel-ptl-match.c   | 62 +++++++++++--
 sound/soc/sdw_utils/Makefile                  |  3 +-
 sound/soc/sdw_utils/soc_sdw_rt712_sdca.c      | 48 ----------
 sound/soc/sdw_utils/soc_sdw_rt722_sdca.c      | 41 ---------
 sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c      | 90 +++++++++++++++++++
 .../sdw_utils/soc_sdw_rt_sdca_jack_common.c   |  8 ++
 sound/soc/sdw_utils/soc_sdw_utils.c           | 45 +++++++++-
 9 files changed, 206 insertions(+), 102 deletions(-)
 delete mode 100644 sound/soc/sdw_utils/soc_sdw_rt712_sdca.c
 delete mode 100644 sound/soc/sdw_utils/soc_sdw_rt722_sdca.c
 create mode 100644 sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c

-- 
2.43.0

