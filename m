Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8C820E31F
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 11:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740568249; cv=none; b=vEjLWN6x8tz4lN659WaqHli/YX8dowwTRy3tb/aKTQeDr17hfKi+bNA2tzCJclinmLfEhOBnBx0ci6WSpL7+Yb3PTR3bZwysFRMr+i/kR0XFvOiQLNKEGfIm7m50HSxL3W33GIaRNKtjPEoR7EVAoA9yEEPgrF0mRORALB0tEog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740568249; c=relaxed/simple;
	bh=e2akSwKcnQzQk+RsgcyrMigltP8+nDzlylID6dVNLYI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bmBL1qpN4K8S4IXe6HqaF/3cTDHXEKb5+Ne3y9yOt8Nr0hwHI4KHDKxHctgRF29Pk7PoLh+LhH/YkxFHyswCmnEmGIKitDvrnVQApYtLitx3G5ezec10If2uPLbRe/HvqpHPsTycBZp2iz/aBXcDGzx++dKTizQWgIjmy78jrnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JFvmYK6r; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JFvmYK6r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740568248; x=1772104248;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e2akSwKcnQzQk+RsgcyrMigltP8+nDzlylID6dVNLYI=;
  b=JFvmYK6rhLg3YiyyRz95JqHskFwMVPZ4Tm09grlXExu+7TmyxlAoNy5T
   c6iOXtlWu6ylL1eepM+ZPHzdaTR1hjHJDv/gq/HFphleC0AyjtaZM8o+J
   fM/jgfcRx9yFOrot7Op6i9+Vu5gFLHQBnp0kAWp61uwdfHOMi5RdJ/47j
   wOx06oxqHPup1EbT853uCpI7DZkSs8+fm6u0rd66AuEksCuHl3PAKZkX9
   KXYAURmkpm43T0XAWo2Z11n3DDG1+UtdNh5ic0giZInxxY2VjoBJ3h9B3
   x2cZ5hkHoNPtE6BNyqwn36DusIEuQBJ6u2T6RYCOs8rwPcUlgv4pHPoqs
   g==;
X-CSE-ConnectionGUID: auNWczbrTKa2QHPiPjEW1A==
X-CSE-MsgGUID: wf/Psu6TRwCmZokpaxXfiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41111227"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="41111227"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 03:10:48 -0800
X-CSE-ConnectionGUID: 1m82FCXMQHyU2HqHoUPa3g==
X-CSE-MsgGUID: 0cpsoF+BT0iDmwCPxfdIcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="116685212"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa006.jf.intel.com with ESMTP; 26 Feb 2025 03:10:45 -0800
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
Subject: [PATCH v2 20/22] ASoC: codecs: rt286: Update definition of device_id tables
Date: Wed, 26 Feb 2025 12:26:10 +0100
Message-Id: <20250226112612.166989-21-cezary.rojewski@intel.com>
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

Follow PCI-based format (10ECxxxx) for ACPI IDs by adding relevant
entries to the existing table.

While at it, there shall be no comma after the terminator entry and
initializing fields with 0 for statically defined structs is redundant.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/rt286.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt286.c b/sound/soc/codecs/rt286.c
index d0f533120c33..5ad1b9311d11 100644
--- a/sound/soc/codecs/rt286.c
+++ b/sound/soc/codecs/rt286.c
@@ -1083,8 +1083,9 @@ MODULE_DEVICE_TABLE(i2c, rt286_i2c_id);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt286_acpi_match[] = {
-	{ "INT343A", 0 },
-	{},
+	{ "10EC0286" },
+	{ "INT343A" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, rt286_acpi_match);
 #endif
-- 
2.25.1

