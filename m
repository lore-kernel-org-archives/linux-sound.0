Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7101F3D52
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 11:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740050104; cv=none; b=BYh7uSyqi7Ivj/juEN/JI2vuK5fcJ3n4ZZabXZ0ujBWAdsccw8ynT+dsltqt8fpNQgfRWoiTP13NiDzxLioyRWZvxDYCKfjbjNtemX9wbzyr7EuY2RhzxD0/OPhT2SR3lrmt0wONQScVjLIGEQ/+rI9ECASR6G/Od0rAg4oa5kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740050104; c=relaxed/simple;
	bh=fyYPoH2ehSb+RHLvEDTlYOw4PacTk3Zr58lLrzIUGes=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iNOBkXWQ1lf0NeuyNMTWug8t2Nacl1QKKOUzMjhlpEr3i8mRNJ0CC5IacdzUWWcpidpoQycnLtjTybt0gdgy3+nZ1DnJsQsH418Q0KSpZoRx6gPOREPuIaBa12Z3XJvfO8Qpwux5X/5eJv4T8Cu5sH5sLUnw2Rb8O5ermu3Xs7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RySrQJQb; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RySrQJQb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740050103; x=1771586103;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fyYPoH2ehSb+RHLvEDTlYOw4PacTk3Zr58lLrzIUGes=;
  b=RySrQJQbK+MGqYv9aZRPizpXRcvMUqjhByZhks/OfFGzKRl4Nzf6+WUY
   kkLG82ObNJp+EOr5kFE5/siSYFP0gYoc5/ioTJaV0dNmI5kk9ilNO5ZJd
   gNcIQsT3xgEQpRnZeqJSWEn6lVFPtO/rE10xfvZbn+dNue1EizE2Ow9zL
   JOigrxHcYXiNU97VrqRrFHUe1e9TM9oi04eyi6/Egn1fpQ+2HX7UeUE6V
   q7PQEsIT/MUETgLPNS6BNLmmonz/Ksz52jeYpnBMXcQS19cG6vTGSGgVl
   zJp/ZqOKpukVHYB+Zn44Zr+mnqw+aZ97tp6JWMn9O9JVWYer8lxwFL9vh
   Q==;
X-CSE-ConnectionGUID: xYf3X7mmQI2boJ3dI1lfYQ==
X-CSE-MsgGUID: 3PyUVghkTD2Wvu3DGtE7RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51808355"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="51808355"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 03:15:03 -0800
X-CSE-ConnectionGUID: VOY2UMK8SSmhBjiGqaUWLA==
X-CSE-MsgGUID: ZHdISApVQaGtsBxPq3mfgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114865448"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa010.jf.intel.com with ESMTP; 20 Feb 2025 03:15:01 -0800
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
Subject: [PATCH 21/24] ASoC: codecs: rt286: Update definition of device_id tables
Date: Thu, 20 Feb 2025 12:26:40 +0100
Message-Id: <20250220112643.3813295-22-cezary.rojewski@intel.com>
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
 sound/soc/codecs/rt286.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt286.c b/sound/soc/codecs/rt286.c
index d0f533120c33..c187e580c0ca 100644
--- a/sound/soc/codecs/rt286.c
+++ b/sound/soc/codecs/rt286.c
@@ -1083,8 +1083,9 @@ MODULE_DEVICE_TABLE(i2c, rt286_i2c_id);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt286_acpi_match[] = {
-	{ "INT343A", 0 },
-	{},
+	{ "10EC0286" },
+	{ "INT343A" },
+	{}
 };
 MODULE_DEVICE_TABLE(acpi, rt286_acpi_match);
 #endif
-- 
2.25.1

