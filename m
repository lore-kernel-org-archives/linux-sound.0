Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F38F3375A4
	for <linux-sound@vger.kernel.org>; Fri, 21 Nov 2025 11:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763724203; cv=none; b=YcPX8CuNQsKiuIDWbIBIgXAh1nLpITswNrE/P5KL3rj46IF/kVaiU7O6p37fsjtFhJHAib6Rm/tDl8QIj1Sk7Id0B5kUYdHYKaFVKWRfpF/0ilibtjQylxutHCrxg+X34U0SrL+GC5/HKsBaW32q2KIbhSZ/H3UAyDsq56vw19k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763724203; c=relaxed/simple;
	bh=Fhdq24nUjPTgfqQ1b9T4jF2dDrHhSvv3jQK0PmnLiWw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NkTT2c/yfBviC1XFY6yUw0qdNkuoZ4OadhMBcpcCV80PsNhTO4onUvR8ux1zXRm1Prr3LTrRP1/yAS2wOy8PYBo8IkgUnM6gEmL1jDKn2PYLRO7I4aL5Ce6It+vgFdLUUBVQknDc35j1wrrCca9nGDaya/+wSjgGl7mK0cp4lGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TsfOfAAN; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TsfOfAAN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763724202; x=1795260202;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Fhdq24nUjPTgfqQ1b9T4jF2dDrHhSvv3jQK0PmnLiWw=;
  b=TsfOfAANMkBKPRhaTz978d5Mrju56hZjMZOSnZHhGyobKTaJZhbpz0x7
   UJ8aNpLy9jJGsSm1S6h746EJ6dOCite7f/0b35Q7nU/blmOGmF8zJ+8Zn
   t7mxW+VCeNH3zkDCv9qaNW1Gm/SrV0+1EhXzx+JN+PqlSCiG+K//hxHYF
   p6X0YlRD4rvExrGymhvSWJh5oNyGyE94EyMBlWnlvsFO9JRKa3l7DqP2h
   LoUo9Vrnhpqv2P6T65FEJ+FdsWOx1TyT3iOrf7hPRgkUS8OdZLKEadbb3
   vv0uUN8TdmU1XBqjc0zkDJ3rmAr17Ufb4StK4GpKtWJwBpF745kdow/mH
   A==;
X-CSE-ConnectionGUID: j0/r8wOWTcm72ZqWa5R97g==
X-CSE-MsgGUID: 6AbVDpO/Stuep2pzz4IpOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65845944"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="65845944"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 03:23:22 -0800
X-CSE-ConnectionGUID: TNTfvTytRrCyposK7VpIQA==
X-CSE-MsgGUID: bS5gBkDiSOKgCTi87bUTkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="191462851"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa009.jf.intel.com with ESMTP; 21 Nov 2025 03:23:20 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 6/6] ASoC: Intel: catpt: Drop catpt_runtime_resume()
Date: Fri, 21 Nov 2025 12:43:31 +0100
Message-Id: <20251121114331.3841335-7-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251121114331.3841335-1-cezary.rojewski@intel.com>
References: <20251121114331.3841335-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function provides no value over catpt_resume(), use the latter
directly.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/device.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
index 08788b390874..61eaeca2cacc 100644
--- a/sound/soc/intel/catpt/device.c
+++ b/sound/soc/intel/catpt/device.c
@@ -124,14 +124,9 @@ static int catpt_runtime_suspend(struct device *dev)
 	return __catpt_suspend(dev);
 }
 
-static int catpt_runtime_resume(struct device *dev)
-{
-	return catpt_resume(dev);
-}
-
 static const struct dev_pm_ops catpt_dev_pm = {
 	SYSTEM_SLEEP_PM_OPS(catpt_suspend, catpt_resume)
-	RUNTIME_PM_OPS(catpt_runtime_suspend, catpt_runtime_resume, NULL)
+	RUNTIME_PM_OPS(catpt_runtime_suspend, catpt_resume, NULL)
 };
 
 /* machine board owned by CATPT is removed with this hook */
-- 
2.25.1

