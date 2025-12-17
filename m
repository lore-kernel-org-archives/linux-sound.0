Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6EC339710
	for <linux-sound@vger.kernel.org>; Wed, 17 Dec 2025 11:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765969491; cv=none; b=uClAtRRBEIGMqwEkiDJGULDjC2nz6M6JBRTGF4FkqQ87ZYmC/YMW/YydK99ib58EExFBkgG4cIJoU6cW+0vpy64RV40J3w+59KNsjy1GwAqFF1+YKcFh/cYoBoTnHj9PP2zQRniPWG0cC3MevUCP5D7OZp4QBLPz32g+uRyD0JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765969491; c=relaxed/simple;
	bh=wYgEWLpLTS44UVNd+lK4hiotdHcqGuo9yv5SOrDRW/k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DvZNK1DZnXoW99OUSKj0GznHnkZ3qUXqTW9X64Q0UKkwVpSj/snJeKdNq359rn5NYM1U5MAgpEKQ2AF+74o3UMgjnoToOBoeaVg+IUYu89LFIJKxbrcqgB2sYYbHc9IbJeje9rPFZRhRu7UD5GEYhHog9S2b6gBjFn5srfv5gI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ytm4m5aB; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ytm4m5aB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765969490; x=1797505490;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wYgEWLpLTS44UVNd+lK4hiotdHcqGuo9yv5SOrDRW/k=;
  b=Ytm4m5aBjkXYZTurjA58BfYzB20OxT0o084BHLEOteS4PMp6YLYk8JMc
   S47tHq5ULthF5qiYd/m0fpPhY7JGgSWwQZprVaJOMZfVfllk/7OmXPsNJ
   JCsPefurojYqEUfn+IDkGBlVsiscdmk99EI2zYPfgILYFxEosmIv+16H4
   iRl5/SgXcRMHKqpC7gYuUOXDRRiJ44GIXRUUqq7UVYxUZrapy0Pcc1wQw
   ZrU6/JYFbF7mI9H7lmzKxhmhqhsAG5Spji9gwp3mqUlRW+uLLnTTKUi9m
   +TduuivXvgRNpniAWmRd+gyZ/j2Nmt0il+9OONIDiJtqEH8BXDrtYwp/A
   w==;
X-CSE-ConnectionGUID: VP7IWeHGR3WzQDhGwRzfdA==
X-CSE-MsgGUID: spsV0/LJSfKSc8u0RmYsSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="55476837"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="55476837"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 03:04:49 -0800
X-CSE-ConnectionGUID: 9x33n4jWR4uftGw7AO0H3Q==
X-CSE-MsgGUID: GlGVL5METaSthvlGI6xcTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="198765864"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 03:04:48 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 0/2] ASoC: Intel: add support for TAS2563 amplifier
Date: Wed, 17 Dec 2025 19:04:30 +0800
Message-ID: <20251217110433.3558136-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for TAS2563 amplifier on Intel platforms.

David Lin (2):
  ASoC: Intel: ti-common: support tas2563 amplifier
  ASoC: Intel: sof_rt5682: add tas2563 speaker amp support

 include/sound/soc-acpi-intel-ssp-common.h     |  4 +
 sound/soc/intel/boards/Kconfig                |  5 ++
 sound/soc/intel/boards/Makefile               |  3 +
 sound/soc/intel/boards/sof_rt5682.c           |  6 ++
 sound/soc/intel/boards/sof_ti_common.c        | 76 +++++++++++++++++++
 sound/soc/intel/boards/sof_ti_common.h        | 24 ++++++
 .../intel/common/soc-acpi-intel-ssp-common.c  |  3 +
 7 files changed, 121 insertions(+)
 create mode 100644 sound/soc/intel/boards/sof_ti_common.c
 create mode 100644 sound/soc/intel/boards/sof_ti_common.h

-- 
2.43.0

