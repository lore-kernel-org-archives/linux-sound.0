Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D216D1F8908
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 11:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740568241; cv=none; b=Jd/M+sxtzImQzwMl+9gOx2b0Oze7bfqPdimLBv1LeBkuVaKgQzDLSWnKd0sHKpmK9lHjuPatQvOn8qrSmgzR4kdgEOz/HpQTncyojnuo5WlVf+YUCwUG+AsXXngwKX3pL0E6QmQVcxUH3vcbQzGORxc/DMsWPvg4/MGALxGQiYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740568241; c=relaxed/simple;
	bh=fZzwvdjB4mKYF5RYTnOKmrqUw1piUhSRj+flEro9Uao=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HB0Razz+VORA6gqxty8PSg7mE8ZAEPgHJbCzRfUOZRovVVW7DLCjcQJKdDI9o5rhLsJ+A+F7W1BId5XN684kbEE2zGD0YdFa63gxDb34o2RN6cxOT7QN4pEiwIfsYFxvL+b5Yw5LIU6JlhACgpn2pXiglml3jS2n5gFFN+UhnTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B0RRLNM8; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B0RRLNM8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740568240; x=1772104240;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fZzwvdjB4mKYF5RYTnOKmrqUw1piUhSRj+flEro9Uao=;
  b=B0RRLNM8pdZsv0K2G63wBo7CSaP+97WTsNhIETwk8N3lzcQhvspK0LH5
   WyWCDA3uG/0iCwdwZlMUHHqtw+KghObs5xrOeQMfvBb0kKI/yFbUTY4jp
   nhSjF5bF4rT9fJZl4MfGcnAGWYwE/sl7aVW+s1qBh0lrwNVbKICxbXhiG
   ZLOcuRMgSOFC/jKtv50bMJzxrP8smbcU2OaqiGCXAvGKg+o/zryGbfeyB
   2S/3JmR75CVEqQ2yfg1vMdPk4mb6kMMjwCHtBQRRchi9sqSqcz8oc7jOA
   SoZCXU/BHni3wtd4MPUm6+zCgIDKRQae38KOPoqgwXq304gUqVGrmMBbs
   g==;
X-CSE-ConnectionGUID: PIxKwoE5R4+k3cwrbxH3tw==
X-CSE-MsgGUID: htpDNUgFRVSigm+zYe3d4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41111175"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="41111175"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 03:10:40 -0800
X-CSE-ConnectionGUID: KZFwIu2MRl+F5W2UUxM4Sw==
X-CSE-MsgGUID: wXiEGjwkRNiBzWt1EN7rbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="116685171"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa006.jf.intel.com with ESMTP; 26 Feb 2025 03:10:37 -0800
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
Subject: [PATCH v2 17/22] ASoC: codecs: rt5668: Fix definition of device_id tables
Date: Wed, 26 Feb 2025 12:26:07 +0100
Message-Id: <20250226112612.166989-18-cezary.rojewski@intel.com>
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
 sound/soc/codecs/rt5668.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index 494ca3ce9b96..51be7b1f900b 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -2598,15 +2598,15 @@ static void rt5668_i2c_shutdown(struct i2c_client *client)
 #ifdef CONFIG_OF
 static const struct of_device_id rt5668_of_match[] = {
 	{.compatible = "realtek,rt5668b"},
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, rt5668_of_match);
 #endif
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt5668_acpi_match[] = {
-	{"10EC5668", 0,},
-	{},
+	{ "10EC5668" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, rt5668_acpi_match);
 #endif
-- 
2.25.1

