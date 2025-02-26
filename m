Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82DC2144BA
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 11:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740568233; cv=none; b=P312k/qp7irWn1Jl9hidh0q6YuFruyNbVZSmOy/uxnZik2pB7GMQw7tIFloS6wDRHvLjqbkaQt1wg4c8x6mvbuulx8Bjf882Qeo95Oj61urzFK2mKmGgMSCKc4FlgKfDiWvXZtilUSbQu/TFrpn4W/cGf9IH3ZjXPqwyCZOY0GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740568233; c=relaxed/simple;
	bh=coeSEA45v4Iglv5Fp3o+w19+YTQgRfONKAKkW5Gt9yA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rjSWw5eYIukMCwgKaR+46EDN8k0v80y7sHnX7H1GtZjX0jbspqSWHbCf3T7ofWsyJcawXEEzaalzc61lK7RBU3q/Mg+Ec4TauPmujM79r9GUN+Yy+bxbWP5fUsLy9FEe6JlLJZvCfuxoI33cUZm1n8e12nEq+mD4ug9YW3TPEMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P2oiQ7b8; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P2oiQ7b8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740568232; x=1772104232;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=coeSEA45v4Iglv5Fp3o+w19+YTQgRfONKAKkW5Gt9yA=;
  b=P2oiQ7b8u4nFrCM0L9Pn2dN3TucJ6mtNHn4lUgUsEvVMamZBGOLqyqbn
   Y25tQIKPLz1B2DwnzkyrDKRKOGKkWMnH44C3wlmEChYJWMCuj+boFjABB
   MLtji5yG3yI13UkP6Lailr1Brc/duRJx0P/JHLwQAGt9c7Vx9t8tSeRHn
   b28I26SSq2apG8WfnRzJTPxPHK/GjNALap55NJ1UAT0gqPoq5b6YU+Dpp
   pQI2sYSRlQ3ecpyHAGCukOC7V5eAPmx8d/bDKx/3UMHWz0raCuQV8l14H
   4j+cjytVWYkv0JKXTvjUMJvl7JTImk39FLq5sDZJ2kJR5od98JFxJBoSM
   Q==;
X-CSE-ConnectionGUID: eA2zkrh/Ri2CovhhgxkMsw==
X-CSE-MsgGUID: lWf9e0Y3SxupMSOFhu32NQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41111136"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="41111136"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 03:10:32 -0800
X-CSE-ConnectionGUID: n5FWmiKaSmuvGWgws1FbGA==
X-CSE-MsgGUID: ILIBTtQESH2n6M4Dm9Xcyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="116685135"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa006.jf.intel.com with ESMTP; 26 Feb 2025 03:10:30 -0800
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
Subject: [PATCH v2 14/22] ASoC: codecs: rt5660: Fix definition of device_id tables
Date: Wed, 26 Feb 2025 12:26:04 +0100
Message-Id: <20250226112612.166989-15-cezary.rojewski@intel.com>
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

While at it, sort the IDs alphabetically.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/rt5660.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt5660.c b/sound/soc/codecs/rt5660.c
index 3ac41d2c279b..7e8ac735b82c 100644
--- a/sound/soc/codecs/rt5660.c
+++ b/sound/soc/codecs/rt5660.c
@@ -1232,16 +1232,16 @@ MODULE_DEVICE_TABLE(i2c, rt5660_i2c_id);
 #ifdef CONFIG_OF
 static const struct of_device_id rt5660_of_match[] = {
 	{ .compatible = "realtek,rt5660", },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, rt5660_of_match);
 #endif
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt5660_acpi_match[] = {
-	{ "10EC5660", 0 },
-	{ "10EC3277", 0 },
-	{ },
+	{ "10EC3277" },
+	{ "10EC5660" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, rt5660_acpi_match);
 #endif
-- 
2.25.1

