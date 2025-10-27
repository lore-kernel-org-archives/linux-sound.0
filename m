Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34C922423A
	for <linux-sound@vger.kernel.org>; Mon, 27 Oct 2025 14:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761573631; cv=none; b=jQzkV0v6LQxyZbr9fKCOOO6qyjaVqUV7XH4n2L50I/zVFYwi1JGsDjJeT8YJ8uBqd7dmkMZ91XtcYGTCvfVL2cZ6duPSyvD+e/ciX5QlvNhdcxniYVEzSP+NwgkyOiutWcY9f8hAXLMMki0ieSpChpvg5xS/L9CtlPqDTNH33q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761573631; c=relaxed/simple;
	bh=DQy1qmpbRGnpPa/4KfvJwpVsXCdiUYTl/0WdAEOgdbs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GYODJu1vEDEilin71wRIJP4/Gnm/bLhqi7HR9ZWvQ0JAKVNaiKT72DqXTH/fzc4PxIRCI5GfYo1GkL1gmvncRunt/8N31mlJDhID1/hK/Sd+gmXbXHa7NZfn2KqO0B0xky94lMVvd5un9ei3COltdqOzm7cbKNSh4yegvX9R6pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R2NRAPcX; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R2NRAPcX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761573631; x=1793109631;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DQy1qmpbRGnpPa/4KfvJwpVsXCdiUYTl/0WdAEOgdbs=;
  b=R2NRAPcXo0KDnuwiAKkjC0iCtaGoexps2TzTCQHlRdDru22EAwfkifAb
   6lArI0vy6Wgyxf/0URRaWniKauS6NcELFQZlzmkowF0D/zIUDWYJQLsMY
   NigXngTXc/ln9gNU2bf3xm1eOJRZeAWWBVGEcEeY++Q5LTy5+L2OM3EdQ
   m+y8govzJ68U6Wb7KzrZH3wHTam99VcPWDtdlAvBnLYwlBXFWUk8NEr7G
   icLBMOkp30PnZEwxkorgI0E6YDnInPynqEl9Q8VGV2UkmX6VvEZVm5172
   KnaFz+7cD8rRw1OWwQYX4h0EBm6l4pOpl2Dq2BJC0gbcy/CFDkqIPZA+/
   w==;
X-CSE-ConnectionGUID: B98mhmK+QYeLcbcc089JPA==
X-CSE-MsgGUID: AqmbO6B3Rl2dTDWng/z8AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81076841"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="81076841"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 07:00:30 -0700
X-CSE-ConnectionGUID: nRHgtSBDSxGBb8NYXhGm+A==
X-CSE-MsgGUID: OIhBFKpDQpK4vai/rTGf4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="184945546"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 07:00:26 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com
Subject: [PATCH] ASoC: soc_sdw_utils: remove cs42l43 component_name
Date: Mon, 27 Oct 2025 22:00:12 +0800
Message-ID: <20251027140012.966306-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

"spk:cs42l43-spk" component string will be added conditionally by
asoc_sdw_cs42l43_spk_rtd_init(). We should not add "spk:cs42l43"
unconditionally.

Fixes: c61da55412a0 ("ASoC: sdw_utils: Add missed component_name strings for speaker amps")
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index b4b25372b0ef..ebf77a836b95 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -691,7 +691,6 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {true, false},
 				.dai_name = "cs42l43-dp6",
-				.component_name = "cs42l43",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
 				.init = asoc_sdw_cs42l43_spk_init,
-- 
2.43.0

