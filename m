Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88CC23BCF4
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 11:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744024031; cv=none; b=Idea2q+TStPj5FRcTNvXvtmWkPAHKDJ2zFPRDHn7+Pb5/UMAUyTXs6RVvU4Q/nEPjYDIuzNa2kEgmsefrEeA9fpjpG8zX5nZqGmzbeo5vKx67ow3VtjVfpOn4ps7iE6B2GTP0GmijhfvTHEJpBAUv3TUbyBtWxAYqD71sHzgGpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744024031; c=relaxed/simple;
	bh=18LRpk7CTsSIHPWhW9OWiaP+thwNkhhDSOeSIEen/iE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WFwj42a3C6NpUT7tu3YJt6RVU6gqpiBSk73E0SL6rxAaXLH0PWYBFtBL5V5S0X12YTTwCNopjEbmI00vEdaeL4bIp77FHIEI3c/dAarrpJY0Vz1lIelyBInc32xs/q2O4d2lt7BLElinciVf6PhED3253PhDhhastvbL/Yg7hdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MQ0MSSoA; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MQ0MSSoA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744024030; x=1775560030;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=18LRpk7CTsSIHPWhW9OWiaP+thwNkhhDSOeSIEen/iE=;
  b=MQ0MSSoAgyRviNaebiY40sJcYSupXgD5fGjJS7bD4/pb64RNzHzA0bFs
   UE32tVwkIc1BEOBROlq7IkMBoVz0ctNlGKqWn6taThKxGiMEzjQixXoRo
   KH1ZX8WwBN2mzx8tiwoDWrrLsHo1X0bBY9DqA+boljtEQX1kYgNHIOFes
   l3bMuAWBEDPR8EArPv4WwsAyYvfwktvpfPJAZbNW3/YER0KQXBYo5e8n0
   LhrCOmGf3tEoAVsyc+XLyp4Q5jVChl7KrmrAdVdO+A+21PdGdffTXIsnW
   JXZm5MYK9gdrQikFoBJhTvdEThxhcdAVGwXhMwzmYMDffJKxzjH0+0Pl5
   g==;
X-CSE-ConnectionGUID: 0rUrd8OsTT29XldiKRpGBg==
X-CSE-MsgGUID: ++SCNVD1Rwi3i0kVzd0TBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="49057384"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="49057384"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 04:07:10 -0700
X-CSE-ConnectionGUID: FvZvqz7KQJiUYjwCNO/UUQ==
X-CSE-MsgGUID: +PtNZbodTWGPFS+e1IerjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127776338"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa006.fm.intel.com with ESMTP; 07 Apr 2025 04:07:08 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	liam.r.girdwood@intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 09/10] ASoC: Intel: avs: Add boards definitions for FCL platform
Date: Mon,  7 Apr 2025 13:23:51 +0200
Message-Id: <20250407112352.3720779-10-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250407112352.3720779-1-cezary.rojewski@intel.com>
References: <20250407112352.3720779-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

Reuse TGL definitions to define boards configurations for the
supported ACE platforms.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/board_selection.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
index 2d706edcbf92..6f943cf1da20 100644
--- a/sound/soc/intel/avs/board_selection.c
+++ b/sound/soc/intel/avs/board_selection.c
@@ -394,7 +394,8 @@ static const struct avs_acpi_boards i2s_boards[] = {
 	AVS_MACH_ENTRY(HDA_ADL_P,	avs_tgl_i2s_machines),
 	AVS_MACH_ENTRY(HDA_RPL_P_0,	avs_tgl_i2s_machines),
 	AVS_MACH_ENTRY(HDA_RPL_M,	avs_mbl_i2s_machines),
-	{}
+	AVS_MACH_ENTRY(HDA_FCL,		avs_tgl_i2s_machines),
+	{ },
 };
 
 static const struct avs_acpi_boards *avs_get_i2s_boards(struct avs_dev *adev)
-- 
2.25.1

