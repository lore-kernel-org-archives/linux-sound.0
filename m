Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108561A0BFD
	for <linux-sound@vger.kernel.org>; Thu, 12 Sep 2024 12:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726142613; cv=none; b=HfDaXlYv2I3K0JEduooLF/NTvlsRB4vRLxsySQCkRcyNCRakyY6SEX0D90a/QaCeAcf7+4rIgj6BV/xx6xe7U6F3sR1lVIB3yqEKzScZpry3NLl2XwiyDkhCgo0anjrUg6M+l5Y8KIAiR4DZZGpgGhmqhfIhdQ0vfyd/9s9WrPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726142613; c=relaxed/simple;
	bh=yZhP2xmJEUfYuCKL+dlYAtUSzAdTI+TZ8PJ8BI7MthU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KwL1CVmkOKHBiTd+7lF7iEg3joHNEdpVaHkOKHvQZ3n6IhCSqC629LVBUMvalGxJw/XmC+zLsvDSSOtb3a+QUKNIeiwindFzZ40/sTQidxvn50hfX8L7fFizU9xCHzZXuQwC/uHHq5RBitjImokh/mgqtsrITYysHOHP9HtEVJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=egYUbYpu; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="egYUbYpu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726142612; x=1757678612;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yZhP2xmJEUfYuCKL+dlYAtUSzAdTI+TZ8PJ8BI7MthU=;
  b=egYUbYpunKvIEQVJgLszrubvvyO2aZ0W1o1OPr6BE3f0+RWeY4riySIR
   w+40FLB4ZU2BafR39Mn+aWI8Bskb1+YGEB/9i/aLypr8VS3a4CVN4w7hJ
   ESYGvocaEUq4vR2fAS1yc0JhmDL+mAMacRZnzkBfGPir65E3I/L3S5G+a
   sZmx/Tv1vzbrMKKQzqsewAnlYV6O2mXQd6LZspNbIkbAnQjc7DNdRVY8g
   WHRa1LCunEmYh6Zf9uYkJbm85PlW2bJYcGWA1iGGQCHtxRrid4Z7lsfmh
   b3ZXahECjKIkRbC7YxL4ZxFRoT0OB4oUnoP2JFbpzE/pXuZ5Kn7U+ojH6
   g==;
X-CSE-ConnectionGUID: 3keizsbnTUKCrV7VcQQM0g==
X-CSE-MsgGUID: XEot1WwmSr+0F0SSsZZhfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24812776"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; 
   d="scan'208";a="24812776"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 05:03:26 -0700
X-CSE-ConnectionGUID: IfW4mWatQuS6aSh7iWOyWQ==
X-CSE-MsgGUID: o6XkTrzqREeDQAwaEh/WsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; 
   d="scan'208";a="68459168"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.119.14])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 05:03:24 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 3/7] ASoC: Intel: ehl_rt5660: do not check common_hdmi_codec_drv
Date: Thu, 12 Sep 2024 20:03:04 +0800
Message-ID: <20240912120308.134762-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240912120308.134762-1-yung-chuan.liao@linux.intel.com>
References: <20240912120308.134762-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

The variable common_hdmi_codec_drv is always true on SOF platform so
we could remove the reference in machine driver.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/ehl_rt5660.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/ehl_rt5660.c b/sound/soc/intel/boards/ehl_rt5660.c
index 26289e8fdd87..90d93e667bd9 100644
--- a/sound/soc/intel/boards/ehl_rt5660.c
+++ b/sound/soc/intel/boards/ehl_rt5660.c
@@ -256,8 +256,7 @@ static void hdmi_link_init(struct snd_soc_card *card,
 {
 	int i;
 
-	if (mach->mach_params.common_hdmi_codec_drv &&
-	    (mach->mach_params.codec_mask & IDISP_CODEC_MASK)) {
+	if (mach->mach_params.codec_mask & IDISP_CODEC_MASK) {
 		ctx->idisp_codec = true;
 		return;
 	}
-- 
2.43.0

