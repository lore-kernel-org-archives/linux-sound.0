Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E053BFE52
	for <linux-sound@vger.kernel.org>; Fri,  8 May 2026 09:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778232760; cv=none; b=Zn0WAK9R+2ecWYGPTccxX1281PAryp3FJ1WQYYxHsmUIx8dc+WUj3wAdZVbO77+5JT0Tob02OB2J635xHSiJpxGkQtoGK+BNclhneocBLOH98ATXtM8yK3vOUvgFsOsawDqp01Z6RazWJ6sjDz+n3uxMEQ0tKHeMCosp/K6WlYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778232760; c=relaxed/simple;
	bh=kwrYbzYSUMWXpd6GDYQBQb9I74hfI0fvbzhT6J0co5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fakx8v2hKUN9OUgWaQyIoFOxgR8b7j2lPzNka72yUEGk0yGo/0e1kvfL3SvnSZB9XLgXYwnIoHkavRzCihNfCn0ajpy7jsfiGA3DDRh21rmn0uRYjMduV9uQYN72TomVLT/Zy+HNQ+A4n88LruUTUtj6+EIethh9zB1U51TSo0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k/FJKiVr; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k/FJKiVr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778232759; x=1809768759;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kwrYbzYSUMWXpd6GDYQBQb9I74hfI0fvbzhT6J0co5Q=;
  b=k/FJKiVrE/xrCjsxppHAgUucx243njc+0iIwI8j+622GUi2GV49FQRMH
   V+hFRd4277yIzbYpWr8OC5PEbBmkk2ntEmnbZtFnqikQJlUYpx6vlHZA3
   rt561cXx29xxvshbkp4Ff1+KfZndpdd0j4ytkTog3UAGLcXzJNSgvtegt
   f4NHxpwBCgUvOY8ViLN8rrbJrDXKbO/EcompO9KSRqU4DXD74TKNbQcg7
   8StlSFQU2pcxWbXfOJwtklqSsmmY98XjH3bL/gyCqsThs7T9NsbpXPjsQ
   2lySDgpFacD2N7En/vRfPCCs7sYjgfGhNu8eaih7AS5f0pebaW62UuSNJ
   Q==;
X-CSE-ConnectionGUID: NnxhqMPOTY218N/iXAspAA==
X-CSE-MsgGUID: P+ur8kObSDWVNE7VRsN3nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="96621869"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="96621869"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 02:32:39 -0700
X-CSE-ConnectionGUID: 6iDjx5iYQ0CfA6LKqU7Pdg==
X-CSE-MsgGUID: /BmdIHXJS6+OA42Zk/Dliw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="236840372"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 02:32:38 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	mac.chiang@intel.com
Subject: [PATCH 2/2] ASoC: sdw_utils: Add quirk to ignore RT721 CODEC_MIC
Date: Fri,  8 May 2026 17:32:24 +0800
Message-ID: <20260508093224.1246282-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508093224.1246282-1-yung-chuan.liao@linux.intel.com>
References: <20260508093224.1246282-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mac Chiang <mac.chiang@intel.corp-partner.google.com>

Add a quirk to skip the CODEC_MIC DAI when it is not present.
This ensures PCH_DMIC is used as the fallback; otherwise,
CODEC_MIC remains the default.

Fixes: 846a8d3cf3ba ("ASoC: Intel: soc-acpi-intel-ptl-match: Add rt721 support")
Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index cd4ed0e2677e..ede41c532c52 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -654,6 +654,8 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_type = SOC_SDW_DAI_TYPE_MIC,
 				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
 				.rtd_init = asoc_sdw_rt_dmic_rtd_init,
+				.quirk = SOC_SDW_CODEC_MIC,
+				.quirk_exclude = true,
 			},
 		},
 		.dai_num = 3,
-- 
2.43.0

