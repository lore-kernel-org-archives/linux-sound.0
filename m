Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71DC3ED5B8
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 09:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875152; cv=none; b=G1IlS5lidTZNKlKPd0UgF13tWaumiK/Vpi7woQ/gtuu1Fbq3XxDx2LS0RFxx2aI/RxeksauYN+LEEklotQalzR6URGpziuMQLnnu7jfX4CdvBzw/UO4A59x4W1ZwwmOGi/+9WS5UAGFRHjlZ5LI0n0ybLHpNoXH4XE3ZQcYPccU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875152; c=relaxed/simple;
	bh=IkJEc2XUjzSZl/kd5RxoG1fdb8QYXjGJ+Y1FgDFKSuU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oPStQAJ0wFghAlfeMdFJQYax18mhmczf4cd5RMf+Wmbno/wJRESp+GhoStgq/+ldQHVLa4gwwi0yxA204hMTQw8et56CUXVkLHZ9EAdofmvaYV6+xbAJ9r39lI6r4KzpNiI5cIL0YjrfhkGuPXFCFNjuoJGRTnZGERq8MToGbmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jF5PRvlT; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jF5PRvlT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779875151; x=1811411151;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IkJEc2XUjzSZl/kd5RxoG1fdb8QYXjGJ+Y1FgDFKSuU=;
  b=jF5PRvlTFVADZ/99qd+a1PxeJfgmtQSvG3PG5u4TM/BTzM7Y3djLaqbt
   58f2/qUkhhRscxQXw10klnjoE7O03//jKAVhYDVmpNVRZletWxQKmRpGC
   HVew+7RFLeEkYqY24sWln3/tCt9FjQkWQcBeCYMwxXDV+JiXPp87e1+Jx
   H+533txuiY6e8jr79tw7gBmLqW6Kuj/Zbjzl/MrS7QSbis0Sb2M3v+i9P
   R3fULrYAJGDse8PG6qEBGze00vsjFW08JpoVjiNL1v3sO4343Vw2dByc2
   tiD5dyXjMtfubKBeYP15g1KTHqtNVFmtgJtSElhN5fx6GqwwU8zKmrpu1
   g==;
X-CSE-ConnectionGUID: MLaarNs2SOSyPKMonGRBnw==
X-CSE-MsgGUID: Y9TwsfeCTYyCaYwHsYz6aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="84592703"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="84592703"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 02:45:51 -0700
X-CSE-ConnectionGUID: lemQXjgPTOO+2utiQN8BGQ==
X-CSE-MsgGUID: zc5ZtFNZRA2zXv2bSV2CvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="272519689"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa002.jf.intel.com with ESMTP; 27 May 2026 02:45:49 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 3/3] ASoC: Intel: catpt: Print error code if board-registration fails
Date: Wed, 27 May 2026 11:47:07 +0200
Message-Id: <20260527094707.1432195-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260527094707.1432195-1-cezary.rojewski@intel.com>
References: <20260527094707.1432195-1-cezary.rojewski@intel.com>
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

