Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA63D1DE891
	for <linux-sound@vger.kernel.org>; Tue, 29 Jul 2025 11:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753788096; cv=none; b=niJml5522bAvhmszmo85T7Xk5799OnYM/3EZco4pCtP8mY7fONVVrwbJ7W0VK7df396j8Gic+5gyqRG7dLeuPasbKP+TrD7FUBTb1ZZ8rrQdV3El5YSPn1P2Qi/+ug8q2EXRFvhGca0gnx3LrWoMIpUX0KOZRaFYtZxGf+5UA6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753788096; c=relaxed/simple;
	bh=xU/qCTw6PvU569fg20V22yIqQE0VpOf8Xs0vprQRAGI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=kCjaK/MVC4T6s2BJxyIVk3fufSHILM8pbSpk5lNdu0UUWEoFoHEzNlt5CPh9x6VCx0HhYI9qI6XKxo0SJHMbmqgUroastB5yJbMYIC+SkZawyQ4uS+t95zQb4sKGBKzDj4XETasOSQYF5QL+NxhJYhgrnSjmxwPouiTBAqCNEag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RRCS40tW; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RRCS40tW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753788095; x=1785324095;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xU/qCTw6PvU569fg20V22yIqQE0VpOf8Xs0vprQRAGI=;
  b=RRCS40tWc4YL6jmf/u4r7FbMndaEY+wDTTclHp5cyXwvWCdHiDE5voDh
   437aWne1dZCe2mqrYdR2YYj0OvA0WyHtqfC2mC0CTVkvk6YDuHNpcB2TQ
   KjRROwbXmpcZ4HqQkR+2sYSgd0CVOuwOxls72Ri/XKoi4PVshCxvlpTCY
   u3MJTn3XTe2TMrobP/Nc1Qdnnbyr0+u1/l/pdGUrou7flaFe78c9ygJ/f
   sXF4v8fJRiAdS+YZHZXiUsZIKYjcbCwBiw7QPCVsAAmW/FmS1fNaC6pcC
   BnXDPZ/HGhF5UrKGFx1Diqx4Zwqc3CQ7nONvHX86oLh92/CntXLAjDYig
   A==;
X-CSE-ConnectionGUID: hmfp9IqOQ7yLrDvFxn9cxA==
X-CSE-MsgGUID: 9a+3LBuRRSOGH5fTHLsELw==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="67137326"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="67137326"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 04:21:35 -0700
X-CSE-ConnectionGUID: IKZCLs2eSb+bPZFTXTqOxg==
X-CSE-MsgGUID: tys+vLQFQSGhSzYwgVkD3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="161945128"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa006.jf.intel.com with ESMTP; 29 Jul 2025 04:21:33 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 0/2] ASoC: Intel: avs: Fixes for avs_pci_probe()
Date: Tue, 29 Jul 2025 13:42:27 +0200
Message-Id: <20250729114229.309472-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Two small changes that aim to improve code quality around error-path
area for the avs_pci_probe() function.

1) The synchronization-change is here to make sure both happy and error
paths are streamlines, no functional changes there.
2) The fix addresses null-ptr-deref and similar problems is
pcim_request_all_regions() fails.

Cezary Rojewski (2):
  ASoC: Intel: avs: Synchronize happy and error paths in PCI probe
  ASoC: Intel: avs: Fix uninitialized pointer error in probe()

 sound/soc/intel/avs/core.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

-- 
2.25.1

