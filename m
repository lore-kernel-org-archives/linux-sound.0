Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294B53815D8
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 08:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779957200; cv=none; b=GzMGG5eRIYyqe38Bxa7XW9v+zX3janXPyPXBUzRig33arV35RZfIrUszte3xdyOirwRRiIYfb31qHiyVWF2GSYIUh0FOs5CTb8rBeghjs82PZ75LEYhxO8mDvo6lS62TE2YDMvbziCGybob/MsBuFrEoWyz5BtUbjJiulajoKFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779957200; c=relaxed/simple;
	bh=IkJEc2XUjzSZl/kd5RxoG1fdb8QYXjGJ+Y1FgDFKSuU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kNDFJYAO/38oA8PmxztkKfH50+vz6dvabJniJnSOo1gTD2O4D/Sz69Gvy7NOjwH2ixxz302dOFaib2TqQAuXmT5jFJ0xCAqWsyAmWG5+aDWIcaL/a4gwkP2JqGiAOM6J/JKUWUXN/TIrOF0Q1JakcUO/rmTw4INFlup90VPErOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mhBJ274K; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mhBJ274K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779957199; x=1811493199;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IkJEc2XUjzSZl/kd5RxoG1fdb8QYXjGJ+Y1FgDFKSuU=;
  b=mhBJ274K7VdFOFCtqe/cBVzYohoDNPQslu7wyoXcgVGNpNsKiEJL9d0A
   rgcCxUAEcQoWzAsZbe9MrOnrtzvlMz1uxKP1yM9DV1JRRsLprRPV1jyGK
   hq+PDTNOJntc3s9rLyTqE01ehTIDCmrZPkgRtSi3/UzeMje06xrP0ty6Q
   BolXyN0sw9apKrGP9NIhVyPQ8Hw84CVJdMcqb+MS4MZ5jo7wN+miNTjAu
   q4jjeWfCFB/mQfOtqjlcRfpjHofeWvCmRBUFGOia0Kr9yNRqGcHQHspTR
   pKRO23wIiYVm77b6nIEEsscUcaVqcxV3F7lxd+UfXEAn0v0eehbqc8w+X
   g==;
X-CSE-ConnectionGUID: wjOcsppLT/K4tHY7gOodSA==
X-CSE-MsgGUID: m8I2z9pDQHa371HnEV8Keg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="79828689"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="79828689"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 01:33:18 -0700
X-CSE-ConnectionGUID: /FCqVdsRT5u70Yje8aekCw==
X-CSE-MsgGUID: 7+85LFEyQZaGK3MWVSVe/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="266390259"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa001.fm.intel.com with ESMTP; 28 May 2026 01:33:16 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	krzysztof.hejmowski@intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 3/3] ASoC: Intel: catpt: Print error code if board-registration fails
Date: Thu, 28 May 2026 10:34:44 +0200
Message-Id: <20260528083444.1439233-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260528083444.1439233-1-cezary.rojewski@intel.com>
References: <20260528083444.1439233-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Message alone without the code does not tell us much.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
index 6fe212f498c6..b0a926db483c 100644
--- a/sound/soc/intel/catpt/device.c
+++ b/sound/soc/intel/catpt/device.c
@@ -154,7 +154,7 @@ static int catpt_register_board(struct catpt_dev *cdev)
 					PLATFORM_DEVID_NONE,
 					(const void *)mach, sizeof(*mach));
 	if (IS_ERR(board)) {
-		dev_err(cdev->dev, "board register failed\n");
+		dev_err(cdev->dev, "register board failed: %ld\n", PTR_ERR(board));
 		return PTR_ERR(board);
 	}
 
-- 
2.34.1

