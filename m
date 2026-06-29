Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BF14279F9;
	Mon, 29 Jun 2026 14:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782744306; cv=none; b=PZmoOTZ0IBth2Pnmy2BMgThWo5rhwzCF50jR/JDYIB+PB5zXK3qiGTcrFGrbqbZm6lc2Z03XWHMtkBn5FKfy1XmZLM/Ei4jMu8bDiBYX7wv+2jYA9VaI6CpkN8AZl9BdPLcp4zmMI2hR2tRdytd9lk8Kw/IgGwJqj5ujgavVWdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782744306; c=relaxed/simple;
	bh=C+zc4wbVHQt6Wuz6YnvLrsB9EHXEz0JOPubcUbi/3/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bh1GZ/TUSUIrB0JgaHivIPdLOvYBFTDvbT7y8+Ewnkj28j3x7T6CxLytqiyYrkLpVzrh9GCYlofhWoiShLgar1kq+XHB71eJxKMof8dXaBjJ3tj43kk1mOm7TZ/jRBRO8TI1SvJRapEWoJhzb6SE7Vq8KVXWTFmvIda38jHfayw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QwWumjB7; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QwWumjB7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782744304; x=1814280304;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=C+zc4wbVHQt6Wuz6YnvLrsB9EHXEz0JOPubcUbi/3/Y=;
  b=QwWumjB7t615MK5mQuK5xZD3n62VJjeQgxZGAeB4hOdOKoJo/AxmbmTz
   GWJXOuqyFzdIublfQ7k3dTGO0hs0lSMRqyCK3SjIAczSJ8JSNKZgLAOZf
   f+QfD+QiEbpLnwK9x/P1r5Jo6vLJGw+XNECABvtp87oHK/cKGEXco21ql
   NimNk4FHB044bJ8Nxyed+0/raQGsHsh8nWCbp0uOan9ZxNrft+DWPc9xl
   ridfVRi18HQTetRHbFidujm8KDMVMKNPvIg4Qb1kB5SBDAf7DVau2NY85
   yG+EnWh9WZHLNT9F/m8JBafUSs3Jyz/sXtn1n/oiVz0qHE4gsCogZC2kl
   w==;
X-CSE-ConnectionGUID: UgRCi7weSo2AA+aQvZZLyw==
X-CSE-MsgGUID: oldYGrPFSuWu27UieldUTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="106228464"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="106228464"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 07:45:03 -0700
X-CSE-ConnectionGUID: WVnt+/YXS8ui6PrTnZQhzA==
X-CSE-MsgGUID: huWhvjR2Th+IPqUWRyJC7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="250282938"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 07:45:01 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH 0/2] soundwire: bus: re-enable CLOCK_STOP_MODE1 support
Date: Mon, 29 Jun 2026 22:44:48 +0800
Message-ID: <20260629144450.2096823-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add CLOCK_STOP_MODE1 back to allow the peripheral to utilize it when
the clock is stopped.
This mode is designed for power-sensitive devices as it enables a deeper
power-saving state, although it does not retain the peripheral's state
during the clock stop.

Bard Liao (2):
  soundwire: bus: add CLOCK_STOP_MODE1 support back
  soundwire: Intel: stop sdw clock in system suspend

 drivers/soundwire/bus.c             | 45 ++++++++++++++++-------------
 drivers/soundwire/intel_auxdevice.c |  3 +-
 include/linux/soundwire/sdw.h       |  4 +++
 3 files changed, 31 insertions(+), 21 deletions(-)

-- 
2.43.0

