Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5F91A3169
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 11:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740568206; cv=none; b=jv8Z02lFwzUNSl+INL2YokEg5pS5gYLK32HPYtc2/bKUj9SBrSXUvzWMyzZiUyC+E+SXjHK2FqUOf/vGHPx+b8KufXDIOlhpL05HfD1gWNz4NQDZBb24msazkUZGZhZRGuAhGpSfl3dvapUohk4/1rX3oOq+1cOflscCIR/KM7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740568206; c=relaxed/simple;
	bh=xMxEYV+1xKyP8TinHlk7Wnsb6IEyvgWmHsCGplK0cPY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SvxQmlx2+XHvsLNDR8ulo5QPRzn9NRYnniVQkWV76zww909gQi42UE3KqW3NiAcgaSyJuZj4cbeDLNhpGOqFPUciWbVcB4rFagUD/LGbsQzdhALGe8d2KOlEcnXWDrCSCYEViOzZ2OnBYSci9GvbVGJ2YOrxZfyS8fqVuLescuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Axl6V/04; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Axl6V/04"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740568206; x=1772104206;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xMxEYV+1xKyP8TinHlk7Wnsb6IEyvgWmHsCGplK0cPY=;
  b=Axl6V/046zTmlje24rnHBNqfl3IYTEs7kqA+GhENypr+N19elARFyi2W
   x9I+BuTC/atN8Xtup7y3rHcK1gIvG0uGqAkzxOvZeHovY0G3cwiQoSdeR
   rUYXZEQjcMO/38l2M/sgtmfNqULDlNswMvE1txDAYlKDoIZNOsOrNK7tG
   UIAiwLFKlKwDOPFLk7vAPh64TTiF24ZRH+U9fUBIwEu978HcI+3AWaT8W
   vFQ2R8gEXiE3tlsYw5O3YaREj3PHOWhThdinxwZwUpc5dTww1U9669A6A
   Gmsc9Wu/r6VyheFgzF29RnJZ9UtaIMotKJFtGkLrUksBVMmi3C9rLyAAU
   A==;
X-CSE-ConnectionGUID: eCHtHqC0Qv6X3Y79sZYdjQ==
X-CSE-MsgGUID: 0Q37kIm/Q9CfmRmhiZk0BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41111058"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="41111058"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 03:10:06 -0800
X-CSE-ConnectionGUID: E0k22usSS7eYEjZT+6sA/w==
X-CSE-MsgGUID: oDCFGmg8QMaNfhbuXvmZdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="116685007"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa006.jf.intel.com with ESMTP; 26 Feb 2025 03:10:03 -0800
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
Subject: [PATCH v2 04/22] ASoC: codecs: rt1019: Fix definition of device_id tables
Date: Wed, 26 Feb 2025 12:25:54 +0100
Message-Id: <20250226112612.166989-5-cezary.rojewski@intel.com>
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
 sound/soc/codecs/rt1019.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt1019.c b/sound/soc/codecs/rt1019.c
index d989d06a2614..86539c6f6cc1 100644
--- a/sound/soc/codecs/rt1019.c
+++ b/sound/soc/codecs/rt1019.c
@@ -547,14 +547,14 @@ MODULE_DEVICE_TABLE(i2c, rt1019_i2c_id);
 
 static const struct of_device_id rt1019_of_match[] __maybe_unused = {
 	{ .compatible = "realtek,rt1019", },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, rt1019_of_match);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt1019_acpi_match[] = {
-	{ "10EC1019", 0},
-	{ },
+	{ "10EC1019" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, rt1019_acpi_match);
 #endif
-- 
2.25.1

