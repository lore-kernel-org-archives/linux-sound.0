Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B9A1A76B2
	for <linux-sound@vger.kernel.org>; Wed, 23 Oct 2024 11:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729681545; cv=none; b=ULf4dRFn2GUFbzdzXpFOq4GLWXGi+EM31ohLGB5khJ3urJkxtvg+rb1kLcZWBRrtDQaNYuCP9+7KIgqUgkkWHh0+1q7UtAWRgL/ojmSo26gyyUPSO2BWyLtaUrRikh2Wkw9MYST4xuHbPWEVxf+EtdtKbG+yful0h8hNVqo7uFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729681545; c=relaxed/simple;
	bh=VgpvMjVMyaY8sdPrk4JeSsgiCO59bDND+4wNQdZQAuM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IITAwoN4hRHm9hHabqyHnk1QmSw8x1gQkqq6twQVsP1qHBUIkj8XnyR/8ZY+iMIUACHhvG1USJoSFdQLVH4CJIRXjkg77yxD+zTE0ENPJF5B56tFx87GOiYl+AnWlfDucyUUeNEuRCcgFLG6Bxc9lqPNnnVrHSFwbbwbBUkq5Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BpPOcLhC; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BpPOcLhC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729681543; x=1761217543;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VgpvMjVMyaY8sdPrk4JeSsgiCO59bDND+4wNQdZQAuM=;
  b=BpPOcLhCfQrR7GzDt6JcdK9deSICbR8y2JpwHkAtgK1YnCrOuHmav7Og
   4utXaE4eA1xk1VQrZHH/dhVdAHKdKmFgGJoyzmbgKaiELCYNn5bPeTaEm
   XEe4xVB/4D4oeP/B5WgLn1HfqfHI1KUFb7Jdo6Fhq2uy2H6UpsimLotg5
   zxJcjEy11F1iesBS8bY3Ntm7Ft8Cz4WsMRkfKZ/L7r6/LsvaDLQCWQZQz
   zyNqKxy/SzWbD3OeQx7urRlz6EAEmfgx0k2aBR3FcVksv83ul427KIoc8
   0XiaBVhck0zyQHoX0uLCDw3gmdGWpO7Q9bgtA4JZOhlR101PtBcZtOCzk
   g==;
X-CSE-ConnectionGUID: uBuBoVf2SAmQUSVT/wqQ7Q==
X-CSE-MsgGUID: qB1zCgF6R6OKwz4iIt+eZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40381182"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40381182"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 04:05:43 -0700
X-CSE-ConnectionGUID: X8ZPZk1pSyaJZdzZd19vOw==
X-CSE-MsgGUID: 6djAS+2NQ/69h5O4XYZAOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="79832658"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.245.23])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 04:05:40 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com
Subject: [PATCH 0/2] ASoC: SOF: core: Module parameter updates
Date: Wed, 23 Oct 2024 14:06:08 +0300
Message-ID: <20241023110610.6141-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Add new debug only parameters to override the default IPC and boot
timeout, these are only available if CONFIG_SND_SOC_SOF_DEBUG is
enabled, only for developers.

The second patch moves the firmware, topology name/path and IPC
version overrides from acpi/pci/of platform code to core and markes
the platform parameters deprecated, to be removed in few kernel
cycles.
There is really no point of duplicating these overrides as they
are not platform dependent.

Regards,
Peter
---
Peter Ujfalusi (2):
  ASoC: SOF: core: Add debug module parameters to set IPC and boot
    timeout
  ASoC: SOF: core: Add fw, tplg and ipc type override parameters

 sound/soc/sof/core.c         | 64 ++++++++++++++++++++++++++++++++++++
 sound/soc/sof/sof-acpi-dev.c |  4 +--
 sound/soc/sof/sof-of-dev.c   |  8 ++---
 sound/soc/sof/sof-pci-dev.c  | 12 +++----
 4 files changed, 76 insertions(+), 12 deletions(-)

-- 
2.47.0

