Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877031F1314
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 11:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740050100; cv=none; b=aseVq39JX6xN+Z5oHbB+IreA1mtCIsLy7EL68Ww2/gUq28QZ61mzdjirvfJFl1qdq8MC0pw07VuNpP40x7MyGcQzDCfHMitrSnOfIj7svZEWtUfabFxWpx4SSAc/EncIsK0EagbB/cPygpZhxct1OtYJX/UXY2Wd5elFzI1OirQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740050100; c=relaxed/simple;
	bh=hkLEWsOI+juIuwPL8YKYapKW4jGuA9OTrJK00Rjef1g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uBQ4MWRQAxhNSakN7UaX4VnWAGL3LYWMz30+pPQDPZFZRRlfaZtTCgrBGWEifr1tbcLAzVPNudCZ+JCpVJfLjJVstHd6GrEoMoQHlwqCCVkpYxx/myzhnajKl3U85PlBbMUC6q0NFmQCV3dixQdARtQSwR9oJptaVi7S6TWTFXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XRu0WVRq; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XRu0WVRq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740050098; x=1771586098;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hkLEWsOI+juIuwPL8YKYapKW4jGuA9OTrJK00Rjef1g=;
  b=XRu0WVRqcYQmEjChEVpK4Oct7g4YlhYCSrSb3+yKGKE1oZJR+k0gNDsi
   NnZDvKIilavqw2SC7ljAmCdQUkksMCIEfaVWUuMVPeHUaF8D0rlQ7WyRo
   agpUe8cm4xyN1+h7bQGlfW1f5Ucx/C0DVCiQuFWj89Adhtl4GTCbFwuzt
   mRr1P3vM1P31YHh14CAlmDen0n6yoz6KgXc2NH/+K9i7r3oveeB6cy8gD
   o/1MmKEftDONwyeFZmyiuQrVHekNc+1T7TBp/Ct3NlK54y4HClZlG9kdX
   9W79K4W1JvIHm6e4KlcLQw8uIC5H6r4KQDNO4kW82xkFBdHDFvqedAc5I
   A==;
X-CSE-ConnectionGUID: NO3TsLvmTlGvzPGLK7HeRA==
X-CSE-MsgGUID: 9bcugXFcRrG0nuCy9MD45Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51808338"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="51808338"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 03:14:58 -0800
X-CSE-ConnectionGUID: l9kfmnuXRBaKlushQrM3Hw==
X-CSE-MsgGUID: 3ZQzWHWSS2ObWdEP2kHuZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114865425"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa010.jf.intel.com with ESMTP; 20 Feb 2025 03:14:56 -0800
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
Subject: [PATCH 19/24] ASoC: codecs: rt5682: Fix definition of device_id tables
Date: Thu, 20 Feb 2025 12:26:38 +0100
Message-Id: <20250220112643.3813295-20-cezary.rojewski@intel.com>
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
 sound/soc/codecs/rt5682-i2c.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt5682-i2c.c b/sound/soc/codecs/rt5682-i2c.c
index a8820435d1e0..fa950811b3a7 100644
--- a/sound/soc/codecs/rt5682-i2c.c
+++ b/sound/soc/codecs/rt5682-i2c.c
@@ -313,13 +313,13 @@ static void rt5682_i2c_remove(struct i2c_client *client)
 
 static const struct of_device_id rt5682_of_match[] = {
 	{.compatible = "realtek,rt5682i"},
-	{},
+	{}
 };
 MODULE_DEVICE_TABLE(of, rt5682_of_match);
 
 static const struct acpi_device_id rt5682_acpi_match[] = {
-	{"10EC5682", 0,},
-	{},
+	{ "10EC5682" },
+	{}
 };
 MODULE_DEVICE_TABLE(acpi, rt5682_acpi_match);
 
-- 
2.25.1

