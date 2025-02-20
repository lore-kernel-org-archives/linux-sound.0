Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E201F0E2D
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 11:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740050078; cv=none; b=RaSOiCSeLQgB/LiBcD74zEuoHeHKFbMrf3I6xvU94OtHco826zxElCwKn9gbPbLH+jCO8cU/NGcIKCgasNC+uprqkUt5kBx9mYpzVP6qlu5rFy6mxbm3kYQ/t7nwW6ONcN8nqFuU9LBYYKcgNr4UVwvunobjXmhxUfjQ2vRslJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740050078; c=relaxed/simple;
	bh=wG4RVmzgwUU3nqVokEQE8TaNS9iDW6tFc/8ipi7/Sgo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rpA6RGOUTTvhrVfddNp8iqB0d1i+ZpKT6jy3B2iq9k9CFLa+BqDAHWuzwonXo+MdZe8JazNcYz/rKyLJGWUOLinpbfGGQ/f8wD009fossHwfvg7V2gzisgdmotJZK7OR1VsGlGFtr0DkFs7u0ayFbmWL+QVqmivkoPKcMt+XS80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OEskjUWa; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OEskjUWa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740050077; x=1771586077;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wG4RVmzgwUU3nqVokEQE8TaNS9iDW6tFc/8ipi7/Sgo=;
  b=OEskjUWaEzILyqtp8pPWT3E3zzQPmH61sERr+dD3aUZZmxd85mIObDvi
   g9Rj1rn73B0NAdNJx11xKj9XMbM1GaA68h/rnY7A+g9mwTqYkg55Maiox
   fZ9J9ob01Jhxxl+6Z/L9VubduBuWKhESaGNKH9ntbN4rKAy6p7G0oCn/L
   ViRo0fQIKkqWqgLP6K2Nfce6Zt4/t9c2uZVsoIiLKMtMw0DNsb6bR1C4O
   pubVtpswoyKISVstZD+l7k1AHEiV/MJHqZdHiKRpjItUDQSyTlslGcmKL
   Sr7E1r4bcPwR4QB/oDum7LgeXEBanejNCiF9viEY67lJMm6YT69DnLnB7
   w==;
X-CSE-ConnectionGUID: F0ZwLv3ATyGIvxTQ4qr1Og==
X-CSE-MsgGUID: hplGqsbRRbiY7UBCF2y82g==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51808249"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="51808249"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 03:14:37 -0800
X-CSE-ConnectionGUID: NTX2CZfzTWi0JTNbTBI54w==
X-CSE-MsgGUID: GpEVt6B/SuSSAOY5xxQIPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114865337"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa010.jf.intel.com with ESMTP; 20 Feb 2025 03:14:34 -0800
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
Subject: [PATCH 10/24] ASoC: codecs: rt5640: Fix definition of device_id tables
Date: Thu, 20 Feb 2025 12:26:29 +0100
Message-Id: <20250220112643.3813295-11-cezary.rojewski@intel.com>
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
 sound/soc/codecs/rt5640.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index 82db9dceddb6..d41c9df353d2 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2963,19 +2963,19 @@ MODULE_DEVICE_TABLE(i2c, rt5640_i2c_id);
 static const struct of_device_id rt5640_of_match[] = {
 	{ .compatible = "realtek,rt5639", },
 	{ .compatible = "realtek,rt5640", },
-	{},
+	{}
 };
 MODULE_DEVICE_TABLE(of, rt5640_of_match);
 #endif
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt5640_acpi_match[] = {
-	{ "INT33CA", 0 },
-	{ "10EC3276", 0 },
-	{ "10EC5640", 0 },
-	{ "10EC5642", 0 },
-	{ "INTCCFFD", 0 },
-	{ },
+	{ "INT33CA" },
+	{ "10EC3276" },
+	{ "10EC5640" },
+	{ "10EC5642" },
+	{ "INTCCFFD" },
+	{}
 };
 MODULE_DEVICE_TABLE(acpi, rt5640_acpi_match);
 #endif
-- 
2.25.1

