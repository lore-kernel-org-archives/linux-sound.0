Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583C33128CC
	for <linux-sound@vger.kernel.org>; Thu,  2 Apr 2026 06:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775112347; cv=none; b=DnUZ2wJbVVPBJxf8QvqGIF2eW0f5zwr2lwrUL98b046ph90N2p7FTQMiabSDKfgYO/I+0VvWu9UjeKErS5ldO5TCXZnuDaUWgtLy8gyU3p3lWqX3vY8/nRPr/s6uOhHYCWHk5ouItrbDyd9vkXY9WGurYhrlJLOVCYNFPHG2EkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775112347; c=relaxed/simple;
	bh=H8wN6vuXIB6xrKMM5/Qe9WTk/YECueSw6Zqy0kiS0FQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CtCOqG1oM0V+YKf0G31JBTZlHi5asiSRAh7jACvaSDY5PTm+O4ryIqHVHug02WJ6MRmCo14vWlab3N11Aii5Z5g99Ipg6PiMwe1RT5sGLmZcbqh6h/J12nmrZIWr3ttdJd9UhLwjhUx2psL5RAMniLaYOxpLM1Op773tz19W8Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gMfCxUSY; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gMfCxUSY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775112346; x=1806648346;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H8wN6vuXIB6xrKMM5/Qe9WTk/YECueSw6Zqy0kiS0FQ=;
  b=gMfCxUSYBAh/u67xYjkSGa9vNGKsD8fYzISldzlQPZ0xhPq1vYXMkE1+
   bTWUsBpVmJfGFdqncW3QyWW9ytlCD7KoYSY98t+T903YVwTYbwqCqAGz8
   LbdBZkZWRNHPnK7b0KKAeRn/kEMS5U/YBJg027qjJTJZq90Ugt5mYhFgG
   42fZKS2JRb6y2Kmr5jzLzXO7RE2z0LGdpx5XwtxaVtyKNuSnUUKzQux1n
   OwMg7nip3bPsrsibmrd7sWkATHHHDhwi28j9CuRLYrRNEyH9lWqSy9+R8
   ZGKoDh1SIcsF6EJpDOQ6ION2w98rRN1lhMXrokjABswBMNxJhsN35isQA
   w==;
X-CSE-ConnectionGUID: yaKbERvWR9qmAPGvgGr+xw==
X-CSE-MsgGUID: uWnrOb3pRwyuNmRljzmvmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="63715032"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="63715032"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 23:45:46 -0700
X-CSE-ConnectionGUID: 7J6Q6o8ZQ7q9fy6eoR6uZA==
X-CSE-MsgGUID: eqfcgNg1Rt6LDuIixd96YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="226059165"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 23:45:43 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	mstrozek@opensource.cirrus.com
Subject: [PATCH 1/2] ASoC: SOF: Intel: Fix endpoint index if endpoints are missing
Date: Thu,  2 Apr 2026 14:45:30 +0800
Message-ID: <20260402064531.2287261-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402064531.2287261-1-yung-chuan.liao@linux.intel.com>
References: <20260402064531.2287261-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maciej Strozek <mstrozek@opensource.cirrus.com>

In case of missing endpoints, the sequential numbering will cause wrong
mapping. Instead, assign the original DAI index from codec_info_list.

Fixes: 5226d19d4cae ("ASoC: SOF: Intel: use sof_sdw as default SDW machine driver")
Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index edb80c2fa770..5c1f1b97ae15 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1206,7 +1206,7 @@ static struct snd_soc_acpi_adr_device *find_acpi_adr_device(struct device *dev,
 						 codec_info_list[i].dais[j].dai_type))
 				continue;
 
-			endpoints[ep_index].num = ep_index;
+			endpoints[ep_index].num = j;
 			if (codec_info_list[i].dais[j].dai_type == SOC_SDW_DAI_TYPE_AMP) {
 				/* Assume all amp are aggregated */
 				endpoints[ep_index].aggregated = 1;
-- 
2.43.0

