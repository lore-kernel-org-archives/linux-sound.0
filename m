Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE2821E3C2
	for <linux-sound@vger.kernel.org>; Wed, 16 Oct 2024 03:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729047837; cv=none; b=ZpYG960sbJENkupMuG7MeMwAy+3w/oNU4uj40ZcmAP+wEsQgtqkSqqQGSpKj4dYE6mxYwsNczrj/t0zBzoq7WM/PFQ5/6CSgYILiY0aKCqzq0R6oZnKQjuX4Qpu2KKRsdqAn2EhMugdzd9cFr/itCfb+eNhvWs5nUjRo1f3zXsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729047837; c=relaxed/simple;
	bh=N2uNHS5QXdInaChYWfg5L+QxcS3ZUoaueNA7VjRCYz4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DIMr5N5/SviUFKNMTcVhQG2XW9zfugryg1A/zhCoIWEO38xqLc3cQT9mfyXZaSgd7nrRPYOcrM/4MXVZhKqgpDZapnKfvmCYvbvdkOry6StGTtaz26T+pWaBb7To18WnXm48uUH0DmNVDJuhyiPAYH8+OTpGLrpEqBtFGgd3yeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=go2D4dFP; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="go2D4dFP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729047836; x=1760583836;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=N2uNHS5QXdInaChYWfg5L+QxcS3ZUoaueNA7VjRCYz4=;
  b=go2D4dFP1D8vEX6BfVc3+el+u02PnJ74UFpzzqi9zfCqq78TEN6sGjcj
   beAIW4ApVUVePfmvJm5inhuN1v7cxpcJKg97O6mpy3aXwUVmIVzd7UzCs
   8Gl3U+AAwHXwFTPs+yfMNnRhqCExVHFWvCWTiDZkOvx8xeb7VX9Ekj6uK
   GWInIjQE8RG9FIfiSnro3Z7ppKshI8QSspgsBWIPZ0tO6oGZEwiimjRDi
   sG5ffDWjFwUq6CSbjMJcIan4Ld+k2lmG9WcCQhW1wpMQQFE8Q1JMvi/B8
   V+0UcImbPu2wiQGb4Lm7A8C6BwsFY5MeI3UboQgVOwPct+4JhCERCmuBg
   w==;
X-CSE-ConnectionGUID: Wss5BwTkQi6nCJayiUNHSg==
X-CSE-MsgGUID: lebf2o0/R0Khftgfn8714w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28265515"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28265515"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 20:03:56 -0700
X-CSE-ConnectionGUID: VNo+o5f1SxiOg7WHuiWNZw==
X-CSE-MsgGUID: Dufp0iq2SZysN7vJJy8yeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; 
   d="scan'208";a="77979224"
Received: from cvapit-mobl1.ger.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.236])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 20:03:53 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 0/4] ASoC: add support for some new Lenovo laptops with
Date: Wed, 16 Oct 2024 11:03:40 +0800
Message-ID: <20241016030344.13535-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some SKUs are using host DMICs rather than the cs42l43 DMICs, update the
endpoint structure for these SKUs to remove the DMIC endpoint.

Charles Keepax (4):
  ASoC: sdw_utils: Add support for exclusion DAI quirks
  ASoC: sdw_utils: Add a quirk to allow the cs42l43 mic DAI to be
    ignored
  ASoC: Intel: sof_sdw: Add quirk for cs42l43 system using host DMICs
  ASoC: Intel: sof_sdw: Add quirks for some new Lenovo laptops

 include/sound/soc_sdw_utils.h       |  2 ++
 sound/soc/intel/boards/sof_sdw.c    | 41 +++++++++++++++++++++++++++++
 sound/soc/sdw_utils/soc_sdw_utils.c |  5 +++-
 3 files changed, 47 insertions(+), 1 deletion(-)

-- 
2.43.0

