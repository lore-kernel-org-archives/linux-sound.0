Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD5122ACF7;
	Tue, 14 Jan 2025 06:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736835391; cv=none; b=nyPPohqTy9sG78wOv0wva//zyqGrGZJbrNou2fNoQWZrRxCnon1+jxuUa4u9lWw4Ez03sLONsc6Or3aEsjO+hx9qTBgHRcjynATy5pk6b4QlZmZn3TyrA5oGcPUgxTNql0hI3f/t2f+JinrBhEtW+6XVpZx2V8ju9IycaGUvVIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736835391; c=relaxed/simple;
	bh=Gt/vBA/BXYDgbmvGmAcb+iQuZQ64btW0UuXa4DuES5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Y5zv33gqA3JNjr9iPjH66XrbtTv76Auh96+EDwrrRa/V6JOb+JnLpAuk1mitfN1Yng2kmACPlCfe3GnMah1RMxwzjcE+3KIOzoV30tm1HbrP7/wI09pmc+mRbcIWb0P4pQ/ZTi0ZRPL1sixhjNO/x/NkFn+ILpXbyEMDlQqFIjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n8D1JKSf; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n8D1JKSf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736835391; x=1768371391;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Gt/vBA/BXYDgbmvGmAcb+iQuZQ64btW0UuXa4DuES5Y=;
  b=n8D1JKSfQ+3lYXNooHyc9MDKAbm27tnPjTzMD8vYQhzleuBQF9/e7ZI0
   Gxt/CH5qWzXMth5+1gKSVA11/T19/kMvqaN3f74cF6XkAFjqIfJ5FJI9K
   4ztUVtyrpg5ATsquOgZvI1f1Jj6ohJr8Xl95KG+SXRR/0GZ+H/DzghKtW
   BpbS7JLFqYA5HTInacmFN41ECnBPfu15OhqqkboPmMk1xxyy6Es1F0X55
   qJeslgY3fsKE5Icwpmm1C+VvcQ6aC31zkVLU8i5XZkwjxJcZcErZx5prb
   RM9cbfyJNVRg/awXm8FgtqpoRz73v8HiGAdu2e9Jo7caD3k0CSQPM5zTJ
   A==;
X-CSE-ConnectionGUID: qslgsTwhSRuujTbEpT5IGw==
X-CSE-MsgGUID: MfW0jqPPQa6B4EKq7SauCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="36808045"
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; 
   d="scan'208";a="36808045"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 22:16:30 -0800
X-CSE-ConnectionGUID: QN2eniJ+Qs2nesd5/8m3LA==
X-CSE-MsgGUID: xhR6eO+uQpuFKZt/4g4k7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108768255"
Received: from rfrazer-mobl3.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.150])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 22:16:28 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH v2 0/2] soundwire: set frame shape and divider based on actual clk
Date: Tue, 14 Jan 2025 14:16:19 +0800
Message-ID: <20250114061621.110800-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Set frame shape and clock divider based on actual clock frequency. And
with that change, we can support ckock change in Intel platforms.

v2:
 - Mave the check before writing the divider registers
 - Remove the 'freq' intermediate variable which is multiplied by two
   after divided by two.

Bard Liao (2):
  soundwire: cadence_master: set frame shape and divider based on actual
    clk freq
  Revert "soundwire: intel_auxdevice: start the bus at default
    frequency"

 drivers/soundwire/cadence_master.c  | 22 +++++++++++++++++++---
 drivers/soundwire/intel_auxdevice.c | 21 ---------------------
 2 files changed, 19 insertions(+), 24 deletions(-)

-- 
2.43.0

