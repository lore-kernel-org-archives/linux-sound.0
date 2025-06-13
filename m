Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513B91E5206
	for <linux-sound@vger.kernel.org>; Fri, 13 Jun 2025 16:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749832587; cv=none; b=L+FRv9Xd8/NTbfEDcKBDjW6WEup6qo9JxeQ2x1DdsfbC+sS8gY4OsVmiaT3P+SY4JQtn1osUEKo0ERRyiqBNwAqaNyMtYvI2FTFvL6jFRBh1h5v6miE/FE9LLSe0LjsCCHwXhqwnsWEIiw/IVR5jxAB9aMaox7nMlQ7QznvkunA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749832587; c=relaxed/simple;
	bh=g1XSuWIHwWc44focdtp8wOAM0TQEgX6inz/PxMgrpj4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=c4RGBFM/0JzBARjk4IDrofIsSo61yddI+kSVD51GNnDzJl9A0KV7HrI6Fn+oyISM6gAChjve8P/tPfYK3KDc+eJoVs3KjgBMwyyifAhFS7OKpdj31ZWguCLDBKuIEd0hg4MnN1WKemMjzVmH5c+M+hriuTNb5UHNVLhCkzf5kDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EcvPhsMx; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EcvPhsMx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749832586; x=1781368586;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=g1XSuWIHwWc44focdtp8wOAM0TQEgX6inz/PxMgrpj4=;
  b=EcvPhsMxXclcptyigMs43ygYRhA3QUlClWc/tyr+o7HlCJcb4olbhRQq
   KHAHeHWuJOBhzWVAmJC8BT5m4kj3EXFZkSRTqUzu+yOtlA1grRiq89fqy
   QfjAvk7IvpWv28txieBhivdkzs7ejDoNYaVXee4Yg4oEafpBjxhs++44c
   Me/59F5KVkKPz6bUXXIwj9+ZNHD1BWEoC1TUHHTdN9rMN0J37uyyqi9Oa
   8YClMSlA4h524xZ/8RDzzAZMB2QtMeLl1CYd8rCfHPnFJqTxV0W+DLdtj
   XQ+3+6mxqX7uvLqHpeFMxG4fixPnGDwOPs/BZcs31oUcxt0NtIPfNXI5f
   A==;
X-CSE-ConnectionGUID: Dg61QCbqRS6PYtsI/W3vyw==
X-CSE-MsgGUID: KCESYwK8RtufGn5/rmfBpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="55728377"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="55728377"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 09:36:25 -0700
X-CSE-ConnectionGUID: /rVRdw37SKCgwB810QmCEQ==
X-CSE-MsgGUID: TpM71zcwTNqEXIKQD6lKdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="148769965"
Received: from jpp-desktop.igk.intel.com ([10.91.221.24])
  by fmviesa009.fm.intel.com with ESMTP; 13 Jun 2025 09:36:24 -0700
From: Sachin Mokashi <sachin.mokashi@intel.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	tiwai@suse.com,
	pierre-louis.bossart@linux.dev,
	Sachin Mokashi <sachin.mokashi@intel.com>
Subject: [PATCH] ASoC: Intel: Replace deprecated strcpy() with strscpy()
Date: Fri, 13 Jun 2025 12:35:30 -0400
Message-Id: <20250613163530.1165690-1-sachin.mokashi@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

strcpy() is deprecated, use strscpy() instead.
As strcpy() performs no bounds checking on the destination buffer. This
could result in buffer overflow. The safe replacement is strscpy().

Link: https://github.com/KSPP/linux/issues/88

Signed-off-by: Sachin Mokashi <sachin.mokashi@intel.com>
---
 sound/soc/intel/boards/cht_bsw_rt5672.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
index aaef212cf44e..54c1894ee96a 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5672.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
@@ -14,6 +14,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/clk.h>
+#include <linux/string.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -458,7 +459,7 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 	if (!drv)
 		return -ENOMEM;
 
-	strcpy(drv->codec_name, RT5672_I2C_DEFAULT);
+	strscpy(drv->codec_name, RT5672_I2C_DEFAULT, sizeof(drv->codec_name));
 
 	/* find index of codec dai */
 	for (i = 0; i < ARRAY_SIZE(cht_dailink); i++) {
-- 
2.34.1

Intel Deutschland GmbH
Registered Address: Am Campeon 10, 85579 Neubiberg, Germany
Tel: +49 89 99 8853-0, www.intel.de
Managing Directors: Sean Fennelly, Jeffrey Schneiderman, Tiffany Doon Silva
Chairperson of the Supervisory Board: Nicole Lau
Registered Office: Munich
Commercial Register: Amtsgericht Muenchen HRB 186928

