Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65E3C2ED
	for <linux-sound@vger.kernel.org>; Wed,  5 Mar 2025 13:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741182093; cv=none; b=AYMDxpz2xDPV8YAP0HqXDc9UWz2dHXryNaP8LTW6oKn5cbTnBsYLrhlcU3TKq6qCHyRFVqkLziP0uawpn5ygZc1ZDBdxOWqpyeemwe/ZjSjhXViJcrZGNeGGTvQ32X99CxZMLW6xlNKGpNmZ5UQncV4UFWjBPgCgo7xV8Iiaerw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741182093; c=relaxed/simple;
	bh=xp/nrM2yBmHCvutZ+R98Rcw8K2Z6ppMgl+77xBtXfTM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=N5q/doOuuTU0Xps+YeI+0y/BoI7PWnpBDJPDhiDXmbcTDckqv5t4YOcHV2YZm24afAv7Tm4WJqyMxJXSJmB2X/PFBG3dretNc9stawdBEwvw/ExJ8GNZg8uChjL9GYJEyxeG9vM1PUdGEY9QQTA3imT1W2fzi5biU3SrLsq/hEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KGO9td+t; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KGO9td+t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741182091; x=1772718091;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xp/nrM2yBmHCvutZ+R98Rcw8K2Z6ppMgl+77xBtXfTM=;
  b=KGO9td+tinpBonqU+yoQ/2u+9Sjv+CamnDQmRWi5s67YQS4bad/zgQm4
   h7TRW577StC3p95dfvaPvGBAUBKiAvZuyRcFHVeMTDt+ZPFW6hMoh5uCi
   XUnp0bcK8yUM+3xr2CUS1Fu4qy6NV8x3UYjxpocCVNocfM6hFBfQVi/QH
   xykLP7R4FXR++2v4j7Rk1fh/P5l8GUodraQm/RSX/CN9/42T0TBPRzB8g
   0uwp863TY70JY2/s/kf0jljSZ12iDgNVM+u04TeoctwQkbRQxpjqoSk4U
   SHyZ9khMxpPSYVFTxXL33qOCW5Ll/8Bl4sNqNmRS8cKy6LzA9IFcOET6z
   g==;
X-CSE-ConnectionGUID: tIgruDZDRHCCL2l7ChX37g==
X-CSE-MsgGUID: 3cMWujxYQFynVapZ+M0ndw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52348705"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="52348705"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 05:41:31 -0800
X-CSE-ConnectionGUID: Ih1nsSBMQdGuAH5PLrzF0Q==
X-CSE-MsgGUID: 3MQ5nBOlSLOCkYeYekgP7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="118515298"
Received: from bvivekan-mobl1.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.175.91])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 05:41:27 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH] ASoC: rt1320: set wake_capable = 0 explicitly
Date: Wed,  5 Mar 2025 21:41:13 +0800
Message-ID: <20250305134113.201326-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

"generic_new_peripheral_assigned: invalid dev_num 1, wake supported 1"
is reported by our internal CI test.

Rt1320's wake feature is not used in Linux and that's why it is not in
the wake_capable_list[] list in intel_auxdevice.c.
However, BIOS may set it as wake-capable. Overwrite wake_capable to 0
in the codec driver to align with wake_capable_list[].

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Acked-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt1320-sdw.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index 3510c3819074..d83b236a0450 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -535,6 +535,9 @@ static int rt1320_read_prop(struct sdw_slave *slave)
 	/* set the timeout values */
 	prop->clk_stop_timeout = 64;
 
+	/* BIOS may set wake_capable. Make sure it is 0 as wake events are disabled. */
+	prop->wake_capable = 0;
+
 	return 0;
 }
 
-- 
2.43.0

