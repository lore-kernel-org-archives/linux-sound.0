Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD3A1F0E2D
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 11:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740050085; cv=none; b=EvxzANjgwfFFtOQyZ1UBh5E2fTIuj0WyYAg7WN9PSkuJT7hZtpWES1H3JBNEhyurSW14MXTbh0sTcHyXZd1wqeFzbw7GGaHzrGlE4HHQEu2uVDt6EzcaTMbEmZyNvVxTZhYTlIrUssgZyGmf3AwguvriAqog5RW5dNmd6Ai3eq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740050085; c=relaxed/simple;
	bh=+jS1jTMF6DZbZYivvOgteWsi/c1rwgo9K4n8AknT+bw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gJcW4OOg/Kgmv0ESY6SMg3iZO/EL6sqNqYXpYedOMsEYjgIzqwGOBjrz5HlupZJyG/dpDF+c96g4vcLM9IcSBG/73aqha/7ZK+YvCvQ3+EaTm/qbxZsyMn09u+5tP6yuM1Mfspp21Q3qzd/mztLy+ZkyVfSKGlQWGSK3Df/yLec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZtT+jUv3; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZtT+jUv3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740050084; x=1771586084;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+jS1jTMF6DZbZYivvOgteWsi/c1rwgo9K4n8AknT+bw=;
  b=ZtT+jUv3kxlgzQDQWHA5nWwKa0REe5iPCgxqBRUC69JMD2e8UZNHHbRp
   8MfxGf7ljl5btr9m0hbUU7RpCQf1jT9y7TRNf9TfQmnmAVvvqomdyP3zb
   PoIQOV7rrRXYKm217QR+xsPZlHHM0Y7FpaaB6Cf18JDNmKuNcOJvltvpA
   hw6dECDnkydqJUpu3RwobXn6nvLXIZ23c9vyDvWBmb2IN8NPMPy9Inu8z
   EuMKiwolCLwiiT+MbTtObjYS8YdBGArVGvHkmGcK11umKwqwObH7di8d3
   8ey1BjFdktBs0zJZ2afpohI7WVy88eqoLx5lY/toG7DEB5IszFEOPY6ah
   w==;
X-CSE-ConnectionGUID: 2L9yDxKXSvG5yctJm6IhYg==
X-CSE-MsgGUID: 9WdstxlvT4+amFL+eVVVkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51808278"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="51808278"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 03:14:44 -0800
X-CSE-ConnectionGUID: lqfEbzQpTCWjB5aQHut9bw==
X-CSE-MsgGUID: vXfYrmFPQpGaVa/HEHkZ+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114865382"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa010.jf.intel.com with ESMTP; 20 Feb 2025 03:14:42 -0800
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
Subject: [PATCH 13/24] ASoC: codecs: rt5659: Fix definition of device_id tables
Date: Thu, 20 Feb 2025 12:26:32 +0100
Message-Id: <20250220112643.3813295-14-cezary.rojewski@intel.com>
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

There shall be no comma after the terminator entry and initializing
fields with 0 for statically defined structs is redundant.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/rt5659.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
index a2652fa6e1d7..29f521716389 100644
--- a/sound/soc/codecs/rt5659.c
+++ b/sound/soc/codecs/rt5659.c
@@ -4315,16 +4315,16 @@ static void rt5659_i2c_shutdown(struct i2c_client *client)
 static const struct of_device_id rt5659_of_match[] = {
 	{ .compatible = "realtek,rt5658", },
 	{ .compatible = "realtek,rt5659", },
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, rt5659_of_match);
 #endif
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt5659_acpi_match[] = {
-	{ "10EC5658", 0, },
-	{ "10EC5659", 0, },
-	{ },
+	{ "10EC5658" },
+	{ "10EC5659" },
+	{}
 };
 MODULE_DEVICE_TABLE(acpi, rt5659_acpi_match);
 #endif
-- 
2.25.1

