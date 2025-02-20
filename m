Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9541F4634
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 11:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740050112; cv=none; b=mlgV4OzDMQfsE6rVD9zVtL238pnDg3uJ6PLCvkbW4Juo6vMxcwC/kIJOt0SXOSXOPgCRuz7o7UpzajxKettC/aBdb7JcjwTJve2xfS/2ZQsjnMGqu2ZmpuOQkuOHINIJMrqzG7xSOu8+GVUdi/BMTgRn16FMaW8CtNcyPIBzVlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740050112; c=relaxed/simple;
	bh=Eq4CqaiTWbZFE0piZkwfzvY33uZxTMvvcIePmzFhl34=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c7ddem5rNnwoy4haonvVydY16r36zDqB+5soaCOuLZXJXucgOAs43fyiTVcCtJEs4z022qzdzPNLYTNYkMOto1U12IyCABSrCNfYhYO72S5HtFJJXnSJU9nPJzI4F2HVMnry05LRUEL2/Nnul9F7qqSFPFJ12LTsGcpIqs2xTTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BFrPEVAt; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BFrPEVAt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740050111; x=1771586111;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Eq4CqaiTWbZFE0piZkwfzvY33uZxTMvvcIePmzFhl34=;
  b=BFrPEVAtxIBARtvACaewP+1tKk9yEilZdw6hHX582SZBMZJabaVvA159
   6FKZ4jbAeDZQw/Z64wCpDeGj/A0WllmszD9lEqJP60yKH+EPizizfhlIu
   LteXtWkbHbHNPXLZFLvZdb3zauTeoSMzwZvyx52e2q789ypAf1OprwSEr
   RAx2xD+DvI4hJZr9Vig/crn9k2DX12J7qOgqGe3NeJ3xeTHcpi2qH5TNn
   02NeEg1dS5n1nC9bcI132rWNjuAGHxEfeZn50Sww4ZTlLJhwXfAuyLi0z
   V4Z06XAgMv13Jaj8de6AurbupUNTIrLdGYPFKPIAU6WV3Yp+XNMHqkojp
   Q==;
X-CSE-ConnectionGUID: tD676jSXQW+TRTAOmSjghg==
X-CSE-MsgGUID: dGPw1WCtS2G00QJxf/7YXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51808397"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="51808397"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 03:15:11 -0800
X-CSE-ConnectionGUID: WKtwv/LeTVyy6YKQHZgK6Q==
X-CSE-MsgGUID: x3jU1gO5SLScHLFdIfYT8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114865534"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa010.jf.intel.com with ESMTP; 20 Feb 2025 03:15:08 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	oder_chiou@realtek.com,
	flove@realtek.com,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 24/24] ASoC: codecs: rt5682s: Update definition of device_id tables
Date: Thu, 20 Feb 2025 12:26:43 +0100
Message-Id: <20250220112643.3813295-25-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250220112643.3813295-1-cezary.rojewski@intel.com>
References: <20250220112643.3813295-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Follow PCI-based format (10ECxxxx) for ACPI IDs by adding relevant
entries to the existing table.

While at it, there shall be no comma after the terminator entry and
initializing fields with 0 for statically defined structs is redundant.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/rt5682s.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index ce2e88e066f3..5ad0cc3fab7f 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -3310,13 +3310,14 @@ static void rt5682s_i2c_remove(struct i2c_client *client)
 
 static const struct of_device_id rt5682s_of_match[] = {
 	{.compatible = "realtek,rt5682s"},
-	{},
+	{}
 };
 MODULE_DEVICE_TABLE(of, rt5682s_of_match);
 
 static const struct acpi_device_id rt5682s_acpi_match[] = {
-	{"RTL5682", 0,},
-	{},
+	{ "RTL5682" },
+	{ "10EC5682" },
+	{}
 };
 MODULE_DEVICE_TABLE(acpi, rt5682s_acpi_match);
 
-- 
2.25.1

