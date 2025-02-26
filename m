Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5C72135BE
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 11:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740568230; cv=none; b=ei5lhlKT9jIRLIj9OcZDiDkTBGYHzoL0ZtmrZirCa4uE4OCHdhjWO6no3P6Kh/QobSAbZVUja/PtOMrjkeCsu+rwvKag6FVWw8jaf9Yu7pD0AOALUl3AI8d5zSml9LY8HWP6SESEOBx8cz/l3NNaumGuaxczTZLyre8zjC22s6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740568230; c=relaxed/simple;
	bh=bldHETguPZ0YwXC2j8yCFuIG8F7Q6IcnAcAMD/TmogY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J//KQXDlKuzMwNOj//FEhKE+b8jT4tFgykwLRTiZ4hm104ovMPPtYN0EGW9OhUPdDe+CHqxMXTo2g0FWgUyMAE6R4rcTNAWlQZzllbQKPXEAqkk7R1Sr5cnoZg1tLOpla58gucyiAt7flSXR93zZTP2+cv7/McqhMuhVwrgeGlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RjiWs8SD; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RjiWs8SD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740568230; x=1772104230;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bldHETguPZ0YwXC2j8yCFuIG8F7Q6IcnAcAMD/TmogY=;
  b=RjiWs8SDEYkHQvmTlPzNeaZEcJfxwFVNRH4OwEcdOd7qiZtWMYmitjJ9
   Hw+ZlPs8QjgWmw1QlKW991viLvPoXFxxmsHhq2hY3J2rZJEdpczvDOWLs
   wmXQb6faBv5oB1VjiyHBMjY110TbSHe9bNQjoTwk6O9LNhY+2RkrQs8Ul
   GCra4JNZJDh38Wk+KiIr431b5LhYowKpV8jUvf/q+/nHbzzGsA91PmRAz
   5gI6nPJ3hEBJMp2/dlOEdZyspFEUhr1AHr+0N7XvIF4AeQLQOe2Ca32YP
   +rxtD3sU3FbvLTcs07SYBIILWV5a1ADGejqTI+/QVO/cUK0BWKFQRrcNa
   Q==;
X-CSE-ConnectionGUID: Lg9jzr+NSiqCZ3JRGsi+8A==
X-CSE-MsgGUID: W52YgG8YRJa7Rj50FdsuRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41111130"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="41111130"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 03:10:29 -0800
X-CSE-ConnectionGUID: QisIqqfQS7WOYPs4rIrybA==
X-CSE-MsgGUID: IEdfK60KQTG530wKBWNZ/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="116685130"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa006.jf.intel.com with ESMTP; 26 Feb 2025 03:10:27 -0800
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
Subject: [PATCH v2 13/22] ASoC: codecs: rt5659: Fix definition of device_id tables
Date: Wed, 26 Feb 2025 12:26:03 +0100
Message-Id: <20250226112612.166989-14-cezary.rojewski@intel.com>
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
 sound/soc/codecs/rt5659.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
index a2652fa6e1d7..e5e8ccc604eb 100644
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
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, rt5659_acpi_match);
 #endif
-- 
2.25.1

