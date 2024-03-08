Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14C052F7E
	for <linux-sound@vger.kernel.org>; Fri,  8 Mar 2024 09:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709888612; cv=none; b=qapK/GPoGoEBJVFhnzmthUCqfd7Hafv6v50v+KrwlE0VvpYuKT5qVg4nT0Pqvylv+u7tf4k0PmM/TGmzWFsTLbrTHrVuP3eqko2KdcY1a+Pt1yFU6PiqorE3HTbc1LC+arPR2KD3Yjq8+c2VpMrk34EDBWz5jD0uyieFbjOJMJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709888612; c=relaxed/simple;
	bh=j+q5dWt1plxctsU8WpiPca8LVYrRcW5b2lgmqcYGMdc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oKIIWqVy5/iyr0uk0pJyJ8oFTA0M6YtIx/ILrIizIXU/tb2fY7DnDAkYwLIR+WtM3Y4sAq2H2nTAIy7OwUwCO6oFn5WrUZXfndULBidE75hrvVYyI7cSn/jkVRsEjk/COf1Pgm0ftqe8w/l5hU6cOEkatm0zfdWuApFo5T5Jh8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SSyMm1hv; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SSyMm1hv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709888611; x=1741424611;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j+q5dWt1plxctsU8WpiPca8LVYrRcW5b2lgmqcYGMdc=;
  b=SSyMm1hvDu5m+GmLGQhbsr+3KAUqSRc3+Paam3aNMLnPmy5uSWI5A8Kf
   NsvBpOIVCJxDP3HDTMKwW3wf9IADvoCAYTpM6cgcstE4VlkhHrBM+hUQd
   45si3r6DVTrptRWFIzEE4lD/v9fI8941orG6ZJbAxfUJnwIZ2SXK5uAxu
   WzEEQduvpJQzArQQ2jv6sSQDq+Y5uuJ8kNkeOLskNAwa0WxTIcWKlCrCD
   546k16Veu2+4Uvzlw5RTTLYDjJ7L8QUyVO1bEI7kHZfivgnoAFgHKdJ6Y
   6aH/P2pEA9Y+GKoiz4+/4QkyFqYmlMn6aWkXvkRtE6XILOTAmItYNhDFB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15247006"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="15247006"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 01:03:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="10419278"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa010.jf.intel.com with ESMTP; 08 Mar 2024 01:03:29 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 3/5] ASoC: Intel: avs: ssm4567: Do not ignore route checks
Date: Fri,  8 Mar 2024 10:05:00 +0100
Message-Id: <20240308090502.2136760-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240308090502.2136760-1-cezary.rojewski@intel.com>
References: <20240308090502.2136760-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A copy-paste from intel/boards/skl_nau88l25_ssm4567.c made the avs's
equivalent disable route checks as well. Such behavior is not desired.

Fixes: 69ea14efe99b ("ASoC: Intel: avs: Add ssm4567 machine board")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/boards/ssm4567.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/ssm4567.c b/sound/soc/intel/avs/boards/ssm4567.c
index 4a0e136835ff..b64be685dc23 100644
--- a/sound/soc/intel/avs/boards/ssm4567.c
+++ b/sound/soc/intel/avs/boards/ssm4567.c
@@ -172,7 +172,6 @@ static int avs_ssm4567_probe(struct platform_device *pdev)
 	card->dapm_routes = card_base_routes;
 	card->num_dapm_routes = ARRAY_SIZE(card_base_routes);
 	card->fully_routed = true;
-	card->disable_route_checks = true;
 
 	ret = snd_soc_fixup_dai_links_platform_name(card, pname);
 	if (ret)
-- 
2.25.1

