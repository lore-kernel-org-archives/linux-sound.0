Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D20542AB0
	for <linux-sound@vger.kernel.org>; Wed,  6 Nov 2024 05:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730872735; cv=none; b=oCTsMQFLkAz9rrz6YKHlZ1OVDDin6zZV+nAg8vly485ZKZc/GQCutlMo2aeFfR8HaRkZnF66V6GIkLReVYIyc0dAiDmM5OmPmS+P93QMFi34omrsSKMTUknjM3A2QvSmD5MQzCwkDrrm0Lj9qVt5i3uP4rbOa5pduIwJjtl+uyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730872735; c=relaxed/simple;
	bh=VNPq8mioB6DOCFaJflWr42XAp96b/JvXpLE2QrTLGWw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FSGY/es3+LFBXp62SVPcLwHVnX45LsL4tZ1CJpJWMNrTctwUhLPbaSqSjVBf80a87f3+yo86t27MNZpFTBbF3oxjhtCbVSvWz0y4xz/2PlJ9xDzPP8UjE9UFuXTNfU0P8GrrNBCQje/x45OH0FOUzSKnk6zj9qMn77gEhClTYPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TegO/H9t; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TegO/H9t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730872734; x=1762408734;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VNPq8mioB6DOCFaJflWr42XAp96b/JvXpLE2QrTLGWw=;
  b=TegO/H9t5ltHCOgCvkxuMgyIcjPlbO/qjAazOGsS+jEpFt2DENxD0LzG
   HcvGOfxiPHhT177lZSmCBNPwUjWKAP8jmj1+rM9k4AiHvwEbuz7jjpmeZ
   jYIxC6RviWExNcDBmqvnW0bOTPjGygYtZdsDZe6bIewCSghC2ZcO0HUFD
   vWlORhiRXqykPiBgpDGeD6/5FyWf2W+8jrZK7XhvZJoxXvb7kgHULSupm
   il/Y/xcverDaFaTMcuX38qoy7jemnja3ABrnJ5CLDTJKq4Qe3IBajWV1c
   yuZqfIKHuXAnDVNnxxJOS+T8sWlP3yrAWUaZMWdtSCBBxHAzp2Aujl9A+
   Q==;
X-CSE-ConnectionGUID: b2cdnklPTvSNQKE0FUUDeA==
X-CSE-MsgGUID: ZLIIj8YiTNKTv+X/kCdIpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30505149"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30505149"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 21:58:53 -0800
X-CSE-ConnectionGUID: BuXpdR2GTkaCgCiQ4lWcAg==
X-CSE-MsgGUID: nJ1nIrasTT2wZDKLbxniDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="89484233"
Received: from sramkris-mobl1.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.222.45])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 21:58:19 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 0/2] ASoC: Intel: Kconfig: fix undefined symbol: sdca_device_quirk_match issue
Date: Wed,  6 Nov 2024 13:58:08 +0800
Message-ID: <20241106055810.10123-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix the ld.lld: error: undefined symbol: sdca_device_quirk_match issue
when CONFIG_SND_SOC_SDCA=m and CONFIG_SND_SOC_ACPI_INTEL_SDCA_QUIRKS=y.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202411021722.DiX1Y5sf-lkp@intel.com/


Bard Liao (2):
  ASoC: Intel: Kconfig: make SND_SOC_ACPI_INTEL_MATCH depend on ACPI
  ASoC: Intel: Kconfig: select SND_SOC_SDCA by
    SND_SOC_ACPI_INTEL_SDCA_QUIRKS

 sound/soc/intel/Kconfig | 5 +++--
 sound/soc/sdca/Kconfig  | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.43.0

