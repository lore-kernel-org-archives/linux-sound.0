Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A5778B57
	for <linux-sound@vger.kernel.org>; Mon,  4 Mar 2024 19:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709579074; cv=none; b=orkdp2GWkKz+zy2aWb5yh8LucoHUttDin2s/OI+VcD/CD8PjwJIN8CDzrOKpNR4iWU2a9FKvS+K+fXIn4xODVB4ZMQAoofmhD2uam3Y/O0OAgssCfO2mRosYSyEv1lkUt1Z32pHuqkfvDSJ9Mh/T3xX1U/XH2SP4UVp3gl7xZZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709579074; c=relaxed/simple;
	bh=j+q5dWt1plxctsU8WpiPca8LVYrRcW5b2lgmqcYGMdc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZuVC0Y3ukZaqZLylNs14PsVMFKuILrN0KM7IOeKgAn1SwemwZXpHs8xS14zejsQLKjbN9Ax5av4zCnBxD8NgUMAHzc+ktFyiSr/UyRRigExeUgICie6pxlNmyb69w0ntGsemR8ecWFfXLgzRBEqM1pE/gdxLcx86AqBdwTbGshg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hx5aVwd9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hx5aVwd9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709579073; x=1741115073;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j+q5dWt1plxctsU8WpiPca8LVYrRcW5b2lgmqcYGMdc=;
  b=hx5aVwd9GjmjmgHNFBf3W3LUljxYkCMGhsO579vMr3TSsQ+B0bErO17Q
   UAKyriZLdjDOzwTx8bo0n/2PDSa3vDSEtAxmOYIY61V1ghVVaIMgtpbXx
   NJX7yXbD6iiAmY4BpiCiCCvMyrnmcERLcgM4YVSJfrU0KrZBd9fw/qBFC
   lFDVXyWGqyE9FtKp5ayP7T+9kfDHKQvjUQqsbTQc9oQvk/tKb7WhRYV8g
   5Q4FTSBLTwr9p6RCt3fjiOQxI7SO6VcuPWA5il6ZgfeF7nO2Pb8e4c8Ns
   r2t17RMGpPpJijS/rI+qPo8jblSx1ndji6vMAFcqZVYf9zeB7i56JdO3e
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4257283"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="4257283"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 11:04:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="13788285"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa005.jf.intel.com with ESMTP; 04 Mar 2024 11:04:28 -0800
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
Subject: [PATCH 3/5] ASoC: Intel: avs: ssm4567: Do not ignore route checks
Date: Mon,  4 Mar 2024 20:05:34 +0100
Message-Id: <20240304190536.1783332-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240304190536.1783332-1-cezary.rojewski@intel.com>
References: <20240304190536.1783332-1-cezary.rojewski@intel.com>
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

