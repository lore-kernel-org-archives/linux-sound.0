Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04B23FB1B;
	Tue,  7 Jan 2025 01:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736215114; cv=none; b=iu5iL5Nj6lynkESyuNLpZgQCJPN/Qag9vLYY8ol4DThUvOGIONkHwDukOs6Ul/ScqfGDGSW6HNksZliN4Kp/GYiNM84iPVbmWZEn37E/0c+sPMGpNYrXmtoAGGO0fDgKDEndFoaZz5/Y6gSYWXf7JGF3WAnc1/Qcg24VcidO0qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736215114; c=relaxed/simple;
	bh=oIiI2K1aImfHSX/IV+gcHHKZYdz1rR26pwahXbtJvjg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uocEmGAM3cAEys8dGtv+E1VUs8iKUSzoMfy1jnmxM6E7NZmwn5auGj9iwtQrL3HLI9nSJEdZcPc/qVtHJcNPgdhpO9haFBQWwGa7t81CdLfBeYaNJTijfqKljAsNpqIUszUrwZ/L7gNr0FQUYu9pwPS4tQ8eBMPWICsysTv3Mbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cHHxIGYI; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cHHxIGYI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736215113; x=1767751113;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oIiI2K1aImfHSX/IV+gcHHKZYdz1rR26pwahXbtJvjg=;
  b=cHHxIGYImspQr5QBwmK9yhXiDjWy3Qw7dckhp/ZZn/mkiR0khVzFXgCx
   I/k//YxDyQFsE9R/B4KnQZaOHqdu8VAqHQFkeCJK1fqDigR0ButiTCCCz
   /Jdm/f35AdKSuXRLAEAyPj8QyeewRJTnd4ZYD298Mvk+yqAXEx3bpX8a4
   2Dg/TkRuI1bnAksulyWkMWank8ZOytBZeDhePjzBNxL2EnXYgvtf5tT+J
   ZuMS6A9TWk/xSu8iI4t6ioqgUtJuOO4LYyUK6h8+tLSwV/Za+/hKzCOzF
   jnyu+ley+HDAaiadcS3jTMoQ0pJSymtiMt0QuJlOVcPx9o05srb2iTtTT
   A==;
X-CSE-ConnectionGUID: M2P8vH1UTbe48W883kSYKQ==
X-CSE-MsgGUID: mZoiAOjxTFqw4K05Km4a5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36396885"
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="36396885"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 17:58:33 -0800
X-CSE-ConnectionGUID: /2lvl/1OST2tML4SeLKobA==
X-CSE-MsgGUID: Ueg8a4uyTi+OIuMzIksD9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="102798803"
Received: from daliomra-mobl3.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.221.46])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 17:58:31 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 0/2] soundwire: set frame shape and divider based on actual clk freq
Date: Tue,  7 Jan 2025 09:58:22 +0800
Message-ID: <20250107015824.5046-1-yung-chuan.liao@linux.intel.com>
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

Bard Liao (2):
  soundwire: cadence_master: set frame shape and divider based on actual
    clk freq
  Revert "soundwire: intel_auxdevice: start the bus at default
    frequency"

 drivers/soundwire/cadence_master.c  | 24 +++++++++++++++++++++---
 drivers/soundwire/intel_auxdevice.c | 21 ---------------------
 2 files changed, 21 insertions(+), 24 deletions(-)

-- 
2.43.0

