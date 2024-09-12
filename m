Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF491A0BF7
	for <linux-sound@vger.kernel.org>; Thu, 12 Sep 2024 12:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726142615; cv=none; b=SUIXpfevPvXC4gATA1K+eOCI/1N0LGtdpjz5QpAKPi9plosEhQEEfy8IyG913dgoaNtvVqSXCdIjOOvJdTnG3xiQwaRHLKUqp0MfnEn6iWm4MTF2HXJAzNxxqSF2+D/najD4WHBA4ifynYtZpKvnd1g1n3ZyZFRc+/t0ckHIJtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726142615; c=relaxed/simple;
	bh=Pl865cnIKOAZRPbGTwMrsc3uFn8+kgQUiZB0h6AiTEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gmr/Ctdt9z6CLldNKQbbucIhkBQK3vxVHb42A9Gj0Hj5dJ5hzCINGZBna7+DxeQhDOVOf4HMTtLZfPJbtohq0+ZZAZHzMzRa1yrTCzxXuDJY5HgzPc6KAyUzWK8xPFW4BtrWVsdjGalymQ27g+aHin1qGfXZVGsL1qbewtCG7WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a+7+LmXe; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a+7+LmXe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726142614; x=1757678614;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Pl865cnIKOAZRPbGTwMrsc3uFn8+kgQUiZB0h6AiTEc=;
  b=a+7+LmXer/c9DFoRVvnXE7/SUKpMZMSlxG/Ma+sESG6E8kAjjg//F1JQ
   5iB/pIBw+wd+H5awK5+ZuvcisQG35OtVCsAuiLHsn2JTC8MqMQWZEFZ8n
   GCrlGwpAImPKUEipXtO6GuJfkogJnzXszzzT8Uk4WHfJ4MWHz4hWv3/7t
   WgbDCzKyzfb7rOoXq4xs56DUeOom1C1IKXIz18/XEB0oyWRPWuDFOK81j
   sE2PWKeCVcSF+UvC7+xVIlq882wPd6JuUTb1OTUtOiPMmUcZOGHYMG3aF
   71F9z+tjc0fcVY3Hx6ywokIesjUef/7ROSIh70tIHIrq6oBwBuCB530xc
   A==;
X-CSE-ConnectionGUID: VAWpuDuUTU+iIvuBMOG82w==
X-CSE-MsgGUID: vBFmBuz6T02+RqS8mFsb0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24812781"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; 
   d="scan'208";a="24812781"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 05:03:29 -0700
X-CSE-ConnectionGUID: 1fEnGL9UQyaM86KPK8nv+w==
X-CSE-MsgGUID: aiK2B+12RYSsv5TZk2bYDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; 
   d="scan'208";a="68459178"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.119.14])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 05:03:27 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 4/7] ASoC: Intel: sof_pcm512x: do not check common_hdmi_codec_drv
Date: Thu, 12 Sep 2024 20:03:05 +0800
Message-ID: <20240912120308.134762-5-yung-chuan.liao@linux.intel.com>
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
 sound/soc/intel/boards/sof_pcm512x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_pcm512x.c b/sound/soc/intel/boards/sof_pcm512x.c
index 5de883b9563e..8d237f67bd06 100644
--- a/sound/soc/intel/boards/sof_pcm512x.c
+++ b/sound/soc/intel/boards/sof_pcm512x.c
@@ -371,8 +371,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 		sof_pcm512x_quirk = SOF_PCM512X_SSP_CODEC(2);
 	} else {
 		dmic_be_num = 2;
-		if (mach->mach_params.common_hdmi_codec_drv &&
-		    (mach->mach_params.codec_mask & IDISP_CODEC_MASK))
+		if (mach->mach_params.codec_mask & IDISP_CODEC_MASK)
 			ctx->idisp_codec = true;
 
 		/* links are always present in topology */
-- 
2.43.0

