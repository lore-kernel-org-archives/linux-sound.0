Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504E81A08A4
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 11:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740568214; cv=none; b=MQ0wEwEq5/PHpoahzBnGoqHnnJINL/rA/o9c6A1eBzSxicN6U0SwOlTP5Jebh/rx9LzoWsZn/GQxQPqJan1JqFjHVlAICO9qaaAHQqME4MnNsI+iTlC4OUCpYuVBZwNYPLW+Qn1C+a6eh3iZ9vBCe9WVgkbpbJJY0MIkXXoG5ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740568214; c=relaxed/simple;
	bh=tGUdA3En3rjSQ1Ti9V7TSM6hTi0Uxg2qJYdS6O4d7EI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tnS6VWj/hJnXKiGSDBiT8qLU7sl9Zx8IubZAr4BVhqQ8JJ00m5+irfpQJliXJHwY85UzG9lS+94Qf9cSBy3m2NhGw+p3c2xT+dNn4zsDs+67FIejWxhind1eX88FwU9CUUmAOhb+232De9Y3iAwII7+uf5s8mWui+gMhLJD7fd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VrxcI7aN; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VrxcI7aN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740568214; x=1772104214;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tGUdA3En3rjSQ1Ti9V7TSM6hTi0Uxg2qJYdS6O4d7EI=;
  b=VrxcI7aNG/UUl1yczJRj5wxiEfNfgucXx05/IZcB5s+YUgcBf8qADPKn
   SpOlFrn9fKhX5QWmTRNG23+yUrhAKx0513XPS4BBnnamIEVTqphWSmZYY
   uAMdj0Luo4NyLXjXqRUzzUCjYeOLcHEGYirUY9WaDyB44Nmi1CrmBw8cS
   CftUbQoFCtS6QwKNCCPcywVRnwDYwPHzAwgaj/SMvOAZ/sOFdk3PbwCtX
   Yh6cr0m8+T2zCeJguK5UHm7j+//qWPpeC85szXCrLEkP7x6OJj3D5qDAK
   v0ryBavCv2P3u0L22N2IGU0UPJ3lJbv5CovRxcLN/pEL1wsy79shQm0TB
   Q==;
X-CSE-ConnectionGUID: etmq8spAR+enq+XvfY6BbA==
X-CSE-MsgGUID: YRrZ4sl0RCuoMRfG2cajrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41111082"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="41111082"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 03:10:14 -0800
X-CSE-ConnectionGUID: 89kr56yvT0WKDDI+NDbxCA==
X-CSE-MsgGUID: aRtB6JVyT3KeiK6SzV5TYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="116685063"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa006.jf.intel.com with ESMTP; 26 Feb 2025 03:10:11 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	flove@realtek.com,
	oder_chiou@realtek.com,
	shumingf@realtek.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 07/22] ASoC: codecs: rt1318: Fix definition of device_id tables
Date: Wed, 26 Feb 2025 12:25:57 +0100
Message-Id: <20250226112612.166989-8-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250226112612.166989-1-cezary.rojewski@intel.com>
References: <20250226112612.166989-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There shall be no comma after the terminator entry and initializing
fields with 0 for statically defined structs is redundant.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/rt1318.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt1318.c b/sound/soc/codecs/rt1318.c
index e12b1e96a53a..ae01b2ce630b 100644
--- a/sound/soc/codecs/rt1318.c
+++ b/sound/soc/codecs/rt1318.c
@@ -1147,14 +1147,14 @@ MODULE_DEVICE_TABLE(i2c, rt1318_i2c_id);
 
 static const struct of_device_id rt1318_of_match[] = {
 	{ .compatible = "realtek,rt1318", },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, rt1318_of_match);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt1318_acpi_match[] = {
-	{ "10EC1318", 0},
-	{ },
+	{ "10EC1318" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, rt1318_acpi_match);
 #endif
-- 
2.25.1

