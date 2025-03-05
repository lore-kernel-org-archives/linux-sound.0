Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E671D540
	for <linux-sound@vger.kernel.org>; Wed,  5 Mar 2025 13:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741182902; cv=none; b=d6lyNyNSwXlNJ1z7jTRMwBAWdE9zttWxnk5o4oIlX4pfLNTNGaP/f9/fa/0c3KdFkuSx6sodmLTnQGeJ0gPVE520OgpHIsi60q+FtXTOv4MlovPSZyPZJzNSqV0UfZaxOodpQP7U/+LEPH9P+AXXpxGFj6ZZEZ2mh/n7FViyyfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741182902; c=relaxed/simple;
	bh=+W/f8YznPRLvDh5UyNfn+NL5p3lWmLZa8PLkhx/0b0M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l/3d9KPyc0hNs4DVWwOl0y8OZBS53JjQVtP9mux/YiVJ2zNSGpz6jSEiPvYS7TgjI0aGJopT6OZBbytv9g4QaKWKFZgBbyCtezzgz5DnjWZULIMA4oKNX8EsrI3qWNnGGoV///GGwiHlL5XzKQqpSGgxPDh3XYXbBu5lvui6M68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RI0xGQcA; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RI0xGQcA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741182900; x=1772718900;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+W/f8YznPRLvDh5UyNfn+NL5p3lWmLZa8PLkhx/0b0M=;
  b=RI0xGQcAQb3bsYMyMeqWS7T3ofymFMnf02L6eR1W/4sTpVCh8ijP8K/t
   CO/MRKfxCRx+Xlq3ur/6LA6HhQ7RLSqCaXsm5XvPCVTsuRKGzcgEztOjz
   r07t3Teyr3BexVwHR1iJg0gfT80DgjCYSrMc5NLqcxiyOrA5OmZwXK8sa
   Em3qSsoTkQI+ebGXsX2s1bj6TPcXJohmMqhgcKv4l94eBDwfYnfUDY2aN
   DUhS0KBbnvR3o9li6D5LTQi7LaEjhfhTgv8NmoacUWMQwQjc1k1G44CeX
   U/HWCeAFZs8G/B8uQqUR4rTu8XPOdzyGAZGPoCHLUhmtzmO4pGRtdRjJV
   Q==;
X-CSE-ConnectionGUID: xKMvLvfPSmiBasuDSaKjGw==
X-CSE-MsgGUID: RNcoutprTP+zo+sTwdXKFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59558055"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="59558055"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 05:55:00 -0800
X-CSE-ConnectionGUID: 2u9I54jGSr2Q8GKTBRnkbw==
X-CSE-MsgGUID: T4zcczQhR3WvpOcvGX9yBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="118846989"
Received: from bvivekan-mobl1.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.175.91])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 05:54:56 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 0/9] ASoC: Intel: boards: updates for 6.15
Date: Wed,  5 Mar 2025 21:54:34 +0800
Message-ID: <20250305135443.201884-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

1. Add multi-function SDW mockup codec match.
2. Add couple of new codec configurations for ADL, LNL, and PTL boards.

Bard Liao (7):
  ASoC: Intel: adl: add 2xrt1316 audio configuration
  ASoC: sdw_utils: add mic and amp dais to 0xaaaa codec
  ASoC: Intel: add multi-function SDW mockup codec match
  ASoC: Intel: soc-acpi-intel-lnl-match: add sdw multi function mockup
    codec
  ASoC: Intel: soc-acpi-intel-ptl-match: add sdw multi function mockup
    codec
  ASoC: Intel: soc-acpi-intel-lnl-match: add cs42l43 6x cs35l56 support
  ASoC: Intel: soc-acpi-intel-ptl-match: add cs42l43 6x cs35l56 support

Peter Ujfalusi (2):
  ASoC: Intel: soc-acpi-intel-ptl-match: add rt712_vb_l3_rt1320_l2
    support
  ASoC: Intel: soc-acpi-intel-ptl-match: add rt713_vb_l3_rt1320_l12
    support

 .../intel/common/soc-acpi-intel-adl-match.c   |  29 +++
 .../intel/common/soc-acpi-intel-lnl-match.c   | 137 ++++++++++
 .../intel/common/soc-acpi-intel-ptl-match.c   | 234 ++++++++++++++++++
 .../common/soc-acpi-intel-sdw-mockup-match.c  |  42 ++++
 .../common/soc-acpi-intel-sdw-mockup-match.h  |   1 +
 sound/soc/sdw_utils/soc_sdw_utils.c           |  14 +-
 6 files changed, 456 insertions(+), 1 deletion(-)

-- 
2.43.0

